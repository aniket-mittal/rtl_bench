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

  CDP_OCVT_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h123;
    stim[1] = 10'h1bf;
    stim[2] = 10'h004;
    stim[3] = 10'h343;
    stim[4] = 10'h2f1;
    stim[5] = 10'h123;
    stim[6] = 10'h38a;
    stim[7] = 10'h268;
    stim[8] = 10'h349;
    stim[9] = 10'h293;
    stim[10] = 10'h30d;
    stim[11] = 10'h337;
    stim[12] = 10'h2a6;
    stim[13] = 10'h299;
    stim[14] = 10'h013;
    stim[15] = 10'h3b5;
    stim[16] = 10'h32e;
    stim[17] = 10'h0fd;
    stim[18] = 10'h008;
    stim[19] = 10'h047;
    stim[20] = 10'h1f9;
    stim[21] = 10'h084;
    stim[22] = 10'h3ba;
    stim[23] = 10'h09a;
    stim[24] = 10'h363;
    stim[25] = 10'h2f5;
    stim[26] = 10'h399;
    stim[27] = 10'h208;
    stim[28] = 10'h25a;
    stim[29] = 10'h146;
    stim[30] = 10'h271;
    stim[31] = 10'h14c;
    stim[32] = 10'h03b;
    stim[33] = 10'h15e;
    stim[34] = 10'h06e;
    stim[35] = 10'h1e5;
    stim[36] = 10'h07b;
    stim[37] = 10'h12f;
    stim[38] = 10'h366;
    stim[39] = 10'h1a4;
    stim[40] = 10'h353;
    stim[41] = 10'h256;
    stim[42] = 10'h23a;
    stim[43] = 10'h3f7;
    stim[44] = 10'h2d3;
    stim[45] = 10'h0ba;
    stim[46] = 10'h157;
    stim[47] = 10'h259;
    stim[48] = 10'h2b5;
    stim[49] = 10'h01a;
    stim[50] = 10'h316;
    stim[51] = 10'h31a;
    stim[52] = 10'h235;
    stim[53] = 10'h107;
    stim[54] = 10'h1ac;
    stim[55] = 10'h152;
    stim[56] = 10'h01e;
    stim[57] = 10'h29a;
    stim[58] = 10'h274;
    stim[59] = 10'h30e;
    stim[60] = 10'h051;
    stim[61] = 10'h387;
    stim[62] = 10'h03d;
    stim[63] = 10'h054;
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
      expv[0] = 10'h291;
      expv[1] = 10'h2df;
      expv[2] = 10'h002;
      expv[3] = 10'h3a1;
      expv[4] = 10'h378;
      expv[5] = 10'h291;
      expv[6] = 10'h1c5;
      expv[7] = 10'h134;
      expv[8] = 10'h3a4;
      expv[9] = 10'h349;
      expv[10] = 10'h386;
      expv[11] = 10'h39b;
      expv[12] = 10'h153;
      expv[13] = 10'h34c;
      expv[14] = 10'h209;
      expv[15] = 10'h3da;
      expv[16] = 10'h197;
      expv[17] = 10'h27e;
      expv[18] = 10'h004;
      expv[19] = 10'h223;
      expv[20] = 10'h2fc;
      expv[21] = 10'h042;
      expv[22] = 10'h1dd;
      expv[23] = 10'h04d;
      expv[24] = 10'h3b1;
      expv[25] = 10'h37a;
      expv[26] = 10'h3cc;
      expv[27] = 10'h104;
      expv[28] = 10'h12d;
      expv[29] = 10'h0a3;
      expv[30] = 10'h338;
      expv[31] = 10'h0a6;
      expv[32] = 10'h21d;
      expv[33] = 10'h0af;
      expv[34] = 10'h037;
      expv[35] = 10'h2f2;
      expv[36] = 10'h23d;
      expv[37] = 10'h297;
      expv[38] = 10'h1b3;
      expv[39] = 10'h0d2;
      expv[40] = 10'h3a9;
      expv[41] = 10'h12b;
      expv[42] = 10'h11d;
      expv[43] = 10'h3fb;
      expv[44] = 10'h369;
      expv[45] = 10'h05d;
      expv[46] = 10'h2ab;
      expv[47] = 10'h32c;
      expv[48] = 10'h35a;
      expv[49] = 10'h00d;
      expv[50] = 10'h18b;
      expv[51] = 10'h18d;
      expv[52] = 10'h31a;
      expv[53] = 10'h283;
      expv[54] = 10'h0d6;
      expv[55] = 10'h0a9;
      expv[56] = 10'h00f;
      expv[57] = 10'h14d;
      expv[58] = 10'h13a;
      expv[59] = 10'h187;
      expv[60] = 10'h228;
      expv[61] = 10'h3c3;
      expv[62] = 10'h21e;
      expv[63] = 10'h02a;
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
