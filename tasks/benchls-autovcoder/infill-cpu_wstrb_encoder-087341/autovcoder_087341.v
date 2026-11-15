module autovcoder_087341 (
    input         nub_clkn,
    input         nub_resetn,
    input         mst_adrcyn,
    input         cpu_valid,
    input  [ 3:0] cpu_write,
    input  [31:0] cpu_addr,
    input  [31:0] cpu_wdata,
    output [31:0] cpu_ad_o,
    output        cpu_tm1n_o,
    output        cpu_tm0n_o,
    output        cpu_error_o,
    output        cpu_masterd_o
);

  // ==========================================================================
  // CPU Interface
  // ==========================================================================

  reg [4:0] tmadn;

  // Encode wrstb signals to the 'tmn' and 'ad' signals
  [MASKED]

  wire [31:0] cpu_tma;
  assign cpu_tma[31:2] = cpu_addr[31:2];
  assign cpu_tma[1:0] = ~tmadn[1:0];
  assign cpu_ad_o = ~mst_adrcyn ? cpu_tma : cpu_wdata;

  assign cpu_error_o = tmadn[4] & cpu_valid;
  assign cpu_tm1n_o = tmadn[3];
  assign cpu_tm0n_o = tmadn[2];


endmodule

