// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 94;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08365 dut (
    .clk(clk),
    .reset(in_vec[1:1]),
    .pwm(in_vec[0:0]),
    .pw_low(out_vec[93:63]),
    .pw_high(out_vec[62:32]),
    .pwm_per(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h3;
    stim[2] = 2'h1;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h1;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h1;
    stim[9] = 2'h1;
    stim[10] = 2'h0;
    stim[11] = 2'h2;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h1;
    stim[25] = 2'h0;
    stim[26] = 2'h1;
    stim[27] = 2'h1;
    stim[28] = 2'h1;
    stim[29] = 2'h0;
    stim[30] = 2'h0;
    stim[31] = 2'h1;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h1;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h0;
    stim[40] = 2'h1;
    stim[41] = 2'h0;
    stim[42] = 2'h1;
    stim[43] = 2'h0;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h1;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h1;
    stim[51] = 2'h1;
    stim[52] = 2'h1;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h1;
    stim[61] = 2'h0;
    stim[62] = 2'h0;
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
      expv[0] = 94'h000000000000000000000000;
      expv[1] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 94'h00000000xxxxxxxxxxxxxxxx;
      expv[8] = 94'h000000008000000200000003;
      expv[9] = 94'h000000008000000200000003;
      expv[10] = 94'h000000008000000200000003;
      expv[11] = 94'h000000008000000200000003;
      expv[12] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 94'h00000001xxxxxxxxxxxxxxxx;
      expv[18] = 94'h00000001xxxxxxxxxxxxxxxx;
      expv[19] = 94'h00000001xxxxxxxxxxxxxxxx;
      expv[20] = 94'h000000018000000300000006;
      expv[21] = 94'h000000018000000300000006;
      expv[22] = 94'h000000018000000300000006;
      expv[23] = 94'h000000018000000300000006;
      expv[24] = 94'h000000020000000300000007;
      expv[25] = 94'h000000020000000300000007;
      expv[26] = 94'h000000020000000300000007;
      expv[27] = 94'h000000020000000300000007;
      expv[28] = 94'h000000008000000300000004;
      expv[29] = 94'h000000008000000300000004;
      expv[30] = 94'h000000008000000300000004;
      expv[31] = 94'h000000008000000300000004;
      expv[32] = 94'h000000008000000300000004;
      expv[33] = 94'h000000010000000300000005;
      expv[34] = 94'h000000010000000100000003;
      expv[35] = 94'h000000010000000100000003;
      expv[36] = 94'h000000010000000100000003;
      expv[37] = 94'h000000010000000100000003;
      expv[38] = 94'h000000008000000100000002;
      expv[39] = 94'h000000008000000100000002;
      expv[40] = 94'h000000008000000100000002;
      expv[41] = 94'h000000008000000100000002;
      expv[42] = 94'h000000018000000100000004;
      expv[43] = 94'h000000018000000100000004;
      expv[44] = 94'h000000008000000100000002;
      expv[45] = 94'h000000008000000100000002;
      expv[46] = 94'h000000008000000100000002;
      expv[47] = 94'h000000008000000100000002;
      expv[48] = 94'h000000008000000100000002;
      expv[49] = 94'h000000008000000100000002;
      expv[50] = 94'h000000008000000100000002;
      expv[51] = 94'h000000010000000100000003;
      expv[52] = 94'h000000010000000100000003;
      expv[53] = 94'h000000010000000100000003;
      expv[54] = 94'h000000010000000100000003;
      expv[55] = 94'h000000010000000400000006;
      expv[56] = 94'h000000010000000400000006;
      expv[57] = 94'h000000010000000400000006;
      expv[58] = 94'h000000010000000400000006;
      expv[59] = 94'h000000010000000200000004;
      expv[60] = 94'h000000010000000200000004;
      expv[61] = 94'h000000010000000200000004;
      expv[62] = 94'h000000018000000200000005;
      expv[63] = 94'h000000018000000100000004;
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
