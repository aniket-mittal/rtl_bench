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

  UINT16_TO_FP17_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h367;
    stim[1] = 10'h027;
    stim[2] = 10'h3ab;
    stim[3] = 10'h01f;
    stim[4] = 10'h088;
    stim[5] = 10'h3f7;
    stim[6] = 10'h15d;
    stim[7] = 10'h319;
    stim[8] = 10'h0cd;
    stim[9] = 10'h097;
    stim[10] = 10'h346;
    stim[11] = 10'h28a;
    stim[12] = 10'h22d;
    stim[13] = 10'h3e0;
    stim[14] = 10'h3a3;
    stim[15] = 10'h17f;
    stim[16] = 10'h2cf;
    stim[17] = 10'h330;
    stim[18] = 10'h1a4;
    stim[19] = 10'h38b;
    stim[20] = 10'h30d;
    stim[21] = 10'h25f;
    stim[22] = 10'h281;
    stim[23] = 10'h213;
    stim[24] = 10'h15d;
    stim[25] = 10'h224;
    stim[26] = 10'h268;
    stim[27] = 10'h13c;
    stim[28] = 10'h302;
    stim[29] = 10'h232;
    stim[30] = 10'h316;
    stim[31] = 10'h152;
    stim[32] = 10'h339;
    stim[33] = 10'h230;
    stim[34] = 10'h288;
    stim[35] = 10'h193;
    stim[36] = 10'h29c;
    stim[37] = 10'h0e7;
    stim[38] = 10'h0e2;
    stim[39] = 10'h273;
    stim[40] = 10'h0c7;
    stim[41] = 10'h1f3;
    stim[42] = 10'h2fb;
    stim[43] = 10'h285;
    stim[44] = 10'h18e;
    stim[45] = 10'h2c4;
    stim[46] = 10'h221;
    stim[47] = 10'h175;
    stim[48] = 10'h392;
    stim[49] = 10'h368;
    stim[50] = 10'h08a;
    stim[51] = 10'h151;
    stim[52] = 10'h310;
    stim[53] = 10'h04e;
    stim[54] = 10'h047;
    stim[55] = 10'h267;
    stim[56] = 10'h3c0;
    stim[57] = 10'h1de;
    stim[58] = 10'h3c5;
    stim[59] = 10'h25b;
    stim[60] = 10'h190;
    stim[61] = 10'h3ff;
    stim[62] = 10'h283;
    stim[63] = 10'h2ec;
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
      expv[0] = 10'h2cf;
      expv[1] = 10'h04e;
      expv[2] = 10'h357;
      expv[3] = 10'h03e;
      expv[4] = 10'h110;
      expv[5] = 10'h3ef;
      expv[6] = 10'h2ba;
      expv[7] = 10'h233;
      expv[8] = 10'h19a;
      expv[9] = 10'h12e;
      expv[10] = 10'h28d;
      expv[11] = 10'h115;
      expv[12] = 10'h05b;
      expv[13] = 10'h3c1;
      expv[14] = 10'h347;
      expv[15] = 10'h2fe;
      expv[16] = 10'h19f;
      expv[17] = 10'h261;
      expv[18] = 10'h348;
      expv[19] = 10'h317;
      expv[20] = 10'h21b;
      expv[21] = 10'h0bf;
      expv[22] = 10'h103;
      expv[23] = 10'h027;
      expv[24] = 10'h2ba;
      expv[25] = 10'h049;
      expv[26] = 10'h0d1;
      expv[27] = 10'h278;
      expv[28] = 10'h205;
      expv[29] = 10'h065;
      expv[30] = 10'h22d;
      expv[31] = 10'h2a4;
      expv[32] = 10'h273;
      expv[33] = 10'h061;
      expv[34] = 10'h111;
      expv[35] = 10'h326;
      expv[36] = 10'h139;
      expv[37] = 10'h1ce;
      expv[38] = 10'h1c4;
      expv[39] = 10'h0e7;
      expv[40] = 10'h18e;
      expv[41] = 10'h3e6;
      expv[42] = 10'h1f7;
      expv[43] = 10'h10b;
      expv[44] = 10'h31c;
      expv[45] = 10'h189;
      expv[46] = 10'h043;
      expv[47] = 10'h2ea;
      expv[48] = 10'h325;
      expv[49] = 10'h2d1;
      expv[50] = 10'h114;
      expv[51] = 10'h2a2;
      expv[52] = 10'h221;
      expv[53] = 10'h09c;
      expv[54] = 10'h08e;
      expv[55] = 10'h0cf;
      expv[56] = 10'h381;
      expv[57] = 10'h3bc;
      expv[58] = 10'h38b;
      expv[59] = 10'h0b7;
      expv[60] = 10'h320;
      expv[61] = 10'h3ff;
      expv[62] = 10'h107;
      expv[63] = 10'h1d9;
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
