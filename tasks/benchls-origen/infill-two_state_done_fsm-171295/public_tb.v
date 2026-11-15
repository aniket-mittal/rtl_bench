// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_171295 dut (
    .clk(clk),
    .in(in_vec[8:1]),
    .reset(in_vec[0:0]),
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
    stim[0] = 9'h041;
    stim[1] = 9'h187;
    stim[2] = 9'h006;
    stim[3] = 9'h1d6;
    stim[4] = 9'h0a6;
    stim[5] = 9'h11e;
    stim[6] = 9'h002;
    stim[7] = 9'h17e;
    stim[8] = 9'h1c2;
    stim[9] = 9'h0e8;
    stim[10] = 9'h0e6;
    stim[11] = 9'h0f4;
    stim[12] = 9'h0fe;
    stim[13] = 9'h010;
    stim[14] = 9'h0c4;
    stim[15] = 9'h13c;
    stim[16] = 9'h07c;
    stim[17] = 9'h0e4;
    stim[18] = 9'h0e8;
    stim[19] = 9'h07e;
    stim[20] = 9'h028;
    stim[21] = 9'h0d0;
    stim[22] = 9'h196;
    stim[23] = 9'h0bc;
    stim[24] = 9'h178;
    stim[25] = 9'h16c;
    stim[26] = 9'h0fe;
    stim[27] = 9'h0ae;
    stim[28] = 9'h14a;
    stim[29] = 9'h1be;
    stim[30] = 9'h156;
    stim[31] = 9'h120;
    stim[32] = 9'h0f6;
    stim[33] = 9'h11a;
    stim[34] = 9'h181;
    stim[35] = 9'h0c8;
    stim[36] = 9'h19a;
    stim[37] = 9'h0f4;
    stim[38] = 9'h058;
    stim[39] = 9'h084;
    stim[40] = 9'h1e8;
    stim[41] = 9'h16c;
    stim[42] = 9'h07c;
    stim[43] = 9'h006;
    stim[44] = 9'h043;
    stim[45] = 9'h1da;
    stim[46] = 9'h00c;
    stim[47] = 9'h116;
    stim[48] = 9'h16e;
    stim[49] = 9'h11c;
    stim[50] = 9'h112;
    stim[51] = 9'h04e;
    stim[52] = 9'h1d4;
    stim[53] = 9'h0a4;
    stim[54] = 9'h17a;
    stim[55] = 9'h1cc;
    stim[56] = 9'h07e;
    stim[57] = 9'h17c;
    stim[58] = 9'h1b4;
    stim[59] = 9'h062;
    stim[60] = 9'h0e8;
    stim[61] = 9'h16c;
    stim[62] = 9'h056;
    stim[63] = 9'h14a;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
