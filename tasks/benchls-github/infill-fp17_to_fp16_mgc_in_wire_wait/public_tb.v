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

  FP17_TO_FP16_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h121;
    stim[1] = 10'h267;
    stim[2] = 10'h3aa;
    stim[3] = 10'h11f;
    stim[4] = 10'h253;
    stim[5] = 10'h288;
    stim[6] = 10'h34f;
    stim[7] = 10'h0c4;
    stim[8] = 10'h221;
    stim[9] = 10'h39e;
    stim[10] = 10'h3f5;
    stim[11] = 10'h1a4;
    stim[12] = 10'h1f0;
    stim[13] = 10'h39a;
    stim[14] = 10'h0e0;
    stim[15] = 10'h041;
    stim[16] = 10'h184;
    stim[17] = 10'h06c;
    stim[18] = 10'h0b3;
    stim[19] = 10'h030;
    stim[20] = 10'h022;
    stim[21] = 10'h3f4;
    stim[22] = 10'h186;
    stim[23] = 10'h202;
    stim[24] = 10'h158;
    stim[25] = 10'h353;
    stim[26] = 10'h2e7;
    stim[27] = 10'h13c;
    stim[28] = 10'h353;
    stim[29] = 10'h010;
    stim[30] = 10'h0ec;
    stim[31] = 10'h388;
    stim[32] = 10'h05f;
    stim[33] = 10'h1d3;
    stim[34] = 10'h0f0;
    stim[35] = 10'h0a1;
    stim[36] = 10'h201;
    stim[37] = 10'h1f9;
    stim[38] = 10'h02a;
    stim[39] = 10'h30b;
    stim[40] = 10'h025;
    stim[41] = 10'h230;
    stim[42] = 10'h082;
    stim[43] = 10'h37f;
    stim[44] = 10'h038;
    stim[45] = 10'h1ec;
    stim[46] = 10'h2dc;
    stim[47] = 10'h359;
    stim[48] = 10'h335;
    stim[49] = 10'h332;
    stim[50] = 10'h051;
    stim[51] = 10'h2c5;
    stim[52] = 10'h38e;
    stim[53] = 10'h3c3;
    stim[54] = 10'h0dd;
    stim[55] = 10'h2fc;
    stim[56] = 10'h353;
    stim[57] = 10'h3af;
    stim[58] = 10'h26b;
    stim[59] = 10'h264;
    stim[60] = 10'h16c;
    stim[61] = 10'h1c0;
    stim[62] = 10'h1ba;
    stim[63] = 10'h24d;
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
      expv[0] = 10'h242;
      expv[1] = 10'h0cf;
      expv[2] = 10'h355;
      expv[3] = 10'h23e;
      expv[4] = 10'h0a7;
      expv[5] = 10'h111;
      expv[6] = 10'h29f;
      expv[7] = 10'h188;
      expv[8] = 10'h043;
      expv[9] = 10'h33d;
      expv[10] = 10'h3eb;
      expv[11] = 10'h348;
      expv[12] = 10'h3e0;
      expv[13] = 10'h335;
      expv[14] = 10'h1c0;
      expv[15] = 10'h082;
      expv[16] = 10'h308;
      expv[17] = 10'h0d8;
      expv[18] = 10'h166;
      expv[19] = 10'h060;
      expv[20] = 10'h044;
      expv[21] = 10'h3e9;
      expv[22] = 10'h30c;
      expv[23] = 10'h005;
      expv[24] = 10'h2b0;
      expv[25] = 10'h2a7;
      expv[26] = 10'h1cf;
      expv[27] = 10'h278;
      expv[28] = 10'h2a7;
      expv[29] = 10'h020;
      expv[30] = 10'h1d8;
      expv[31] = 10'h311;
      expv[32] = 10'h0be;
      expv[33] = 10'h3a6;
      expv[34] = 10'h1e0;
      expv[35] = 10'h142;
      expv[36] = 10'h003;
      expv[37] = 10'h3f2;
      expv[38] = 10'h054;
      expv[39] = 10'h217;
      expv[40] = 10'h04a;
      expv[41] = 10'h061;
      expv[42] = 10'h104;
      expv[43] = 10'h2ff;
      expv[44] = 10'h070;
      expv[45] = 10'h3d8;
      expv[46] = 10'h1b9;
      expv[47] = 10'h2b3;
      expv[48] = 10'h26b;
      expv[49] = 10'h265;
      expv[50] = 10'h0a2;
      expv[51] = 10'h18b;
      expv[52] = 10'h31d;
      expv[53] = 10'h387;
      expv[54] = 10'h1ba;
      expv[55] = 10'h1f9;
      expv[56] = 10'h2a7;
      expv[57] = 10'h35f;
      expv[58] = 10'h0d7;
      expv[59] = 10'h0c9;
      expv[60] = 10'h2d8;
      expv[61] = 10'h380;
      expv[62] = 10'h374;
      expv[63] = 10'h09b;
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
