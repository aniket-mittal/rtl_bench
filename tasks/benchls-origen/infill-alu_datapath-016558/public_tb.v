// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016558 dut (
    .clk(clk),
    .reset(in_vec[109:109]),
    .shift_in(in_vec[108:93]),
    .comp_a(in_vec[92:77]),
    .comp_b(in_vec[76:61]),
    .x(in_vec[60:45]),
    .y(in_vec[44:29]),
    .val(in_vec[28:17]),
    .val2(in_vec[16:5]),
    .to_negate(in_vec[4:1]),
    .invert(in_vec[0:0]),
    .signed_shift_out(out_vec[159:144]),
    .unsigned_shift_out(out_vec[143:128]),
    .signed_comp_out(out_vec[127:127]),
    .unsigned_comp_out(out_vec[126:126]),
    .logical_left_shift(out_vec[125:110]),
    .arithmetic_left_shift(out_vec[109:94]),
    .logical_right_shift(out_vec[93:78]),
    .arithmetic_right_shift(out_vec[77:62]),
    .sum_signed(out_vec[61:45]),
    .sum_unsigned(out_vec[44:28]),
    .abs_val(out_vec[27:16]),
    .abs_val2(out_vec[15:4]),
    .negated_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h3dd23b2d1cdcbcce049467db40e9;
    stim[1] = 110'h32fce5ccffb2c4820da665ca08ba;
    stim[2] = 110'h00446613da74b8f63e675421d109;
    stim[3] = 110'h1d5da689a301cd67f8fa532d2e2c;
    stim[4] = 110'h0d6aebb6154cce1857129ca99b05;
    stim[5] = 110'h1ca02cad072b2c60cda1fdce67cc;
    stim[6] = 110'h1d76aeacad631e94be3f5a05255e;
    stim[7] = 110'h0cd0831dff3b6bff5ebde971959c;
    stim[8] = 110'h1b3ff7cb2099a2b48be2f0a3ddff;
    stim[9] = 110'h050c0003117e79264d69c8457358;
    stim[10] = 110'h23ba9163cd9f2a2b13224a04bfa9;
    stim[11] = 110'h1846f5750eb5201ef376c0b8a737;
    stim[12] = 110'h0c460f553200452c3950343944fa;
    stim[13] = 110'h04d7e358f2d693154603763102af;
    stim[14] = 110'h14707c8637f457cc906f4e317dce;
    stim[15] = 110'h17b2fe62bad59f509a582f263ff9;
    stim[16] = 110'h1fb0ffebfc57048bf06a3cc4e0f3;
    stim[17] = 110'h0555ca9eea805061c5cc09d7b3b6;
    stim[18] = 110'h1dfbec776e2b3a1edce71cd239fc;
    stim[19] = 110'h10de1ebb3139326ad79515d31f91;
    stim[20] = 110'h0600f0cef4a6051051e616511f3e;
    stim[21] = 110'h060a092c9d938b9194b3e1a6754f;
    stim[22] = 110'h0b31b3e93ea81fe137427d6e138d;
    stim[23] = 110'h0d6feb54b1e53cba3512f149724e;
    stim[24] = 110'h127ba7de279685213c013715ea08;
    stim[25] = 110'h09966f2b6f5560659476845a7d73;
    stim[26] = 110'h0a6604f41f1c5386ada6d40e067e;
    stim[27] = 110'h1bf70d140f16cfcabd8c7f23ec19;
    stim[28] = 110'h044542fc9be1fa73591979ea5dd2;
    stim[29] = 110'h02db966dea2fb99fbed845786c5c;
    stim[30] = 110'h0dfb134bd895fda8134a00820001;
    stim[31] = 110'h035093c0db216a516ceff36caf08;
    stim[32] = 110'h00e609bad8ceb96c885dd31c9ff8;
    stim[33] = 110'h1a7bd8a5cd74565f8cb6b9d5e35c;
    stim[34] = 110'h1489fd7328b1e8c586a07f89e87a;
    stim[35] = 110'h1f67a52862f2995d621d080c901e;
    stim[36] = 110'h040547457dd0f65953c54cfd0f5f;
    stim[37] = 110'h02b18ba4a38141bebdd4c12f4ac4;
    stim[38] = 110'h0ac0fcdef1338e01146aa0094bcb;
    stim[39] = 110'h1c15b06bb5833d2dcdcc77fcfe3c;
    stim[40] = 110'h100f0b845d2c9afc6ed969de722f;
    stim[41] = 110'h03ce2c9f7ee81df37b5defa3bb0a;
    stim[42] = 110'h192550df6e70b432d7e474d0090e;
    stim[43] = 110'h06c24a45fb72cbb983ba5df9403a;
    stim[44] = 110'h1993b04cd5814d88f4f06ca6a97d;
    stim[45] = 110'h04ecbc16486b8f270a9ec20f54da;
    stim[46] = 110'h1c9417cdecdda6ee7ee0738160b8;
    stim[47] = 110'h015497df88c597443cb384ab4e38;
    stim[48] = 110'h0f817f4531f4b4eb72cce535e959;
    stim[49] = 110'h06ae87c616d2761c561326f6a7b7;
    stim[50] = 110'h06bb0f0499ec1086375aba0c2973;
    stim[51] = 110'h14ad18cce5f5ede43446339f8b97;
    stim[52] = 110'h0e94cb2bf7030ef1b38707b73dfa;
    stim[53] = 110'h059326ebe43bd7a1f5ca1a738b19;
    stim[54] = 110'h08073744fc47302697c4a3dae29a;
    stim[55] = 110'h1e879ef10a3134c3d17ef384853a;
    stim[56] = 110'h1d19e7874d91134b26f2eba9de11;
    stim[57] = 110'h0729866ac89b01ac75960df2dabd;
    stim[58] = 110'h19997ce2272bb0a8bd0192c7bdaf;
    stim[59] = 110'h184a4d956674ae03533fc05cbf38;
    stim[60] = 110'h0f4d43fb210ed6521f586c6bb340;
    stim[61] = 110'h1e356ea2977181e97777f5d27613;
    stim[62] = 110'h027f44be9cc8d122b2ebf6403573;
    stim[63] = 110'h0d496c0dd263b29703d9b1043c71;
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
      expv[0] = 160'h000000002e912e910ee93ee9016270b133ed5f9c;
      expv[1] = 160'h0000000097e717e7097e797e5228691432e5045d;
      expv[2] = 160'h000000008223022300220022375d7baeb5f0178c;
      expv[3] = 160'h01110111eaed2aed0eaefeaec6623331166a68f6;
      expv[4] = 160'hf5767576ab572b5706b546b5452ad29561ac328e;
      expv[5] = 160'h35ab35abe50125010e503e501a02ad01511933e6;
      expv[6] = 160'hf2807280ebb52bb50ebb7ebb7cd3fe69f2fe6d6f;
      expv[7] = 160'hf5da75daa6842684066846684abd355e94b8354e;
      expv[8] = 160'h3342334259ff19ff0d9ffd9fce97674bb7af1111;
      expv[9] = 160'hecff6cffa860286002860286069013480422466c;
      expv[10] = 160'h000000005dd41dd401dd41dd7d4d4ea6a5025fdc;
      expv[11] = 160'h00000000423702370c237c237395a9cad05c5395;
      expv[12] = 160'he11b611ba2302230062306233e7c4f3e25e45d9d;
      expv[13] = 160'h31183118a6bf26bf026bc26bf918ac8c54e87eb9;
      expv[14] = 160'h135f135fe38323830a383a38283bd41de7184127;
      expv[15] = 160'hd1c151c1fd973d970bd97bd979a8bcd457931ff4;
      expv[16] = 160'hdecb5ecbfd873d870fd87fd874f60a7b019e7077;
      expv[17] = 160'hfec37ec3eaae2aae02aac2aaf62dcb16e4eb263b;
      expv[18] = 160'h155715572fdf2fdf0efdfefdf705db82e1971cfe;
      expv[19] = 160'hf7ef77efc6f006f0086f386f29ffd4ffe5177048;
      expv[20] = 160'hc3784378300730070300430076f64b7b24d8707f;
      expv[21] = 160'h18031803b05030500305030500457022b0d33aa9;
      expv[22] = 160'h18281828198d198d0598c598f7239b91c14909ca;
      expv[23] = 160'h2cc62cc6ab7f2b7f06b7c6b7f1cd18e6875c46e7;
      expv[24] = 160'h35bf35bfd3dd13dd093df93dc122509124760b04;
      expv[25] = 160'hc9ee49ee0cb30cb304cb04cb34dc0a6e022d3eb7;
      expv[26] = 160'h265926599330133005330533012d7096b5f9033f;
      expv[27] = 160'h299829981fb81fb80dfbbdfb8d5716ab806f0a04;
      expv[28] = 160'hefdc6fdca22a222a02228222b38cb9c6530b2ee9;
      expv[29] = 160'h1115111556dc16dc016dc16df877fc3bf2bc362e;
      expv[30] = 160'h0b6e0b6e2fd82fd806fd86fdb0f2187900410000;
      expv[31] = 160'h37ec37ec1a841a8401a841a857414ba0a64a5784;
      expv[32] = 160'h0d420d42873007300073007301ca50e526724ffc;
      expv[33] = 160'h0398039853de13de0d3dfd3dc316318b13160e6e;
      expv[34] = 160'he9ef69ef644f244f0a44fa44cf65e7b2f03c0bdd;
      expv[35] = 160'hd2275227fb3d3b3d0fb3ffb3fb7a6dbd3406480f;
      expv[36] = 160'hfd9e7d9ea02a202a02028202aa1e950f467e7861;
      expv[37] = 160'h10151015d58c158c0158c158ff936fc9b0975aa2;
      expv[38] = 160'h0ac60ac6d607160705604560426bb135d0045a2b;
      expv[39] = 160'h2b032b0320ad20ad0e0afe0acafa357d14027f1e;
      expv[40] = 160'hf0567056807800780807b80789d5d4eae4ef3919;
      expv[41] = 160'hc03c403c9e711e7101e701e739515ca8a7d12285;
      expv[42] = 160'h0f380f38492a092a0c92bc92ac17360b95980487;
      expv[43] = 160'he4956495b6123612036103610f73c7b9e1045ffd;
      expv[44] = 160'h1b091b090c9d0c9d0cc9fcc9c279513ca65354b2;
      expv[45] = 160'he64e664e676527650276427659c5cce2e10755ad;
      expv[46] = 160'h13b213b264a024a00e4a3e4a05ced2e766404fbc;
      expv[47] = 160'hf25072504aa40aa400aa40aa73f7b9fbd25558fc;
      expv[48] = 160'h05520552fc0b3c0b07c087c0a7b853dc229a0b64;
      expv[49] = 160'h3e053e05b5743574035743576c2f7617b37b53d5;
      expv[50] = 160'h1aba1abab5d835d8035d835da7e0d3f062fa14b7;
      expv[51] = 160'h1aec1aec656825680a56ba56822a511526313a45;
      expv[52] = 160'hd2b452b4b4a634a6074a474a4278b13c53db611d;
      expv[53] = 160'h3a533a53ec992c9902c982c9ad6bf6b5f2c73a84;
      expv[54] = 160'h164c164c0039003904038403a7eb33f591ed714d;
      expv[55] = 160'h201c201c743c343c0f43ff43e642b321563e429d;
      expv[56] = 160'hfa1e7a1e28cf28cf0e8cfe8cfa3e0d1f05d41108;
      expv[57] = 160'hf4677467394c394c0394c394f7426ba136f96d52;
      expv[58] = 160'h1ca61ca64ccb0ccb0cccbcccadaa36d5169d2139;
      expv[59] = 160'he6656665c25202520c253c25014310a1802e5f9c;
      expv[60] = 160'he1296129fa6a3a6a07a687a6b5aa7ad536352660;
      expv[61] = 160'h3d353d35b1ab31ab0f1abf1ab9614cb0a5173b07;
      expv[62] = 160'hf8d578d593fa13fa013f813fa40e920744e01ab7;
      expv[63] = 160'h09fd09fdaa4b2a4b06a486a4b670ab38577e1e38;
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
