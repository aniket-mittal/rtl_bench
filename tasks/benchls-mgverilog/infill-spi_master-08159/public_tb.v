// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08159 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sd_miso(in_vec[17:17]),
    .clk_div(in_vec[16:9]),
    .send_dat(in_vec[8:1]),
    .go(in_vec[0:0]),
    .sd_clk(out_vec[10:10]),
    .sd_mosi(out_vec[9:9]),
    .rcv_dat(out_vec[8:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h75f53;
    stim[1] = 19'h5a62f;
    stim[2] = 19'h18fc8;
    stim[3] = 19'h33137;
    stim[4] = 19'h3da1c;
    stim[5] = 19'h31239;
    stim[6] = 19'h31892;
    stim[7] = 19'h16524;
    stim[8] = 19'h059a1;
    stim[9] = 19'h3464d;
    stim[10] = 19'h3e912;
    stim[11] = 19'h0e3f4;
    stim[12] = 19'h2960a;
    stim[13] = 19'h1e8e7;
    stim[14] = 19'h1ef8a;
    stim[15] = 19'h05f9a;
    stim[16] = 19'h0b0d0;
    stim[17] = 19'h29a20;
    stim[18] = 19'h1d71b;
    stim[19] = 19'h118dc;
    stim[20] = 19'h04621;
    stim[21] = 19'h161d2;
    stim[22] = 19'h0dc3d;
    stim[23] = 19'h2a4ac;
    stim[24] = 19'h132c6;
    stim[25] = 19'h1085b;
    stim[26] = 19'h29ea1;
    stim[27] = 19'h20483;
    stim[28] = 19'h30efd;
    stim[29] = 19'h0a2ff;
    stim[30] = 19'h1a384;
    stim[31] = 19'h0981a;
    stim[32] = 19'h1d274;
    stim[33] = 19'h06ac6;
    stim[34] = 19'h0a0f2;
    stim[35] = 19'h38728;
    stim[36] = 19'h2be3a;
    stim[37] = 19'h3937f;
    stim[38] = 19'h0516a;
    stim[39] = 19'h33b3e;
    stim[40] = 19'h1f07b;
    stim[41] = 19'h2e916;
    stim[42] = 19'h2b5ad;
    stim[43] = 19'h036c2;
    stim[44] = 19'h05336;
    stim[45] = 19'h36b85;
    stim[46] = 19'h120b5;
    stim[47] = 19'h240d3;
    stim[48] = 19'h1ee84;
    stim[49] = 19'h30358;
    stim[50] = 19'h249f0;
    stim[51] = 19'h003ac;
    stim[52] = 19'h2f7d1;
    stim[53] = 19'h1e8ad;
    stim[54] = 19'h3e58e;
    stim[55] = 19'h012f7;
    stim[56] = 19'h40b9c;
    stim[57] = 19'h17d4c;
    stim[58] = 19'h3326b;
    stim[59] = 19'h27ad9;
    stim[60] = 19'h24b08;
    stim[61] = 19'h3ac6a;
    stim[62] = 19'h09a63;
    stim[63] = 19'h3f8c7;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h353;
      expv[2] = 11'h02f;
      expv[3] = 11'h02f;
      expv[4] = 11'h336;
      expv[5] = 11'h336;
      expv[6] = 11'h038;
      expv[7] = 11'h038;
      expv[8] = 11'h038;
      expv[9] = 11'h3a0;
      expv[10] = 11'h04c;
      expv[11] = 11'h04c;
      expv[12] = 11'h04c;
      expv[13] = 11'h04c;
      expv[14] = 11'h0e6;
      expv[15] = 11'h0e6;
      expv[16] = 11'h0e6;
      expv[17] = 11'h0e6;
      expv[18] = 11'h0e6;
      expv[19] = 11'h31a;
      expv[20] = 11'h31a;
      expv[21] = 11'h020;
      expv[22] = 11'h020;
      expv[23] = 11'h03c;
      expv[24] = 11'h03c;
      expv[25] = 11'h03c;
      expv[26] = 11'h05a;
      expv[27] = 11'h0a0;
      expv[28] = 11'h082;
      expv[29] = 11'h0fc;
      expv[30] = 11'h0fe;
      expv[31] = 11'h0fe;
      expv[32] = 11'h0fe;
      expv[33] = 11'h0fe;
      expv[34] = 11'h0fe;
      expv[35] = 11'h0fe;
      expv[36] = 11'h0fe;
      expv[37] = 11'h0fe;
      expv[38] = 11'h37e;
      expv[39] = 11'h37e;
      expv[40] = 11'h37e;
      expv[41] = 11'h07a;
      expv[42] = 11'h07a;
      expv[43] = 11'h3ac;
      expv[44] = 11'h3ac;
      expv[45] = 11'h3ac;
      expv[46] = 11'h384;
      expv[47] = 11'h0b4;
      expv[48] = 11'h0d2;
      expv[49] = 11'h0d2;
      expv[50] = 11'h0d2;
      expv[51] = 11'h0d2;
      expv[52] = 11'h0d2;
      expv[53] = 11'h3d0;
      expv[54] = 11'h0ac;
      expv[55] = 11'h0ac;
      expv[56] = 11'h0f6;
      expv[57] = 11'h0f7;
      expv[58] = 11'h0f7;
      expv[59] = 11'h06a;
      expv[60] = 11'h0d8;
      expv[61] = 11'h0d8;
      expv[62] = 11'h0d8;
      expv[63] = 11'h062;
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
