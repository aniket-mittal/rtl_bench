// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035854 dut (
    .Op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegDst(out_vec[15:14]),
    .ALU_Asrc(out_vec[13:13]),
    .ALU_Bsrc(out_vec[12:12]),
    .Mem2Reg(out_vec[11:11]),
    .RegWrite(out_vec[10:10]),
    .MemWrite(out_vec[9:9]),
    .LinkPC(out_vec[8:8]),
    .nPC_sel(out_vec[7:5]),
    .ExtOp(out_vec[4:3]),
    .ALUctrl(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h7eb;
    stim[1] = 12'h455;
    stim[2] = 12'hfad;
    stim[3] = 12'h1f7;
    stim[4] = 12'h0b1;
    stim[5] = 12'hba8;
    stim[6] = 12'h87e;
    stim[7] = 12'h75f;
    stim[8] = 12'h24b;
    stim[9] = 12'h8b7;
    stim[10] = 12'h28a;
    stim[11] = 12'ha89;
    stim[12] = 12'hb52;
    stim[13] = 12'h882;
    stim[14] = 12'hf63;
    stim[15] = 12'hbd9;
    stim[16] = 12'h072;
    stim[17] = 12'h5c2;
    stim[18] = 12'h54a;
    stim[19] = 12'h965;
    stim[20] = 12'h58e;
    stim[21] = 12'hd03;
    stim[22] = 12'h784;
    stim[23] = 12'hbac;
    stim[24] = 12'hd0e;
    stim[25] = 12'hb93;
    stim[26] = 12'h4e1;
    stim[27] = 12'ha2d;
    stim[28] = 12'he12;
    stim[29] = 12'h69b;
    stim[30] = 12'h91a;
    stim[31] = 12'hb8f;
    stim[32] = 12'h595;
    stim[33] = 12'h99b;
    stim[34] = 12'hab3;
    stim[35] = 12'hfe7;
    stim[36] = 12'hf0f;
    stim[37] = 12'h559;
    stim[38] = 12'h5e9;
    stim[39] = 12'h3d6;
    stim[40] = 12'h3a3;
    stim[41] = 12'hcfb;
    stim[42] = 12'he4e;
    stim[43] = 12'h33a;
    stim[44] = 12'h3a6;
    stim[45] = 12'h4ef;
    stim[46] = 12'hc05;
    stim[47] = 12'h02b;
    stim[48] = 12'h4d3;
    stim[49] = 12'h641;
    stim[50] = 12'h844;
    stim[51] = 12'hba9;
    stim[52] = 12'hf13;
    stim[53] = 12'hd46;
    stim[54] = 12'hd6f;
    stim[55] = 12'h359;
    stim[56] = 12'h785;
    stim[57] = 12'h556;
    stim[58] = 12'h571;
    stim[59] = 12'h2bf;
    stim[60] = 12'h55b;
    stim[61] = 12'hbce;
    stim[62] = 12'hbd1;
    stim[63] = 12'hcdd;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0060;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h1408;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0410;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h4400;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h1403;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
