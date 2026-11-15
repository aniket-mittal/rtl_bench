// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04882 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[26:26]),
    .rst_i(in_vec[25:25]),
    .divide_i(in_vec[24:24]),
    .dividend_i(in_vec[23:8]),
    .divisor_i(in_vec[7:0]),
    .quotient_o(out_vec[16:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h2b690a7;
    stim[1] = 27'h78688ec;
    stim[2] = 27'h4f34464;
    stim[3] = 27'h080a55b;
    stim[4] = 27'h5bd927c;
    stim[5] = 27'h0df557a;
    stim[6] = 27'h1377091;
    stim[7] = 27'h0412e75;
    stim[8] = 27'h1fcde64;
    stim[9] = 27'h4ed456f;
    stim[10] = 27'h1bea52d;
    stim[11] = 27'h052ea5f;
    stim[12] = 27'h1ebdc62;
    stim[13] = 27'h4eddfad;
    stim[14] = 27'h52f3e98;
    stim[15] = 27'h4350966;
    stim[16] = 27'h1ce238d;
    stim[17] = 27'h43a3da8;
    stim[18] = 27'h4d1f05e;
    stim[19] = 27'h19c02f3;
    stim[20] = 27'h4271517;
    stim[21] = 27'h03d63f9;
    stim[22] = 27'h1d9cec8;
    stim[23] = 27'h52c641a;
    stim[24] = 27'h10d8634;
    stim[25] = 27'h10eb569;
    stim[26] = 27'h45f2f7b;
    stim[27] = 27'h033ae9d;
    stim[28] = 27'h4a06a95;
    stim[29] = 27'h4eb0bbe;
    stim[30] = 27'h5e21f92;
    stim[31] = 27'h1476933;
    stim[32] = 27'h0b47441;
    stim[33] = 27'h0b8f2a7;
    stim[34] = 27'h51bfb30;
    stim[35] = 27'h4ff3b6f;
    stim[36] = 27'h432b7be;
    stim[37] = 27'h0bc92e7;
    stim[38] = 27'h4a53217;
    stim[39] = 27'h1876fa5;
    stim[40] = 27'h5f42a3a;
    stim[41] = 27'h08691c1;
    stim[42] = 27'h1ea8e49;
    stim[43] = 27'h4d2cdef;
    stim[44] = 27'h0b59bc6;
    stim[45] = 27'h1b250a8;
    stim[46] = 27'h78fbe9d;
    stim[47] = 27'h40c30c6;
    stim[48] = 27'h5f38f4e;
    stim[49] = 27'h568ffe8;
    stim[50] = 27'h1bb7196;
    stim[51] = 27'h471eb6e;
    stim[52] = 27'h4551d7c;
    stim[53] = 27'h1d031ed;
    stim[54] = 27'h06c8cec;
    stim[55] = 27'h4a36915;
    stim[56] = 27'h02c9780;
    stim[57] = 27'h09235b0;
    stim[58] = 27'h1a9020d;
    stim[59] = 27'h13f56d3;
    stim[60] = 27'h456a1fa;
    stim[61] = 27'h5ac5ce5;
    stim[62] = 27'h1d4e396;
    stim[63] = 27'h5563331;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00002;
      expv[4] = 17'h00002;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00002;
      expv[11] = 17'h00002;
      expv[12] = 17'h00002;
      expv[13] = 17'h00002;
      expv[14] = 17'h00006;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00002;
      expv[19] = 17'h00004;
      expv[20] = 17'h00004;
      expv[21] = 17'h00008;
      expv[22] = 17'h00008;
      expv[23] = 17'h00008;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00002;
      expv[28] = 17'h00002;
      expv[29] = 17'h00006;
      expv[30] = 17'h0000e;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00002;
      expv[37] = 17'h00004;
      expv[38] = 17'h00004;
      expv[39] = 17'h00008;
      expv[40] = 17'h00008;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00002;
      expv[45] = 17'h00002;
      expv[46] = 17'h00002;
      expv[47] = 17'h00000;
      expv[48] = 17'h00002;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00002;
      expv[54] = 17'h00002;
      expv[55] = 17'h00002;
      expv[56] = 17'h00006;
      expv[57] = 17'h00006;
      expv[58] = 17'h00006;
      expv[59] = 17'h00006;
      expv[60] = 17'h00006;
      expv[61] = 17'h0000e;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
