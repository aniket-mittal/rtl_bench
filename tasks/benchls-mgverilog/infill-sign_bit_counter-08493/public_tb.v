// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08493 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .data_in(in_vec[8:2]),
    .data_in_sign(in_vec[1:1]),
    .data_valid(in_vec[0:0]),
    .data_out(out_vec[8:2]),
    .data_out_sign(out_vec[1:1]),
    .data_ok(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0bc;
    stim[1] = 10'h1bf;
    stim[2] = 10'h3ea;
    stim[3] = 10'h3b0;
    stim[4] = 10'h2b9;
    stim[5] = 10'h21e;
    stim[6] = 10'h353;
    stim[7] = 10'h3db;
    stim[8] = 10'h3bf;
    stim[9] = 10'h2ce;
    stim[10] = 10'h315;
    stim[11] = 10'h30b;
    stim[12] = 10'h3ca;
    stim[13] = 10'h2d5;
    stim[14] = 10'h28f;
    stim[15] = 10'h2e0;
    stim[16] = 10'h3d6;
    stim[17] = 10'h2ec;
    stim[18] = 10'h221;
    stim[19] = 10'h211;
    stim[20] = 10'h33d;
    stim[21] = 10'h371;
    stim[22] = 10'h383;
    stim[23] = 10'h229;
    stim[24] = 10'h2c1;
    stim[25] = 10'h389;
    stim[26] = 10'h253;
    stim[27] = 10'h278;
    stim[28] = 10'h203;
    stim[29] = 10'h28d;
    stim[30] = 10'h23c;
    stim[31] = 10'h25b;
    stim[32] = 10'h39f;
    stim[33] = 10'h28b;
    stim[34] = 10'h3b1;
    stim[35] = 10'h32d;
    stim[36] = 10'h26c;
    stim[37] = 10'h240;
    stim[38] = 10'h3dd;
    stim[39] = 10'h29c;
    stim[40] = 10'h38f;
    stim[41] = 10'h24b;
    stim[42] = 10'h2c8;
    stim[43] = 10'h339;
    stim[44] = 10'h22b;
    stim[45] = 10'h31d;
    stim[46] = 10'h3c1;
    stim[47] = 10'h31d;
    stim[48] = 10'h2cb;
    stim[49] = 10'h372;
    stim[50] = 10'h2dd;
    stim[51] = 10'h3cc;
    stim[52] = 10'h286;
    stim[53] = 10'h399;
    stim[54] = 10'h3a6;
    stim[55] = 10'h280;
    stim[56] = 10'h159;
    stim[57] = 10'h3c6;
    stim[58] = 10'h2e3;
    stim[59] = 10'h2b4;
    stim[60] = 10'h3cb;
    stim[61] = 10'h29b;
    stim[62] = 10'h384;
    stim[63] = 10'h27d;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h006;
      expv[6] = 9'h004;
      expv[7] = 9'h00a;
      expv[8] = 9'h008;
      expv[9] = 9'h00e;
      expv[10] = 9'h00c;
      expv[11] = 9'h012;
      expv[12] = 9'h010;
      expv[13] = 9'h010;
      expv[14] = 9'h016;
      expv[15] = 9'h014;
      expv[16] = 9'h014;
      expv[17] = 9'h014;
      expv[18] = 9'h014;
      expv[19] = 9'h01a;
      expv[20] = 9'h018;
      expv[21] = 9'h01e;
      expv[22] = 9'h01c;
      expv[23] = 9'h022;
      expv[24] = 9'h020;
      expv[25] = 9'h026;
      expv[26] = 9'h024;
      expv[27] = 9'h02a;
      expv[28] = 9'h028;
      expv[29] = 9'h02e;
      expv[30] = 9'h02c;
      expv[31] = 9'h02c;
      expv[32] = 9'h032;
      expv[33] = 9'h030;
      expv[34] = 9'h036;
      expv[35] = 9'h034;
      expv[36] = 9'h03a;
      expv[37] = 9'h038;
      expv[38] = 9'h038;
      expv[39] = 9'h03e;
      expv[40] = 9'h03c;
      expv[41] = 9'h042;
      expv[42] = 9'h040;
      expv[43] = 9'h040;
      expv[44] = 9'h046;
      expv[45] = 9'h044;
      expv[46] = 9'h04a;
      expv[47] = 9'h048;
      expv[48] = 9'h04e;
      expv[49] = 9'h04c;
      expv[50] = 9'h04c;
      expv[51] = 9'h052;
      expv[52] = 9'h050;
      expv[53] = 9'h050;
      expv[54] = 9'h056;
      expv[55] = 9'h054;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h006;
      expv[60] = 9'h004;
      expv[61] = 9'h00a;
      expv[62] = 9'h008;
      expv[63] = 9'h008;
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
