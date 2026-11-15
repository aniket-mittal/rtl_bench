// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_141017 dut (
    .clk(clk),
    .reset(in_vec[41:41]),
    .start(in_vec[40:40]),
    .src_addr(in_vec[39:24]),
    .dest_addr(in_vec[23:8]),
    .count(in_vec[7:0]),
    .busy(out_vec[2:2]),
    .done(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3a0440b9141;
    stim[1] = 42'h2393a6a579f;
    stim[2] = 42'h169eb94e3bd;
    stim[3] = 42'h1073256c009;
    stim[4] = 42'h1903c324043;
    stim[5] = 42'h028b050565f;
    stim[6] = 42'h0534a381ae0;
    stim[7] = 42'h010abb08b4d;
    stim[8] = 42'h049de673d9e;
    stim[9] = 42'h0b596045fe3;
    stim[10] = 42'h180862115a3;
    stim[11] = 42'h3923388e16f;
    stim[12] = 42'h1f23b219d54;
    stim[13] = 42'h1ea49494175;
    stim[14] = 42'h15bc5e69e5c;
    stim[15] = 42'h13aafd9a11c;
    stim[16] = 42'h008e5e419e9;
    stim[17] = 42'h0b91a9d6927;
    stim[18] = 42'h1ba725f1fd4;
    stim[19] = 42'h118f0a7a98f;
    stim[20] = 42'h1cb7b803f21;
    stim[21] = 42'h04d87973995;
    stim[22] = 42'h066e63b8bb5;
    stim[23] = 42'h0963f64406d;
    stim[24] = 42'h0de0b4449c9;
    stim[25] = 42'h17fa7c54923;
    stim[26] = 42'h1c30f1895eb;
    stim[27] = 42'h16c3c79854d;
    stim[28] = 42'h1be59c4c0a5;
    stim[29] = 42'h067ebbd9cc6;
    stim[30] = 42'h187a199435a;
    stim[31] = 42'h030d458610a;
    stim[32] = 42'h069f5518f42;
    stim[33] = 42'h0a53d7fd973;
    stim[34] = 42'h042e557a6de;
    stim[35] = 42'h189c17b5323;
    stim[36] = 42'h053a7c6f8f1;
    stim[37] = 42'h1003d1141cb;
    stim[38] = 42'h134ec94664c;
    stim[39] = 42'h14c0d5cc391;
    stim[40] = 42'h1f68be084ce;
    stim[41] = 42'h0062aca3cae;
    stim[42] = 42'h031a6579166;
    stim[43] = 42'h1693a55962a;
    stim[44] = 42'h0c0b4d0426e;
    stim[45] = 42'h119c55e5561;
    stim[46] = 42'h04f521c755d;
    stim[47] = 42'h07e0714413c;
    stim[48] = 42'h12af54ae628;
    stim[49] = 42'h0c4d8ca6b41;
    stim[50] = 42'h1b6bfd5bd97;
    stim[51] = 42'h1fa67226977;
    stim[52] = 42'h07cbc8baf53;
    stim[53] = 42'h1681d5bfad6;
    stim[54] = 42'h0819964b2ca;
    stim[55] = 42'h1bd7fcb6385;
    stim[56] = 42'h0cd551f353d;
    stim[57] = 42'h1b42eeba7a9;
    stim[58] = 42'h0abd18dd8d2;
    stim[59] = 42'h1be253a5dc6;
    stim[60] = 42'h08458fe07e9;
    stim[61] = 42'h1951c7feb08;
    stim[62] = 42'h11106bc8453;
    stim[63] = 42'h01468c1bfc2;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
