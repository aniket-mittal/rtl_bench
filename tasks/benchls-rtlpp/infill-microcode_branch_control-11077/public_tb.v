// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11077 dut (
    .clk(clk),
    .state_fetch(in_vec[152:152]),
    .ob(in_vec[151:120]),
    .r(in_vec[119:88]),
    .alu(in_vec[87:55]),
    .ir(in_vec[54:6]),
    .aeqm(in_vec[5:5]),
    .destintctl(in_vec[4:4]),
    .nopa(in_vec[3:3]),
    .sintr(in_vec[2:2]),
    .vmaok(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .int_enable(out_vec[4:4]),
    .jcond(out_vec[3:3]),
    .lc_byte_mode(out_vec[2:2]),
    .prog_unibus_reset(out_vec[1:1]),
    .sequence_break(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h172cb55ac9fad6700718d77288178c44c8f5267;
    stim[1] = 153'h0fabd9235a4eb6d2617313b6324a2e7b5a313d1;
    stim[2] = 153'h0e57f7b0a6de0a5a8bd892cd1dd5d3812feb51a;
    stim[3] = 153'h003c2ede638e94c3e786afb3ff17b7f314b1638;
    stim[4] = 153'h03b9ec1eaa8e1afa328152d68189150b8ffcde2;
    stim[5] = 153'h18b203968f8e169c16cf764f29416aa9fcc8e12;
    stim[6] = 153'h1004aff50573053d426de7b50568408e6335e40;
    stim[7] = 153'h04543910b0d2e49347f97e82fe5a2feb19777ec;
    stim[8] = 153'h05783dfc35432ead48726b492f65721b5113eca;
    stim[9] = 153'h13d5dc35908103b69f2bb831440c923d07f5ef8;
    stim[10] = 153'h0a0ff7453a379788196a6242f5ed6c656353976;
    stim[11] = 153'h14259d35650fc9fb933aefc334461d1e8f9925c;
    stim[12] = 153'h02eb07f57abe6c524d64b11a19f1bc5aa664d18;
    stim[13] = 153'h0e34e5e03aea8431cd7d4f9d1dc03adfe7a5f56;
    stim[14] = 153'h190ce12d9e0c7201bb3cd86089a1fbcc526e568;
    stim[15] = 153'h18446aec8fcc1dbe6ee1c5f44a260026c90f8fc;
    stim[16] = 153'h015dafadf99ce140b9b8453755317900a5b0b7c;
    stim[17] = 153'h0808212d5bdb4a31759a15f572ac6de7ab57016;
    stim[18] = 153'h0df8289cf070d9e83e7e851c71fb0fc99d5ec08;
    stim[19] = 153'h0b43ac42ab7f01aeb5924a6c54915a560c6e8f6;
    stim[20] = 153'h1c46a04246d8bf1b728a7a5da8c97461afbc984;
    stim[21] = 153'h07e8622cadf9e274e598071f76f92b411bd1576;
    stim[22] = 153'h17c8663109a54bcbf55b963b3f0b8577872d48e;
    stim[23] = 153'h0f1bb3d3385cdfab133a4c848e32b571f066870;
    stim[24] = 153'h0bb638d1f5ca7925aac3d2b6188269da8cb7ae0;
    stim[25] = 153'h0d3924d7b99654429421bf4e3461bcac54e5b6a;
    stim[26] = 153'h08d375c01ac93576742eb1261223a1e398424e8;
    stim[27] = 153'h13245b828e8d04d5490265b8b338a1b9b8d1380;
    stim[28] = 153'h0cf338a0bd6261ed93ee637f4bae8bb8294990e;
    stim[29] = 153'h1f45ac8b536c72598b8fe053a69422f367b0892;
    stim[30] = 153'h0c356962d3f58ec67787b1b65413bc52e1aa942;
    stim[31] = 153'h10386baf7d7fc4c84a950eb6d554585b5daba50;
    stim[32] = 153'h10b38df8ebd6814ca943e1b68c898057f800fc8;
    stim[33] = 153'h05c6c18d90f6744e9caacdf8c439c1a1d92c47e;
    stim[34] = 153'h165e46bdb6ef2347e513dd65f87840ecbe3cea0;
    stim[35] = 153'h167dfc794da8ff38e54e4bffef25284cab9cf0e;
    stim[36] = 153'h130b0a973ea846f82e2a779eccf7fa63586a5de;
    stim[37] = 153'h197dd830ee5b82c70a8a0a126491bc345776baa;
    stim[38] = 153'h0882cf3ffc9cd7669b6201e14c613c81f0ff47a;
    stim[39] = 153'h1b69b83703a4ed3f1e85269184d8b8559287752;
    stim[40] = 153'h0a3b68cbda0e9537c983434ff66c54dea988604;
    stim[41] = 153'h13984429811a63a4f503fe1f76d99b9973215d5;
    stim[42] = 153'h09383aee6743df695462102c37a6bc454c3c314;
    stim[43] = 153'h1849e6d043339895d59bddf00a817c775ac7186;
    stim[44] = 153'h1001401a45438cd71919cd9f5acda1268e3f3a6;
    stim[45] = 153'h16f4d8780cf65edf2ba65bffdbc75a99944c57a;
    stim[46] = 153'h1e7928998e682472330c2b1f058cee7aa77a6ec;
    stim[47] = 153'h02680b0ff80400e4a23ebc073378579274f4628;
    stim[48] = 153'h162672786488d9b8f0accd9d843c2c624c369a8;
    stim[49] = 153'h012301e535e189014be5e116f34d74698c105fc;
    stim[50] = 153'h1d0520b92f7857f419853a62ffab297c7f59764;
    stim[51] = 153'h0b9c377cb3740ba119c33377dcedbb3fb2a57d8;
    stim[52] = 153'h1ec6ed12d01b7fb86ff7f70543ef739d247d2fe;
    stim[53] = 153'h0549a152a24ee3f7f5d2bfdb7edb187e06999c4;
    stim[54] = 153'h16abc7428ffa0aa4856cb3b52e3b8861d2c9938;
    stim[55] = 153'h08b1a290a0f71475f9a21cb6b0585c436790cf8;
    stim[56] = 153'h1bb3a1beb0773365fbc364cd38b68afd47af62c;
    stim[57] = 153'h0e8d30032146fb8986af061d9a9bc0eba845fcc;
    stim[58] = 153'h09166146f6c8dad140221870ff02535c25dfb40;
    stim[59] = 153'h04c16d6eaee34d2a345972c2784daab1c376d20;
    stim[60] = 153'h0ec5bb5a81fb08daf36c8ab33ba4b9807f0e3e6;
    stim[61] = 153'h04b4b76a5d5e6cd9c41580d99e68defd7597975;
    stim[62] = 153'h1466f2a111f89efe1c53f5cab96422595f293f6;
    stim[63] = 153'h1a7ca484a229a1243f753bc956e3f9d09a7e0ee;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h08;
      expv[5] = 5'h08;
      expv[6] = 5'h10;
      expv[7] = 5'h10;
      expv[8] = 5'h10;
      expv[9] = 5'h18;
      expv[10] = 5'h1f;
      expv[11] = 5'h1f;
      expv[12] = 5'h08;
      expv[13] = 5'h00;
      expv[14] = 5'h08;
      expv[15] = 5'h08;
      expv[16] = 5'h09;
      expv[17] = 5'h09;
      expv[18] = 5'h09;
      expv[19] = 5'h09;
      expv[20] = 5'h09;
      expv[21] = 5'h01;
      expv[22] = 5'h09;
      expv[23] = 5'h01;
      expv[24] = 5'h09;
      expv[25] = 5'h01;
      expv[26] = 5'h09;
      expv[27] = 5'h01;
      expv[28] = 5'h01;
      expv[29] = 5'h09;
      expv[30] = 5'h07;
      expv[31] = 5'h0f;
      expv[32] = 5'h08;
      expv[33] = 5'h08;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h06;
      expv[38] = 5'h0e;
      expv[39] = 5'h0e;
      expv[40] = 5'h07;
      expv[41] = 5'h0f;
      expv[42] = 5'h08;
      expv[43] = 5'h08;
      expv[44] = 5'h08;
      expv[45] = 5'h00;
      expv[46] = 5'h1d;
      expv[47] = 5'h15;
      expv[48] = 5'h1d;
      expv[49] = 5'h15;
      expv[50] = 5'h1d;
      expv[51] = 5'h1d;
      expv[52] = 5'h15;
      expv[53] = 5'h1d;
      expv[54] = 5'h1d;
      expv[55] = 5'h1c;
      expv[56] = 5'h1c;
      expv[57] = 5'h1c;
      expv[58] = 5'h1c;
      expv[59] = 5'h1c;
      expv[60] = 5'h1c;
      expv[61] = 5'h1c;
      expv[62] = 5'h08;
      expv[63] = 5'h09;
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
