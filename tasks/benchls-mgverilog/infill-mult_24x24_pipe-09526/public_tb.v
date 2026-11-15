// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09526 dut (
    .clk(clk),
    .opa(in_vec[47:24]),
    .opb(in_vec[23:0]),
    .prod(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h0d60df613d35;
    stim[1] = 48'h97728257e3a7;
    stim[2] = 48'hc6dfe19c3a8d;
    stim[3] = 48'h272aaf04ca89;
    stim[4] = 48'h3f0ebd9aad0a;
    stim[5] = 48'ha943e809a38a;
    stim[6] = 48'hf75b14e5988e;
    stim[7] = 48'h3d67e4dd00ae;
    stim[8] = 48'h65931c31f9ee;
    stim[9] = 48'ha021920237cb;
    stim[10] = 48'h6e3962da1091;
    stim[11] = 48'h40f547472c31;
    stim[12] = 48'h5f10e0a498aa;
    stim[13] = 48'h852ebcf36515;
    stim[14] = 48'he7a51957e8ab;
    stim[15] = 48'hd43d830e0519;
    stim[16] = 48'h4ef9cf5476eb;
    stim[17] = 48'h7021ecab6751;
    stim[18] = 48'h28ae1888572f;
    stim[19] = 48'hbf4521f31063;
    stim[20] = 48'h41eb47180f38;
    stim[21] = 48'h35566ab9c366;
    stim[22] = 48'h7af5349a2241;
    stim[23] = 48'hd345c23af404;
    stim[24] = 48'hfae0156eeae5;
    stim[25] = 48'h11e7cd9e8d93;
    stim[26] = 48'hab52b19e9cd1;
    stim[27] = 48'ha44e68e08929;
    stim[28] = 48'hfae2130f78cd;
    stim[29] = 48'h876b33db6f7c;
    stim[30] = 48'hbc822009ac8d;
    stim[31] = 48'hae6eecbeabee;
    stim[32] = 48'h50c7a9bbef06;
    stim[33] = 48'hfec4ec788e35;
    stim[34] = 48'h45b15ce95140;
    stim[35] = 48'h91dcc2f0037e;
    stim[36] = 48'hc5ce51e61d20;
    stim[37] = 48'h5060f15509ce;
    stim[38] = 48'h67258eca4d05;
    stim[39] = 48'h16ad966d0ff4;
    stim[40] = 48'h953a132189e7;
    stim[41] = 48'h604cfc60ff41;
    stim[42] = 48'h59074a85ba48;
    stim[43] = 48'h374801f7d73d;
    stim[44] = 48'hea566ad3bdc3;
    stim[45] = 48'hdd32cdecf58a;
    stim[46] = 48'h8bc885f14d72;
    stim[47] = 48'h6ff6ed58aa0d;
    stim[48] = 48'hcf56da545d69;
    stim[49] = 48'h7b094647a304;
    stim[50] = 48'he65f1f107d78;
    stim[51] = 48'h725f918d7ae8;
    stim[52] = 48'hc870a26c5c08;
    stim[53] = 48'h076b0c1e0448;
    stim[54] = 48'h029143bf43e9;
    stim[55] = 48'h4d4b017319aa;
    stim[56] = 48'h28ddd1d83110;
    stim[57] = 48'h7e302f068ddf;
    stim[58] = 48'h501d9c851610;
    stim[59] = 48'h46f390daf6b1;
    stim[60] = 48'hf5d3ef13ca91;
    stim[61] = 48'h714d349df6b4;
    stim[62] = 48'hd4b91fb228a2;
    stim[63] = 48'h6e654c0daa4f;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'h0514e759312b;
      expv[3] = 48'h33fe9782f8ce;
      expv[4] = 48'h795de95e48ed;
      expv[5] = 48'h00bba75feda7;
      expv[6] = 48'h26197d1e4c62;
      expv[7] = 48'h065f84a35310;
      expv[8] = 48'hddd7e02c6518;
      expv[9] = 48'h3502d9909cf8;
      expv[10] = 48'h13d452e10008;
      expv[11] = 48'h01632954fcc6;
      expv[12] = 48'h5de3ff78a082;
      expv[13] = 48'h120f3d482697;
      expv[14] = 48'h3d1f80a634c0;
      expv[15] = 48'h7e9ff2d1016c;
      expv[16] = 48'h4f8ba3d8efb3;
      expv[17] = 48'h0b9f971790cb;
      expv[18] = 48'h1a0ea790bb05;
      expv[19] = 48'h4b13e9c4afac;
      expv[20] = 48'h15aa57621e68;
      expv[21] = 48'hb59adc9ccbc3;
      expv[22] = 48'h0631f9dca088;
      expv[23] = 48'h26b428ad2c3c;
      expv[24] = 48'h4a07f5112a34;
      expv[25] = 48'h30a72fbdff08;
      expv[26] = 48'h6cb27a43a4c9;
      expv[27] = 48'h0b16f77a03b7;
      expv[28] = 48'h6a25fb805e81;
      expv[29] = 48'h901ca34636a8;
      expv[30] = 48'h0f29a1fcf137;
      expv[31] = 48'h7413adb409b4;
      expv[32] = 48'h071fa2612ba0;
      expv[33] = 48'h81eb796ac368;
      expv[34] = 48'h3b4d44be74f6;
      expv[35] = 48'h77f9d499acdc;
      expv[36] = 48'h3f848b467300;
      expv[37] = 48'h88c0f340ed7c;
      expv[38] = 48'hb1cddddef720;
      expv[39] = 48'h1ab3441b7aee;
      expv[40] = 48'h5182aa5b71c6;
      expv[41] = 48'h09a952a73cf8;
      expv[42] = 48'h138cdf2e9225;
      expv[43] = 48'h247ce3a28ffc;
      expv[44] = 48'h2e8191c7d0d0;
      expv[45] = 48'h3584f39bff3d;
      expv[46] = 48'hc1d2edaa14be;
      expv[47] = 48'hccbefdd79382;
      expv[48] = 48'h83c20ec44c3a;
      expv[49] = 48'h26c74120ec09;
      expv[50] = 48'h4454271fd16a;
      expv[51] = 48'h226deb3db718;
      expv[52] = 48'h0ed6da5eb988;
      expv[53] = 48'h3f358c0eb568;
      expv[54] = 48'h54d79315bd10;
      expv[55] = 48'h00deab2a4b60;
      expv[56] = 48'h01eb0f57befb;
      expv[57] = 48'h22c07119e7aa;
      expv[58] = 48'h2282fd5ade10;
      expv[59] = 48'h033b0f8fdbf1;
      expv[60] = 48'h29a6499941c0;
      expv[61] = 48'h3cafc7bac690;
      expv[62] = 48'h13013f34a05f;
      expv[63] = 48'h45e988be4090;
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
