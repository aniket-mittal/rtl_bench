module origen_102048 (
    input wire spiClk,
    input wire [8:0] data,
    input wire dataAvailable,
    output reg tft_sck,
    output reg tft_sdi,
    output reg tft_dc,
    output reg tft_cs,
    output reg idle
);

    reg [2:0] counter;
    reg [7:0] shiftReg;
    reg internalSck;
    reg transmitting;

    always @(posedge spiClk) begin
        if (dataAvailable && !transmitting) begin
            transmitting <= 1'b1;
            counter <= 3'b000;
            shiftReg <= data[7:0];
            tft_dc <= data[8];
            tft_cs <= 1'b0;
            idle <= 1'b0;
        end else if (transmitting) begin
            if (counter == 3'b111) begin
                transmitting <= 1'b0;
                tft_cs <= 1'b1;
                idle <= 1'b1;
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end

    always @(posedge spiClk) begin
        if (transmitting) begin
            internalSck <= ~internalSck;
        end else begin
            internalSck <= 1'b0;
        end
    end

    always @(negedge internalSck) begin
        if (transmitting) begin
            tft_sdi <= shiftReg[7];
            shiftReg <= {shiftReg[6:0], 1'b0};
        end
    end

    always @(*) begin
        tft_sck = internalSck & ~tft_cs;
    end

endmodule