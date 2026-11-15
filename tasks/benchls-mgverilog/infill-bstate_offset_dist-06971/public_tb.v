// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06971 dut (
    .b_state_i(in_vec[33:14]),
    .b_num_i(in_vec[13:1]),
    .data_valid_i(in_vec[0:0]),
    .b_offset_o(out_vec[27:25]),
    .b_distortion_o(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0237767d2;
    stim[1] = 34'h2ca620438;
    stim[2] = 34'h2cd1e6bc4;
    stim[3] = 34'h367389608;
    stim[4] = 34'h37857534b;
    stim[5] = 34'h1b8aa4b40;
    stim[6] = 34'h005343b79;
    stim[7] = 34'h1f2a7579e;
    stim[8] = 34'h108252b20;
    stim[9] = 34'h1d2afa170;
    stim[10] = 34'h1b153e372;
    stim[11] = 34'h3663315e7;
    stim[12] = 34'h319df7f6c;
    stim[13] = 34'h09a05595e;
    stim[14] = 34'h22a922f3d;
    stim[15] = 34'h268f1ecb7;
    stim[16] = 34'h3c0bc5a4e;
    stim[17] = 34'h117fc5161;
    stim[18] = 34'h386ffd92a;
    stim[19] = 34'h2a566acb4;
    stim[20] = 34'h38a060366;
    stim[21] = 34'h2c104e86f;
    stim[22] = 34'h3b270cda5;
    stim[23] = 34'h1e3cadb38;
    stim[24] = 34'h2444b8fa4;
    stim[25] = 34'h2a1b89b8c;
    stim[26] = 34'h05f41e27d;
    stim[27] = 34'h3ae518680;
    stim[28] = 34'h00af86110;
    stim[29] = 34'h3d2ba51ca;
    stim[30] = 34'h209a8d3d3;
    stim[31] = 34'h325b2f65b;
    stim[32] = 34'h2eea66ee9;
    stim[33] = 34'h3ee747977;
    stim[34] = 34'h13b794d40;
    stim[35] = 34'h1dcfb86fb;
    stim[36] = 34'h35add1133;
    stim[37] = 34'h0d567aa18;
    stim[38] = 34'h25cddfa1e;
    stim[39] = 34'h05bd75b0e;
    stim[40] = 34'h1745802d3;
    stim[41] = 34'h10a97ee4d;
    stim[42] = 34'h338627113;
    stim[43] = 34'h2e7189fbb;
    stim[44] = 34'h2ab28eeb0;
    stim[45] = 34'h1460fcf77;
    stim[46] = 34'h34008f762;
    stim[47] = 34'h0e83fd707;
    stim[48] = 34'h20d1ac65a;
    stim[49] = 34'h23ec340a5;
    stim[50] = 34'h2d74cada5;
    stim[51] = 34'h198c8d852;
    stim[52] = 34'h3198e5767;
    stim[53] = 34'h36379e8e9;
    stim[54] = 34'h33cfc2181;
    stim[55] = 34'h3411e5ab7;
    stim[56] = 34'h355aa386d;
    stim[57] = 34'h0a9fd9ea4;
    stim[58] = 34'h24ec1ef58;
    stim[59] = 34'h10fe6ea1e;
    stim[60] = 34'h0b5462f21;
    stim[61] = 34'h375748f90;
    stim[62] = 34'h067fe7d50;
    stim[63] = 34'h1d61a60ef;
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
      expv[0] = 28'h0000000;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h0000000;
      expv[4] = 28'hbf39efb;
      expv[5] = 28'h0000000;
      expv[6] = 28'h0000000;
      expv[7] = 28'h0000000;
      expv[8] = 28'h0000000;
      expv[9] = 28'h0000000;
      expv[10] = 28'h0000000;
      expv[11] = 28'hbf1f753;
      expv[12] = 28'h0000000;
      expv[13] = 28'h0000000;
      expv[14] = 28'hbd4d23e;
      expv[15] = 28'hbda9fdd;
      expv[16] = 28'h0000000;
      expv[17] = 28'h7e60e8a;
      expv[18] = 28'h0000000;
      expv[19] = 28'h0000000;
      expv[20] = 28'h0000000;
      expv[21] = 28'hbe2ce61;
      expv[22] = 28'hbf8f7f4;
      expv[23] = 28'h0000000;
      expv[24] = 28'h0000000;
      expv[25] = 28'h0000000;
      expv[26] = 28'h7f7ad04;
      expv[27] = 28'h0000000;
      expv[28] = 28'h0000000;
      expv[29] = 28'h0000000;
      expv[30] = 28'hbd14103;
      expv[31] = 28'hbec7d57;
      expv[32] = 28'hbe732aa;
      expv[33] = 28'hdff5a30;
      expv[34] = 28'h0000000;
      expv[35] = 28'h7d367d1;
      expv[36] = 28'hbf0d219;
      expv[37] = 28'h0000000;
      expv[38] = 28'h0000000;
      expv[39] = 28'h0000000;
      expv[40] = 28'h7dd2471;
      expv[41] = 28'h7e7d21c;
      expv[42] = 28'hbee2607;
      expv[43] = 28'hbe63911;
      expv[44] = 28'h0000000;
      expv[45] = 28'h7e1b419;
      expv[46] = 28'h0000000;
      expv[47] = 28'h7eaa1a1;
      expv[48] = 28'h0000000;
      expv[49] = 28'hbd5e530;
      expv[50] = 28'hbe4fc8e;
      expv[51] = 28'h0000000;
      expv[52] = 28'hbeacea1;
      expv[53] = 28'hbf20b7e;
      expv[54] = 28'hbee4e60;
      expv[55] = 28'hbee9309;
      expv[56] = 28'hbf105d6;
      expv[57] = 28'h0000000;
      expv[58] = 28'h0000000;
      expv[59] = 28'h0000000;
      expv[60] = 28'h7efd580;
      expv[61] = 28'h0000000;
      expv[62] = 28'h0000000;
      expv[63] = 28'h7d481b9;
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
