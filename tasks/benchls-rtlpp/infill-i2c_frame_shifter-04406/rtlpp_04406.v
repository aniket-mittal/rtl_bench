module rtlpp_04406(
   clk,
   data,
   out,
   load_data,
   RSTn,
   load_start,
   load_stop,
   load_ack,
   load_nack
);

input         clk;
input  [11:0] data;
output        out;
input         load_data;
input         RSTn;
input         load_start;
input         load_stop;
input         load_ack;
input         load_nack;

reg [24:0] shift_reg;
integer i;

assign out = shift_reg[24];

[MASKED]

endmodule