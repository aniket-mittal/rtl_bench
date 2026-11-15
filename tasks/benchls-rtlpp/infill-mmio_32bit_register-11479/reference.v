module rtlpp_11479 (
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

  wire clk_en;
  reg [31:0] data_out;
  wire [31:0] read_mux_out;
  
  assign clk_en = 1;

  assign read_mux_out = (address == 0) ? data_out : 32'b0;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) 
      data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
      data_out <= writedata;
  end

  assign readdata = read_mux_out;
  assign out_port = data_out;

endmodule