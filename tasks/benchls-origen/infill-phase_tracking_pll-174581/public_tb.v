// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174581 dut (
    .clk(clk),
    .nrst(in_vec[23:23]),
    .swiptAlive(in_vec[22:22]),
    .pll_in(in_vec[21:21]),
    .load_freq(in_vec[20:20]),
    .freq(in_vec[19:4]),
    .lgcoefficient(in_vec[3:0]),
    .phase(out_vec[17:2]),
    .error(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hc0775c;
    stim[1] = 24'h9aaef0;
    stim[2] = 24'h6f5bd0;
    stim[3] = 24'h0f197b;
    stim[4] = 24'h016575;
    stim[5] = 24'h7d4bf9;
    stim[6] = 24'h21410f;
    stim[7] = 24'h296adb;
    stim[8] = 24'h23f219;
    stim[9] = 24'h0be046;
    stim[10] = 24'h76c4f1;
    stim[11] = 24'h741a31;
    stim[12] = 24'h5c9a85;
    stim[13] = 24'h213685;
    stim[14] = 24'h7d4397;
    stim[15] = 24'h7f75e7;
    stim[16] = 24'h209b56;
    stim[17] = 24'h5da400;
    stim[18] = 24'h2f0d25;
    stim[19] = 24'h3fbb37;
    stim[20] = 24'h26fcf1;
    stim[21] = 24'h5aa80b;
    stim[22] = 24'h6f6144;
    stim[23] = 24'h7918c4;
    stim[24] = 24'h4592b0;
    stim[25] = 24'h2c10f9;
    stim[26] = 24'h19e6bf;
    stim[27] = 24'h4fb26a;
    stim[28] = 24'h291861;
    stim[29] = 24'h0a659b;
    stim[30] = 24'h76a4cb;
    stim[31] = 24'h604e02;
    stim[32] = 24'h6c2734;
    stim[33] = 24'h2c70a7;
    stim[34] = 24'h1d31f2;
    stim[35] = 24'h739e18;
    stim[36] = 24'h193495;
    stim[37] = 24'h4adad6;
    stim[38] = 24'h4d5ee6;
    stim[39] = 24'h2f1a0e;
    stim[40] = 24'h2611e5;
    stim[41] = 24'h1499f5;
    stim[42] = 24'h63f73e;
    stim[43] = 24'h76d0f4;
    stim[44] = 24'h4312f6;
    stim[45] = 24'hc0d793;
    stim[46] = 24'h270212;
    stim[47] = 24'h683288;
    stim[48] = 24'h3f57d0;
    stim[49] = 24'h06867f;
    stim[50] = 24'h44b13b;
    stim[51] = 24'h79d500;
    stim[52] = 24'h2b827b;
    stim[53] = 24'h15df41;
    stim[54] = 24'h1fa553;
    stim[55] = 24'h578993;
    stim[56] = 24'h45d177;
    stim[57] = 24'h744951;
    stim[58] = 24'h102a44;
    stim[59] = 24'h643309;
    stim[60] = 24'h2ca918;
    stim[61] = 24'h6f58c4;
    stim[62] = 24'h53ea8a;
    stim[63] = 24'hf3229e;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00004;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
