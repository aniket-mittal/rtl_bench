// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h02ccc;
    stim[1] = 17'h1a818;
    stim[2] = 17'h1404d;
    stim[3] = 17'h0023d;
    stim[4] = 17'h02f78;
    stim[5] = 17'h00e8d;
    stim[6] = 17'h07692;
    stim[7] = 17'h0dca8;
    stim[8] = 17'h05abd;
    stim[9] = 17'h0aea9;
    stim[10] = 17'h1e0eb;
    stim[11] = 17'h10ebf;
    stim[12] = 17'h187f8;
    stim[13] = 17'h09562;
    stim[14] = 17'h06086;
    stim[15] = 17'h140a1;
    stim[16] = 17'h0b446;
    stim[17] = 17'h0b629;
    stim[18] = 17'h1d71b;
    stim[19] = 17'h17d80;
    stim[20] = 17'h170c1;
    stim[21] = 17'h02124;
    stim[22] = 17'h1d999;
    stim[23] = 17'h1d471;
    stim[24] = 17'h1506e;
    stim[25] = 17'h16796;
    stim[26] = 17'h12406;
    stim[27] = 17'h0879a;
    stim[28] = 17'h08ef9;
    stim[29] = 17'h14ec3;
    stim[30] = 17'h01472;
    stim[31] = 17'h1adef;
    stim[32] = 17'h158f4;
    stim[33] = 17'h098c2;
    stim[34] = 17'h0c5ed;
    stim[35] = 17'h00a44;
    stim[36] = 17'h0c64e;
    stim[37] = 17'h03651;
    stim[38] = 17'h19189;
    stim[39] = 17'h074dd;
    stim[40] = 17'h09091;
    stim[41] = 17'h0faeb;
    stim[42] = 17'h0c850;
    stim[43] = 17'h1539b;
    stim[44] = 17'h11b84;
    stim[45] = 17'h13bbc;
    stim[46] = 17'h14ead;
    stim[47] = 17'h15c96;
    stim[48] = 17'h11f7d;
    stim[49] = 17'h0fc6d;
    stim[50] = 17'h051c7;
    stim[51] = 17'h01042;
    stim[52] = 17'h0844c;
    stim[53] = 17'h1824f;
    stim[54] = 17'h0d9c7;
    stim[55] = 17'h106a2;
    stim[56] = 17'h1e3dd;
    stim[57] = 17'h0a409;
    stim[58] = 17'h0db04;
    stim[59] = 17'h134b0;
    stim[60] = 17'h12ca0;
    stim[61] = 17'h0b383;
    stim[62] = 17'h10344;
    stim[63] = 17'h1fc29;
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
      expv[0] = 9'h1f1;
      expv[1] = 9'h121;
      expv[2] = 9'h1e7;
      expv[3] = 9'h07f;
      expv[4] = 9'h14f;
      expv[5] = 9'h137;
      expv[6] = 9'h011;
      expv[7] = 9'h109;
      expv[8] = 9'h02f;
      expv[9] = 9'h0af;
      expv[10] = 9'h1eb;
      expv[11] = 9'h09f;
      expv[12] = 9'h11f;
      expv[13] = 9'h1ef;
      expv[14] = 9'h1cd;
      expv[15] = 9'h13f;
      expv[16] = 9'h1f5;
      expv[17] = 9'h1bf;
      expv[18] = 9'h179;
      expv[19] = 9'h1fb;
      expv[20] = 9'h15f;
      expv[21] = 9'h08b;
      expv[22] = 9'h081;
      expv[23] = 9'h0c7;
      expv[24] = 9'h1c5;
      expv[25] = 9'h1a3;
      expv[26] = 9'h03d;
      expv[27] = 9'h043;
      expv[28] = 9'h10f;
      expv[29] = 9'h117;
      expv[30] = 9'h10d;
      expv[31] = 9'h17d;
      expv[32] = 9'h0c9;
      expv[33] = 9'h0b5;
      expv[34] = 9'h165;
      expv[35] = 9'h09d;
      expv[36] = 9'h029;
      expv[37] = 9'h10f;
      expv[38] = 9'h011;
      expv[39] = 9'h0a3;
      expv[40] = 9'h043;
      expv[41] = 9'h1cb;
      expv[42] = 9'h031;
      expv[43] = 9'h171;
      expv[44] = 9'h12f;
      expv[45] = 9'h0ff;
      expv[46] = 9'h143;
      expv[47] = 9'h18d;
      expv[48] = 9'h145;
      expv[49] = 9'h0d3;
      expv[50] = 9'h031;
      expv[51] = 9'h0a5;
      expv[52] = 9'h1a1;
      expv[53] = 9'h067;
      expv[54] = 9'h141;
      expv[55] = 9'h0c9;
      expv[56] = 9'h00d;
      expv[57] = 9'h15b;
      expv[58] = 9'h1bf;
      expv[59] = 9'h109;
      expv[60] = 9'h119;
      expv[61] = 9'h06d;
      expv[62] = 9'h17f;
      expv[63] = 9'h1a7;
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
