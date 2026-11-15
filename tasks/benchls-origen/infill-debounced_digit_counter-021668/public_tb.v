// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_021668 dut (
    .clk(clk),
    .btn(in_vec[3:0]),
    .num(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h3;
    stim[1] = 4'h2;
    stim[2] = 4'h6;
    stim[3] = 4'hb;
    stim[4] = 4'h5;
    stim[5] = 4'h2;
    stim[6] = 4'hd;
    stim[7] = 4'hf;
    stim[8] = 4'he;
    stim[9] = 4'h2;
    stim[10] = 4'h9;
    stim[11] = 4'h0;
    stim[12] = 4'h3;
    stim[13] = 4'hc;
    stim[14] = 4'hc;
    stim[15] = 4'h3;
    stim[16] = 4'h9;
    stim[17] = 4'h5;
    stim[18] = 4'ha;
    stim[19] = 4'ha;
    stim[20] = 4'h8;
    stim[21] = 4'h9;
    stim[22] = 4'h9;
    stim[23] = 4'h8;
    stim[24] = 4'h4;
    stim[25] = 4'h1;
    stim[26] = 4'he;
    stim[27] = 4'h8;
    stim[28] = 4'hf;
    stim[29] = 4'h5;
    stim[30] = 4'h9;
    stim[31] = 4'he;
    stim[32] = 4'h2;
    stim[33] = 4'h2;
    stim[34] = 4'h1;
    stim[35] = 4'h6;
    stim[36] = 4'h7;
    stim[37] = 4'h8;
    stim[38] = 4'hd;
    stim[39] = 4'h2;
    stim[40] = 4'h1;
    stim[41] = 4'h0;
    stim[42] = 4'h9;
    stim[43] = 4'h5;
    stim[44] = 4'hb;
    stim[45] = 4'h4;
    stim[46] = 4'h5;
    stim[47] = 4'hf;
    stim[48] = 4'hc;
    stim[49] = 4'ha;
    stim[50] = 4'h6;
    stim[51] = 4'h2;
    stim[52] = 4'h5;
    stim[53] = 4'hb;
    stim[54] = 4'h2;
    stim[55] = 4'h4;
    stim[56] = 4'h4;
    stim[57] = 4'h7;
    stim[58] = 4'h7;
    stim[59] = 4'hd;
    stim[60] = 4'hd;
    stim[61] = 4'hb;
    stim[62] = 4'h3;
    stim[63] = 4'h9;
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
      expv[0] = 16'h1234;
      expv[1] = 16'hxxxx;
      expv[2] = 16'h1234;
      expv[3] = 16'hxxxx;
      expv[4] = 16'h1234;
      expv[5] = 16'hxxxx;
      expv[6] = 16'h1234;
      expv[7] = 16'hxxxx;
      expv[8] = 16'h1234;
      expv[9] = 16'hxxxx;
      expv[10] = 16'h1234;
      expv[11] = 16'hxxxx;
      expv[12] = 16'h1234;
      expv[13] = 16'hxxxx;
      expv[14] = 16'h1234;
      expv[15] = 16'hxxxx;
      expv[16] = 16'h1234;
      expv[17] = 16'hxxxx;
      expv[18] = 16'h1234;
      expv[19] = 16'hxxxx;
      expv[20] = 16'h1234;
      expv[21] = 16'hxxxx;
      expv[22] = 16'h1234;
      expv[23] = 16'hxxxx;
      expv[24] = 16'h1234;
      expv[25] = 16'hxxxx;
      expv[26] = 16'h1234;
      expv[27] = 16'hxxxx;
      expv[28] = 16'h1234;
      expv[29] = 16'hxxxx;
      expv[30] = 16'h1234;
      expv[31] = 16'hxxxx;
      expv[32] = 16'h1234;
      expv[33] = 16'hxxxx;
      expv[34] = 16'h1234;
      expv[35] = 16'hxxxx;
      expv[36] = 16'h1234;
      expv[37] = 16'hxxxx;
      expv[38] = 16'h1234;
      expv[39] = 16'hxxxx;
      expv[40] = 16'h1234;
      expv[41] = 16'hxxxx;
      expv[42] = 16'h1234;
      expv[43] = 16'hxxxx;
      expv[44] = 16'h1234;
      expv[45] = 16'hxxxx;
      expv[46] = 16'h1234;
      expv[47] = 16'hxxxx;
      expv[48] = 16'h1234;
      expv[49] = 16'hxxxx;
      expv[50] = 16'h1234;
      expv[51] = 16'hxxxx;
      expv[52] = 16'h1234;
      expv[53] = 16'hxxxx;
      expv[54] = 16'h1234;
      expv[55] = 16'hxxxx;
      expv[56] = 16'h1234;
      expv[57] = 16'hxxxx;
      expv[58] = 16'h1234;
      expv[59] = 16'hxxxx;
      expv[60] = 16'h1234;
      expv[61] = 16'hxxxx;
      expv[62] = 16'h1234;
      expv[63] = 16'hxxxx;
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
