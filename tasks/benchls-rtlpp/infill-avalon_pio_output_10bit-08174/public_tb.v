// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08174 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[41:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h192a217dad;
    stim[1] = 37'h19257ac15b;
    stim[2] = 37'h03cbac4a7f;
    stim[3] = 37'h02f0b2300f;
    stim[4] = 37'h1e287832e9;
    stim[5] = 37'h0c43424b9b;
    stim[6] = 37'h0ff2330d2b;
    stim[7] = 37'h1e4793db43;
    stim[8] = 37'h03495f31b2;
    stim[9] = 37'h0ae1fd3910;
    stim[10] = 37'h17ee844906;
    stim[11] = 37'h0aba285ae1;
    stim[12] = 37'h1ab820f6a7;
    stim[13] = 37'h1b5e8d83c7;
    stim[14] = 37'h17c185ef15;
    stim[15] = 37'h1e3e1b8f31;
    stim[16] = 37'h1e1922438d;
    stim[17] = 37'h129c45f9ff;
    stim[18] = 37'h0776312afa;
    stim[19] = 37'h1f8645351b;
    stim[20] = 37'h1268ee79e6;
    stim[21] = 37'h175bf41c94;
    stim[22] = 37'h16a5dc719d;
    stim[23] = 37'h0a1da077cd;
    stim[24] = 37'h13d054c695;
    stim[25] = 37'h1e2d133659;
    stim[26] = 37'h04b9c968d7;
    stim[27] = 37'h10b18956eb;
    stim[28] = 37'h0f169039a4;
    stim[29] = 37'h172878c03b;
    stim[30] = 37'h1786b31cf8;
    stim[31] = 37'h1ed8d57e9a;
    stim[32] = 37'h074ed8430e;
    stim[33] = 37'h092c25ddff;
    stim[34] = 37'h1737100c74;
    stim[35] = 37'h06bb0a770e;
    stim[36] = 37'h12cfa76b18;
    stim[37] = 37'h0b3663b710;
    stim[38] = 37'h0b1873839d;
    stim[39] = 37'h1b7d54316d;
    stim[40] = 37'h03a43e53b3;
    stim[41] = 37'h0eb9db27f9;
    stim[42] = 37'h1b8d264fea;
    stim[43] = 37'h021a6fec34;
    stim[44] = 37'h0e386f2981;
    stim[45] = 37'h17ee52e247;
    stim[46] = 37'h1a34e43702;
    stim[47] = 37'h13c84e0f72;
    stim[48] = 37'h17ed0301af;
    stim[49] = 37'h0e52be1f5c;
    stim[50] = 37'h0f40449640;
    stim[51] = 37'h0e4f9a0f41;
    stim[52] = 37'h1f9f2f4677;
    stim[53] = 37'h0362afae2e;
    stim[54] = 37'h16fb3758b3;
    stim[55] = 37'h016a94b0e2;
    stim[56] = 37'h1ad44ac66c;
    stim[57] = 37'h1b3443a4c1;
    stim[58] = 37'h1b82dfd87b;
    stim[59] = 37'h124c0f6ab3;
    stim[60] = 37'h027cfc239f;
    stim[61] = 37'h03c497fef9;
    stim[62] = 37'h1a30a1b07d;
    stim[63] = 37'h17be0be209;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00000000000;
      expv[16] = 42'h00000000000;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h00000000000;
      expv[26] = 42'h00000000000;
      expv[27] = 42'h00000000000;
      expv[28] = 42'h00000000000;
      expv[29] = 42'h00000000000;
      expv[30] = 42'h00000000000;
      expv[31] = 42'h00000000000;
      expv[32] = 42'h00000000000;
      expv[33] = 42'h00000000000;
      expv[34] = 42'h00000000000;
      expv[35] = 42'h00000000000;
      expv[36] = 42'h30e00000000;
      expv[37] = 42'h30e00000000;
      expv[38] = 42'h30e00000000;
      expv[39] = 42'h30e00000000;
      expv[40] = 42'h30e0000030e;
      expv[41] = 42'h30e00000000;
      expv[42] = 42'h30e00000000;
      expv[43] = 42'h30e0000030e;
      expv[44] = 42'h30e00000000;
      expv[45] = 42'h30e00000000;
      expv[46] = 42'h30e00000000;
      expv[47] = 42'h30e00000000;
      expv[48] = 42'h30e00000000;
      expv[49] = 42'h30e00000000;
      expv[50] = 42'h30e00000000;
      expv[51] = 42'h30e00000000;
      expv[52] = 42'h30e00000000;
      expv[53] = 42'h30e0000030e;
      expv[54] = 42'h30e00000000;
      expv[55] = 42'h00000000000;
      expv[56] = 42'h00000000000;
      expv[57] = 42'h00000000000;
      expv[58] = 42'h00000000000;
      expv[59] = 42'h00000000000;
      expv[60] = 42'h00000000000;
      expv[61] = 42'h00000000000;
      expv[62] = 42'h00000000000;
      expv[63] = 42'h00000000000;
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
