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

  always @(posedge clk)
  begin
    if(reset) begin
      readdata <= 32'b0;
      // Assuming initialization from a hex file if necessary
      // Initialization code would go here if simulating initial contents of memory
      /*
      $readmemh(INIT_FILE, mem);
      */
    end
    else if(clocken0 && !freeze) begin
      if(wren) begin
        // Byte enable functionality
        if(byteenable[0]) mem[address][7:0] <= writedata[7:0];
        if(byteenable[1]) mem[address][15:8] <= writedata[15:8];
        if(byteenable[2]) mem[address][23:16] <= writedata[23:16];
        if(byteenable[3]) mem[address][31:24] <= writedata[31:24];
      end
      readdata <= mem[address];
    end
  end
endmodule