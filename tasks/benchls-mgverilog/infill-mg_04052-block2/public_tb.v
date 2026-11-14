// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04052 dut (
    .iSRC_MASK(in_vec[35:32]),
    .iSRC_DATA(in_vec[31:0]),
    .oDEST_MASK(out_vec[35:32]),
    .oDEST_DATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h01d5c4ef1;
    stim[1] = 36'h1acb6fcc2;
    stim[2] = 36'hde71a676e;
    stim[3] = 36'hf66eb7562;
    stim[4] = 36'h4b68a1465;
    stim[5] = 36'h133c184d9;
    stim[6] = 36'h78f36a96d;
    stim[7] = 36'hf12045bff;
    stim[8] = 36'hd68fd6e77;
    stim[9] = 36'ha7c27ab8b;
    stim[10] = 36'h22a54f992;
    stim[11] = 36'h6b7b7ab5c;
    stim[12] = 36'h13b0e136c;
    stim[13] = 36'h4aa39603c;
    stim[14] = 36'h82392c685;
    stim[15] = 36'h3326eb430;
    stim[16] = 36'h5a280e684;
    stim[17] = 36'h70571cce5;
    stim[18] = 36'h1a3196952;
    stim[19] = 36'h3292cc178;
    stim[20] = 36'h7832ba087;
    stim[21] = 36'hf38eae941;
    stim[22] = 36'ha59d016e1;
    stim[23] = 36'h4214b2728;
    stim[24] = 36'h14ff74408;
    stim[25] = 36'h47598cbf4;
    stim[26] = 36'hcb20260e2;
    stim[27] = 36'h30291bc05;
    stim[28] = 36'hfd2878f29;
    stim[29] = 36'hfce0994d1;
    stim[30] = 36'h71959a0cf;
    stim[31] = 36'h17aebcd53;
    stim[32] = 36'h549c40a04;
    stim[33] = 36'hd0ba6350a;
    stim[34] = 36'h25f76bbe9;
    stim[35] = 36'hd8a8d4bfc;
    stim[36] = 36'h80bf66a01;
    stim[37] = 36'h829b318be;
    stim[38] = 36'h6a4957db6;
    stim[39] = 36'h41b1dfaa4;
    stim[40] = 36'h6d07ab6b4;
    stim[41] = 36'h17aba5d36;
    stim[42] = 36'h923848e76;
    stim[43] = 36'h72b9abb6a;
    stim[44] = 36'h992dcc3a0;
    stim[45] = 36'h5a590cb3e;
    stim[46] = 36'h851ca32d9;
    stim[47] = 36'h069985ee6;
    stim[48] = 36'he4d304288;
    stim[49] = 36'h274d89914;
    stim[50] = 36'h1b38e33e1;
    stim[51] = 36'h16a1cebb6;
    stim[52] = 36'hb47f5e1d8;
    stim[53] = 36'hd621914a4;
    stim[54] = 36'h21264c219;
    stim[55] = 36'h2fdb02cb3;
    stim[56] = 36'hcc3636a52;
    stim[57] = 36'h4339b0696;
    stim[58] = 36'h416739b43;
    stim[59] = 36'he4e3f98b8;
    stim[60] = 36'hffac7a555;
    stim[61] = 36'hc5e4ee613;
    stim[62] = 36'hd0d99f5ca;
    stim[63] = 36'h980de8c14;
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
      expv[0] = 36'h01d000000;
      expv[1] = 36'h1000000c2;
      expv[2] = 36'hde7000000;
      expv[3] = 36'hf6275eb66;
      expv[4] = 36'h4008a0000;
      expv[5] = 36'h1000000d9;
      expv[6] = 36'h78f000000;
      expv[7] = 36'hfff5b0412;
      expv[8] = 36'hd68000000;
      expv[9] = 36'ha7c000000;
      expv[10] = 36'h20000f900;
      expv[11] = 36'h6b7000000;
      expv[12] = 36'h10000006c;
      expv[13] = 36'h400390000;
      expv[14] = 36'h823000000;
      expv[15] = 36'h3000030b4;
      expv[16] = 36'h5a2000000;
      expv[17] = 36'h705000000;
      expv[18] = 36'h100000052;
      expv[19] = 36'h3000078c1;
      expv[20] = 36'h783000000;
      expv[21] = 36'hf41e9ea38;
      expv[22] = 36'ha59000000;
      expv[23] = 36'h4004b0000;
      expv[24] = 36'h100000008;
      expv[25] = 36'h400980000;
      expv[26] = 36'hc02b20000;
      expv[27] = 36'h3000005bc;
      expv[28] = 36'hf298f87d2;
      expv[29] = 36'hfd19409ce;
      expv[30] = 36'h719000000;
      expv[31] = 36'h100000053;
      expv[32] = 36'h549000000;
      expv[33] = 36'hd0b000000;
      expv[34] = 36'h20000bb00;
      expv[35] = 36'hd8a000000;
      expv[36] = 36'h80b000000;
      expv[37] = 36'h829000000;
      expv[38] = 36'h6a4000000;
      expv[39] = 36'h4001d0000;
      expv[40] = 36'h6d0000000;
      expv[41] = 36'h100000036;
      expv[42] = 36'h923000000;
      expv[43] = 36'h72b000000;
      expv[44] = 36'h992000000;
      expv[45] = 36'h5a5000000;
      expv[46] = 36'h851000000;
      expv[47] = 36'h069000000;
      expv[48] = 36'he4d000000;
      expv[49] = 36'h200009900;
      expv[50] = 36'h1000000e1;
      expv[51] = 36'h1000000b6;
      expv[52] = 36'hb47000000;
      expv[53] = 36'hd62000000;
      expv[54] = 36'h20000c200;
      expv[55] = 36'h200002c00;
      expv[56] = 36'hc63c30000;
      expv[57] = 36'h4009b0000;
      expv[58] = 36'h400730000;
      expv[59] = 36'he4e000000;
      expv[60] = 36'hf55a5c7fa;
      expv[61] = 36'hc4e5e0000;
      expv[62] = 36'hd0d000000;
      expv[63] = 36'h980000000;
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
