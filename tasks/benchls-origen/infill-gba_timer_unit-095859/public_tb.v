// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_095859 dut (
    .clk_16MHz(clk),
    .reset(in_vec[48:48]),
    .TMxCNT_L(in_vec[47:32]),
    .TMxCNT_H(in_vec[31:16]),
    .prev_timer_value(in_vec[15:0]),
    .timer_count(out_vec[16:1]),
    .interrupt_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h16e466c4ec3b5;
    stim[1] = 49'h171fb7eb5315e;
    stim[2] = 49'h0ed9993776f92;
    stim[3] = 49'h080c4ac4a0583;
    stim[4] = 49'h07e9507f0b242;
    stim[5] = 49'h0524fda572799;
    stim[6] = 49'h0f8de17d1de7c;
    stim[7] = 49'h06b725443fa4e;
    stim[8] = 49'h0d6bc6d67c93b;
    stim[9] = 49'h0b6443611b80d;
    stim[10] = 49'h0c838683c64b0;
    stim[11] = 49'h03dc667284d60;
    stim[12] = 49'h07b0496361c34;
    stim[13] = 49'h0c9b5d76c70da;
    stim[14] = 49'h0e23e196de00e;
    stim[15] = 49'h09e7956a7ac69;
    stim[16] = 49'h07822f9c55672;
    stim[17] = 49'h0d47a932fa808;
    stim[18] = 49'h0c83171f3dc8e;
    stim[19] = 49'h0ed2e9339a105;
    stim[20] = 49'h01ee29e43c4c6;
    stim[21] = 49'h02bc471c7480a;
    stim[22] = 49'h065ab3173714d;
    stim[23] = 49'h0f96cb29f716c;
    stim[24] = 49'h0d07aeb74e5da;
    stim[25] = 49'h01a7ddce81311;
    stim[26] = 49'h0fffa55426efc;
    stim[27] = 49'h1a664ec9dd5b4;
    stim[28] = 49'h05da02f211a26;
    stim[29] = 49'h0f31e7c4e4f4b;
    stim[30] = 49'h0773b4fde5be5;
    stim[31] = 49'h015b5a3330cff;
    stim[32] = 49'h0f596e88792c7;
    stim[33] = 49'h08d562807b2c9;
    stim[34] = 49'h08e6bbba2411a;
    stim[35] = 49'h01cb5af564b21;
    stim[36] = 49'h0aae5df60af1b;
    stim[37] = 49'h005287ea399e8;
    stim[38] = 49'h01c1240769911;
    stim[39] = 49'h0dd48d32cb24b;
    stim[40] = 49'h07e08454c5eab;
    stim[41] = 49'h0f5cb38885613;
    stim[42] = 49'h03748a6c39392;
    stim[43] = 49'h06f20c2620492;
    stim[44] = 49'h0a7057018cc2c;
    stim[45] = 49'h05e40dde4a026;
    stim[46] = 49'h10bbcc4053e5e;
    stim[47] = 49'h0d796299d89de;
    stim[48] = 49'h0954f231d199f;
    stim[49] = 49'h0af1aa857e923;
    stim[50] = 49'h0f2fdb59cb9f0;
    stim[51] = 49'h00bfe85b4ca87;
    stim[52] = 49'h04cdc79d91dc4;
    stim[53] = 49'h084a7293ef400;
    stim[54] = 49'h046e995191a21;
    stim[55] = 49'h069934d84e2d3;
    stim[56] = 49'h028d0fcf135a5;
    stim[57] = 49'h0d6d45b807cf5;
    stim[58] = 49'h0d731c6582d2a;
    stim[59] = 49'h06388376c98cc;
    stim[60] = 49'h039d48550989f;
    stim[61] = 49'h0722257fb883f;
    stim[62] = 49'h08c5a99d8b35c;
    stim[63] = 49'h0f4ad189163ff;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h0fd2c;
      expv[6] = 17'h0fd2c;
      expv[7] = 17'h0fd2c;
      expv[8] = 17'h0fd2c;
      expv[9] = 17'h0fd2c;
      expv[10] = 17'h0fd2c;
      expv[11] = 17'h0fd2c;
      expv[12] = 17'h0fd2c;
      expv[13] = 17'h0fd2c;
      expv[14] = 17'h0fd2c;
      expv[15] = 17'h0fd2c;
      expv[16] = 17'h0fd2c;
      expv[17] = 17'h0fd2c;
      expv[18] = 17'h0fd2c;
      expv[19] = 17'h0fd2c;
      expv[20] = 17'h0fd2c;
      expv[21] = 17'h0fd2c;
      expv[22] = 17'h0fd2c;
      expv[23] = 17'h0fd2c;
      expv[24] = 17'h0fd2c;
      expv[25] = 17'h0fd2c;
      expv[26] = 17'h034fc;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00a50;
      expv[38] = 17'h00a50;
      expv[39] = 17'h00a50;
      expv[40] = 17'h00a52;
      expv[41] = 17'h00a52;
      expv[42] = 17'h1eb98;
      expv[43] = 17'h1eb98;
      expv[44] = 17'h1eb98;
      expv[45] = 17'h1eb9a;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h1e5fa;
      expv[52] = 17'h1e5fe;
      expv[53] = 17'h1e5fe;
      expv[54] = 17'h1e5fe;
      expv[55] = 17'h1e5fe;
      expv[56] = 17'h1e602;
      expv[57] = 17'h1e602;
      expv[58] = 17'h1e604;
      expv[59] = 17'h1e606;
      expv[60] = 17'h1e606;
      expv[61] = 17'h0e444;
      expv[62] = 17'h0e444;
      expv[63] = 17'h0e448;
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
