// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  addsub dut (
    .sub(in_vec[32:32]),
    .a(in_vec[31:16]),
    .b(in_vec[15:0]),
    .o(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h02d10bf54;
    stim[1] = 33'h032c3cf74;
    stim[2] = 33'h0b76e0543;
    stim[3] = 33'h1bc074ede;
    stim[4] = 33'h041d4b08b;
    stim[5] = 33'h079c24c0c;
    stim[6] = 33'h18483308b;
    stim[7] = 33'h1e1c32191;
    stim[8] = 33'h077a6861a;
    stim[9] = 33'h190bdf3bc;
    stim[10] = 33'h05014fef2;
    stim[11] = 33'h155535965;
    stim[12] = 33'h0876b7d84;
    stim[13] = 33'h19ec319a2;
    stim[14] = 33'h1ecd0da5d;
    stim[15] = 33'h153a9adf2;
    stim[16] = 33'h171e06832;
    stim[17] = 33'h13ed97b61;
    stim[18] = 33'h02b66f63b;
    stim[19] = 33'h16d2bda01;
    stim[20] = 33'h069ecba40;
    stim[21] = 33'h0ea78ca9f;
    stim[22] = 33'h011ea02b7;
    stim[23] = 33'h12a49946a;
    stim[24] = 33'h02178aff3;
    stim[25] = 33'h09a5155ed;
    stim[26] = 33'h17d2cd339;
    stim[27] = 33'h1667d9378;
    stim[28] = 33'h0c62d42b1;
    stim[29] = 33'h04c5a2bb2;
    stim[30] = 33'h19676c465;
    stim[31] = 33'h15a441241;
    stim[32] = 33'h19d7e4059;
    stim[33] = 33'h0ee45e1d1;
    stim[34] = 33'h0687d9c78;
    stim[35] = 33'h1198dd8bf;
    stim[36] = 33'h040b10dae;
    stim[37] = 33'h1f47d4b5d;
    stim[38] = 33'h050683bec;
    stim[39] = 33'h082103a03;
    stim[40] = 33'h145db3ccb;
    stim[41] = 33'h07a368544;
    stim[42] = 33'h1b1f6d780;
    stim[43] = 33'h10356703b;
    stim[44] = 33'h1c8992933;
    stim[45] = 33'h1359ee397;
    stim[46] = 33'h0fb7b03e6;
    stim[47] = 33'h05eb9f2aa;
    stim[48] = 33'h19a8eda5c;
    stim[49] = 33'h159b1d321;
    stim[50] = 33'h0994a9a87;
    stim[51] = 33'h1022ed7d2;
    stim[52] = 33'h1655d4294;
    stim[53] = 33'h1d79470db;
    stim[54] = 33'h08c929248;
    stim[55] = 33'h0662d1e74;
    stim[56] = 33'h0063d6982;
    stim[57] = 33'h196ae6bb7;
    stim[58] = 33'h1b115e9be;
    stim[59] = 33'h06db074b7;
    stim[60] = 33'h129c3fa98;
    stim[61] = 33'h1262b151a;
    stim[62] = 33'h113cddd09;
    stim[63] = 33'h12769d323;
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
      expv[0] = 17'h0ec64;
      expv[1] = 17'h10237;
      expv[2] = 17'h0bcb1;
      expv[3] = 17'h06d29;
      expv[4] = 17'h0f25f;
      expv[5] = 17'h0c5ce;
      expv[6] = 17'h053f8;
      expv[7] = 17'h0c032;
      expv[8] = 17'h0fdc0;
      expv[9] = 17'h19d01;
      expv[10] = 17'h14f06;
      expv[11] = 17'h1fbee;
      expv[12] = 17'h104ef;
      expv[13] = 17'h08521;
      expv[14] = 17'h01273;
      expv[15] = 17'h1a5b7;
      expv[16] = 17'h009ae;
      expv[17] = 17'h1c378;
      expv[18] = 17'h121a1;
      expv[19] = 17'h1932a;
      expv[20] = 17'h1242c;
      expv[21] = 17'h1b517;
      expv[22] = 17'h014a1;
      expv[23] = 17'h195df;
      expv[24] = 17'h0d16b;
      expv[25] = 17'h0f03e;
      expv[26] = 17'h1a9f3;
      expv[27] = 17'h1d305;
      expv[28] = 17'h108de;
      expv[29] = 17'h0780c;
      expv[30] = 17'h1d211;
      expv[31] = 17'h04803;
      expv[32] = 17'h05d25;
      expv[33] = 17'h1d016;
      expv[34] = 17'h104f5;
      expv[35] = 17'h140ce;
      expv[36] = 17'h04e5f;
      expv[37] = 17'h0a920;
      expv[38] = 17'h08c54;
      expv[39] = 17'h0bc13;
      expv[40] = 17'h00910;
      expv[41] = 17'h0ff7a;
      expv[42] = 17'h1da76;
      expv[43] = 17'h1931b;
      expv[44] = 17'h09f66;
      expv[45] = 17'h15207;
      expv[46] = 17'h0ff61;
      expv[47] = 17'h15163;
      expv[48] = 17'h1c032;
      expv[49] = 17'h18690;
      expv[50] = 17'h133d1;
      expv[51] = 17'h12a5c;
      expv[52] = 17'h022c9;
      expv[53] = 17'h066b9;
      expv[54] = 17'h11eda;
      expv[55] = 17'h084a1;
      expv[56] = 17'h06fbf;
      expv[57] = 17'h02af7;
      expv[58] = 17'h1c757;
      expv[59] = 17'h0e267;
      expv[60] = 17'h12f2b;
      expv[61] = 17'h01111;
      expv[62] = 17'h136c4;
      expv[63] = 17'h15446;
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
