module rtlpp_00944 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

  output  [  7: 0] out_port;
  output  [ 31: 0] readdata;
  input   [  1: 0] address;
  input            chipselect;
  input            clk;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;

  wire             clk_en;
  reg     [  7: 0] data_out;
  wire    [  7: 0] read_mux_out;

  assign clk_en = 1;
  assign read_mux_out = (address == 0) ? data_out : 8'b0;

  [MASKED]

  assign readdata = {24'b0, read_mux_out};
  assign out_port = data_out;

endmodule