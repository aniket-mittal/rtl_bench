// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  multi_16bit dut (
    .clk(clk),
    .rst_n(in_vec[33:33]),
    .start(in_vec[32:32]),
    .ain(in_vec[31:16]),
    .bin(in_vec[15:0]),
    .yout(out_vec[32:1]),
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
    stim[0] = 34'h1b84e57e3;
    stim[1] = 34'h1ffaca1bc;
    stim[2] = 34'h2745e5551;
    stim[3] = 34'h3e062b2ab;
    stim[4] = 34'h3fdde7958;
    stim[5] = 34'h232856742;
    stim[6] = 34'h2f26a688c;
    stim[7] = 34'h3044769da;
    stim[8] = 34'h3343a593e;
    stim[9] = 34'h2c5d1d276;
    stim[10] = 34'h334b11ab4;
    stim[11] = 34'h3b4ab6ffc;
    stim[12] = 34'h2ef429d3e;
    stim[13] = 34'h36db2d9e3;
    stim[14] = 34'h2d3b9ee94;
    stim[15] = 34'h3eb0d00cb;
    stim[16] = 34'h2072a4004;
    stim[17] = 34'h26274816e;
    stim[18] = 34'h3bab96e02;
    stim[19] = 34'h273e3b6e9;
    stim[20] = 34'h249677cf4;
    stim[21] = 34'h2538af292;
    stim[22] = 34'h3b6d1dc25;
    stim[23] = 34'h3f7a88ba8;
    stim[24] = 34'h2c5314064;
    stim[25] = 34'h3cd8fb87b;
    stim[26] = 34'h267cce2c8;
    stim[27] = 34'h21e7fb9e4;
    stim[28] = 34'h365521238;
    stim[29] = 34'h2ccfdbc74;
    stim[30] = 34'h204259291;
    stim[31] = 34'h39fd39023;
    stim[32] = 34'h385485299;
    stim[33] = 34'h2f707596d;
    stim[34] = 34'h2968a8037;
    stim[35] = 34'h2d1e7ff70;
    stim[36] = 34'h34a03209e;
    stim[37] = 34'h37bb408b4;
    stim[38] = 34'h2be65e776;
    stim[39] = 34'h2e5b847c8;
    stim[40] = 34'h30aa679c6;
    stim[41] = 34'h3fb37cf70;
    stim[42] = 34'h306a6512b;
    stim[43] = 34'h345eca39f;
    stim[44] = 34'h235243e79;
    stim[45] = 34'h31c6d3184;
    stim[46] = 34'h288abd432;
    stim[47] = 34'h34e88c34c;
    stim[48] = 34'h219cf0ff2;
    stim[49] = 34'h268ae1107;
    stim[50] = 34'h37d029ad8;
    stim[51] = 34'h3563ad1c9;
    stim[52] = 34'h3fc12db26;
    stim[53] = 34'h245ce02d2;
    stim[54] = 34'h28720600e;
    stim[55] = 34'h390da6dc3;
    stim[56] = 34'h26915b7a1;
    stim[57] = 34'h2a9102b73;
    stim[58] = 34'h2c0fae62a;
    stim[59] = 34'h22b09422a;
    stim[60] = 34'h30222b4c4;
    stim[61] = 34'h33b55bedb;
    stim[62] = 34'h21958c255;
    stim[63] = 34'h222d57391;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h00000d3b4;
      expv[10] = 33'h00000d3b4;
      expv[11] = 33'h00000d3b4;
      expv[12] = 33'h00001091c;
      expv[13] = 33'h00001091c;
      expv[14] = 33'h00001091c;
      expv[15] = 33'h00001091c;
      expv[16] = 33'h00001091c;
      expv[17] = 33'h00001091c;
      expv[18] = 33'h00001091c;
      expv[19] = 33'h00001091c;
      expv[20] = 33'h00001091c;
      expv[21] = 33'h00001091c;
      expv[22] = 33'h00001091c;
      expv[23] = 33'h00001091c;
      expv[24] = 33'h00002c166;
      expv[25] = 33'h00002c166;
      expv[26] = 33'h00002c166;
      expv[27] = 33'h00002c166;
      expv[28] = 33'h00002c166;
      expv[29] = 33'h00002c166;
      expv[30] = 33'h00002c166;
      expv[31] = 33'h00002c166;
      expv[32] = 33'h00002c166;
      expv[33] = 33'h00003e1ac;
      expv[34] = 33'h00003e1ac;
      expv[35] = 33'h00003e1ac;
      expv[36] = 33'h00003e1ac;
      expv[37] = 33'h00003e1ac;
      expv[38] = 33'h0000422e8;
      expv[39] = 33'h0000422e8;
      expv[40] = 33'h0000422e8;
      expv[41] = 33'h0000422e8;
      expv[42] = 33'h0000422e8;
      expv[43] = 33'h000060a00;
      expv[44] = 33'h00009d830;
      expv[45] = 33'h00009d830;
      expv[46] = 33'h00009d830;
      expv[47] = 33'h00009d830;
      expv[48] = 33'h00009d830;
      expv[49] = 33'h00009d830;
      expv[50] = 33'h00009d830;
      expv[51] = 33'h00009d830;
      expv[52] = 33'h00009d830;
      expv[53] = 33'h0000c4390;
      expv[54] = 33'h0000c4390;
      expv[55] = 33'h0000c4390;
      expv[56] = 33'h0000c4390;
      expv[57] = 33'h0000c4390;
      expv[58] = 33'h0000c4390;
      expv[59] = 33'h0000c4390;
      expv[60] = 33'h0000c4390;
      expv[61] = 33'h0000c4390;
      expv[62] = 33'h0000c4390;
      expv[63] = 33'h0000c4390;
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
