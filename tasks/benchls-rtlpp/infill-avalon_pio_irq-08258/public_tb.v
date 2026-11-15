// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08258 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
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
    stim[0] = 38'h190b2ad8fd;
    stim[1] = 38'h015280c24f;
    stim[2] = 38'h165a571f57;
    stim[3] = 38'h229a999e2a;
    stim[4] = 38'h233441f211;
    stim[5] = 38'h2b840afb5f;
    stim[6] = 38'h365703d9ea;
    stim[7] = 38'h22e1ee5355;
    stim[8] = 38'h3bf3c11dab;
    stim[9] = 38'h3f8466f03f;
    stim[10] = 38'h171b596826;
    stim[11] = 38'h3e8dcbc1cd;
    stim[12] = 38'h16daa7734f;
    stim[13] = 38'h175724fa38;
    stim[14] = 38'h2e41aa2c7f;
    stim[15] = 38'h076452dde3;
    stim[16] = 38'h0e5b401738;
    stim[17] = 38'h3eed8972b6;
    stim[18] = 38'h3ae486c1dd;
    stim[19] = 38'h1adcbc17f3;
    stim[20] = 38'h1764788de2;
    stim[21] = 38'h3b157209a0;
    stim[22] = 38'h331fb06425;
    stim[23] = 38'h126b27e6f1;
    stim[24] = 38'h1ffdb572c8;
    stim[25] = 38'h1b70553477;
    stim[26] = 38'h1a9f1fde52;
    stim[27] = 38'h2ef4272e85;
    stim[28] = 38'h0e3bf67666;
    stim[29] = 38'h2bf7aad749;
    stim[30] = 38'h37fb339e9d;
    stim[31] = 38'h0ce3deead8;
    stim[32] = 38'h0f9e00bf67;
    stim[33] = 38'h2eb204fa0d;
    stim[34] = 38'h12f202ffd6;
    stim[35] = 38'h0ab0136f7a;
    stim[36] = 38'h2b708ea060;
    stim[37] = 38'h1bedc98a26;
    stim[38] = 38'h321a01dda9;
    stim[39] = 38'h1f6c58f4c2;
    stim[40] = 38'h13ac9ef008;
    stim[41] = 38'h2e4f9f17ce;
    stim[42] = 38'h03a5462d54;
    stim[43] = 38'h03552d930c;
    stim[44] = 38'h23bb437458;
    stim[45] = 38'h16a980f991;
    stim[46] = 38'h0bff3e4460;
    stim[47] = 38'h06722a3c80;
    stim[48] = 38'h26473980bd;
    stim[49] = 38'h1a36d508c1;
    stim[50] = 38'h37157a1867;
    stim[51] = 38'h2f1e208d0f;
    stim[52] = 38'h1607043189;
    stim[53] = 38'h11ce180f68;
    stim[54] = 38'h06f1beae20;
    stim[55] = 38'h275ff9138a;
    stim[56] = 38'h33a1cdebca;
    stim[57] = 38'h17484217d1;
    stim[58] = 38'h168941e0c0;
    stim[59] = 38'h2358910567;
    stim[60] = 38'h36e5455e6b;
    stim[61] = 38'h27c80c4d81;
    stim[62] = 38'h025f22fa6f;
    stim[63] = 38'h07f836e292;
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
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000001;
      expv[23] = 33'h100000001;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000001;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000001;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
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
