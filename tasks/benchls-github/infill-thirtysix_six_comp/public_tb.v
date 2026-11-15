// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  thirtysix_six_comp dut (
    .data(in_vec[35:0]),
    .sum(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h75b3ce83b;
    stim[1] = 36'h58e2d0d8f;
    stim[2] = 36'h8a47fc7c1;
    stim[3] = 36'h60fa730f9;
    stim[4] = 36'hb87bb46e6;
    stim[5] = 36'ha0cbae4b0;
    stim[6] = 36'h994c2f350;
    stim[7] = 36'h468495567;
    stim[8] = 36'h9c57a8393;
    stim[9] = 36'h376f9b858;
    stim[10] = 36'h8a436fac3;
    stim[11] = 36'h7cb133d7a;
    stim[12] = 36'hac4d1db3f;
    stim[13] = 36'h03ea9bd4e;
    stim[14] = 36'hd999b2965;
    stim[15] = 36'h42d0d4dfc;
    stim[16] = 36'ha1b1ba68c;
    stim[17] = 36'hc99a0b92f;
    stim[18] = 36'h38e59ee25;
    stim[19] = 36'hb80510db4;
    stim[20] = 36'h60cdc83d3;
    stim[21] = 36'h82d9752f5;
    stim[22] = 36'he53a4dfa7;
    stim[23] = 36'h5326e7f23;
    stim[24] = 36'h3865478b9;
    stim[25] = 36'h1a3ff115d;
    stim[26] = 36'hb3e8126bb;
    stim[27] = 36'h9878055d6;
    stim[28] = 36'h282ca07ed;
    stim[29] = 36'h6153314d3;
    stim[30] = 36'hec32719b0;
    stim[31] = 36'h04befd849;
    stim[32] = 36'h8a94ae1d3;
    stim[33] = 36'h3801a1188;
    stim[34] = 36'h567a9a356;
    stim[35] = 36'h651c209cb;
    stim[36] = 36'h7ea467c9d;
    stim[37] = 36'h32bfd3807;
    stim[38] = 36'hd2ccaee05;
    stim[39] = 36'he10b99c79;
    stim[40] = 36'h7250a373e;
    stim[41] = 36'ha16464608;
    stim[42] = 36'h64dff2455;
    stim[43] = 36'h3c2b0105f;
    stim[44] = 36'h6e62580bd;
    stim[45] = 36'h93e413b8b;
    stim[46] = 36'hc413fec64;
    stim[47] = 36'h6d2404e8d;
    stim[48] = 36'h3e5b8219e;
    stim[49] = 36'hb6eb3d908;
    stim[50] = 36'h8d892135c;
    stim[51] = 36'h1072ea173;
    stim[52] = 36'h63124cd04;
    stim[53] = 36'h146d52619;
    stim[54] = 36'h957089d74;
    stim[55] = 36'hde5225c08;
    stim[56] = 36'h7ff98396e;
    stim[57] = 36'hd23522c2b;
    stim[58] = 36'h179a53bbc;
    stim[59] = 36'h4153d9c16;
    stim[60] = 36'hdc8c9a836;
    stim[61] = 36'h8ad744ad6;
    stim[62] = 36'h84ea4494b;
    stim[63] = 36'hc80049e17;
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
      expv[0] = 6'h15;
      expv[1] = 6'h12;
      expv[2] = 6'h13;
      expv[3] = 6'h13;
      expv[4] = 6'h15;
      expv[5] = 6'h10;
      expv[6] = 6'h10;
      expv[7] = 6'h10;
      expv[8] = 6'h12;
      expv[9] = 6'h14;
      expv[10] = 6'h12;
      expv[11] = 6'h15;
      expv[12] = 6'h15;
      expv[13] = 6'h13;
      expv[14] = 6'h13;
      expv[15] = 6'h12;
      expv[16] = 6'h11;
      expv[17] = 6'h12;
      expv[18] = 6'h13;
      expv[19] = 6'h0e;
      expv[20] = 6'h11;
      expv[21] = 6'h13;
      expv[22] = 6'h16;
      expv[23] = 6'h14;
      expv[24] = 6'h11;
      expv[25] = 6'h14;
      expv[26] = 6'h13;
      expv[27] = 6'h10;
      expv[28] = 6'h10;
      expv[29] = 6'h10;
      expv[30] = 6'h11;
      expv[31] = 6'h12;
      expv[32] = 6'h11;
      expv[33] = 6'h0a;
      expv[34] = 6'h13;
      expv[35] = 6'h0f;
      expv[36] = 6'h15;
      expv[37] = 6'h13;
      expv[38] = 6'h12;
      expv[39] = 6'h12;
      expv[40] = 6'h12;
      expv[41] = 6'h0c;
      expv[42] = 6'h14;
      expv[43] = 6'h0f;
      expv[44] = 6'h11;
      expv[45] = 6'h12;
      expv[46] = 6'h12;
      expv[47] = 6'h0f;
      expv[48] = 6'h12;
      expv[49] = 6'h13;
      expv[50] = 6'h0f;
      expv[51] = 6'h10;
      expv[52] = 6'h0d;
      expv[53] = 6'h0f;
      expv[54] = 6'h11;
      expv[55] = 6'h0f;
      expv[56] = 6'h17;
      expv[57] = 6'h10;
      expv[58] = 6'h14;
      expv[59] = 6'h10;
      expv[60] = 6'h11;
      expv[61] = 6'h12;
      expv[62] = 6'h0f;
      expv[63] = 6'h0d;
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
