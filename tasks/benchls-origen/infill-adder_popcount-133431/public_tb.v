// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133431 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hc0b2360e1e4c07a3;
    stim[1] = 64'hbda38055dc3adeb9;
    stim[2] = 64'h47e9a1da35d685f5;
    stim[3] = 64'hdf48652af3aef53a;
    stim[4] = 64'h2374a2aec7f4cae2;
    stim[5] = 64'h87f2e93ebf471fe5;
    stim[6] = 64'hdfe584e37a74d6cd;
    stim[7] = 64'hf0762e870a9464f5;
    stim[8] = 64'h3bc9df8752b7a781;
    stim[9] = 64'hf17f0a14c1b10cf1;
    stim[10] = 64'he50c8ad1d8ec8c2d;
    stim[11] = 64'h074714aa056adcad;
    stim[12] = 64'h2a6f7a350ffd790f;
    stim[13] = 64'h9ae8180ca7933d68;
    stim[14] = 64'h49cf6b0993c3a2ea;
    stim[15] = 64'h9281bf11e97130e4;
    stim[16] = 64'hd4f3863b25ac2003;
    stim[17] = 64'hd3998f16a34384e6;
    stim[18] = 64'h099abbdde6fa08f2;
    stim[19] = 64'hc437e1bc382ce460;
    stim[20] = 64'hec12e8e1a2ceab33;
    stim[21] = 64'h9efe683aedebdecf;
    stim[22] = 64'h8b0ed0ad20620d64;
    stim[23] = 64'he7e2f045b46e4494;
    stim[24] = 64'ha6c191401f72024d;
    stim[25] = 64'h3af377fe6767dd09;
    stim[26] = 64'h40abbde2e9b52468;
    stim[27] = 64'hff4f4e75d81b994e;
    stim[28] = 64'h9453417770d71251;
    stim[29] = 64'hd6cc5b69058f72bc;
    stim[30] = 64'h4455afd2b4e5db3a;
    stim[31] = 64'h51643e6b16d794f3;
    stim[32] = 64'h5e9d06a3a5e19677;
    stim[33] = 64'h4dc424da302f732e;
    stim[34] = 64'h8f6f4ec77d759250;
    stim[35] = 64'hab37aae3ac6d2f9d;
    stim[36] = 64'h87cae3f4ff601c2c;
    stim[37] = 64'h817f21d907ea7d86;
    stim[38] = 64'h25f925ccc232d4e2;
    stim[39] = 64'h5034ed9ee09482d2;
    stim[40] = 64'h97c2c8d423c6d543;
    stim[41] = 64'h6870e3b5f99c9fdb;
    stim[42] = 64'h51e9b3f83963a042;
    stim[43] = 64'hfb0938fe8875112d;
    stim[44] = 64'h88ff52755e283455;
    stim[45] = 64'hcb35d4d5cbdfe260;
    stim[46] = 64'hf9679f04d7c5bc62;
    stim[47] = 64'hda7d4c3a9ec62b21;
    stim[48] = 64'h50882037f356f137;
    stim[49] = 64'h6e3f885cfb4d20b9;
    stim[50] = 64'h54eddc929ef07335;
    stim[51] = 64'h91d978c30ade131f;
    stim[52] = 64'h611b41cefd456265;
    stim[53] = 64'h266a6e0920ca12a3;
    stim[54] = 64'h6d389cff3f804147;
    stim[55] = 64'h701130e4d1808fdd;
    stim[56] = 64'heec4b1912b95c6e7;
    stim[57] = 64'hd99ab6f39671e5c6;
    stim[58] = 64'h21a6329d1f1a4e27;
    stim[59] = 64'h3214835cc20a2bff;
    stim[60] = 64'h9665895c6e0f3611;
    stim[61] = 64'hc56314f020804da0;
    stim[62] = 64'h944f8a7586990c70;
    stim[63] = 64'h84f3a8177493f7ef;
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
      expv[0] = 8'ha7;
      expv[1] = 8'h1d;
      expv[2] = 8'hdd;
      expv[3] = 8'h76;
      expv[4] = 8'h81;
      expv[5] = 8'h2e;
      expv[6] = 8'ha0;
      expv[7] = 8'h6e;
      expv[8] = 8'h03;
      expv[9] = 8'h08;
      expv[10] = 8'he8;
      expv[11] = 8'h47;
      expv[12] = 8'h54;
      expv[13] = 8'h64;
      expv[14] = 8'he0;
      expv[15] = 8'hed;
      expv[16] = 8'h2b;
      expv[17] = 8'he8;
      expv[18] = 8'hdf;
      expv[19] = 8'h0c;
      expv[20] = 8'h19;
      expv[21] = 8'h07;
      expv[22] = 8'h01;
      expv[23] = 8'hd6;
      expv[24] = 8'h9d;
      expv[25] = 8'h08;
      expv[26] = 8'h46;
      expv[27] = 8'hd7;
      expv[28] = 8'hc4;
      expv[29] = 8'h37;
      expv[30] = 8'h1d;
      expv[31] = 8'h4c;
      expv[32] = 8'h15;
      expv[33] = 8'h18;
      expv[34] = 8'h19;
      expv[35] = 8'h8e;
      expv[36] = 8'h29;
      expv[37] = 8'h4c;
      expv[38] = 8'hbd;
      expv[39] = 8'h7c;
      expv[40] = 8'h05;
      expv[41] = 8'h9b;
      expv[42] = 8'h35;
      expv[43] = 8'h3b;
      expv[44] = 8'hdb;
      expv[45] = 8'h27;
      expv[46] = 8'h77;
      expv[47] = 8'h48;
      expv[48] = 8'h7f;
      expv[49] = 8'h1b;
      expv[50] = 8'hd1;
      expv[51] = 8'hf0;
      expv[52] = 8'h3d;
      expv[53] = 8'ha0;
      expv[54] = 8'h57;
      expv[55] = 8'hcb;
      expv[56] = 8'h77;
      expv[57] = 8'hb7;
      expv[58] = 8'hc3;
      expv[59] = 8'h4f;
      expv[60] = 8'h7c;
      expv[61] = 8'h9f;
      expv[62] = 8'hf5;
      expv[63] = 8'h08;
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
