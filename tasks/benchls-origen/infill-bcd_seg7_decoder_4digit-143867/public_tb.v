// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143867 dut (
    .binary_in(in_vec[4:1]),
    .reset(in_vec[0:0]),
    .seg_out_0(out_vec[27:21]),
    .seg_out_1(out_vec[20:14]),
    .seg_out_2(out_vec[13:7]),
    .seg_out_3(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1f;
    stim[1] = 5'h15;
    stim[2] = 5'h02;
    stim[3] = 5'h18;
    stim[4] = 5'h14;
    stim[5] = 5'h03;
    stim[6] = 5'h06;
    stim[7] = 5'h00;
    stim[8] = 5'h0a;
    stim[9] = 5'h14;
    stim[10] = 5'h06;
    stim[11] = 5'h0c;
    stim[12] = 5'h16;
    stim[13] = 5'h1e;
    stim[14] = 5'h08;
    stim[15] = 5'h16;
    stim[16] = 5'h06;
    stim[17] = 5'h06;
    stim[18] = 5'h17;
    stim[19] = 5'h1a;
    stim[20] = 5'h02;
    stim[21] = 5'h06;
    stim[22] = 5'h00;
    stim[23] = 5'h04;
    stim[24] = 5'h1c;
    stim[25] = 5'h0c;
    stim[26] = 5'h1e;
    stim[27] = 5'h00;
    stim[28] = 5'h1c;
    stim[29] = 5'h1a;
    stim[30] = 5'h04;
    stim[31] = 5'h0e;
    stim[32] = 5'h0e;
    stim[33] = 5'h14;
    stim[34] = 5'h10;
    stim[35] = 5'h1e;
    stim[36] = 5'h06;
    stim[37] = 5'h12;
    stim[38] = 5'h1c;
    stim[39] = 5'h00;
    stim[40] = 5'h16;
    stim[41] = 5'h0a;
    stim[42] = 5'h10;
    stim[43] = 5'h0c;
    stim[44] = 5'h1c;
    stim[45] = 5'h02;
    stim[46] = 5'h0a;
    stim[47] = 5'h0e;
    stim[48] = 5'h0c;
    stim[49] = 5'h12;
    stim[50] = 5'h12;
    stim[51] = 5'h06;
    stim[52] = 5'h0a;
    stim[53] = 5'h10;
    stim[54] = 5'h02;
    stim[55] = 5'h06;
    stim[56] = 5'h17;
    stim[57] = 5'h0c;
    stim[58] = 5'h0e;
    stim[59] = 5'h08;
    stim[60] = 5'h19;
    stim[61] = 5'h06;
    stim[62] = 5'h1a;
    stim[63] = 5'h1c;
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
      expv[0] = 28'h81020xx;
      expv[1] = 28'h81020xx;
      expv[2] = 28'hf3020xx;
      expv[3] = 28'h49e60xx;
      expv[4] = 28'h81e60xx;
      expv[5] = 28'h81020xx;
      expv[6] = 28'h61020xx;
      expv[7] = 28'h81020xx;
      expv[8] = 28'h25020xx;
      expv[9] = 28'h81e60xx;
      expv[10] = 28'h61020xx;
      expv[11] = 28'h05020xx;
      expv[12] = 28'hf3e60xx;
      expv[13] = 28'h25e60xx;
      expv[14] = 28'h33020xx;
      expv[15] = 28'hf3e60xx;
      expv[16] = 28'h61020xx;
      expv[17] = 28'h61020xx;
      expv[18] = 28'h81020xx;
      expv[19] = 28'h61e60xx;
      expv[20] = 28'hf3020xx;
      expv[21] = 28'h61020xx;
      expv[22] = 28'h81020xx;
      expv[23] = 28'h49020xx;
      expv[24] = 28'h33e60xx;
      expv[25] = 28'h05020xx;
      expv[26] = 28'h25e60xx;
      expv[27] = 28'h81020xx;
      expv[28] = 28'h33e60xx;
      expv[29] = 28'h61e60xx;
      expv[30] = 28'h49020xx;
      expv[31] = 28'hf1020xx;
      expv[32] = 28'hf1020xx;
      expv[33] = 28'h81e60xx;
      expv[34] = 28'h01020xx;
      expv[35] = 28'h25e60xx;
      expv[36] = 28'h61020xx;
      expv[37] = 28'h21020xx;
      expv[38] = 28'h33e60xx;
      expv[39] = 28'h81020xx;
      expv[40] = 28'hf3e60xx;
      expv[41] = 28'h25020xx;
      expv[42] = 28'h01020xx;
      expv[43] = 28'h05020xx;
      expv[44] = 28'h33e60xx;
      expv[45] = 28'hf3020xx;
      expv[46] = 28'h25020xx;
      expv[47] = 28'hf1020xx;
      expv[48] = 28'h05020xx;
      expv[49] = 28'h21020xx;
      expv[50] = 28'h21020xx;
      expv[51] = 28'h61020xx;
      expv[52] = 28'h25020xx;
      expv[53] = 28'h01020xx;
      expv[54] = 28'hf3020xx;
      expv[55] = 28'h61020xx;
      expv[56] = 28'h81020xx;
      expv[57] = 28'h05020xx;
      expv[58] = 28'hf1020xx;
      expv[59] = 28'h33020xx;
      expv[60] = 28'h81020xx;
      expv[61] = 28'h61020xx;
      expv[62] = 28'h61e60xx;
      expv[63] = 28'h33e60xx;
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
