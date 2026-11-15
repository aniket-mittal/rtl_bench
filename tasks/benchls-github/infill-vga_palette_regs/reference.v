module vga_palette_regs (
    input clk,

    // VGA read interface
    input      [3:0] attr,
    output reg [7:0] index,

    // CPU interface
    input      [3:0] address,
    input            write,
    output reg [7:0] read_data,
    input      [7:0] write_data
  );

  // Registers
  reg [7:0] palette [0:15];

  // Behaviour
  // VGA read interface
  always @(posedge clk) index <= palette[attr];

  // CPU read interface
  always @(posedge clk) read_data <= palette[address];

  // CPU write interface
  always @(posedge clk)
    if (write) palette[address] <= write_data;

endmodule