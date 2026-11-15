// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190303 dut (
    .alufn(in_vec[35:32]),
    .a(in_vec[31:16]),
    .b(in_vec[15:0]),
    .out(out_vec[18:3]),
    .z(out_vec[2:2]),
    .v(out_vec[1:1]),
    .n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h2dd9ca976;
    stim[1] = 36'hf23ee297c;
    stim[2] = 36'h277690c1d;
    stim[3] = 36'h147bb0edc;
    stim[4] = 36'h0b244891e;
    stim[5] = 36'h2991bab1c;
    stim[6] = 36'h6659699a4;
    stim[7] = 36'h818d0bf05;
    stim[8] = 36'hd85abebc4;
    stim[9] = 36'hfbb112bc3;
    stim[10] = 36'h8b932e0b0;
    stim[11] = 36'h40a7769b6;
    stim[12] = 36'h8ca7b3749;
    stim[13] = 36'hc7ace3ce6;
    stim[14] = 36'he67b8b3a4;
    stim[15] = 36'h31ff110a3;
    stim[16] = 36'hff7d8dffc;
    stim[17] = 36'h4db3fc7dc;
    stim[18] = 36'h703cb5473;
    stim[19] = 36'h0d162d71b;
    stim[20] = 36'hef0589e03;
    stim[21] = 36'h98c3a7dd8;
    stim[22] = 36'h1d37127e2;
    stim[23] = 36'h0b9f123da;
    stim[24] = 36'h0e9579f8d;
    stim[25] = 36'hacbfa47ce;
    stim[26] = 36'h91a1de8ec;
    stim[27] = 36'hf495ef870;
    stim[28] = 36'hfb8da03ba;
    stim[29] = 36'h7b75c7ab9;
    stim[30] = 36'h728679c83;
    stim[31] = 36'h65efa0c73;
    stim[32] = 36'h2207b87cb;
    stim[33] = 36'h6441f173b;
    stim[34] = 36'h545cd3fca;
    stim[35] = 36'hfd872a32b;
    stim[36] = 36'h85d1014a9;
    stim[37] = 36'h6a1644f67;
    stim[38] = 36'hc7c3c2b25;
    stim[39] = 36'h2e226a3be;
    stim[40] = 36'h5b9b5f351;
    stim[41] = 36'hc04e717d4;
    stim[42] = 36'h4b68a0eeb;
    stim[43] = 36'h59a27b0af;
    stim[44] = 36'h561a1b078;
    stim[45] = 36'ha9f102e43;
    stim[46] = 36'hbaa51d26e;
    stim[47] = 36'hb771f7a8f;
    stim[48] = 36'h570e3253e;
    stim[49] = 36'h1f1aad87c;
    stim[50] = 36'hc90a3adce;
    stim[51] = 36'hdd1e44a3a;
    stim[52] = 36'heafa83224;
    stim[53] = 36'hc38d24cc5;
    stim[54] = 36'hb0b0a637c;
    stim[55] = 36'h68f04740b;
    stim[56] = 36'hb1fa6f52a;
    stim[57] = 36'hb0a72b0a8;
    stim[58] = 36'hdd69e42d8;
    stim[59] = 36'hfcf469b6a;
    stim[60] = 36'hc4fc43a2f;
    stim[61] = 36'hae0a9e3a6;
    stim[62] = 36'h61c4a5030;
    stim[63] = 36'hd5b6492fb;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 19'h10f42;
      expv[1] = 19'h00000;
      expv[2] = 19'h3972a;
      expv[3] = 19'h1c6f8;
      expv[4] = 19'h1db12;
      expv[5] = 19'h63fa3;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00008;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h543e9;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h55c79;
      expv[23] = 19'h6ee59;
      expv[24] = 19'h44721;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h4f44b;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h051a2;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h0c970;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
