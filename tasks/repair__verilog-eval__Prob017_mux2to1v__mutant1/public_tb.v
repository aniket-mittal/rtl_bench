// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h08d2182a71c9927af2fcb3e20dc42d535651c46412a9d8816f2;
    stim[1] = 201'h1aebfc78617f7fb79f2dcc587e2745a5678cda2c1c2bf3c3291;
    stim[2] = 201'h0f1f50464ced6a6aa2af81a5f7fe4a9ef2ed3699d548603f951;
    stim[3] = 201'h17aa045cf5a6b6012e55e68b3bcb3994434ba5acd1916797175;
    stim[4] = 201'h17f5139e5834c945345899b31a9bea1b62778fa8f587c355805;
    stim[5] = 201'h15ce6315922af6c7396291169ee11ee1876df1088a84be7936d;
    stim[6] = 201'h0d561bfd897d8c1d7bb348a89c54ad8ee3fa3da4cccd770522a;
    stim[7] = 201'h1c9c3b5566295cde4b16400eb247522cc6b01a7a4e90e248eec;
    stim[8] = 201'h15bc12440567a40c70f15885c2da5c01f2d3b35144c1ac65268;
    stim[9] = 201'h115099e69dcae50e689f514580f334790e99f466fd1a9f28d44;
    stim[10] = 201'h0b45aa8ea2a0d66c60c564055b3dfde4f0b267faeeaa0b1d34e;
    stim[11] = 201'h18b8edbd2bb334688affe6a6fa0d2b0f4deab05c026a5e0264a;
    stim[12] = 201'h03ff961b540c4424c1d9bd75e9838cf32c028af6f6e62a15c1a;
    stim[13] = 201'h19a11c88d389eebcef427d986efb90209ef5745371cbdb3713b;
    stim[14] = 201'h10bcb399c6df815bc04997710f2efbb73d85fc97267b6aa8fb6;
    stim[15] = 201'h0dfb0a8dea2ee844f325402b0295623e5c4f6fe7359998c61f9;
    stim[16] = 201'h0ab713e3d210f4e88510c92b22160706458c1a6f34123578bd9;
    stim[17] = 201'h0bf08d14ca90aef0ab4e097c362b20bf80d57efd51e7d9a8956;
    stim[18] = 201'h018c20ed62c40d60c90ec0bbfe2e502168b3012d442cbdc2cc8;
    stim[19] = 201'h0664cbcbf276ed19632ce1c4bb7cc8e1dd201e3661a9fdafe68;
    stim[20] = 201'h08ee4f86bfe87200e8f67f39e0fb036b48facc1e9debc57388c;
    stim[21] = 201'h1acd0aebcca66ea46484c34468798f9c8dbb910b1902fc1e9a6;
    stim[22] = 201'h05b6595a7b32246c87ec042c798599a2d078a7fe827dc47c0e0;
    stim[23] = 201'h08d98b0485340e4f9a6ffd8303452e30ed2dd1c31f86dfc11fd;
    stim[24] = 201'h00aae0f379b9a03f8318cd0fcbedd828f7403f7c8365d7e25dd;
    stim[25] = 201'h1107a42e1f03c675a8dc2f7834cc9d3649a85bbbdb902f3b5f8;
    stim[26] = 201'h1fcf392f7a97afa2c5a417c9efad9133f266fe2c1417c66ce83;
    stim[27] = 201'h18de4e2286bd13edd6b8a49eae35a1e02f0b92457baff99b531;
    stim[28] = 201'h1504c6e006538a1929cf0487506cef1a2aba749b199019900a5;
    stim[29] = 201'h0bac3bedb2707c548a8b3fb993533650cdd14c66e78d7b57dff;
    stim[30] = 201'h0e9ee6f35d703db05f97250201442e46230d286044ff94332df;
    stim[31] = 201'h0e00ebd50ea0ba1deb51555179bae31142db672b5066756b281;
    stim[32] = 201'h182ed656da76ca6e87ea1e05ac8164354ea7578a0dcb4a9bbb0;
    stim[33] = 201'h05056a84665032d18f511ef7cd3766dfde6048ead5ddc935e63;
    stim[34] = 201'h1764bd9b811d1e72fbe2edceb9604db02b807712ead3bc742d0;
    stim[35] = 201'h0324f5ac5c1dbd8dcb3aeb5e983da3b592de429234a27d6d5fc;
    stim[36] = 201'h0c011082a9d3d8f62884a3e0e185358f58c4999bd6d653f9030;
    stim[37] = 201'h0e2dd6908695f322e853c99827a2b3093a20393e0a7c57ee5f8;
    stim[38] = 201'h00788f8f8ec0eeb343f58a9c7c6ebe8e0b780b9eec4519fb79c;
    stim[39] = 201'h067cf2e91893c0dab076444356cc16220e7610b102cd89e0e15;
    stim[40] = 201'h0607b0e69b6911ca1f5d9de907c824fd022a1a50d2bc9a7d256;
    stim[41] = 201'h146447e0d0c5b02fb0147f63354d9b3e52f9c22aae49eb4f288;
    stim[42] = 201'h0624141fe38fa929f349339c19654ab189755e9a13bbde0bcb0;
    stim[43] = 201'h19e3ee5c9c65dfd64a6f515329193d6bfa9df352addb5416f4b;
    stim[44] = 201'h0b7e6b7ef4b55c948f876fe79e51404f561b405fd35e476fb29;
    stim[45] = 201'h0adb2d80cf35c3423b669bbfb198beb24adb43985b4c1b61336;
    stim[46] = 201'h0a515e5e7e5695a98b6424e98d270fbf793a323789cca764827;
    stim[47] = 201'h00f81eb9540704a28f282f170dd1e2e2ada2ac0bc96f93829d7;
    stim[48] = 201'h0acc58dce932aecf5acb15c354b2583078d5c427d2b0c42ddba;
    stim[49] = 201'h0973719d20c038d8a7bdaf7d20026fe084dfbeb7a4fae2364f2;
    stim[50] = 201'h072a4d0ed98d47b6851f96e8593394f6e1567f02230a76144af;
    stim[51] = 201'h13189678a81049b7287db6846b2928bf63432f133fa77701dc2;
    stim[52] = 201'h1639d730d90519d2c9b7677993888c6094a42aca65b11c97ce2;
    stim[53] = 201'h0225d9f9dd9b35c04442061bb90237ebf6e9264c7b065eda279;
    stim[54] = 201'h148a2c4856ad616c7b6650155175f89c7335a2e6daf1cfa2949;
    stim[55] = 201'h0674e9362f8407c260498d084bfe959a14ef5bf39634b75c141;
    stim[56] = 201'h1148946b4124fa351fea122209e9378c9fa62579d4d1722c336;
    stim[57] = 201'h08be65234eefc5683f81df2deb151a073d3d79d13db8b2b50b3;
    stim[58] = 201'h0741391b827f5ec4aad7afcdb74425eac20a8b7053c72558ac9;
    stim[59] = 201'h0f8003861b3d4cac0f26a6b93a2740d618e9745e41423591c7e;
    stim[60] = 201'h1f1bc94f3c5d1fcb75c224bb98c8fdea9db421b5e76663e5e22;
    stim[61] = 201'h0ba3e0c65e1d0fb758bf53ee128ea4632c5d0cc8d86210ff5a3;
    stim[62] = 201'h16039ab53798436b6efbfb617f68eac5c37922d5772b082c7bf;
    stim[63] = 201'h0774fe5db4c2ca9b1368102fc903378c2f4c082ef0a338870df;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 100'h4690c1538e4c93d797e59f106;
      expv[1] = 100'h2745a5678cda2c1c2bf3c3290;
      expv[2] = 100'hfe4a9ef2ed3699d548603f950;
      expv[3] = 100'hcb3994434ba5acd1916797174;
      expv[4] = 100'h9bea1b62778fa8f587c355804;
      expv[5] = 100'he11ee1876df1088a84be7936c;
      expv[6] = 100'h6ab0dfec4bec60ebdd9a4544e;
      expv[7] = 100'he4e1daab314ae6f258b200759;
      expv[8] = 100'hade092202b3d2063878ac42e1;
      expv[9] = 100'h8a84cf34ee57287344fa8a2c0;
      expv[10] = 100'h5a2d54751506b363062b202ad;
      expv[11] = 100'hc5c76de95d99a34457ff3537d;
      expv[12] = 100'h1ffcb0daa06221260ecdebaf4;
      expv[13] = 100'hfb90209ef5745371cbdb3713a;
      expv[14] = 100'h85e59cce36fc0ade024cbb887;
      expv[15] = 100'h95623e5c4f6fe7359998c61f8;
      expv[16] = 100'h160706458c1a6f34123578bd8;
      expv[17] = 100'h5f8468a6548577855a704be1b;
      expv[18] = 100'h0c61076b16206b06487605dff;
      expv[19] = 100'h33265e5f93b768cb19670e25d;
      expv[20] = 100'h47727c35ff43900747b3f9cf0;
      expv[21] = 100'hd668575e6533752324261a234;
      expv[22] = 100'h2db2cad3d99123643f602163c;
      expv[23] = 100'h452e30ed2dd1c31f86dfc11fc;
      expv[24] = 100'hedd828f7403f7c8365d7e25dc;
      expv[25] = 100'h883d2170f81e33ad46e17bc1a;
      expv[26] = 100'had9133f266fe2c1417c66ce82;
      expv[27] = 100'h35a1e02f0b92457baff99b530;
      expv[28] = 100'h6cef1a2aba749b199019900a4;
      expv[29] = 100'h533650cdd14c66e78d7b57dfe;
      expv[30] = 100'h442e46230d286044ff94332de;
      expv[31] = 100'hbae31142db672b5066756b280;
      expv[32] = 100'hc176b2b6d3b653743f50f02d6;
      expv[33] = 100'h3766dfde6048ead5ddc935e62;
      expv[34] = 100'hbb25ecdc08e8f397df176e75c;
      expv[35] = 100'h1927ad62e0edec6e59d75af4c;
      expv[36] = 100'h600884154e9ec7b144251f070;
      expv[37] = 100'h716eb48434af9917429e4cc13;
      expv[38] = 100'h03c47c7c7607759a1fac54e3e;
      expv[39] = 100'hcc16220e7610b102cd89e0e14;
      expv[40] = 100'h303d8734db488e50faecef483;
      expv[41] = 100'ha3223f06862d817d80a3fb19a;
      expv[42] = 100'h3120a0ff1c7d494f9a499ce0c;
      expv[43] = 100'h193d6bfa9df352addb5416f4a;
      expv[44] = 100'h51404f561b405fd35e476fb28;
      expv[45] = 100'h56d96c0679ae1a11db34ddfd8;
      expv[46] = 100'h270fbf793a323789cca764826;
      expv[47] = 100'hd1e2e2ada2ac0bc96f93829d6;
      expv[48] = 100'h5662c6e74995767ad658ae1aa;
      expv[49] = 100'h4b9b8ce90601c6c53ded7be90;
      expv[50] = 100'h3394f6e1567f02230a76144ae;
      expv[51] = 100'h98c4b3c540824db943edb4235;
      expv[52] = 100'hb1ceb986c828ce964dbb3bcc9;
      expv[53] = 100'h0237ebf6e9264c7b065eda278;
      expv[54] = 100'h75f89c7335a2e6daf1cfa2948;
      expv[55] = 100'hfe959a14ef5bf39634b75c140;
      expv[56] = 100'h8a44a35a0927d1a8ff5091104;
      expv[57] = 100'h151a073d3d79d13db8b2b50b2;
      expv[58] = 100'h4425eac20a8b7053c72558ac8;
      expv[59] = 100'h7c001c30d9ea6560793535c9d;
      expv[60] = 100'hf8de4a79e2e8fe5bae1125dcc;
      expv[61] = 100'h8ea4632c5d0cc8d86210ff5a2;
      expv[62] = 100'h68eac5c37922d5772b082c7be;
      expv[63] = 100'h03378c2f4c082ef0a338870de;
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
