module rtlpp_05202 (
                                    address,
                                    chipselect,
                                    clk,
                                    reset_n,
                                    write_n,
                                    writedata,
                                    out_port,
                                    readdata
                                 );

  output [31:0] out_port;
  output [31:0] readdata;
  input [1:0] address;
  input chipselect;
  input clk;
  input reset_n;
  input write_n;
  input [31:0] writedata;

  reg [31:0] data_out;
  
  assign out_port = data_out;

  assign readdata = (address == 0) ? data_out : 0;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
      data_out <= writedata;
  end

endmodule