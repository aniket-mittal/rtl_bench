// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106122 dut (
    .sd_clk(clk),
    .sd_rst(in_vec[0:0]),
    .sd_cmd(out_vec[20:17]),
    .sd_a(out_vec[16:4]),
    .sd_dqm(out_vec[3:2]),
    .sd_cke(out_vec[1:1]),
    .sd_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h1;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h1;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 21'h0e000c;
      expv[1] = 21'h0e000c;
      expv[2] = 21'h0e000c;
      expv[3] = 21'h0e000c;
      expv[4] = 21'h0e000c;
      expv[5] = 21'h0e000c;
      expv[6] = 21'h0e000c;
      expv[7] = 21'h0e000c;
      expv[8] = 21'h0e000c;
      expv[9] = 21'h0e000c;
      expv[10] = 21'h0e000c;
      expv[11] = 21'h0e000c;
      expv[12] = 21'h0e000c;
      expv[13] = 21'h0e000c;
      expv[14] = 21'h0e000c;
      expv[15] = 21'h0e000c;
      expv[16] = 21'h0e000c;
      expv[17] = 21'h0e000c;
      expv[18] = 21'h0e000c;
      expv[19] = 21'h0e000c;
      expv[20] = 21'h0e000c;
      expv[21] = 21'h0e000c;
      expv[22] = 21'h0e000c;
      expv[23] = 21'h0e000c;
      expv[24] = 21'h0e000c;
      expv[25] = 21'h0e000c;
      expv[26] = 21'h0e000c;
      expv[27] = 21'h0e000c;
      expv[28] = 21'h0e000c;
      expv[29] = 21'h0e000c;
      expv[30] = 21'h0e000c;
      expv[31] = 21'h0e000c;
      expv[32] = 21'h0e000c;
      expv[33] = 21'h0e000c;
      expv[34] = 21'h0e000c;
      expv[35] = 21'h0e000c;
      expv[36] = 21'h0e000c;
      expv[37] = 21'h0e000c;
      expv[38] = 21'h0e000c;
      expv[39] = 21'h0e000c;
      expv[40] = 21'h0e000c;
      expv[41] = 21'h0e000c;
      expv[42] = 21'h0e000c;
      expv[43] = 21'h0e000c;
      expv[44] = 21'h0e000c;
      expv[45] = 21'h0e000c;
      expv[46] = 21'h0e000c;
      expv[47] = 21'h0e000c;
      expv[48] = 21'h0e000c;
      expv[49] = 21'h0e000c;
      expv[50] = 21'h0e000c;
      expv[51] = 21'h0e000c;
      expv[52] = 21'h0e000c;
      expv[53] = 21'h0e000c;
      expv[54] = 21'h0e000c;
      expv[55] = 21'h0e000c;
      expv[56] = 21'h0e000c;
      expv[57] = 21'h0e000c;
      expv[58] = 21'h0e000c;
      expv[59] = 21'h0e000c;
      expv[60] = 21'h0e000c;
      expv[61] = 21'h0e000c;
      expv[62] = 21'h0e000c;
      expv[63] = 21'h0e000c;
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
