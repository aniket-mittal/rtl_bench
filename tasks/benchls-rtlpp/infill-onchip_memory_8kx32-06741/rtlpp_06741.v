module rtlpp_06741 (
    address,
    byteenable,
    chipselect,
    clk,
    clken,
    freeze,
    reset,
    reset_req,
    write,
    writedata,
    readdata
);

  parameter INIT_FILE = "niosLab2_onchip_memory2_1.hex";

  output reg [31:0] readdata;
  input [12:0] address;
  input [3:0] byteenable;
  input chipselect;
  input clk;
  input clken;
  input freeze;
  input reset;
  input reset_req;
  input write;
  input [31:0] writedata;

  reg [31:0] mem[0:8191]; // Internal memory array
  wire clocken0;
  wire wren;
  integer i;

  assign wren = chipselect & write;
  assign clocken0 = clken & ~reset_req;

  [MASKED]
endmodule