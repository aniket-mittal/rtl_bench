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

  SDP_Y_INP_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h29e;
    stim[1] = 10'h118;
    stim[2] = 10'h2c7;
    stim[3] = 10'h316;
    stim[4] = 10'h108;
    stim[5] = 10'h05f;
    stim[6] = 10'h0b2;
    stim[7] = 10'h235;
    stim[8] = 10'h0fc;
    stim[9] = 10'h351;
    stim[10] = 10'h219;
    stim[11] = 10'h3b4;
    stim[12] = 10'h158;
    stim[13] = 10'h0e1;
    stim[14] = 10'h3d1;
    stim[15] = 10'h011;
    stim[16] = 10'h3db;
    stim[17] = 10'h2d3;
    stim[18] = 10'h04d;
    stim[19] = 10'h333;
    stim[20] = 10'h10d;
    stim[21] = 10'h13b;
    stim[22] = 10'h395;
    stim[23] = 10'h000;
    stim[24] = 10'h0f8;
    stim[25] = 10'h013;
    stim[26] = 10'h36e;
    stim[27] = 10'h363;
    stim[28] = 10'h30d;
    stim[29] = 10'h14e;
    stim[30] = 10'h290;
    stim[31] = 10'h172;
    stim[32] = 10'h061;
    stim[33] = 10'h017;
    stim[34] = 10'h31c;
    stim[35] = 10'h05d;
    stim[36] = 10'h10e;
    stim[37] = 10'h152;
    stim[38] = 10'h1b0;
    stim[39] = 10'h33b;
    stim[40] = 10'h33a;
    stim[41] = 10'h109;
    stim[42] = 10'h169;
    stim[43] = 10'h1e0;
    stim[44] = 10'h2dd;
    stim[45] = 10'h14e;
    stim[46] = 10'h374;
    stim[47] = 10'h29a;
    stim[48] = 10'h3cf;
    stim[49] = 10'h0cd;
    stim[50] = 10'h13a;
    stim[51] = 10'h2fc;
    stim[52] = 10'h2d9;
    stim[53] = 10'h2f1;
    stim[54] = 10'h279;
    stim[55] = 10'h1e9;
    stim[56] = 10'h038;
    stim[57] = 10'h3f6;
    stim[58] = 10'h0b7;
    stim[59] = 10'h1af;
    stim[60] = 10'h063;
    stim[61] = 10'h16b;
    stim[62] = 10'h3d9;
    stim[63] = 10'h3a4;
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
      expv[0] = 10'h14f;
      expv[1] = 10'h08c;
      expv[2] = 10'h363;
      expv[3] = 10'h18b;
      expv[4] = 10'h084;
      expv[5] = 10'h22f;
      expv[6] = 10'h059;
      expv[7] = 10'h31a;
      expv[8] = 10'h07e;
      expv[9] = 10'h3a8;
      expv[10] = 10'h30c;
      expv[11] = 10'h1da;
      expv[12] = 10'h0ac;
      expv[13] = 10'h270;
      expv[14] = 10'h3e8;
      expv[15] = 10'h208;
      expv[16] = 10'h3ed;
      expv[17] = 10'h369;
      expv[18] = 10'h226;
      expv[19] = 10'h399;
      expv[20] = 10'h286;
      expv[21] = 10'h29d;
      expv[22] = 10'h3ca;
      expv[23] = 10'h000;
      expv[24] = 10'h07c;
      expv[25] = 10'h209;
      expv[26] = 10'h1b7;
      expv[27] = 10'h3b1;
      expv[28] = 10'h386;
      expv[29] = 10'h0a7;
      expv[30] = 10'h148;
      expv[31] = 10'h0b9;
      expv[32] = 10'h230;
      expv[33] = 10'h20b;
      expv[34] = 10'h18e;
      expv[35] = 10'h22e;
      expv[36] = 10'h087;
      expv[37] = 10'h0a9;
      expv[38] = 10'h0d8;
      expv[39] = 10'h39d;
      expv[40] = 10'h19d;
      expv[41] = 10'h284;
      expv[42] = 10'h2b4;
      expv[43] = 10'h0f0;
      expv[44] = 10'h36e;
      expv[45] = 10'h0a7;
      expv[46] = 10'h1ba;
      expv[47] = 10'h14d;
      expv[48] = 10'h3e7;
      expv[49] = 10'h266;
      expv[50] = 10'h09d;
      expv[51] = 10'h17e;
      expv[52] = 10'h36c;
      expv[53] = 10'h378;
      expv[54] = 10'h33c;
      expv[55] = 10'h2f4;
      expv[56] = 10'h01c;
      expv[57] = 10'h1fb;
      expv[58] = 10'h25b;
      expv[59] = 10'h2d7;
      expv[60] = 10'h231;
      expv[61] = 10'h2b5;
      expv[62] = 10'h3ec;
      expv[63] = 10'h1d2;
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
