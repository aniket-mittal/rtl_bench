// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070660 dut (
    .clk(clk),
    .rst(in_vec[54:54]),
    .csel(in_vec[53:53]),
    .rden(in_vec[52:52]),
    .wren(in_vec[51:51]),
    .addr(in_vec[50:37]),
    .bena(in_vec[36:33]),
    .wdata(in_vec[32:1]),
    .rtc_in(in_vec[0:0]),
    .rdata(out_vec[33:2]),
    .dtack(out_vec[1:1]),
    .tmr_int(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h67aa76670b1b70;
    stim[1] = 55'h4e14f60661f046;
    stim[2] = 55'h1138504bd89aa3;
    stim[3] = 55'h0aa994fbed024e;
    stim[4] = 55'h23f650f266f8b2;
    stim[5] = 55'h1ec901182afade;
    stim[6] = 55'h3f5aa43ee25f77;
    stim[7] = 55'h0b3ad6c9f3dd7d;
    stim[8] = 55'h0044aec3cc8b79;
    stim[9] = 55'h34611e1de5373e;
    stim[10] = 55'h267ecb79d88b5a;
    stim[11] = 55'h09bf660ff4e5eb;
    stim[12] = 55'h214b6e4d492b87;
    stim[13] = 55'h32b53fe830e855;
    stim[14] = 55'h3b6ec649494ce3;
    stim[15] = 55'h201846395150b4;
    stim[16] = 55'h14111113a60c47;
    stim[17] = 55'h0fe56e22ce9947;
    stim[18] = 55'h3b0dfc0a105ae0;
    stim[19] = 55'h28d5a12a141c65;
    stim[20] = 55'h2917ed7131595b;
    stim[21] = 55'h1ba54a71092c59;
    stim[22] = 55'h0adbb91ec83f6e;
    stim[23] = 55'h3f4a9aefb9ef46;
    stim[24] = 55'h2e001e6a566906;
    stim[25] = 55'h0b6eebca848567;
    stim[26] = 55'h22d4373b6b3585;
    stim[27] = 55'h26153d4a1b8b04;
    stim[28] = 55'h3d2daf89802d72;
    stim[29] = 55'h18a541a1e034ee;
    stim[30] = 55'h3ce2ca598344ed;
    stim[31] = 55'h08a4daf30fd629;
    stim[32] = 55'h2f78936d0296b5;
    stim[33] = 55'h26d26705d301df;
    stim[34] = 55'h041fff8b31e186;
    stim[35] = 55'h24fdfa859e2745;
    stim[36] = 55'h3871e1944af0d4;
    stim[37] = 55'h084e47a68985f0;
    stim[38] = 55'h1713748ad1144b;
    stim[39] = 55'h349bb00b3446ca;
    stim[40] = 55'h35ade9d98aaf3e;
    stim[41] = 55'h25ca4b0a891c59;
    stim[42] = 55'h09a2cef16dff7e;
    stim[43] = 55'h0effca74d797e3;
    stim[44] = 55'h2f14b7f2b11697;
    stim[45] = 55'h099f81cb95c1f7;
    stim[46] = 55'h1b6da612ef13b9;
    stim[47] = 55'h219f9703ae0c97;
    stim[48] = 55'h1e8c845e108f2f;
    stim[49] = 55'h16dedb0eecaef6;
    stim[50] = 55'h0c8ab91c8575e7;
    stim[51] = 55'h391ace849960e5;
    stim[52] = 55'h3cae5803891856;
    stim[53] = 55'h10261fb0c661f9;
    stim[54] = 55'h103f04967063f7;
    stim[55] = 55'h23b99211c02bce;
    stim[56] = 55'h1b33a364dcb8e0;
    stim[57] = 55'h39b1b29fa40b59;
    stim[58] = 55'h3e553dba53dfec;
    stim[59] = 55'h23bc930a90fd37;
    stim[60] = 55'h02ebd2cf6ec0f3;
    stim[61] = 55'h25151d0fdd984f;
    stim[62] = 55'h1a261c262929a3;
    stim[63] = 55'h059aac0e7887b2;
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
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000002;
      expv[7] = 34'h000000002;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000002;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h3fffffffe;
      expv[15] = 34'h3fffffffe;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000002;
      expv[19] = 34'h3fffffffe;
      expv[20] = 34'h000000003;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000003;
      expv[24] = 34'h00000001f;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000001;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000003;
      expv[29] = 34'h000000003;
      expv[30] = 34'h000000003;
      expv[31] = 34'h000000003;
      expv[32] = 34'h000000003;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000001;
      expv[36] = 34'h000000003;
      expv[37] = 34'h000000003;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000001;
      expv[40] = 34'h000000003;
      expv[41] = 34'h000000003;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000003;
      expv[45] = 34'h000000001;
      expv[46] = 34'h000000001;
      expv[47] = 34'h000000001;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000003;
      expv[52] = 34'h000000003;
      expv[53] = 34'h000000003;
      expv[54] = 34'h000000001;
      expv[55] = 34'h000000001;
      expv[56] = 34'h000000001;
      expv[57] = 34'h000000003;
      expv[58] = 34'h000000003;
      expv[59] = 34'h3e5622d2f;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000001;
      expv[63] = 34'h000000001;
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
