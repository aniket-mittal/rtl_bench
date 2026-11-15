module autovcoder_074776 (
    scrambler_reset,
    reset_n,
    pclk,
    data_out
);

  input scrambler_reset, reset_n, pclk;

  output wire [15:0] data_out;

  reg [15:0] lfsr_q, lfsr_c;
  reg [15:0] data_c;

  [MASKED]

  always @(posedge pclk or negedge reset_n)
    if (~reset_n) lfsr_q <= 16'hFFFF;
    else lfsr_q <= lfsr_c;

  assign data_out = data_c;

endmodule

