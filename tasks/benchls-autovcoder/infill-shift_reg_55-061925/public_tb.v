// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061925 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h504e1cffecbc6b;
    stim[1] = 55'h6958c76adf4785;
    stim[2] = 55'h498ba911a34306;
    stim[3] = 55'h198dc175859bbf;
    stim[4] = 55'h3add4f93a607dd;
    stim[5] = 55'h3586658a300f7d;
    stim[6] = 55'h31fa6dde9549a5;
    stim[7] = 55'h3658c551ef7a33;
    stim[8] = 55'h124e2f5f2fd40a;
    stim[9] = 55'h522c73438805cc;
    stim[10] = 55'h667f4a6b14174b;
    stim[11] = 55'h3d0f302f1c9a8d;
    stim[12] = 55'h6e11bc0118fa39;
    stim[13] = 55'h489cc0298863e0;
    stim[14] = 55'h0a08d75987a89c;
    stim[15] = 55'h0ba4880bf47c27;
    stim[16] = 55'h2ae1ec96cdce72;
    stim[17] = 55'h792d556961cac5;
    stim[18] = 55'h2f62d4d37ac3d9;
    stim[19] = 55'h54e1eb5dc505b9;
    stim[20] = 55'h4e86e10d6f3aea;
    stim[21] = 55'h2736885e9b6001;
    stim[22] = 55'h02132782246dbc;
    stim[23] = 55'h1311f409ac3e28;
    stim[24] = 55'h4cc9c306a9344a;
    stim[25] = 55'h543090e2f4bd1b;
    stim[26] = 55'h11d0f9555b38b5;
    stim[27] = 55'h56e7f6ffb06858;
    stim[28] = 55'h09d49af0342db0;
    stim[29] = 55'h24f6033274790a;
    stim[30] = 55'h371ab4df294eba;
    stim[31] = 55'h6ef2d36c0ba2ee;
    stim[32] = 55'h634030e88377f4;
    stim[33] = 55'h4bc278b6590e2f;
    stim[34] = 55'h5b2c2696050e42;
    stim[35] = 55'h6010eb928d9aa2;
    stim[36] = 55'h7c60082d3a2618;
    stim[37] = 55'h3055804bb00cf8;
    stim[38] = 55'h29f26f1679acf4;
    stim[39] = 55'h15bc7e3bd59141;
    stim[40] = 55'h071c14c2628d9e;
    stim[41] = 55'h71e853d2c76462;
    stim[42] = 55'h668d15d9db2f8e;
    stim[43] = 55'h29caccd8513346;
    stim[44] = 55'h162223630e09da;
    stim[45] = 55'h7c16560db59c2b;
    stim[46] = 55'h57d6c15704c68b;
    stim[47] = 55'h51f8a5c583886d;
    stim[48] = 55'h7ca03b03eef530;
    stim[49] = 55'h38f37cbbf1b38a;
    stim[50] = 55'h5fde3496236b03;
    stim[51] = 55'h7bec73e1b5c4fb;
    stim[52] = 55'h6e3369610bd81c;
    stim[53] = 55'h061af48cd563c6;
    stim[54] = 55'h369517bd097189;
    stim[55] = 55'h3115ee6059c20d;
    stim[56] = 55'h7d5c8f65211e38;
    stim[57] = 55'h5cb2b2002761cb;
    stim[58] = 55'h22469f441b4255;
    stim[59] = 55'h422f436fcba3fc;
    stim[60] = 55'h70a2c03aab06f4;
    stim[61] = 55'h2022267e99bd5b;
    stim[62] = 55'h656189ae595fbb;
    stim[63] = 55'h72a3a1942087ce;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h504e1cffecbc6b;
      expv[2] = 55'h6958c76adf4785;
      expv[3] = 55'h498ba911a34306;
      expv[4] = 55'h198dc175859bbf;
      expv[5] = 55'h3add4f93a607dd;
      expv[6] = 55'h3586658a300f7d;
      expv[7] = 55'h31fa6dde9549a5;
      expv[8] = 55'h3658c551ef7a33;
      expv[9] = 55'h124e2f5f2fd40a;
      expv[10] = 55'h522c73438805cc;
      expv[11] = 55'h667f4a6b14174b;
      expv[12] = 55'h3d0f302f1c9a8d;
      expv[13] = 55'h6e11bc0118fa39;
      expv[14] = 55'h489cc0298863e0;
      expv[15] = 55'h0a08d75987a89c;
      expv[16] = 55'h0ba4880bf47c27;
      expv[17] = 55'h2ae1ec96cdce72;
      expv[18] = 55'h792d556961cac5;
      expv[19] = 55'h2f62d4d37ac3d9;
      expv[20] = 55'h54e1eb5dc505b9;
      expv[21] = 55'h4e86e10d6f3aea;
      expv[22] = 55'h2736885e9b6001;
      expv[23] = 55'h02132782246dbc;
      expv[24] = 55'h1311f409ac3e28;
      expv[25] = 55'h4cc9c306a9344a;
      expv[26] = 55'h543090e2f4bd1b;
      expv[27] = 55'h11d0f9555b38b5;
      expv[28] = 55'h56e7f6ffb06858;
      expv[29] = 55'h09d49af0342db0;
      expv[30] = 55'h24f6033274790a;
      expv[31] = 55'h371ab4df294eba;
      expv[32] = 55'h6ef2d36c0ba2ee;
      expv[33] = 55'h634030e88377f4;
      expv[34] = 55'h4bc278b6590e2f;
      expv[35] = 55'h5b2c2696050e42;
      expv[36] = 55'h6010eb928d9aa2;
      expv[37] = 55'h7c60082d3a2618;
      expv[38] = 55'h3055804bb00cf8;
      expv[39] = 55'h29f26f1679acf4;
      expv[40] = 55'h15bc7e3bd59141;
      expv[41] = 55'h071c14c2628d9e;
      expv[42] = 55'h71e853d2c76462;
      expv[43] = 55'h668d15d9db2f8e;
      expv[44] = 55'h29caccd8513346;
      expv[45] = 55'h162223630e09da;
      expv[46] = 55'h7c16560db59c2b;
      expv[47] = 55'h57d6c15704c68b;
      expv[48] = 55'h51f8a5c583886d;
      expv[49] = 55'h7ca03b03eef530;
      expv[50] = 55'h38f37cbbf1b38a;
      expv[51] = 55'h5fde3496236b03;
      expv[52] = 55'h7bec73e1b5c4fb;
      expv[53] = 55'h6e3369610bd81c;
      expv[54] = 55'h061af48cd563c6;
      expv[55] = 55'h369517bd097189;
      expv[56] = 55'h3115ee6059c20d;
      expv[57] = 55'h7d5c8f65211e38;
      expv[58] = 55'h5cb2b2002761cb;
      expv[59] = 55'h22469f441b4255;
      expv[60] = 55'h422f436fcba3fc;
      expv[61] = 55'h70a2c03aab06f4;
      expv[62] = 55'h2022267e99bd5b;
      expv[63] = 55'h656189ae595fbb;
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
