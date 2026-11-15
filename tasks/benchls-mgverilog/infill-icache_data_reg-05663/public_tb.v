// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05663 dut (
    .clk(clk),
    .reset(in_vec[66:66]),
    .ic_addr(in_vec[65:34]),
    .ic_rq(in_vec[33:33]),
    .data_in(in_vec[32:1]),
    .data_in_ready(in_vec[0:0]),
    .ic_data_out_valid(out_vec[65:65]),
    .ic_data_out(out_vec[64:33]),
    .data_rd(out_vec[32:32]),
    .data_address(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h63210c8551b346fce;
    stim[1] = 67'h44ee0a475cbccd522;
    stim[2] = 67'h3912aae575df6b645;
    stim[3] = 67'h068dd486edb0b2c0d;
    stim[4] = 67'h0804e11ba5e345e21;
    stim[5] = 67'h21532c9573157d8c1;
    stim[6] = 67'h2b7a1dfc94f29d7b5;
    stim[7] = 67'h348ec460e2cdfd9f1;
    stim[8] = 67'h22cf78582066bedd4;
    stim[9] = 67'h209e245b83291e1a9;
    stim[10] = 67'h0190f81e6dbd278bc;
    stim[11] = 67'h1fac03a74d6f1efbe;
    stim[12] = 67'h36f98eace97cfebce;
    stim[13] = 67'h182e0ae34574cfa32;
    stim[14] = 67'h08082c2069e73717d;
    stim[15] = 67'h38e16cb1e62c5b292;
    stim[16] = 67'h29f587ba55e1d5c6c;
    stim[17] = 67'h2084612f89ee6177b;
    stim[18] = 67'h388e825509be5874f;
    stim[19] = 67'h2782da57fb2cf9bbc;
    stim[20] = 67'h1533e99ef6aae990b;
    stim[21] = 67'h1951af349124690b2;
    stim[22] = 67'h0c458c0adf68aaea2;
    stim[23] = 67'h0e39f2c5d21baaf6b;
    stim[24] = 67'h0e12c6e28653e7245;
    stim[25] = 67'h04c58c338e2acadfc;
    stim[26] = 67'h204b2e80151215497;
    stim[27] = 67'h2b2a8298ce0fcbc98;
    stim[28] = 67'h0a9c6deccd725959b;
    stim[29] = 67'h357003a561e370bcd;
    stim[30] = 67'h0160ae539e38bfde5;
    stim[31] = 67'h1f88985297a54d78f;
    stim[32] = 67'h1b6595a199723243f;
    stim[33] = 67'h25dc08ff8fed02be4;
    stim[34] = 67'h220d62eadc2307c9e;
    stim[35] = 67'h054d8ad74799a9bff;
    stim[36] = 67'h2cf849773734b66f8;
    stim[37] = 67'h01d937b8420e86b20;
    stim[38] = 67'h07b1a44a8d020dfd2;
    stim[39] = 67'h128ba856465a08936;
    stim[40] = 67'h3ace5a3ea57eb29b5;
    stim[41] = 67'h2dc2d6b030e2eea76;
    stim[42] = 67'h075bf683f433c1ee9;
    stim[43] = 67'h3185d961475d93f8b;
    stim[44] = 67'h03003651f31e4c6f1;
    stim[45] = 67'h35ed5d9b92663c7f0;
    stim[46] = 67'h181526cbbe71befff;
    stim[47] = 67'h285fb2b2a7b6e876f;
    stim[48] = 67'h014f121d99c165047;
    stim[49] = 67'h237c9cccdc78613af;
    stim[50] = 67'h3ab26cc50852aa1ae;
    stim[51] = 67'h395c6034be20baddf;
    stim[52] = 67'h25c0ed2aea196a4c2;
    stim[53] = 67'h34150cc52a8fcffec;
    stim[54] = 67'h0f5609421ee7c9356;
    stim[55] = 67'h2028c9cbe6fda0fb5;
    stim[56] = 67'h32ff8371ef03c68c8;
    stim[57] = 67'h68c40d91242898ee4;
    stim[58] = 67'h2dc7ed939c5364e73;
    stim[59] = 67'h39336444f01b100e7;
    stim[60] = 67'h27da18d17252e5d4b;
    stim[61] = 67'h05e8ebac205d35446;
    stim[62] = 67'h1e64e2e109b012c3e;
    stim[63] = 67'h1df393182e42e64ff;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'h11b346fce8c843215;
      expv[2] = 66'h1cbccd52213b8291d;
      expv[3] = 66'h35df6b645e44aab95;
      expv[4] = 66'h2db0b2c0d1a37521b;
      expv[5] = 66'h25e345e212013846e;
      expv[6] = 66'h33157d8c1854cb255;
      expv[7] = 66'h34f29d7b4ade877f2;
      expv[8] = 66'h22cdfd9f1d23b1183;
      expv[9] = 66'h0066bedd58b3de160;
      expv[10] = 66'h23291e1a88278916e;
      expv[11] = 66'h0dbd278bd0643e079;
      expv[12] = 66'h0d6f1efbe7eb00e9d;
      expv[13] = 66'h097cfebcfdbe63ab3;
      expv[14] = 66'h0574cfa3260b82b8d;
      expv[15] = 66'h29e73717d2020b081;
      expv[16] = 66'h062c5b293e385b2c7;
      expv[17] = 66'h15e1d5c6ca7d61ee9;
      expv[18] = 66'h29ee6177a821184be;
      expv[19] = 66'h29be5874ee23a0954;
      expv[20] = 66'h1b2cf9bbd9e0b695f;
      expv[21] = 66'h36aae990b54cfa67b;
      expv[22] = 66'h1124690b26546bcd2;
      expv[23] = 66'h1f68aaea23116302b;
      expv[24] = 66'h321baaf6a38e7cb17;
      expv[25] = 66'h2653e7244384b1b8a;
      expv[26] = 66'h0e2acadfc131630ce;
      expv[27] = 66'h351215496812cba00;
      expv[28] = 66'h0e0fcbc98acaa0a63;
      expv[29] = 66'h2d725959a2a71b7b3;
      expv[30] = 66'h21e370bcdd5c00e95;
      expv[31] = 66'h3e38bfde40582b94e;
      expv[32] = 66'h37a54d78e7e22614a;
      expv[33] = 66'h39723243e6d965686;
      expv[34] = 66'h0fed02be4977023fe;
      expv[35] = 66'h1c2307c9e88358bab;
      expv[36] = 66'h2799a9bfe15362b5d;
      expv[37] = 66'h1734b66f9b3e125dc;
      expv[38] = 66'h020e86b200764dee1;
      expv[39] = 66'h0d020dfd21ec6912a;
      expv[40] = 66'h065a089364a2ea159;
      expv[41] = 66'h257eb29b5eb3968fa;
      expv[42] = 66'h10e2eea77b70b5ac0;
      expv[43] = 66'h3433c1ee91d6fda0f;
      expv[44] = 66'h275d93f8ac6176585;
      expv[45] = 66'h331e4c6f10c00d947;
      expv[46] = 66'h12663c7f0d7b5766e;
      expv[47] = 66'h3e71befff60549b2e;
      expv[48] = 66'h27b6e876fa17ecaca;
      expv[49] = 66'h39c165046053c4876;
      expv[50] = 66'h3c78613ae8df27333;
      expv[51] = 66'h0852aa1aeeac9b314;
      expv[52] = 66'h3e20baddfe57180d2;
      expv[53] = 66'h0a196a4c39703b4ab;
      expv[54] = 66'h0a8fcffedd0543314;
      expv[55] = 66'h1ee7c93563d582508;
      expv[56] = 66'h26fda0fb580a3272f;
      expv[57] = 66'h0f03c68c9cbfe0dc7;
      expv[58] = 66'h042898ee5a3103644;
      expv[59] = 66'h3c5364e72b71fb64e;
      expv[60] = 66'h301b100e7e4cd9113;
      expv[61] = 66'h3252e5d4b9f686345;
      expv[62] = 66'h005d3544717a3aeb0;
      expv[63] = 66'h09b012c3e79938b84;
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
