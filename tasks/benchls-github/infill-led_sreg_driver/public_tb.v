// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  led_sreg_driver dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .led_a(in_vec[15:8]),
    .led_b(in_vec[7:0]),
    .sreg_d(out_vec[2:2]),
    .sreg_ld(out_vec[1:1]),
    .sreg_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1dac5;
    stim[1] = 17'h1439f;
    stim[2] = 17'h0d849;
    stim[3] = 17'h0f12e;
    stim[4] = 17'h0b3db;
    stim[5] = 17'h06525;
    stim[6] = 17'h0dd72;
    stim[7] = 17'h072bc;
    stim[8] = 17'h0710d;
    stim[9] = 17'h05a55;
    stim[10] = 17'h0939a;
    stim[11] = 17'h066d6;
    stim[12] = 17'h0f320;
    stim[13] = 17'h04301;
    stim[14] = 17'h0e7f4;
    stim[15] = 17'h0b3d3;
    stim[16] = 17'h09c0a;
    stim[17] = 17'h08c29;
    stim[18] = 17'h0e453;
    stim[19] = 17'h0ca28;
    stim[20] = 17'h0f8c5;
    stim[21] = 17'h08ac2;
    stim[22] = 17'h08d36;
    stim[23] = 17'h077ae;
    stim[24] = 17'h0bf17;
    stim[25] = 17'h0a733;
    stim[26] = 17'h0067f;
    stim[27] = 17'h0f5c9;
    stim[28] = 17'h06162;
    stim[29] = 17'h0f70f;
    stim[30] = 17'h0be6d;
    stim[31] = 17'h1b591;
    stim[32] = 17'h091cb;
    stim[33] = 17'h0f11b;
    stim[34] = 17'h0c454;
    stim[35] = 17'h057db;
    stim[36] = 17'h053cb;
    stim[37] = 17'h005fe;
    stim[38] = 17'h04d05;
    stim[39] = 17'h0dee7;
    stim[40] = 17'h0a273;
    stim[41] = 17'h0e9c6;
    stim[42] = 17'h0cfce;
    stim[43] = 17'h07c69;
    stim[44] = 17'h0c487;
    stim[45] = 17'h066ac;
    stim[46] = 17'h0fc92;
    stim[47] = 17'h09879;
    stim[48] = 17'h050fc;
    stim[49] = 17'h0c880;
    stim[50] = 17'h0b224;
    stim[51] = 17'h0c5ef;
    stim[52] = 17'h0f39e;
    stim[53] = 17'h077f2;
    stim[54] = 17'h0ff7a;
    stim[55] = 17'h042fe;
    stim[56] = 17'h05814;
    stim[57] = 17'h0d747;
    stim[58] = 17'h0c135;
    stim[59] = 17'h0f000;
    stim[60] = 17'h0afed;
    stim[61] = 17'h0851b;
    stim[62] = 17'h0c851;
    stim[63] = 17'h04808;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
