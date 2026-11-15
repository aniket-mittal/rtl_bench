// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107406 dut (
    .SW(in_vec[13:4]),
    .KEY(in_vec[3:0]),
    .LEDR(out_vec[51:42]),
    .HEX0(out_vec[41:35]),
    .HEX1(out_vec[34:28]),
    .HEX2(out_vec[27:21]),
    .HEX3(out_vec[20:14]),
    .HEX4(out_vec[13:7]),
    .HEX5(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h0e61;
    stim[1] = 14'h1bbb;
    stim[2] = 14'h3bbf;
    stim[3] = 14'h1aa3;
    stim[4] = 14'h231d;
    stim[5] = 14'h2068;
    stim[6] = 14'h013b;
    stim[7] = 14'h0942;
    stim[8] = 14'h1298;
    stim[9] = 14'h1ae1;
    stim[10] = 14'h03e3;
    stim[11] = 14'h1348;
    stim[12] = 14'h3ff5;
    stim[13] = 14'h277b;
    stim[14] = 14'h3e49;
    stim[15] = 14'h2e9a;
    stim[16] = 14'h2cef;
    stim[17] = 14'h32a8;
    stim[18] = 14'h108e;
    stim[19] = 14'h3ec9;
    stim[20] = 14'h0535;
    stim[21] = 14'h0239;
    stim[22] = 14'h36c2;
    stim[23] = 14'h034c;
    stim[24] = 14'h0b4c;
    stim[25] = 14'h3ed6;
    stim[26] = 14'h28f9;
    stim[27] = 14'h059b;
    stim[28] = 14'h1a55;
    stim[29] = 14'h1b68;
    stim[30] = 14'h3b54;
    stim[31] = 14'h1166;
    stim[32] = 14'h29d0;
    stim[33] = 14'h292b;
    stim[34] = 14'h051e;
    stim[35] = 14'h1899;
    stim[36] = 14'h2044;
    stim[37] = 14'h324b;
    stim[38] = 14'h0884;
    stim[39] = 14'h38f7;
    stim[40] = 14'h312a;
    stim[41] = 14'h3cdf;
    stim[42] = 14'h3cbb;
    stim[43] = 14'h3f1f;
    stim[44] = 14'h1cc3;
    stim[45] = 14'h1668;
    stim[46] = 14'h316b;
    stim[47] = 14'h0c84;
    stim[48] = 14'h18c9;
    stim[49] = 14'h2548;
    stim[50] = 14'h1eba;
    stim[51] = 14'h3e9e;
    stim[52] = 14'h1561;
    stim[53] = 14'h261b;
    stim[54] = 14'h30c5;
    stim[55] = 14'h1092;
    stim[56] = 14'h2dbb;
    stim[57] = 14'h15c4;
    stim[58] = 14'h28de;
    stim[59] = 14'h3028;
    stim[60] = 14'h0a97;
    stim[61] = 14'h0e76;
    stim[62] = 14'h3924;
    stim[63] = 14'h35c6;
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
      expv[0] = 52'h0001780040403;
      expv[1] = 52'h00a3210c39fff;
      expv[2] = 52'h00fffffffffff;
      expv[3] = 52'h00a3210c39fff;
      expv[4] = 52'h0086187e30c3f;
      expv[5] = 52'h0006187e30c3f;
      expv[6] = 52'h00207948c0c92;
      expv[7] = 52'h0001780040403;
      expv[8] = 52'h00bffffffffff;
      expv[9] = 52'h00a3210c39fff;
      expv[10] = 52'h00207948c0c92;
      expv[11] = 52'h003ffffffffff;
      expv[12] = 52'h00fffffffffff;
      expv[13] = 52'h0086187e30c3f;
      expv[14] = 52'h00fffffffffff;
      expv[15] = 52'h00a3c08ffffff;
      expv[16] = 52'h00a3c08ffffff;
      expv[17] = 52'h0006085622308;
      expv[18] = 52'h003ffffffffff;
      expv[19] = 52'h00fffffffffff;
      expv[20] = 52'h00207948c0c92;
      expv[21] = 52'h00207948c0c92;
      expv[22] = 52'h0006085622308;
      expv[23] = 52'h00207948c0c92;
      expv[24] = 52'h0001780040403;
      expv[25] = 52'h00fffffffffff;
      expv[26] = 52'h00a3c08ffffff;
      expv[27] = 52'h00207948c0c92;
      expv[28] = 52'h00a3210c39fff;
      expv[29] = 52'h00a3210c39fff;
      expv[30] = 52'h00fffffffffff;
      expv[31] = 52'h003ffffffffff;
      expv[32] = 52'h00a3c08ffffff;
      expv[33] = 52'h00a3c08ffffff;
      expv[34] = 52'h00207948c0c92;
      expv[35] = 52'h00a3210c39fff;
      expv[36] = 52'h0006187e30c3f;
      expv[37] = 52'h0006085622308;
      expv[38] = 52'h0001780040403;
      expv[39] = 52'h00fffffffffff;
      expv[40] = 52'h0006085622308;
      expv[41] = 52'h00fffffffffff;
      expv[42] = 52'h00fffffffffff;
      expv[43] = 52'h00fffffffffff;
      expv[44] = 52'h00a3210c39fff;
      expv[45] = 52'h003ffffffffff;
      expv[46] = 52'h0006085622308;
      expv[47] = 52'h0001780040403;
      expv[48] = 52'h00a3210c39fff;
      expv[49] = 52'h0006187e30c3f;
      expv[50] = 52'h00a3210c39fff;
      expv[51] = 52'h00fffffffffff;
      expv[52] = 52'h003ffffffffff;
      expv[53] = 52'h0086187e30c3f;
      expv[54] = 52'h0006085622308;
      expv[55] = 52'h00bffffffffff;
      expv[56] = 52'h00a3c08ffffff;
      expv[57] = 52'h003ffffffffff;
      expv[58] = 52'h00a3c08ffffff;
      expv[59] = 52'h0006085622308;
      expv[60] = 52'h0001780040403;
      expv[61] = 52'h0001780040403;
      expv[62] = 52'h00fffffffffff;
      expv[63] = 52'h0006085622308;
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
