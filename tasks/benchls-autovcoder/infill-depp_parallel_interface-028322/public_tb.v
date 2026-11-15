// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_028322 dut (
    .i_clk(clk),
    .i_astb_n(in_vec[19:19]),
    .i_dstb_n(in_vec[18:18]),
    .i_write_n(in_vec[17:17]),
    .i_depp(in_vec[16:9]),
    .i_tx_stb(in_vec[8:8]),
    .i_tx_data(in_vec[7:0]),
    .o_depp(out_vec[18:11]),
    .o_wait(out_vec[10:10]),
    .o_rx_stb(out_vec[9:9]),
    .o_rx_data(out_vec[8:1]),
    .o_tx_busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h753b3;
    stim[1] = 20'h4824a;
    stim[2] = 20'h9f6ae;
    stim[3] = 20'h161db;
    stim[4] = 20'h9b617;
    stim[5] = 20'h7c1f9;
    stim[6] = 20'h7ed4e;
    stim[7] = 20'h7517b;
    stim[8] = 20'hf13aa;
    stim[9] = 20'h8d7ee;
    stim[10] = 20'h3da6c;
    stim[11] = 20'hb7c99;
    stim[12] = 20'he6615;
    stim[13] = 20'h85be8;
    stim[14] = 20'h4b551;
    stim[15] = 20'h504bb;
    stim[16] = 20'hd3cf4;
    stim[17] = 20'h9b13f;
    stim[18] = 20'h630e3;
    stim[19] = 20'h65e1c;
    stim[20] = 20'h15aa4;
    stim[21] = 20'h7d1f7;
    stim[22] = 20'h17f0c;
    stim[23] = 20'hac903;
    stim[24] = 20'h9a106;
    stim[25] = 20'h56de8;
    stim[26] = 20'h9b086;
    stim[27] = 20'hdabf3;
    stim[28] = 20'heefe2;
    stim[29] = 20'h72040;
    stim[30] = 20'h0fa84;
    stim[31] = 20'h8c4d2;
    stim[32] = 20'h36279;
    stim[33] = 20'ha52c5;
    stim[34] = 20'h38f5c;
    stim[35] = 20'h8f0c2;
    stim[36] = 20'hef90f;
    stim[37] = 20'h23b7a;
    stim[38] = 20'ha34e5;
    stim[39] = 20'h1dc08;
    stim[40] = 20'hbe4d3;
    stim[41] = 20'ha9e2e;
    stim[42] = 20'hd0349;
    stim[43] = 20'hb1dff;
    stim[44] = 20'h01ae2;
    stim[45] = 20'h1f6a1;
    stim[46] = 20'h1a52f;
    stim[47] = 20'ha643b;
    stim[48] = 20'hea91b;
    stim[49] = 20'h1d90e;
    stim[50] = 20'hb57a0;
    stim[51] = 20'h6c7e9;
    stim[52] = 20'h1da9e;
    stim[53] = 20'hec9b9;
    stim[54] = 20'h73e02;
    stim[55] = 20'h853a9;
    stim[56] = 20'h30a4d;
    stim[57] = 20'h49fe1;
    stim[58] = 20'h902ee;
    stim[59] = 20'h5263b;
    stim[60] = 20'h5e13b;
    stim[61] = 20'h453c2;
    stim[62] = 20'h3307d;
    stim[63] = 20'h5d8ec;
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
      expv[0] = 19'h7fxxx;
      expv[1] = 19'h7fxxx;
      expv[2] = 19'h7fxxx;
      expv[3] = 19'h7fxxx;
      expv[4] = 19'h7fxxx;
      expv[5] = 19'h7fff7;
      expv[6] = 19'h7fdf7;
      expv[7] = 19'h7fdf7;
      expv[8] = 19'h7f9f7;
      expv[9] = 19'h7fdf7;
      expv[10] = 19'h7fdf7;
      expv[11] = 19'h7fdf7;
      expv[12] = 19'h7f9f7;
      expv[13] = 19'h7fdf7;
      expv[14] = 19'h7fdf7;
      expv[15] = 19'h7fdf7;
      expv[16] = 19'h7f9f7;
      expv[17] = 19'h7fdf7;
      expv[18] = 19'h7fdf7;
      expv[19] = 19'h7fdf7;
      expv[20] = 19'h7fdf7;
      expv[21] = 19'h7fdf7;
      expv[22] = 19'h7fdf7;
      expv[23] = 19'h7fdf7;
      expv[24] = 19'h7fdf7;
      expv[25] = 19'h7fdf7;
      expv[26] = 19'h7fdf7;
      expv[27] = 19'h7f9f7;
      expv[28] = 19'h7f9f7;
      expv[29] = 19'h7fdf7;
      expv[30] = 19'h7fdf7;
      expv[31] = 19'h7fdf7;
      expv[32] = 19'h7fdf7;
      expv[33] = 19'h7fdf7;
      expv[34] = 19'h7fdf7;
      expv[35] = 19'h7fdf7;
      expv[36] = 19'h7f9f7;
      expv[37] = 19'h7fdf7;
      expv[38] = 19'h7fdf7;
      expv[39] = 19'h7fdf7;
      expv[40] = 19'h7fdf7;
      expv[41] = 19'h7fdf7;
      expv[42] = 19'h7f9f7;
      expv[43] = 19'h7fdf7;
      expv[44] = 19'h7fdf7;
      expv[45] = 19'h7fdf7;
      expv[46] = 19'h7fdf7;
      expv[47] = 19'h7fdf7;
      expv[48] = 19'h7f9f7;
      expv[49] = 19'h7fdf7;
      expv[50] = 19'h7fdf7;
      expv[51] = 19'h7fdf7;
      expv[52] = 19'h7fdf7;
      expv[53] = 19'h7f9f7;
      expv[54] = 19'h7fdf7;
      expv[55] = 19'h7fdf7;
      expv[56] = 19'h7fdf7;
      expv[57] = 19'h7fdf7;
      expv[58] = 19'h7fdf7;
      expv[59] = 19'h7fdf7;
      expv[60] = 19'h7fdf7;
      expv[61] = 19'h7fdf7;
      expv[62] = 19'h7fdf7;
      expv[63] = 19'h7fdf7;
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
