// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 512;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063143 dut (
    .clk(clk),
    .clr(in_vec[48:48]),
    .R0_in(in_vec[47:47]),
    .R1_in(in_vec[46:46]),
    .R2_in(in_vec[45:45]),
    .R3_in(in_vec[44:44]),
    .R4_in(in_vec[43:43]),
    .R5_in(in_vec[42:42]),
    .R6_in(in_vec[41:41]),
    .R7_in(in_vec[40:40]),
    .R8_in(in_vec[39:39]),
    .R9_in(in_vec[38:38]),
    .R10_in(in_vec[37:37]),
    .R11_in(in_vec[36:36]),
    .R12_in(in_vec[35:35]),
    .R13_in(in_vec[34:34]),
    .R14_in(in_vec[33:33]),
    .R15_in(in_vec[32:32]),
    .BusMuxOut(in_vec[31:0]),
    .BusMuxIn_R0(out_vec[511:480]),
    .BusMuxIn_R1(out_vec[479:448]),
    .BusMuxIn_R2(out_vec[447:416]),
    .BusMuxIn_R3(out_vec[415:384]),
    .BusMuxIn_R4(out_vec[383:352]),
    .BusMuxIn_R5(out_vec[351:320]),
    .BusMuxIn_R6(out_vec[319:288]),
    .BusMuxIn_R7(out_vec[287:256]),
    .BusMuxIn_R8(out_vec[255:224]),
    .BusMuxIn_R9(out_vec[223:192]),
    .BusMuxIn_R10(out_vec[191:160]),
    .BusMuxIn_R11(out_vec[159:128]),
    .BusMuxIn_R12(out_vec[127:96]),
    .BusMuxIn_R13(out_vec[95:64]),
    .BusMuxIn_R14(out_vec[63:32]),
    .BusMuxIn_R15(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0efe5e50da0ba;
    stim[1] = 49'h007ebbeea417e;
    stim[2] = 49'h18c63d7c3d07a;
    stim[3] = 49'h1b02f4e734f97;
    stim[4] = 49'h152c1e5785e2c;
    stim[5] = 49'h158b7e19066ac;
    stim[6] = 49'h1b6829e435501;
    stim[7] = 49'h164100972d0c3;
    stim[8] = 49'h1d16b33f96e58;
    stim[9] = 49'h1afb82a79e227;
    stim[10] = 49'h12290106b06b7;
    stim[11] = 49'h19b0f259ae38f;
    stim[12] = 49'h1605ae263c773;
    stim[13] = 49'h1be74aeb4c0f1;
    stim[14] = 49'h1c35fc3b243c2;
    stim[15] = 49'h184a8310264aa;
    stim[16] = 49'h13bcabf512019;
    stim[17] = 49'h0082af1cc7344;
    stim[18] = 49'h1102c8a055c69;
    stim[19] = 49'h1feb9b5c48470;
    stim[20] = 49'h18892de46e08a;
    stim[21] = 49'h1525df8717805;
    stim[22] = 49'h10787fcde45b7;
    stim[23] = 49'h1ea345a64b3ba;
    stim[24] = 49'h16b4d635e4da3;
    stim[25] = 49'h114a753f396d4;
    stim[26] = 49'h13e67238c6e10;
    stim[27] = 49'h148acb34bb43c;
    stim[28] = 49'h1a6af8ff260e9;
    stim[29] = 49'h1cffe64dc693f;
    stim[30] = 49'h10f6bad2d49ec;
    stim[31] = 49'h1f708a67c7090;
    stim[32] = 49'h165c00d8fe8c4;
    stim[33] = 49'h162c1c7de029f;
    stim[34] = 49'h1265283f7c555;
    stim[35] = 49'h160a1370a7cf8;
    stim[36] = 49'h1e4ebc64ab3c9;
    stim[37] = 49'h1ba9d5ad448d2;
    stim[38] = 49'h175752fbfc32b;
    stim[39] = 49'h1bd64ccccab14;
    stim[40] = 49'h100961a6e1ee9;
    stim[41] = 49'h1400ca63dff69;
    stim[42] = 49'h15dbb27c93e6f;
    stim[43] = 49'h14a4fc8001a29;
    stim[44] = 49'h1e6602bea79bb;
    stim[45] = 49'h1be2edf6de85b;
    stim[46] = 49'h1972b81da7461;
    stim[47] = 49'h1422fad9fe56c;
    stim[48] = 49'h1a55a75b05535;
    stim[49] = 49'h18c9550e8f391;
    stim[50] = 49'h145f499706757;
    stim[51] = 49'h1c0dd2f640391;
    stim[52] = 49'h1a0737e3faa34;
    stim[53] = 49'h108c1b4f69675;
    stim[54] = 49'h1a53fb0dd7dfc;
    stim[55] = 49'h1dcc85eb0112d;
    stim[56] = 49'h1f016a8014e68;
    stim[57] = 49'h1a464aaa1ee3d;
    stim[58] = 49'h108fe189bcebc;
    stim[59] = 49'h13f3a32cdb2c0;
    stim[60] = 49'h11bc4263df5fa;
    stim[61] = 49'h1a74691ef12cf;
    stim[62] = 49'h112372f66b7aa;
    stim[63] = 49'h143374075fee7;
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
      expv[0] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[1] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 512'hd7c3d07a000000000000000000000000d7c3d07ad7c3d07a000000000000000000000000d7c3d07ad7c3d07a000000000000000000000000d7c3d07ad7c3d07a;
      expv[4] = 512'h4e734f97000000004e734f974e734f97d7c3d07ad7c3d07a000000000000000000000000d7c3d07a4e734f97000000004e734f974e734f974e734f974e734f97;
      expv[5] = 512'h4e734f97e5785e2c4e734f97e5785e2cd7c3d07ad7c3d07ae5785e2c00000000e5785e2ce5785e2c4e734f97000000004e734f974e734f974e734f97e5785e2c;
      expv[6] = 512'h4e734f97e19066ac4e734f97e19066ace19066acd7c3d07ae5785e2c00000000e19066ace5785e2ce19066ace19066ac4e734f97e19066ace19066ace19066ac;
      expv[7] = 512'h9e435501e19066ac9e4355019e435501e19066ac9e4355019e435501000000009e435501e5785e2ce19066ace19066ac4e734f97e19066ac9e435501e19066ac;
      expv[8] = 512'h9e4355010972d0c30972d0c39e435501e19066ac0972d0c39e435501000000009e435501e5785e2ce19066ac0972d0c34e734f97e19066ac9e435501e19066ac;
      expv[9] = 512'h33f96e5833f96e580972d0c333f96e58e19066ac0972d0c39e43550133f96e589e43550133f96e5833f96e580972d0c333f96e58e19066ac33f96e5833f96e58;
      expv[10] = 512'h2a79e22733f96e582a79e22733f96e582a79e2272a79e2272a79e2272a79e2272a79e22733f96e582a79e2272a79e2272a79e227e19066ac33f96e5833f96e58;
      expv[11] = 512'h2a79e22733f96e58106b06b733f96e582a79e2272a79e227106b06b72a79e227106b06b733f96e582a79e227106b06b72a79e227e19066ac33f96e5833f96e58;
      expv[12] = 512'h259ae38f33f96e58106b06b7259ae38f259ae38f2a79e227259ae38f259ae38f106b06b733f96e582a79e227106b06b7259ae38f259ae38f259ae38f259ae38f;
      expv[13] = 512'h259ae38fe263c773e263c773259ae38f259ae38f2a79e227259ae38f259ae38f106b06b7e263c7732a79e227e263c773e263c773259ae38fe263c773259ae38f;
      expv[14] = 512'haeb4c0f1e263c773aeb4c0f1aeb4c0f1aeb4c0f1aeb4c0f1aeb4c0f1259ae38f106b06b7aeb4c0f1aeb4c0f1aeb4c0f1e263c773aeb4c0f1e263c773259ae38f;
      expv[15] = 512'hc3b243c2c3b243c2aeb4c0f1aeb4c0f1aeb4c0f1aeb4c0f1c3b243c2c3b243c2106b06b7c3b243c2aeb4c0f1c3b243c2c3b243c2c3b243c2c3b243c2c3b243c2;
      expv[16] = 512'h310264aac3b243c2aeb4c0f1aeb4c0f1aeb4c0f1310264aac3b243c2c3b243c2310264aac3b243c2310264aac3b243c2310264aac3b243c2c3b243c2c3b243c2;
      expv[17] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[18] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[19] = 512'h0000000000000000000000008a055c690000000000000000000000000000000000000000000000008a055c69000000008a055c698a055c690000000000000000;
      expv[20] = 512'hb5c48470b5c48470b5c48470b5c48470b5c48470b5c48470b5c4847000000000b5c4847000000000b5c48470b5c48470b5c484708a055c6900000000b5c48470;
      expv[21] = 512'hde46e08ab5c48470b5c48470b5c48470de46e08ab5c48470b5c4847000000000de46e08a00000000b5c48470de46e08ab5c484708a055c69de46e08ab5c48470;
      expv[22] = 512'hde46e08af8717805b5c48470f8717805de46e08ab5c48470f871780500000000de46e08af8717805b5c48470f8717805f8717805f8717805de46e08af8717805;
      expv[23] = 512'hde46e08af8717805b5c48470f8717805de46e08afcde45b7fcde45b7fcde45b7fcde45b7f8717805b5c48470f8717805f8717805fcde45b7fcde45b7fcde45b7;
      expv[24] = 512'h5a64b3ba5a64b3ba5a64b3baf87178055a64b3bafcde45b75a64b3bafcde45b7fcde45b7f87178055a64b3ba5a64b3baf87178055a64b3bafcde45b7fcde45b7;
      expv[25] = 512'h5a64b3ba635e4da3635e4da3f8717805635e4da3fcde45b7635e4da3635e4da3fcde45b7635e4da35a64b3ba5a64b3ba635e4da3635e4da3fcde45b7635e4da3;
      expv[26] = 512'h5a64b3ba635e4da3635e4da353f396d4635e4da353f396d4635e4da3635e4da353f396d4635e4da353f396d45a64b3ba635e4da353f396d453f396d453f396d4;
      expv[27] = 512'h5a64b3ba635e4da3238c6e10238c6e10238c6e10238c6e10238c6e10635e4da353f396d4238c6e10238c6e105a64b3ba635e4da3238c6e10238c6e10238c6e10;
      expv[28] = 512'h5a64b3bab34bb43c238c6e10238c6e10b34bb43c238c6e10238c6e10635e4da3b34bb43c238c6e10b34bb43c5a64b3bab34bb43cb34bb43c238c6e10238c6e10;
      expv[29] = 512'h8ff260e9b34bb43c8ff260e9238c6e10b34bb43c8ff260e98ff260e9635e4da38ff260e9238c6e108ff260e95a64b3ba8ff260e98ff260e98ff260e98ff260e9;
      expv[30] = 512'h64dc693f64dc693f8ff260e9238c6e1064dc693f64dc693f64dc693f64dc693f64dc693f64dc693f64dc693f64dc693f64dc693f64dc693f64dc693f8ff260e9;
      expv[31] = 512'h64dc693f64dc693f8ff260e9238c6e10ad2d49ecad2d49ecad2d49ecad2d49ec64dc693fad2d49ecad2d49ec64dc693fad2d49ec64dc693fad2d49ecad2d49ec;
      expv[32] = 512'ha67c7090a67c7090a67c7090a67c7090ad2d49eca67c7090a67c7090a67c709064dc693fad2d49ecad2d49ec64dc693fa67c709064dc693fad2d49ecad2d49ec;
      expv[33] = 512'ha67c70900d8fe8c40d8fe8c4a67c7090ad2d49ec0d8fe8c4a67c70900d8fe8c40d8fe8c40d8fe8c4ad2d49ec64dc693fa67c709064dc693fad2d49ecad2d49ec;
      expv[34] = 512'ha67c7090c7de029fc7de029fa67c7090ad2d49ec0d8fe8c4c7de029f0d8fe8c4c7de029fc7de029fad2d49ec64dc693fa67c709064dc693fad2d49ecc7de029f;
      expv[35] = 512'ha67c7090c7de029f83f7c555a67c7090ad2d49ec83f7c55583f7c5550d8fe8c4c7de029f83f7c555ad2d49ec83f7c555a67c709064dc693f83f7c555c7de029f;
      expv[36] = 512'ha67c7090370a7cf8370a7cf8a67c7090ad2d49ec83f7c55583f7c5550d8fe8c4370a7cf883f7c555370a7cf883f7c555a67c709064dc693f83f7c555370a7cf8;
      expv[37] = 512'hc64ab3c9c64ab3c9c64ab3c9a67c7090ad2d49ecc64ab3c983f7c5550d8fe8c4c64ab3c9c64ab3c9c64ab3c983f7c555c64ab3c964dc693fc64ab3c9c64ab3c9;
      expv[38] = 512'h5ad448d2c64ab3c95ad448d25ad448d25ad448d2c64ab3c95ad448d20d8fe8c45ad448d2c64ab3c9c64ab3c95ad448d25ad448d25ad448d2c64ab3c95ad448d2;
      expv[39] = 512'h5ad448d22fbfc32b2fbfc32b2fbfc32b5ad448d22fbfc32b5ad448d22fbfc32b5ad448d22fbfc32b2fbfc32b2fbfc32b5ad448d22fbfc32bc64ab3c92fbfc32b;
      expv[40] = 512'hccccab142fbfc32bccccab14ccccab14ccccab14ccccab145ad448d2ccccab145ad448d2ccccab14ccccab142fbfc32b5ad448d2ccccab14c64ab3c92fbfc32b;
      expv[41] = 512'hccccab142fbfc32bccccab14ccccab14ccccab14ccccab145ad448d2ccccab141a6e1ee9ccccab14ccccab141a6e1ee95ad448d21a6e1ee91a6e1ee92fbfc32b;
      expv[42] = 512'hccccab14a63dff69ccccab14ccccab14ccccab14ccccab145ad448d2ccccab141a6e1ee9ccccab14ccccab141a6e1ee9a63dff69a63dff691a6e1ee92fbfc32b;
      expv[43] = 512'hccccab1427c93e6fccccab1427c93e6f27c93e6f27c93e6f5ad448d227c93e6f27c93e6fccccab1427c93e6f27c93e6f27c93e6fa63dff6927c93e6f27c93e6f;
      expv[44] = 512'hccccab14c8001a29ccccab1427c93e6fc8001a2927c93e6fc8001a2927c93e6f27c93e6fc8001a2927c93e6f27c93e6fc8001a29c8001a29c8001a29c8001a29;
      expv[45] = 512'h2bea79bb2bea79bb2bea79bb27c93e6fc8001a292bea79bb2bea79bb27c93e6f27c93e6f2bea79bb2bea79bb27c93e6fc8001a29c8001a29c8001a29c8001a29;
      expv[46] = 512'hdf6de85b2bea79bbdf6de85bdf6de85bdf6de85bdf6de85bdf6de85b27c93e6f27c93e6f2bea79bbdf6de85b27c93e6fdf6de85bdf6de85bdf6de85bc8001a29;
      expv[47] = 512'h81da74612bea79bbdf6de85b81da7461df6de85b81da746181da746181da746127c93e6f2bea79bb81da746127c93e6f81da7461df6de85b81da746181da7461;
      expv[48] = 512'h81da7461ad9fe56cdf6de85b81da7461df6de85b81da7461ad9fe56c81da746127c93e6f2bea79bbad9fe56c27c93e6fad9fe56cad9fe56cad9fe56cad9fe56c;
      expv[49] = 512'h75b05535ad9fe56c75b0553581da7461df6de85b75b05535ad9fe56c75b0553527c93e6f75b05535ad9fe56c75b0553575b05535ad9fe56c75b05535ad9fe56c;
      expv[50] = 512'h50e8f391ad9fe56c75b0553581da746150e8f39150e8f391ad9fe56c75b0553550e8f39175b05535ad9fe56c50e8f39175b0553550e8f39175b0553550e8f391;
      expv[51] = 512'h50e8f3919970675775b0553581da746150e8f39199706757ad9fe56c997067579970675799706757997067579970675775b055359970675775b0553550e8f391;
      expv[52] = 512'h2f6403912f64039175b0553581da746150e8f39199706757ad9fe56c997067572f6403912f640391997067572f6403912f6403912f64039175b055352f640391;
      expv[53] = 512'h7e3faa342f6403917e3faa3481da746150e8f39199706757ad9fe56c997067572f6403917e3faa347e3faa347e3faa342f6403912f6403917e3faa347e3faa34;
      expv[54] = 512'h7e3faa342f6403917e3faa3481da7461b4f6967599706757ad9fe56c99706757b4f69675b4f696757e3faa347e3faa342f6403912f6403917e3faa34b4f69675;
      expv[55] = 512'hb0dd7dfc2f640391b0dd7dfc81da7461b4f69675b0dd7dfcad9fe56cb0dd7dfcb4f69675b4f69675b0dd7dfcb0dd7dfcb0dd7dfcb0dd7dfcb0dd7dfcb0dd7dfc;
      expv[56] = 512'h5eb0112d5eb0112db0dd7dfc5eb0112d5eb0112d5eb0112dad9fe56cb0dd7dfc5eb0112d5eb0112db0dd7dfcb0dd7dfc5eb0112db0dd7dfcb0dd7dfcb0dd7dfc;
      expv[57] = 512'ha8014e68a8014e68a8014e68a8014e685eb0112d5eb0112dad9fe56cb0dd7dfc5eb0112d5eb0112db0dd7dfca8014e685eb0112da8014e68a8014e68b0dd7dfc;
      expv[58] = 512'haaa1ee3da8014e68aaa1ee3da8014e685eb0112daaa1ee3dad9fe56cb0dd7dfc5eb0112daaa1ee3daaa1ee3da8014e685eb0112daaa1ee3da8014e68b0dd7dfc;
      expv[59] = 512'haaa1ee3da8014e68aaa1ee3da8014e68189bcebcaaa1ee3dad9fe56cb0dd7dfc189bcebc189bcebc189bcebc189bcebc189bcebc189bcebc189bcebcb0dd7dfc;
      expv[60] = 512'haaa1ee3da8014e6832cdb2c032cdb2c032cdb2c032cdb2c032cdb2c032cdb2c0189bcebc189bcebc32cdb2c032cdb2c032cdb2c0189bcebc32cdb2c0b0dd7dfc;
      expv[61] = 512'haaa1ee3da8014e6832cdb2c0263df5fa263df5fa32cdb2c0263df5fa263df5fa263df5fa263df5fa32cdb2c032cdb2c032cdb2c0263df5fa32cdb2c0b0dd7dfc;
      expv[62] = 512'h91ef12cfa8014e6891ef12cf263df5fa263df5fa91ef12cf91ef12cf91ef12cf263df5fa91ef12cf32cdb2c032cdb2c032cdb2c091ef12cf91ef12cfb0dd7dfc;
      expv[63] = 512'h91ef12cfa8014e6891ef12cf2f66b7aa263df5fa91ef12cf2f66b7aa91ef12cf263df5fa91ef12cf2f66b7aa2f66b7aa32cdb2c02f66b7aa2f66b7aa2f66b7aa;
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
