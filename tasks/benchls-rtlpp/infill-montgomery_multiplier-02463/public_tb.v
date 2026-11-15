// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02463 dut (
    .clk(clk),
    .mpand(in_vec[97:66]),
    .mplier(in_vec[65:34]),
    .modulus(in_vec[33:2]),
    .ds(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .product(out_vec[32:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h3881878f67d1e9aff96c4de69;
    stim[1] = 98'h2d046d3c5b64228e72fc5d73b;
    stim[2] = 98'h3c5ae83a1fff4aa5727427150;
    stim[3] = 98'h1a71ac4fed7f865068a934e46;
    stim[4] = 98'h11af4ae33d1e062a309c14aca;
    stim[5] = 98'h0efb5e2bf937c7ce5adb57ab4;
    stim[6] = 98'h1f26dcec15ecad4f9f2e99706;
    stim[7] = 98'h1de7d5e540303b03893fe1c8a;
    stim[8] = 98'h3f8a2a3d3894e2fe9fca5554a;
    stim[9] = 98'h013596dcc833e78a564353d18;
    stim[10] = 98'h2bedeb32660bcb31c97374cec;
    stim[11] = 98'h021ab12f4ed0d9683084ff206;
    stim[12] = 98'h1ca1ca6513c786e4b2414ea7c;
    stim[13] = 98'h17c323bcb7c01407d713d5bb6;
    stim[14] = 98'h3b3f71363c68a49b9f3e3ccf6;
    stim[15] = 98'h20a44c0009f4a5105f81fe9e0;
    stim[16] = 98'h0af61833df705c72debaab516;
    stim[17] = 98'h38a5b4e1c0d1e4c7551d03ca8;
    stim[18] = 98'h265295d10a51ede5cd1c314e7;
    stim[19] = 98'h21d9f82ed162dbe9161a80c34;
    stim[20] = 98'h2c7554103229e3f560a65b0f0;
    stim[21] = 98'h39dcd32b1ae4a141f99b5bef4;
    stim[22] = 98'h380ca5d3f29a28d1322b9e6f6;
    stim[23] = 98'h11152e09cdcbab3a980cffcd6;
    stim[24] = 98'h14538465593b3bca38fcbb32a;
    stim[25] = 98'h21734e4549c49abc4ddcfd5ba;
    stim[26] = 98'h2b52c1d013f4cba69f928b5cc;
    stim[27] = 98'h15e6c405ff74c688127743e2e;
    stim[28] = 98'h070df15f33e5e200945b73e96;
    stim[29] = 98'h32c4ef19a02a8d9847a16b36e;
    stim[30] = 98'h205d82061173d6c21303b2c8e;
    stim[31] = 98'h1003e3f686e9331868d96d96a;
    stim[32] = 98'h35839ca3f60ed2c236397379a;
    stim[33] = 98'h0529407dec10eb93761276ad6;
    stim[34] = 98'h0aacc4ae103561c640a911848;
    stim[35] = 98'h34d0bdcd2d411fb9e80764478;
    stim[36] = 98'h00124788d994a0c6159a18aa0;
    stim[37] = 98'h2808b468ef110b6d1293e0894;
    stim[38] = 98'h2b7e711b76d6fa8743985be2a;
    stim[39] = 98'h2c654188f51003629636eb906;
    stim[40] = 98'h1ebc5672675a563826a6dc970;
    stim[41] = 98'h28201a32b0942e42ae306ecd8;
    stim[42] = 98'h1ceb667a3c596e71d05c5b67a;
    stim[43] = 98'h18696456771a312026cbc2dbc;
    stim[44] = 98'h26834f6178f4545fe7195af24;
    stim[45] = 98'h16f6e7ccf8c1095804793d17e;
    stim[46] = 98'h2c14b4916527efb3e128f51b6;
    stim[47] = 98'h33527828d7f047d9b56ffccf0;
    stim[48] = 98'h255d1b43fad19c941f3e2be40;
    stim[49] = 98'h114ebdcace8c0ddddf1ec1658;
    stim[50] = 98'h0adfcebeae8c5fd0e3e91bffc;
    stim[51] = 98'h06b3e2b3057872a78ef338906;
    stim[52] = 98'h22710138e703a670caf7f4540;
    stim[53] = 98'h3a3f0299eaf25e996aa6a6554;
    stim[54] = 98'h1757e3620f8e4ee7b2cbb16b0;
    stim[55] = 98'h12ae537b46838bfb0e026840c;
    stim[56] = 98'h0de5fb94d5a70046f03d5b0d8;
    stim[57] = 98'h1614df7dda998e7473ea87798;
    stim[58] = 98'h2d2860c71ff926603bb6d5dee;
    stim[59] = 98'h082a711a68e212a606c1b0f30;
    stim[60] = 98'h377d9ea318b3b4da7bf67380a;
    stim[61] = 98'h1376f4b479cde07de2965acac;
    stim[62] = 98'h0863accc093897d91319ffb32;
    stim[63] = 98'h01ba09b077d9d3d618fcc0d60;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'h0d38d627e;
      expv[5] = 33'h0d38d627e;
      expv[6] = 33'h0d38d627e;
      expv[7] = 33'h0d38d627e;
      expv[8] = 33'h0d38d627e;
      expv[9] = 33'h0d38d627e;
      expv[10] = 33'h058d0966a;
      expv[11] = 33'h058d0966a;
      expv[12] = 33'h0f870b45e;
      expv[13] = 33'h0f870b45e;
      expv[14] = 33'h0f870b45e;
      expv[15] = 33'h0e04b0776;
      expv[16] = 33'h0afffada6;
      expv[17] = 33'h0afffada6;
      expv[18] = 33'h0afffada7;
      expv[19] = 33'h0afffada7;
      expv[20] = 33'h0afffada7;
      expv[21] = 33'h0afffada7;
      expv[22] = 33'h0afffada7;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h0bc20ec90;
      expv[26] = 33'h0bc20ec90;
      expv[27] = 33'h0bc20ec90;
      expv[28] = 33'h0bc20ec90;
      expv[29] = 33'h184a50d3a;
      expv[30] = 33'h184a50d3a;
      expv[31] = 33'h183fba8ee;
      expv[32] = 33'h182a8e056;
      expv[33] = 33'h182a8e056;
      expv[34] = 33'h182a8e056;
      expv[35] = 33'h182a8e056;
      expv[36] = 33'h16d7c56d6;
      expv[37] = 33'h16d7c56d6;
      expv[38] = 33'h118ca30d6;
      expv[39] = 33'h118ca30d6;
      expv[40] = 33'h118ca30d6;
      expv[41] = 33'h118ca30d6;
      expv[42] = 33'h081beab44;
      expv[43] = 33'h081beab44;
      expv[44] = 33'h1484a7bf0;
      expv[45] = 33'h1440529ce;
      expv[46] = 33'h1440529ce;
      expv[47] = 33'h1440529ce;
      expv[48] = 33'h121da98be;
      expv[49] = 33'h121da98be;
      expv[50] = 33'h09930547e;
      expv[51] = 33'h09930547e;
      expv[52] = 33'h09930547e;
      expv[53] = 33'h107f50cec;
      expv[54] = 33'h054218a4e;
      expv[55] = 33'h054218a4e;
      expv[56] = 33'h054218a4f;
      expv[57] = 33'h054218a4f;
      expv[58] = 33'h054218a4f;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
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
