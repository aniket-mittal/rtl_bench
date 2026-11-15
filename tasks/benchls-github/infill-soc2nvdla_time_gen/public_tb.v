// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  soc2nvdla_time_gen dut (
    .clk(clk),
    .reset_(in_vec[0:0]),
    .soc2nvdla_time1_gray(out_vec[56:28]),
    .soc2nvdla_time0_gray(out_vec[27:1]),
    .soc2nvdla_time_tick(out_vec[0:0])
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
    stim[22] = 1'h0;
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
    stim[56] = 1'h1;
    stim[57] = 1'h0;
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
      expv[0] = 57'h000000000000000;
      expv[1] = 57'h000000000000002;
      expv[2] = 57'h000000000000000;
      expv[3] = 57'h000000000000000;
      expv[4] = 57'h000000000000000;
      expv[5] = 57'h000000000000000;
      expv[6] = 57'h000000000000000;
      expv[7] = 57'h000000000000000;
      expv[8] = 57'h000000000000000;
      expv[9] = 57'h000000000000000;
      expv[10] = 57'h000000000000000;
      expv[11] = 57'h000000000000000;
      expv[12] = 57'h000000000000000;
      expv[13] = 57'h000000000000000;
      expv[14] = 57'h000000000000000;
      expv[15] = 57'h000000000000000;
      expv[16] = 57'h000000000000000;
      expv[17] = 57'h000000000000000;
      expv[18] = 57'h000000000000000;
      expv[19] = 57'h000000000000000;
      expv[20] = 57'h000000000000000;
      expv[21] = 57'h000000000000000;
      expv[22] = 57'h000000000000000;
      expv[23] = 57'h000000000000000;
      expv[24] = 57'h000000000000000;
      expv[25] = 57'h000000000000000;
      expv[26] = 57'h000000000000000;
      expv[27] = 57'h000000000000000;
      expv[28] = 57'h000000000000000;
      expv[29] = 57'h000000000000000;
      expv[30] = 57'h000000000000000;
      expv[31] = 57'h000000000000000;
      expv[32] = 57'h000000000000000;
      expv[33] = 57'h000000000000000;
      expv[34] = 57'h000000000000000;
      expv[35] = 57'h000000000000000;
      expv[36] = 57'h000000000000000;
      expv[37] = 57'h000000000000000;
      expv[38] = 57'h000000000000000;
      expv[39] = 57'h000000000000000;
      expv[40] = 57'h000000000000000;
      expv[41] = 57'h000000000000000;
      expv[42] = 57'h000000000000000;
      expv[43] = 57'h000000000000000;
      expv[44] = 57'h000000000000000;
      expv[45] = 57'h000000000000000;
      expv[46] = 57'h000000000000000;
      expv[47] = 57'h000000000000000;
      expv[48] = 57'h000000000000000;
      expv[49] = 57'h000000000000000;
      expv[50] = 57'h000000000000000;
      expv[51] = 57'h000000000000000;
      expv[52] = 57'h000000000000000;
      expv[53] = 57'h000000000000000;
      expv[54] = 57'h000000000000000;
      expv[55] = 57'h000000000000000;
      expv[56] = 57'h000000000000000;
      expv[57] = 57'h000000000000000;
      expv[58] = 57'h000000000000000;
      expv[59] = 57'h000000000000000;
      expv[60] = 57'h000000000000000;
      expv[61] = 57'h000000000000000;
      expv[62] = 57'h000000000000000;
      expv[63] = 57'h000000000000000;
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
