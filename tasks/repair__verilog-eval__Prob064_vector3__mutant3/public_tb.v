// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h2a292127;
    stim[1] = 30'h2a14b458;
    stim[2] = 30'h3254e484;
    stim[3] = 30'h09ddff5e;
    stim[4] = 30'h3bfc30cc;
    stim[5] = 30'h3c20f979;
    stim[6] = 30'h210abae0;
    stim[7] = 30'h3aaa3c09;
    stim[8] = 30'h19593b93;
    stim[9] = 30'h0ddaddc4;
    stim[10] = 30'h199e8734;
    stim[11] = 30'h1844df96;
    stim[12] = 30'h0b4281a3;
    stim[13] = 30'h07aa9d7b;
    stim[14] = 30'h07b3c6f6;
    stim[15] = 30'h24ac85e5;
    stim[16] = 30'h25ecbe6f;
    stim[17] = 30'h0cec398e;
    stim[18] = 30'h3070d01a;
    stim[19] = 30'h349f5549;
    stim[20] = 30'h2b88c3f2;
    stim[21] = 30'h13e7f677;
    stim[22] = 30'h030235e0;
    stim[23] = 30'h344df352;
    stim[24] = 30'h27135cc5;
    stim[25] = 30'h3067b3f5;
    stim[26] = 30'h127e45b7;
    stim[27] = 30'h1d5999fd;
    stim[28] = 30'h01cd742e;
    stim[29] = 30'h1f97c054;
    stim[30] = 30'h2aa8cede;
    stim[31] = 30'h1f390b39;
    stim[32] = 30'h24cc7b28;
    stim[33] = 30'h2992b376;
    stim[34] = 30'h34a138fc;
    stim[35] = 30'h06b7b958;
    stim[36] = 30'h2962e5c4;
    stim[37] = 30'h385ec550;
    stim[38] = 30'h1f373198;
    stim[39] = 30'h2ae153c4;
    stim[40] = 30'h24e89d3d;
    stim[41] = 30'h2c814630;
    stim[42] = 30'h00fd68fc;
    stim[43] = 30'h09651796;
    stim[44] = 30'h300f3b4c;
    stim[45] = 30'h2c26df08;
    stim[46] = 30'h029afb3a;
    stim[47] = 30'h012ab652;
    stim[48] = 30'h34e71bf3;
    stim[49] = 30'h19492974;
    stim[50] = 30'h3c3645d3;
    stim[51] = 30'h203f8d3e;
    stim[52] = 30'h1f357a69;
    stim[53] = 30'h24fb5885;
    stim[54] = 30'h101ce1b7;
    stim[55] = 30'h002f9222;
    stim[56] = 30'h2b29523a;
    stim[57] = 30'h2ef1b645;
    stim[58] = 30'h106185bb;
    stim[59] = 30'h313aa3d4;
    stim[60] = 30'h11a78155;
    stim[61] = 30'h2e4f3d3b;
    stim[62] = 30'h19cc26db;
    stim[63] = 30'h1d36cbc6;
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
      expv[0] = 32'ha89a849f;
      expv[1] = 32'ha86cd163;
      expv[2] = 32'hc96d9213;
      expv[3] = 32'h2749fd7b;
      expv[4] = 32'hefcec333;
      expv[5] = 32'hf0bde5e7;
      expv[6] = 32'h8414eb83;
      expv[7] = 32'hea96f027;
      expv[8] = 32'h655aee4f;
      expv[9] = 32'h37557713;
      expv[10] = 32'h66441cd3;
      expv[11] = 32'h612d7e5b;
      expv[12] = 32'h2d34068f;
      expv[13] = 32'h1e9475ef;
      expv[14] = 32'h1ef11bdb;
      expv[15] = 32'h928c1797;
      expv[16] = 32'h978cf9bf;
      expv[17] = 32'h338ee63b;
      expv[18] = 32'hc1fd406b;
      expv[19] = 32'hd2435527;
      expv[20] = 32'hae1d0fcb;
      expv[21] = 32'h4fa1d9df;
      expv[22] = 32'h0c36d783;
      expv[23] = 32'hd109cd4b;
      expv[24] = 32'h9c737317;
      expv[25] = 32'hc1a0cfd7;
      expv[26] = 32'h49c716df;
      expv[27] = 32'h755867f7;
      expv[28] = 32'h070bd0bb;
      expv[29] = 32'h7e610153;
      expv[30] = 32'haa9d3b7b;
      expv[31] = 32'h7cda2ce7;
      expv[32] = 32'h930feca3;
      expv[33] = 32'ha674cddb;
      expv[34] = 32'hd2bae3f3;
      expv[35] = 32'h1ae0e563;
      expv[36] = 32'ha5b59713;
      expv[37] = 32'he1451543;
      expv[38] = 32'h7ce2c663;
      expv[39] = 32'habbb4f13;
      expv[40] = 32'h939c74f7;
      expv[41] = 32'hb23b18c3;
      expv[42] = 32'h03cba3f3;
      expv[43] = 32'h25aa5e5b;
      expv[44] = 32'hc002ed33;
      expv[45] = 32'hb0a57c23;
      expv[46] = 32'h0a55eceb;
      expv[47] = 32'h0494d94b;
      expv[48] = 32'hd3a26fcf;
      expv[49] = 32'h651aa5d3;
      expv[50] = 32'hf0e7174f;
      expv[51] = 32'h80c034fb;
      expv[52] = 32'h7cebe9a7;
      expv[53] = 32'h93d36217;
      expv[54] = 32'h404d86df;
      expv[55] = 32'h0080488b;
      expv[56] = 32'hac9b48eb;
      expv[57] = 32'hbbf8d917;
      expv[58] = 32'h41b816ef;
      expv[59] = 32'hc4d48f53;
      expv[60] = 32'h46a00557;
      expv[61] = 32'hb902f4ef;
      expv[62] = 32'h670e9b6f;
      expv[63] = 32'h74e52f1b;
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
