// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031075 dut (
    .clk(clk),
    .rst_n(in_vec[42:42]),
    .data_in_odd(in_vec[41:26]),
    .data_in_even(in_vec[25:10]),
    .line_address(in_vec[9:2]),
    .data_valid(in_vec[1:1]),
    .data_loading(in_vec[0:0]),
    .data_out_odd(out_vec[64:49]),
    .data_out_even(out_vec[48:33]),
    .output_valid(out_vec[32:32]),
    .odd_address(out_vec[31:16]),
    .even_address(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h2d906e6ab16;
    stim[1] = 43'h2ab4984dc63;
    stim[2] = 43'h7dc4194bfa3;
    stim[3] = 43'h6204fcbf623;
    stim[4] = 43'h7510e125b8a;
    stim[5] = 43'h5474e5a0a7b;
    stim[6] = 43'h49db2fb6f0f;
    stim[7] = 43'h509bd8c7c46;
    stim[8] = 43'h4c75386edaa;
    stim[9] = 43'h57d35e13956;
    stim[10] = 43'h504871067b5;
    stim[11] = 43'h47e708d03a5;
    stim[12] = 43'h6b33f47149e;
    stim[13] = 43'h53154ab7cf8;
    stim[14] = 43'h68baa974d58;
    stim[15] = 43'h765d520881e;
    stim[16] = 43'h481fb4a79c0;
    stim[17] = 43'h7e8f1040c01;
    stim[18] = 43'h54d9d925bd3;
    stim[19] = 43'h7e75bec4158;
    stim[20] = 43'h4c2236b1c57;
    stim[21] = 43'h7df2677ea36;
    stim[22] = 43'h5b2864fbeec;
    stim[23] = 43'h6957b2ebbbf;
    stim[24] = 43'h7238a195e17;
    stim[25] = 43'h47b3cfdccf0;
    stim[26] = 43'h4672f1fc723;
    stim[27] = 43'h4eb02aecfe4;
    stim[28] = 43'h404596fa2b8;
    stim[29] = 43'h68f0e8a4e40;
    stim[30] = 43'h5db2fe77ee0;
    stim[31] = 43'h7f1d21aa2ba;
    stim[32] = 43'h42d8f8559b1;
    stim[33] = 43'h5e1bf59ff7a;
    stim[34] = 43'h42e35a8f32f;
    stim[35] = 43'h48bef433133;
    stim[36] = 43'h4dce6916aff;
    stim[37] = 43'h6e816da5f1b;
    stim[38] = 43'h5633c183acd;
    stim[39] = 43'h75684f04ded;
    stim[40] = 43'h5e0719533e4;
    stim[41] = 43'h6031199904e;
    stim[42] = 43'h79e0fdd75db;
    stim[43] = 43'h6c86ab89dd3;
    stim[44] = 43'h6f123765e7c;
    stim[45] = 43'h6683bba98c9;
    stim[46] = 43'h5f945379a8b;
    stim[47] = 43'h76df1e0b877;
    stim[48] = 43'h6d2267ab517;
    stim[49] = 43'h6c1378ce24f;
    stim[50] = 43'h677c58a86c8;
    stim[51] = 43'h40683f6f924;
    stim[52] = 43'h764612b6491;
    stim[53] = 43'h5da97951c73;
    stim[54] = 43'h7708de64934;
    stim[55] = 43'h51166878e04;
    stim[56] = 43'h7ed2c6050a2;
    stim[57] = 43'h42163629bfb;
    stim[58] = 43'h4d9c81bbfa7;
    stim[59] = 43'h561f09468b4;
    stim[60] = 43'h4a44d8ed173;
    stim[61] = 43'h61963b2a791;
    stim[62] = 43'h4ca47d9b1d8;
    stim[63] = 43'h7cdfd5495b9;
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
      expv[0] = 65'hxxxxxxxxxc500c500;
      expv[1] = 65'hxxxxxxxxx18001800;
      expv[2] = 65'hxxxxxxxxxe800e800;
      expv[3] = 65'hxxxxxxxxx88008800;
      expv[4] = 65'hxxxxxxxxxe200e200;
      expv[5] = 65'hxxxxxxxxx9e009e00;
      expv[6] = 65'hxxxxxxxxxc300c300;
      expv[7] = 65'hxxxxxxxxx11001100;
      expv[8] = 65'hxxxxxxxxx6a006a00;
      expv[9] = 65'hxxxxxxxxx55005500;
      expv[10] = 65'hxxxxxxxxxed00ed00;
      expv[11] = 65'hxxxxxxxxxe900e900;
      expv[12] = 65'hxxxxxxxxx27002700;
      expv[13] = 65'hxxxxxxxxx3e003e00;
      expv[14] = 65'hxxxxxxxxx56005600;
      expv[15] = 65'hxxxxxxxxx07000700;
      expv[16] = 65'hxxxxxxxxx70007000;
      expv[17] = 65'hxxxxxxxxx00000000;
      expv[18] = 65'hxxxxxxxxxf400f400;
      expv[19] = 65'hxxxxxxxxx56005600;
      expv[20] = 65'hxxxxxxxxx15001500;
      expv[21] = 65'hxxxxxxxxx8d008d00;
      expv[22] = 65'hxxxxxxxxxbb00bb00;
      expv[23] = 65'hxxxxxxxxxef00ef00;
      expv[24] = 65'hxxxxxxxxx85008500;
      expv[25] = 65'hxxxxxxxxx3c003c00;
      expv[26] = 65'hxxxxxxxxxc800c800;
      expv[27] = 65'hxxxxxxxxxf900f900;
      expv[28] = 65'hxxxxxxxxxae00ae00;
      expv[29] = 65'hxxxxxxxxx90009000;
      expv[30] = 65'hxxxxxxxxxb800b800;
      expv[31] = 65'hxxxxxxxxxae00ae00;
      expv[32] = 65'hxxxxxxxxx6c006c00;
      expv[33] = 65'hxxxxxxxxxde00de00;
      expv[34] = 65'hxxxxxxxxxcb00cb00;
      expv[35] = 65'hxxxxxxxxx4c004c00;
      expv[36] = 65'hxxxxxxxxxbf00bf00;
      expv[37] = 65'hxxxxxxxxxc600c600;
      expv[38] = 65'hxxxxxxxxxb300b300;
      expv[39] = 65'hxxxxxxxxx7b007b00;
      expv[40] = 65'hxxxxxxxxxf900f900;
      expv[41] = 65'hxxxxxxxxx13001300;
      expv[42] = 65'hxxxxxxxxx76007600;
      expv[43] = 65'hxxxxxxxxx74007400;
      expv[44] = 65'hxxxxxxxxx9f009f00;
      expv[45] = 65'hxxxxxxxxx32003200;
      expv[46] = 65'hxxxxxxxxxa200a200;
      expv[47] = 65'hxxxxxxxxx1d001d00;
      expv[48] = 65'hxxxxxxxxx45004500;
      expv[49] = 65'hxxxxxxxxx93009300;
      expv[50] = 65'hxxxxxxxxxb200b200;
      expv[51] = 65'hxxxxxxxxx49004900;
      expv[52] = 65'hxxxxxxxxx24002400;
      expv[53] = 65'hxxxxxxxxx1c001c00;
      expv[54] = 65'hxxxxxxxxx4d004d00;
      expv[55] = 65'hxxxxxxxxx81008100;
      expv[56] = 65'hxxxxxxxxx28002800;
      expv[57] = 65'hxxxxxxxxxfe00fe00;
      expv[58] = 65'hxxxxxxxxxe900e900;
      expv[59] = 65'hxxxxxxxxx2d002d00;
      expv[60] = 65'hxxxxxxxxx5c005c00;
      expv[61] = 65'hxxxxxxxxxe400e400;
      expv[62] = 65'hxxxxxxxxx76007600;
      expv[63] = 65'hxxxxxxxxx6e006e00;
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
