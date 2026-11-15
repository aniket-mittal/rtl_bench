// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051929 dut (
    .sys_clk(clk),
    .rst_n(in_vec[18:18]),
    .dma_rst_i(in_vec[17:17]),
    .dma_de_16b_i(in_vec[16:16]),
    .dma_d_16b_i(in_vec[15:0]),
    .dma_de_32b_o(out_vec[33:33]),
    .dma_we_32b_o(out_vec[32:32]),
    .dma_d_32b_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h2ab42;
    stim[1] = 19'h030cf;
    stim[2] = 19'h57caa;
    stim[3] = 19'h6121d;
    stim[4] = 19'h415a5;
    stim[5] = 19'h5a5e3;
    stim[6] = 19'h5177e;
    stim[7] = 19'h69570;
    stim[8] = 19'h555c2;
    stim[9] = 19'h4afdc;
    stim[10] = 19'h5a49b;
    stim[11] = 19'h5524e;
    stim[12] = 19'h6d1a9;
    stim[13] = 19'h57244;
    stim[14] = 19'h588b3;
    stim[15] = 19'h46901;
    stim[16] = 19'h55265;
    stim[17] = 19'h4e30d;
    stim[18] = 19'h43fbe;
    stim[19] = 19'h5ef8f;
    stim[20] = 19'h616e9;
    stim[21] = 19'h4e5cd;
    stim[22] = 19'h7b422;
    stim[23] = 19'h746e6;
    stim[24] = 19'h4e5a6;
    stim[25] = 19'h426dc;
    stim[26] = 19'h51526;
    stim[27] = 19'h62c8d;
    stim[28] = 19'h7770b;
    stim[29] = 19'h5a039;
    stim[30] = 19'h793dc;
    stim[31] = 19'h7f124;
    stim[32] = 19'h4397e;
    stim[33] = 19'h7d417;
    stim[34] = 19'h7a2bc;
    stim[35] = 19'h6c7ca;
    stim[36] = 19'h4d7e6;
    stim[37] = 19'h78b2f;
    stim[38] = 19'h6953b;
    stim[39] = 19'h46d11;
    stim[40] = 19'h75c57;
    stim[41] = 19'h5d156;
    stim[42] = 19'h492d6;
    stim[43] = 19'h40b02;
    stim[44] = 19'h6f185;
    stim[45] = 19'h5eba5;
    stim[46] = 19'h42f66;
    stim[47] = 19'h55f9d;
    stim[48] = 19'h41e3b;
    stim[49] = 19'h55f14;
    stim[50] = 19'h563a5;
    stim[51] = 19'h71c09;
    stim[52] = 19'h53d4e;
    stim[53] = 19'h4c215;
    stim[54] = 19'h6464e;
    stim[55] = 19'h576f7;
    stim[56] = 19'h413c0;
    stim[57] = 19'h63181;
    stim[58] = 19'h5abfb;
    stim[59] = 19'h44a8e;
    stim[60] = 19'h47553;
    stim[61] = 19'h44e60;
    stim[62] = 19'h65a49;
    stim[63] = 19'h5b4b2;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h17caa0000;
      expv[4] = 34'h2121d7caa;
      expv[5] = 34'h115a5121d;
      expv[6] = 34'h1a5e315a5;
      expv[7] = 34'h2177ea5e3;
      expv[8] = 34'h39570177e;
      expv[9] = 34'h155c29570;
      expv[10] = 34'h2afdc55c2;
      expv[11] = 34'h1a49bafdc;
      expv[12] = 34'h2524ea49b;
      expv[13] = 34'h3d1a9524e;
      expv[14] = 34'h17244d1a9;
      expv[15] = 34'h288b37244;
      expv[16] = 34'h3690188b3;
      expv[17] = 34'h152656901;
      expv[18] = 34'h2e30d5265;
      expv[19] = 34'h13fbee30d;
      expv[20] = 34'h1ef8f3fbe;
      expv[21] = 34'h216e9ef8f;
      expv[22] = 34'h1e5cd16e9;
      expv[23] = 34'h1b422e5cd;
      expv[24] = 34'h246e6b422;
      expv[25] = 34'h3e5a646e6;
      expv[26] = 34'h126dce5a6;
      expv[27] = 34'h1152626dc;
      expv[28] = 34'h22c8d1526;
      expv[29] = 34'h1770b2c8d;
      expv[30] = 34'h2a039770b;
      expv[31] = 34'h393dca039;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h1d417397e;
      expv[35] = 34'h2a2bcd417;
      expv[36] = 34'h3c7caa2bc;
      expv[37] = 34'h1d7e6c7ca;
      expv[38] = 34'h18b2fd7e6;
      expv[39] = 34'h2953b8b2f;
      expv[40] = 34'h16d11953b;
      expv[41] = 34'h15c576d11;
      expv[42] = 34'h2d1565c57;
      expv[43] = 34'h392d6d156;
      expv[44] = 34'h10b0292d6;
      expv[45] = 34'h1f1850b02;
      expv[46] = 34'h1eba5f185;
      expv[47] = 34'h22f66eba5;
      expv[48] = 34'h15f9d2f66;
      expv[49] = 34'h21e3b5f9d;
      expv[50] = 34'h15f141e3b;
      expv[51] = 34'h263a55f14;
      expv[52] = 34'h31c0963a5;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h1464ec215;
      expv[56] = 34'h176f7464e;
      expv[57] = 34'h213c076f7;
      expv[58] = 34'h1318113c0;
      expv[59] = 34'h1abfb3181;
      expv[60] = 34'h24a8eabfb;
      expv[61] = 34'h175534a8e;
      expv[62] = 34'h14e607553;
      expv[63] = 34'h15a494e60;
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
