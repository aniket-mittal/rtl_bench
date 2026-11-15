// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00609 dut (
    .clock(clk),
    .resetn(in_vec[35:35]),
    .enable(in_vec[34:34]),
    .valid_in(in_vec[33:33]),
    .stall_in(in_vec[32:32]),
    .dataa(in_vec[31:0]),
    .valid_out(out_vec[65:65]),
    .stall_out(out_vec[64:64]),
    .result_fr(out_vec[63:32]),
    .result_exp(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h444c7f8e6;
    stim[1] = 36'h0594c8f65;
    stim[2] = 36'hbc94ac168;
    stim[3] = 36'he1c57d666;
    stim[4] = 36'h9dfd4d226;
    stim[5] = 36'h87f7a5885;
    stim[6] = 36'h94de735ff;
    stim[7] = 36'hab2b16845;
    stim[8] = 36'hc11c45460;
    stim[9] = 36'hdab4d17f5;
    stim[10] = 36'hb65066ea1;
    stim[11] = 36'hf49054b71;
    stim[12] = 36'he3918ab01;
    stim[13] = 36'ha71e78cd1;
    stim[14] = 36'hc67c88a0a;
    stim[15] = 36'hf04cc976a;
    stim[16] = 36'hfe795389f;
    stim[17] = 36'hab89c5bc6;
    stim[18] = 36'hb76f49388;
    stim[19] = 36'heeca8f81e;
    stim[20] = 36'hea3ebdd0c;
    stim[21] = 36'hc69025dc9;
    stim[22] = 36'hed7ce194c;
    stim[23] = 36'h908b5d661;
    stim[24] = 36'hf024dbd5a;
    stim[25] = 36'hf2d9ac349;
    stim[26] = 36'he6a917e48;
    stim[27] = 36'hb9f5b1d6c;
    stim[28] = 36'hb71f91afd;
    stim[29] = 36'hb2898a859;
    stim[30] = 36'hb61299b43;
    stim[31] = 36'h924b9608e;
    stim[32] = 36'hcfb89f182;
    stim[33] = 36'had119dca0;
    stim[34] = 36'hff935c1bd;
    stim[35] = 36'h940267dc9;
    stim[36] = 36'he77060b9c;
    stim[37] = 36'h8c05cc35a;
    stim[38] = 36'hcfe36c75c;
    stim[39] = 36'ha68e114f3;
    stim[40] = 36'hbbb74a7ad;
    stim[41] = 36'h8a7af4e15;
    stim[42] = 36'ha97b9729e;
    stim[43] = 36'hed263e6ef;
    stim[44] = 36'ha26fe4a77;
    stim[45] = 36'h855439e0a;
    stim[46] = 36'he0cabbe01;
    stim[47] = 36'hb99bcca3d;
    stim[48] = 36'h1a92d1a14;
    stim[49] = 36'hff7810435;
    stim[50] = 36'hf2c2a3958;
    stim[51] = 36'h964ac9ef2;
    stim[52] = 36'hd18ea59fd;
    stim[53] = 36'hc8d9053ce;
    stim[54] = 36'hb0eb1df29;
    stim[55] = 36'hf683d7db6;
    stim[56] = 36'hc1f6c1884;
    stim[57] = 36'hcbd66dd4f;
    stim[58] = 36'hf5446e8a6;
    stim[59] = 36'h8c495a150;
    stim[60] = 36'hb618a41a7;
    stim[61] = 36'hc813a5597;
    stim[62] = 36'hbe1553a5e;
    stim[63] = 36'he1bac03c4;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'h33f57d666ffffffba;
      expv[5] = 66'h23f57d666ffffffba;
      expv[6] = 66'h03f7a588500000080;
      expv[7] = 66'h03f6735ff0000001d;
      expv[8] = 66'h2bf316845ffffffe7;
      expv[9] = 66'h03f445460ffffffa5;
      expv[10] = 66'h0bf4d17f5ffffffd8;
      expv[11] = 66'h33f066ea10000004c;
      expv[12] = 66'h23f066ea10000004c;
      expv[13] = 66'h23f18ab01fffffff4;
      expv[14] = 66'h23f678cd100000065;
      expv[15] = 66'h03f488a0a00000051;
      expv[16] = 66'h33f4c976affffff8b;
      expv[17] = 66'h23f4c976affffff8b;
      expv[18] = 66'h3bf1c5bc6fffffff3;
      expv[19] = 66'h2bf1c5bc6fffffff3;
      expv[20] = 66'h2bf28f81e0000005b;
      expv[21] = 66'h2bf6bdd0cffffffc9;
      expv[22] = 66'h03f025dc900000054;
      expv[23] = 66'h3bf4e194c00000031;
      expv[24] = 66'h3bf4e194c00000031;
      expv[25] = 66'h3bf4e194c00000031;
      expv[26] = 66'h2bf4e194c00000031;
      expv[27] = 66'h33f117e4800000057;
      expv[28] = 66'h33f117e4800000057;
      expv[29] = 66'h33f117e4800000057;
      expv[30] = 66'h33f117e4800000057;
      expv[31] = 66'h33f117e4800000057;
      expv[32] = 66'h23f117e4800000057;
      expv[33] = 66'h0bf09f18200000079;
      expv[34] = 66'h3bf19dca000000024;
      expv[35] = 66'h3bf19dca000000024;
      expv[36] = 66'h2bf19dca000000024;
      expv[37] = 66'h23f060b9c00000070;
      expv[38] = 66'h0bf5cc35a00000002;
      expv[39] = 66'h0bf36c75c0000007e;
      expv[40] = 66'h33f6114f300000053;
      expv[41] = 66'h23f6114f300000053;
      expv[42] = 66'h0bf2f4e15ffffffd1;
      expv[43] = 66'h2bf39729effffffb1;
      expv[44] = 66'h2bf63e6ef00000026;
      expv[45] = 66'h23f7e4a77ffffffcf;
      expv[46] = 66'h03f439e0a0000002c;
      expv[47] = 66'h33f2bbe01ffffff9b;
      expv[48] = 66'h33f2bbe01ffffff9b;
      expv[49] = 66'h33f2bbe01ffffff9b;
      expv[50] = 66'h33f2bbe01ffffff9b;
      expv[51] = 66'h33f2bbe01ffffff9b;
      expv[52] = 66'h33f2bbe01ffffff9b;
      expv[53] = 66'h23f2bbe01ffffff9b;
      expv[54] = 66'h0bf1053ceffffff9d;
      expv[55] = 66'h33f31df29ffffff9f;
      expv[56] = 66'h23f31df29ffffff9f;
      expv[57] = 66'h03f6c1884ffffffc0;
      expv[58] = 66'h0bf66dd4ffffffffc;
      expv[59] = 66'h23f46e8a60000002a;
      expv[60] = 66'h0bf15a1500000000b;
      expv[61] = 66'h23f0a41a700000045;
      expv[62] = 66'h0bf3a5597ffffff84;
      expv[63] = 66'h2bf553a5e00000044;
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
