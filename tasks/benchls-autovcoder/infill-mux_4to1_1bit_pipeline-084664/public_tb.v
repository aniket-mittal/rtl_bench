// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084664 dut (
    .clock(clk),
    .reset(in_vec[11:11]),
    .io_selects_0_0(in_vec[10:9]),
    .io_selects_0_1(in_vec[8:7]),
    .io_operation_0(in_vec[6:4]),
    .io_inputs_0(in_vec[3:3]),
    .io_inputs_1(in_vec[2:2]),
    .io_inputs_2(in_vec[1:1]),
    .io_inputs_3(in_vec[0:0]),
    .io_outputs_0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'ha02;
    stim[1] = 12'hc95;
    stim[2] = 12'h577;
    stim[3] = 12'h7bf;
    stim[4] = 12'h280;
    stim[5] = 12'h3f6;
    stim[6] = 12'h073;
    stim[7] = 12'h3fd;
    stim[8] = 12'h0ac;
    stim[9] = 12'h67e;
    stim[10] = 12'h4f9;
    stim[11] = 12'h622;
    stim[12] = 12'h279;
    stim[13] = 12'h102;
    stim[14] = 12'h311;
    stim[15] = 12'h034;
    stim[16] = 12'h4f2;
    stim[17] = 12'h024;
    stim[18] = 12'h309;
    stim[19] = 12'h0b2;
    stim[20] = 12'h638;
    stim[21] = 12'h014;
    stim[22] = 12'h1d9;
    stim[23] = 12'h3ec;
    stim[24] = 12'h5b7;
    stim[25] = 12'h1cd;
    stim[26] = 12'h3da;
    stim[27] = 12'h583;
    stim[28] = 12'h2f4;
    stim[29] = 12'h3bf;
    stim[30] = 12'h569;
    stim[31] = 12'h651;
    stim[32] = 12'h4b6;
    stim[33] = 12'h312;
    stim[34] = 12'h3c1;
    stim[35] = 12'h17c;
    stim[36] = 12'h4e8;
    stim[37] = 12'h177;
    stim[38] = 12'h776;
    stim[39] = 12'h37b;
    stim[40] = 12'h54a;
    stim[41] = 12'h51f;
    stim[42] = 12'h8b2;
    stim[43] = 12'h7dc;
    stim[44] = 12'h7b3;
    stim[45] = 12'h6e5;
    stim[46] = 12'h7b3;
    stim[47] = 12'h1da;
    stim[48] = 12'h539;
    stim[49] = 12'h7eb;
    stim[50] = 12'h3d4;
    stim[51] = 12'h6d3;
    stim[52] = 12'h343;
    stim[53] = 12'h015;
    stim[54] = 12'h42f;
    stim[55] = 12'h75d;
    stim[56] = 12'h2d3;
    stim[57] = 12'h623;
    stim[58] = 12'h7a5;
    stim[59] = 12'h154;
    stim[60] = 12'h4fd;
    stim[61] = 12'h42b;
    stim[62] = 12'h42e;
    stim[63] = 12'h257;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'hx;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'hx;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'hx;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'hx;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
