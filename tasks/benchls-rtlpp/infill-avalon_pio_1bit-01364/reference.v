module rtlpp_01364 (
                                                                                                      
    input   [  1: 0] address,
    input            chipselect,
    input            clk,
    input            reset_n,
    input            write_n,
    input   [ 31: 0] writedata,
    output           out_port,
    output  [ 31: 0] readdata
);

  reg              data_out;
  wire             read_mux_out;

  assign read_mux_out = (address == 2'b00) & data_out;
  
  always @(posedge clk or negedge reset_n)
  begin
    if (reset_n == 0)
        data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata[0]; // assuming writedata is intended to write only 1-bit values
  end

  assign readdata = {31'b0, read_mux_out};
  assign out_port = data_out;

endmodule