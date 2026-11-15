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

  FP32_TO_FP17_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h21b;
    stim[1] = 10'h375;
    stim[2] = 10'h008;
    stim[3] = 10'h1f9;
    stim[4] = 10'h3c1;
    stim[5] = 10'h361;
    stim[6] = 10'h018;
    stim[7] = 10'h2f2;
    stim[8] = 10'h1d7;
    stim[9] = 10'h37c;
    stim[10] = 10'h297;
    stim[11] = 10'h11d;
    stim[12] = 10'h259;
    stim[13] = 10'h11e;
    stim[14] = 10'h226;
    stim[15] = 10'h040;
    stim[16] = 10'h053;
    stim[17] = 10'h0c8;
    stim[18] = 10'h2c6;
    stim[19] = 10'h145;
    stim[20] = 10'h10b;
    stim[21] = 10'h19e;
    stim[22] = 10'h36e;
    stim[23] = 10'h3dc;
    stim[24] = 10'h3f7;
    stim[25] = 10'h199;
    stim[26] = 10'h1a5;
    stim[27] = 10'h11f;
    stim[28] = 10'h207;
    stim[29] = 10'h333;
    stim[30] = 10'h106;
    stim[31] = 10'h1bb;
    stim[32] = 10'h145;
    stim[33] = 10'h177;
    stim[34] = 10'h103;
    stim[35] = 10'h186;
    stim[36] = 10'h08d;
    stim[37] = 10'h3bc;
    stim[38] = 10'h1d8;
    stim[39] = 10'h15c;
    stim[40] = 10'h1ca;
    stim[41] = 10'h25a;
    stim[42] = 10'h3e6;
    stim[43] = 10'h218;
    stim[44] = 10'h14c;
    stim[45] = 10'h154;
    stim[46] = 10'h19a;
    stim[47] = 10'h23a;
    stim[48] = 10'h102;
    stim[49] = 10'h01c;
    stim[50] = 10'h025;
    stim[51] = 10'h2a6;
    stim[52] = 10'h156;
    stim[53] = 10'h22d;
    stim[54] = 10'h027;
    stim[55] = 10'h14f;
    stim[56] = 10'h0c5;
    stim[57] = 10'h005;
    stim[58] = 10'h187;
    stim[59] = 10'h148;
    stim[60] = 10'h07a;
    stim[61] = 10'h2b5;
    stim[62] = 10'h106;
    stim[63] = 10'h115;
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
      expv[0] = 10'h30d;
      expv[1] = 10'h3ba;
      expv[2] = 10'h004;
      expv[3] = 10'h2fc;
      expv[4] = 10'h3e0;
      expv[5] = 10'h3b0;
      expv[6] = 10'h00c;
      expv[7] = 10'h179;
      expv[8] = 10'h2eb;
      expv[9] = 10'h1be;
      expv[10] = 10'h34b;
      expv[11] = 10'h28e;
      expv[12] = 10'h32c;
      expv[13] = 10'h08f;
      expv[14] = 10'h113;
      expv[15] = 10'h020;
      expv[16] = 10'h229;
      expv[17] = 10'h064;
      expv[18] = 10'h163;
      expv[19] = 10'h2a2;
      expv[20] = 10'h285;
      expv[21] = 10'h0cf;
      expv[22] = 10'h1b7;
      expv[23] = 10'h1ee;
      expv[24] = 10'h3fb;
      expv[25] = 10'h2cc;
      expv[26] = 10'h2d2;
      expv[27] = 10'h28f;
      expv[28] = 10'h303;
      expv[29] = 10'h399;
      expv[30] = 10'h083;
      expv[31] = 10'h2dd;
      expv[32] = 10'h2a2;
      expv[33] = 10'h2bb;
      expv[34] = 10'h281;
      expv[35] = 10'h0c3;
      expv[36] = 10'h246;
      expv[37] = 10'h1de;
      expv[38] = 10'h0ec;
      expv[39] = 10'h0ae;
      expv[40] = 10'h0e5;
      expv[41] = 10'h12d;
      expv[42] = 10'h1f3;
      expv[43] = 10'h10c;
      expv[44] = 10'h0a6;
      expv[45] = 10'h0aa;
      expv[46] = 10'h0cd;
      expv[47] = 10'h11d;
      expv[48] = 10'h081;
      expv[49] = 10'h00e;
      expv[50] = 10'h212;
      expv[51] = 10'h153;
      expv[52] = 10'h0ab;
      expv[53] = 10'h316;
      expv[54] = 10'h213;
      expv[55] = 10'h2a7;
      expv[56] = 10'h262;
      expv[57] = 10'h202;
      expv[58] = 10'h2c3;
      expv[59] = 10'h0a4;
      expv[60] = 10'h03d;
      expv[61] = 10'h35a;
      expv[62] = 10'h083;
      expv[63] = 10'h28a;
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
