// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 92;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149613 dut (
    .clk(clk),
    .slave_addr(in_vec[38:36]),
    .slave_write(in_vec[35:35]),
    .slave_writedata(in_vec[34:3]),
    .slave_read(in_vec[2:2]),
    .source_ready(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .slave_readdata(out_vec[91:60]),
    .source_data(out_vec[59:36]),
    .source_sop(out_vec[35:35]),
    .source_valid(out_vec[34:34]),
    .source_eop(out_vec[33:33]),
    .width(out_vec[32:17]),
    .height(out_vec[16:1]),
    .go(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h098e715f33;
    stim[1] = 39'h37b4db306f;
    stim[2] = 39'h02e5115778;
    stim[3] = 39'h6eb22ad7a4;
    stim[4] = 39'h347a204438;
    stim[5] = 39'h0f2dea62d4;
    stim[6] = 39'h5c675c57d0;
    stim[7] = 39'h139cb45552;
    stim[8] = 39'h4d75222d76;
    stim[9] = 39'h022f435d86;
    stim[10] = 39'h6f14357c98;
    stim[11] = 39'h32eeada5f8;
    stim[12] = 39'h50cb38e518;
    stim[13] = 39'h398740ced2;
    stim[14] = 39'h24ae50abec;
    stim[15] = 39'h09eb9b0c16;
    stim[16] = 39'h0631d0a9a8;
    stim[17] = 39'h2ad6bf0bcc;
    stim[18] = 39'h6847da794e;
    stim[19] = 39'h30e05a9414;
    stim[20] = 39'h236c176d14;
    stim[21] = 39'h36b1f7f397;
    stim[22] = 39'h55a9c0b1bc;
    stim[23] = 39'h73bbfcb8e0;
    stim[24] = 39'h5eb037c7ea;
    stim[25] = 39'h32a601e1d0;
    stim[26] = 39'h20f3b7c4d4;
    stim[27] = 39'h6d2986850c;
    stim[28] = 39'h7107fa9d62;
    stim[29] = 39'h610f553520;
    stim[30] = 39'h4cc1834a22;
    stim[31] = 39'h43e3428ca2;
    stim[32] = 39'h73468f4212;
    stim[33] = 39'h3025a61408;
    stim[34] = 39'h69fbef4acc;
    stim[35] = 39'h2b2e0b1e92;
    stim[36] = 39'h3156b31366;
    stim[37] = 39'h52cea180d2;
    stim[38] = 39'h4cdc510736;
    stim[39] = 39'h1ad8567742;
    stim[40] = 39'h7742d58440;
    stim[41] = 39'h3b86fbab16;
    stim[42] = 39'h6f7f38735a;
    stim[43] = 39'h700f1d6c80;
    stim[44] = 39'h0020f0da62;
    stim[45] = 39'h74d5fc85dc;
    stim[46] = 39'h1b19ae3b86;
    stim[47] = 39'h061adab4f0;
    stim[48] = 39'h355d7bc3f1;
    stim[49] = 39'h684beba188;
    stim[50] = 39'h533ce853ba;
    stim[51] = 39'h5a7dd2fad2;
    stim[52] = 39'h60a22f0f3e;
    stim[53] = 39'h00d15db66c;
    stim[54] = 39'h5bd6c70264;
    stim[55] = 39'h213a3385fa;
    stim[56] = 39'h772179c340;
    stim[57] = 39'h7dd0378330;
    stim[58] = 39'h30711d8216;
    stim[59] = 39'h71a3eb57b0;
    stim[60] = 39'h49bd828b8e;
    stim[61] = 39'h01f2b9b12a;
    stim[62] = 39'h6d1d39d484;
    stim[63] = 39'h75fe4801b0;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 92'hxxxxxxxx000000xxxxxxxxx;
      expv[1] = 92'hxxxxxxxx00000000f000870;
      expv[2] = 92'hxxxxxxxx00000000f000870;
      expv[3] = 92'h0000000000000000f000870;
      expv[4] = 92'h0000000000000000f000870;
      expv[5] = 92'h0000000000000000f000870;
      expv[6] = 92'h0000000000000000f000870;
      expv[7] = 92'h0000000000000000f000870;
      expv[8] = 92'h0000000000000000f000870;
      expv[9] = 92'h0000000000000000f000870;
      expv[10] = 92'h0000000000000000f000870;
      expv[11] = 92'h0000000000000000f000870;
      expv[12] = 92'h0000000000000000f000870;
      expv[13] = 92'h0000000000000000f000870;
      expv[14] = 92'h0000000000000000f0033b4;
      expv[15] = 92'h0000000000000000f0033b4;
      expv[16] = 92'h0000078000000000f0033b4;
      expv[17] = 92'h0000000000000000f0033b4;
      expv[18] = 92'h000000000000001c2f233b4;
      expv[19] = 92'h000007800000001c2f233b4;
      expv[20] = 92'h000000000000001c2f233b4;
      expv[21] = 92'h000019da0000001c2f233b4;
      expv[22] = 92'h000019da00000000f000870;
      expv[23] = 92'h0000000000000000f000870;
      expv[24] = 92'h0000000000000000f000870;
      expv[25] = 92'h0000000000000000f000870;
      expv[26] = 92'h0000000000000000f000870;
      expv[27] = 92'h0000000000000000f000870;
      expv[28] = 92'h0000078000000000f000870;
      expv[29] = 92'h0000000000000000f000870;
      expv[30] = 92'h0000000000000000f000870;
      expv[31] = 92'h0000000000000000f000870;
      expv[32] = 92'h0000000000000000f000870;
      expv[33] = 92'h0000000000000000f000870;
      expv[34] = 92'h0000000000000000f000870;
      expv[35] = 92'h0000000000000000f000870;
      expv[36] = 92'h000000000000000c7a40870;
      expv[37] = 92'h000000000000000c7a40870;
      expv[38] = 92'h000004380000000c7a40870;
      expv[39] = 92'h000004380000000c7a40870;
      expv[40] = 92'h000000000000000c7a40870;
      expv[41] = 92'h000000000000000c7a40870;
      expv[42] = 92'h000000000000000c7a4eac4;
      expv[43] = 92'h000004380000000c7a4eac4;
      expv[44] = 92'h000004380000000c7a4eac4;
      expv[45] = 92'h000004380000000c7a4eac4;
      expv[46] = 92'h000004380000000c7a4eac4;
      expv[47] = 92'h000000000000000c7a4eac4;
      expv[48] = 92'h000000000000000c7a4eac4;
      expv[49] = 92'h0000000000000000f000870;
      expv[50] = 92'h0000000000000000f000870;
      expv[51] = 92'h0000000000000000f000870;
      expv[52] = 92'h0000000000000000f000870;
      expv[53] = 92'h0000000000000000f000870;
      expv[54] = 92'h0000000000000000f000870;
      expv[55] = 92'h0000000000000000f000870;
      expv[56] = 92'h0000000000000000f000870;
      expv[57] = 92'h0000000000000000f000870;
      expv[58] = 92'h0000000000000000f000870;
      expv[59] = 92'h0000000000000000f000870;
      expv[60] = 92'h0000043800000000f000870;
      expv[61] = 92'h0000043800000000f000870;
      expv[62] = 92'h0000000000000000f000870;
      expv[63] = 92'h0000000000000000f000870;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
