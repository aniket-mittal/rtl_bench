// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117166 dut (
    .fifo_clk_i(clk),
    .fifo_wr_en_i(in_vec[9:9]),
    .fifo_wr_data_i(in_vec[8:1]),
    .fifo_rst_i(in_vec[0:0]),
    .fifo_full_o(out_vec[51:51]),
    .mem_wdata_o(out_vec[50:19]),
    .mem_clk_en_o(out_vec[18:18]),
    .mem_addr_o(out_vec[17:4]),
    .mem_byte_en_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h20b;
    stim[1] = 10'h00d;
    stim[2] = 10'h32e;
    stim[3] = 10'h1b4;
    stim[4] = 10'h2be;
    stim[5] = 10'h21c;
    stim[6] = 10'h1c9;
    stim[7] = 10'h132;
    stim[8] = 10'h250;
    stim[9] = 10'h0e4;
    stim[10] = 10'h076;
    stim[11] = 10'h0a8;
    stim[12] = 10'h3f8;
    stim[13] = 10'h1d4;
    stim[14] = 10'h3be;
    stim[15] = 10'h3dc;
    stim[16] = 10'h162;
    stim[17] = 10'h002;
    stim[18] = 10'h39a;
    stim[19] = 10'h3f4;
    stim[20] = 10'h268;
    stim[21] = 10'h024;
    stim[22] = 10'h3b0;
    stim[23] = 10'h1b4;
    stim[24] = 10'h000;
    stim[25] = 10'h168;
    stim[26] = 10'h25e;
    stim[27] = 10'h038;
    stim[28] = 10'h000;
    stim[29] = 10'h0b8;
    stim[30] = 10'h060;
    stim[31] = 10'h140;
    stim[32] = 10'h38c;
    stim[33] = 10'h23c;
    stim[34] = 10'h01a;
    stim[35] = 10'h351;
    stim[36] = 10'h2ec;
    stim[37] = 10'h3fe;
    stim[38] = 10'h08c;
    stim[39] = 10'h336;
    stim[40] = 10'h2da;
    stim[41] = 10'h0be;
    stim[42] = 10'h346;
    stim[43] = 10'h090;
    stim[44] = 10'h166;
    stim[45] = 10'h21c;
    stim[46] = 10'h244;
    stim[47] = 10'h37c;
    stim[48] = 10'h2a4;
    stim[49] = 10'h260;
    stim[50] = 10'h206;
    stim[51] = 10'h034;
    stim[52] = 10'h2c6;
    stim[53] = 10'h238;
    stim[54] = 10'h2dc;
    stim[55] = 10'h2e6;
    stim[56] = 10'h1c0;
    stim[57] = 10'h350;
    stim[58] = 10'h3e2;
    stim[59] = 10'h3b0;
    stim[60] = 10'h0f4;
    stim[61] = 10'h2b0;
    stim[62] = 10'h132;
    stim[63] = 10'h224;
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
      expv[0] = 52'h02828282c0001;
      expv[1] = 52'h0303030300002;
      expv[2] = 52'h4bcbcbcbc0001;
      expv[3] = 52'h6d6d6d6d00001;
      expv[4] = 52'h2fafafafc0001;
      expv[5] = 52'h0707070740001;
      expv[6] = 52'h7272727200001;
      expv[7] = 52'h4ccccccc80001;
      expv[8] = 52'h1414141440001;
      expv[9] = 52'h3939393900001;
      expv[10] = 52'h1d9d9d9d80001;
      expv[11] = 52'h2a2a2a2a00001;
      expv[12] = 52'h7e7e7e7e40001;
      expv[13] = 52'h7575757500001;
      expv[14] = 52'h6fefefefc0001;
      expv[15] = 52'h7777777740001;
      expv[16] = 52'h58d8d8d880001;
      expv[17] = 52'h0080808080001;
      expv[18] = 52'h66e6e6e6c0001;
      expv[19] = 52'h7d7d7d7d40001;
      expv[20] = 52'h1a1a1a1a40001;
      expv[21] = 52'h0909090900001;
      expv[22] = 52'h6c6c6c6c40001;
      expv[23] = 52'h6d6d6d6d00001;
      expv[24] = 52'h0000000000001;
      expv[25] = 52'h5a5a5a5a00001;
      expv[26] = 52'h17979797c0001;
      expv[27] = 52'h0e0e0e0e00001;
      expv[28] = 52'h0000000000001;
      expv[29] = 52'h2e2e2e2e00001;
      expv[30] = 52'h1818181800001;
      expv[31] = 52'h5050505000001;
      expv[32] = 52'h6363636340001;
      expv[33] = 52'h0f0f0f0f40001;
      expv[34] = 52'h0686868680001;
      expv[35] = 52'h5454545440001;
      expv[36] = 52'h3b3b3b3b40001;
      expv[37] = 52'h7fffffffc0001;
      expv[38] = 52'h2323232300001;
      expv[39] = 52'h4dcdcdcdc0001;
      expv[40] = 52'h36b6b6b6c0001;
      expv[41] = 52'h2fafafaf80001;
      expv[42] = 52'h51d1d1d1c0001;
      expv[43] = 52'h2424242400001;
      expv[44] = 52'h59d9d9d980001;
      expv[45] = 52'h0707070740001;
      expv[46] = 52'h1111111140001;
      expv[47] = 52'h5f5f5f5f40001;
      expv[48] = 52'h2929292940001;
      expv[49] = 52'h1818181840001;
      expv[50] = 52'h01818181c0001;
      expv[51] = 52'h0d0d0d0d00001;
      expv[52] = 52'h31b1b1b1c0001;
      expv[53] = 52'h0e0e0e0e40001;
      expv[54] = 52'h3737373740001;
      expv[55] = 52'h39b9b9b9c0001;
      expv[56] = 52'h7070707000001;
      expv[57] = 52'h5454545440001;
      expv[58] = 52'h78f8f8f8c0001;
      expv[59] = 52'h6c6c6c6c40001;
      expv[60] = 52'h3d3d3d3d00001;
      expv[61] = 52'h2c2c2c2c40001;
      expv[62] = 52'h4ccccccc80001;
      expv[63] = 52'h0909090940001;
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
