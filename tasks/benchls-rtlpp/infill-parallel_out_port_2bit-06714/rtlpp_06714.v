module rtlpp_06714 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

  output [1:0] out_port;
  output [31:0] readdata;
  input [1:0] address;
  input chipselect;
  input clk;
  input reset_n;
  input write_n;
  input [31:0] writedata;

  reg [1:0] data_out;

  assign readdata = {30'b0, data_out};
  assign out_port = data_out;

  [MASKED]

endmodule