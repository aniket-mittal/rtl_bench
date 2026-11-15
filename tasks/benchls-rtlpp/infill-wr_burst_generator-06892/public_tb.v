// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06892 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .i_enable(in_vec[26:26]),
    .i_wr_rdy(in_vec[25:24]),
    .i_wr_size(in_vec[23:0]),
    .o_wr_act(out_vec[34:33]),
    .o_wr_stb(out_vec[32:32]),
    .o_wr_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hd81df1b;
    stim[1] = 28'hd1e4512;
    stim[2] = 28'h04c26cb;
    stim[3] = 28'h324296f;
    stim[4] = 28'h7693ec8;
    stim[5] = 28'h355e124;
    stim[6] = 28'h11fe6ea;
    stim[7] = 28'h2ece564;
    stim[8] = 28'h2f28e69;
    stim[9] = 28'h12d2502;
    stim[10] = 28'h2b74feb;
    stim[11] = 28'h30de7e4;
    stim[12] = 28'h5ec4f15;
    stim[13] = 28'h6f87c9d;
    stim[14] = 28'h28aab64;
    stim[15] = 28'h223a8cd;
    stim[16] = 28'h3bfe982;
    stim[17] = 28'h23c17cf;
    stim[18] = 28'h5f2d0f3;
    stim[19] = 28'h190b6a4;
    stim[20] = 28'h1f33207;
    stim[21] = 28'h1698ed9;
    stim[22] = 28'h7b4d37b;
    stim[23] = 28'ha83aba2;
    stim[24] = 28'h6aa49dc;
    stim[25] = 28'h4cdde29;
    stim[26] = 28'h573560c;
    stim[27] = 28'h6ee0542;
    stim[28] = 28'h4c9809c;
    stim[29] = 28'h6a93415;
    stim[30] = 28'h17b29f1;
    stim[31] = 28'h251ab87;
    stim[32] = 28'h63dc7a3;
    stim[33] = 28'h71084d1;
    stim[34] = 28'h1f5b210;
    stim[35] = 28'h1951170;
    stim[36] = 28'h05cef10;
    stim[37] = 28'h558516f;
    stim[38] = 28'h748dc27;
    stim[39] = 28'h5805685;
    stim[40] = 28'h0ea9a77;
    stim[41] = 28'h0c91f96;
    stim[42] = 28'h63bcdc2;
    stim[43] = 28'h74cac6d;
    stim[44] = 28'h3a302f8;
    stim[45] = 28'h3237c48;
    stim[46] = 28'h4d05447;
    stim[47] = 28'h66327ff;
    stim[48] = 28'h5a3b6c0;
    stim[49] = 28'h10bf185;
    stim[50] = 28'h4175b6e;
    stim[51] = 28'h11f4c7c;
    stim[52] = 28'h279d4c5;
    stim[53] = 28'h7da462e;
    stim[54] = 28'h657314c;
    stim[55] = 28'h6f85246;
    stim[56] = 28'hd04a7e9;
    stim[57] = 28'h374b29c;
    stim[58] = 28'h54c79fe;
    stim[59] = 28'h654da9e;
    stim[60] = 28'h0ce3af3;
    stim[61] = 28'h7fe853b;
    stim[62] = 28'h57b449e;
    stim[63] = 28'h40d0233;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h200000000;
      expv[6] = 35'h200000000;
      expv[7] = 35'h200000000;
      expv[8] = 35'h200000000;
      expv[9] = 35'h200000000;
      expv[10] = 35'h200000000;
      expv[11] = 35'h200000000;
      expv[12] = 35'h200000000;
      expv[13] = 35'h300000000;
      expv[14] = 35'h300000001;
      expv[15] = 35'h200000001;
      expv[16] = 35'h200000001;
      expv[17] = 35'h200000001;
      expv[18] = 35'h200000001;
      expv[19] = 35'h300000002;
      expv[20] = 35'h200000002;
      expv[21] = 35'h200000002;
      expv[22] = 35'h200000002;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h400000000;
      expv[26] = 35'h500000000;
      expv[27] = 35'h500000001;
      expv[28] = 35'h500000002;
      expv[29] = 35'h500000003;
      expv[30] = 35'h500000004;
      expv[31] = 35'h400000004;
      expv[32] = 35'h400000004;
      expv[33] = 35'h500000005;
      expv[34] = 35'h500000006;
      expv[35] = 35'h400000006;
      expv[36] = 35'h400000006;
      expv[37] = 35'h400000006;
      expv[38] = 35'h500000007;
      expv[39] = 35'h500000008;
      expv[40] = 35'h500000009;
      expv[41] = 35'h400000009;
      expv[42] = 35'h400000009;
      expv[43] = 35'h50000000a;
      expv[44] = 35'h50000000b;
      expv[45] = 35'h40000000b;
      expv[46] = 35'h40000000b;
      expv[47] = 35'h50000000c;
      expv[48] = 35'h50000000d;
      expv[49] = 35'h50000000e;
      expv[50] = 35'h40000000e;
      expv[51] = 35'h50000000f;
      expv[52] = 35'h40000000f;
      expv[53] = 35'h40000000f;
      expv[54] = 35'h500000010;
      expv[55] = 35'h500000011;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h200000000;
      expv[60] = 35'h300000000;
      expv[61] = 35'h200000000;
      expv[62] = 35'h300000001;
      expv[63] = 35'h300000002;
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
