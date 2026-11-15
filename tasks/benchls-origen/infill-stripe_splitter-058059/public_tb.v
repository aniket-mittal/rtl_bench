// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058059 dut (
    .clk_2f(clk),
    .data_mux(in_vec[9:2]),
    .valid_mux(in_vec[1:1]),
    .reset_L(in_vec[0:0]),
    .data_stripe_0(out_vec[17:10]),
    .data_stripe_1(out_vec[9:2]),
    .valid_stripe_0(out_vec[1:1]),
    .valid_stripe_1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h099;
    stim[1] = 10'h1ed;
    stim[2] = 10'h3ac;
    stim[3] = 10'h166;
    stim[4] = 10'h1b2;
    stim[5] = 10'h0b0;
    stim[6] = 10'h13a;
    stim[7] = 10'h370;
    stim[8] = 10'h0a0;
    stim[9] = 10'h1b6;
    stim[10] = 10'h07a;
    stim[11] = 10'h104;
    stim[12] = 10'h2de;
    stim[13] = 10'h00e;
    stim[14] = 10'h240;
    stim[15] = 10'h22c;
    stim[16] = 10'h370;
    stim[17] = 10'h1f0;
    stim[18] = 10'h318;
    stim[19] = 10'h066;
    stim[20] = 10'h106;
    stim[21] = 10'h3fc;
    stim[22] = 10'h0fd;
    stim[23] = 10'h2d0;
    stim[24] = 10'h254;
    stim[25] = 10'h3ca;
    stim[26] = 10'h116;
    stim[27] = 10'h130;
    stim[28] = 10'h08c;
    stim[29] = 10'h39c;
    stim[30] = 10'h33a;
    stim[31] = 10'h104;
    stim[32] = 10'h186;
    stim[33] = 10'h33a;
    stim[34] = 10'h33c;
    stim[35] = 10'h1c8;
    stim[36] = 10'h216;
    stim[37] = 10'h10c;
    stim[38] = 10'h2f8;
    stim[39] = 10'h3e4;
    stim[40] = 10'h04c;
    stim[41] = 10'h1dc;
    stim[42] = 10'h12e;
    stim[43] = 10'h3aa;
    stim[44] = 10'h0ed;
    stim[45] = 10'h14a;
    stim[46] = 10'h39a;
    stim[47] = 10'h222;
    stim[48] = 10'h3e8;
    stim[49] = 10'h2dc;
    stim[50] = 10'h2be;
    stim[51] = 10'h06c;
    stim[52] = 10'h060;
    stim[53] = 10'h07c;
    stim[54] = 10'h3ea;
    stim[55] = 10'h266;
    stim[56] = 10'h1a6;
    stim[57] = 10'h006;
    stim[58] = 10'h03e;
    stim[59] = 10'h142;
    stim[60] = 10'h1b6;
    stim[61] = 10'h388;
    stim[62] = 10'h012;
    stim[63] = 10'h35a;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h09800;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
