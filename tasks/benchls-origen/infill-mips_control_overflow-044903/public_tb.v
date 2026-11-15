// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_044903 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .op(in_vec[11:6]),
    .fun(in_vec[5:0]),
    .RegDst(out_vec[14:13]),
    .ALUSrc(out_vec[12:12]),
    .nPC_sel(out_vec[11:10]),
    .ALUCtr(out_vec[9:7]),
    .MemToReg(out_vec[6:5]),
    .MemWr(out_vec[4:4]),
    .ExtOp(out_vec[3:2]),
    .RegWr(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1d5f;
    stim[1] = 13'h18ce;
    stim[2] = 13'h0321;
    stim[3] = 13'h0fa3;
    stim[4] = 13'h05d9;
    stim[5] = 13'h02f3;
    stim[6] = 13'h0a5b;
    stim[7] = 13'h07ca;
    stim[8] = 13'h024f;
    stim[9] = 13'h04bd;
    stim[10] = 13'h06d1;
    stim[11] = 13'h09c9;
    stim[12] = 13'h03b0;
    stim[13] = 13'h01ca;
    stim[14] = 13'h0ffb;
    stim[15] = 13'h0a3f;
    stim[16] = 13'h00cf;
    stim[17] = 13'h0fac;
    stim[18] = 13'h09ff;
    stim[19] = 13'h0c65;
    stim[20] = 13'h03d1;
    stim[21] = 13'h001a;
    stim[22] = 13'h003e;
    stim[23] = 13'h09f2;
    stim[24] = 13'h03f0;
    stim[25] = 13'h00b8;
    stim[26] = 13'h0eb3;
    stim[27] = 13'h0337;
    stim[28] = 13'h0cd8;
    stim[29] = 13'h098a;
    stim[30] = 13'h071e;
    stim[31] = 13'h0ae8;
    stim[32] = 13'h0229;
    stim[33] = 13'h046f;
    stim[34] = 13'h0984;
    stim[35] = 13'h022c;
    stim[36] = 13'h06ae;
    stim[37] = 13'h0ab6;
    stim[38] = 13'h0250;
    stim[39] = 13'h01ed;
    stim[40] = 13'h0103;
    stim[41] = 13'h0323;
    stim[42] = 13'h0084;
    stim[43] = 13'h0078;
    stim[44] = 13'h02f0;
    stim[45] = 13'h01c0;
    stim[46] = 13'h0701;
    stim[47] = 13'h0296;
    stim[48] = 13'h0c38;
    stim[49] = 13'h0902;
    stim[50] = 13'h0594;
    stim[51] = 13'h09ca;
    stim[52] = 13'h0ea5;
    stim[53] = 13'h0b7b;
    stim[54] = 13'h0914;
    stim[55] = 13'h032b;
    stim[56] = 13'h06a3;
    stim[57] = 13'h037e;
    stim[58] = 13'h0c2e;
    stim[59] = 13'h023f;
    stim[60] = 13'h09a8;
    stim[61] = 13'h07af;
    stim[62] = 13'h0c10;
    stim[63] = 13'h0571;
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
      expv[0] = 15'h0006;
      expv[1] = 15'h1026;
      expv[2] = 15'h0006;
      expv[3] = 15'h0006;
      expv[4] = 15'h0006;
      expv[5] = 15'h0006;
      expv[6] = 15'h0006;
      expv[7] = 15'h0006;
      expv[8] = 15'h1006;
      expv[9] = 15'h0006;
      expv[10] = 15'h0006;
      expv[11] = 15'h0006;
      expv[12] = 15'h0006;
      expv[13] = 15'h0006;
      expv[14] = 15'h0006;
      expv[15] = 15'h0006;
      expv[16] = 15'h4446;
      expv[17] = 15'h0006;
      expv[18] = 15'h0006;
      expv[19] = 15'h0006;
      expv[20] = 15'h128a;
      expv[21] = 15'h2006;
      expv[22] = 15'h2006;
      expv[23] = 15'h0006;
      expv[24] = 15'h128a;
      expv[25] = 15'h0404;
      expv[26] = 15'h0006;
      expv[27] = 15'h0006;
      expv[28] = 15'h0006;
      expv[29] = 15'h0006;
      expv[30] = 15'h0006;
      expv[31] = 15'h1014;
      expv[32] = 15'h1186;
      expv[33] = 15'h0006;
      expv[34] = 15'h0006;
      expv[35] = 15'h1186;
      expv[36] = 15'h0006;
      expv[37] = 15'h0006;
      expv[38] = 15'h1006;
      expv[39] = 15'h0006;
      expv[40] = 15'h0c84;
      expv[41] = 15'h0006;
      expv[42] = 15'h0404;
      expv[43] = 15'h0006;
      expv[44] = 15'h0006;
      expv[45] = 15'h0006;
      expv[46] = 15'h0006;
      expv[47] = 15'h0006;
      expv[48] = 15'h0006;
      expv[49] = 15'h0006;
      expv[50] = 15'h0006;
      expv[51] = 15'h0006;
      expv[52] = 15'h0006;
      expv[53] = 15'h0006;
      expv[54] = 15'h0006;
      expv[55] = 15'h0006;
      expv[56] = 15'h0006;
      expv[57] = 15'h1102;
      expv[58] = 15'h0006;
      expv[59] = 15'h1186;
      expv[60] = 15'h0006;
      expv[61] = 15'h0006;
      expv[62] = 15'h0006;
      expv[63] = 15'h0006;
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
