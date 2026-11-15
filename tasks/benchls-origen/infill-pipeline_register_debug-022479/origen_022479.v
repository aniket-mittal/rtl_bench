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
    [MASKED]

endmodule