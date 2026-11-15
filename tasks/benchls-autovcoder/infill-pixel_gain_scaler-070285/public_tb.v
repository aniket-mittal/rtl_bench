// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070285 dut (
    .pclk(clk),
    .rst_n(in_vec[18:18]),
    .gain(in_vec[17:10]),
    .in_href(in_vec[9:9]),
    .in_vsync(in_vec[8:8]),
    .in_raw(in_vec[7:0]),
    .out_href(out_vec[9:9]),
    .out_vsync(out_vec[8:8]),
    .out_raw(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h09e96;
    stim[1] = 19'h09388;
    stim[2] = 19'h68a30;
    stim[3] = 19'h785df;
    stim[4] = 19'h6d1d0;
    stim[5] = 19'h61717;
    stim[6] = 19'h5467f;
    stim[7] = 19'h78c2c;
    stim[8] = 19'h7f573;
    stim[9] = 19'h53de8;
    stim[10] = 19'h44f3c;
    stim[11] = 19'h49f69;
    stim[12] = 19'h4f8ef;
    stim[13] = 19'h72839;
    stim[14] = 19'h63702;
    stim[15] = 19'h6c2b1;
    stim[16] = 19'h56782;
    stim[17] = 19'h60462;
    stim[18] = 19'h511cc;
    stim[19] = 19'h7b607;
    stim[20] = 19'h7355a;
    stim[21] = 19'h4957a;
    stim[22] = 19'h6d5ab;
    stim[23] = 19'h718b1;
    stim[24] = 19'h43acd;
    stim[25] = 19'h7d44a;
    stim[26] = 19'h7979f;
    stim[27] = 19'h6d52b;
    stim[28] = 19'h500c1;
    stim[29] = 19'h494e8;
    stim[30] = 19'h63b10;
    stim[31] = 19'h5957a;
    stim[32] = 19'h6700b;
    stim[33] = 19'h561c3;
    stim[34] = 19'h5b48b;
    stim[35] = 19'h7d559;
    stim[36] = 19'h5da46;
    stim[37] = 19'h6fa5d;
    stim[38] = 19'h6548e;
    stim[39] = 19'h670d8;
    stim[40] = 19'h739fa;
    stim[41] = 19'h7640e;
    stim[42] = 19'h49897;
    stim[43] = 19'h7e0da;
    stim[44] = 19'h6cbb0;
    stim[45] = 19'h4273e;
    stim[46] = 19'h47f3a;
    stim[47] = 19'h7ac96;
    stim[48] = 19'h69c12;
    stim[49] = 19'h6b5cd;
    stim[50] = 19'h78f5d;
    stim[51] = 19'h61959;
    stim[52] = 19'h59c99;
    stim[53] = 19'h76ee1;
    stim[54] = 19'h572cc;
    stim[55] = 19'h42afe;
    stim[56] = 19'h7b075;
    stim[57] = 19'h6beff;
    stim[58] = 19'h6910a;
    stim[59] = 19'h76af9;
    stim[60] = 19'h463aa;
    stim[61] = 19'h4f80e;
    stim[62] = 19'h50ae7;
    stim[63] = 19'h5a7f9;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h2ff;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h3bf;
      expv[8] = 10'h2ff;
      expv[9] = 10'h000;
      expv[10] = 10'h100;
      expv[11] = 10'h100;
      expv[12] = 10'h347;
      expv[13] = 10'h3ff;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h311;
      expv[17] = 10'h2ff;
      expv[18] = 10'h3ff;
      expv[19] = 10'h000;
      expv[20] = 10'h100;
      expv[21] = 10'h267;
      expv[22] = 10'h100;
      expv[23] = 10'h100;
      expv[24] = 10'h100;
      expv[25] = 10'h000;
      expv[26] = 10'h2b3;
      expv[27] = 10'h000;
      expv[28] = 10'h3ff;
      expv[29] = 10'h100;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h38e;
      expv[33] = 10'h100;
      expv[34] = 10'h000;
      expv[35] = 10'h100;
      expv[36] = 10'h000;
      expv[37] = 10'h100;
      expv[38] = 10'h2ff;
      expv[39] = 10'h2ff;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h100;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h3ff;
      expv[47] = 10'h322;
      expv[48] = 10'h370;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h100;
      expv[52] = 10'h3ff;
      expv[53] = 10'h100;
      expv[54] = 10'h000;
      expv[55] = 10'h2ff;
      expv[56] = 10'h2ff;
      expv[57] = 10'h29e;
      expv[58] = 10'h000;
      expv[59] = 10'h2ff;
      expv[60] = 10'h100;
      expv[61] = 10'h2ff;
      expv[62] = 10'h3ff;
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
