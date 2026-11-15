// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 62;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056401 dut (
    .ir(in_vec[17:0]),
    .rs1(out_vec[61:57]),
    .rs2(out_vec[56:52]),
    .rd(out_vec[51:47]),
    .imm(out_vec[46:29]),
    .imm_s1(out_vec[28:28]),
    .imm_s2(out_vec[27:27]),
    .do_alu(out_vec[26:26]),
    .do_shift(out_vec[25:25]),
    .do_write(out_vec[24:24]),
    .do_readkbd(out_vec[23:23]),
    .do_stb(out_vec[22:22]),
    .do_jump(out_vec[21:21]),
    .alu_op(out_vec[20:17]),
    .shift_op(out_vec[16:15]),
    .jump_offset(out_vec[14:3]),
    .cond(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h14a0b;
    stim[1] = 18'h37240;
    stim[2] = 18'h2c7ec;
    stim[3] = 18'h3478c;
    stim[4] = 18'h0e599;
    stim[5] = 18'h3939e;
    stim[6] = 18'h12aac;
    stim[7] = 18'h2c089;
    stim[8] = 18'h1380d;
    stim[9] = 18'h257b8;
    stim[10] = 18'h157df;
    stim[11] = 18'h2a782;
    stim[12] = 18'h1f777;
    stim[13] = 18'h38d0a;
    stim[14] = 18'h02a21;
    stim[15] = 18'h235e2;
    stim[16] = 18'h0247e;
    stim[17] = 18'h25611;
    stim[18] = 18'h30d0a;
    stim[19] = 18'h19e47;
    stim[20] = 18'h222f2;
    stim[21] = 18'h2efff;
    stim[22] = 18'h06698;
    stim[23] = 18'h1d9fd;
    stim[24] = 18'h39c84;
    stim[25] = 18'h0bcaf;
    stim[26] = 18'h3d07f;
    stim[27] = 18'h0b8c2;
    stim[28] = 18'h11830;
    stim[29] = 18'h344d8;
    stim[30] = 18'h025be;
    stim[31] = 18'h121f2;
    stim[32] = 18'h11a25;
    stim[33] = 18'h3d713;
    stim[34] = 18'h2da0c;
    stim[35] = 18'h0dece;
    stim[36] = 18'h195be;
    stim[37] = 18'h394e4;
    stim[38] = 18'h0c12e;
    stim[39] = 18'h34f30;
    stim[40] = 18'h38678;
    stim[41] = 18'h0bcae;
    stim[42] = 18'h1bac9;
    stim[43] = 18'h1d7bf;
    stim[44] = 18'h1eca8;
    stim[45] = 18'h3f072;
    stim[46] = 18'h0cf31;
    stim[47] = 18'h225a9;
    stim[48] = 18'h203ae;
    stim[49] = 18'h2c7d0;
    stim[50] = 18'h34b6f;
    stim[51] = 18'h2ed03;
    stim[52] = 18'h2e679;
    stim[53] = 18'h33646;
    stim[54] = 18'h30fae;
    stim[55] = 18'h37ae6;
    stim[56] = 18'h24f3a;
    stim[57] = 18'h0970a;
    stim[58] = 18'h2ba12;
    stim[59] = 18'h36b48;
    stim[60] = 18'h12dae;
    stim[61] = 18'h180a0;
    stim[62] = 18'h262c9;
    stim[63] = 18'h2170d;
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
      expv[0] = 62'h282a000000000000;
      expv[1] = 62'h090b80012c0a0000;
      expv[2] = 62'h1fb6000000000000;
      expv[3] = 62'h1e3a0003cd000000;
      expv[4] = 62'h1667000000000000;
      expv[5] = 62'h0e7c800000000000;
      expv[6] = 62'h2ab9000000400000;
      expv[7] = 62'h0226000000000000;
      expv[8] = 62'h2039800000000000;
      expv[9] = 62'h1ee2800000000000;
      expv[10] = 62'h1f7a800000000000;
      expv[11] = 62'h1e05000000000000;
      expv[12] = 62'h1ddf800000203bbf;
      expv[13] = 62'h342c000000000000;
      expv[14] = 62'h2881000005040000;
      expv[15] = 62'h178f800001202f10;
      expv[16] = 62'h11f1000005040000;
      expv[17] = 62'h1842800000000000;
      expv[18] = 62'h342800068d040000;
      expv[19] = 62'h391c800000207239;
      expv[20] = 62'h0bcf800001201790;
      expv[21] = 62'h3ff7000000000000;
      expv[22] = 62'h1a63000000000000;
      expv[23] = 62'h27fe800000204fed;
      expv[24] = 62'h321c800000000000;
      expv[25] = 62'h32b5800000000000;
      expv[26] = 62'h01fe800000000000;
      expv[27] = 62'h2305800000000000;
      expv[28] = 62'h20c8800000000000;
      expv[29] = 62'h136a00026d000000;
      expv[30] = 62'h16f1000005040000;
      expv[31] = 62'h07c9000000400000;
      expv[32] = 62'h2898800000000000;
      expv[33] = 62'h1c4e800000000000;
      expv[34] = 62'h2836800000000000;
      expv[35] = 62'h3b36800000000000;
      expv[36] = 62'h16fc800000202df1;
      expv[37] = 62'h139c800000000000;
      expv[38] = 62'h04b6000000000000;
      expv[39] = 62'h3cca7fff8d000000;
      expv[40] = 62'h19ec000000000000;
      expv[41] = 62'h32b5800000000000;
      expv[42] = 62'h2b2d80000020564b;
      expv[43] = 62'h1efe800000203dfd;
      expv[44] = 62'h32af000000206546;
      expv[45] = 62'h01cf800000000000;
      expv[46] = 62'h3cc6000000000000;
      expv[47] = 62'h16af800001202d48;
      expv[48] = 62'h0ebf800001201d70;
      expv[49] = 62'h1f46000000000000;
      expv[50] = 62'h2dba7ffdad000000;
      expv[51] = 62'h3407000000000000;
      expv[52] = 62'h19e7000000000000;
      expv[53] = 62'h1919b23011000000;
      expv[54] = 62'h3eb80007cd040000;
      expv[55] = 62'h2b9bfffd6c0a0000;
      expv[56] = 62'h3ce2000000000000;
      expv[57] = 62'h1c24800003008000;
      expv[58] = 62'h2845800000000000;
      expv[59] = 62'h2d2b7ffdac0a0000;
      expv[60] = 62'h36b9000000400000;
      expv[61] = 62'h028c000000200500;
      expv[62] = 62'h0b23000000000000;
      expv[63] = 62'h1c3f800001203868;
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
