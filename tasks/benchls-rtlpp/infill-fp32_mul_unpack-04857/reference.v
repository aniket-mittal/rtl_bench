module rtlpp_04857 (
    clk,
    rst,
    opa_i,
    opb_i,
    exp_10_o,
    fracta_24_o,
    fractb_24_o
    );

    parameter FP_WIDTH = 32;
    parameter MUL_SERIAL = 0; 
    parameter MUL_COUNT = 11; 
    parameter FRAC_WIDTH = 23;
    parameter EXP_WIDTH = 8;
    parameter ZERO_VECTOR = 31'd0;
    parameter INF = 31'b1111111100000000000000000000000;
    parameter QNAN = 31'b1111111110000000000000000000000;
    parameter SNAN = 31'b1111111100000000000000000000001;

    input clk;
    input rst;
    input [FP_WIDTH-1:0] opa_i;
    input [FP_WIDTH-1:0] opb_i;
    output reg [EXP_WIDTH+1:0] exp_10_o;
    output [FRAC_WIDTH:0] fracta_24_o;
    output [FRAC_WIDTH:0] fractb_24_o; 

    wire [EXP_WIDTH-1:0] s_expa;
    wire [EXP_WIDTH-1:0] s_expb;
    wire [FRAC_WIDTH-1:0] s_fracta;
    wire [FRAC_WIDTH-1:0] s_fractb;
    wire [EXP_WIDTH+1:0] s_exp_10_o;
    wire [EXP_WIDTH+1:0] s_expa_in;
    wire [EXP_WIDTH+1:0] s_expb_in;
    wire s_opa_dn, s_opb_dn;

    assign s_expa = opa_i[30:23];
    assign s_expb = opb_i[30:23];
    assign s_fracta = opa_i[22:0];
    assign s_fractb = opb_i[22:0];

    always @(posedge clk or posedge rst)
        if (rst)
            exp_10_o <= 0;
        else
            exp_10_o <= s_exp_10_o;

    assign s_opa_dn = !(|s_expa);
    assign s_opb_dn = !(|s_expb);

    assign fracta_24_o = {!s_opa_dn, s_fracta};
    assign fractb_24_o = {!s_opb_dn, s_fractb};

    assign s_expa_in = {2'd0, s_expa} + {9'd0, s_opa_dn};
    assign s_expb_in = {2'd0, s_expb} + {9'd0, s_opb_dn};

    assign s_exp_10_o = s_expa_in + s_expb_in - 10'b0001111111;

endmodule