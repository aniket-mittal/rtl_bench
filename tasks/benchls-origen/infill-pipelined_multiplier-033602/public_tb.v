// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033602 dut (
    .iClk(clk),
    .iF(in_vec[50:34]),
    .iG0(in_vec[33:17]),
    .iG1(in_vec[16:0]),
    .oX0(out_vec[32:17]),
    .oX1(out_vec[16:1]),
    .rValid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h0eecd276622f1;
    stim[1] = 51'h4bf9720a16dc1;
    stim[2] = 51'h22287f7383548;
    stim[3] = 51'h770bd9b384623;
    stim[4] = 51'h5a2fbb730b4c9;
    stim[5] = 51'h49e5b002e4df1;
    stim[6] = 51'h28ae175000032;
    stim[7] = 51'h3f66e6d210cdc;
    stim[8] = 51'h564574083e3bd;
    stim[9] = 51'h7cccac4b9b039;
    stim[10] = 51'h5baf88ca02d6b;
    stim[11] = 51'h2ef9b8fc6c23f;
    stim[12] = 51'h682ee14b423fc;
    stim[13] = 51'h692ceb116f392;
    stim[14] = 51'h5a0983b317cd4;
    stim[15] = 51'h1f43d2aa9d42a;
    stim[16] = 51'h70607b78042b7;
    stim[17] = 51'h031dc7f975a70;
    stim[18] = 51'h7f54bbb936f79;
    stim[19] = 51'h0426452ed9d79;
    stim[20] = 51'h42d4a558c4e2c;
    stim[21] = 51'h54e7ff6f91d99;
    stim[22] = 51'h1d749f12e1a88;
    stim[23] = 51'h5933b80cf04ac;
    stim[24] = 51'h46d5dabb4a6ed;
    stim[25] = 51'h3c6e2e16b9825;
    stim[26] = 51'h7df4580a82a8c;
    stim[27] = 51'h39a280955658d;
    stim[28] = 51'h47489873d942a;
    stim[29] = 51'h3aa8523d8ec51;
    stim[30] = 51'h1a9fa84acd7f7;
    stim[31] = 51'h511419930b72f;
    stim[32] = 51'h0986a44da8c29;
    stim[33] = 51'h663133f6e2fb3;
    stim[34] = 51'h668a8328742e3;
    stim[35] = 51'h315ada365beaa;
    stim[36] = 51'h28d0cbece261e;
    stim[37] = 51'h0b2f34df340d5;
    stim[38] = 51'h79a5b118171e3;
    stim[39] = 51'h1f5c10fe6a335;
    stim[40] = 51'h628efb8324414;
    stim[41] = 51'h70cd244e612b7;
    stim[42] = 51'h413559e304abf;
    stim[43] = 51'h44f0a286e2b68;
    stim[44] = 51'h17bb9bfdf02af;
    stim[45] = 51'h57a6db49c144e;
    stim[46] = 51'h0ebeefe2ede45;
    stim[47] = 51'h022a3310a915b;
    stim[48] = 51'h46302cce689b2;
    stim[49] = 51'h17dae61daa5e8;
    stim[50] = 51'h56f2b84df9a71;
    stim[51] = 51'h70cb1bf794bb0;
    stim[52] = 51'h18362bb4c64b7;
    stim[53] = 51'h3f184ee2f3aa9;
    stim[54] = 51'h448e16442c632;
    stim[55] = 51'h355d46e5ad33c;
    stim[56] = 51'h51fbcd1438ef3;
    stim[57] = 51'h476f380e89b98;
    stim[58] = 51'h223f5e5dd140e;
    stim[59] = 51'h7473a4bebdc5b;
    stim[60] = 51'h6d3cf1ae3acdb;
    stim[61] = 51'h703b84dabe481;
    stim[62] = 51'h0f57edce8a84c;
    stim[63] = 51'h501022ae80044;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'hxxxxxxxxx;
      expv[6] = 33'hxxxxxxxxx;
      expv[7] = 33'hxxxxxxxxx;
      expv[8] = 33'hxxxxxxxxx;
      expv[9] = 33'h0351a5e33;
      expv[10] = 33'h13f9fac09;
      expv[11] = 33'h1622898a9;
      expv[12] = 33'h071ec66f5;
      expv[13] = 33'h12a32abdb;
      expv[14] = 33'h1004a002b;
      expv[15] = 33'h0a498008d;
      expv[16] = 33'h1354f0c91;
      expv[17] = 33'h171455e41;
      expv[18] = 33'h1099504b3;
      expv[19] = 33'h017c6b4b9;
      expv[20] = 33'h109520897;
      expv[21] = 33'h1159e4b27;
      expv[22] = 33'h1eaee32a5;
      expv[23] = 33'h01b3d72e7;
      expv[24] = 33'h03b73ea9d;
      expv[25] = 33'h1cb1893ad;
      expv[26] = 33'h07877aac9;
      expv[27] = 33'h17125b6c3;
      expv[28] = 33'h04aad3515;
      expv[29] = 33'h15f48ae23;
      expv[30] = 33'h1e25b3641;
      expv[31] = 33'h064521613;
      expv[32] = 33'h1a32d0bd7;
      expv[33] = 33'h0198e0b97;
      expv[34] = 33'h167ed4d1b;
      expv[35] = 33'h0ce228857;
      expv[36] = 33'h007319c9f;
      expv[37] = 33'h0563f19b9;
      expv[38] = 33'h0064225db;
      expv[39] = 33'h1fc2c4e65;
      expv[40] = 33'h04b0e3615;
      expv[41] = 33'h16a062573;
      expv[42] = 33'h16fcaa825;
      expv[43] = 33'h0337b884d;
      expv[44] = 33'h0b0018701;
      expv[45] = 33'h046c01c45;
      expv[46] = 33'h16ac1b195;
      expv[47] = 33'h10409347b;
      expv[48] = 33'h000880261;
      expv[49] = 33'h1ca009551;
      expv[50] = 33'h119ae0df3;
      expv[51] = 33'h0d6e6cb17;
      expv[52] = 33'h1474098ff;
      expv[53] = 33'h048950207;
      expv[54] = 33'h0b20c2809;
      expv[55] = 33'h11044c9f5;
      expv[56] = 33'h128e21cf1;
      expv[57] = 33'h1067818d7;
      expv[58] = 33'h16d36549f;
      expv[59] = 33'h147191c4d;
      expv[60] = 33'h05c63136f;
      expv[61] = 33'h13fae57cf;
      expv[62] = 33'h0a1adcdbd;
      expv[63] = 33'h0180821a7;
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
