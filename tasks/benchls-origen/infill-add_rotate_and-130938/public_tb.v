// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130938 dut (
    .a(in_vec[72:41]),
    .b(in_vec[40:9]),
    .rotate_left(in_vec[8:8]),
    .rotate_right(in_vec[7:7]),
    .rotate_amount(in_vec[6:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h0cd9d8776697cf7ad01;
    stim[1] = 73'h108cafe092045fbae13;
    stim[2] = 73'h011c45fc992a802ae6f;
    stim[3] = 73'h065231b54daccd17022;
    stim[4] = 73'h0c6e6930a43115e0b0f;
    stim[5] = 73'h135dff24f0a750944af;
    stim[6] = 73'h1b2d133b724268e5b55;
    stim[7] = 73'h1e2b9a78938c4626189;
    stim[8] = 73'h0224dccc21211b95dd1;
    stim[9] = 73'h072e4b11297d7ab3738;
    stim[10] = 73'h1a982062eef77e2400a;
    stim[11] = 73'h196c7406328aaec8275;
    stim[12] = 73'h1350e3e72896b1d93f6;
    stim[13] = 73'h026ff673c9fcb6802e8;
    stim[14] = 73'h08130b231051ce82f61;
    stim[15] = 73'h05eb57a457b4b071845;
    stim[16] = 73'h0f37ffdb071784b2836;
    stim[17] = 73'h133a4179cc4cad96809;
    stim[18] = 73'h02eabaf71c12c427c41;
    stim[19] = 73'h13e3b7b14796c0e6e7c;
    stim[20] = 73'h068c503f3fd6b16ccb9;
    stim[21] = 73'h05cba238b4bf8b4a485;
    stim[22] = 73'h09602da31427e226f30;
    stim[23] = 73'h011827ce343b617d315;
    stim[24] = 73'h10a0b7b796bd56612e7;
    stim[25] = 73'h121b010ecddc0722641;
    stim[26] = 73'h0b9704465dfc80c6838;
    stim[27] = 73'h030167552f297c9e817;
    stim[28] = 73'h0090fe3b2611b9e43cc;
    stim[29] = 73'h1deeeb0371a4e0c6331;
    stim[30] = 73'h0908d1cfdbda45ef7a0;
    stim[31] = 73'h1de02cb315d020ea757;
    stim[32] = 73'h12c27647c307ddc3b73;
    stim[33] = 73'h1ddb326bfad90ef58dd;
    stim[34] = 73'h0ccaa9ffc53d2eca08f;
    stim[35] = 73'h1622a0c7ea345634e8d;
    stim[36] = 73'h10c7ece929fae326baa;
    stim[37] = 73'h06e553f1d9db1eb0231;
    stim[38] = 73'h047ca3985d56120d8c9;
    stim[39] = 73'h0b8c2ae9f90cfc97c5d;
    stim[40] = 73'h1d8551074d862e21ce3;
    stim[41] = 73'h1071546f3434ae5e41d;
    stim[42] = 73'h0900d977fa941e17e2e;
    stim[43] = 73'h10020d2996524352e0e;
    stim[44] = 73'h1fd355d227debb98c7b;
    stim[45] = 73'h0d099d97c6f58d6490d;
    stim[46] = 73'h0c618512a1b1f1f74ee;
    stim[47] = 73'h04cc899926b6b1260c9;
    stim[48] = 73'h12ef96df755ae87d00d;
    stim[49] = 73'h1e22dbad5122b153cf7;
    stim[50] = 73'h12c8ce2136ac9fd5121;
    stim[51] = 73'h00d6955c715f81a4906;
    stim[52] = 73'h118f9efe0651ff1ec74;
    stim[53] = 73'h1431692f5cdf888596d;
    stim[54] = 73'h0cf4234932a9448ee94;
    stim[55] = 73'h04681d405d23056e931;
    stim[56] = 73'h1546671dba55c19de87;
    stim[57] = 73'h11ceb873d7393465c2f;
    stim[58] = 73'h0d6ed4a85d034e16897;
    stim[59] = 73'h0fe34e6511d9008c078;
    stim[60] = 73'h15ab84844627334a001;
    stim[61] = 73'h125c068a869d1086c5c;
    stim[62] = 73'h0e5a3a11617afce13da;
    stim[63] = 73'h0b76859dcff09192beb;
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
      expv[0] = 32'h13083f01;
      expv[1] = 32'h14887cdb;
      expv[2] = 32'hd236313b;
      expv[3] = 32'h9ff7f662;
      expv[4] = 32'h84414008;
      expv[5] = 32'h00004040;
      expv[6] = 32'h00000000;
      expv[7] = 32'h0c090010;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h4c7cf437;
      expv[11] = 32'h5fb91672;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'hed0040ae;
      expv[16] = 32'hb27c246c;
      expv[17] = 32'hfc377882;
      expv[18] = 32'hf7ebf8f6;
      expv[19] = 32'hdbd3c4c1;
      expv[20] = 32'h00000019;
      expv[21] = 32'h94004800;
      expv[22] = 32'h00000000;
      expv[23] = 32'h0a144208;
      expv[24] = 32'h00000000;
      expv[25] = 32'hffb84189;
      expv[26] = 32'h4c9c2866;
      expv[27] = 32'h91571f9d;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h2718bdf9;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h801c004c;
      expv[35] = 32'h023015a4;
      expv[36] = 32'h00000000;
      expv[37] = 32'h0603950f;
      expv[38] = 32'h00000000;
      expv[39] = 32'h24c93c0d;
      expv[40] = 32'h00000000;
      expv[41] = 32'h2530166b;
      expv[42] = 32'h1ca7bc7e;
      expv[43] = 32'h32a283e3;
      expv[44] = 32'h3d908b57;
      expv[45] = 32'h0af853e2;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h4253fae3;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00200004;
      expv[52] = 32'hbf0cf0e6;
      expv[53] = 32'h00000000;
      expv[54] = 32'hb0e80ec0;
      expv[55] = 32'h00000000;
      expv[56] = 32'h38e14088;
      expv[57] = 32'h483f66cc;
      expv[58] = 32'h020104a6;
      expv[59] = 32'h0de27788;
      expv[60] = 32'hde95be72;
      expv[61] = 32'hc7c8b88a;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
