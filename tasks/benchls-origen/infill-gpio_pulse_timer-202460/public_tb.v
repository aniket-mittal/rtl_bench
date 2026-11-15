// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202460 dut (
    .clk(clk),
    .rst_n(in_vec[65:65]),
    .pulse1start(in_vec[64:33]),
    .pulse1end(in_vec[32:1]),
    .startclock(in_vec[0:0]),
    .gpio(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h19f2d5d600cbd4d43;
    stim[1] = 66'h0f6ba2c06135d033c;
    stim[2] = 66'h3a4321777631a1db4;
    stim[3] = 66'h3f9caf53a09281831;
    stim[4] = 66'h3bb82689dd71ef9a8;
    stim[5] = 66'h0f6395c7fec4b4bfe;
    stim[6] = 66'h30ab4e956b927c65a;
    stim[7] = 66'h24b6759c1cc393b22;
    stim[8] = 66'h36623a4e6510c0451;
    stim[9] = 66'h266894d1216a0038f;
    stim[10] = 66'h32d1b54eecfb713e8;
    stim[11] = 66'h2cf6bc93ce75c96e3;
    stim[12] = 66'h3e18ea3f42ebd8a27;
    stim[13] = 66'h3ed75a7cbcea3e583;
    stim[14] = 66'h3a4a03dc13649b264;
    stim[15] = 66'h2cdc0458e14e9fc70;
    stim[16] = 66'h2360ecc17873163a3;
    stim[17] = 66'h22ef41591be401adc;
    stim[18] = 66'h39dac9fca9d5ff5d7;
    stim[19] = 66'h2b5caa2e5972be0bd;
    stim[20] = 66'h3a07e8ad7dd490af0;
    stim[21] = 66'h28c7c8f994a583dea;
    stim[22] = 66'h3c108235e97228789;
    stim[23] = 66'h25b5b52596cf185da;
    stim[24] = 66'h32744f0e09f541b1d;
    stim[25] = 66'h25384365fc8f034e0;
    stim[26] = 66'h1b63e706ef64a170c;
    stim[27] = 66'h2ae96226d7799b090;
    stim[28] = 66'h2ec00256098171257;
    stim[29] = 66'h29af035b5201ee319;
    stim[30] = 66'h2f3bd16b10500d11b;
    stim[31] = 66'h2d4e467914b483b15;
    stim[32] = 66'h2d5680328a2d03293;
    stim[33] = 66'h37efb073297331dcc;
    stim[34] = 66'h3e4d07c3d9eaabb72;
    stim[35] = 66'h2a0e6b5808249ed90;
    stim[36] = 66'h3d82789003305fbba;
    stim[37] = 66'h343b0d6e5087bed22;
    stim[38] = 66'h23f0a62f4011bbf55;
    stim[39] = 66'h2fcea8501735774ea;
    stim[40] = 66'h31f6967417d209107;
    stim[41] = 66'h305a18a7ce719be93;
    stim[42] = 66'h2e5b3d39cacd57385;
    stim[43] = 66'h3462f2a9d4b96540b;
    stim[44] = 66'h2b7801c678a8a66f9;
    stim[45] = 66'h39b958321a8e99ce2;
    stim[46] = 66'h3535766fe02440b87;
    stim[47] = 66'h306dca2d7f05c3dc0;
    stim[48] = 66'h3de4bad76e7455385;
    stim[49] = 66'h26cc1bbd31f950746;
    stim[50] = 66'h276bb961a09d41b41;
    stim[51] = 66'h3e6d0a05efda86756;
    stim[52] = 66'h31198edc40f205492;
    stim[53] = 66'h344e685b01696a314;
    stim[54] = 66'h351c1d52fa6f37fad;
    stim[55] = 66'h362ef8ae9d5c30a69;
    stim[56] = 66'h2b07ab1a40b16b30f;
    stim[57] = 66'h24fea9fb85e770091;
    stim[58] = 66'h2cbb844ad755f8739;
    stim[59] = 66'h3a92c0f62bb395fcb;
    stim[60] = 66'h2d6a743119a2832be;
    stim[61] = 66'h2aa890a37b255a663;
    stim[62] = 66'h2cd3f8179679830da;
    stim[63] = 66'h3a64858fbf9a46758;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
