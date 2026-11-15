// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 79;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_155687 dut (
    .clk(clk),
    .initiate(in_vec[64:64]),
    .multiplicand(in_vec[63:32]),
    .multiplier(in_vec[31:0]),
    .done(out_vec[78:78]),
    .count_add(out_vec[77:71]),
    .count_sub(out_vec[70:64]),
    .prod(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h17ff647156fe66316;
    stim[1] = 65'h1f851fbc4af769730;
    stim[2] = 65'h1f8057c27c8943da6;
    stim[3] = 65'h133bd8302205ddc13;
    stim[4] = 65'h148f5e5619d8ba5de;
    stim[5] = 65'h057cc3438210effa4;
    stim[6] = 65'h15b556f38355b2091;
    stim[7] = 65'h1e292606cef49305f;
    stim[8] = 65'h13896c73abbf04205;
    stim[9] = 65'h157041b1efc540e95;
    stim[10] = 65'h1a0c93b00486e4848;
    stim[11] = 65'h14606e9ad5c4a19fb;
    stim[12] = 65'h1759cc1f4d5d2eefb;
    stim[13] = 65'h0345d4a10d4cd90b8;
    stim[14] = 65'h18d7aede07b734866;
    stim[15] = 65'h17b612b2565197beb;
    stim[16] = 65'h0179a03a66f37f12b;
    stim[17] = 65'h1c3d86aba781285f3;
    stim[18] = 65'h10129df7a8b77566c;
    stim[19] = 65'h0d19ec6db0502ba1b;
    stim[20] = 65'h040bfa6387ba7aa95;
    stim[21] = 65'h1cd18f49cda44ae4e;
    stim[22] = 65'h0a798c42005335693;
    stim[23] = 65'h0962cf62d65043d52;
    stim[24] = 65'h089812dbaf7ac51cc;
    stim[25] = 65'h04fbdef831a407887;
    stim[26] = 65'h1ae6d6a1b44480827;
    stim[27] = 65'h155cd6af9e952b7d9;
    stim[28] = 65'h146307be0e68b4766;
    stim[29] = 65'h051c079c79f67a9a6;
    stim[30] = 65'h09769894979287c4d;
    stim[31] = 65'h0b5d60faecb6ac37e;
    stim[32] = 65'h03f086501112bcb19;
    stim[33] = 65'h1307f1530b5b5dc54;
    stim[34] = 65'h1f39cb33607ec1196;
    stim[35] = 65'h0940b75621efdb658;
    stim[36] = 65'h1bf116a3e7c123542;
    stim[37] = 65'h13788be013de8602f;
    stim[38] = 65'h1a7358179b1a01421;
    stim[39] = 65'h0e37d80621b3b0bc4;
    stim[40] = 65'h075fc64f95b33b095;
    stim[41] = 65'h1c315097383dc1146;
    stim[42] = 65'h0317fe01c2d591e0a;
    stim[43] = 65'h15f24ab371877c2cf;
    stim[44] = 65'h1eb78258f89116094;
    stim[45] = 65'h1c1f0680db41b892b;
    stim[46] = 65'h02943f092535011c7;
    stim[47] = 65'h00ce4d5bad08afa41;
    stim[48] = 65'h1d98b8e32f73164dd;
    stim[49] = 65'h130ef6995f5744069;
    stim[50] = 65'h01118ef34e6057a72;
    stim[51] = 65'h01c19e4f2d8cecac8;
    stim[52] = 65'h00dd5308ff844c2b5;
    stim[53] = 65'h1b2847e828c281eb5;
    stim[54] = 65'h078392e11142f23ae;
    stim[55] = 65'h19a9e9c5c0d3db54a;
    stim[56] = 65'h0f0163d7c155bf1af;
    stim[57] = 65'h13aa0222bee6c9856;
    stim[58] = 65'h0696a16d1eee85d49;
    stim[59] = 65'h159c3febbdde5a183;
    stim[60] = 65'h07ad97eedf75e85df;
    stim[61] = 65'h052e1a8ad51c26de3;
    stim[62] = 65'h1f215ab5674103f48;
    stim[63] = 65'h132319700bdfb34d1;
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
      expv[0] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 79'h00000000000000000000;
      expv[2] = 79'h00000000000000000000;
      expv[3] = 79'h00000000000000000000;
      expv[4] = 79'h00000000000000000000;
      expv[5] = 79'h00000000000000000000;
      expv[6] = 79'h00000000000000000000;
      expv[7] = 79'h00000000000000000000;
      expv[8] = 79'h00000000000000000000;
      expv[9] = 79'h00000000000000000000;
      expv[10] = 79'h00000000000000000000;
      expv[11] = 79'h00000000000000000000;
      expv[12] = 79'h00000000000000000000;
      expv[13] = 79'h00000000000000000000;
      expv[14] = 79'h0001ffffffff8a633e0c;
      expv[15] = 79'h00000000000000000000;
      expv[16] = 79'h00000000000000000000;
      expv[17] = 79'h0001ffffffff849ed4db;
      expv[18] = 79'h00000000000000000000;
      expv[19] = 79'h00000000000000000000;
      expv[20] = 79'h00000000000000000000;
      expv[21] = 79'h00000000000000000000;
      expv[22] = 79'h00000000000000000000;
      expv[23] = 79'h00000000000000000000;
      expv[24] = 79'h00000000000000000000;
      expv[25] = 79'h00000000000000000000;
      expv[26] = 79'h00000000000000000000;
      expv[27] = 79'h00000000000000000000;
      expv[28] = 79'h00000000000000000000;
      expv[29] = 79'h00000000000000000000;
      expv[30] = 79'h00000000000000000000;
      expv[31] = 79'h00000000000000000000;
      expv[32] = 79'h00000000000000000000;
      expv[33] = 79'h00000000000000000000;
      expv[34] = 79'h00000000000000000000;
      expv[35] = 79'h00000000000000000000;
      expv[36] = 79'h00000000000000000000;
      expv[37] = 79'h00000000000000000000;
      expv[38] = 79'h00000000000000000000;
      expv[39] = 79'h00000000000000000000;
      expv[40] = 79'h0001ffffffff58ca7e87;
      expv[41] = 79'h0081ffffffffa7358179;
      expv[42] = 79'h00000000000000000000;
      expv[43] = 79'h00000000000000000000;
      expv[44] = 79'h00000000000000000000;
      expv[45] = 79'h00000000000000000000;
      expv[46] = 79'h00000000000000000000;
      expv[47] = 79'h0001ffffffff3e0f97f3;
      expv[48] = 79'h0081ffffffffc1f0680d;
      expv[49] = 79'h00000000000000000000;
      expv[50] = 79'h00000000000000000000;
      expv[51] = 79'h0001ffffffffcf10966b;
      expv[52] = 79'h00810000000030ef6995;
      expv[53] = 79'h00810000000030ef6995;
      expv[54] = 79'h00000000000000000000;
      expv[55] = 79'h0001ffffffff4d7b817e;
      expv[56] = 79'h00000000000000000000;
      expv[57] = 79'h00000000000000000000;
      expv[58] = 79'h00000000000000000000;
      expv[59] = 79'h00000000000000000000;
      expv[60] = 79'h00000000000000000000;
      expv[61] = 79'h0001ffffffffa63c0145;
      expv[62] = 79'h00810000000059c3febb;
      expv[63] = 79'h00000000000000000000;
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
