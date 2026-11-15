// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176538 dut (
    .zero(in_vec[13:13]),
    .OP(in_vec[12:7]),
    .func(in_vec[6:1]),
    .sign(in_vec[0:0]),
    .PCWre(out_vec[14:14]),
    .ALUSrcA(out_vec[13:13]),
    .ALUSrcB(out_vec[12:12]),
    .DBDataSrc(out_vec[11:11]),
    .RegWre(out_vec[10:10]),
    .InsMemRW(out_vec[9:9]),
    .mRD(out_vec[8:8]),
    .mWR(out_vec[7:7]),
    .RegDst(out_vec[6:6]),
    .ExtSel(out_vec[5:5]),
    .ALUOp(out_vec[4:2]),
    .PCSrc(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2c81;
    stim[1] = 14'h37f2;
    stim[2] = 14'h2d44;
    stim[3] = 14'h2a84;
    stim[4] = 14'h1ab4;
    stim[5] = 14'h1531;
    stim[6] = 14'h02d6;
    stim[7] = 14'h3746;
    stim[8] = 14'h053f;
    stim[9] = 14'h3b8d;
    stim[10] = 14'h242b;
    stim[11] = 14'h2d9a;
    stim[12] = 14'h194d;
    stim[13] = 14'h2287;
    stim[14] = 14'h373a;
    stim[15] = 14'h1595;
    stim[16] = 14'h29e3;
    stim[17] = 14'h364a;
    stim[18] = 14'h2b4d;
    stim[19] = 14'h1061;
    stim[20] = 14'h1dc5;
    stim[21] = 14'h123b;
    stim[22] = 14'h0857;
    stim[23] = 14'h19ae;
    stim[24] = 14'h1f46;
    stim[25] = 14'h0be3;
    stim[26] = 14'h29b6;
    stim[27] = 14'h1434;
    stim[28] = 14'h2867;
    stim[29] = 14'h392c;
    stim[30] = 14'h3200;
    stim[31] = 14'h19d3;
    stim[32] = 14'h1402;
    stim[33] = 14'h2b91;
    stim[34] = 14'h3637;
    stim[35] = 14'h2d50;
    stim[36] = 14'h0c24;
    stim[37] = 14'h2431;
    stim[38] = 14'h1868;
    stim[39] = 14'h22c7;
    stim[40] = 14'h2f5a;
    stim[41] = 14'h393d;
    stim[42] = 14'h1f9b;
    stim[43] = 14'h0a18;
    stim[44] = 14'h16e7;
    stim[45] = 14'h2595;
    stim[46] = 14'h16da;
    stim[47] = 14'h03f7;
    stim[48] = 14'h3dd9;
    stim[49] = 14'h14d6;
    stim[50] = 14'h28c7;
    stim[51] = 14'h3171;
    stim[52] = 14'h0eef;
    stim[53] = 14'h0c9d;
    stim[54] = 14'h1e18;
    stim[55] = 14'h1a5e;
    stim[56] = 14'h0221;
    stim[57] = 14'h2435;
    stim[58] = 14'h187a;
    stim[59] = 14'h3812;
    stim[60] = 14'h1507;
    stim[61] = 14'h031b;
    stim[62] = 14'h128b;
    stim[63] = 14'h3b03;
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
      expv[0] = 15'h4440;
      expv[1] = 15'h4440;
      expv[2] = 15'h4440;
      expv[3] = 15'h4440;
      expv[4] = 15'h4440;
      expv[5] = 15'h4440;
      expv[6] = 15'h4441;
      expv[7] = 15'h4440;
      expv[8] = 15'h547c;
      expv[9] = 15'h4440;
      expv[10] = 15'h4440;
      expv[11] = 15'h4440;
      expv[12] = 15'h4440;
      expv[13] = 15'h4440;
      expv[14] = 15'h4440;
      expv[15] = 15'h50e0;
      expv[16] = 15'h4440;
      expv[17] = 15'h4440;
      expv[18] = 15'h4440;
      expv[19] = 15'h4440;
      expv[20] = 15'h4440;
      expv[21] = 15'h4440;
      expv[22] = 15'h4440;
      expv[23] = 15'h4440;
      expv[24] = 15'h4440;
      expv[25] = 15'h4440;
      expv[26] = 15'h4440;
      expv[27] = 15'h4440;
      expv[28] = 15'h4440;
      expv[29] = 15'h4440;
      expv[30] = 15'h4440;
      expv[31] = 15'h4440;
      expv[32] = 15'h4440;
      expv[33] = 15'h4440;
      expv[34] = 15'h4440;
      expv[35] = 15'h4440;
      expv[36] = 15'h4440;
      expv[37] = 15'h4440;
      expv[38] = 15'h4440;
      expv[39] = 15'h4440;
      expv[40] = 15'h4440;
      expv[41] = 15'h4440;
      expv[42] = 15'h0043;
      expv[43] = 15'h4440;
      expv[44] = 15'h4440;
      expv[45] = 15'h4440;
      expv[46] = 15'h4440;
      expv[47] = 15'h4440;
      expv[48] = 15'h4440;
      expv[49] = 15'h4440;
      expv[50] = 15'h4440;
      expv[51] = 15'h4440;
      expv[52] = 15'h4440;
      expv[53] = 15'h4440;
      expv[54] = 15'h4440;
      expv[55] = 15'h4440;
      expv[56] = 15'h4440;
      expv[57] = 15'h4440;
      expv[58] = 15'h4440;
      expv[59] = 15'h4440;
      expv[60] = 15'h4440;
      expv[61] = 15'h4440;
      expv[62] = 15'h4440;
      expv[63] = 15'h4440;
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
