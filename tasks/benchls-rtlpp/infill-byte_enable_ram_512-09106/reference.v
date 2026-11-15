module rtlpp_09106 (
  address,
  byteenable,
  chipselect,
  clk,
  clken,
  reset,
  write,
  writedata,
  readdata
);

  output [31:0] readdata;
  input [8:0] address;
  input [3:0] byteenable;
  input chipselect;
  input clk;
  input clken;
  input reset;
  input write;
  input [31:0] writedata;

  reg [31:0] memory [0:511];
  reg [31:0] readdata;

  wire wren;
  assign wren = chipselect & write;

  always @(posedge clk) begin
    if (reset) begin
      readdata <= 0;
    end else if (clken) begin
      if (wren) begin
        if (byteenable[0]) memory[address][7:0] <= writedata[7:0];
        if (byteenable[1]) memory[address][15:8] <= writedata[15:8];
        if (byteenable[2]) memory[address][23:16] <= writedata[23:16];
        if (byteenable[3]) memory[address][31:24] <= writedata[31:24];
      end
      readdata <= memory[address];
    end
  end

endmodule