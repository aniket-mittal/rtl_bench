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

  origen_155637 dut (
    .zero(in_vec[13:13]),
    .sign(in_vec[12:12]),
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .PCWre(out_vec[14:14]),
    .PCSrc(out_vec[13:12]),
    .ExtSel(out_vec[11:11]),
    .ALUSrcA(out_vec[10:10]),
    .ALUSrcB(out_vec[9:9]),
    .ALUOp(out_vec[8:6]),
    .RegWre(out_vec[5:5]),
    .RegDst(out_vec[4:4]),
    .mRD(out_vec[3:3]),
    .mWR(out_vec[2:2]),
    .DBDataSrc(out_vec[1:1]),
    .InsMemRW(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3766;
    stim[1] = 14'h1b69;
    stim[2] = 14'h31ff;
    stim[3] = 14'h0edd;
    stim[4] = 14'h1d0a;
    stim[5] = 14'h15b5;
    stim[6] = 14'h388e;
    stim[7] = 14'h14c9;
    stim[8] = 14'h3034;
    stim[9] = 14'h0a7e;
    stim[10] = 14'h247c;
    stim[11] = 14'h1d10;
    stim[12] = 14'h126d;
    stim[13] = 14'h02c6;
    stim[14] = 14'h2b83;
    stim[15] = 14'h3b18;
    stim[16] = 14'h0387;
    stim[17] = 14'h14da;
    stim[18] = 14'h051b;
    stim[19] = 14'h235e;
    stim[20] = 14'h01af;
    stim[21] = 14'h23a1;
    stim[22] = 14'h013e;
    stim[23] = 14'h1454;
    stim[24] = 14'h144e;
    stim[25] = 14'h13a1;
    stim[26] = 14'h271d;
    stim[27] = 14'h12b1;
    stim[28] = 14'h1544;
    stim[29] = 14'h06ea;
    stim[30] = 14'h0ec6;
    stim[31] = 14'h0320;
    stim[32] = 14'h1462;
    stim[33] = 14'h285a;
    stim[34] = 14'h179e;
    stim[35] = 14'h1bf3;
    stim[36] = 14'h18d8;
    stim[37] = 14'h2606;
    stim[38] = 14'h05ac;
    stim[39] = 14'h1e88;
    stim[40] = 14'h321f;
    stim[41] = 14'h0408;
    stim[42] = 14'h3b63;
    stim[43] = 14'h361c;
    stim[44] = 14'h0ef8;
    stim[45] = 14'h27ac;
    stim[46] = 14'h3142;
    stim[47] = 14'h0175;
    stim[48] = 14'h3ec5;
    stim[49] = 14'h29fa;
    stim[50] = 14'h01db;
    stim[51] = 14'h0ea8;
    stim[52] = 14'h3e89;
    stim[53] = 14'h01f2;
    stim[54] = 14'h03d3;
    stim[55] = 14'h0186;
    stim[56] = 14'h0ae1;
    stim[57] = 14'h1805;
    stim[58] = 14'h26f9;
    stim[59] = 14'h2877;
    stim[60] = 14'h2323;
    stim[61] = 14'h2e78;
    stim[62] = 14'h09dd;
    stim[63] = 14'h26c5;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h4030;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h4840;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h4a2a;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h4a04;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
