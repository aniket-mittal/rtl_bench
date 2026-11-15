module autovcoder_008903 #(
    parameter length = 32,
    parameter R = 5,
    parameter DATA_LENGTH = 256
) (
    // SYSTEM I/O
    input i_clk,
    input i_rst,
    // FFT CONTROLLER
    input i_BI_en,
    // ROM
    input [2*length-1:0] i_rom_data,
    output reg [9:0] o_rom_addr,
    // memory bank0
    output reg [R-2:0] o_m0_addr,
    output reg [2*length-1:0] o_m0_data,
    output reg o_m0_w_en,
    // memory bank1
    output reg [R-2:0] o_m1_addr,
    output reg [2*length-1:0] o_m1_data,
    output reg o_m1_w_en
);
  // parameter, reg, wire
  localparam ST_IDLE = 0;
  localparam ST_ROM_ADDR_OUT = 1;
  localparam ST_ROM_DATA_IN = 2;
  localparam ST_MEMORY_ADDR_OUT = 3;
  localparam ST_MEMORY_WRITE = 4;
  localparam ST_DONE = 5;

  reg [  2:0] r_ps;
  reg [R-1:0] r_cnt;

  // Sequential Logic
  [MASKED]

endmodule

