// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[3:3]),
    .b(in_vec[2:2]),
    .c(in_vec[1:1]),
    .d(in_vec[0:0]),
    .out_sop(out_vec[1:1]),
    .out_pos(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hc;
    stim[1] = 4'h9;
    stim[2] = 4'h3;
    stim[3] = 4'ha;
    stim[4] = 4'he;
    stim[5] = 4'hf;
    stim[6] = 4'h3;
    stim[7] = 4'hb;
    stim[8] = 4'h2;
    stim[9] = 4'he;
    stim[10] = 4'hd;
    stim[11] = 4'hc;
    stim[12] = 4'h9;
    stim[13] = 4'hc;
    stim[14] = 4'h3;
    stim[15] = 4'h1;
    stim[16] = 4'hb;
    stim[17] = 4'h5;
    stim[18] = 4'h9;
    stim[19] = 4'ha;
    stim[20] = 4'he;
    stim[21] = 4'h8;
    stim[22] = 4'h3;
    stim[23] = 4'h2;
    stim[24] = 4'hd;
    stim[25] = 4'h1;
    stim[26] = 4'he;
    stim[27] = 4'hd;
    stim[28] = 4'h1;
    stim[29] = 4'h9;
    stim[30] = 4'hb;
    stim[31] = 4'h6;
    stim[32] = 4'h0;
    stim[33] = 4'h9;
    stim[34] = 4'h8;
    stim[35] = 4'ha;
    stim[36] = 4'h1;
    stim[37] = 4'h3;
    stim[38] = 4'hc;
    stim[39] = 4'h5;
    stim[40] = 4'h7;
    stim[41] = 4'hc;
    stim[42] = 4'h6;
    stim[43] = 4'hc;
    stim[44] = 4'h8;
    stim[45] = 4'h7;
    stim[46] = 4'h5;
    stim[47] = 4'h7;
    stim[48] = 4'hb;
    stim[49] = 4'h1;
    stim[50] = 4'h2;
    stim[51] = 4'hf;
    stim[52] = 4'hd;
    stim[53] = 4'ha;
    stim[54] = 4'hb;
    stim[55] = 4'h1;
    stim[56] = 4'h7;
    stim[57] = 4'hf;
    stim[58] = 4'h4;
    stim[59] = 4'h2;
    stim[60] = 4'h4;
    stim[61] = 4'h5;
    stim[62] = 4'hd;
    stim[63] = 4'hd;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h3;
      expv[3] = 2'hx;
      expv[4] = 2'h0;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'hx;
      expv[8] = 2'hx;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h3;
      expv[15] = 2'h0;
      expv[16] = 2'hx;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'hx;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h3;
      expv[23] = 2'hx;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'hx;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'hx;
      expv[36] = 2'h0;
      expv[37] = 2'h3;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h3;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h3;
      expv[46] = 2'h0;
      expv[47] = 2'h3;
      expv[48] = 2'hx;
      expv[49] = 2'h0;
      expv[50] = 2'hx;
      expv[51] = 2'h3;
      expv[52] = 2'h0;
      expv[53] = 2'hx;
      expv[54] = 2'hx;
      expv[55] = 2'h0;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h0;
      expv[59] = 2'hx;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
