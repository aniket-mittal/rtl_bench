// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098345 dut (
    .clk_i(clk),
    .rst_i(in_vec[70:70]),
    .debug_pc_i(in_vec[69:38]),
    .debug_wena_i(in_vec[37:37]),
    .debug_wd_i(in_vec[36:32]),
    .debug_wdata_i(in_vec[31:0]),
    .debug_wb_pc_o(out_vec[72:41]),
    .debug_wb_rf_wen_o(out_vec[40:37]),
    .debug_wb_rf_wnum_o(out_vec[36:32]),
    .debug_wb_rf_wdata_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h4e4b59833005ee7b9d;
    stim[1] = 71'h57fd3f73e48087a9f4;
    stim[2] = 71'h10fb595a238c0bb197;
    stim[3] = 71'h2d7b1783bb2ccfda3f;
    stim[4] = 71'h099daddac9e1b5a875;
    stim[5] = 71'h05fbe45a008991848d;
    stim[6] = 71'h1e375c81b1fe532b92;
    stim[7] = 71'h27e1280ebf3791a124;
    stim[8] = 71'h278c3ed3b6c3cf7024;
    stim[9] = 71'h1ab541ae5827d56e66;
    stim[10] = 71'h0fc1a394a8af2df5f1;
    stim[11] = 71'h325ac7a8e1ac819e25;
    stim[12] = 71'h3ada0c72a8223b17bf;
    stim[13] = 71'h1af4bad2fbcd19ea73;
    stim[14] = 71'h075505d31b5da8623b;
    stim[15] = 71'h1a1fe1328b2706dfd5;
    stim[16] = 71'h0a6c4ff941b3fefe49;
    stim[17] = 71'h336417a7f5f202b399;
    stim[18] = 71'h226b8f2b940fc4f863;
    stim[19] = 71'h2f7cae46d90fd56b14;
    stim[20] = 71'h3740a9cbf6dd3efd5e;
    stim[21] = 71'h1cff5fb429ed02bba4;
    stim[22] = 71'h3b66bb31241537d971;
    stim[23] = 71'h11b54d00a9ec6146a0;
    stim[24] = 71'h1270fcf829852a23ec;
    stim[25] = 71'h07f75f39f5e50361eb;
    stim[26] = 71'h03199aa058f7a897a6;
    stim[27] = 71'h12fd9e427a6be4103f;
    stim[28] = 71'h1c2730a4ace1e68ab5;
    stim[29] = 71'h246455e70d04132071;
    stim[30] = 71'h09be7556dcd5aab63e;
    stim[31] = 71'h379b8cb2e889d8f8ce;
    stim[32] = 71'h6e5d7b3e807afd002c;
    stim[33] = 71'h00ee2454f127983b7f;
    stim[34] = 71'h36ba177606fa87bd06;
    stim[35] = 71'h18aeaa736ee3a4905b;
    stim[36] = 71'h0fbd76fbbfe186bf09;
    stim[37] = 71'h252010f89990e231c2;
    stim[38] = 71'h241e5294fde6292512;
    stim[39] = 71'h0c635640fe683be9da;
    stim[40] = 71'h0491bb59baf833d85a;
    stim[41] = 71'h20bfb4bd87dd0677c5;
    stim[42] = 71'h386452d1d05d18d7e9;
    stim[43] = 71'h0f218f8564b90b2d9a;
    stim[44] = 71'h0d242c1481c935be54;
    stim[45] = 71'h0c8eebf270b51272db;
    stim[46] = 71'h605df30720eb4496b0;
    stim[47] = 71'h070fd9893d5c400d53;
    stim[48] = 71'h052696b3b1326b93d1;
    stim[49] = 71'h13b3795446209a9580;
    stim[50] = 71'h26b7cc14287673ef7a;
    stim[51] = 71'h245b9dbd51867027ce;
    stim[52] = 71'h0a65eed66dd6b0db16;
    stim[53] = 71'h20c46e78dddbab4965;
    stim[54] = 71'h0bc801c6adc58fb531;
    stim[55] = 71'h2bf02ee11c3cfbf4a7;
    stim[56] = 71'h1e92b71f4ae100d2c3;
    stim[57] = 71'h1b89c117faec545f81;
    stim[58] = 71'h378df50db41fb1a01d;
    stim[59] = 71'h3704361d68f8169885;
    stim[60] = 71'h35905a1e22754a4f0d;
    stim[61] = 71'h1aa643acdf686a595a;
    stim[62] = 71'h008f97388b13658a9a;
    stim[63] = 71'h2aa6105af4dc19d040;
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
      expv[0] = 73'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h087dacad1e38c0bb197;
      expv[4] = 73'h16bd8bc1dfb2ccfda3f;
      expv[5] = 73'h04ced6ed609e1b5a875;
      expv[6] = 73'h02fdf22d0008991848d;
      expv[7] = 73'h0f1bae40df1fe532b92;
      expv[8] = 73'h13f094075ff3791a124;
      expv[9] = 73'h13c61f69df6c3cf7024;
      expv[10] = 73'h0d5aa0d721827d56e66;
      expv[11] = 73'h07e0d1ca5e8af2df5f1;
      expv[12] = 73'h192d63d47e1ac819e25;
      expv[13] = 73'h1d6d06395e8223b17bf;
      expv[14] = 73'h0d7a5d697fbcd19ea73;
      expv[15] = 73'h03aa82e981b5da8623b;
      expv[16] = 73'h0d0ff09940b2706dfd5;
      expv[17] = 73'h053627fca01b3fefe49;
      expv[18] = 73'h19b20bd3ff5f202b399;
      expv[19] = 73'h1135c795c140fc4f863;
      expv[20] = 73'h17be57236190fd56b14;
      expv[21] = 73'h1ba054e5ff6dd3efd5e;
      expv[22] = 73'h0e7fafda1e9ed02bba4;
      expv[23] = 73'h1db35d989e41537d971;
      expv[24] = 73'h08daa6805e9ec6146a0;
      expv[25] = 73'h09387e7c1e9852a23ec;
      expv[26] = 73'h03fbaf9cff5e50361eb;
      expv[27] = 73'h018ccd50218f7a897a6;
      expv[28] = 73'h097ecf213fa6be4103f;
      expv[29] = 73'h0e1398525ece1e68ab5;
      expv[30] = 73'h12322af380d04132071;
      expv[31] = 73'h04df3aab61cd5aab63e;
      expv[32] = 73'h1bcdc6597e889d8f8ce;
      expv[33] = 73'h0000000000000000000;
      expv[34] = 73'h0077122a7f127983b7f;
      expv[35] = 73'h1b5d0bbb006fa87bd06;
      expv[36] = 73'h0c575539beee3a4905b;
      expv[37] = 73'h07debb7ddffe186bf09;
      expv[38] = 73'h1290087c41990e231c2;
      expv[39] = 73'h120f294a7fde6292512;
      expv[40] = 73'h0631ab207fe683be9da;
      expv[41] = 73'h0248ddacdfaf833d85a;
      expv[42] = 73'h105fda5ec07dd0677c5;
      expv[43] = 73'h1c322968e105d18d7e9;
      expv[44] = 73'h0790c7c2be4b90b2d9a;
      expv[45] = 73'h0692160a401c935be54;
      expv[46] = 73'h064775f93f0b51272db;
      expv[47] = 73'h0000000000000000000;
      expv[48] = 73'h0387ecc49fd5c400d53;
      expv[49] = 73'h02934b59df1326b93d1;
      expv[50] = 73'h09d9bcaa206209a9580;
      expv[51] = 73'h135be60a1e87673ef7a;
      expv[52] = 73'h122dcedea11867027ce;
      expv[53] = 73'h0532f76b3edd6b0db16;
      expv[54] = 73'h1062373c61ddbab4965;
      expv[55] = 73'h05e400e35edc58fb531;
      expv[56] = 73'h15f8177081c3cfbf4a7;
      expv[57] = 73'h0f495b8fa0ae100d2c3;
      expv[58] = 73'h0dc4e08bffaec545f81;
      expv[59] = 73'h1bc6fa86df41fb1a01d;
      expv[60] = 73'h1b821b0ebe8f8169885;
      expv[61] = 73'h1ac82d0f1e2754a4f0d;
      expv[62] = 73'h0d5321d661f686a595a;
      expv[63] = 73'h0047cb9c40b13658a9a;
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
