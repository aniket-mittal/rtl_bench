// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134398 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1e69ba9ab8807b4af;
    stim[1] = 65'h105c6896848e67c13;
    stim[2] = 65'h0c6cfc442e7d3881f;
    stim[3] = 65'h04f73c3d821b5646e;
    stim[4] = 65'h1de094e35bbbe6a21;
    stim[5] = 65'h03058c5c2d005093a;
    stim[6] = 65'h0412caba5fb883840;
    stim[7] = 65'h0c1e24d52f9f5f401;
    stim[8] = 65'h02884f1f9e30cb969;
    stim[9] = 65'h1f393099bd7e03eb9;
    stim[10] = 65'h0870149f31f076755;
    stim[11] = 65'h0d4bd0edf9d4e80f7;
    stim[12] = 65'h02cc5e5c7e14d3044;
    stim[13] = 65'h0f2e5d4b460209218;
    stim[14] = 65'h0f66f681a4ee86c8b;
    stim[15] = 65'h052153a2dd6244f73;
    stim[16] = 65'h05972e15faa7cdced;
    stim[17] = 65'h0661d436ec1ee5b64;
    stim[18] = 65'h001c683a3f61754d0;
    stim[19] = 65'h01a4e803641d0faca;
    stim[20] = 65'h011ae160bcee30171;
    stim[21] = 65'h0d3ca9b775df3c84d;
    stim[22] = 65'h032339690f43b5358;
    stim[23] = 65'h05b1c235fa28dd371;
    stim[24] = 65'h085f46335e8c46f25;
    stim[25] = 65'h03569774313480ae9;
    stim[26] = 65'h05f0846527e27816f;
    stim[27] = 65'h03606cc7f2706c4ba;
    stim[28] = 65'h0e6ccbbb7c0990134;
    stim[29] = 65'h02409cef0e3762554;
    stim[30] = 65'h03208fa75d57cca75;
    stim[31] = 65'h03f5483c12bb3893a;
    stim[32] = 65'h0b5ed22b126cb8e4c;
    stim[33] = 65'h07fec34eea5e6b83b;
    stim[34] = 65'h03e5a02ed351a25bc;
    stim[35] = 65'h0ea0c20ff91f678e6;
    stim[36] = 65'h00172c5a9674f2b78;
    stim[37] = 65'h0a80cd918341872ec;
    stim[38] = 65'h0f08326cdd2662cf2;
    stim[39] = 65'h0dd32d87d85e7b9ee;
    stim[40] = 65'h0b57eaeb8aa6ef964;
    stim[41] = 65'h035c592905830c41b;
    stim[42] = 65'h0df0918eadf6384b8;
    stim[43] = 65'h0f5131fe13dabb22b;
    stim[44] = 65'h07686b16c55e2b6ff;
    stim[45] = 65'h0d1e0edb4dbe76790;
    stim[46] = 65'h034e82c5f3d4b9d7a;
    stim[47] = 65'h0e4c4d2ae386daf5d;
    stim[48] = 65'h079b78bde3a1c8915;
    stim[49] = 65'h053ede661cb8f7afa;
    stim[50] = 65'h1dc800e3de894394e;
    stim[51] = 65'h041dc283dbb4a5095;
    stim[52] = 65'h09739af2a18be4345;
    stim[53] = 65'h097f5215bb32d4aed;
    stim[54] = 65'h01b22c457f6a644e5;
    stim[55] = 65'h0755ee5bae517e92e;
    stim[56] = 65'h078ceffce03af92c1;
    stim[57] = 65'h032dc873ecd295e9c;
    stim[58] = 65'h023216411a490850e;
    stim[59] = 65'h1c73bba855a17cae4;
    stim[60] = 65'h0696698431526ad97;
    stim[61] = 65'h03fe19e9f4389ba1f;
    stim[62] = 65'h0a0ce1ad4ffafef20;
    stim[63] = 65'h051c0a0c410cc32ed;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h4d8cab4f;
      expv[18] = 32'h0c819de9;
      expv[19] = 32'h291c51dc;
      expv[20] = 32'h828b69e0;
      expv[21] = 32'h039b061e;
      expv[22] = 32'hdfd808d7;
      expv[23] = 32'ha51ec0b3;
      expv[24] = 32'h9b08ff78;
      expv[25] = 32'he245fe70;
      expv[26] = 32'ha7f58d5c;
      expv[27] = 32'he3c10fdb;
      expv[28] = 32'h70e6feeb;
      expv[29] = 32'h43b53580;
      expv[30] = 32'haf2c9aaf;
      expv[31] = 32'h181d1e09;
      expv[32] = 32'h39d820bb;
      expv[33] = 32'hdec719ce;
      expv[34] = 32'hb9d1d286;
      expv[35] = 32'h4dbf1bac;
      expv[36] = 32'h37625540;
      expv[37] = 32'h833c9b99;
      expv[38] = 32'h2bb3893a;
      expv[39] = 32'h9384730c;
      expv[40] = 32'h129e133a;
      expv[41] = 32'hb253ea8c;
      expv[42] = 32'hacd8a3da;
      expv[43] = 32'ha1c88738;
      expv[44] = 32'he24ac620;
      expv[45] = 32'haf30484a;
      expv[46] = 32'h2b400ff6;
      expv[47] = 32'hfa676160;
      expv[48] = 32'h830c41b0;
      expv[49] = 32'hb9e32f30;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h376b20e1;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
