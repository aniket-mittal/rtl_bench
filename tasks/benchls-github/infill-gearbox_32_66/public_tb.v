// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_32_66 dut (
    .clk(clk),
    .arst(in_vec[34:34]),
    .din(in_vec[33:2]),
    .din_valid(in_vec[1:1]),
    .slip_to_frame(in_vec[0:0]),
    .dout(out_vec[73:8]),
    .dout_valid(out_vec[7:7]),
    .slip_count(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h60fc78161;
    stim[1] = 35'h569d5a49d;
    stim[2] = 35'h0a91f6765;
    stim[3] = 35'h13d6d7ca1;
    stim[4] = 35'h1a04616fc;
    stim[5] = 35'h0543a1761;
    stim[6] = 35'h1ee34391b;
    stim[7] = 35'h079108aae;
    stim[8] = 35'h37a41c9b1;
    stim[9] = 35'h1afeaf4a6;
    stim[10] = 35'h0f20d65d4;
    stim[11] = 35'h0eedd02d0;
    stim[12] = 35'h066f41442;
    stim[13] = 35'h041f0ab72;
    stim[14] = 35'h301b8c1bf;
    stim[15] = 35'h1283432ee;
    stim[16] = 35'h0aec752a5;
    stim[17] = 35'h1422a7723;
    stim[18] = 35'h3f2e2986e;
    stim[19] = 35'h36e151b51;
    stim[20] = 35'h0168663f9;
    stim[21] = 35'h2e28e444c;
    stim[22] = 35'h048d2ea20;
    stim[23] = 35'h1c6203cd3;
    stim[24] = 35'h09ecad82e;
    stim[25] = 35'h06f1e004e;
    stim[26] = 35'h187bc5b65;
    stim[27] = 35'h343ed2ec7;
    stim[28] = 35'h2d4c91bf9;
    stim[29] = 35'h115910425;
    stim[30] = 35'h105ee0dec;
    stim[31] = 35'h39eb10f87;
    stim[32] = 35'h15625fe22;
    stim[33] = 35'h1cc8c0aa0;
    stim[34] = 35'h2bff1350f;
    stim[35] = 35'h36ba572b9;
    stim[36] = 35'h2ad1fc22d;
    stim[37] = 35'h3511aae84;
    stim[38] = 35'h1ee71aaac;
    stim[39] = 35'h2c5cb4a80;
    stim[40] = 35'h34220c40e;
    stim[41] = 35'h127953db1;
    stim[42] = 35'h33fb0406f;
    stim[43] = 35'h010faf9ab;
    stim[44] = 35'h028ee835d;
    stim[45] = 35'h340fddacb;
    stim[46] = 35'h37f7f36a1;
    stim[47] = 35'h0a29baea7;
    stim[48] = 35'h0cd04febf;
    stim[49] = 35'h3b275690d;
    stim[50] = 35'h18f19c2a0;
    stim[51] = 35'h0de89efce;
    stim[52] = 35'h3942f5706;
    stim[53] = 35'h178903b4c;
    stim[54] = 35'h0fb22005c;
    stim[55] = 35'h16251e06e;
    stim[56] = 35'h0a80b9d19;
    stim[57] = 35'h019efa031;
    stim[58] = 35'h2d08c71d1;
    stim[59] = 35'h173e37be4;
    stim[60] = 35'h2dddbf79d;
    stim[61] = 35'h041fa4c49;
    stim[62] = 35'h06e858448;
    stim[63] = 35'h1973a6105;
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
      expv[0] = 74'h0000000000000000000;
      expv[1] = 74'h0000000000000000000;
      expv[2] = 74'h0000000000000000000;
      expv[3] = 74'h0000000000000000000;
      expv[4] = 74'h0000000000000000000;
      expv[5] = 74'h0000000000000000000;
      expv[6] = 74'h0000000000000000000;
      expv[7] = 74'h0f71a1c8c0000000000;
      expv[8] = 74'h2f71a1c8c0000000000;
      expv[9] = 74'h2f71a1c8d7b8d0e4600;
      expv[10] = 74'h11e4422ab7b8d0e4680;
      expv[11] = 74'h11e4422ab7b8d0e4600;
      expv[12] = 74'h11e4422ab7b8d0e4600;
      expv[13] = 74'h035fd5e957b8d0e4600;
      expv[14] = 74'h3066f41441afeaf4a80;
      expv[15] = 74'h1e20f855a1afeaf4a00;
      expv[16] = 74'h3bc06e306f107c2ad80;
      expv[17] = 74'h3bc06e306f107c2ad00;
      expv[18] = 74'h242506864f107c2ad00;
      expv[19] = 74'h06d422a772128343280;
      expv[20] = 74'h06d422a772128343200;
      expv[21] = 74'h06d422a772128343200;
      expv[22] = 74'h06d422a772128343200;
      expv[23] = 74'h06d422a772128343200;
      expv[24] = 74'h269f9714d2128343200;
      expv[25] = 74'h20b71880f34fcb8a680;
      expv[26] = 74'h00993d95b34fcb8a600;
      expv[27] = 74'h00993d95a04c9ecad00;
      expv[28] = 74'h2ec46f1e004c9ecad80;
      expv[29] = 74'h2ec46f1e004c9ecad00;
      expv[30] = 74'h2ec46f1e004c9ecad00;
      expv[31] = 74'h2ec46f1e004c9ecad00;
      expv[32] = 74'h07c3a1f6804c9ecad00;
      expv[33] = 74'h3f88e7ac43e1d0fb480;
      expv[34] = 74'h3f88e7ac43e1d0fb400;
      expv[35] = 74'h26a1aac4a3e1d0fb400;
      expv[36] = 74'h26a1aac4b350d562500;
      expv[37] = 74'h26a1aac4b350d562500;
      expv[38] = 74'h26a1aac4b350d562500;
      expv[39] = 74'h26a1aac4b350d562500;
      expv[40] = 74'h26a1aac4b350d562500;
      expv[41] = 74'h0c40ebff1350d562580;
      expv[42] = 74'h0c40ebff1350d562500;
      expv[43] = 74'h02037a111350d562500;
      expv[44] = 74'h2be6acfec101bd08881;
      expv[45] = 74'h2be6acfec101bd08801;
      expv[46] = 74'h3ddac821e101bd08801;
      expv[47] = 74'h3ddac821feed6410f02;
      expv[48] = 74'h26eba9a07eed6410f82;
      expv[49] = 74'h209fd7945eed6410f02;
      expv[50] = 74'h209fd794504febca202;
      expv[51] = 74'h209fd794504febca202;
      expv[52] = 74'h289efcccd04febca282;
      expv[53] = 74'h217ab826f04febca202;
      expv[54] = 74'h217ab826f0bd5c13702;
      expv[55] = 74'h217ab826f0bd5c13702;
      expv[56] = 74'h094781be50bd5c13782;
      expv[57] = 74'h094781be50bd5c13702;
      expv[58] = 74'h094781be50bd5c13702;
      expv[59] = 74'h094781be50bd5c13702;
      expv[60] = 74'h094781be50bd5c13702;
      expv[61] = 74'h094781be50bd5c13702;
      expv[62] = 74'h094781be50bd5c13702;
      expv[63] = 74'h094781be50bd5c13702;
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
