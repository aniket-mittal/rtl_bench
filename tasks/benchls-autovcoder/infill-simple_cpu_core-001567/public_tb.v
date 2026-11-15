// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_001567 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1b6884caa;
    stim[1] = 33'h129965dd8;
    stim[2] = 33'h0cfa3e056;
    stim[3] = 33'h0f290e99a;
    stim[4] = 33'h0bb216a33;
    stim[5] = 33'h0d95f141c;
    stim[6] = 33'h0479ebfb3;
    stim[7] = 33'h02e041cae;
    stim[8] = 33'h000a0bdb7;
    stim[9] = 33'h06abd2a7d;
    stim[10] = 33'h06ef43c74;
    stim[11] = 33'h00794470d;
    stim[12] = 33'h049fa6b96;
    stim[13] = 33'h1f0c9a92c;
    stim[14] = 33'h1e18a601e;
    stim[15] = 33'h0a933495b;
    stim[16] = 33'h0afbaa6b4;
    stim[17] = 33'h0e5fa05c7;
    stim[18] = 33'h042e64f5a;
    stim[19] = 33'h02e5ad3f1;
    stim[20] = 33'h05a697ebd;
    stim[21] = 33'h0939a8553;
    stim[22] = 33'h00414f27d;
    stim[23] = 33'h18c15e199;
    stim[24] = 33'h0dd3febe4;
    stim[25] = 33'h013504034;
    stim[26] = 33'h0319a3ef0;
    stim[27] = 33'h0f167f6ea;
    stim[28] = 33'h0ba11dddc;
    stim[29] = 33'h0d6985cef;
    stim[30] = 33'h09317c51d;
    stim[31] = 33'h07ccd403f;
    stim[32] = 33'h0fd372993;
    stim[33] = 33'h0d3b7da60;
    stim[34] = 33'h0d4b65f7e;
    stim[35] = 33'h0d5ea77bb;
    stim[36] = 33'h0f5e6dbba;
    stim[37] = 33'h022643c7d;
    stim[38] = 33'h00c871dfd;
    stim[39] = 33'h00119aceb;
    stim[40] = 33'h19d17a379;
    stim[41] = 33'h0ad65893a;
    stim[42] = 33'h0a679ea9e;
    stim[43] = 33'h056b9332f;
    stim[44] = 33'h05c272c37;
    stim[45] = 33'h02e644bf1;
    stim[46] = 33'h0e8bf1123;
    stim[47] = 33'h0806674e4;
    stim[48] = 33'h03d686d68;
    stim[49] = 33'h021349f06;
    stim[50] = 33'h0b5f34a6c;
    stim[51] = 33'h08394a0c4;
    stim[52] = 33'h012faff29;
    stim[53] = 33'h00bdf2acd;
    stim[54] = 33'h0f5fb4b67;
    stim[55] = 33'h06e02197a;
    stim[56] = 33'h0d96ec552;
    stim[57] = 33'h01877b658;
    stim[58] = 33'h0f36093c9;
    stim[59] = 33'h06bc9aa72;
    stim[60] = 33'h06a4ad1ef;
    stim[61] = 33'h057a495d8;
    stim[62] = 33'h065293dd9;
    stim[63] = 33'h0ff600052;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxd8;
      expv[3] = 74'h00000000xxxxxxxxx56;
      expv[4] = 74'h00000000xxxxxxxxx56;
      expv[5] = 74'h0000000000000000056;
      expv[6] = 74'h0000000000000000056;
      expv[7] = 74'h0000000040000000156;
      expv[8] = 74'h00000000000000000ae;
      expv[9] = 74'h00000000000000000ae;
      expv[10] = 74'h00000000000000000ae;
      expv[11] = 74'h00000000000000000ae;
      expv[12] = 74'h00000000800000001ae;
      expv[13] = 74'h0000000000000000096;
      expv[14] = 74'h0000000000000000196;
      expv[15] = 74'h000000000000000011e;
      expv[16] = 74'h000000000000000005b;
      expv[17] = 74'h000000000000000005b;
      expv[18] = 74'h000000000000000005b;
      expv[19] = 74'h000000000000000005b;
      expv[20] = 74'h000000004000000015b;
      expv[21] = 74'h00000000000000000bd;
      expv[22] = 74'h00000000000000000bd;
      expv[23] = 74'h00000000000000000bd;
      expv[24] = 74'h00000000000000001bd;
      expv[25] = 74'h00000000000000000e4;
      expv[26] = 74'h00000000000000000e4;
      expv[27] = 74'h00000000000000000e4;
      expv[28] = 74'h00000000000000000e4;
      expv[29] = 74'h00000000400000001e4;
      expv[30] = 74'h00000000000000000ef;
      expv[31] = 74'h00000000000000000ef;
      expv[32] = 74'h00000000000000000ef;
      expv[33] = 74'h00000000000000000ef;
      expv[34] = 74'h00000000800000001ef;
      expv[35] = 74'h000000000000000007e;
      expv[36] = 74'h000000000000000007e;
      expv[37] = 74'h000000000000000007e;
      expv[38] = 74'h000000000000000007e;
      expv[39] = 74'h00000000c000000017e;
      expv[40] = 74'h00000000000000000eb;
      expv[41] = 74'h00000000000000001eb;
      expv[42] = 74'h000000000000000003a;
      expv[43] = 74'h000000000000000003a;
      expv[44] = 74'h000000000000000003a;
      expv[45] = 74'h000000000000000003a;
      expv[46] = 74'h000000004000000013a;
      expv[47] = 74'h0000000000000000023;
      expv[48] = 74'h0000000000000000023;
      expv[49] = 74'h0000000000000000023;
      expv[50] = 74'h0000000000000000023;
      expv[51] = 74'h0000000080000000123;
      expv[52] = 74'h00000000000000000c4;
      expv[53] = 74'h00000000000000000c4;
      expv[54] = 74'h00000000000000000c4;
      expv[55] = 74'h00000000000000000c4;
      expv[56] = 74'h00000000c00000001c4;
      expv[57] = 74'h0000000000000000052;
      expv[58] = 74'h0000000000000000052;
      expv[59] = 74'h0000000000000000052;
      expv[60] = 74'h0000000000000000052;
      expv[61] = 74'h0000000100000000152;
      expv[62] = 74'h00000000000000000d8;
      expv[63] = 74'h00000000000000000d8;
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
