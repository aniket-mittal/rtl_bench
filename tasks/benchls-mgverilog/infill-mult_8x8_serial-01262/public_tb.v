// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01262 dut (
    .clk(clk),
    .A(in_vec[16:9]),
    .B(in_vec[8:1]),
    .start(in_vec[0:0]),
    .product(out_vec[8:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h066f5;
    stim[1] = 17'h1dee4;
    stim[2] = 17'h141b5;
    stim[3] = 17'h0f09f;
    stim[4] = 17'h079f6;
    stim[5] = 17'h0b8ea;
    stim[6] = 17'h01b07;
    stim[7] = 17'h10982;
    stim[8] = 17'h172c0;
    stim[9] = 17'h1c367;
    stim[10] = 17'h0b6e9;
    stim[11] = 17'h03b74;
    stim[12] = 17'h01d7f;
    stim[13] = 17'h15287;
    stim[14] = 17'h0ea65;
    stim[15] = 17'h03e6f;
    stim[16] = 17'h13f29;
    stim[17] = 17'h1ff9b;
    stim[18] = 17'h0f553;
    stim[19] = 17'h1f033;
    stim[20] = 17'h0df53;
    stim[21] = 17'h1fa22;
    stim[22] = 17'h07ba2;
    stim[23] = 17'h0fd63;
    stim[24] = 17'h0aeee;
    stim[25] = 17'h1ccda;
    stim[26] = 17'h16745;
    stim[27] = 17'h14482;
    stim[28] = 17'h085a0;
    stim[29] = 17'h119f0;
    stim[30] = 17'h0d4b1;
    stim[31] = 17'h18b0c;
    stim[32] = 17'h09e4c;
    stim[33] = 17'h04c1d;
    stim[34] = 17'h03495;
    stim[35] = 17'h15be9;
    stim[36] = 17'h116f3;
    stim[37] = 17'h0fa42;
    stim[38] = 17'h079b1;
    stim[39] = 17'h0b5ce;
    stim[40] = 17'h1d015;
    stim[41] = 17'h15a5f;
    stim[42] = 17'h10953;
    stim[43] = 17'h04a79;
    stim[44] = 17'h044d2;
    stim[45] = 17'h11efd;
    stim[46] = 17'h10051;
    stim[47] = 17'h09062;
    stim[48] = 17'h168c1;
    stim[49] = 17'h16330;
    stim[50] = 17'h155da;
    stim[51] = 17'h0fd94;
    stim[52] = 17'h1c18e;
    stim[53] = 17'h1186a;
    stim[54] = 17'h09835;
    stim[55] = 17'h1ff46;
    stim[56] = 17'h0293c;
    stim[57] = 17'h16018;
    stim[58] = 17'h15ecb;
    stim[59] = 17'h08516;
    stim[60] = 17'h10037;
    stim[61] = 17'h1e0d9;
    stim[62] = 17'h1749d;
    stim[63] = 17'h0b73e;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h078;
      expv[7] = 9'h000;
      expv[8] = 9'h01a;
      expv[9] = 9'h01a;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h0de;
      expv[23] = 9'h0de;
      expv[24] = 9'h000;
      expv[25] = 9'h0fc;
      expv[26] = 9'h0fc;
      expv[27] = 9'h000;
      expv[28] = 9'h166;
      expv[29] = 9'h166;
      expv[30] = 9'h13e;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h06a;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h078;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h1b4;
      expv[52] = 9'h18e;
      expv[53] = 9'h18e;
      expv[54] = 9'h18e;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
