// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01954 dut (
    .CLK(clk),
    .RESET(in_vec[10:10]),
    .IN(in_vec[9:2]),
    .ACK(in_vec[1:1]),
    .WR(in_vec[0:0]),
    .OUT(out_vec[9:2]),
    .RDA(out_vec[1:1]),
    .RDY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7c1;
    stim[1] = 11'h782;
    stim[2] = 11'h286;
    stim[3] = 11'h145;
    stim[4] = 11'h335;
    stim[5] = 11'h15c;
    stim[6] = 11'h319;
    stim[7] = 11'h158;
    stim[8] = 11'h187;
    stim[9] = 11'h026;
    stim[10] = 11'h095;
    stim[11] = 11'h259;
    stim[12] = 11'h3b0;
    stim[13] = 11'h3b5;
    stim[14] = 11'h055;
    stim[15] = 11'h1c9;
    stim[16] = 11'h21d;
    stim[17] = 11'h2fc;
    stim[18] = 11'h3fd;
    stim[19] = 11'h292;
    stim[20] = 11'h2aa;
    stim[21] = 11'h12e;
    stim[22] = 11'h010;
    stim[23] = 11'h1f7;
    stim[24] = 11'h289;
    stim[25] = 11'h3a5;
    stim[26] = 11'h0f2;
    stim[27] = 11'h1ea;
    stim[28] = 11'h312;
    stim[29] = 11'h294;
    stim[30] = 11'h25f;
    stim[31] = 11'h17a;
    stim[32] = 11'h138;
    stim[33] = 11'h191;
    stim[34] = 11'h247;
    stim[35] = 11'h226;
    stim[36] = 11'h1e5;
    stim[37] = 11'h08d;
    stim[38] = 11'h09f;
    stim[39] = 11'h38e;
    stim[40] = 11'h1a9;
    stim[41] = 11'h257;
    stim[42] = 11'h1a2;
    stim[43] = 11'h1c8;
    stim[44] = 11'h0c6;
    stim[45] = 11'h169;
    stim[46] = 11'h11f;
    stim[47] = 11'h3c6;
    stim[48] = 11'h05a;
    stim[49] = 11'h2e5;
    stim[50] = 11'h2f8;
    stim[51] = 11'h39f;
    stim[52] = 11'h067;
    stim[53] = 11'h38a;
    stim[54] = 11'h262;
    stim[55] = 11'h223;
    stim[56] = 11'h07b;
    stim[57] = 11'h008;
    stim[58] = 11'h00d;
    stim[59] = 11'h1eb;
    stim[60] = 11'h01a;
    stim[61] = 11'h015;
    stim[62] = 11'h252;
    stim[63] = 11'h0bb;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h107;
      expv[2] = 10'h107;
      expv[3] = 10'h10b;
      expv[4] = 10'h10b;
      expv[5] = 10'h10b;
      expv[6] = 10'h10b;
      expv[7] = 10'h10b;
      expv[8] = 10'h10b;
      expv[9] = 10'h10f;
      expv[10] = 10'h113;
      expv[11] = 10'h113;
      expv[12] = 10'h113;
      expv[13] = 10'h113;
      expv[14] = 10'h113;
      expv[15] = 10'h113;
      expv[16] = 10'h113;
      expv[17] = 10'h113;
      expv[18] = 10'h113;
      expv[19] = 10'h113;
      expv[20] = 10'h117;
      expv[21] = 10'h11b;
      expv[22] = 10'h11f;
      expv[23] = 10'h11f;
      expv[24] = 10'h123;
      expv[25] = 10'h123;
      expv[26] = 10'h123;
      expv[27] = 10'h127;
      expv[28] = 10'h12b;
      expv[29] = 10'h12f;
      expv[30] = 10'h12f;
      expv[31] = 10'h133;
      expv[32] = 10'h137;
      expv[33] = 10'h137;
      expv[34] = 10'h137;
      expv[35] = 10'h13b;
      expv[36] = 10'h13f;
      expv[37] = 10'h13f;
      expv[38] = 10'h13f;
      expv[39] = 10'h143;
      expv[40] = 10'h107;
      expv[41] = 10'h107;
      expv[42] = 10'h10b;
      expv[43] = 10'h10f;
      expv[44] = 10'h10f;
      expv[45] = 10'h113;
      expv[46] = 10'h113;
      expv[47] = 10'h117;
      expv[48] = 10'h11b;
      expv[49] = 10'h11f;
      expv[50] = 10'h11f;
      expv[51] = 10'h11f;
      expv[52] = 10'h123;
      expv[53] = 10'h127;
      expv[54] = 10'h12b;
      expv[55] = 10'h12f;
      expv[56] = 10'h133;
      expv[57] = 10'h137;
      expv[58] = 10'h137;
      expv[59] = 10'h137;
      expv[60] = 10'h13b;
      expv[61] = 10'h13f;
      expv[62] = 10'h13f;
      expv[63] = 10'h143;
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
