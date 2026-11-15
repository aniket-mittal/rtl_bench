// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123666 dut (
    .clk(clk),
    .RGB_sync(in_vec[24:24]),
    .RGB_data(in_vec[23:0]),
    .CrYCb_sync(out_vec[24:24]),
    .CrYCb_data(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h16e2339;
    stim[1] = 25'h1da556d;
    stim[2] = 25'h13aff23;
    stim[3] = 25'h099a893;
    stim[4] = 25'h0cf3ebc;
    stim[5] = 25'h0a00bce;
    stim[6] = 25'h129e9b3;
    stim[7] = 25'h17ecea3;
    stim[8] = 25'h0e97934;
    stim[9] = 25'h1964992;
    stim[10] = 25'h176b8d5;
    stim[11] = 25'h189a214;
    stim[12] = 25'h17cef77;
    stim[13] = 25'h00c1fcd;
    stim[14] = 25'h03dae94;
    stim[15] = 25'h0502d0d;
    stim[16] = 25'h074fb29;
    stim[17] = 25'h0796234;
    stim[18] = 25'h04d16b3;
    stim[19] = 25'h09ed26c;
    stim[20] = 25'h14b92db;
    stim[21] = 25'h1921942;
    stim[22] = 25'h13d9569;
    stim[23] = 25'h041f19d;
    stim[24] = 25'h1086c54;
    stim[25] = 25'h04cc34c;
    stim[26] = 25'h0658d1f;
    stim[27] = 25'h1d51488;
    stim[28] = 25'h0c3d8e3;
    stim[29] = 25'h0cb8e25;
    stim[30] = 25'h0482b19;
    stim[31] = 25'h10e5492;
    stim[32] = 25'h06dd5c5;
    stim[33] = 25'h03b5701;
    stim[34] = 25'h158e052;
    stim[35] = 25'h151353c;
    stim[36] = 25'h1e0c50e;
    stim[37] = 25'h1e5adda;
    stim[38] = 25'h194b421;
    stim[39] = 25'h0e573e4;
    stim[40] = 25'h01fd5a8;
    stim[41] = 25'h0e55596;
    stim[42] = 25'h1658681;
    stim[43] = 25'h17ee7bc;
    stim[44] = 25'h1e49ded;
    stim[45] = 25'h1c44716;
    stim[46] = 25'h1749323;
    stim[47] = 25'h1aa9b22;
    stim[48] = 25'h0d6169a;
    stim[49] = 25'h18f472a;
    stim[50] = 25'h07c32d4;
    stim[51] = 25'h025066e;
    stim[52] = 25'h00b54b7;
    stim[53] = 25'h189767e;
    stim[54] = 25'h0921bce;
    stim[55] = 25'h1fc8dad;
    stim[56] = 25'h059c8a6;
    stim[57] = 25'h05b5eac;
    stim[58] = 25'h0ccf69e;
    stim[59] = 25'h0f72eb2;
    stim[60] = 25'h0422560;
    stim[61] = 25'h05bf3d7;
    stim[62] = 25'h1c29d2c;
    stim[63] = 25'h0128fa1;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'hxxxxxxx;
      expv[2] = 25'hxxxxxxx;
      expv[3] = 25'hxxxxxxx;
      expv[4] = 25'hxc220b2;
      expv[5] = 25'hxd63b00;
      expv[6] = 25'hxd85b30;
      expv[7] = 25'hx2a5238;
      expv[8] = 25'hx8f3c15;
      expv[9] = 25'hxc025d1;
      expv[10] = 25'hxdf531b;
      expv[11] = 25'hx47521f;
      expv[12] = 25'hx7f4e3d;
      expv[13] = 25'hx7337fd;
      expv[14] = 25'hx6a4804;
      expv[15] = 25'hx4f4a19;
      expv[16] = 25'hxd9645a;
      expv[17] = 25'h1991380;
      expv[18] = 25'h1683cda;
      expv[19] = 25'h1d51b96;
      expv[20] = 25'h01b5d37;
      expv[21] = 25'h06739f4;
      expv[22] = 25'h0c61896;
      expv[23] = 25'h1f5615e;
      expv[24] = 25'h16a39dd;
      expv[25] = 25'h0d623c0;
      expv[26] = 25'h1343dee;
      expv[27] = 25'h107551b;
      expv[28] = 25'h177259f;
      expv[29] = 25'h15046f5;
      expv[30] = 25'h05140fa;
      expv[31] = 25'h0ac3202;
      expv[32] = 25'h0575e4a;
      expv[33] = 25'h0a3491b;
      expv[34] = 25'h09e1fab;
      expv[35] = 25'h04f25b1;
      expv[36] = 25'h0574e0d;
      expv[37] = 25'h19427b0;
      expv[38] = 25'h1295217;
      expv[39] = 25'h1dc1c96;
      expv[40] = 25'h011677c;
      expv[41] = 25'h1895641;
      expv[42] = 25'h0095747;
      expv[43] = 25'h0784d3c;
      expv[44] = 25'h1f64b05;
      expv[45] = 25'h0a8421e;
      expv[46] = 25'h03c4103;
      expv[47] = 25'h0d0645e;
      expv[48] = 25'h19d5133;
      expv[49] = 25'h0dd34ea;
      expv[50] = 25'h0843eee;
      expv[51] = 25'h14c4f30;
      expv[52] = 25'h10b28d6;
      expv[53] = 25'h17436f7;
      expv[54] = 25'h1b727c5;
      expv[55] = 25'h1a41187;
      expv[56] = 25'h074219d;
      expv[57] = 25'h04a4212;
      expv[58] = 25'h0b127d2;
      expv[59] = 25'h167585a;
      expv[60] = 25'h1055124;
      expv[61] = 25'h16e32db;
      expv[62] = 25'h1f47087;
      expv[63] = 25'h1e13706;
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
