// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 111;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079162 dut (
    .addr_i_0(in_vec[173:160]),
    .we_i_0(in_vec[159:159]),
    .data_i_0(in_vec[158:143]),
    .addr_i_1(in_vec[142:129]),
    .we_i_1(in_vec[128:128]),
    .data_i_1(in_vec[127:112]),
    .addr_i_2(in_vec[111:98]),
    .we_i_2(in_vec[97:97]),
    .data_i_2(in_vec[96:81]),
    .addr_i_3(in_vec[80:67]),
    .we_i_3(in_vec[66:66]),
    .data_i_3(in_vec[65:50]),
    .addr_i_4(in_vec[49:36]),
    .we_i_4(in_vec[35:35]),
    .data_i_4(in_vec[34:19]),
    .data_o_mem(in_vec[18:3]),
    .sel(in_vec[2:0]),
    .data_o_0(out_vec[110:95]),
    .data_o_1(out_vec[94:79]),
    .data_o_2(out_vec[78:63]),
    .data_o_3(out_vec[62:47]),
    .data_o_4(out_vec[46:31]),
    .addr_mem(out_vec[30:17]),
    .we_mem(out_vec[16:16]),
    .data_i_mem(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h0580c44b8bef795bb76f3b1b4451bd35b05969803979;
    stim[1] = 174'h2aa762915bc8afcee3249f581aa1c1e296ac89ab0529;
    stim[2] = 174'h3044f1beebd8ec7809ad459e3078627c7080ae76e7a9;
    stim[3] = 174'h091cc3d6a9d85ce6efd265750a86e15d344bcb224452;
    stim[4] = 174'h20e7c8221df6c5306551f2328b90a6d92217d3a9ce25;
    stim[5] = 174'h088133331434e754175cdd0c232ad3402816aec6ebe7;
    stim[6] = 174'h05a1e2cf1d900035cfd67149773a001aed593da1d325;
    stim[7] = 174'h12c82541368cb9ad3b344f605b606a434e0ca5b75e51;
    stim[8] = 174'h27eb87c2dea646f517d9e6a7adaa9268f5718bc71353;
    stim[9] = 174'h346d2d747d26ca2de8969776dcd05f4d1faa1ac8bf70;
    stim[10] = 174'h305643f140488a596dbe6dd671dd19fbd51e64eea698;
    stim[11] = 174'h3d3086f2a959f66187c289f754a7fa79fbe621cbd476;
    stim[12] = 174'h237652d634d1c77932abefa353e7b3bac1293cbadfd9;
    stim[13] = 174'h2fb63a6b349369cc786a54bbaf747031fda324d73b69;
    stim[14] = 174'h2eb0c1b3927727dc1a4d58f465d1eef9c50c8952bca4;
    stim[15] = 174'h259b043841fa11f9925da903320f481540b70cef6019;
    stim[16] = 174'h1fcde99443b8b464eee00ff87912edaa860944933e53;
    stim[17] = 174'h10fe16f6163ad2ebbbb31db406ebe59670ae34f38392;
    stim[18] = 174'h1dec9dc0c6cbd276f50679b17daeb78106ee1f55e7c0;
    stim[19] = 174'h0ed7771c0e3e1a9e3066c66784a858927aa73d8a22ea;
    stim[20] = 174'h0f2f42320cddfa3d642f799aa9af0f08b25aac648dbd;
    stim[21] = 174'h1da17ea769e722b52253310ca9a94e957afe3cd31379;
    stim[22] = 174'h36093096916f0508bee4a9fb1d3b0c98868735e7182d;
    stim[23] = 174'h3819b7557133deb88df3d41873a1d3170984b7f23066;
    stim[24] = 174'h3d0efc5a9696ed49451bbce80e0fcb866ee49fe1bae9;
    stim[25] = 174'h388fa141716a18514544f201319ab0b4b131dc1471ca;
    stim[26] = 174'h2de4cd6caf2b8579ea2f24cf07ac35112efcb2bd7e2f;
    stim[27] = 174'h0d8ac5b26308a323faf80a121bf27cec5e9274d193fe;
    stim[28] = 174'h0c37725c437f589dd739411668f945154cbb9d4e30b9;
    stim[29] = 174'h2777def25c27ee359ffeb8fee64ab1ae2d526cdd3baf;
    stim[30] = 174'h084ce8d8afe75955b52cda2fe42d57ed4201fd6c5e16;
    stim[31] = 174'h2ea3ebef5267d1ff075a2464026458cde1b0eb6118ce;
    stim[32] = 174'h1f6f17ab4cdf6e1f5ed9198972ede680bd5fb2cf966e;
    stim[33] = 174'h3cede893a359170b07170b62e0aedda323fb26a6c45d;
    stim[34] = 174'h30dcc60522b2c19bc9c4ee15ae4e3d5ad350250bc12f;
    stim[35] = 174'h0150567df652881e5ca2d8c7cdfdfce8e6b32eb138e5;
    stim[36] = 174'h1c6ecf07799d2bb1ada0b892c0491a34552834751de6;
    stim[37] = 174'h335433f21cd0a9c33012933e5526d466bef29f1075cb;
    stim[38] = 174'h0b42e6e92ee55d2823ba52683b47ebb2bb04a08affa6;
    stim[39] = 174'h2e8928fa095e46b41f484c7d18dc2ddf4b443547ae38;
    stim[40] = 174'h35a288b1ca31a094aaaa506f1a5f295675f8b00613ef;
    stim[41] = 174'h114a0b6766bd86d78339f8f5fef6b48b7125b1d495b9;
    stim[42] = 174'h2e092f9553625192f075d041e491abcb0badd151ce5d;
    stim[43] = 174'h2f827bf73558cbd1b1e3d64bed0ca8a5f525a46f4a35;
    stim[44] = 174'h285825045631124d489512fe3d932470a5695a33d047;
    stim[45] = 174'h2639bd137954d9c2e856ee9339bf7ea8c51c015d05a2;
    stim[46] = 174'h1f06375707454845d216887c2575848978848acc1578;
    stim[47] = 174'h095763e1cb493589b1780f6d8f5f663e707136069d52;
    stim[48] = 174'h34ce434e9c8ac2a90cbd9bd5cbfda963e0ca04b84c7b;
    stim[49] = 174'h38c9fe39fcd59a83e98de3479a783d01daf1780c4b33;
    stim[50] = 174'h202c4fa06fad24d1aebe087e28155ff4ed45eba503b4;
    stim[51] = 174'h01c2b431189dc788f75d45356067ea70fc698de1a1ec;
    stim[52] = 174'h080b05e6c2b10d6a3fd875858845e6c5a12584dc23c9;
    stim[53] = 174'h3e0d53dec4b4741793b0760120ca83c79fe99ae964f5;
    stim[54] = 174'h0a2f4aac2bc11584da5f7e54369f13f9b7f38c7d8eb8;
    stim[55] = 174'h29ae48de4e1a78d999f785c8d9d2877dc05d38fd9004;
    stim[56] = 174'h3ad338df4ad5337028e8d3f47125d90758fb833d49d1;
    stim[57] = 174'h32e5572f955f1cb9cdf8d3767395ca00b899e7ca6234;
    stim[58] = 174'h12d378c3871d1c58bddbe05a6f32e0ddaa1fb75a19bc;
    stim[59] = 174'h16863213ea97f7cf362ac7412ff95d08776fee6f1579;
    stim[60] = 174'h24c8640611f984c2a3c4df3a4b9e590673bb2d888ac5;
    stim[61] = 174'h378d169725e2223c1f284167b3a7f804e7baa4829303;
    stim[62] = 174'h2d9c30cb6380cc6546262046bfe85f7fddabe7c3447d;
    stim[63] = 174'h2d4a67143a1842ed4e606220b4ce6d833b216eebadd2;
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
      expv[0] = 111'h039783978397839783978bef795b;
      expv[1] = 111'h3052b052b052b052b052dbc8afce;
      expv[2] = 111'h6e7aee7aee7aee7aee7aebd8ec78;
      expv[3] = 111'h2445244524452445244577e932ba;
      expv[4] = 111'h1ce21ce21ce21ce21ce22442fa75;
      expv[5] = 111'h6ebe6ebe6ebe6ebe6ebe0502d5d8;
      expv[6] = 111'h1d321d321d321d321d325dab27b4;
      expv[7] = 111'h75e575e575e575e575e5368cb9ad;
      expv[8] = 111'h713571357135713571356b6aa49a;
      expv[9] = 111'h0bf70bf70bf70bf70bf768da5ae8;
      expv[10] = 111'h6a69ea69ea69ea69ea69e0ac87e2;
      expv[11] = 111'h3d473d473d473d473d473f7cc439;
      expv[12] = 111'h2dfdadfdadfdadfdadfdb4d1c779;
      expv[13] = 111'h73b6f3b6f3b6f3b6f3b6b49369cc;
      expv[14] = 111'h2bca2bca2bca2bca2bca38a1912a;
      expv[15] = 111'h7601f601f601f601f601c1fa11f9;
      expv[16] = 111'h33e533e533e533e533e51e44bb6a;
      expv[17] = 111'h383938393839383938395dd98eda;
      expv[18] = 111'h5e7c5e7c5e7c5e7c5e7c3bd93b81;
      expv[19] = 111'h222ea22ea22ea22ea22e98336333;
      expv[20] = 111'h48dbc8dbc8dbc8dbc8db964b558c;
      expv[21] = 111'h3137b137b137b137b137e9e722b5;
      expv[22] = 111'h7182f182f182f182f18290d0e6bc;
      expv[23] = 111'h23062306230623062306613096fe;
      expv[24] = 111'h1bae9bae9bae9bae9bae9696ed49;
      expv[25] = 111'h471cc71cc71cc71cc71ca2a27900;
      expv[26] = 111'h57e2d7e2d7e2d7e2d7e2a5df9657;
      expv[27] = 111'h193f993f993f993f993f8bd24e9a;
      expv[28] = 111'h630be30be30be30be30bc37f589d;
      expv[29] = 111'h53bad3bad3bad3bad3bac5aa4d9b;
      expv[30] = 111'h45e145e145e145e145e128403fad;
      expv[31] = 111'h118c918c918c918c918cbc361d6c;
      expv[32] = 111'h7966f966f966f966f96697abf659;
      expv[33] = 111'h6c45ec45ec45ec45ec45e47f64d4;
      expv[34] = 111'h3c12bc12bc12bc12bc12da6a04a1;
      expv[35] = 111'h138e138e138e138e138e1cd665d6;
      expv[36] = 111'h51de51de51de51de51de0aa5068e;
      expv[37] = 111'h075c875c875c875c875c9549b519;
      expv[38] = 111'h2ffa2ffa2ffa2ffa2ffa57609411;
      expv[39] = 111'h7ae3fae3fae3fae3fae3dd1251f4;
      expv[40] = 111'h613ee13ee13ee13ee13ecebf1600;
      expv[41] = 111'h495bc95bc95bc95bc95be6bd86d7;
      expv[42] = 111'h1ce59ce59ce59ce59ce5e175ba2a;
      expv[43] = 111'h74a374a374a374a374a33ea4b48d;
      expv[44] = 111'h3d043d043d043d043d0414ad2b46;
      expv[45] = 111'h505a505a505a505a505a742b7749;
      expv[46] = 111'h4157c157c157c157c157be0c6eae;
      expv[47] = 111'h69d569d569d569d569d558bc07b6;
      expv[48] = 111'h04c784c784c784c784c7f2ff6a58;
      expv[49] = 111'h44b344b344b344b344b3669e0f40;
      expv[50] = 111'h503b503b503b503b503b1da8bd74;
      expv[51] = 111'h1a1e9a1e9a1e9a1e9a1e9f8d31bc;
      expv[52] = 111'h423cc23cc23cc23cc23cc2b10d6a;
      expv[53] = 111'h164f164f164f164f164f73fd335d;
      expv[54] = 111'h58ebd8ebd8ebd8ebd8eb945e9558;
      expv[55] = 111'h59005900590059005900380ba71f;
      expv[56] = 111'h549d549d549d549d549d4ad53370;
      expv[57] = 111'h2623262326232623262317133cf9;
      expv[58] = 111'h219ba19ba19ba19ba19bb543f6eb;
      expv[59] = 111'h7157f157f157f157f157ea97f7cf;
      expv[60] = 111'h08ac08ac08ac08ac08ac4e7765b1;
      expv[61] = 111'h293029302930293029306ce9fe01;
      expv[62] = 111'h3447b447b447b447b447fbb57cf8;
      expv[63] = 111'h3add3add3add3add3add27303110;
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
