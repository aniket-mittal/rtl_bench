module rtlpp_01359 (
                                                                                                   address,
                                                                                                   chipselect,
                                                                                                   clk,
                                                                                                   reset_n,
                                                                                                   write_n,
                                                                                                   writedata,

                                                                                                   out_port,
                                                                                                   readdata
                                                                                                 )
;

  output           out_port;
  output  [31:0]   readdata;
  input   [1:0]    address;
  input            chipselect;
  input            clk;
  input            reset_n;
  input            write_n;
  input   [31:0]   writedata;

  reg              data_out;
  wire             read_mux_out;
  
  assign read_mux_out = (address == 2'b00) & data_out;
  
  [MASKED]

  assign readdata = {31'b0, read_mux_out};
  assign out_port = data_out;

endmodule