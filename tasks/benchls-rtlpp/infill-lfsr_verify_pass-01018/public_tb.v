// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01018 dut (
    .clk(clk),
    .arst(in_vec[61:61]),
    .verify(in_vec[60:60]),
    .load(in_vec[59:59]),
    .load_d(in_vec[58:1]),
    .evolve(in_vec[0:0]),
    .q(out_vec[65:2]),
    .verify_fail(out_vec[1:1]),
    .verify_pass(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h25ce4128ba71b6a3;
    stim[1] = 62'h3cab71bb11be8a36;
    stim[2] = 62'h0765f49099ec57b6;
    stim[3] = 62'h08745e54a78388ca;
    stim[4] = 62'h0fdc04cdf97185dc;
    stim[5] = 62'h11ad7207056c1722;
    stim[6] = 62'h16ec2ff936ef2078;
    stim[7] = 62'h09a2b1b9fc62fecf;
    stim[8] = 62'h1411723cf79ca021;
    stim[9] = 62'h0739ba3b8c1bbe34;
    stim[10] = 62'h063917f03ba8457b;
    stim[11] = 62'h0dfd82bcad9aa949;
    stim[12] = 62'h19b77cdea0bde6b0;
    stim[13] = 62'h1974a43f5510329b;
    stim[14] = 62'h18e7bda4818cbee1;
    stim[15] = 62'h0271a9935c967c73;
    stim[16] = 62'h096cd624fa2ba869;
    stim[17] = 62'h04d146b38f22d96a;
    stim[18] = 62'h10b0eea77f337201;
    stim[19] = 62'h177f58961a1f6bef;
    stim[20] = 62'h074ddc48fb249262;
    stim[21] = 62'h0e3086fdb0868b19;
    stim[22] = 62'h175e8ebab285c0c7;
    stim[23] = 62'h0ed014fad14b99f3;
    stim[24] = 62'h0a623136594db297;
    stim[25] = 62'h1a741fafe7bc03df;
    stim[26] = 62'h1787f66ff0a41f33;
    stim[27] = 62'h2b037aa1105ce4dd;
    stim[28] = 62'h10838e00d2f78126;
    stim[29] = 62'h0f28d2ccf694d523;
    stim[30] = 62'h1c41b5a26c3eb27d;
    stim[31] = 62'h0ece150cee14e8b1;
    stim[32] = 62'h03d1e14a226ab94c;
    stim[33] = 62'h1a9ede03230c9ccf;
    stim[34] = 62'h0f4a5fcb6b25fca2;
    stim[35] = 62'h06adac7183cf80ee;
    stim[36] = 62'h02dbcfc1da101d09;
    stim[37] = 62'h1fde3b4be319f897;
    stim[38] = 62'h0d65da3dbe96b71b;
    stim[39] = 62'h0a94d50e505f4e40;
    stim[40] = 62'h1df7104039ef801e;
    stim[41] = 62'h0414e4133b49c570;
    stim[42] = 62'h1db8af899dd0613f;
    stim[43] = 62'h09dd277bf03cb270;
    stim[44] = 62'h09374971e975fb3a;
    stim[45] = 62'h1de5fea80d14c68f;
    stim[46] = 62'h2bb9a1eb1d4c72b7;
    stim[47] = 62'h092b54cdd9fdf17f;
    stim[48] = 62'h273709257982f957;
    stim[49] = 62'h09ce58f2d387d1cf;
    stim[50] = 62'h097604765865e656;
    stim[51] = 62'h1c5e0642f858f354;
    stim[52] = 62'h08ff032288b960ec;
    stim[53] = 62'h13eddf424aefaa87;
    stim[54] = 62'h16d205cc5a6cd663;
    stim[55] = 62'h072368acf5686937;
    stim[56] = 62'h1f4da70013b9ee47;
    stim[57] = 62'h118a35f09c155b06;
    stim[58] = 62'h2d1a2825fdc50d96;
    stim[59] = 62'h1da25fbc6d2e3fba;
    stim[60] = 62'h1768b2ebf8d1100c;
    stim[61] = 62'h1db64dcb972a8058;
    stim[62] = 62'h06da6ac1cfe082c6;
    stim[63] = 62'h092a8f559464fe90;
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
      expv[0] = 66'h123456789abcdef84;
      expv[1] = 66'h123456789abcdef84;
      expv[2] = 66'h123456789abcdef84;
      expv[3] = 66'h123456789abcdef84;
      expv[4] = 66'h03a2f2a53c1c46558;
      expv[5] = 66'h3ee0266fcb8c2ee34;
      expv[6] = 66'h3ee0266fcb8c2ee36;
      expv[7] = 66'h3ee0266fcb8c2ee36;
      expv[8] = 66'h0d158dcfe317f678c;
      expv[9] = 66'h1aa55c143448d48ea;
      expv[10] = 66'h1aa55c143448d48e8;
      expv[11] = 66'h013f94a40f375c890;
      expv[12] = 66'h2fec15e56cd54a400;
      expv[13] = 66'h0dbbe6f505ef358ea;
      expv[14] = 66'h0ba521faa88194d12;
      expv[15] = 66'h073ded240c65f70ba;
      expv[16] = 66'h076382ed0e7305e40;
      expv[17] = 66'h0b66b127d15d43408;
      expv[18] = 66'h0b66b127d15d43408;
      expv[19] = 66'h160ef372d67ccdc36;
      expv[20] = 66'h2610252e19ff5093e;
      expv[21] = 66'h2610252e19ff5093c;
      expv[22] = 66'h318437ed843458c38;
      expv[23] = 66'h3a0593d08a623bc92;
      expv[24] = 66'h3680a7d68a5ccf920;
      expv[25] = 66'h131189b2ca6d94b78;
      expv[26] = 66'h13a0fd7f3de01efe2;
      expv[27] = 66'h123456789abcdef84;
      expv[28] = 66'h123456789abcdef84;
      expv[29] = 66'h123456789abcdef86;
      expv[30] = 66'h39469667b4a6a9128;
      expv[31] = 66'h220dad1361f593e2a;
      expv[32] = 66'h3670a86770a7458d4;
      expv[33] = 66'h3670a86770a7458d4;
      expv[34] = 66'h14f6f0191864e6752;
      expv[35] = 66'h3a52fe5b592fe5120;
      expv[36] = 66'h3a52fe5b592fe5120;
      expv[37] = 66'h220dc91c6fbd5f1a8;
      expv[38] = 66'h3ef1da5f18cfc4bb2;
      expv[39] = 66'h2b2ed1edf4b5b8d90;
      expv[40] = 66'h14a6a87282fa7205c;
      expv[41] = 66'h2fb88201cf7c00ffe;
      expv[42] = 66'h2fb88201cf7c00ffc;
      expv[43] = 66'h2dc57c4cee8309f3e;
      expv[44] = 66'h0ee93bdf81e593840;
      expv[45] = 66'h09ba4b8f4bafd9d54;
      expv[46] = 66'h123456789abcdef84;
      expv[47] = 66'h123456789abcdef84;
      expv[48] = 66'h123456789abcdef84;
      expv[49] = 66'h123456789abcdef84;
      expv[50] = 66'h0e72c7969c3e8e7c8;
      expv[51] = 66'h0bb023b2c32f32b58;
      expv[52] = 66'h22f03217c2c79aaca;
      expv[53] = 66'h07f8191445cb0763c;
      expv[54] = 66'h168dd31fb56cc353a;
      expv[55] = 66'h1c1e1e6bfc08e8dbe;
      expv[56] = 66'h107f8b2eb59ac9e24;
      expv[57] = 66'h3a6d38009dcf723ea;
      expv[58] = 66'h123456789abcdef84;
      expv[59] = 66'h123456789abcdef84;
      expv[60] = 66'h2d12fde36971fdd0a;
      expv[61] = 66'h2d12fde36971fdd0a;
      expv[62] = 66'h2db26e5cb95402c7e;
      expv[63] = 66'h2db26e5cb95402c7c;
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
