module origen_092184 #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input [width-1:0] in,
    output [width-1:0] out
);
    reg [width-1:0] outReg;
    wire real_clk;

    assign real_clk = clk_posedge ? clk : ~clk;
    assign out = outReg;

    initial begin
        outReg = init;
    end

    always @(posedge real_clk) begin
        outReg <= in;
    end
endmodule

module TestShiftRegister_comb (
    input [1:0] I,
    input [1:0] Register_inst0_O,
    output [1:0] Register_inst0_I,
    output [1:0] Register_inst1_I
);
    assign Register_inst0_I = I;
    assign Register_inst1_I = Register_inst0_O;
endmodule

module Register_comb (
    input [1:0] I,
    output [1:0] O
);
    assign O = I;
endmodule

module Register (
    input CLK,
    input [1:0] I,
    output [1:0] O
);
    wire [1:0] Register_comb_inst0_O;
    wire [1:0] reg_P_inst0_out;
    Register_comb Register_comb_inst0 (
        .I(I),
        .O(Register_comb_inst0_O)
    );
    coreir_reg #(
        .clk_posedge(1'b1),
        .init(2'h0),
        .width(2)
    ) reg_P_inst0 (
        .clk(CLK),
        .in(Register_comb_inst0_O),
        .out(reg_P_inst0_out)
    );
    assign O = reg_P_inst0_out;
endmodule

module Register_unq1 (
    input CLK,
    input [1:0] I,
    output [1:0] O
);
    wire [1:0] Register_comb_inst0_O;
    wire [1:0] reg_P_inst0_out;
    Register_comb Register_comb_inst0 (
        .I(I),
        .O(Register_comb_inst0_O)
    );
    coreir_reg #(
        .clk_posedge(1'b1),
        .init(2'h1),
        .width(2)
    ) reg_P_inst0 (
        .clk(CLK),
        .in(Register_comb_inst0_O),
        .out(reg_P_inst0_out)
    );
    assign O = reg_P_inst0_out;
endmodule

module TestShiftRegister (
    input CLK,
    input [1:0] I,
    output [1:0] O
);
    wire [1:0] Register_inst0_O;
    wire [1:0] Register_inst1_O;
    wire [1:0] TestShiftRegister_comb_inst0_Register_inst0_I;
    wire [1:0] TestShiftRegister_comb_inst0_Register_inst1_I;
    Register Register_inst0 (
        .CLK(CLK),
        .I(TestShiftRegister_comb_inst0_Register_inst0_I),
        .O(Register_inst0_O)
    );
    Register_unq1 Register_inst1 (
        .CLK(CLK),
        .I(TestShiftRegister_comb_inst0_Register_inst1_I),
        .O(Register_inst1_O)
    );
    TestShiftRegister_comb TestShiftRegister_comb_inst0 (
        .I(I),
        .Register_inst0_O(Register_inst0_O),
        .Register_inst0_I(TestShiftRegister_comb_inst0_Register_inst0_I),
        .Register_inst1_I(TestShiftRegister_comb_inst0_Register_inst1_I)
    );
    assign O = Register_inst1_O;
endmodule