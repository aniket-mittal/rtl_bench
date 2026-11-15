// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_130206 dut (
    .clk(clk),
    .rst(in_vec[128:128]),
    .plaintext(in_vec[127:64]),
    .key(in_vec[63:0]),
    .ciphertext(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h102613b2add3babc6d34fa39bbfe8d669;
    stim[1] = 129'h13825d7d8906b5be513335747603eb9e6;
    stim[2] = 129'h012acbc50abf3a7e499b2df314c16ea28;
    stim[3] = 129'h0734771f31c9ddeb9c7061a1abb51dad8;
    stim[4] = 129'h0b4855429e8aba088b001cbe38f4366c5;
    stim[5] = 129'h01b049297ff4785c45d65807d62edf943;
    stim[6] = 129'h0bf91129d26bb70486099217f43f8631f;
    stim[7] = 129'h17a99ed39849d50a2cddad0725b4b4dee;
    stim[8] = 129'h08f981fff34d1584fa66a73bcfcb8242f;
    stim[9] = 129'h0bd8d6598125198d7790cc7e6e034c232;
    stim[10] = 129'h063d6162b3cbadb19a92a2bfe044da5ca;
    stim[11] = 129'h0254a5d7b745c2684ce6c8159e0ddf1b5;
    stim[12] = 129'h0af2fddf4e9ea0261e299428059c5d00c;
    stim[13] = 129'h0d8e8bf069dc9f5ca9f8cbadb0960682a;
    stim[14] = 129'h0863eae8780834b931d4938844af69989;
    stim[15] = 129'h010586f2a3923821732b6a9c3af1f0701;
    stim[16] = 129'h0b101171e03bbc7ec2c49dac64e9c34c1;
    stim[17] = 129'h058b9812d1e5478e85a461bda41d44477;
    stim[18] = 129'h0874826d342a9185baf077ebe07a1ed05;
    stim[19] = 129'h0e7cb3e20255c0c3f4dd010783733c188;
    stim[20] = 129'h0181ee0f1ba6c309c79f39478d8d63ff6;
    stim[21] = 129'h066ed80b0ddc529399d7382f995c4ce81;
    stim[22] = 129'h073796280a587bcfb0ef8f9a85705a439;
    stim[23] = 129'h0574b08d5093856f41975d80b741dcf98;
    stim[24] = 129'h02fd1472db4d34b2737913694971b428e;
    stim[25] = 129'h06bae09167c7eca6bb4cdf689c2faf9ef;
    stim[26] = 129'h05688ef41fa209c4047d818fc8f49b3f0;
    stim[27] = 129'h034d1e0b5b7acef5819c1f65f8f468484;
    stim[28] = 129'h06c34dedba97ab3b0dbf221675561972a;
    stim[29] = 129'h098cf9cc17cb8e4f49a56487092f86449;
    stim[30] = 129'h030207f6f94d051a4b7bd9e4fcd870567;
    stim[31] = 129'h0b9093e38eb620cb0d8ad7d533354cca7;
    stim[32] = 129'h0a5de5aed3e88ddad9807c16e25bd193a;
    stim[33] = 129'h08090894ee85ca10ca0b5d19d422163ae;
    stim[34] = 129'h0e06b6ab954ebd1184730ab840ce99497;
    stim[35] = 129'h00abb1705f748ba2be1281205fe92fe1f;
    stim[36] = 129'h00608891e5c7d5da85c4ade455c00b3c1;
    stim[37] = 129'h0e7de058b9db38048831b406f38548020;
    stim[38] = 129'h1d29e0e8fbc6e57c6697ec7db28a4ce80;
    stim[39] = 129'h0ac091e320dc86c8cb72223ebb4572224;
    stim[40] = 129'h0ff28695d3d3501fc0369d751677ba453;
    stim[41] = 129'h0585f3ddc4c14abfe3d5c34c38d49aa67;
    stim[42] = 129'h0e1431141729d1a4c811cd36d05b714f6;
    stim[43] = 129'h000e10b781b0f23c3489c4330b75c7724;
    stim[44] = 129'h00c511137273e4779815053dfda85adc6;
    stim[45] = 129'h060f2e8fb93547583276f9c98a5fa54e7;
    stim[46] = 129'h0faf09cae46a83911cf72decf25abd19e;
    stim[47] = 129'h039e7c8d46fd6922e7d07844d094a1381;
    stim[48] = 129'h04efcf3393db034f3e38d0f289b95b787;
    stim[49] = 129'h0f76b8589c0babacf6df93b6426a91fb7;
    stim[50] = 129'h0e0488c8117ac375c457fed8fb8168bce;
    stim[51] = 129'h08acebc46ce0e9672adc45df464464088;
    stim[52] = 129'h028f66a037fa1859b121121c0af11911f;
    stim[53] = 129'h0e542475864b507d4de36a58edfa2de38;
    stim[54] = 129'h0b9554ff345bf6ab994f9dd7f09640595;
    stim[55] = 129'h06df7971de04da74e1b83611eb018b079;
    stim[56] = 129'h0b1d0e65f8caacf57ddf594b63578c051;
    stim[57] = 129'h017530ea230ad9594e2d2a2bec563b711;
    stim[58] = 129'h04d7d22ae187ae61ab00881cd131c1f71;
    stim[59] = 129'h0b28627ac0fb1520c7e1f4f3e289acfcf;
    stim[60] = 129'h0e7aee94ee3d5baf9bcc04dde1258d062;
    stim[61] = 129'h0aabeaf868ee91469483568a4b73da8c9;
    stim[62] = 129'h01d51b7f1dfbae7dbdf16c2489c236a39;
    stim[63] = 129'h01cfcdc0b8e058dab0ca88d0e325a8b57;
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
      expv[4] = 64'h0000xxxxxxxxxxxx;
      expv[5] = 64'h0000xxxxxxxxxxxx;
      expv[6] = 64'h0000xxxxxxxxxxxx;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h000013335747603e;
      expv[11] = 64'h0000dee987353b75;
      expv[12] = 64'h000013335747603e;
      expv[13] = 64'h0000dee987353b75;
      expv[14] = 64'h000013335747603e;
      expv[15] = 64'h0000dee987353b75;
      expv[16] = 64'h000013335747603e;
      expv[17] = 64'h0000dee987353b75;
      expv[18] = 64'h000013335747603e;
      expv[19] = 64'h0000dee987353b75;
      expv[20] = 64'h000013335747603e;
      expv[21] = 64'h0000dee987353b75;
      expv[22] = 64'h000013335747603e;
      expv[23] = 64'h0000dee987353b75;
      expv[24] = 64'h000013335747603e;
      expv[25] = 64'h0000dee987353b75;
      expv[26] = 64'h000013335747603e;
      expv[27] = 64'h0000dee987353b75;
      expv[28] = 64'h000013335747603e;
      expv[29] = 64'h0000dee987353b75;
      expv[30] = 64'h000013335747603e;
      expv[31] = 64'h0000dee987353b75;
      expv[32] = 64'h000013335747603e;
      expv[33] = 64'h0000dee987353b75;
      expv[34] = 64'h000013335747603e;
      expv[35] = 64'h0000dee987353b75;
      expv[36] = 64'h000013335747603e;
      expv[37] = 64'h0000dee987353b75;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000cddad0725b4b;
      expv[42] = 64'h0000a4a417a973ef;
      expv[43] = 64'h0000cddad0725b4b;
      expv[44] = 64'h0000a4a417a973ef;
      expv[45] = 64'h0000cddad0725b4b;
      expv[46] = 64'h0000a4a417a973ef;
      expv[47] = 64'h0000cddad0725b4b;
      expv[48] = 64'h0000a4a417a973ef;
      expv[49] = 64'h0000cddad0725b4b;
      expv[50] = 64'h0000a4a417a973ef;
      expv[51] = 64'h0000cddad0725b4b;
      expv[52] = 64'h0000a4a417a973ef;
      expv[53] = 64'h0000cddad0725b4b;
      expv[54] = 64'h0000a4a417a973ef;
      expv[55] = 64'h0000cddad0725b4b;
      expv[56] = 64'h0000a4a417a973ef;
      expv[57] = 64'h0000cddad0725b4b;
      expv[58] = 64'h0000a4a417a973ef;
      expv[59] = 64'h0000cddad0725b4b;
      expv[60] = 64'h0000a4a417a973ef;
      expv[61] = 64'h0000cddad0725b4b;
      expv[62] = 64'h0000a4a417a973ef;
      expv[63] = 64'h0000cddad0725b4b;
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
