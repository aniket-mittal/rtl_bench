// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002548 dut (
    .CLK(clk),
    .enable(in_vec[3:3]),
    .done_period(in_vec[2:2]),
    .pullup_procedure(in_vec[1:0]),
    .to_pwm(out_vec[22:2]),
    .done_up(out_vec[1:1]),
    .done_down(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hb;
    stim[1] = 4'ha;
    stim[2] = 4'hb;
    stim[3] = 4'hf;
    stim[4] = 4'h3;
    stim[5] = 4'h4;
    stim[6] = 4'h5;
    stim[7] = 4'h4;
    stim[8] = 4'h8;
    stim[9] = 4'h7;
    stim[10] = 4'h4;
    stim[11] = 4'h1;
    stim[12] = 4'h5;
    stim[13] = 4'hf;
    stim[14] = 4'h7;
    stim[15] = 4'he;
    stim[16] = 4'h8;
    stim[17] = 4'h4;
    stim[18] = 4'hf;
    stim[19] = 4'h4;
    stim[20] = 4'h7;
    stim[21] = 4'h1;
    stim[22] = 4'h9;
    stim[23] = 4'hb;
    stim[24] = 4'h9;
    stim[25] = 4'hd;
    stim[26] = 4'ha;
    stim[27] = 4'ha;
    stim[28] = 4'hc;
    stim[29] = 4'h1;
    stim[30] = 4'h7;
    stim[31] = 4'hc;
    stim[32] = 4'h3;
    stim[33] = 4'h6;
    stim[34] = 4'hb;
    stim[35] = 4'h8;
    stim[36] = 4'h9;
    stim[37] = 4'hb;
    stim[38] = 4'ha;
    stim[39] = 4'ha;
    stim[40] = 4'h7;
    stim[41] = 4'hc;
    stim[42] = 4'h4;
    stim[43] = 4'hf;
    stim[44] = 4'h6;
    stim[45] = 4'hb;
    stim[46] = 4'he;
    stim[47] = 4'h9;
    stim[48] = 4'h9;
    stim[49] = 4'he;
    stim[50] = 4'h0;
    stim[51] = 4'hd;
    stim[52] = 4'h0;
    stim[53] = 4'he;
    stim[54] = 4'h4;
    stim[55] = 4'h7;
    stim[56] = 4'h0;
    stim[57] = 4'h9;
    stim[58] = 4'he;
    stim[59] = 4'hb;
    stim[60] = 4'ha;
    stim[61] = 4'ha;
    stim[62] = 4'he;
    stim[63] = 4'h2;
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
      expv[0] = 23'hxxxxxx;
      expv[1] = 23'hxxxxxx;
      expv[2] = 23'hxxxxxx;
      expv[3] = 23'hxxxxxx;
      expv[4] = 23'hxxxxxx;
      expv[5] = 23'h002ee0;
      expv[6] = 23'h002ee0;
      expv[7] = 23'h002ee0;
      expv[8] = 23'h002ee0;
      expv[9] = 23'h002ee0;
      expv[10] = 23'h002ee0;
      expv[11] = 23'h002ee0;
      expv[12] = 23'h002ee0;
      expv[13] = 23'h002ee0;
      expv[14] = 23'h002ee0;
      expv[15] = 23'h002ee0;
      expv[16] = 23'h002ee1;
      expv[17] = 23'h002ee1;
      expv[18] = 23'h002ee0;
      expv[19] = 23'h002ee0;
      expv[20] = 23'h002ee0;
      expv[21] = 23'h002ee0;
      expv[22] = 23'h002ee0;
      expv[23] = 23'h002ee0;
      expv[24] = 23'h002ee0;
      expv[25] = 23'h002ee0;
      expv[26] = 23'h002eb0;
      expv[27] = 23'h002eb0;
      expv[28] = 23'h002eb0;
      expv[29] = 23'h002eb0;
      expv[30] = 23'h002ee0;
      expv[31] = 23'h002ee0;
      expv[32] = 23'h002ee0;
      expv[33] = 23'h002ee0;
      expv[34] = 23'h002ee0;
      expv[35] = 23'h002ee0;
      expv[36] = 23'h002ee0;
      expv[37] = 23'h002ee0;
      expv[38] = 23'h002ee0;
      expv[39] = 23'h002ee0;
      expv[40] = 23'h002ee0;
      expv[41] = 23'h002ee0;
      expv[42] = 23'h002ee0;
      expv[43] = 23'h002ee0;
      expv[44] = 23'h002ee0;
      expv[45] = 23'h002ee0;
      expv[46] = 23'h002ee0;
      expv[47] = 23'h002ee1;
      expv[48] = 23'h002ee1;
      expv[49] = 23'h002ee1;
      expv[50] = 23'h002ee1;
      expv[51] = 23'h002ee0;
      expv[52] = 23'h002eb0;
      expv[53] = 23'h002ee0;
      expv[54] = 23'h002ee1;
      expv[55] = 23'h002ee0;
      expv[56] = 23'h002ee0;
      expv[57] = 23'h002ee0;
      expv[58] = 23'h002ee0;
      expv[59] = 23'h002ee1;
      expv[60] = 23'h002ee1;
      expv[61] = 23'h002ee1;
      expv[62] = 23'h002ee1;
      expv[63] = 23'h002ee1;
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
