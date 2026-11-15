// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194502 dut (
    .opcode(in_vec[12:7]),
    .func(in_vec[6:1]),
    .zf(in_vec[0:0]),
    .sel_dest(out_vec[15:14]),
    .sel_data(out_vec[13:12]),
    .sel_pc(out_vec[11:10]),
    .sel_opA(out_vec[9:9]),
    .sel_opB(out_vec[8:8]),
    .wr_en(out_vec[7:7]),
    .data_wr(out_vec[6:6]),
    .alu_op(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1540;
    stim[1] = 13'h1f61;
    stim[2] = 13'h0991;
    stim[3] = 13'h0d45;
    stim[4] = 13'h0617;
    stim[5] = 13'h1222;
    stim[6] = 13'h1a1c;
    stim[7] = 13'h0f86;
    stim[8] = 13'h1ff9;
    stim[9] = 13'h1e4c;
    stim[10] = 13'h1b2a;
    stim[11] = 13'h0c53;
    stim[12] = 13'h1530;
    stim[13] = 13'h154a;
    stim[14] = 13'h0ced;
    stim[15] = 13'h1007;
    stim[16] = 13'h0fcf;
    stim[17] = 13'h0861;
    stim[18] = 13'h1250;
    stim[19] = 13'h03be;
    stim[20] = 13'h13a2;
    stim[21] = 13'h0865;
    stim[22] = 13'h09fc;
    stim[23] = 13'h0aa9;
    stim[24] = 13'h1a87;
    stim[25] = 13'h10be;
    stim[26] = 13'h08f6;
    stim[27] = 13'h11c4;
    stim[28] = 13'h0fe6;
    stim[29] = 13'h1f59;
    stim[30] = 13'h0974;
    stim[31] = 13'h0fa9;
    stim[32] = 13'h0014;
    stim[33] = 13'h08dd;
    stim[34] = 13'h1c4f;
    stim[35] = 13'h04ca;
    stim[36] = 13'h1b37;
    stim[37] = 13'h0546;
    stim[38] = 13'h1cae;
    stim[39] = 13'h1737;
    stim[40] = 13'h1f78;
    stim[41] = 13'h0b0e;
    stim[42] = 13'h111f;
    stim[43] = 13'h15af;
    stim[44] = 13'h0482;
    stim[45] = 13'h0d8e;
    stim[46] = 13'h0731;
    stim[47] = 13'h1788;
    stim[48] = 13'h0a40;
    stim[49] = 13'h0405;
    stim[50] = 13'h16b0;
    stim[51] = 13'h1bf7;
    stim[52] = 13'h0756;
    stim[53] = 13'h17fc;
    stim[54] = 13'h0ac8;
    stim[55] = 13'h193b;
    stim[56] = 13'h1185;
    stim[57] = 13'h09b7;
    stim[58] = 13'h0068;
    stim[59] = 13'h0001;
    stim[60] = 13'h04c3;
    stim[61] = 13'h1616;
    stim[62] = 13'h070a;
    stim[63] = 13'h1f42;
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
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
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
      expv[27] = 16'h51a0;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h4080;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h41aa;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0160;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h41a0;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h51a0;
      expv[57] = 16'h0000;
      expv[58] = 16'h4080;
      expv[59] = 16'h4080;
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
