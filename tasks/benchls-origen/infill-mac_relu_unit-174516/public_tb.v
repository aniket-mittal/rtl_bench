// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174516 dut (
    .CLK(clk),
    .In(in_vec[17:10]),
    .CLR(in_vec[9:9]),
    .Valid_IN(in_vec[8:8]),
    .K(in_vec[7:0]),
    .Valid_OUT(out_vec[8:8]),
    .Out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h36b48;
    stim[1] = 18'h2ced9;
    stim[2] = 18'h2a99f;
    stim[3] = 18'h3c137;
    stim[4] = 18'h2d198;
    stim[5] = 18'h16485;
    stim[6] = 18'h078a4;
    stim[7] = 18'h2ccb5;
    stim[8] = 18'h1d0aa;
    stim[9] = 18'h08855;
    stim[10] = 18'h13ce2;
    stim[11] = 18'h32800;
    stim[12] = 18'h1d584;
    stim[13] = 18'h1517e;
    stim[14] = 18'h0d4fe;
    stim[15] = 18'h2b0e9;
    stim[16] = 18'h18070;
    stim[17] = 18'h2b818;
    stim[18] = 18'h0b4cc;
    stim[19] = 18'h0308c;
    stim[20] = 18'h3c3ab;
    stim[21] = 18'h2017c;
    stim[22] = 18'h029d1;
    stim[23] = 18'h3056b;
    stim[24] = 18'h161e9;
    stim[25] = 18'h21512;
    stim[26] = 18'h3b4fc;
    stim[27] = 18'h19021;
    stim[28] = 18'h0e141;
    stim[29] = 18'h2e110;
    stim[30] = 18'h0b456;
    stim[31] = 18'h23980;
    stim[32] = 18'h2c0c9;
    stim[33] = 18'h245b4;
    stim[34] = 18'h084e1;
    stim[35] = 18'h0b10b;
    stim[36] = 18'h33d71;
    stim[37] = 18'h048de;
    stim[38] = 18'h0bc33;
    stim[39] = 18'h09193;
    stim[40] = 18'h129b5;
    stim[41] = 18'h37cc0;
    stim[42] = 18'h3e80b;
    stim[43] = 18'h20152;
    stim[44] = 18'h0cd23;
    stim[45] = 18'h165c4;
    stim[46] = 18'h115a1;
    stim[47] = 18'h0f4d5;
    stim[48] = 18'h0d582;
    stim[49] = 18'h2a891;
    stim[50] = 18'h0e9a9;
    stim[51] = 18'h24c12;
    stim[52] = 18'h01d95;
    stim[53] = 18'h0c539;
    stim[54] = 18'h1b1d4;
    stim[55] = 18'h2e41f;
    stim[56] = 18'h38c3f;
    stim[57] = 18'h1b5c7;
    stim[58] = 18'h10110;
    stim[59] = 18'h10c46;
    stim[60] = 18'h3f53d;
    stim[61] = 18'h2f9e2;
    stim[62] = 18'h289d1;
    stim[63] = 18'h30446;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h100;
      expv[4] = 9'h100;
      expv[5] = 9'h100;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h100;
      expv[14] = 9'h196;
      expv[15] = 9'h096;
      expv[16] = 9'h096;
      expv[17] = 9'h096;
      expv[18] = 9'h096;
      expv[19] = 9'h096;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h100;
      expv[23] = 9'h100;
      expv[24] = 9'h100;
      expv[25] = 9'h100;
      expv[26] = 9'h100;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h12a;
      expv[30] = 9'h1ab;
      expv[31] = 9'h0ab;
      expv[32] = 9'h118;
      expv[33] = 9'h018;
      expv[34] = 9'h15a;
      expv[35] = 9'h05a;
      expv[36] = 9'h138;
      expv[37] = 9'h180;
      expv[38] = 9'h080;
      expv[39] = 9'h080;
      expv[40] = 9'h100;
      expv[41] = 9'h1f4;
      expv[42] = 9'h0f4;
      expv[43] = 9'h0f4;
      expv[44] = 9'h1e4;
      expv[45] = 9'h15f;
      expv[46] = 9'h1ac;
      expv[47] = 9'h152;
      expv[48] = 9'h052;
      expv[49] = 9'h100;
      expv[50] = 9'h000;
      expv[51] = 9'h1f9;
      expv[52] = 9'h0f9;
      expv[53] = 9'h124;
      expv[54] = 9'h165;
      expv[55] = 9'h1ea;
      expv[56] = 9'h0ea;
      expv[57] = 9'h0ea;
      expv[58] = 9'h14a;
      expv[59] = 9'h113;
      expv[60] = 9'h013;
      expv[61] = 9'h1e9;
      expv[62] = 9'h170;
      expv[63] = 9'h1bb;
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
