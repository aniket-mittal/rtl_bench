// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01149 dut (
    .rx_clk(clk),
    .rx_sof(in_vec[43:40]),
    .rx_eof(in_vec[39:36]),
    .rx_ferr(in_vec[35:32]),
    .rx_fdata(in_vec[31:0]),
    .rx_err(out_vec[32:32]),
    .rx_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'ha0bd5fb1fe4;
    stim[1] = 44'he9e3396ecb3;
    stim[2] = 44'h515d7d36a61;
    stim[3] = 44'hf9146656140;
    stim[4] = 44'h4bcb56a484a;
    stim[5] = 44'h887364464c7;
    stim[6] = 44'hc86824d6672;
    stim[7] = 44'haf55a3f65fc;
    stim[8] = 44'hba7d4b60dac;
    stim[9] = 44'hdad0b288049;
    stim[10] = 44'h5cb3d785911;
    stim[11] = 44'h12899a6591b;
    stim[12] = 44'h59440e146c1;
    stim[13] = 44'h49f062c049b;
    stim[14] = 44'h8bfb85d1ad4;
    stim[15] = 44'hba0bfe6f8a3;
    stim[16] = 44'h8040584a18b;
    stim[17] = 44'h8ce040ef969;
    stim[18] = 44'hd02519b133a;
    stim[19] = 44'h286462f1077;
    stim[20] = 44'hd63dbfdbe66;
    stim[21] = 44'h76ac1cc0b84;
    stim[22] = 44'he2408dc8c67;
    stim[23] = 44'h24ba3a30f56;
    stim[24] = 44'h00f00ba5df2;
    stim[25] = 44'h3640db9ee13;
    stim[26] = 44'hd9e242d9544;
    stim[27] = 44'h45f150ba35f;
    stim[28] = 44'hf2c87d60db8;
    stim[29] = 44'h05bee9ab8f3;
    stim[30] = 44'h4399656278d;
    stim[31] = 44'h58ab1c69711;
    stim[32] = 44'ha64070b2ab3;
    stim[33] = 44'h4779bb610ea;
    stim[34] = 44'h008c5e0d3ee;
    stim[35] = 44'h984837fb1d1;
    stim[36] = 44'he9a1de70335;
    stim[37] = 44'hb9eede4c289;
    stim[38] = 44'h4f0a7b341e8;
    stim[39] = 44'h88c79d88534;
    stim[40] = 44'h52219f57e18;
    stim[41] = 44'hff962d76efc;
    stim[42] = 44'haba56e6474d;
    stim[43] = 44'h675ea43ec61;
    stim[44] = 44'h13fbeb3155d;
    stim[45] = 44'h7b68363b8c5;
    stim[46] = 44'hdd3e3156ddc;
    stim[47] = 44'hd09ec535f90;
    stim[48] = 44'hb05d9d54abd;
    stim[49] = 44'h1d65761cc26;
    stim[50] = 44'h1292a5b9aac;
    stim[51] = 44'h04e3f5b86ca;
    stim[52] = 44'h59d205aac2d;
    stim[53] = 44'h95bbbcdd493;
    stim[54] = 44'h39e8794da42;
    stim[55] = 44'hd08e6ca1a0f;
    stim[56] = 44'ha8f6540e395;
    stim[57] = 44'h176b2101d11;
    stim[58] = 44'hb7fa357b87c;
    stim[59] = 44'h1f7dc4ca008;
    stim[60] = 44'h8d9d5c28bcf;
    stim[61] = 44'hfb910b0936d;
    stim[62] = 44'h741484c6680;
    stim[63] = 44'haba425a7dbd;
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
      expv[1] = 33'h1fb1fe400;
      expv[2] = 33'h10000ffff;
      expv[3] = 33'h1d7d36a61;
      expv[4] = 33'h10000ffff;
      expv[5] = 33'h10000ffff;
      expv[6] = 33'h10000ffff;
      expv[7] = 33'h10000ffff;
      expv[8] = 33'h13f65fc82;
      expv[9] = 33'h10000ffff;
      expv[10] = 33'h10000ffff;
      expv[11] = 33'h13d785911;
      expv[12] = 33'h10000ffff;
      expv[13] = 33'h140e146c1;
      expv[14] = 33'h10000ffff;
      expv[15] = 33'h10000ffff;
      expv[16] = 33'h10000ffff;
      expv[17] = 33'h10000ffff;
      expv[18] = 33'h10000ffff;
      expv[19] = 33'h10000ffff;
      expv[20] = 33'h10000ffff;
      expv[21] = 33'h10000ffff;
      expv[22] = 33'h10000ffff;
      expv[23] = 33'h10000ffff;
      expv[24] = 33'h10000ffff;
      expv[25] = 33'h10000ffff;
      expv[26] = 33'h10000ffff;
      expv[27] = 33'h10000ffff;
      expv[28] = 33'h10000ffff;
      expv[29] = 33'h10000ffff;
      expv[30] = 33'h10000ffff;
      expv[31] = 33'h10000ffff;
      expv[32] = 33'h1b1c69711;
      expv[33] = 33'h10b2ab3b1;
      expv[34] = 33'h10000ffff;
      expv[35] = 33'h10000ffff;
      expv[36] = 33'h10000ffff;
      expv[37] = 33'h10000ffff;
      expv[38] = 33'h10000ffff;
      expv[39] = 33'h10000ffff;
      expv[40] = 33'h10000ffff;
      expv[41] = 33'h119f57e18;
      expv[42] = 33'h10000ffff;
      expv[43] = 33'h1e6474d62;
      expv[44] = 33'h10000ffff;
      expv[45] = 33'h10000ffff;
      expv[46] = 33'h10000ffff;
      expv[47] = 33'h10000ffff;
      expv[48] = 33'h10000ffff;
      expv[49] = 33'h10000ffff;
      expv[50] = 33'h10000ffff;
      expv[51] = 33'h10000ffff;
      expv[52] = 33'h10000ffff;
      expv[53] = 33'h1205aac2d;
      expv[54] = 33'h10000ffff;
      expv[55] = 33'h10000ffff;
      expv[56] = 33'h10000ffff;
      expv[57] = 33'h140e395e6;
      expv[58] = 33'h10000ffff;
      expv[59] = 33'h10000ffff;
      expv[60] = 33'h10000ffff;
      expv[61] = 33'h10000ffff;
      expv[62] = 33'h10000ffff;
      expv[63] = 33'h10000ffff;
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
