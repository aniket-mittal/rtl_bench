module rtlpp_01946 (
  input  [2:0] data_in,
  output [3:0] data_out
);

wire gnd = 1'b0;
wire vcc = 1'b1;

assign data_out[3] = gnd;
assign data_out[2] = data_in[2];
assign data_out[1] = data_in[1];
assign data_out[0] = data_in[0];

endmodule