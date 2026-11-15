// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  phy_tx_b_internal dut (
    .clk1f(clk),
    .clk2f(in_vec[40:40]),
    .clk4f(in_vec[39:39]),
    .clk32f(in_vec[38:38]),
    .reset(in_vec[37:37]),
    .in0(in_vec[36:29]),
    .in1(in_vec[28:21]),
    .in2(in_vec[20:13]),
    .in3(in_vec[12:5]),
    .in_rx_tx(in_vec[4:4]),
    .validmux41(in_vec[3:0]),
    .out_b(out_vec[28:28]),
    .out0_recir(out_vec[27:20]),
    .out1_recir(out_vec[19:12]),
    .out2_recir(out_vec[11:10]),
    .out3_recir(out_vec[9:8]),
    .valid_out_recir(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h137bc563629;
    stim[1] = 41'h1fa438f17d0;
    stim[2] = 41'h10a213897c1;
    stim[3] = 41'h11138f7443b;
    stim[4] = 41'h14e3134b733;
    stim[5] = 41'h18be1e72c94;
    stim[6] = 41'h15ca365cbb7;
    stim[7] = 41'h1574275be84;
    stim[8] = 41'h1935f5c5527;
    stim[9] = 41'h090fc5f6a94;
    stim[10] = 41'h085865f4229;
    stim[11] = 41'h0141c887761;
    stim[12] = 41'h0414d34aa4d;
    stim[13] = 41'h0125c54bc38;
    stim[14] = 41'h04ab2d2c49c;
    stim[15] = 41'h00678c494a5;
    stim[16] = 41'h059e4d3530e;
    stim[17] = 41'h06390ea4eb1;
    stim[18] = 41'h004a941f317;
    stim[19] = 41'h14ca9893a67;
    stim[20] = 41'h0c14437aab4;
    stim[21] = 41'h14dd337f8d1;
    stim[22] = 41'h05c3193d45a;
    stim[23] = 41'h0d4a0e84d1b;
    stim[24] = 41'h15ec0e3c47c;
    stim[25] = 41'h0ca7e52682a;
    stim[26] = 41'h0def4d31b66;
    stim[27] = 41'h01294f37199;
    stim[28] = 41'h11774464d0a;
    stim[29] = 41'h0c0f2cb1c2a;
    stim[30] = 41'h115bf7bc93f;
    stim[31] = 41'h0d22b62ffeb;
    stim[32] = 41'h0d585fab9f4;
    stim[33] = 41'h01f66f45e1b;
    stim[34] = 41'h158b618951f;
    stim[35] = 41'h089193515fb;
    stim[36] = 41'h090e681908f;
    stim[37] = 41'h089c1630064;
    stim[38] = 41'h15e304e0cb6;
    stim[39] = 41'h057981700f8;
    stim[40] = 41'h107e2f12709;
    stim[41] = 41'h1db4a59231b;
    stim[42] = 41'h1c4d99ed2aa;
    stim[43] = 41'h010b0943143;
    stim[44] = 41'h0013f00ed21;
    stim[45] = 41'h05a4b847a97;
    stim[46] = 41'h143a1de4486;
    stim[47] = 41'h10136980eee;
    stim[48] = 41'h1c062da7a91;
    stim[49] = 41'h18b829dfaa2;
    stim[50] = 41'h057d3aec7ae;
    stim[51] = 41'h095d6d760ab;
    stim[52] = 41'h0c62b3b050d;
    stim[53] = 41'h0db69b890f9;
    stim[54] = 41'h182f9a41b68;
    stim[55] = 41'h1446017fd58;
    stim[56] = 41'h05b891cdb59;
    stim[57] = 41'h0c9e7d76454;
    stim[58] = 41'h11046a32725;
    stim[59] = 41'h0d919050b79;
    stim[60] = 41'h1064a7fe5c0;
    stim[61] = 41'h00f42bf33ef;
    stim[62] = 41'h110a4ed7b1c;
    stim[63] = 41'h15d0d59c9aa;
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
      expv[0] = 29'h00000000;
      expv[1] = 29'h00000000;
      expv[2] = 29'h00000000;
      expv[3] = 29'h00000000;
      expv[4] = 29'h189c7901;
      expv[5] = 29'h17189501;
      expv[6] = 29'h05f0f400;
      expv[7] = 29'h1e51b901;
      expv[8] = 29'h1e51b901;
      expv[9] = 29'h1e51b901;
      expv[10] = 29'h087e2c00;
      expv[11] = 29'h087e2c00;
      expv[12] = 29'h087e2c00;
      expv[13] = 29'h087e2c00;
      expv[14] = 29'h092e2500;
      expv[15] = 29'h05596800;
      expv[16] = 29'h05596800;
      expv[17] = 29'h00000000;
      expv[18] = 29'h00000000;
      expv[19] = 29'h1254ac01;
      expv[20] = 29'h1254ac01;
      expv[21] = 29'h00a21500;
      expv[22] = 29'h16e99e01;
      expv[23] = 29'h0e18ca00;
      expv[24] = 29'h1a507801;
      expv[25] = 29'h0f607b00;
      expv[26] = 29'h0f607b00;
      expv[27] = 29'h0f607b00;
      expv[28] = 29'h194a7c01;
      expv[29] = 29'h194a7c01;
      expv[30] = 29'h194a7c01;
      expv[31] = 29'h1adfb901;
      expv[32] = 29'h1adfb901;
      expv[33] = 29'h0ac2f700;
      expv[34] = 29'h1fb37801;
      expv[35] = 29'h1c5b0001;
      expv[36] = 29'h148c9301;
      expv[37] = 29'h148c9301;
      expv[38] = 29'h148c9301;
      expv[39] = 29'h0f182100;
      expv[40] = 29'h0bcc0300;
      expv[41] = 29'h0bcc0300;
      expv[42] = 29'h1da52401;
      expv[43] = 29'h1da52401;
      expv[44] = 29'h1da52401;
      expv[45] = 29'h1da52401;
      expv[46] = 29'h1d25cc01;
      expv[47] = 29'h1d25cc01;
      expv[48] = 29'h1d25cc01;
      expv[49] = 29'h10316c01;
      expv[50] = 29'h10316c01;
      expv[51] = 29'h10316c01;
      expv[52] = 29'h10316c01;
      expv[53] = 29'h10316c01;
      expv[54] = 29'h1db4d301;
      expv[55] = 29'h1db4d301;
      expv[56] = 29'h02300e00;
      expv[57] = 29'h1dc48a01;
      expv[58] = 29'h04f3ee00;
      expv[59] = 29'h04f3ee00;
      expv[60] = 29'h1c8c8301;
      expv[61] = 29'h1c8c8301;
      expv[62] = 29'h1c8c8301;
      expv[63] = 29'h08527c00;
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
