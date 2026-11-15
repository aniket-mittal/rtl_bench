// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09031 dut (
    .clk(clk),
    .itr(in_vec[69:69]),
    .ct(in_vec[68:64]),
    .x0(in_vec[63:32]),
    .x1(in_vec[31:0]),
    .y0(out_vec[63:32]),
    .y1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h0839258bae3ae3a28c;
    stim[1] = 70'h03c8fbe1bf7bd2aad3;
    stim[2] = 70'h2b894c2cd747094ec4;
    stim[3] = 70'h1ad9a134a9fff5d802;
    stim[4] = 70'h29de26ccd61c5826c7;
    stim[5] = 70'h26c4f0d893401ec7f0;
    stim[6] = 70'h023c3bc874d03d278f;
    stim[7] = 70'h041a4345b3aadcdb46;
    stim[8] = 70'h1a69499cb9f9a05847;
    stim[9] = 70'h1682cce58726282635;
    stim[10] = 70'h15d4bdaaa5765d69f5;
    stim[11] = 70'h045ea4117d5cb7d515;
    stim[12] = 70'h3d2ff4afcf8696c6e8;
    stim[13] = 70'h3cb22978f403a55bdf;
    stim[14] = 70'h00c0715c7d213e5f90;
    stim[15] = 70'h1c082a0f4184084ea1;
    stim[16] = 70'h3c3db6c9dc160dc05b;
    stim[17] = 70'h2fc4058d1a0a7c45db;
    stim[18] = 70'h1aefe91fd0f33706c8;
    stim[19] = 70'h066493df6f766fdb00;
    stim[20] = 70'h1f2f167c0d8082b358;
    stim[21] = 70'h2f12edc203c60e7bc7;
    stim[22] = 70'h02dce7326b1d752410;
    stim[23] = 70'h2ad7831c7deff51375;
    stim[24] = 70'h2006696f796398d0ab;
    stim[25] = 70'h34f2ff28030650ef5b;
    stim[26] = 70'h0d70f5c19a79460e23;
    stim[27] = 70'h0885e611b284b18cb8;
    stim[28] = 70'h14202f889aea302126;
    stim[29] = 70'h2f92ef0e81c367492b;
    stim[30] = 70'h0cf6bcabe52c88b1e3;
    stim[31] = 70'h0372a340c4dbc583e0;
    stim[32] = 70'h2d6ceba23ee300eec2;
    stim[33] = 70'h1c42fc19ad71de149c;
    stim[34] = 70'h1ab031ef82820f8fc1;
    stim[35] = 70'h3e7b58b9119d97a56d;
    stim[36] = 70'h22ccfd6141778cb0ad;
    stim[37] = 70'h23bcf42e8f2f9876a2;
    stim[38] = 70'h0a181870e2e82b5a29;
    stim[39] = 70'h073036e0b6c8167109;
    stim[40] = 70'h1d43a56085e4a6ad1c;
    stim[41] = 70'h1ff2f2e8ff8ce0c244;
    stim[42] = 70'h1f1c3d55c8e9ac9fe6;
    stim[43] = 70'h06c12de6922054413a;
    stim[44] = 70'h386f039809ee7efc5b;
    stim[45] = 70'h1ac08c8d97e9c7203c;
    stim[46] = 70'h3e9d26ac2e0ccf8601;
    stim[47] = 70'h1b001c192497548096;
    stim[48] = 70'h0f1f09938a7b61b073;
    stim[49] = 70'h39347ef1a1be3bc43b;
    stim[50] = 70'h22ba42b431e3503d01;
    stim[51] = 70'h3ac3bed3b6c0bef697;
    stim[52] = 70'h1f75e37f037f674b55;
    stim[53] = 70'h1e916b7fc549d4ef41;
    stim[54] = 70'h2dfeda14116d198249;
    stim[55] = 70'h2825bd2d1de5bdf7d9;
    stim[56] = 70'h1644811dc3be41851d;
    stim[57] = 70'h00597ceeec9b22aad4;
    stim[58] = 70'h3fc7cc25800145bcda;
    stim[59] = 70'h263fb815af315b5725;
    stim[60] = 70'h2f0b47912ef9381a3a;
    stim[61] = 70'h37473ae43c720fc6a6;
    stim[62] = 70'h1c756a63c1c7fd1869;
    stim[63] = 70'h0a93436cb992489aaf;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'h3xxxxxxx3xxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'h47094ec4894c2cd7;
      expv[5] = 64'hfff5d802d9a134a9;
      expv[6] = 64'h1c5826c7de26ccd6;
      expv[7] = 64'hc4f0d893401ec7f0;
      expv[8] = 64'hd03d278f3c3bc874;
      expv[9] = 64'haadcdb461a4345b3;
      expv[10] = 64'hf9a0584769499cb9;
      expv[11] = 64'h2628263582cce587;
      expv[12] = 64'hd4bdaaa5765d69f5;
      expv[13] = 64'h5ea4117d5cb7d515;
      expv[14] = 64'h2ff4afcf8696c6e8;
      expv[15] = 64'h03a55bdfb22978f4;
      expv[16] = 64'hc0715c7d213e5f90;
      expv[17] = 64'h082a0f4184084ea1;
      expv[18] = 64'h160dc05b3db6c9dc;
      expv[19] = 64'hc4058d1a0a7c45db;
      expv[20] = 64'hefe91fd0f33706c8;
      expv[21] = 64'h766fdb006493df6f;
      expv[22] = 64'h2f167c0d8082b358;
      expv[23] = 64'hc60e7bc712edc203;
      expv[24] = 64'hdce7326b1d752410;
      expv[25] = 64'heff51375d7831c7d;
      expv[26] = 64'h6398d0ab06696f79;
      expv[27] = 64'h0650ef5bf2ff2803;
      expv[28] = 64'h79460e2370f5c19a;
      expv[29] = 64'h85e611b284b18cb8;
      expv[30] = 64'hea302126202f889a;
      expv[31] = 64'hc367492b92ef0e81;
      expv[32] = 64'hf6bcabe52c88b1e3;
      expv[33] = 64'hdbc583e072a340c4;
      expv[34] = 64'he300eec26ceba23e;
      expv[35] = 64'h71de149c42fc19ad;
      expv[36] = 64'h820f8fc1b031ef82;
      expv[37] = 64'h7b58b9119d97a56d;
      expv[38] = 64'hccfd6141778cb0ad;
      expv[39] = 64'hbcf42e8f2f9876a2;
      expv[40] = 64'he82b5a29181870e2;
      expv[41] = 64'hc81671093036e0b6;
      expv[42] = 64'he4a6ad1c43a56085;
      expv[43] = 64'h8ce0c244f2f2e8ff;
      expv[44] = 64'h1c3d55c8e9ac9fe6;
      expv[45] = 64'hc12de6922054413a;
      expv[46] = 64'h6f039809ee7efc5b;
      expv[47] = 64'he9c7203cc08c8d97;
      expv[48] = 64'h9d26ac2e0ccf8601;
      expv[49] = 64'h001c192497548096;
      expv[50] = 64'h1f09938a7b61b073;
      expv[51] = 64'h347ef1a1be3bc43b;
      expv[52] = 64'he3503d01ba42b431;
      expv[53] = 64'hc3bed3b6c0bef697;
      expv[54] = 64'h7f674b5575e37f03;
      expv[55] = 64'h916b7fc549d4ef41;
      expv[56] = 64'hfeda14116d198249;
      expv[57] = 64'h25bd2d1de5bdf7d9;
      expv[58] = 64'hbe41851d44811dc3;
      expv[59] = 64'h9b22aad4597ceeec;
      expv[60] = 64'hc7cc25800145bcda;
      expv[61] = 64'h315b57253fb815af;
      expv[62] = 64'h0b47912ef9381a3a;
      expv[63] = 64'h720fc6a6473ae43c;
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
