// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_214217 dut (
    .clk(clk),
    .busrst(in_vec[18:18]),
    .kwreq(in_vec[17:17]),
    .kwwr(in_vec[16:16]),
    .kwwdata(in_vec[15:0]),
    .kwrdata(out_vec[17:2]),
    .kwack(out_vec[1:1]),
    .kwirq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h47c2f;
    stim[1] = 19'h5e709;
    stim[2] = 19'h1962c;
    stim[3] = 19'h38f53;
    stim[4] = 19'h2f35b;
    stim[5] = 19'h09685;
    stim[6] = 19'h1c278;
    stim[7] = 19'h033c8;
    stim[8] = 19'h2e431;
    stim[9] = 19'h66fa8;
    stim[10] = 19'h3b8a0;
    stim[11] = 19'h2f0be;
    stim[12] = 19'h17af2;
    stim[13] = 19'h51f15;
    stim[14] = 19'h1588f;
    stim[15] = 19'h3bad9;
    stim[16] = 19'h1ff56;
    stim[17] = 19'h215a4;
    stim[18] = 19'h1c014;
    stim[19] = 19'h2d6f9;
    stim[20] = 19'h002a0;
    stim[21] = 19'h2f625;
    stim[22] = 19'h3b9b1;
    stim[23] = 19'h6b3f6;
    stim[24] = 19'h15470;
    stim[25] = 19'h3192f;
    stim[26] = 19'h3249c;
    stim[27] = 19'h316d3;
    stim[28] = 19'h2eacd;
    stim[29] = 19'h02758;
    stim[30] = 19'h12ec8;
    stim[31] = 19'h2ccc6;
    stim[32] = 19'h0cf0c;
    stim[33] = 19'h0999a;
    stim[34] = 19'h19cea;
    stim[35] = 19'h3279c;
    stim[36] = 19'h050d7;
    stim[37] = 19'h03db0;
    stim[38] = 19'h27d83;
    stim[39] = 19'h0cd0c;
    stim[40] = 19'h37324;
    stim[41] = 19'h0a69d;
    stim[42] = 19'h3a9dd;
    stim[43] = 19'h32c5b;
    stim[44] = 19'h2015f;
    stim[45] = 19'h1d7f6;
    stim[46] = 19'h1a8d8;
    stim[47] = 19'h05f19;
    stim[48] = 19'h32cdd;
    stim[49] = 19'h2bdec;
    stim[50] = 19'h2bdc9;
    stim[51] = 19'h31931;
    stim[52] = 19'h1d719;
    stim[53] = 19'h2a1ce;
    stim[54] = 19'h13e36;
    stim[55] = 19'h12c10;
    stim[56] = 19'h3c291;
    stim[57] = 19'h286db;
    stim[58] = 19'h27c12;
    stim[59] = 19'h3da48;
    stim[60] = 19'h09742;
    stim[61] = 19'h0babe;
    stim[62] = 19'h3d5b5;
    stim[63] = 19'h31cf0;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h0000x;
      expv[2] = 18'h0000x;
      expv[3] = 18'h00000;
      expv[4] = 18'h00006;
      expv[5] = 18'h00003;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00002;
      expv[10] = 18'h00002;
      expv[11] = 18'h00006;
      expv[12] = 18'h00002;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00006;
      expv[17] = 18'h00001;
      expv[18] = 18'h00002;
      expv[19] = 18'h00000;
      expv[20] = 18'h00002;
      expv[21] = 18'h00000;
      expv[22] = 18'h00002;
      expv[23] = 18'h00006;
      expv[24] = 18'h00002;
      expv[25] = 18'h00000;
      expv[26] = 18'h00002;
      expv[27] = 18'h00002;
      expv[28] = 18'h00002;
      expv[29] = 18'h00002;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00002;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00002;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00002;
      expv[40] = 18'h00000;
      expv[41] = 18'h00002;
      expv[42] = 18'h00000;
      expv[43] = 18'h00006;
      expv[44] = 18'h00003;
      expv[45] = 18'h00002;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00002;
      expv[50] = 18'h00002;
      expv[51] = 18'h00002;
      expv[52] = 18'h00002;
      expv[53] = 18'h00000;
      expv[54] = 18'h00002;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00006;
      expv[58] = 18'h00003;
      expv[59] = 18'h00002;
      expv[60] = 18'h00006;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00006;
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
