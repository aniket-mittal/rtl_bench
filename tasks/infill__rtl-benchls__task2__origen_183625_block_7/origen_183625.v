module origen_183625(
    input clk,
    input reset,
    input [11:0] polynom,
    input [10:0] datain_a,
    input [10:0] datain_b,
    input enable,
    output [10:0] dataout,
    output valid
);

reg [10:0] dataoutReg;
reg [10:0] datain_aReg;
reg [10:0] datain_bReg;
reg [11:0] polynomReg;
reg validReg;
reg [3:0] counter;

[MASKED]

assign dataout = dataoutReg;
assign valid = validReg;

endmodule