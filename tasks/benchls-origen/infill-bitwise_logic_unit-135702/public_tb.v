// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135702 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .in1(in_vec[9:6]),
    .in2(in_vec[5:2]),
    .op(in_vec[1:0]),
    .out1(out_vec[15:12]),
    .out2(out_vec[11:8]),
    .out3(out_vec[7:4]),
    .out4(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h592;
    stim[1] = 11'h66e;
    stim[2] = 11'h018;
    stim[3] = 11'h232;
    stim[4] = 11'h07a;
    stim[5] = 11'h2aa;
    stim[6] = 11'h12d;
    stim[7] = 11'h3b3;
    stim[8] = 11'h319;
    stim[9] = 11'h126;
    stim[10] = 11'h1c5;
    stim[11] = 11'h120;
    stim[12] = 11'h13b;
    stim[13] = 11'h2b5;
    stim[14] = 11'h1f9;
    stim[15] = 11'h394;
    stim[16] = 11'h357;
    stim[17] = 11'h130;
    stim[18] = 11'h2b2;
    stim[19] = 11'h2b7;
    stim[20] = 11'h047;
    stim[21] = 11'h2fc;
    stim[22] = 11'h084;
    stim[23] = 11'h039;
    stim[24] = 11'h0c1;
    stim[25] = 11'h085;
    stim[26] = 11'h00e;
    stim[27] = 11'h072;
    stim[28] = 11'h065;
    stim[29] = 11'h050;
    stim[30] = 11'h13a;
    stim[31] = 11'h150;
    stim[32] = 11'h0b6;
    stim[33] = 11'h324;
    stim[34] = 11'h175;
    stim[35] = 11'h15c;
    stim[36] = 11'h002;
    stim[37] = 11'h1e1;
    stim[38] = 11'h1d5;
    stim[39] = 11'h157;
    stim[40] = 11'h002;
    stim[41] = 11'h2bc;
    stim[42] = 11'h2b3;
    stim[43] = 11'h27f;
    stim[44] = 11'h384;
    stim[45] = 11'h0ab;
    stim[46] = 11'h16f;
    stim[47] = 11'h0f8;
    stim[48] = 11'h0d1;
    stim[49] = 11'h070;
    stim[50] = 11'h33c;
    stim[51] = 11'h3c0;
    stim[52] = 11'h2d2;
    stim[53] = 11'h105;
    stim[54] = 11'h0cb;
    stim[55] = 11'h264;
    stim[56] = 11'h1cc;
    stim[57] = 11'h08f;
    stim[58] = 11'h19d;
    stim[59] = 11'h255;
    stim[60] = 11'h3f2;
    stim[61] = 11'h385;
    stim[62] = 11'h0c6;
    stim[63] = 11'h258;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0010;
      expv[5] = 16'h0010;
      expv[6] = 16'h0010;
      expv[7] = 16'h1111;
      expv[8] = 16'hfeee;
      expv[9] = 16'h0111;
      expv[10] = 16'h1011;
      expv[11] = 16'h1110;
      expv[12] = 16'h0000;
      expv[13] = 16'hffef;
      expv[14] = 16'h1111;
      expv[15] = 16'h1111;
      expv[16] = 16'h0010;
      expv[17] = 16'hefee;
      expv[18] = 16'h0010;
      expv[19] = 16'h0110;
      expv[20] = 16'hfefe;
      expv[21] = 16'hfefe;
      expv[22] = 16'h1101;
      expv[23] = 16'h1101;
      expv[24] = 16'h0111;
      expv[25] = 16'h0111;
      expv[26] = 16'h0111;
      expv[27] = 16'h1100;
      expv[28] = 16'h1100;
      expv[29] = 16'h1001;
      expv[30] = 16'h0000;
      expv[31] = 16'h0101;
      expv[32] = 16'h0010;
      expv[33] = 16'h1111;
      expv[34] = 16'h0001;
      expv[35] = 16'h1011;
      expv[36] = 16'h1010;
      expv[37] = 16'h0000;
      expv[38] = 16'h1111;
      expv[39] = 16'h1111;
      expv[40] = 16'hefef;
      expv[41] = 16'h0000;
      expv[42] = 16'h0101;
      expv[43] = 16'hfefe;
      expv[44] = 16'hfefe;
      expv[45] = 16'h0000;
      expv[46] = 16'hfeff;
      expv[47] = 16'hfeff;
      expv[48] = 16'h0100;
      expv[49] = 16'h1110;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h1111;
      expv[54] = 16'h1010;
      expv[55] = 16'heeff;
      expv[56] = 16'h1001;
      expv[57] = 16'h1001;
      expv[58] = 16'hfeff;
      expv[59] = 16'h1110;
      expv[60] = 16'h1110;
      expv[61] = 16'h1100;
      expv[62] = 16'h1111;
      expv[63] = 16'h0100;
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
