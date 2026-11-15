// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127965 dut (
    .clk(clk),
    .clk_ram(in_vec[45:45]),
    .rst(in_vec[44:44]),
    .A(in_vec[43:28]),
    .B(in_vec[27:12]),
    .MW(in_vec[11:8]),
    .PC(in_vec[7:0]),
    .ALU_F(out_vec[33:18]),
    .FR_ZF(out_vec[17:17]),
    .FR_OF(out_vec[16:16]),
    .Mem_R_Data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h103ad70035ff;
    stim[1] = 46'h3c79783c20d9;
    stim[2] = 46'h0ac2918d4e8f;
    stim[3] = 46'h2ca31d074316;
    stim[4] = 46'h25684235a625;
    stim[5] = 46'h2a6f33dc4fe3;
    stim[6] = 46'h215a324681b3;
    stim[7] = 46'h068ac1b3b2fd;
    stim[8] = 46'h05cab1a043f7;
    stim[9] = 46'h2cac1b136c57;
    stim[10] = 46'h0405113b4ddb;
    stim[11] = 46'h2a14abe0a13f;
    stim[12] = 46'h2cded9188cc4;
    stim[13] = 46'h1a476a8fcce6;
    stim[14] = 46'h05acd82704a0;
    stim[15] = 46'h027fb3bda2a0;
    stim[16] = 46'h0dd9482aa5d1;
    stim[17] = 46'h010826c752f7;
    stim[18] = 46'h01eab946cc41;
    stim[19] = 46'h2aee173241e5;
    stim[20] = 46'h01e28a311c33;
    stim[21] = 46'h20c708cd4462;
    stim[22] = 46'h0cf17a91e41a;
    stim[23] = 46'h03791c7abf8d;
    stim[24] = 46'h28b42d8bda29;
    stim[25] = 46'h26dea75adf2c;
    stim[26] = 46'h2c6defc4b4ec;
    stim[27] = 46'h06f151754267;
    stim[28] = 46'h2aeedb90ed0d;
    stim[29] = 46'h279d83f7db10;
    stim[30] = 46'h29ed9ed3dd57;
    stim[31] = 46'h27946704bbae;
    stim[32] = 46'h0fc77dbb8d94;
    stim[33] = 46'h2b88f10ebc04;
    stim[34] = 46'h2c1d60d489c9;
    stim[35] = 46'h08f2256b1d94;
    stim[36] = 46'h0fece3d7caae;
    stim[37] = 46'h00939df34a55;
    stim[38] = 46'h241f98a6b5df;
    stim[39] = 46'h0c3e80f8df9e;
    stim[40] = 46'h21100698fadc;
    stim[41] = 46'h211fabc628e2;
    stim[42] = 46'h00eeb17a014c;
    stim[43] = 46'h211acd0ef26b;
    stim[44] = 46'h0416e708dbcb;
    stim[45] = 46'h2e38c0db5273;
    stim[46] = 46'h0f23b2ac18e3;
    stim[47] = 46'h25482de7314e;
    stim[48] = 46'h25f4761c120d;
    stim[49] = 46'h24acaa1c012a;
    stim[50] = 46'h2308b7eba0ea;
    stim[51] = 46'h271a2f4062d5;
    stim[52] = 46'h006dca4b176d;
    stim[53] = 46'h06b5e82dd81e;
    stim[54] = 46'h2a9fe2f06a99;
    stim[55] = 46'h0d7d2607d2ef;
    stim[56] = 46'h24484866f961;
    stim[57] = 46'h2488fd3edf33;
    stim[58] = 46'h05d6fb8241e2;
    stim[59] = 46'h0dc48cf3ac63;
    stim[60] = 46'h043365d9ab76;
    stim[61] = 46'h01d7ea26e885;
    stim[62] = 46'h02e6e22c723c;
    stim[63] = 46'h07cea097bbc1;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h075axxxxx;
      expv[2] = 34'h12d65xxxx;
      expv[3] = 34'h02b08xxxx;
      expv[4] = 34'h369d4xxxx;
      expv[5] = 34'h00054xxxx;
      expv[6] = 34'h3e9bcxxxx;
      expv[7] = 34'h3c4ecxxxx;
      expv[8] = 34'h020a0xxxx;
      expv[9] = 34'h17abcxxxx;
      expv[10] = 34'h1efdcxxxx;
      expv[11] = 34'h01440xxxx;
      expv[12] = 34'h38d00xxxx;
      expv[13] = 34'h17194xxxx;
      expv[14] = 34'h03228xxxx;
      expv[15] = 34'h362f4xxxx;
      expv[16] = 34'h08f68xxxx;
      expv[17] = 34'h14000xxxx;
      expv[18] = 34'h00000xxxx;
      expv[19] = 34'h22b1exxxx;
      expv[20] = 34'h0eef4xxxx;
      expv[21] = 34'h2f4e4xxxx;
      expv[22] = 34'h20290xxxx;
      expv[23] = 34'h19824xxxx;
      expv[24] = 34'h00018xxxx;
      expv[25] = 34'h22000xxxx;
      expv[26] = 34'h0000cxxxx;
      expv[27] = 34'h0ea54xxxx;
      expv[28] = 34'h01c50xxxx;
      expv[29] = 34'h10000xxxx;
      expv[30] = 34'h1fff4xxxx;
      expv[31] = 34'h08000xxxx;
      expv[32] = 34'h1e53cxxxx;
      expv[33] = 34'h1dc00xxxx;
      expv[34] = 34'h2a190xxxx;
      expv[35] = 34'h2d238xxxx;
      expv[36] = 34'h07910xxxx;
      expv[37] = 34'h0f130xxxx;
      expv[38] = 34'h024c0xxxx;
      expv[39] = 34'h32000xxxx;
      expv[40] = 34'h3fff8xxxx;
      expv[41] = 34'h00400xxxx;
      expv[42] = 34'h33970xxxx;
      expv[43] = 34'h3dd2cxxxx;
      expv[44] = 34'h042b0xxxx;
      expv[45] = 34'h1c7bcxxxx;
      expv[46] = 34'h00610xxxx;
      expv[47] = 34'h073f0xxxx;
      expv[48] = 34'h1d83cxxxx;
      expv[49] = 34'h10504xxxx;
      expv[50] = 34'h2a428xxxx;
      expv[51] = 34'h2bd15xxxx;
      expv[52] = 34'h1c008xxxx;
      expv[53] = 34'h00db8xxxx;
      expv[54] = 34'h3b8ecxxxx;
      expv[55] = 34'h0a418xxxx;
      expv[56] = 34'h10140xxxx;
      expv[57] = 34'h2f854xxxx;
      expv[58] = 34'h00008xxxx;
      expv[59] = 34'h2952cxxxx;
      expv[60] = 34'h04dc8xxxx;
      expv[61] = 34'h17ef8xxxx;
      expv[62] = 34'h2ffb0xxxx;
      expv[63] = 34'h08918xxxx;
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
