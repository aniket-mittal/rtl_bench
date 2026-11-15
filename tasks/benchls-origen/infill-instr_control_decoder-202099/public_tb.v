// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202099 dut (
    .i_instrCode(in_vec[11:0]),
    .o_regDst(out_vec[9:9]),
    .o_jump(out_vec[8:8]),
    .o_branch(out_vec[7:7]),
    .o_memToReg(out_vec[6:6]),
    .o_aluOp(out_vec[5:4]),
    .o_memWrite(out_vec[3:3]),
    .o_memRead(out_vec[2:2]),
    .o_aluSrc(out_vec[1:1]),
    .o_regWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h8fa;
    stim[1] = 12'ha20;
    stim[2] = 12'hb0e;
    stim[3] = 12'he6e;
    stim[4] = 12'h5d7;
    stim[5] = 12'hf1c;
    stim[6] = 12'h088;
    stim[7] = 12'h12f;
    stim[8] = 12'h7dd;
    stim[9] = 12'h8e3;
    stim[10] = 12'h260;
    stim[11] = 12'h64b;
    stim[12] = 12'h489;
    stim[13] = 12'hc74;
    stim[14] = 12'he7a;
    stim[15] = 12'hed8;
    stim[16] = 12'h14c;
    stim[17] = 12'h47e;
    stim[18] = 12'h0b7;
    stim[19] = 12'h49c;
    stim[20] = 12'he25;
    stim[21] = 12'h971;
    stim[22] = 12'hae1;
    stim[23] = 12'hdea;
    stim[24] = 12'h119;
    stim[25] = 12'h2f1;
    stim[26] = 12'h9d7;
    stim[27] = 12'h61c;
    stim[28] = 12'h709;
    stim[29] = 12'h0fd;
    stim[30] = 12'h038;
    stim[31] = 12'h41e;
    stim[32] = 12'hbf4;
    stim[33] = 12'h8c3;
    stim[34] = 12'h55b;
    stim[35] = 12'h2dc;
    stim[36] = 12'h79d;
    stim[37] = 12'h9da;
    stim[38] = 12'had6;
    stim[39] = 12'hf6d;
    stim[40] = 12'h68a;
    stim[41] = 12'ha4d;
    stim[42] = 12'h5af;
    stim[43] = 12'h2cc;
    stim[44] = 12'h21b;
    stim[45] = 12'he94;
    stim[46] = 12'h36c;
    stim[47] = 12'h8f0;
    stim[48] = 12'h21f;
    stim[49] = 12'hf38;
    stim[50] = 12'h4d5;
    stim[51] = 12'heb1;
    stim[52] = 12'h33d;
    stim[53] = 12'hb30;
    stim[54] = 12'hbbe;
    stim[55] = 12'h0a3;
    stim[56] = 12'he99;
    stim[57] = 12'h735;
    stim[58] = 12'h862;
    stim[59] = 12'hc20;
    stim[60] = 12'h6af;
    stim[61] = 12'h820;
    stim[62] = 12'h900;
    stim[63] = 12'hf04;
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
      expv[0] = 10'h047;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h100;
      expv[7] = 10'h090;
      expv[8] = 10'h000;
      expv[9] = 10'h047;
      expv[10] = 10'h003;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h100;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h00a;
      expv[23] = 10'h000;
      expv[24] = 10'h090;
      expv[25] = 10'h003;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h221;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h047;
      expv[34] = 10'h000;
      expv[35] = 10'h003;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h00a;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h003;
      expv[44] = 10'h003;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h047;
      expv[48] = 10'h003;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h100;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
