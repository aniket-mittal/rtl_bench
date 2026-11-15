// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05521 dut (
    .CLK(clk),
    .SNES_ADDR(in_vec[72:49]),
    .SNES_ROMSEL(in_vec[48:48]),
    .SAVERAM_MASK(in_vec[47:24]),
    .ROM_MASK(in_vec[23:0]),
    .ROM_ADDR(out_vec[26:3]),
    .ROM_HIT(out_vec[2:2]),
    .IS_SAVERAM(out_vec[1:1]),
    .IS_ROM(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h0dbf327e23417cc198c;
    stim[1] = 73'h146f4d5c2c709df4736;
    stim[2] = 73'h12f0ea985a119fa236c;
    stim[3] = 73'h13c00d46e5581788960;
    stim[4] = 73'h0b3de7298bf21ddcc20;
    stim[5] = 73'h0e8ad5818481a8edd4b;
    stim[6] = 73'h0ff4945d6dfd6681572;
    stim[7] = 73'h09cdf3f2fc3d862e4d7;
    stim[8] = 73'h1744603c387430c7045;
    stim[9] = 73'h17c3bf2e0e2c83b534e;
    stim[10] = 73'h019c894f2bd6c216184;
    stim[11] = 73'h09df9db517ca24809d0;
    stim[12] = 73'h158058b7a9d66cf62c6;
    stim[13] = 73'h18c4db72d84d91f218c;
    stim[14] = 73'h0885d2bcd0f443311ce;
    stim[15] = 73'h07d68123427ec99eee2;
    stim[16] = 73'h015ac14b1367d3bd22b;
    stim[17] = 73'h0bfda05345a8866f2b9;
    stim[18] = 73'h1cc3608a7e40e10007b;
    stim[19] = 73'h1c527206d1bc44888c6;
    stim[20] = 73'h0bf408e1343b86c555b;
    stim[21] = 73'h18b26405754b2ed690e;
    stim[22] = 73'h1d73dee5a606197b1b0;
    stim[23] = 73'h17f8765bfd727f62bae;
    stim[24] = 73'h1c95466317e4144fada;
    stim[25] = 73'h1c9abd273219a301ab7;
    stim[26] = 73'h0ecb22b45a44e561e06;
    stim[27] = 73'h136bfeafaf40c06f692;
    stim[28] = 73'h0cd96b528f40d13ece8;
    stim[29] = 73'h11764d2115349b008d4;
    stim[30] = 73'h0b5880c2a02170898cf;
    stim[31] = 73'h10ba5b3e638e0d6f8b6;
    stim[32] = 73'h0244ee53ceb92c36dcd;
    stim[33] = 73'h120db80ee00a83be0da;
    stim[34] = 73'h12a92ef5651ba974b6a;
    stim[35] = 73'h16f3e4cd22106f577df;
    stim[36] = 73'h04bbf29cc45dd39b4a2;
    stim[37] = 73'h0aa5168fc6676a71574;
    stim[38] = 73'h0d26aee343f7cd5634c;
    stim[39] = 73'h1cd86bf973075177d67;
    stim[40] = 73'h1e332c7dbbae732d0b7;
    stim[41] = 73'h0dedfc1757dbc287386;
    stim[42] = 73'h0579df18f700fb48372;
    stim[43] = 73'h1ef0f3a0c4a7242bc63;
    stim[44] = 73'h03c4973f22bb6b0fc8d;
    stim[45] = 73'h17cab78511c8611b2ac;
    stim[46] = 73'h1fb6a233739f5de70f4;
    stim[47] = 73'h1d940bd66ee8440ce6f;
    stim[48] = 73'h03f968e0dd2def7a185;
    stim[49] = 73'h18445042e217bd875d4;
    stim[50] = 73'h06b0f181e8d6eb599f9;
    stim[51] = 73'h1e3c25f3d38f752bd38;
    stim[52] = 73'h129167876ad04c47dc5;
    stim[53] = 73'h16ba7c0173336a60ec3;
    stim[54] = 73'h00dbcc815dcadf9631a;
    stim[55] = 73'h1da91d368d08e98cd3d;
    stim[56] = 73'h0d3f2f99874487ebffc;
    stim[57] = 73'h03f5a5fda82475f6ffb;
    stim[58] = 73'h1d304691072b1dd14eb;
    stim[59] = 73'h10090a9763ae8115053;
    stim[60] = 73'h0d5bfc74ef17992aade;
    stim[61] = 73'h17f140a8f32fbcee4bc;
    stim[62] = 73'h0d0f1a26b84740e0343;
    stim[63] = 73'h0f012ae5248ef0b65ec;
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
      expv[0] = 27'h060cc00;
      expv[1] = 27'h61a1110;
      expv[2] = 27'h6901a20;
      expv[3] = 27'h6c00305;
      expv[4] = 27'h0ce6105;
      expv[5] = 27'h622a045;
      expv[6] = 27'h1402110;
      expv[7] = 27'h01324b8;
      expv[8] = 27'h6410008;
      expv[9] = 27'h7d08a45;
      expv[10] = 27'h6030005;
      expv[11] = 27'h0404600;
      expv[12] = 27'h6601620;
      expv[13] = 27'h6310440;
      expv[14] = 27'h6000420;
      expv[15] = 27'h6c52005;
      expv[16] = 27'h6569055;
      expv[17] = 27'h0370000;
      expv[18] = 27'h6000005;
      expv[19] = 27'h0040405;
      expv[20] = 27'h060021d;
      expv[21] = 27'h0280805;
      expv[22] = 27'h61c8585;
      expv[23] = 27'h7b01d10;
      expv[24] = 27'h0255095;
      expv[25] = 27'h700850d;
      expv[26] = 27'h0b0c020;
      expv[27] = 27'h612b485;
      expv[28] = 27'h6164240;
      expv[29] = 27'h6000205;
      expv[30] = 27'h6440035;
      expv[31] = 27'h6268480;
      expv[32] = 27'h6112a00;
      expv[33] = 27'h6830605;
      expv[34] = 27'h6aa4b10;
      expv[35] = 27'h7a8b835;
      expv[36] = 27'h70ca400;
      expv[37] = 27'h62801a5;
      expv[38] = 27'h0090a25;
      expv[39] = 27'h6320a38;
      expv[40] = 27'h7848118;
      expv[41] = 27'h7431c00;
      expv[42] = 27'h7041380;
      expv[43] = 27'h014200d;
      expv[44] = 27'h6812448;
      expv[45] = 27'h6808565;
      expv[46] = 27'h0e18080;
      expv[47] = 27'h0040270;
      expv[48] = 27'h6bc082d;
      expv[49] = 27'h0010405;
      expv[50] = 27'h7ac0c45;
      expv[51] = 27'h0850940;
      expv[52] = 27'h6204825;
      expv[53] = 27'h7201605;
      expv[54] = 27'h6021005;
      expv[55] = 27'h6424148;
      expv[56] = 27'h145cbe0;
      expv[57] = 27'h6f96958;
      expv[58] = 27'h0480100;
      expv[59] = 27'h6020280;
      expv[60] = 27'h6145610;
      expv[61] = 27'h6740025;
      expv[62] = 27'h640020d;
      expv[63] = 27'h6400a25;
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
