// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02566 dut (
    .clk(clk),
    .rst(in_vec[176:176]),
    .i_m0_we(in_vec[175:175]),
    .i_m0_cyc(in_vec[174:174]),
    .i_m0_stb(in_vec[173:173]),
    .i_m0_sel(in_vec[172:169]),
    .i_m0_dat(in_vec[168:137]),
    .i_m0_adr(in_vec[136:105]),
    .i_m1_we(in_vec[104:104]),
    .i_m1_cyc(in_vec[103:103]),
    .i_m1_stb(in_vec[102:102]),
    .i_m1_sel(in_vec[101:98]),
    .i_m1_dat(in_vec[97:66]),
    .i_m1_adr(in_vec[65:34]),
    .i_s_dat(in_vec[33:2]),
    .i_s_ack(in_vec[1:1]),
    .i_s_int(in_vec[0:0]),
    .o_m0_ack(out_vec[138:138]),
    .o_m0_dat(out_vec[137:106]),
    .o_m0_int(out_vec[105:105]),
    .o_m1_ack(out_vec[104:104]),
    .o_m1_dat(out_vec[103:72]),
    .o_m1_int(out_vec[71:71]),
    .o_s_we(out_vec[70:70]),
    .o_s_stb(out_vec[69:69]),
    .o_s_cyc(out_vec[68:68]),
    .o_s_sel(out_vec[67:64]),
    .o_s_adr(out_vec[63:32]),
    .o_s_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1c55e86d3ddbd1cd17c83bff41b15bd741c995cb03912;
    stim[1] = 177'h197e1875b094f388c61cb99019f4f4a50e6348f402414;
    stim[2] = 177'h0941128a7e4f2ba3072da8256d11d23337b73e4924e71;
    stim[3] = 177'h01adc4db656b96dda1ed76590e3b2d690c5a9e27e7a1e;
    stim[4] = 177'h0eb948e5b0b57464d9764fa6e199430781b1cd50c5261;
    stim[5] = 177'h02b4fc5feb5aa83640bdebecfa99dd0bcce18df1179f4;
    stim[6] = 177'h09867b322dadf3eb383dc7309494bd702ed4552027c8c;
    stim[7] = 177'h08a99b4f3886c994356fada4a0c780f20f02de63c1041;
    stim[8] = 177'h0a8ea0f7b82e92de7e23aab0daefd7729d1a0f4d2e826;
    stim[9] = 177'h0bf798565e3127acdb15342a590c698e022bcac390e62;
    stim[10] = 177'h09b5d1c969078f6ec6ca1dbfdd7693373ec374a1c8bea;
    stim[11] = 177'h0ac33d6b74a7ada3cb280984d2eaa4cd92204360efe60;
    stim[12] = 177'h016d75df7b907270a4fc3ee77d7f2cf872cf3fce39ec0;
    stim[13] = 177'h0c4b87681bbf4d80edb7b4db494d349f0bbe55e1258ef;
    stim[14] = 177'h0a9933590ad301151fd7bf0d6c8d11ed1699fb2702533;
    stim[15] = 177'h08139d9a448b58d3a78977e296d181b1d82b1834be93f;
    stim[16] = 177'h0f209a62ab3a8f223cb652b01fa1b418aa12125ba26b9;
    stim[17] = 177'h0b40531c3f907245c1bbf8c527291fc47998651046ee4;
    stim[18] = 177'h0fe79b361248cccdf620ab4898da45f569b775805db4a;
    stim[19] = 177'h05794e648214c482ffa54340448e9d1b21cf432bd0c4a;
    stim[20] = 177'h06bc3c6c2c46c56915f08d7874424bd74d681625a69d1;
    stim[21] = 177'h0c320940e06ec8e53587c7efdd1848da2c934160faae3;
    stim[22] = 177'h1f452566f49761600743cfa4d417f77178aa84b3aa1ea;
    stim[23] = 177'h0d7e8a5e7a80396c653838ba240329232a49595feec50;
    stim[24] = 177'h0cc8f98c7fe5437be2c638d293a96bc6e6de34fc3aafb;
    stim[25] = 177'h0339e3f4a5b390edd3240ea293ce453fa1fc8551c5412;
    stim[26] = 177'h0dae914f79420ba87279bb84e171f8af73ac523bb7d89;
    stim[27] = 177'h076fdc77307152567139e79bb21ee6d8db017c346e16a;
    stim[28] = 177'h0abda2d8d0d2d3913be91ec80c7ca7feb9de06ecc0502;
    stim[29] = 177'h023c4fba5db7ac263c41f88faca9e503d25be4dc2a5c7;
    stim[30] = 177'h0e15e8884333a3c163e13b8ec14fee58b84e595ee2281;
    stim[31] = 177'h089a98479d43e0db661ddfd8a8fd07efb5ba84bd9d256;
    stim[32] = 177'h178c108ad80bfa97f9c1c891c5ffe0eef266dec60cb2a;
    stim[33] = 177'h00bea2bf6b02a3464e43e4c902a02fb0d808c320e618a;
    stim[34] = 177'h0ada3d9ae5636e2b4039a21b253bb7d6db2d09d268271;
    stim[35] = 177'h0b2b9146ed9b23ed0482a7a1adfdf61e88d13409aece4;
    stim[36] = 177'h0fcead7980f2b8432e2a9a1569ea7f36e601a5069bd17;
    stim[37] = 177'h0bbc7f2f9d876140867fd38bed8c61d43d8603252caa0;
    stim[38] = 177'h05b27dfd121f378d4f28367352dfb7e1748489c1f4e1e;
    stim[39] = 177'h0dabcda645895a4723ac3917b6df612efda4adce62013;
    stim[40] = 177'h00af27e86a452fd2748d875547ccc82f2042ad8959f61;
    stim[41] = 177'h07ab01acbf5a1fd821f47a348085a369eb90fcf7cc9a9;
    stim[42] = 177'h0428c42827ead431ee0cfbd382fcb51837f3bfeaa09b8;
    stim[43] = 177'h139d3dcd5c0e87869c3a8b3c9faca29cb457490d20555;
    stim[44] = 177'h098633be35e94085f0619af913a6bf8137686df37e0d4;
    stim[45] = 177'h087e09200810c0132e682a4d1735700cfdee35d3d8376;
    stim[46] = 177'h0d9229fdabc3ee902027a4fe4bd3005789cf9a5854260;
    stim[47] = 177'h074f4d7617f8d423913ba2270bf8417536ee5d5b5a798;
    stim[48] = 177'h07a313e5dd1150b024b1bc52985c409788d11a017b336;
    stim[49] = 177'h0f04df7d74f9f25d7a6c968c26270d1753f8ab894242e;
    stim[50] = 177'h0137e0c91375ff8971fb0da5906b315e34d7aa4055cc1;
    stim[51] = 177'h0961c1c325e59a91ecbeb5f2b2832bbff357559a9ac2c;
    stim[52] = 177'h0670866ba221a39b1d84c0a1b1f355c9fff488d07a5cc;
    stim[53] = 177'h0e88c2e1d6f2764c0be6d0f43dc8cfc634e116237306f;
    stim[54] = 177'h0bf55fabb3b40d213e13e492a4c3ecb5c728bb50aff33;
    stim[55] = 177'h080188609b0c9d1986f8f22316f5273d30dd9e90f0dc6;
    stim[56] = 177'h07c5985f7cf50fa986e2145951ae46b822bf4c44c757e;
    stim[57] = 177'h06ac014fad7aeaa4d95f7f5375139a2f1a71ed597eed1;
    stim[58] = 177'h062ff938065babb23343660d4ab366bce78a57482c0e9;
    stim[59] = 177'h06c01774e5e1f1ba0c44680e244fb99188b3f0ea20a19;
    stim[60] = 177'h0724f2c56f5e5494fef9cc9490c84d107d40f0080775d;
    stim[61] = 177'h05d53f69806db9520b27883c25f593dd5eeee14f22583;
    stim[62] = 177'h08b501af0012bcd64c3c3951a863be81aa15c80d6fcba;
    stim[63] = 177'h0d2af67e2684141fe532d960af1b8d9109c1aade4850c;
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
      expv[0] = 139'hx5cb0391x572c0e44xxxxxxxxxxxxxxxxxx;
      expv[1] = 139'h08f40241423d00905000000000000000000;
      expv[2] = 139'h3e4924e70f924939c000000000000000000;
      expv[3] = 139'h1e27e7a1d789f9e8735b5a4316ad96438ec;
      expv[4] = 139'h0d50c526035431498e90c1e06c73e9b8665;
      expv[5] = 139'h0df1179f437c45e7d000000000000000000;
      expv[6] = 139'h152027c8c54809f2377f5c0bb511cc25252;
      expv[7] = 139'h1e63c1040798f0410be03c83c0bb692831e;
      expv[8] = 139'h0f4d2e8253d34ba090e5dca7468aac36bbf;
      expv[9] = 139'h0ac390e612b0e439864a63808afd0a96431;
      expv[10] = 139'h34a1c8be9d28722fa184cdcfb0d76ff75da;
      expv[11] = 139'h0360efe600d83bf98109336488126134baa;
      expv[12] = 139'h3fce39ec0ff38e7b070b3e1cb3cfb9df5fc;
      expv[13] = 139'h15e1258ed5784963beed27c2ef9d36d2534;
      expv[14] = 139'h3b2702531ec9c094cee47b45a67fc35b234;
      expv[15] = 139'h1834be93d60d2fa4f9506c760acdf8a5b46;
      expv[16] = 139'h125ba26b8496e89aee9d062a8484ac07e86;
      expv[17] = 139'h251046ee494411bb9000000000000000000;
      expv[18] = 139'h35805db49d60176d20217d5a6ddad226369;
      expv[19] = 139'h032bd0c490caf431225746c873d0d01123a;
      expv[20] = 139'h1625a69d058969a74c22f5d35a035e1d109;
      expv[21] = 139'h0160faae00583eab8000000000000000000;
      expv[22] = 139'h44b3aa1e812cea87a7abb0b003a292b37a4;
      expv[23] = 139'h195feec50657fbb14000000000000000000;
      expv[24] = 139'h74fc3aafad3f0eabe562a1bdf1647cc63ff;
      expv[25] = 139'h4551c541015471504299c876e99cf1fa52d;
      expv[26] = 139'h123bb7d8a48eedf625d105d4393748a7bca;
      expv[27] = 139'h7c346e168f0d1b85a3b8a92b3897ee3b983;
      expv[28] = 139'h46ecc05001bb3014065969c89dfed16c686;
      expv[29] = 139'h64dc2a5c69370a97121bd6131e2e27dd2ed;
      expv[30] = 139'h195ee2282657b88a0709d1e0b1faf444219;
      expv[31] = 139'h44bd9d25412f67495441f06db30d4c23cea;
      expv[32] = 139'h5ec60cb287b1832ca3c5fd4bfce608456c0;
      expv[33] = 139'h0320e61880c839862000000000000000000;
      expv[34] = 139'h09d2682702749a09c000000000000000000;
      expv[35] = 139'h3409aece4d026bb390ad87a23449e86b7f7;
      expv[36] = 139'h25069bd14941a6f45000000000000000000;
      expv[37] = 139'h03252caa00c94b2a86d3b0a0433e3f97cec;
      expv[38] = 139'h09c1f4e1c2707d387000000000000000000;
      expv[39] = 139'h6dce62012b73988045d4ad2391d5e6d322c;
      expv[40] = 139'h2d8959f62b62567d805297e93a4793f4352;
      expv[41] = 139'h3cf7cc9a8f3df326a000000000000000000;
      expv[42] = 139'h3feaa09b8ffaa826e1156a18f704621413f;
      expv[43] = 139'h090d20556243481552c743c34e1e9ee6ae0;
      expv[44] = 139'h2df37e0d4b7cdf835000000000000000000;
      expv[45] = 139'h35d3d8374d74f60dd000000000000000000;
      expv[46] = 139'h1a5854260696150982e015e273e93f92f4c;
      expv[47] = 139'h1d5b5a798756d69e6000000000000000000;
      expv[48] = 139'h5a017b3346805eccd3d8a858125189f2ee8;
      expv[49] = 139'h6b894242cae25090b78cf92ebd326fbeba7;
      expv[50] = 139'h2a4055cc2a901573009affc4b8fbf06489b;
      expv[51] = 139'h159a9ac2c566a6b0b000000000000000000;
      expv[52] = 139'h08d07a5cc2341e973235727ffd20286c7cd;
      expv[53] = 139'h16237306c588dcc1b000000000000000000;
      expv[54] = 139'h7b50aff32ed42bfcc6fa06909f0aafd5d9d;
      expv[55] = 139'h5e90f0dc47a43c3714064e8cc370c4304d8;
      expv[56] = 139'h4c44c757c31131d5f3ea87d4c372cc2fbe7;
      expv[57] = 139'h2d597eed2b565fbb435d75526ca600a7d6b;
      expv[58] = 139'h17482c0ea5d20b03a31dd5d919a7fc9c032;
      expv[59] = 139'h30ea20a1ac3a88286360f8dd06200bba72f;
      expv[60] = 139'h30080775ec0201dd739f2a4a7f727962b7a;
      expv[61] = 139'h614f22582853c89601e6dca9059a9fb4c03;
      expv[62] = 139'h480d6fcb82035bf2e4595e6b261a80d7800;
      expv[63] = 139'h2ade4850cab7921435920a0ff2957b3f134;
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
