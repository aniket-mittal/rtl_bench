// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121802 dut (
    .clk(clk),
    .rst_n(in_vec[37:37]),
    .SS_n(in_vec[36:36]),
    .SCLK(in_vec[35:35]),
    .MOSI(in_vec[34:34]),
    .edg(in_vec[33:33]),
    .len8_16(in_vec[32:32]),
    .mask(in_vec[31:16]),
    .match(in_vec[15:0]),
    .SPItrig(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h0918e9e79a;
    stim[1] = 38'h0216b2a1d0;
    stim[2] = 38'h2994e41e07;
    stim[3] = 38'h3d19fd4f5d;
    stim[4] = 38'h37734c61ee;
    stim[5] = 38'h27f59a7087;
    stim[6] = 38'h2e875576fb;
    stim[7] = 38'h225f143685;
    stim[8] = 38'h2f703e0ef4;
    stim[9] = 38'h3ae5900622;
    stim[10] = 38'h33176d0b66;
    stim[11] = 38'h2ea4e61feb;
    stim[12] = 38'h37e2384ebd;
    stim[13] = 38'h2d99e0b418;
    stim[14] = 38'h32a44c6f02;
    stim[15] = 38'h2465c93703;
    stim[16] = 38'h3abf3330b6;
    stim[17] = 38'h2f2dafd5ae;
    stim[18] = 38'h30392029d8;
    stim[19] = 38'h278967d1d8;
    stim[20] = 38'h38b391fb79;
    stim[21] = 38'h295aa9678f;
    stim[22] = 38'h3bc2e57c74;
    stim[23] = 38'h31c4e6f8bf;
    stim[24] = 38'h240d475a6a;
    stim[25] = 38'h23ab747366;
    stim[26] = 38'h33d9ba4d11;
    stim[27] = 38'h23cc1dbf48;
    stim[28] = 38'h2305f09146;
    stim[29] = 38'h3a9c56ff86;
    stim[30] = 38'h201350bee9;
    stim[31] = 38'h26bd424fee;
    stim[32] = 38'h30ea9b3e5c;
    stim[33] = 38'h38288aec24;
    stim[34] = 38'h26d506e246;
    stim[35] = 38'h3ca805e859;
    stim[36] = 38'h3454c72d23;
    stim[37] = 38'h20e6f33748;
    stim[38] = 38'h22a0005ef2;
    stim[39] = 38'h326ba8b9b7;
    stim[40] = 38'h26770d0d04;
    stim[41] = 38'h2630b1ba59;
    stim[42] = 38'h2f5adb55ae;
    stim[43] = 38'h292dd6012a;
    stim[44] = 38'h36c8a96f2d;
    stim[45] = 38'h35b83b574c;
    stim[46] = 38'h215bc2fa4d;
    stim[47] = 38'h3ef46103b1;
    stim[48] = 38'h2f1ab6fe6b;
    stim[49] = 38'h3a53697d79;
    stim[50] = 38'h2a4bf10450;
    stim[51] = 38'h3e61292ee6;
    stim[52] = 38'h25c6bca573;
    stim[53] = 38'h240eb1dddb;
    stim[54] = 38'h39d109511a;
    stim[55] = 38'h23c63f4a3e;
    stim[56] = 38'h3ad8e066a9;
    stim[57] = 38'h2294865eea;
    stim[58] = 38'h3031d18c8e;
    stim[59] = 38'h22b40b765d;
    stim[60] = 38'h37a27f30db;
    stim[61] = 38'h2887a3d2b5;
    stim[62] = 38'h3d11d90a11;
    stim[63] = 38'h2bef44b4e4;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
