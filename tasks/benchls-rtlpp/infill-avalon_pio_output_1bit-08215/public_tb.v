// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08215 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
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
    stim[0] = 37'h10e9010f83;
    stim[1] = 37'h14a7060201;
    stim[2] = 37'h0a1d4a5597;
    stim[3] = 37'h0fbe338a8d;
    stim[4] = 37'h13a3b245c4;
    stim[5] = 37'h1b81685f05;
    stim[6] = 37'h086e09ad4a;
    stim[7] = 37'h07a0782b76;
    stim[8] = 37'h1e39792a7c;
    stim[9] = 37'h02e419a1c5;
    stim[10] = 37'h0e91a7e861;
    stim[11] = 37'h1798393794;
    stim[12] = 37'h0bfb483ac4;
    stim[13] = 37'h1b61d531d5;
    stim[14] = 37'h1a53bfe05b;
    stim[15] = 37'h1a1d504977;
    stim[16] = 37'h0f3221881d;
    stim[17] = 37'h179c12665b;
    stim[18] = 37'h16600a9eed;
    stim[19] = 37'h039218e5e1;
    stim[20] = 37'h033266bf20;
    stim[21] = 37'h03144fdeda;
    stim[22] = 37'h0687857455;
    stim[23] = 37'h0ee5a0d83d;
    stim[24] = 37'h083fc8966c;
    stim[25] = 37'h0327785914;
    stim[26] = 37'h035c970dc0;
    stim[27] = 37'h13ee02cf4c;
    stim[28] = 37'h0f82b20227;
    stim[29] = 37'h0657da44ab;
    stim[30] = 37'h0303e84295;
    stim[31] = 37'h1a75c364cf;
    stim[32] = 37'h063e5b899a;
    stim[33] = 37'h12716a1238;
    stim[34] = 37'h17ccb42246;
    stim[35] = 37'h0fed622345;
    stim[36] = 37'h031b387447;
    stim[37] = 37'h1e037ac31f;
    stim[38] = 37'h0b4fa9710e;
    stim[39] = 37'h1b9ab9bafa;
    stim[40] = 37'h1fea65f9d6;
    stim[41] = 37'h135bb21bb2;
    stim[42] = 37'h125c6a6772;
    stim[43] = 37'h128c1d7498;
    stim[44] = 37'h037f5096f1;
    stim[45] = 37'h0799ea757b;
    stim[46] = 37'h027ca5774a;
    stim[47] = 37'h1a760e6f80;
    stim[48] = 37'h127ef04dff;
    stim[49] = 37'h0821da16f8;
    stim[50] = 37'h03c17045b7;
    stim[51] = 37'h12f09bb939;
    stim[52] = 37'h1795dd40f1;
    stim[53] = 37'h0e7832f6f7;
    stim[54] = 37'h1f4271d364;
    stim[55] = 37'h0e07038bc7;
    stim[56] = 37'h06b3b9afbb;
    stim[57] = 37'h1aee7a7a3f;
    stim[58] = 37'h03fe786f61;
    stim[59] = 37'h0e1ea0b24d;
    stim[60] = 37'h1f80d9f4bd;
    stim[61] = 37'h030b8b270a;
    stim[62] = 37'h19e69d777b;
    stim[63] = 37'h1af47fc3aa;
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
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000001;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000001;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000001;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
