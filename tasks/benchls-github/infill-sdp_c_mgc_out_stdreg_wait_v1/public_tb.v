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

  SDP_C_mgc_out_stdreg_wait_v1 dut (
    .ld(in_vec[9:9]),
    .d(in_vec[8:1]),
    .vz(in_vec[0:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h14c;
    stim[1] = 10'h29d;
    stim[2] = 10'h00f;
    stim[3] = 10'h28a;
    stim[4] = 10'h36b;
    stim[5] = 10'h127;
    stim[6] = 10'h0a9;
    stim[7] = 10'h153;
    stim[8] = 10'h069;
    stim[9] = 10'h127;
    stim[10] = 10'h3bb;
    stim[11] = 10'h299;
    stim[12] = 10'h221;
    stim[13] = 10'h284;
    stim[14] = 10'h0b4;
    stim[15] = 10'h118;
    stim[16] = 10'h138;
    stim[17] = 10'h15d;
    stim[18] = 10'h073;
    stim[19] = 10'h13e;
    stim[20] = 10'h22d;
    stim[21] = 10'h19b;
    stim[22] = 10'h160;
    stim[23] = 10'h12f;
    stim[24] = 10'h1d6;
    stim[25] = 10'h0fa;
    stim[26] = 10'h3af;
    stim[27] = 10'h1e7;
    stim[28] = 10'h110;
    stim[29] = 10'h2e4;
    stim[30] = 10'h302;
    stim[31] = 10'h240;
    stim[32] = 10'h216;
    stim[33] = 10'h28a;
    stim[34] = 10'h016;
    stim[35] = 10'h2e5;
    stim[36] = 10'h2a4;
    stim[37] = 10'h240;
    stim[38] = 10'h2fd;
    stim[39] = 10'h254;
    stim[40] = 10'h1da;
    stim[41] = 10'h0a6;
    stim[42] = 10'h3f0;
    stim[43] = 10'h095;
    stim[44] = 10'h30d;
    stim[45] = 10'h2bc;
    stim[46] = 10'h357;
    stim[47] = 10'h319;
    stim[48] = 10'h211;
    stim[49] = 10'h159;
    stim[50] = 10'h133;
    stim[51] = 10'h058;
    stim[52] = 10'h2fc;
    stim[53] = 10'h0fc;
    stim[54] = 10'h0ab;
    stim[55] = 10'h3e8;
    stim[56] = 10'h3b7;
    stim[57] = 10'h2e7;
    stim[58] = 10'h167;
    stim[59] = 10'h322;
    stim[60] = 10'h35d;
    stim[61] = 10'h284;
    stim[62] = 10'h22d;
    stim[63] = 10'h374;
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
      expv[0] = 10'h0a6;
      expv[1] = 10'h34e;
      expv[2] = 10'h207;
      expv[3] = 10'h145;
      expv[4] = 10'h3b5;
      expv[5] = 10'h293;
      expv[6] = 10'h254;
      expv[7] = 10'h2a9;
      expv[8] = 10'h234;
      expv[9] = 10'h293;
      expv[10] = 10'h3dd;
      expv[11] = 10'h34c;
      expv[12] = 10'h310;
      expv[13] = 10'h142;
      expv[14] = 10'h05a;
      expv[15] = 10'h08c;
      expv[16] = 10'h09c;
      expv[17] = 10'h2ae;
      expv[18] = 10'h239;
      expv[19] = 10'h09f;
      expv[20] = 10'h316;
      expv[21] = 10'h2cd;
      expv[22] = 10'h0b0;
      expv[23] = 10'h297;
      expv[24] = 10'h0eb;
      expv[25] = 10'h07d;
      expv[26] = 10'h3d7;
      expv[27] = 10'h2f3;
      expv[28] = 10'h088;
      expv[29] = 10'h172;
      expv[30] = 10'h181;
      expv[31] = 10'h120;
      expv[32] = 10'h10b;
      expv[33] = 10'h145;
      expv[34] = 10'h00b;
      expv[35] = 10'h372;
      expv[36] = 10'h152;
      expv[37] = 10'h120;
      expv[38] = 10'h37e;
      expv[39] = 10'h12a;
      expv[40] = 10'h0ed;
      expv[41] = 10'h053;
      expv[42] = 10'h1f8;
      expv[43] = 10'h24a;
      expv[44] = 10'h386;
      expv[45] = 10'h15e;
      expv[46] = 10'h3ab;
      expv[47] = 10'h38c;
      expv[48] = 10'h308;
      expv[49] = 10'h2ac;
      expv[50] = 10'h299;
      expv[51] = 10'h02c;
      expv[52] = 10'h17e;
      expv[53] = 10'h07e;
      expv[54] = 10'h255;
      expv[55] = 10'h1f4;
      expv[56] = 10'h3db;
      expv[57] = 10'h373;
      expv[58] = 10'h2b3;
      expv[59] = 10'h191;
      expv[60] = 10'h3ae;
      expv[61] = 10'h142;
      expv[62] = 10'h316;
      expv[63] = 10'h1ba;
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
