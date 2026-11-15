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

  CDP_OCVT_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h29e;
    stim[1] = 10'h2ab;
    stim[2] = 10'h138;
    stim[3] = 10'h2bc;
    stim[4] = 10'h113;
    stim[5] = 10'h392;
    stim[6] = 10'h384;
    stim[7] = 10'h0ff;
    stim[8] = 10'h2d0;
    stim[9] = 10'h315;
    stim[10] = 10'h1d9;
    stim[11] = 10'h22a;
    stim[12] = 10'h185;
    stim[13] = 10'h2a7;
    stim[14] = 10'h211;
    stim[15] = 10'h016;
    stim[16] = 10'h1f7;
    stim[17] = 10'h2e1;
    stim[18] = 10'h270;
    stim[19] = 10'h2de;
    stim[20] = 10'h0dd;
    stim[21] = 10'h093;
    stim[22] = 10'h08b;
    stim[23] = 10'h235;
    stim[24] = 10'h171;
    stim[25] = 10'h29e;
    stim[26] = 10'h0d5;
    stim[27] = 10'h3db;
    stim[28] = 10'h2d5;
    stim[29] = 10'h1fd;
    stim[30] = 10'h004;
    stim[31] = 10'h27c;
    stim[32] = 10'h27c;
    stim[33] = 10'h0eb;
    stim[34] = 10'h3e9;
    stim[35] = 10'h2f5;
    stim[36] = 10'h263;
    stim[37] = 10'h2d3;
    stim[38] = 10'h308;
    stim[39] = 10'h02f;
    stim[40] = 10'h0fd;
    stim[41] = 10'h1d0;
    stim[42] = 10'h36f;
    stim[43] = 10'h180;
    stim[44] = 10'h1cc;
    stim[45] = 10'h37b;
    stim[46] = 10'h0b7;
    stim[47] = 10'h30a;
    stim[48] = 10'h1ab;
    stim[49] = 10'h2a2;
    stim[50] = 10'h048;
    stim[51] = 10'h3c8;
    stim[52] = 10'h18d;
    stim[53] = 10'h35f;
    stim[54] = 10'h3bd;
    stim[55] = 10'h325;
    stim[56] = 10'h054;
    stim[57] = 10'h21c;
    stim[58] = 10'h2f3;
    stim[59] = 10'h1b3;
    stim[60] = 10'h245;
    stim[61] = 10'h3ae;
    stim[62] = 10'h009;
    stim[63] = 10'h01a;
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
      expv[0] = 10'h13d;
      expv[1] = 10'h157;
      expv[2] = 10'h270;
      expv[3] = 10'h179;
      expv[4] = 10'h226;
      expv[5] = 10'h325;
      expv[6] = 10'h309;
      expv[7] = 10'h1fe;
      expv[8] = 10'h1a1;
      expv[9] = 10'h22b;
      expv[10] = 10'h3b2;
      expv[11] = 10'h055;
      expv[12] = 10'h30a;
      expv[13] = 10'h14f;
      expv[14] = 10'h023;
      expv[15] = 10'h02c;
      expv[16] = 10'h3ee;
      expv[17] = 10'h1c3;
      expv[18] = 10'h0e1;
      expv[19] = 10'h1bd;
      expv[20] = 10'h1ba;
      expv[21] = 10'h126;
      expv[22] = 10'h116;
      expv[23] = 10'h06b;
      expv[24] = 10'h2e2;
      expv[25] = 10'h13d;
      expv[26] = 10'h1aa;
      expv[27] = 10'h3b7;
      expv[28] = 10'h1ab;
      expv[29] = 10'h3fa;
      expv[30] = 10'h008;
      expv[31] = 10'h0f9;
      expv[32] = 10'h0f9;
      expv[33] = 10'h1d6;
      expv[34] = 10'h3d3;
      expv[35] = 10'h1eb;
      expv[36] = 10'h0c7;
      expv[37] = 10'h1a7;
      expv[38] = 10'h211;
      expv[39] = 10'h05e;
      expv[40] = 10'h1fa;
      expv[41] = 10'h3a0;
      expv[42] = 10'h2df;
      expv[43] = 10'h300;
      expv[44] = 10'h398;
      expv[45] = 10'h2f7;
      expv[46] = 10'h16e;
      expv[47] = 10'h215;
      expv[48] = 10'h356;
      expv[49] = 10'h145;
      expv[50] = 10'h090;
      expv[51] = 10'h391;
      expv[52] = 10'h31a;
      expv[53] = 10'h2bf;
      expv[54] = 10'h37b;
      expv[55] = 10'h24b;
      expv[56] = 10'h0a8;
      expv[57] = 10'h039;
      expv[58] = 10'h1e7;
      expv[59] = 10'h366;
      expv[60] = 10'h08b;
      expv[61] = 10'h35d;
      expv[62] = 10'h012;
      expv[63] = 10'h034;
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
