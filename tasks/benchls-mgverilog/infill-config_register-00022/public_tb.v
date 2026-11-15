// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00022 dut (
    .Clk(clk),
    .CA_reg_set(in_vec[49:43]),
    .RegInit(in_vec[42:27]),
    .Reset(in_vec[26:26]),
    .CWR_pulse(in_vec[25:25]),
    .CCSB(in_vec[24:24]),
    .CA_reg(in_vec[23:16]),
    .CD_in_reg(in_vec[15:0]),
    .RegOut(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h12346b71a5452;
    stim[1] = 50'h042c4adb27cf5;
    stim[2] = 50'h0e3dc38a42c5d;
    stim[3] = 50'h005dde0c9f6ad;
    stim[4] = 50'h15604295a02a1;
    stim[5] = 50'h17dc4939d8522;
    stim[6] = 50'h38f1a03794972;
    stim[7] = 50'h2d2feb837ad5f;
    stim[8] = 50'h0b5dae923fc49;
    stim[9] = 50'h39b675337dc43;
    stim[10] = 50'h2254f3a3b2f8a;
    stim[11] = 50'h1097b48671df2;
    stim[12] = 50'h3a3b3289d4d5e;
    stim[13] = 50'h257a6dbd326a0;
    stim[14] = 50'h15a863886cb83;
    stim[15] = 50'h3e37dea519f3f;
    stim[16] = 50'h2bfbcf18281fa;
    stim[17] = 50'h037b779297c3b;
    stim[18] = 50'h173d571282a15;
    stim[19] = 50'h1048a71d61ab0;
    stim[20] = 50'h37f49c2c7b06c;
    stim[21] = 50'h1f7e25aad84a3;
    stim[22] = 50'h39c57db61c79a;
    stim[23] = 50'h1581821d9df4a;
    stim[24] = 50'h1fd01b87fd968;
    stim[25] = 50'h0ad13895dc333;
    stim[26] = 50'h301fa6018d4ae;
    stim[27] = 50'h263216a96eb72;
    stim[28] = 50'h0b3f9a9320814;
    stim[29] = 50'h317354360d78f;
    stim[30] = 50'h179b5903dad2b;
    stim[31] = 50'h3c100427c4bc3;
    stim[32] = 50'h1953681dc4905;
    stim[33] = 50'h03830a09b5e7b;
    stim[34] = 50'h3d83b13a33047;
    stim[35] = 50'h3385d19833e4c;
    stim[36] = 50'h32fb8b921f137;
    stim[37] = 50'h015ac799c0929;
    stim[38] = 50'h0329710aeb4c5;
    stim[39] = 50'h044c42b52978e;
    stim[40] = 50'h3862353a54684;
    stim[41] = 50'h221d9202bf2e3;
    stim[42] = 50'h0bf608096db1c;
    stim[43] = 50'h298a52259909e;
    stim[44] = 50'h298c662030578;
    stim[45] = 50'h02d77534fe6cb;
    stim[46] = 50'h22cedc0499b21;
    stim[47] = 50'h0c4101a2a9259;
    stim[48] = 50'h20314b3bbb114;
    stim[49] = 50'h20e0b802d097e;
    stim[50] = 50'h20cb9b86f7c07;
    stim[51] = 50'h27b4323853563;
    stim[52] = 50'h35239e91be242;
    stim[53] = 50'h2fca4a91a07e4;
    stim[54] = 50'h08ed71a20bb9d;
    stim[55] = 50'h1d520b890fd9c;
    stim[56] = 50'h345e7323ebc89;
    stim[57] = 50'h3027902364863;
    stim[58] = 50'h1355640c305bf;
    stim[59] = 50'h10ce39ba7f3f3;
    stim[60] = 50'h33c574888c075;
    stim[61] = 50'h1480fca7c04b5;
    stim[62] = 50'h2873e6b2a9d32;
    stim[63] = 50'h03f4081450169;
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
      expv[0] = 16'h68d6;
      expv[1] = 16'h68d6;
      expv[2] = 16'h5895;
      expv[3] = 16'h5895;
      expv[4] = 16'h5895;
      expv[5] = 16'h5895;
      expv[6] = 16'h5895;
      expv[7] = 16'h5895;
      expv[8] = 16'h5895;
      expv[9] = 16'h5895;
      expv[10] = 16'h5895;
      expv[11] = 16'h5895;
      expv[12] = 16'h5895;
      expv[13] = 16'h5895;
      expv[14] = 16'h5895;
      expv[15] = 16'h5895;
      expv[16] = 16'h5895;
      expv[17] = 16'h5895;
      expv[18] = 16'h5895;
      expv[19] = 16'h5895;
      expv[20] = 16'h5895;
      expv[21] = 16'h5895;
      expv[22] = 16'h5895;
      expv[23] = 16'h5895;
      expv[24] = 16'h5895;
      expv[25] = 16'h5895;
      expv[26] = 16'h5895;
      expv[27] = 16'h5895;
      expv[28] = 16'h5895;
      expv[29] = 16'h5895;
      expv[30] = 16'h5895;
      expv[31] = 16'h5895;
      expv[32] = 16'h5895;
      expv[33] = 16'h5895;
      expv[34] = 16'h5895;
      expv[35] = 16'h5895;
      expv[36] = 16'h5895;
      expv[37] = 16'h5895;
      expv[38] = 16'h5895;
      expv[39] = 16'h5895;
      expv[40] = 16'h5895;
      expv[41] = 16'h5895;
      expv[42] = 16'h5895;
      expv[43] = 16'h5895;
      expv[44] = 16'h5895;
      expv[45] = 16'h5895;
      expv[46] = 16'h5895;
      expv[47] = 16'h5895;
      expv[48] = 16'h5895;
      expv[49] = 16'h5895;
      expv[50] = 16'h5895;
      expv[51] = 16'h5895;
      expv[52] = 16'h5895;
      expv[53] = 16'h5895;
      expv[54] = 16'h5895;
      expv[55] = 16'h5895;
      expv[56] = 16'h5895;
      expv[57] = 16'h5895;
      expv[58] = 16'h5895;
      expv[59] = 16'h5895;
      expv[60] = 16'h5895;
      expv[61] = 16'h5895;
      expv[62] = 16'h5895;
      expv[63] = 16'h5895;
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
