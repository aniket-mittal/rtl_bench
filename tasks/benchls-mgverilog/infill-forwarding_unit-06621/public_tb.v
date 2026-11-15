// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06621 dut (
    .EX_rs(in_vec[21:17]),
    .EX_rt(in_vec[16:12]),
    .MEM_rd(in_vec[11:7]),
    .WB_rd(in_vec[6:2]),
    .MEM_RegWrite(in_vec[1:1]),
    .WB_RegWrite(in_vec[0:0]),
    .ForwardA(out_vec[3:2]),
    .ForwardB(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h14cffc;
    stim[1] = 22'h2aa206;
    stim[2] = 22'h089f5d;
    stim[3] = 22'h2db839;
    stim[4] = 22'h05c37f;
    stim[5] = 22'h238ca2;
    stim[6] = 22'h386f10;
    stim[7] = 22'h1f3e7f;
    stim[8] = 22'h3ff0f3;
    stim[9] = 22'h2d8959;
    stim[10] = 22'h3d9c37;
    stim[11] = 22'h16f2d6;
    stim[12] = 22'h327b3e;
    stim[13] = 22'h034cc4;
    stim[14] = 22'h231349;
    stim[15] = 22'h064bdc;
    stim[16] = 22'h1a560e;
    stim[17] = 22'h28e7f3;
    stim[18] = 22'h1abc8d;
    stim[19] = 22'h0ee600;
    stim[20] = 22'h090d8a;
    stim[21] = 22'h086543;
    stim[22] = 22'h19d998;
    stim[23] = 22'h362112;
    stim[24] = 22'h1ef308;
    stim[25] = 22'h1029b9;
    stim[26] = 22'h216aed;
    stim[27] = 22'h04d750;
    stim[28] = 22'h0f76f7;
    stim[29] = 22'h1079fd;
    stim[30] = 22'h08dfbe;
    stim[31] = 22'h17e65d;
    stim[32] = 22'h297f71;
    stim[33] = 22'h0525fc;
    stim[34] = 22'h0c0091;
    stim[35] = 22'h12cfa3;
    stim[36] = 22'h3bf5cc;
    stim[37] = 22'h09dcea;
    stim[38] = 22'h31d951;
    stim[39] = 22'h18f3b1;
    stim[40] = 22'h364f7c;
    stim[41] = 22'h1240d7;
    stim[42] = 22'h10fc19;
    stim[43] = 22'h1c90b5;
    stim[44] = 22'h2dafc4;
    stim[45] = 22'h17c72c;
    stim[46] = 22'h1f795b;
    stim[47] = 22'h0df4e7;
    stim[48] = 22'h19f3f1;
    stim[49] = 22'h01eb9d;
    stim[50] = 22'h3f1067;
    stim[51] = 22'h1eab39;
    stim[52] = 22'h36dd04;
    stim[53] = 22'h3036f5;
    stim[54] = 22'h0091e8;
    stim[55] = 22'h2bfc61;
    stim[56] = 22'h0bcf5a;
    stim[57] = 22'h220ce5;
    stim[58] = 22'h0c0d12;
    stim[59] = 22'h2b669c;
    stim[60] = 22'h3ad3fe;
    stim[61] = 22'h0f8a92;
    stim[62] = 22'h12392e;
    stim[63] = 22'h1a282c;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h4;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h2;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h4;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
