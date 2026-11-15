// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02765 dut (
    .clk0(clk),
    .reset(in_vec[20:20]),
    .refresh_count(in_vec[19:4]),
    .bur_len(in_vec[3:1]),
    .ref_ack(in_vec[0:0]),
    .ref_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h11623d;
    stim[1] = 21'h17273e;
    stim[2] = 21'h033e88;
    stim[3] = 21'h0ccd6d;
    stim[4] = 21'h035fbf;
    stim[5] = 21'h0b0d1b;
    stim[6] = 21'h0f376b;
    stim[7] = 21'h09d7ba;
    stim[8] = 21'h058fef;
    stim[9] = 21'h09d8db;
    stim[10] = 21'h0630b5;
    stim[11] = 21'h0da925;
    stim[12] = 21'h0fb135;
    stim[13] = 21'h0bb88b;
    stim[14] = 21'h0bc862;
    stim[15] = 21'h003c5d;
    stim[16] = 21'h00de41;
    stim[17] = 21'h0b19f0;
    stim[18] = 21'h02eb8f;
    stim[19] = 21'h05f3fc;
    stim[20] = 21'h0a0530;
    stim[21] = 21'h01f711;
    stim[22] = 21'h0872e5;
    stim[23] = 21'h0f72dd;
    stim[24] = 21'h0eb414;
    stim[25] = 21'h13bbf0;
    stim[26] = 21'h016f62;
    stim[27] = 21'h0ee308;
    stim[28] = 21'h067d48;
    stim[29] = 21'h0c203e;
    stim[30] = 21'h04d80b;
    stim[31] = 21'h091e79;
    stim[32] = 21'h070343;
    stim[33] = 21'h05ac5e;
    stim[34] = 21'h0ea0c7;
    stim[35] = 21'h0d6062;
    stim[36] = 21'h0b14c0;
    stim[37] = 21'h047d09;
    stim[38] = 21'h072469;
    stim[39] = 21'h0c5ac6;
    stim[40] = 21'h09c667;
    stim[41] = 21'h01f855;
    stim[42] = 21'h093fe5;
    stim[43] = 21'h091928;
    stim[44] = 21'h0f4246;
    stim[45] = 21'h0bb5f3;
    stim[46] = 21'h0e066b;
    stim[47] = 21'h02c6e7;
    stim[48] = 21'h06b234;
    stim[49] = 21'h0fe7ea;
    stim[50] = 21'h0fa0ab;
    stim[51] = 21'h0b2e15;
    stim[52] = 21'h058b46;
    stim[53] = 21'h0eea66;
    stim[54] = 21'h0ead4f;
    stim[55] = 21'h02ab0f;
    stim[56] = 21'h047e7b;
    stim[57] = 21'h00d0d6;
    stim[58] = 21'h03b72d;
    stim[59] = 21'h0adae4;
    stim[60] = 21'h02fa5f;
    stim[61] = 21'h01f7ac;
    stim[62] = 21'h062499;
    stim[63] = 21'h0b7a3a;
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
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
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
