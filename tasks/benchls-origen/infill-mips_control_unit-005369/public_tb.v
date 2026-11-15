// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005369 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegDst(out_vec[14:13]),
    .ALUSrc(out_vec[12:12]),
    .MemtoReg(out_vec[11:10]),
    .RegWrite(out_vec[9:9]),
    .MemRead(out_vec[8:8]),
    .MemWrite(out_vec[7:7]),
    .IfBeq(out_vec[6:6]),
    .ExtOp(out_vec[5:4]),
    .ALUOp(out_vec[3:2]),
    .jr(out_vec[1:1]),
    .jal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc67;
    stim[1] = 12'h349;
    stim[2] = 12'h312;
    stim[3] = 12'hf6c;
    stim[4] = 12'h334;
    stim[5] = 12'hcb2;
    stim[6] = 12'h790;
    stim[7] = 12'hf3b;
    stim[8] = 12'h705;
    stim[9] = 12'hce5;
    stim[10] = 12'h26d;
    stim[11] = 12'h6ef;
    stim[12] = 12'hbd6;
    stim[13] = 12'h0f9;
    stim[14] = 12'heb3;
    stim[15] = 12'h0c8;
    stim[16] = 12'h4ca;
    stim[17] = 12'ha3b;
    stim[18] = 12'h0a1;
    stim[19] = 12'h50b;
    stim[20] = 12'h993;
    stim[21] = 12'hfe0;
    stim[22] = 12'h145;
    stim[23] = 12'he4f;
    stim[24] = 12'h54f;
    stim[25] = 12'hece;
    stim[26] = 12'h21f;
    stim[27] = 12'h540;
    stim[28] = 12'h653;
    stim[29] = 12'h534;
    stim[30] = 12'h07a;
    stim[31] = 12'hdcf;
    stim[32] = 12'h444;
    stim[33] = 12'hc20;
    stim[34] = 12'hbc7;
    stim[35] = 12'hc54;
    stim[36] = 12'h0e3;
    stim[37] = 12'h7c1;
    stim[38] = 12'h1d4;
    stim[39] = 12'h0a8;
    stim[40] = 12'hf40;
    stim[41] = 12'hd0f;
    stim[42] = 12'h44a;
    stim[43] = 12'hb6a;
    stim[44] = 12'h82b;
    stim[45] = 12'hdcd;
    stim[46] = 12'hd12;
    stim[47] = 12'h766;
    stim[48] = 12'h4fe;
    stim[49] = 12'hc02;
    stim[50] = 12'h6d2;
    stim[51] = 12'ha1b;
    stim[52] = 12'h617;
    stim[53] = 12'h0c4;
    stim[54] = 12'h364;
    stim[55] = 12'hf91;
    stim[56] = 12'he23;
    stim[57] = 12'h713;
    stim[58] = 12'h1af;
    stim[59] = 12'h02e;
    stim[60] = 12'he32;
    stim[61] = 12'hb7f;
    stim[62] = 12'h4be;
    stim[63] = 12'h5fa;
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
      expv[1] = 15'h120c;
      expv[2] = 15'h120c;
      expv[3] = 15'h0000;
      expv[4] = 15'h120c;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h4a01;
      expv[14] = 15'h0000;
      expv[15] = 15'h4a01;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h1210;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h4a01;
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
      expv[53] = 15'h4a01;
      expv[54] = 15'h120c;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h2208;
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
