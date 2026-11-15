// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_165322 dut (
    .clk(clk),
    .reset(in_vec[53:53]),
    .reg1(in_vec[52:48]),
    .reg2(in_vec[47:43]),
    .write_reg(in_vec[42:38]),
    .write_data(in_vec[37:6]),
    .write(in_vec[5:5]),
    .load(in_vec[4:4]),
    .store(in_vec[3:3]),
    .funct3(in_vec[2:0]),
    .read1(out_vec[63:32]),
    .read2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h24f4bdb32bc417;
    stim[1] = 54'h2d99b88d318eaa;
    stim[2] = 54'h1282a12aaf2400;
    stim[3] = 54'h06f13ee9e96aef;
    stim[4] = 54'h03140b3fddffa0;
    stim[5] = 54'h059c7b204a2521;
    stim[6] = 54'h14e097adaa6c6e;
    stim[7] = 54'h15c525280aa4be;
    stim[8] = 54'h0ac4a7cbf6a8be;
    stim[9] = 54'h0610d046a85793;
    stim[10] = 54'h0bd650caf5d561;
    stim[11] = 54'h149ab7dc408559;
    stim[12] = 54'h04e66b954fbf33;
    stim[13] = 54'h04c87f825426b3;
    stim[14] = 54'h1e781a9bc0809c;
    stim[15] = 54'h075817b4f13621;
    stim[16] = 54'h1bcb350be18ba7;
    stim[17] = 54'h1b3dbab1dc0e2f;
    stim[18] = 54'h06ee2b29e7cd80;
    stim[19] = 54'h0656f4d86adc5a;
    stim[20] = 54'h02599c2c6001f7;
    stim[21] = 54'h0812654e7b9846;
    stim[22] = 54'h0efd433e3712f3;
    stim[23] = 54'h0d56020b913e06;
    stim[24] = 54'h11cfab46ee5def;
    stim[25] = 54'h02b9a131465a07;
    stim[26] = 54'h1ac9ddbc3e61d0;
    stim[27] = 54'h0413d73e448c7f;
    stim[28] = 54'h0d946a9925a7c8;
    stim[29] = 54'h11ac5e5c6fcd7b;
    stim[30] = 54'h1e05c5db64f05f;
    stim[31] = 54'h03296eb4c985ac;
    stim[32] = 54'h07da685f1a1cd0;
    stim[33] = 54'h06b22e6c4656c8;
    stim[34] = 54'h0fba3221f71177;
    stim[35] = 54'h0116a0d8688612;
    stim[36] = 54'h15a94e8acd97d9;
    stim[37] = 54'h05ad423ff1172e;
    stim[38] = 54'h13a6b7163c754f;
    stim[39] = 54'h1a9891f60faee3;
    stim[40] = 54'h0067501207681c;
    stim[41] = 54'h12dfb01af1ca47;
    stim[42] = 54'h10406f54949088;
    stim[43] = 54'h0622c20240803a;
    stim[44] = 54'h0ecf04a007db7b;
    stim[45] = 54'h07061c5de156e6;
    stim[46] = 54'h0c00fd676c3069;
    stim[47] = 54'h0859bfabae271b;
    stim[48] = 54'h19024ca270c48f;
    stim[49] = 54'h0152f55347112b;
    stim[50] = 54'h0621c60da4157b;
    stim[51] = 54'h048b6fe607016d;
    stim[52] = 54'h14121d41244c9a;
    stim[53] = 54'h063f23eac6edba;
    stim[54] = 54'h1d5de3a3279656;
    stim[55] = 54'h04745a4ea0b809;
    stim[56] = 54'h082838f5589ad9;
    stim[57] = 54'h1fa38a3be1fc7f;
    stim[58] = 54'h1cb9ce6b9983a4;
    stim[59] = 54'h19b2af03a1f311;
    stim[60] = 54'h00860f0f161437;
    stim[61] = 54'h16ea4fbbbea258;
    stim[62] = 54'h17600da8140792;
    stim[63] = 54'h0488d6845b8b6b;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'hec81289400000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'hec81289400000000;
      expv[30] = 64'h000000005ed3c4d8;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h5ed3c4d8d42f862e;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h2cff77fe00000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h000000005ed3c4d8;
      expv[46] = 64'hd42f862e5ed3c4d8;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h00000000ffffc4d8;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h00000000ec812894;
      expv[52] = 64'h0000000047d83ebb;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'hffffc4d82cff77fe;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h00000000d42f862e;
      expv[63] = 64'h0000000000000000;
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
