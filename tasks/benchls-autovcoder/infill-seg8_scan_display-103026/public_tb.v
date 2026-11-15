// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103026 dut (
    .clk_24m(clk),
    .rst_n(in_vec[8:8]),
    .num(in_vec[7:0]),
    .sm_seg(out_vec[11:4]),
    .sm_bit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h031;
    stim[1] = 9'h008;
    stim[2] = 9'h17f;
    stim[3] = 9'h1db;
    stim[4] = 9'h100;
    stim[5] = 9'h11d;
    stim[6] = 9'h16c;
    stim[7] = 9'h1db;
    stim[8] = 9'h125;
    stim[9] = 9'h189;
    stim[10] = 9'h101;
    stim[11] = 9'h1ac;
    stim[12] = 9'h163;
    stim[13] = 9'h115;
    stim[14] = 9'h1fb;
    stim[15] = 9'h13d;
    stim[16] = 9'h1ce;
    stim[17] = 9'h1fe;
    stim[18] = 9'h1c3;
    stim[19] = 9'h166;
    stim[20] = 9'h03d;
    stim[21] = 9'h16d;
    stim[22] = 9'h1ae;
    stim[23] = 9'h1b2;
    stim[24] = 9'h170;
    stim[25] = 9'h11b;
    stim[26] = 9'h0e0;
    stim[27] = 9'h111;
    stim[28] = 9'h18d;
    stim[29] = 9'h11b;
    stim[30] = 9'h147;
    stim[31] = 9'h1d6;
    stim[32] = 9'h1a4;
    stim[33] = 9'h197;
    stim[34] = 9'h162;
    stim[35] = 9'h15b;
    stim[36] = 9'h149;
    stim[37] = 9'h1d9;
    stim[38] = 9'h179;
    stim[39] = 9'h11b;
    stim[40] = 9'h171;
    stim[41] = 9'h196;
    stim[42] = 9'h1ca;
    stim[43] = 9'h135;
    stim[44] = 9'h1a3;
    stim[45] = 9'h120;
    stim[46] = 9'h13f;
    stim[47] = 9'h127;
    stim[48] = 9'h17a;
    stim[49] = 9'h17e;
    stim[50] = 9'h12d;
    stim[51] = 9'h1d5;
    stim[52] = 9'h157;
    stim[53] = 9'h15b;
    stim[54] = 9'h184;
    stim[55] = 9'h14c;
    stim[56] = 9'h1a4;
    stim[57] = 9'h100;
    stim[58] = 9'h15d;
    stim[59] = 9'h198;
    stim[60] = 9'h14f;
    stim[61] = 9'h139;
    stim[62] = 9'h1de;
    stim[63] = 9'h19e;
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
      expv[0] = 12'hc0f;
      expv[1] = 12'hc0f;
      expv[2] = 12'hc0f;
      expv[3] = 12'hf8e;
      expv[4] = 12'hc0e;
      expv[5] = 12'h90e;
      expv[6] = 12'h90e;
      expv[7] = 12'h80e;
      expv[8] = 12'hc0e;
      expv[9] = 12'h90e;
      expv[10] = 12'hf8e;
      expv[11] = 12'hf8e;
      expv[12] = 12'ha4e;
      expv[13] = 12'ha4e;
      expv[14] = 12'ha4e;
      expv[15] = 12'hc0e;
      expv[16] = 12'hf9e;
      expv[17] = 12'hc0e;
      expv[18] = 12'hc0e;
      expv[19] = 12'h92e;
      expv[20] = 12'hc0f;
      expv[21] = 12'hc0f;
      expv[22] = 12'h90e;
      expv[23] = 12'h99e;
      expv[24] = 12'h80e;
      expv[25] = 12'ha4e;
      expv[26] = 12'hc0f;
      expv[27] = 12'hc0f;
      expv[28] = 12'h99e;
      expv[29] = 12'hf9e;
      expv[30] = 12'hf9e;
      expv[31] = 12'hf9e;
      expv[32] = 12'hc0e;
      expv[33] = 12'h99e;
      expv[34] = 12'hf9e;
      expv[35] = 12'hf9e;
      expv[36] = 12'hf9e;
      expv[37] = 12'hf9e;
      expv[38] = 12'hc0e;
      expv[39] = 12'hf9e;
      expv[40] = 12'hf9e;
      expv[41] = 12'hb0e;
      expv[42] = 12'hc0e;
      expv[43] = 12'hc0e;
      expv[44] = 12'ha4e;
      expv[45] = 12'hb0e;
      expv[46] = 12'hb0e;
      expv[47] = 12'hb0e;
      expv[48] = 12'hb0e;
      expv[49] = 12'ha4e;
      expv[50] = 12'h82e;
      expv[51] = 12'h82e;
      expv[52] = 12'hc0e;
      expv[53] = 12'hb0e;
      expv[54] = 12'hb0e;
      expv[55] = 12'ha4e;
      expv[56] = 12'ha4e;
      expv[57] = 12'h99e;
      expv[58] = 12'h99e;
      expv[59] = 12'h99e;
      expv[60] = 12'ha4e;
      expv[61] = 12'ha4e;
      expv[62] = 12'ha4e;
      expv[63] = 12'hc0e;
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
