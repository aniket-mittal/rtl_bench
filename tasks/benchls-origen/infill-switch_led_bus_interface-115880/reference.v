module origen_115880 (
    input wire clk,
    input wire reset,
    input wire pRead,
    input wire pWrite,
    input wire [1:0] addr,
    input wire [31:0] pWriteData,
    output reg [31:0] pReadData,
    input wire buttonL,
    input wire buttonR,
    input wire [15:0] switch,
    output reg [11:0] led
);

    reg [1:0] status;
    reg [15:0] switch1;
    reg [11:0] led1;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            status <= 2'b00;
            switch1 <= 16'h0000;
            led1 <= 12'h000;
            led <= 12'h000;
            pReadData <= 32'h00000000;
        end else begin
            // Button handling
            if (buttonR) begin
                status[1] <= 1'b1;
                switch1 <= switch;
            end
            if (buttonL) begin
                status[0] <= 1'b1;
                led <= led1;
            end

            // Processor write operation
            if (pWrite && addr == 2'b01) begin
                led1 <= pWriteData[11:0];
                status[0] <= 1'b0;
            end

            // Processor read operation
            if (pRead) begin
                case (addr)
                    2'b11: pReadData <= {16'h0000, switch1[15:8]};
                    2'b10: pReadData <= {24'h000000, switch1[7:0]};
                    2'b00: pReadData <= {30'h00000000, status};
                    default: pReadData <= 32'h00000000;
                endcase
            end
        end
    end

endmodule