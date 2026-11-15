// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05728 dut (
    .Aval(in_vec[18:11]),
    .Bval(in_vec[10:3]),
    .cin(in_vec[2:2]),
    .op(in_vec[1:0]),
    .ALUout(out_vec[8:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h0ac19;
    stim[1] = 19'h4a439;
    stim[2] = 19'h156fb;
    stim[3] = 19'h08b45;
    stim[4] = 19'h1bf34;
    stim[5] = 19'h37b17;
    stim[6] = 19'h5b064;
    stim[7] = 19'h6c7cc;
    stim[8] = 19'h5deb2;
    stim[9] = 19'h0e3b7;
    stim[10] = 19'h2a2dd;
    stim[11] = 19'h06a32;
    stim[12] = 19'h76556;
    stim[13] = 19'h54bea;
    stim[14] = 19'h239e8;
    stim[15] = 19'h6e913;
    stim[16] = 19'h07b78;
    stim[17] = 19'h1a45c;
    stim[18] = 19'h0f51d;
    stim[19] = 19'h46986;
    stim[20] = 19'h40128;
    stim[21] = 19'h1be7b;
    stim[22] = 19'h21913;
    stim[23] = 19'h1676e;
    stim[24] = 19'h4f2db;
    stim[25] = 19'h5e6e0;
    stim[26] = 19'h5d03e;
    stim[27] = 19'h0a359;
    stim[28] = 19'h001e7;
    stim[29] = 19'h46018;
    stim[30] = 19'h3fc15;
    stim[31] = 19'h7f75e;
    stim[32] = 19'h6cdc5;
    stim[33] = 19'h17fb9;
    stim[34] = 19'h3ffb3;
    stim[35] = 19'h30386;
    stim[36] = 19'h3433e;
    stim[37] = 19'h77e5c;
    stim[38] = 19'h5eac0;
    stim[39] = 19'h475e5;
    stim[40] = 19'h5d237;
    stim[41] = 19'h10b12;
    stim[42] = 19'h6a716;
    stim[43] = 19'h211cd;
    stim[44] = 19'h2837c;
    stim[45] = 19'h114f1;
    stim[46] = 19'h6dd66;
    stim[47] = 19'h37367;
    stim[48] = 19'h2d6c4;
    stim[49] = 19'h5ec11;
    stim[50] = 19'h22056;
    stim[51] = 19'h0b142;
    stim[52] = 19'h51f9d;
    stim[53] = 19'h67307;
    stim[54] = 19'h1084c;
    stim[55] = 19'h7ee4b;
    stim[56] = 19'h62c10;
    stim[57] = 19'h116ea;
    stim[58] = 19'h38e64;
    stim[59] = 19'h0ddcd;
    stim[60] = 19'h08fca;
    stim[61] = 19'h20b90;
    stim[62] = 19'h7c2e5;
    stim[63] = 19'h5ef49;
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
      expv[0] = 9'h133;
      expv[1] = 9'h038;
      expv[2] = 9'h000;
      expv[3] = 9'h0f5;
      expv[4] = 9'h03b;
      expv[5] = 9'h000;
      expv[6] = 9'h184;
      expv[7] = 9'h1a3;
      expv[8] = 9'h124;
      expv[9] = 9'h000;
      expv[10] = 9'h161;
      expv[11] = 9'h008;
      expv[12] = 9'h150;
      expv[13] = 9'h052;
      expv[14] = 9'h108;
      expv[15] = 9'h000;
      expv[16] = 9'h0fc;
      expv[17] = 9'h17e;
      expv[18] = 9'h185;
      expv[19] = 9'h000;
      expv[20] = 9'h14a;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h058;
      expv[24] = 9'h000;
      expv[25] = 9'h131;
      expv[26] = 9'h004;
      expv[27] = 9'h101;
      expv[28] = 9'h000;
      expv[29] = 9'h11e;
      expv[30] = 9'h004;
      expv[31] = 9'h1d4;
      expv[32] = 9'h124;
      expv[33] = 9'h04e;
      expv[34] = 9'h000;
      expv[35] = 9'h0c0;
      expv[36] = 9'h0c0;
      expv[37] = 9'h175;
      expv[38] = 9'h02b;
      expv[39] = 9'h096;
      expv[40] = 9'h000;
      expv[41] = 9'h040;
      expv[42] = 9'h180;
      expv[43] = 9'h0f9;
      expv[44] = 9'h17e;
      expv[45] = 9'h183;
      expv[46] = 9'h110;
      expv[47] = 9'h000;
      expv[48] = 9'h065;
      expv[49] = 9'h080;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h12e;
      expv[53] = 9'h000;
      expv[54] = 9'h054;
      expv[55] = 9'h000;
      expv[56] = 9'h08f;
      expv[57] = 9'h000;
      expv[58] = 9'h07b;
      expv[59] = 9'h1ab;
      expv[60] = 9'h022;
      expv[61] = 9'h166;
      expv[62] = 9'h0aa;
      expv[63] = 9'h14e;
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
