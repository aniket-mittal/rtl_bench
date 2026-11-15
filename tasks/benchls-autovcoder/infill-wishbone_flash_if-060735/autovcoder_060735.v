module autovcoder_060735 (
    // Wishbone slave interface
    input         wb_clk_i,
    input         wb_rst_i,
    input  [15:0] wb_dat_i,
    output [15:0] wb_dat_o,
    input         wb_we_i,
    input         wb_adr_i,  // Wishbone address line
    input  [ 1:0] wb_sel_i,
    input         wb_stb_i,
    input         wb_cyc_i,
    output        wb_ack_o,

    // Pad signals
    output [21:0] flash_addr_,
    input  [15:0] flash_data_,
    output        flash_we_n_,
    output        flash_oe_n_,
    output        flash_ce_n_,
    output        flash_rst_n_
);

  // Registers and nets
  wire        op;
  wire        wr_command;
  reg  [21:0] address;

  // Combinatorial logic
  assign op = wb_stb_i & wb_cyc_i;

  assign flash_rst_n_ = 1'b1;
  assign flash_we_n_ = 1'b1;
  assign flash_oe_n_ = !op;
  assign flash_ce_n_ = !op;

  assign flash_addr_ = address;
  assign wr_command = op & wb_we_i;  // Wishbone write access Signal

  assign wb_ack_o = op;
  assign wb_dat_o = flash_data_;

  // --------------------------------------------------------------------
  // Register addresses and defaults
  // --------------------------------------------------------------------
  `define FLASH_ALO 1'h0    // Lower 16 bits of address lines
  `define FLASH_AHI 1'h1    // Upper  6 bits of address lines
  [MASKED]  // End of case

endmodule

