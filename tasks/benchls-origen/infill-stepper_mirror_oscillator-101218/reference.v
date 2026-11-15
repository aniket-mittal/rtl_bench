module origen_101218(
    input clk,
    input reset,
    output [3:0] stepperWires,
    output laserControl
);

    oscillateMirror osc_mirror (
        .clk(clk),
        .reset(reset),
        .stepperWires(stepperWires),
        .laserControl(laserControl)
    );

endmodule

module oscillateMirror(
    input clk,
    input reset,
    output reg [3:0] stepperWires,
    output reg laserControl
);

    reg [17:0] counter;
    reg [31:0] cycleCount;
    reg forward;
    reg [3:0] turns;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 18'd262143;
            cycleCount <= 32'd0;
            forward <= 1'b1;
            turns <= 4'b0001;
            stepperWires <= 4'b0001;
            laserControl <= 1'b0;
        end else begin
            if (counter == 18'd0) begin
                counter <= 18'd262143;
                cycleCount <= cycleCount + 1;
                
                if (cycleCount % 8 == 0) begin
                    forward <= ~forward;
                end
                
                if (forward) begin
                    turns <= {turns[2:0], turns[3]};
                end else begin
                    turns <= {turns[0], turns[3:1]};
                end
                
                stepperWires <= turns;
            end else begin
                counter <= counter - 1;
            end
            
            laserControl <= counter[9];
        end
    end

endmodule

module spiPulseGen(
    input clk,
    output reg spiTrigger,
    output reg spiClk
);

    reg [6:0] counter;

    always @(posedge clk) begin
        counter <= counter + 1;
        spiTrigger <= (counter == 7'd0);
        spiClk <= counter[0];
    end

endmodule

module ADCreader(
    input clk,
    input reset,
    input start,
    input miso,
    output reg mosi,
    output reg CSLow,
    output spiClk,
    output reg [11:0] adcReading,
    output reg dataReady
);

    wire spiTrigger;
    reg [15:0] shiftReg;
    reg [4:0] spiBitCounter;
    reg moduleOn;

    spiPulseGen spiGen(
        .clk(clk),
        .spiTrigger(spiTrigger),
        .spiClk(spiClk)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shiftReg <= 16'h0000;
            spiBitCounter <= 5'd0;
            moduleOn <= 1'b0;
            CSLow <= 1'b1;
            mosi <= 1'b0;
            adcReading <= 12'h000;
            dataReady <= 1'b0;
        end else begin
            if (start && !moduleOn) begin
                moduleOn <= 1'b1;
                CSLow <= 1'b0;
                spiBitCounter <= 5'd0;
                shiftReg <= 16'h0000;
                dataReady <= 1'b0;
            end

            if (moduleOn && spiTrigger) begin
                if (spiBitCounter < 5'd16) begin
                    shiftReg <= {shiftReg[14:0], miso};
                    spiBitCounter <= spiBitCounter + 1;
                end else begin
                    moduleOn <= 1'b0;
                    CSLow <= 1'b1;
                    adcReading <= shiftReg[11:0];
                    dataReady <= 1'b1;
                end
            end

            if (spiClk && moduleOn) begin
                mosi <= shiftReg[15];
            end
        end
    end

endmodule