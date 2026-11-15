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

  origen_010103 dut (
    .rst(in_vec[13:13]),
    .zero(in_vec[12:12]),
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .MemEn(out_vec[12:12]),
    .MemToReg(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .ALUop(out_vec[9:6]),
    .ALUSrcA(out_vec[5:5]),
    .ALUSrcB(out_vec[4:4]),
    .RegDst(out_vec[3:3]),
    .RegWrite(out_vec[2:2]),
    .PCSrc(out_vec[1:1]),
    .JSrc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3684;
    stim[1] = 14'h2df6;
    stim[2] = 14'h1c96;
    stim[3] = 14'h1848;
    stim[4] = 14'h1ff3;
    stim[5] = 14'h05d7;
    stim[6] = 14'h182c;
    stim[7] = 14'h17e4;
    stim[8] = 14'h0c72;
    stim[9] = 14'h00e9;
    stim[10] = 14'h096e;
    stim[11] = 14'h1d33;
    stim[12] = 14'h162d;
    stim[13] = 14'h13ce;
    stim[14] = 14'h1027;
    stim[15] = 14'h0910;
    stim[16] = 14'h06e2;
    stim[17] = 14'h0306;
    stim[18] = 14'h1288;
    stim[19] = 14'h0891;
    stim[20] = 14'h1442;
    stim[21] = 14'h1cd9;
    stim[22] = 14'h01c0;
    stim[23] = 14'h1afa;
    stim[24] = 14'h1fca;
    stim[25] = 14'h047b;
    stim[26] = 14'h123e;
    stim[27] = 14'h0413;
    stim[28] = 14'h05d9;
    stim[29] = 14'h0616;
    stim[30] = 14'h1c08;
    stim[31] = 14'h0bff;
    stim[32] = 14'h0a7b;
    stim[33] = 14'h1d82;
    stim[34] = 14'h1b04;
    stim[35] = 14'h0095;
    stim[36] = 14'h06b7;
    stim[37] = 14'h1cb3;
    stim[38] = 14'h00eb;
    stim[39] = 14'h0dfc;
    stim[40] = 14'h0060;
    stim[41] = 14'h179f;
    stim[42] = 14'h1254;
    stim[43] = 14'h1361;
    stim[44] = 14'h1b94;
    stim[45] = 14'h0b92;
    stim[46] = 14'h0cd9;
    stim[47] = 14'h1b18;
    stim[48] = 14'h0884;
    stim[49] = 14'h0643;
    stim[50] = 14'h18c8;
    stim[51] = 14'h1966;
    stim[52] = 14'h0335;
    stim[53] = 14'h1301;
    stim[54] = 14'h0bec;
    stim[55] = 14'h0ad4;
    stim[56] = 14'h1e41;
    stim[57] = 14'h0e3b;
    stim[58] = 14'h1c8e;
    stim[59] = 14'h1743;
    stim[60] = 14'h0401;
    stim[61] = 14'h2cc6;
    stim[62] = 14'h1f16;
    stim[63] = 14'h06fc;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h000e;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h000c;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0014;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h1490;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0094;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0002;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h000e;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0054;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h1894;
      expv[51] = 13'h0000;
      expv[52] = 13'h0014;
      expv[53] = 13'h0014;
      expv[54] = 13'h0000;
      expv[55] = 13'h1490;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
