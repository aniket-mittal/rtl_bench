// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027303 dut (
    .alu_op(in_vec[8:6]),
    .func(in_vec[5:0]),
    .alu_code(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0a5;
    stim[1] = 9'h026;
    stim[2] = 9'h10f;
    stim[3] = 9'h1e6;
    stim[4] = 9'h1f5;
    stim[5] = 9'h1b4;
    stim[6] = 9'h1ff;
    stim[7] = 9'h05e;
    stim[8] = 9'h056;
    stim[9] = 9'h07c;
    stim[10] = 9'h0df;
    stim[11] = 9'h1b3;
    stim[12] = 9'h07b;
    stim[13] = 9'h160;
    stim[14] = 9'h191;
    stim[15] = 9'h168;
    stim[16] = 9'h1b7;
    stim[17] = 9'h170;
    stim[18] = 9'h1f2;
    stim[19] = 9'h1e1;
    stim[20] = 9'h043;
    stim[21] = 9'h143;
    stim[22] = 9'h016;
    stim[23] = 9'h145;
    stim[24] = 9'h0ca;
    stim[25] = 9'h10d;
    stim[26] = 9'h04f;
    stim[27] = 9'h0be;
    stim[28] = 9'h0c2;
    stim[29] = 9'h152;
    stim[30] = 9'h012;
    stim[31] = 9'h1ca;
    stim[32] = 9'h166;
    stim[33] = 9'h133;
    stim[34] = 9'h1c4;
    stim[35] = 9'h06a;
    stim[36] = 9'h163;
    stim[37] = 9'h197;
    stim[38] = 9'h033;
    stim[39] = 9'h106;
    stim[40] = 9'h155;
    stim[41] = 9'h1be;
    stim[42] = 9'h015;
    stim[43] = 9'h121;
    stim[44] = 9'h106;
    stim[45] = 9'h1eb;
    stim[46] = 9'h0c5;
    stim[47] = 9'h098;
    stim[48] = 9'h1b0;
    stim[49] = 9'h002;
    stim[50] = 9'h0cc;
    stim[51] = 9'h14a;
    stim[52] = 9'h110;
    stim[53] = 9'h000;
    stim[54] = 9'h061;
    stim[55] = 9'h17f;
    stim[56] = 9'h066;
    stim[57] = 9'h061;
    stim[58] = 9'h0cb;
    stim[59] = 9'h0ff;
    stim[60] = 9'h0a7;
    stim[61] = 9'h049;
    stim[62] = 9'h04c;
    stim[63] = 9'h1f1;
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
      expv[0] = 3'h1;
      expv[1] = 3'h2;
      expv[2] = 3'h6;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'h6;
      expv[8] = 3'h6;
      expv[9] = 3'h6;
      expv[10] = 3'h7;
      expv[11] = 3'hx;
      expv[12] = 3'h6;
      expv[13] = 3'hx;
      expv[14] = 3'hx;
      expv[15] = 3'hx;
      expv[16] = 3'hx;
      expv[17] = 3'hx;
      expv[18] = 3'hx;
      expv[19] = 3'hx;
      expv[20] = 3'h6;
      expv[21] = 3'hx;
      expv[22] = 3'h2;
      expv[23] = 3'hx;
      expv[24] = 3'h7;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'hx;
      expv[28] = 3'h7;
      expv[29] = 3'hx;
      expv[30] = 3'h2;
      expv[31] = 3'hx;
      expv[32] = 3'hx;
      expv[33] = 3'h6;
      expv[34] = 3'hx;
      expv[35] = 3'h6;
      expv[36] = 3'hx;
      expv[37] = 3'hx;
      expv[38] = 3'h2;
      expv[39] = 3'h6;
      expv[40] = 3'hx;
      expv[41] = 3'hx;
      expv[42] = 3'h2;
      expv[43] = 3'h6;
      expv[44] = 3'h6;
      expv[45] = 3'hx;
      expv[46] = 3'h7;
      expv[47] = 3'hx;
      expv[48] = 3'hx;
      expv[49] = 3'h2;
      expv[50] = 3'h7;
      expv[51] = 3'hx;
      expv[52] = 3'h6;
      expv[53] = 3'h2;
      expv[54] = 3'h6;
      expv[55] = 3'hx;
      expv[56] = 3'h6;
      expv[57] = 3'h6;
      expv[58] = 3'h7;
      expv[59] = 3'h7;
      expv[60] = 3'hx;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'hx;
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
