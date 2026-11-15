// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_205277 dut (
    .opcode(in_vec[13:8]),
    .func(in_vec[7:2]),
    .MIO_ready(in_vec[1:1]),
    .zero(in_vec[0:0]),
    .RegDst(out_vec[12:12]),
    .ALUSrc_B(out_vec[11:11]),
    .DatatoReg(out_vec[10:10]),
    .Jal(out_vec[9:9]),
    .Branch(out_vec[8:7]),
    .RegWrite(out_vec[6:6]),
    .mem_w(out_vec[5:5]),
    .ALU_Control(out_vec[4:1]),
    .CPU_MIO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h1761;
    stim[1] = 14'h0289;
    stim[2] = 14'h0abf;
    stim[3] = 14'h2fd6;
    stim[4] = 14'h0024;
    stim[5] = 14'h3271;
    stim[6] = 14'h3804;
    stim[7] = 14'h0762;
    stim[8] = 14'h0774;
    stim[9] = 14'h230d;
    stim[10] = 14'h2ae1;
    stim[11] = 14'h2e80;
    stim[12] = 14'h0d17;
    stim[13] = 14'h0a84;
    stim[14] = 14'h1f24;
    stim[15] = 14'h1b41;
    stim[16] = 14'h2d83;
    stim[17] = 14'h0685;
    stim[18] = 14'h2092;
    stim[19] = 14'h076b;
    stim[20] = 14'h1ca7;
    stim[21] = 14'h02f3;
    stim[22] = 14'h3cab;
    stim[23] = 14'h03c6;
    stim[24] = 14'h3b6b;
    stim[25] = 14'h389a;
    stim[26] = 14'h32e3;
    stim[27] = 14'h03c9;
    stim[28] = 14'h10ec;
    stim[29] = 14'h2efa;
    stim[30] = 14'h11a5;
    stim[31] = 14'h2055;
    stim[32] = 14'h3968;
    stim[33] = 14'h0e43;
    stim[34] = 14'h3d49;
    stim[35] = 14'h2000;
    stim[36] = 14'h12ef;
    stim[37] = 14'h2cd2;
    stim[38] = 14'h135d;
    stim[39] = 14'h0956;
    stim[40] = 14'h1765;
    stim[41] = 14'h39e9;
    stim[42] = 14'h1778;
    stim[43] = 14'h3c8d;
    stim[44] = 14'h08a6;
    stim[45] = 14'h3995;
    stim[46] = 14'h1a64;
    stim[47] = 14'h2bdb;
    stim[48] = 14'h1899;
    stim[49] = 14'h068b;
    stim[50] = 14'h1328;
    stim[51] = 14'h0a44;
    stim[52] = 14'h374f;
    stim[53] = 14'h285f;
    stim[54] = 14'h089d;
    stim[55] = 14'h1b1d;
    stim[56] = 14'h0e5d;
    stim[57] = 14'h27a1;
    stim[58] = 14'h1ade;
    stim[59] = 14'h14ab;
    stim[60] = 14'h0d99;
    stim[61] = 14'h1d4f;
    stim[62] = 14'h2162;
    stim[63] = 14'h2736;
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
      expv[0] = 13'hxx00;
      expv[1] = 13'hxx00;
      expv[2] = 13'hxx00;
      expv[3] = 13'hxx00;
      expv[4] = 13'h1040;
      expv[5] = 13'hxx00;
      expv[6] = 13'hxx00;
      expv[7] = 13'hxx00;
      expv[8] = 13'hxx00;
      expv[9] = 13'h0c45;
      expv[10] = 13'hxx00;
      expv[11] = 13'hxx00;
      expv[12] = 13'hxx00;
      expv[13] = 13'hxx00;
      expv[14] = 13'hxx00;
      expv[15] = 13'hxx00;
      expv[16] = 13'hxx00;
      expv[17] = 13'hxx00;
      expv[18] = 13'hxx00;
      expv[19] = 13'hxx00;
      expv[20] = 13'hxx00;
      expv[21] = 13'hxx00;
      expv[22] = 13'hxx00;
      expv[23] = 13'h0bc4;
      expv[24] = 13'hxx00;
      expv[25] = 13'hxx00;
      expv[26] = 13'hxx00;
      expv[27] = 13'h0bc4;
      expv[28] = 13'hxx00;
      expv[29] = 13'hxx00;
      expv[30] = 13'hxx00;
      expv[31] = 13'hxx00;
      expv[32] = 13'hxx00;
      expv[33] = 13'hxx00;
      expv[34] = 13'hxx00;
      expv[35] = 13'hxx00;
      expv[36] = 13'hxx00;
      expv[37] = 13'hxx00;
      expv[38] = 13'hxx00;
      expv[39] = 13'hxx00;
      expv[40] = 13'hxx00;
      expv[41] = 13'hxx00;
      expv[42] = 13'hxx00;
      expv[43] = 13'hxx00;
      expv[44] = 13'hxx00;
      expv[45] = 13'hxx00;
      expv[46] = 13'hxx00;
      expv[47] = 13'hxx25;
      expv[48] = 13'hxx00;
      expv[49] = 13'hxx00;
      expv[50] = 13'hxx00;
      expv[51] = 13'hxx00;
      expv[52] = 13'hxx00;
      expv[53] = 13'hxx00;
      expv[54] = 13'hxx00;
      expv[55] = 13'hxx00;
      expv[56] = 13'hxx00;
      expv[57] = 13'hxx00;
      expv[58] = 13'hxx00;
      expv[59] = 13'hxx00;
      expv[60] = 13'hxx00;
      expv[61] = 13'hxx00;
      expv[62] = 13'hxx00;
      expv[63] = 13'hxx00;
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
