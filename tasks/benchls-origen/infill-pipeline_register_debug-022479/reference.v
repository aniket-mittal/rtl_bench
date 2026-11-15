module origen_022479 (
    input wire clk,
    input wire reset,
    input wire resetDebug,
    input wire enableDebug,
    input wire regWrite_in,
    input wire memToReg_in,
    input wire eop_in,
    input wire [4:0] writeReg_in,
    input wire [31:0] aluOut_in,
    input wire [31:0] readData_in,
    output reg regWrite_out,
    output reg memToReg_out,
    output reg eop_out,
    output reg [4:0] writeReg_out,
    output reg [31:0] aluOut_out,
    output reg [31:0] readData_out
);

    // Initialize all output registers to 0
    initial begin
        regWrite_out = 1'b0;
        memToReg_out = 1'b0;
        eop_out = 1'b0;
        writeReg_out = 5'b0;
        aluOut_out = 32'b0;
        readData_out = 32'b0;
    end

    // Latch inputs to outputs on negative edge of clock
    always @(negedge clk) begin
        if (reset || resetDebug) begin
            // Reset all outputs to 0
            regWrite_out <= 1'b0;
            memToReg_out <= 1'b0;
            eop_out <= 1'b0;
            writeReg_out <= 5'b0;
            aluOut_out <= 32'b0;
            readData_out <= 32'b0;
        end
        else if (enableDebug) begin
            // Latch inputs to outputs
            regWrite_out <= regWrite_in;
            memToReg_out <= memToReg_in;
            eop_out <= eop_in;
            writeReg_out <= writeReg_in;
            aluOut_out <= aluOut_in;
            readData_out <= readData_in;
        end
    end

endmodule