module rtlpp_02678(
    clk, rst,
    
    addr, en, we, datain, dataout
);

parameter dw = 32;   // Replace with the appropriate value for `OR1200_OPERAND_WIDTH
parameter aw = 9;    // Replace with the appropriate value for `OR1200_ICINDX

input               clk;
input               rst;
input   [aw-1:0]    addr;
input               en;
input   [3:0]       we;
input   [dw-1:0]    datain;
output  [dw-1:0]    dataout;

reg     [dw-1:0]    mem [(1<<aw)-1:0];
reg     [dw-1:0]    dataout_reg;

[MASKED]

assign dataout = dataout_reg;

endmodule