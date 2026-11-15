// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053174 dut (
    .clk(clk),
    .D(in_vec[9:6]),
    .d(in_vec[5:2]),
    .start(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .q(out_vec[8:5]),
    .r(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2c9;
    stim[1] = 10'h1e1;
    stim[2] = 10'h2de;
    stim[3] = 10'h106;
    stim[4] = 10'h154;
    stim[5] = 10'h19c;
    stim[6] = 10'h286;
    stim[7] = 10'h1fa;
    stim[8] = 10'h26c;
    stim[9] = 10'h064;
    stim[10] = 10'h2e8;
    stim[11] = 10'h2ee;
    stim[12] = 10'h180;
    stim[13] = 10'h19c;
    stim[14] = 10'h368;
    stim[15] = 10'h0c4;
    stim[16] = 10'h158;
    stim[17] = 10'h1a4;
    stim[18] = 10'h33e;
    stim[19] = 10'h3b8;
    stim[20] = 10'h1d2;
    stim[21] = 10'h0a2;
    stim[22] = 10'h0be;
    stim[23] = 10'h158;
    stim[24] = 10'h074;
    stim[25] = 10'h0fa;
    stim[26] = 10'h018;
    stim[27] = 10'h3b0;
    stim[28] = 10'h395;
    stim[29] = 10'h07a;
    stim[30] = 10'h3b4;
    stim[31] = 10'h2d4;
    stim[32] = 10'h1ee;
    stim[33] = 10'h1e8;
    stim[34] = 10'h0aa;
    stim[35] = 10'h02c;
    stim[36] = 10'h280;
    stim[37] = 10'h10a;
    stim[38] = 10'h362;
    stim[39] = 10'h242;
    stim[40] = 10'h094;
    stim[41] = 10'h180;
    stim[42] = 10'h11c;
    stim[43] = 10'h394;
    stim[44] = 10'h106;
    stim[45] = 10'h064;
    stim[46] = 10'h2e4;
    stim[47] = 10'h072;
    stim[48] = 10'h0a2;
    stim[49] = 10'h3a6;
    stim[50] = 10'h358;
    stim[51] = 10'h17e;
    stim[52] = 10'h0b8;
    stim[53] = 10'h010;
    stim[54] = 10'h156;
    stim[55] = 10'h3e8;
    stim[56] = 10'h258;
    stim[57] = 10'h234;
    stim[58] = 10'h398;
    stim[59] = 10'h16e;
    stim[60] = 10'h0c4;
    stim[61] = 10'h214;
    stim[62] = 10'h31a;
    stim[63] = 10'h31c;
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
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h017;
      expv[18] = 9'h017;
      expv[19] = 9'h016;
      expv[20] = 9'h016;
      expv[21] = 9'h016;
      expv[22] = 9'h016;
      expv[23] = 9'h016;
      expv[24] = 9'h016;
      expv[25] = 9'h016;
      expv[26] = 9'h016;
      expv[27] = 9'h016;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
