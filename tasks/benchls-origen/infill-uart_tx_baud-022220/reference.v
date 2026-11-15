module origen_022220 (
    input wire clk_input,
    input wire [7:0] data_input,
    input wire data_load,
    input wire [31:0] baudRate,
    output reg tx_pin,
    output reg tx_complete
);

    reg [3:0] caseIndex;
    reg [3:0] bitIndex;
    reg [31:0] baudRateReg;
    reg [9:0] shiftReg;

    always @(negedge clk_input) begin
        case (caseIndex)
            0: begin // Idle state
                tx_pin <= 1'b1;
                tx_complete <= 1'b1;
                if (!data_load) begin
                    caseIndex <= 1;
                end
            end

            1: begin // Load data state
                shiftReg <= {1'b1, data_input, 1'b0};
                bitIndex <= 4'd0;
                baudRateReg <= 32'd0;
                tx_complete <= 1'b0;
                caseIndex <= 2;
            end

            2: begin // Transmit bit state
                tx_pin <= shiftReg[0];
                if (baudRateReg == baudRate) begin
                    baudRateReg <= 32'd0;
                    shiftReg <= {1'b0, shiftReg[9:1]};
                    bitIndex <= bitIndex + 1'b1;
                    caseIndex <= 3;
                end else begin
                    baudRateReg <= baudRateReg + 1'b1;
                end
            end

            3: begin // Check completion state
                if (bitIndex == 4'd10) begin
                    caseIndex <= 0;
                end else begin
                    caseIndex <= 2;
                end
            end

            default: caseIndex <= 0;
        endcase
    end

endmodule