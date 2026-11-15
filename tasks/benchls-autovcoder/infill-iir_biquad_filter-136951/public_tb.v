// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_136951 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .x(in_vec[15:0]),
    .y(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h108ae;
    stim[1] = 17'h103f3;
    stim[2] = 17'h0cd22;
    stim[3] = 17'h0b674;
    stim[4] = 17'h04859;
    stim[5] = 17'h07d50;
    stim[6] = 17'h076d8;
    stim[7] = 17'h028a5;
    stim[8] = 17'h0a9cd;
    stim[9] = 17'h092da;
    stim[10] = 17'h027ac;
    stim[11] = 17'h0b3be;
    stim[12] = 17'h0d928;
    stim[13] = 17'h0b5b3;
    stim[14] = 17'h0dbb8;
    stim[15] = 17'h012ca;
    stim[16] = 17'h090c1;
    stim[17] = 17'h018e8;
    stim[18] = 17'h0c25c;
    stim[19] = 17'h077d7;
    stim[20] = 17'h0ec30;
    stim[21] = 17'h0f09e;
    stim[22] = 17'h04302;
    stim[23] = 17'h0d033;
    stim[24] = 17'h0af35;
    stim[25] = 17'h02e23;
    stim[26] = 17'h02d9e;
    stim[27] = 17'h061b6;
    stim[28] = 17'h00ea4;
    stim[29] = 17'h01f50;
    stim[30] = 17'h0915d;
    stim[31] = 17'h0f576;
    stim[32] = 17'h1a2d3;
    stim[33] = 17'h099ba;
    stim[34] = 17'h0d5b8;
    stim[35] = 17'h0dfc8;
    stim[36] = 17'h0724d;
    stim[37] = 17'h075df;
    stim[38] = 17'h0de9c;
    stim[39] = 17'h01992;
    stim[40] = 17'h0f62e;
    stim[41] = 17'h0f776;
    stim[42] = 17'h07cca;
    stim[43] = 17'h07973;
    stim[44] = 17'h01cb8;
    stim[45] = 17'h0c71e;
    stim[46] = 17'h0e558;
    stim[47] = 17'h08695;
    stim[48] = 17'h08a31;
    stim[49] = 17'h05333;
    stim[50] = 17'h0f970;
    stim[51] = 17'h020e4;
    stim[52] = 17'h017e5;
    stim[53] = 17'h069bd;
    stim[54] = 17'h09a7d;
    stim[55] = 17'h0b21d;
    stim[56] = 17'h04580;
    stim[57] = 17'h0fe5d;
    stim[58] = 17'h08639;
    stim[59] = 17'h0efc6;
    stim[60] = 17'h05f77;
    stim[61] = 17'h09ec9;
    stim[62] = 17'h04651;
    stim[63] = 17'h043ae;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h1006;
      expv[5] = 16'h1e47;
      expv[6] = 16'h23ee;
      expv[7] = 16'h2dd8;
      expv[8] = 16'h375e;
      expv[9] = 16'h2acc;
      expv[10] = 16'h2a2b;
      expv[11] = 16'h304b;
      expv[12] = 16'h29b4;
      expv[13] = 16'h2e82;
      expv[14] = 16'h3c51;
      expv[15] = 16'h3d24;
      expv[16] = 16'h42dd;
      expv[17] = 16'h415f;
      expv[18] = 16'h3ebd;
      expv[19] = 16'h2feb;
      expv[20] = 16'h310d;
      expv[21] = 16'h2945;
      expv[22] = 16'h3a26;
      expv[23] = 16'h4180;
      expv[24] = 16'h449a;
      expv[25] = 16'h45a5;
      expv[26] = 16'h4a1c;
      expv[27] = 16'h3b6a;
      expv[28] = 16'h2c67;
      expv[29] = 16'h2eed;
      expv[30] = 16'h1fc1;
      expv[31] = 16'h1453;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0c02;
      expv[36] = 16'h1cb4;
      expv[37] = 16'h2e30;
      expv[38] = 16'h3736;
      expv[39] = 16'h40a5;
      expv[40] = 16'h4663;
      expv[41] = 16'h381e;
      expv[42] = 16'h3a48;
      expv[43] = 16'h4502;
      expv[44] = 16'h45a0;
      expv[45] = 16'h3dbf;
      expv[46] = 16'h3e07;
      expv[47] = 16'h3a58;
      expv[48] = 16'h38f9;
      expv[49] = 16'h39c5;
      expv[50] = 16'h3afe;
      expv[51] = 16'h3f26;
      expv[52] = 16'h430d;
      expv[53] = 16'h33ae;
      expv[54] = 16'h2b12;
      expv[55] = 16'h289d;
      expv[56] = 16'h2e22;
      expv[57] = 16'h2870;
      expv[58] = 16'h2b1f;
      expv[59] = 16'h3cf7;
      expv[60] = 16'h3f1a;
      expv[61] = 16'h45c4;
      expv[62] = 16'h3f77;
      expv[63] = 16'h4693;
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
