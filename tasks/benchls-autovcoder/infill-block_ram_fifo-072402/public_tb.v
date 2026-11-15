// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072402 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3fc3cfa592;
    stim[1] = 38'h2165f5b599;
    stim[2] = 38'h0876afb626;
    stim[3] = 38'h0011983a41;
    stim[4] = 38'h046df86ccb;
    stim[5] = 38'h0d0f3637bb;
    stim[6] = 38'h1a1472edf2;
    stim[7] = 38'h1a86f80243;
    stim[8] = 38'h01e845053b;
    stim[9] = 38'h12fe29e61d;
    stim[10] = 38'h1e780e5f17;
    stim[11] = 38'h103e3148bb;
    stim[12] = 38'h1e383acb8d;
    stim[13] = 38'h12dafdfb0b;
    stim[14] = 38'h0018796c31;
    stim[15] = 38'h081e8c94bf;
    stim[16] = 38'h0a679f9112;
    stim[17] = 38'h1fa2e7b8bd;
    stim[18] = 38'h060b7a28d6;
    stim[19] = 38'h083f7738c2;
    stim[20] = 38'h1bb7673c58;
    stim[21] = 38'h0c904457bd;
    stim[22] = 38'h1ac88511b3;
    stim[23] = 38'h15c9eac58a;
    stim[24] = 38'h0131dfa60b;
    stim[25] = 38'h0d595325ee;
    stim[26] = 38'h1a6044f503;
    stim[27] = 38'h0a92a6485a;
    stim[28] = 38'h014b4ecf19;
    stim[29] = 38'h08a5cc8840;
    stim[30] = 38'h06378a60ba;
    stim[31] = 38'h106154bc8d;
    stim[32] = 38'h1cda981a2e;
    stim[33] = 38'h1420e6bde9;
    stim[34] = 38'h00c4a6bfbc;
    stim[35] = 38'h197b73b846;
    stim[36] = 38'h01721bfc1b;
    stim[37] = 38'h1cf0842813;
    stim[38] = 38'h0716057b8c;
    stim[39] = 38'h01a7941550;
    stim[40] = 38'h0fe5286664;
    stim[41] = 38'h161098bf0f;
    stim[42] = 38'h04ad7ce69e;
    stim[43] = 38'h143bc8fe9c;
    stim[44] = 38'h1bb4137402;
    stim[45] = 38'h06f67145c6;
    stim[46] = 38'h07eacd1f07;
    stim[47] = 38'h056a99335a;
    stim[48] = 38'h19f4e5aa1a;
    stim[49] = 38'h19f267f996;
    stim[50] = 38'h0fa3d09640;
    stim[51] = 38'h103503cbb6;
    stim[52] = 38'h0716686d06;
    stim[53] = 38'h08f5a38ef8;
    stim[54] = 38'h0464b50cae;
    stim[55] = 38'h0aed75e76c;
    stim[56] = 38'h07ffad93a5;
    stim[57] = 38'h140079605f;
    stim[58] = 38'h1350105cab;
    stim[59] = 38'h1cdc1d1f36;
    stim[60] = 38'h187b80b6e9;
    stim[61] = 38'h198cc89e88;
    stim[62] = 38'h0e8ea1c739;
    stim[63] = 38'h0033b129a6;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h39e0397c5;
      expv[13] = 34'h39e0397c5;
      expv[14] = 34'h38e0eb2e3;
      expv[15] = 34'h38e0eb2e3;
      expv[16] = 34'h38e0eb2e3;
      expv[17] = 34'h38e0eb2e3;
      expv[18] = 34'h38e0eb2e3;
      expv[19] = 34'h38e0eb2e3;
      expv[20] = 34'h38e0eb2e3;
      expv[21] = 34'h38e0eb2e3;
      expv[22] = 34'h38e0eb2e3;
      expv[23] = 34'h3e8b9ee2f;
      expv[24] = 34'h3e8b9ee2f;
      expv[25] = 34'h3e8b9ee2f;
      expv[26] = 34'h3e8b9ee2f;
      expv[27] = 34'h2e8b9ee2f;
      expv[28] = 34'h2e8b9ee2f;
      expv[29] = 34'h2e8b9ee2f;
      expv[30] = 34'h2e8b9ee2f;
      expv[31] = 34'h2e8b9ee2f;
      expv[32] = 34'h2e8b9ee2f;
      expv[33] = 34'h2e8b9ee2f;
      expv[34] = 34'h2e8b9ee2f;
      expv[35] = 34'h2e8b9ee2f;
      expv[36] = 34'h336a6068b;
      expv[37] = 34'h336a6068b;
      expv[38] = 34'h236a6068b;
      expv[39] = 34'h236a6068b;
      expv[40] = 34'h236a6068b;
      expv[41] = 34'h236a6068b;
      expv[42] = 34'h33c210a04;
      expv[43] = 34'h33c210a04;
      expv[44] = 34'h33c210a04;
      expv[45] = 34'h33c210a04;
      expv[46] = 34'h33c210a04;
      expv[47] = 34'h33c210a04;
      expv[48] = 34'h33c210a04;
      expv[49] = 34'h33c210a04;
      expv[50] = 34'h33c210a04;
      expv[51] = 34'h33c210a04;
      expv[52] = 34'h33c210a04;
      expv[53] = 34'h33c210a04;
      expv[54] = 34'h33c210a04;
      expv[55] = 34'h33c210a04;
      expv[56] = 34'h33c210a04;
      expv[57] = 34'h33c210a04;
      expv[58] = 34'h23c210a04;
      expv[59] = 34'h23c210a04;
      expv[60] = 34'h23c210a04;
      expv[61] = 34'h23c210a04;
      expv[62] = 34'h23c210a04;
      expv[63] = 34'h23c210a04;
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
