// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198158 dut (
    .RT(in_vec[9:9]),
    .addi(in_vec[8:8]),
    .andi(in_vec[7:7]),
    .lw(in_vec[6:6]),
    .sw(in_vec[5:5]),
    .j(in_vec[4:4]),
    .jal(in_vec[3:3]),
    .jr(in_vec[2:2]),
    .beq(in_vec[1:1]),
    .bne(in_vec[0:0]),
    .RegDst(out_vec[9:8]),
    .RegWrite(out_vec[7:7]),
    .ALUSrc(out_vec[6:6]),
    .MemRead(out_vec[5:5]),
    .MemWrite(out_vec[4:4]),
    .MemToReg(out_vec[3:3]),
    .ALUOp(out_vec[2:1]),
    .WDInp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h18b;
    stim[1] = 10'h1dc;
    stim[2] = 10'h1dd;
    stim[3] = 10'h2be;
    stim[4] = 10'h0cd;
    stim[5] = 10'h2ea;
    stim[6] = 10'h13a;
    stim[7] = 10'h194;
    stim[8] = 10'h040;
    stim[9] = 10'h36e;
    stim[10] = 10'h364;
    stim[11] = 10'h007;
    stim[12] = 10'h216;
    stim[13] = 10'h22b;
    stim[14] = 10'h3f1;
    stim[15] = 10'h035;
    stim[16] = 10'h26a;
    stim[17] = 10'h2f2;
    stim[18] = 10'h224;
    stim[19] = 10'h269;
    stim[20] = 10'h133;
    stim[21] = 10'h137;
    stim[22] = 10'h2bf;
    stim[23] = 10'h30e;
    stim[24] = 10'h207;
    stim[25] = 10'h221;
    stim[26] = 10'h023;
    stim[27] = 10'h277;
    stim[28] = 10'h323;
    stim[29] = 10'h182;
    stim[30] = 10'h3ff;
    stim[31] = 10'h2d7;
    stim[32] = 10'h1fb;
    stim[33] = 10'h01f;
    stim[34] = 10'h010;
    stim[35] = 10'h2cc;
    stim[36] = 10'h01c;
    stim[37] = 10'h033;
    stim[38] = 10'h23c;
    stim[39] = 10'h1cf;
    stim[40] = 10'h01a;
    stim[41] = 10'h002;
    stim[42] = 10'h0d4;
    stim[43] = 10'h338;
    stim[44] = 10'h0fc;
    stim[45] = 10'h321;
    stim[46] = 10'h3f0;
    stim[47] = 10'h04e;
    stim[48] = 10'h0ab;
    stim[49] = 10'h1cd;
    stim[50] = 10'h3f7;
    stim[51] = 10'h35b;
    stim[52] = 10'h329;
    stim[53] = 10'h0cb;
    stim[54] = 10'h1cc;
    stim[55] = 10'h0ec;
    stim[56] = 10'h16e;
    stim[57] = 10'h155;
    stim[58] = 10'h153;
    stim[59] = 10'h163;
    stim[60] = 10'h041;
    stim[61] = 10'h22f;
    stim[62] = 10'h002;
    stim[63] = 10'h3bb;
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
      expv[0] = 10'h0c0;
      expv[1] = 10'h0c0;
      expv[2] = 10'h0c0;
      expv[3] = 10'h184;
      expv[4] = 10'h0c6;
      expv[5] = 10'h184;
      expv[6] = 10'h0c0;
      expv[7] = 10'h0c0;
      expv[8] = 10'h0e8;
      expv[9] = 10'h184;
      expv[10] = 10'h184;
      expv[11] = 10'h002;
      expv[12] = 10'h184;
      expv[13] = 10'h184;
      expv[14] = 10'h184;
      expv[15] = 10'h050;
      expv[16] = 10'h184;
      expv[17] = 10'h184;
      expv[18] = 10'h184;
      expv[19] = 10'h184;
      expv[20] = 10'h0c0;
      expv[21] = 10'h0c0;
      expv[22] = 10'h184;
      expv[23] = 10'h184;
      expv[24] = 10'h184;
      expv[25] = 10'h184;
      expv[26] = 10'h050;
      expv[27] = 10'h184;
      expv[28] = 10'h184;
      expv[29] = 10'h0c0;
      expv[30] = 10'h184;
      expv[31] = 10'h184;
      expv[32] = 10'h0c0;
      expv[33] = 10'h002;
      expv[34] = 10'h000;
      expv[35] = 10'h184;
      expv[36] = 10'h281;
      expv[37] = 10'h050;
      expv[38] = 10'h184;
      expv[39] = 10'h0c0;
      expv[40] = 10'h002;
      expv[41] = 10'h002;
      expv[42] = 10'h0c6;
      expv[43] = 10'h184;
      expv[44] = 10'h0c6;
      expv[45] = 10'h184;
      expv[46] = 10'h184;
      expv[47] = 10'h0e8;
      expv[48] = 10'h0c6;
      expv[49] = 10'h0c0;
      expv[50] = 10'h184;
      expv[51] = 10'h184;
      expv[52] = 10'h184;
      expv[53] = 10'h0c6;
      expv[54] = 10'h0c0;
      expv[55] = 10'h0c6;
      expv[56] = 10'h0c0;
      expv[57] = 10'h0c0;
      expv[58] = 10'h0c0;
      expv[59] = 10'h0c0;
      expv[60] = 10'h0e8;
      expv[61] = 10'h184;
      expv[62] = 10'h002;
      expv[63] = 10'h184;
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
