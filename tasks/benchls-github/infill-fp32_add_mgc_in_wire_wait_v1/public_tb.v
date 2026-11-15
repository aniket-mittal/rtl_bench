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

  FP32_ADD_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h234;
    stim[1] = 10'h00d;
    stim[2] = 10'h047;
    stim[3] = 10'h072;
    stim[4] = 10'h25d;
    stim[5] = 10'h3cc;
    stim[6] = 10'h38b;
    stim[7] = 10'h181;
    stim[8] = 10'h25d;
    stim[9] = 10'h12e;
    stim[10] = 10'h1fa;
    stim[11] = 10'h1ef;
    stim[12] = 10'h085;
    stim[13] = 10'h146;
    stim[14] = 10'h1e0;
    stim[15] = 10'h03a;
    stim[16] = 10'h1dd;
    stim[17] = 10'h12a;
    stim[18] = 10'h300;
    stim[19] = 10'h0f4;
    stim[20] = 10'h262;
    stim[21] = 10'h30b;
    stim[22] = 10'h0a8;
    stim[23] = 10'h2bb;
    stim[24] = 10'h1c4;
    stim[25] = 10'h25e;
    stim[26] = 10'h05b;
    stim[27] = 10'h3df;
    stim[28] = 10'h08d;
    stim[29] = 10'h30e;
    stim[30] = 10'h3cb;
    stim[31] = 10'h079;
    stim[32] = 10'h3ad;
    stim[33] = 10'h054;
    stim[34] = 10'h310;
    stim[35] = 10'h29e;
    stim[36] = 10'h36f;
    stim[37] = 10'h3fb;
    stim[38] = 10'h207;
    stim[39] = 10'h005;
    stim[40] = 10'h268;
    stim[41] = 10'h13d;
    stim[42] = 10'h34b;
    stim[43] = 10'h06a;
    stim[44] = 10'h003;
    stim[45] = 10'h1d8;
    stim[46] = 10'h353;
    stim[47] = 10'h05b;
    stim[48] = 10'h002;
    stim[49] = 10'h30e;
    stim[50] = 10'h1cd;
    stim[51] = 10'h0fb;
    stim[52] = 10'h216;
    stim[53] = 10'h068;
    stim[54] = 10'h2e8;
    stim[55] = 10'h37f;
    stim[56] = 10'h212;
    stim[57] = 10'h3bd;
    stim[58] = 10'h010;
    stim[59] = 10'h324;
    stim[60] = 10'h1ce;
    stim[61] = 10'h101;
    stim[62] = 10'h0fa;
    stim[63] = 10'h210;
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
      expv[0] = 10'h069;
      expv[1] = 10'h01a;
      expv[2] = 10'h08e;
      expv[3] = 10'h0e4;
      expv[4] = 10'h0bb;
      expv[5] = 10'h399;
      expv[6] = 10'h317;
      expv[7] = 10'h302;
      expv[8] = 10'h0bb;
      expv[9] = 10'h25c;
      expv[10] = 10'h3f4;
      expv[11] = 10'h3de;
      expv[12] = 10'h10a;
      expv[13] = 10'h28c;
      expv[14] = 10'h3c0;
      expv[15] = 10'h074;
      expv[16] = 10'h3ba;
      expv[17] = 10'h254;
      expv[18] = 10'h201;
      expv[19] = 10'h1e8;
      expv[20] = 10'h0c5;
      expv[21] = 10'h217;
      expv[22] = 10'h150;
      expv[23] = 10'h177;
      expv[24] = 10'h388;
      expv[25] = 10'h0bd;
      expv[26] = 10'h0b6;
      expv[27] = 10'h3bf;
      expv[28] = 10'h11a;
      expv[29] = 10'h21d;
      expv[30] = 10'h397;
      expv[31] = 10'h0f2;
      expv[32] = 10'h35b;
      expv[33] = 10'h0a8;
      expv[34] = 10'h221;
      expv[35] = 10'h13d;
      expv[36] = 10'h2df;
      expv[37] = 10'h3f7;
      expv[38] = 10'h00f;
      expv[39] = 10'h00a;
      expv[40] = 10'h0d1;
      expv[41] = 10'h27a;
      expv[42] = 10'h297;
      expv[43] = 10'h0d4;
      expv[44] = 10'h006;
      expv[45] = 10'h3b0;
      expv[46] = 10'h2a7;
      expv[47] = 10'h0b6;
      expv[48] = 10'h004;
      expv[49] = 10'h21d;
      expv[50] = 10'h39a;
      expv[51] = 10'h1f6;
      expv[52] = 10'h02d;
      expv[53] = 10'h0d0;
      expv[54] = 10'h1d1;
      expv[55] = 10'h2ff;
      expv[56] = 10'h025;
      expv[57] = 10'h37b;
      expv[58] = 10'h020;
      expv[59] = 10'h249;
      expv[60] = 10'h39c;
      expv[61] = 10'h202;
      expv[62] = 10'h1f4;
      expv[63] = 10'h021;
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
