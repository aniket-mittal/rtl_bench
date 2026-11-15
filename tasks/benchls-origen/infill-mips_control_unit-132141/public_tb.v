// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132141 dut (
    .op(in_vec[12:7]),
    .func(in_vec[6:1]),
    .equal_result(in_vec[0:0]),
    .JR(out_vec[15:15]),
    .J(out_vec[14:14]),
    .JAL(out_vec[13:13]),
    .LW(out_vec[12:12]),
    .WREG(out_vec[11:11]),
    .WMEM(out_vec[10:10]),
    .RDorRT(out_vec[9:9]),
    .SE(out_vec[8:8]),
    .SA(out_vec[7:7]),
    .IorR(out_vec[6:6]),
    .BJ(out_vec[5:5]),
    .Aluc(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0f73;
    stim[1] = 13'h1a88;
    stim[2] = 13'h0a02;
    stim[3] = 13'h0952;
    stim[4] = 13'h0f69;
    stim[5] = 13'h0b2a;
    stim[6] = 13'h1115;
    stim[7] = 13'h1579;
    stim[8] = 13'h004d;
    stim[9] = 13'h0c14;
    stim[10] = 13'h0579;
    stim[11] = 13'h1531;
    stim[12] = 13'h17d7;
    stim[13] = 13'h16e1;
    stim[14] = 13'h0b73;
    stim[15] = 13'h033a;
    stim[16] = 13'h0967;
    stim[17] = 13'h073d;
    stim[18] = 13'h11fa;
    stim[19] = 13'h175f;
    stim[20] = 13'h1660;
    stim[21] = 13'h0a76;
    stim[22] = 13'h0be2;
    stim[23] = 13'h02cf;
    stim[24] = 13'h1e5e;
    stim[25] = 13'h1e48;
    stim[26] = 13'h06bd;
    stim[27] = 13'h1555;
    stim[28] = 13'h0e62;
    stim[29] = 13'h177c;
    stim[30] = 13'h1c52;
    stim[31] = 13'h11ca;
    stim[32] = 13'h18ef;
    stim[33] = 13'h18b6;
    stim[34] = 13'h0123;
    stim[35] = 13'h170d;
    stim[36] = 13'h1cfc;
    stim[37] = 13'h0b15;
    stim[38] = 13'h1444;
    stim[39] = 13'h0dd9;
    stim[40] = 13'h19d4;
    stim[41] = 13'h0104;
    stim[42] = 13'h075e;
    stim[43] = 13'h0b93;
    stim[44] = 13'h02b7;
    stim[45] = 13'h0e01;
    stim[46] = 13'h0c7f;
    stim[47] = 13'h1502;
    stim[48] = 13'h1c37;
    stim[49] = 13'h12e4;
    stim[50] = 13'h046e;
    stim[51] = 13'h0d89;
    stim[52] = 13'h0181;
    stim[53] = 13'h0c54;
    stim[54] = 13'h1439;
    stim[55] = 13'h09c4;
    stim[56] = 13'h0bd2;
    stim[57] = 13'h0e13;
    stim[58] = 13'h03da;
    stim[59] = 13'h140f;
    stim[60] = 13'h0e52;
    stim[61] = 13'h1e10;
    stim[62] = 13'h19c1;
    stim[63] = 13'h16c1;
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
      expv[0] = 16'h0900;
      expv[1] = 16'h0900;
      expv[2] = 16'h0900;
      expv[3] = 16'h0900;
      expv[4] = 16'h0900;
      expv[5] = 16'h0900;
      expv[6] = 16'h0902;
      expv[7] = 16'h0900;
      expv[8] = 16'h0840;
      expv[9] = 16'h0900;
      expv[10] = 16'h0902;
      expv[11] = 16'h0900;
      expv[12] = 16'h0900;
      expv[13] = 16'h0900;
      expv[14] = 16'h0900;
      expv[15] = 16'h0900;
      expv[16] = 16'h0900;
      expv[17] = 16'h0906;
      expv[18] = 16'h1902;
      expv[19] = 16'h0900;
      expv[20] = 16'h0900;
      expv[21] = 16'h0900;
      expv[22] = 16'h0900;
      expv[23] = 16'h0900;
      expv[24] = 16'h0900;
      expv[25] = 16'h0900;
      expv[26] = 16'h0905;
      expv[27] = 16'h0900;
      expv[28] = 16'h0900;
      expv[29] = 16'h0900;
      expv[30] = 16'h0900;
      expv[31] = 16'h1902;
      expv[32] = 16'h0900;
      expv[33] = 16'h0900;
      expv[34] = 16'h4000;
      expv[35] = 16'h0900;
      expv[36] = 16'h0900;
      expv[37] = 16'h0900;
      expv[38] = 16'h0900;
      expv[39] = 16'h0900;
      expv[40] = 16'h0900;
      expv[41] = 16'h4000;
      expv[42] = 16'h0906;
      expv[43] = 16'h0900;
      expv[44] = 16'h0900;
      expv[45] = 16'h0900;
      expv[46] = 16'h0900;
      expv[47] = 16'h0900;
      expv[48] = 16'h0900;
      expv[49] = 16'h0905;
      expv[50] = 16'h0900;
      expv[51] = 16'h0900;
      expv[52] = 16'h2800;
      expv[53] = 16'h0900;
      expv[54] = 16'h0900;
      expv[55] = 16'h0900;
      expv[56] = 16'h0900;
      expv[57] = 16'h0900;
      expv[58] = 16'h0900;
      expv[59] = 16'h0900;
      expv[60] = 16'h0900;
      expv[61] = 16'h0900;
      expv[62] = 16'h0900;
      expv[63] = 16'h0900;
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
