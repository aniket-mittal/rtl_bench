// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148100 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[53:53]),
    .csr_a(in_vec[52:39]),
    .csr_we(in_vec[38:38]),
    .csr_di(in_vec[37:6]),
    .mc_d(in_vec[5:2]),
    .mc_cmd(in_vec[1:1]),
    .mc_clk(in_vec[0:0]),
    .csr_do(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h25ae17e6dafb6c;
    stim[1] = 54'h323ed08cdc5632;
    stim[2] = 54'h17f00db677f5bf;
    stim[3] = 54'h1a53d7122b5d08;
    stim[4] = 54'h0d2de7ce4aa07c;
    stim[5] = 54'h0ecb6b845c8260;
    stim[6] = 54'h1e11bd7df97d2e;
    stim[7] = 54'h1d474d3839ec5f;
    stim[8] = 54'h1a4912d19246a0;
    stim[9] = 54'h03cb11cea628a1;
    stim[10] = 54'h00f620ef78d68d;
    stim[11] = 54'h0c5708ea1a0a01;
    stim[12] = 54'h060c5a6fe193bd;
    stim[13] = 54'h02980a52faba44;
    stim[14] = 54'h1883f16ad652d3;
    stim[15] = 54'h179028e58c2cef;
    stim[16] = 54'h19e786a93bda3d;
    stim[17] = 54'h35d479b3d71270;
    stim[18] = 54'h09e6e90caf13ca;
    stim[19] = 54'h04ee305d44703b;
    stim[20] = 54'h153f7f97b9a177;
    stim[21] = 54'h02e2bc0f101bf9;
    stim[22] = 54'h3fa6918136ab53;
    stim[23] = 54'h002642ed953f64;
    stim[24] = 54'h14aa89688aa625;
    stim[25] = 54'h1d78a180b174f6;
    stim[26] = 54'h169196aa670b94;
    stim[27] = 54'h18afd9767f3a7f;
    stim[28] = 54'h0e3323fed41a63;
    stim[29] = 54'h053c2c4b4dcff3;
    stim[30] = 54'h058828c9a7b08f;
    stim[31] = 54'h1bdfc7b89f0552;
    stim[32] = 54'h15319379015fc4;
    stim[33] = 54'h08701e0d271931;
    stim[34] = 54'h0d35690277a07a;
    stim[35] = 54'h01199bbb955de9;
    stim[36] = 54'h1c3b90d50ff48d;
    stim[37] = 54'h0671a4683f399a;
    stim[38] = 54'h0ea855cef8ce0e;
    stim[39] = 54'h116a5d69c34b91;
    stim[40] = 54'h3c21c8b1ec0810;
    stim[41] = 54'h17d3ff75d84491;
    stim[42] = 54'h1e37494567d628;
    stim[43] = 54'h19bb9113aa1ad0;
    stim[44] = 54'h0c4784dc24f241;
    stim[45] = 54'h0afdfb335a6c01;
    stim[46] = 54'h0e804c5493eb10;
    stim[47] = 54'h0edd8d51864e09;
    stim[48] = 54'h1caae5ec2b0c5c;
    stim[49] = 54'h175776e98dfec6;
    stim[50] = 54'h08013dd094cc6e;
    stim[51] = 54'h1bd59df1863456;
    stim[52] = 54'h1366072d2012e7;
    stim[53] = 54'h01d2d1fac915a5;
    stim[54] = 54'h15abed28f28d08;
    stim[55] = 54'h1401606820eb0f;
    stim[56] = 54'h1d691d4cdbd9a3;
    stim[57] = 54'h114f79840ade3b;
    stim[58] = 54'h11dca57c884e9e;
    stim[59] = 54'h0972cc45eeedc8;
    stim[60] = 54'h13675d9f23ad4b;
    stim[61] = 54'h0c62efdcd0e2a4;
    stim[62] = 54'h0ba3852b5c1b6c;
    stim[63] = 54'h04610baab7810e;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hae117209;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'h34e0e7b1;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'h5c48ad74;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'h69bf864e;
      expv[19] = 32'h42337158;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'h34e0e7b1;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'ha432bc4f;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hae117209;
      expv[30] = 32'he6cf5c49;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'h65d9fce9;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hc5ab594b;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hc5ab594b;
      expv[43] = 32'hfe5ee685;
      expv[44] = 32'hfdd76112;
      expv[45] = 32'h1ee27c15;
      expv[46] = 32'h9f392a81;
      expv[47] = 32'h573be338;
      expv[48] = 32'heccd69b0;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'h25159f58;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'heccd69b0;
      expv[53] = 32'h0bb654fd;
      expv[54] = 32'h97b0ac31;
      expv[55] = 32'hfdd76112;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'h81a083ac;
      expv[58] = 32'hdba637fb;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'h47eb2456;
      expv[61] = 32'he6102b78;
      expv[62] = 32'h3117bbb7;
      expv[63] = 32'hb4a3ca34;
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
