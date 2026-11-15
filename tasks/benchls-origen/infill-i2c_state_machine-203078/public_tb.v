// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203078 dut (
    .scl(clk),
    .reset(in_vec[1:1]),
    .sda(in_vec[0:0]),
    .out(out_vec[64:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h1;
    stim[9] = 2'h3;
    stim[10] = 2'h0;
    stim[11] = 2'h0;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h1;
    stim[15] = 2'h0;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h1;
    stim[22] = 2'h1;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h1;
    stim[26] = 2'h1;
    stim[27] = 2'h0;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h1;
    stim[35] = 2'h1;
    stim[36] = 2'h0;
    stim[37] = 2'h1;
    stim[38] = 2'h1;
    stim[39] = 2'h1;
    stim[40] = 2'h0;
    stim[41] = 2'h1;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h1;
    stim[46] = 2'h3;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h1;
    stim[52] = 2'h1;
    stim[53] = 2'h1;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h1;
    stim[59] = 2'h0;
    stim[60] = 2'h0;
    stim[61] = 2'h1;
    stim[62] = 2'h1;
    stim[63] = 2'h1;
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
      expv[0] = 65'h00000000000000001;
      expv[1] = 65'h00000000000000001;
      expv[2] = 65'h00000000000000001;
      expv[3] = 65'h00000000000000002;
      expv[4] = 65'h00000000000000003;
      expv[5] = 65'h00000000000000001;
      expv[6] = 65'h00000000000000002;
      expv[7] = 65'h00000000000000001;
      expv[8] = 65'h00000000000000001;
      expv[9] = 65'h00000000000000001;
      expv[10] = 65'h00000000000000001;
      expv[11] = 65'h00000000000000002;
      expv[12] = 65'h00000000000000003;
      expv[13] = 65'h00000000000000001;
      expv[14] = 65'h00000000000000002;
      expv[15] = 65'h00000000000000001;
      expv[16] = 65'h00000000000000002;
      expv[17] = 65'h00000000000000001;
      expv[18] = 65'h00000000000000002;
      expv[19] = 65'h00000000000000001;
      expv[20] = 65'h00000000000000002;
      expv[21] = 65'h00000000000000003;
      expv[22] = 65'h00000000000000001;
      expv[23] = 65'h00000000000000001;
      expv[24] = 65'h00000000000000002;
      expv[25] = 65'h00000000000000001;
      expv[26] = 65'h00000000000000001;
      expv[27] = 65'h00000000000000001;
      expv[28] = 65'h00000000000000002;
      expv[29] = 65'h00000000000000001;
      expv[30] = 65'h00000000000000001;
      expv[31] = 65'h00000000000000002;
      expv[32] = 65'h00000000000000003;
      expv[33] = 65'h00000000000000001;
      expv[34] = 65'h00000000000000001;
      expv[35] = 65'h00000000000000001;
      expv[36] = 65'h00000000000000001;
      expv[37] = 65'h00000000000000002;
      expv[38] = 65'h00000000000000001;
      expv[39] = 65'h00000000000000001;
      expv[40] = 65'h00000000000000001;
      expv[41] = 65'h00000000000000002;
      expv[42] = 65'h00000000000000001;
      expv[43] = 65'h00000000000000002;
      expv[44] = 65'h00000000000000003;
      expv[45] = 65'h00000000000000004;
      expv[46] = 65'h00000000000000001;
      expv[47] = 65'h00000000000000001;
      expv[48] = 65'h00000000000000002;
      expv[49] = 65'h00000000000000003;
      expv[50] = 65'h00000000000000004;
      expv[51] = 65'h00000000000000005;
      expv[52] = 65'h00000000000000001;
      expv[53] = 65'h00000000000000001;
      expv[54] = 65'h00000000000000001;
      expv[55] = 65'h00000000000000001;
      expv[56] = 65'h00000000000000001;
      expv[57] = 65'h00000000000000001;
      expv[58] = 65'h00000000000000002;
      expv[59] = 65'h00000000000000001;
      expv[60] = 65'h00000000000000002;
      expv[61] = 65'h00000000000000003;
      expv[62] = 65'h00000000000000001;
      expv[63] = 65'h00000000000000001;
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
