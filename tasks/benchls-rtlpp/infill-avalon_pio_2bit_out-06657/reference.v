module rtlpp_06657 (
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

  wire clk_en;
  wire [1:0] read_mux_out;

  assign clk_en = 1;
  assign read_mux_out = (address == 0) ? data_out : 2'b00;

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
        data_out <= 2'b00;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata[1:0];
  end

  assign readdata = {30'b0, read_mux_out};
  assign out_port = data_out;

endmodule