// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 216;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087579 dut (
    .clk(clk),
    .ra(in_vec[215:210]),
    .re(in_vec[209:209]),
    .ore(in_vec[208:208]),
    .wa(in_vec[207:202]),
    .we(in_vec[201:201]),
    .di(in_vec[200:117]),
    .byp_sel(in_vec[116:116]),
    .dbyp(in_vec[115:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[83:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 216'h612f9d68286d8c44a7caab92cfb10b108e51de03c4b443502fd54a;
    stim[1] = 216'h5fec34023598f1b0c5c3d3001cfde53709d345b058e190e7409f50;
    stim[2] = 216'ha0f06e3ee9c8135e1126f18ef865dab31faf7f7061ff7dd8a00046;
    stim[3] = 216'h11e921119b79e0ec3e5897a8ae70adb40660d0da1da8257700aefc;
    stim[4] = 216'ha9916c93140617cbf7e15fc0bcaa9b5d945e25ecea693b9831efd3;
    stim[5] = 216'he645588975a5dbb2aef6ee733e9970fbfd87839ce4f7b50d2be336;
    stim[6] = 216'hea1dac91659d09ca047cacc9434e38b7822dbbe526ddda21ddd860;
    stim[7] = 216'h4a941da587f64b217f3cc47c2cf51ce22ae03e0321b8a9f3a23263;
    stim[8] = 216'hd19737d5ce99685b7f8f76d01e362f9177c6e018cc4ffd99b60963;
    stim[9] = 216'h53631be2ec9e238e3c9fa104a890505a984365c0d9da1997a009a0;
    stim[10] = 216'h3f28ca1792444b0f83c273c2548c11343bafbeba9f92b4e341fd8d;
    stim[11] = 216'hf1cd96b47a1bede6201868fdb931002b90511b4a9cbce569d13615;
    stim[12] = 216'ha1bc5ce68b6402dc22ad0138989affdf88729a151f6ac84de12377;
    stim[13] = 216'hb5b6b45bf39b31dba2e946c2a02a79c86a88d61c05074fb3ca9f11;
    stim[14] = 216'h21957ba25ad8cb53088a5e92935966d7a340136d4e87545d87f97f;
    stim[15] = 216'h84c3b07aa0e14f6282d5f065bcdc5b8ed23bffa2f006057966a916;
    stim[16] = 216'hdcd668a8363da59525b53d0c9263650e9c90ebe2c7e7b721e537e4;
    stim[17] = 216'h419f381edf9bea4908e5ce940dbf5b21e589027082d4aaf1ee89b3;
    stim[18] = 216'ha8484cda0eace32027bad9bb62f2c6734fb0b7947aa24a1f0006c7;
    stim[19] = 216'hb03b0dd0a9542b4d5999d754bf468e10aa8b170d3c44322c77603d;
    stim[20] = 216'h5c1e16dfad34b387995a525f230c37fb3dc8defe844ffa983467a8;
    stim[21] = 216'h31c54d4d2698639b22d35236d7fc0e6d061922e48abcfb83eb136e;
    stim[22] = 216'h9a24ba62ffee813c066650885653632f8ae27c00cf48a50cb76034;
    stim[23] = 216'hb88f0d3f09e13085b55f1f2d88881cecc5d303de3c4399e29102e2;
    stim[24] = 216'h1073ecaad895959dad60e82003249420ebdae97a8e00784535d381;
    stim[25] = 216'h86b4ab910c2e852079267b43d84d7b5e97b12aecc5200a24e4ea04;
    stim[26] = 216'h58242ec9ea6f07c16845768ef93e347a58fb9568d2850283d75708;
    stim[27] = 216'h45f49c37a0179577ca6619f9d278e10175faed743a9dbf9e7f7f8b;
    stim[28] = 216'h6759ee8add7215259143f4aef89c81fe6caafccbd8708305bd2d0a;
    stim[29] = 216'h0e0494a72bcbf5be51f86391e680b3a7e98e5ff786ec174ae88821;
    stim[30] = 216'hed12e93dd1bdd1959b7f23e6d04a0e0f82a0669bd27189d0875401;
    stim[31] = 216'ha9e56ee3e211ffc6f2c5be9ce49a7a89fa17aef00a9023e5a80c4d;
    stim[32] = 216'h5ccca1e43be417bcb2700103d709d97e6659a284850d48bba2f2f9;
    stim[33] = 216'h289f99e82306892059bbb6a6f348ed28b79c522181515e18a12c28;
    stim[34] = 216'he8be462f1aa6dac09347b538fed0c6a5289445644e7ef403d969a1;
    stim[35] = 216'h7e9b36eb41143798d6847683262517c215f9e295fac114ca53aeba;
    stim[36] = 216'hab0de6f96e96613c5651f7de7288e18a7e5877915c83043a1d2919;
    stim[37] = 216'h36861a72dd8a79388e12832ca80938b057085ec81d68c9425b4664;
    stim[38] = 216'h1eb0dab6db7588ae44783881b5924f8b45c6b549fda19b236b8fe3;
    stim[39] = 216'h4b02ab73434e73d76d7a1cff7adb545b511c4e1c7cbc8f79122e93;
    stim[40] = 216'h4e4b044d580e2ae16449a744ff96fc6234df05eaba82cc6423bb1d;
    stim[41] = 216'ha678c03e4b10616f7d310ba78a49cd41da734124b5c332e820a910;
    stim[42] = 216'h09799f1f8ada7331fe3b4b58bafedf18bcf3b45cbb658191ee7aba;
    stim[43] = 216'h96d495e8b25ce0d22fcfd3f57c1f94a95e3c120be88e837a33677c;
    stim[44] = 216'h4e7bfb919915dddcd572f8cdd5b45ea80d44f36b2e765d376416c8;
    stim[45] = 216'h48211a367709993496f9614450918b3fdc64ca29f6dce16ebb749e;
    stim[46] = 216'h0bba77d83ac511ce087f3e2316d04f1ae55bc38a468868c32d8fd5;
    stim[47] = 216'hff610368a7cb70a7797235cb4133e294997e4f3ae5ec6f73e342bc;
    stim[48] = 216'hafc2f328001e23ff9c2a8b915ff05aeaca6871040a9c2fcbc34154;
    stim[49] = 216'hf42fc4fb33a3d32b701223da3e838698c02799eb67688021e5d7c2;
    stim[50] = 216'hea976b21438e94e84cf51b297a4c4a90dc3c7f4e41a25f421b7a46;
    stim[51] = 216'ha2c874b28bc8f52ccbd7583ce8a98b8bad97ef3735cf665f07286f;
    stim[52] = 216'he401ec85ee8399b14ca45b57fa8f3d4a64e77833955fe041b9f648;
    stim[53] = 216'hb28a9a156d2eb122dc13c7f5ea7af5b956bb8947556ee81afbaef1;
    stim[54] = 216'h6c79c19ebc8c96404774d0c16a717e014740bd28f7c0f9ec9704ec;
    stim[55] = 216'h2b496d40d64d719b62af6c23f306d101048b0b037c16bcdbfd508e;
    stim[56] = 216'h20b7831fcae963306c768d0c170576c574bae6eccde46a583eba13;
    stim[57] = 216'h5820968f784ef33ca64f79f5ed700d63962aa24db4bb046a64357e;
    stim[58] = 216'hd430e70328efb3eb4553b5791330df7592db1f0134149d1225df6c;
    stim[59] = 216'h70332ab0833ffdf434928ac7ca8b737b4c8d7dfc6ed8bf93d40057;
    stim[60] = 216'h12a8edebdb9805ebf83e3274087df15983645681888a042498d5aa;
    stim[61] = 216'h1aae95fd6e0b276a8202be3816a2d263e5b614a2d810417f8985f3;
    stim[62] = 216'h907c356a0e4d063081a352594b8682d9a40f38aab2be5ab9006906;
    stim[63] = 216'h92c220943f139fa87dda2b8df89bbea64cadf05af70c52122d4d16;
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
      expv[0] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 84'hcfde53709d345b058e190;
      expv[3] = 84'hcfde53709d345b058e190;
      expv[4] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 84'hcaa9b5d945e25ecea693b;
      expv[6] = 84'hcaa9b5d945e25ecea693b;
      expv[7] = 84'hcaa9b5d945e25ecea693b;
      expv[8] = 84'hcaa9b5d945e25ecea693b;
      expv[9] = 84'he362f9177c6e018cc4ffd;
      expv[10] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 84'h48c11343bafbeba9f92b4;
      expv[12] = 84'h931002b90511b4a9cbce5;
      expv[13] = 84'h89affdf88729a151f6ac8;
      expv[14] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 84'h35966d7a340136d4e8754;
      expv[16] = 84'h35966d7a340136d4e8754;
      expv[17] = 84'h35966d7a340136d4e8754;
      expv[18] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 84'h7fc0e6d061922e48abcfb;
      expv[23] = 84'h7fc0e6d061922e48abcfb;
      expv[24] = 84'h7fc0e6d061922e48abcfb;
      expv[25] = 84'h7fc0e6d061922e48abcfb;
      expv[26] = 84'h7fc0e6d061922e48abcfb;
      expv[27] = 84'h7fc0e6d061922e48abcfb;
      expv[28] = 84'h278e10175faed743a9dbf;
      expv[29] = 84'h89c81fe6caafccbd87083;
      expv[30] = 84'h89c81fe6caafccbd87083;
      expv[31] = 84'h04a0e0f82a0669bd27189;
      expv[32] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 84'h288e18a7e5877915c8304;
      expv[38] = 84'h288e18a7e5877915c8304;
      expv[39] = 84'h288e18a7e5877915c8304;
      expv[40] = 84'hadb545b511c4e1c7cbc8f;
      expv[41] = 84'hadb545b511c4e1c7cbc8f;
      expv[42] = 84'hadb545b511c4e1c7cbc8f;
      expv[43] = 84'hafedf18bcf3b45cbb6581;
      expv[44] = 84'hafedf18bcf3b45cbb6581;
      expv[45] = 84'hafedf18bcf3b45cbb6581;
      expv[46] = 84'hafedf18bcf3b45cbb6581;
      expv[47] = 84'h6d04f1ae55bc38a468868;
      expv[48] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 84'hff05aeaca6871040a9c2f;
      expv[50] = 84'hff05aeaca6871040a9c2f;
      expv[51] = 84'hff05aeaca6871040a9c2f;
      expv[52] = 84'hff05aeaca6871040a9c2f;
      expv[53] = 84'hff05aeaca6871040a9c2f;
      expv[54] = 84'hff05aeaca6871040a9c2f;
      expv[55] = 84'hff05aeaca6871040a9c2f;
      expv[56] = 84'h306d101048b0b037c16bc;
      expv[57] = 84'h306d101048b0b037c16bc;
      expv[58] = 84'h306d101048b0b037c16bc;
      expv[59] = 84'h306d101048b0b037c16bc;
      expv[60] = 84'h306d101048b0b037c16bc;
      expv[61] = 84'h306d101048b0b037c16bc;
      expv[62] = 84'h306d101048b0b037c16bc;
      expv[63] = 84'h306d101048b0b037c16bc;
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
