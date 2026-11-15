module origen_182673 (
    input clk,
    input memtoreg_in,
    input regwrite_in,
    input [3:0] memwrite_in,
    input [31:0] ALUout_in,
    input [31:0] rv2_in,
    input invalid_in,
    input [31:0] immgen_in,
    input [1:0] regin_in,
    input [31:0] PC_plus4_in,
    input [31:0] idata_in,

    output reg invalid_out,
    output reg [31:0] rv2_out,
    output reg [31:0] ALUout_out,
    output reg [3:0] memwrite_out,
    output reg regwrite_out,
    output reg memtoreg_out,
    output reg [31:0] immgen_out,
    output reg [1:0] regin_out,
    output reg [31:0] PC_plus4_out,
    output reg [31:0] idata_out
);

    initial begin
        invalid_out = 0;
        rv2_out = 0;
        ALUout_out = 0;
        memwrite_out = 0;
        regwrite_out = 0;
        memtoreg_out = 0;
        immgen_out = 0;
        regin_out = 0;
        PC_plus4_out = 0;
        idata_out = 0;
    end

    always @(posedge clk) begin
        invalid_out <= invalid_in;
        rv2_out <= rv2_in;
        ALUout_out <= ALUout_in;
        memwrite_out <= memwrite_in;
        regwrite_out <= regwrite_in;
        memtoreg_out <= memtoreg_in;
        immgen_out <= immgen_in;
        regin_out <= regin_in;
        PC_plus4_out <= PC_plus4_in;
        idata_out <= idata_in;
    end

endmodule