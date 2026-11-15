// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021291 dut (
    .clk(clk),
    .reset_x(in_vec[149:149]),
    .enb(in_vec[148:148]),
    .In1_re(in_vec[147:111]),
    .In1_im(in_vec[110:74]),
    .In2_re(in_vec[73:37]),
    .In2_im(in_vec[36:0]),
    .Out1_re(out_vec[73:37]),
    .Out1_im(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h204a40f5f3cf1fdf7f9dad011d755821670ba7;
    stim[1] = 150'h279bc01bd9ac82ed1f653a4ba2c30923b44073;
    stim[2] = 150'h0958b8ef41c13c4fcaf59db2ca676dd67e30c4;
    stim[3] = 150'h1f70ecca5628584cb4585fadf50b6d43c6b884;
    stim[4] = 150'h107fe03c93d18bc36a8711a2095bffde7f854b;
    stim[5] = 150'h0eadcaf864ecec57cb67a8aa500fc25fd5d267;
    stim[6] = 150'h1a2a64c637ecae0fd816401251efd225835587;
    stim[7] = 150'h18d44cf46ae3395bd286732aff621b7e6a40a2;
    stim[8] = 150'h01e3f9d0172bd084ed7d146dbc194e481cd41a;
    stim[9] = 150'h194db0b6693eb11d1b1242169bf72d660a1273;
    stim[10] = 150'h1cd9c697b78a9b671193562ecd000814bf8dc9;
    stim[11] = 150'h1b85bcdbe464591829a3ee371fe79975e1e7cb;
    stim[12] = 150'h18f0d673faa33847c11b3e8ff264da1ee1d97a;
    stim[13] = 150'h1065be16ec8b84a5b11af3620ee7119acc6439;
    stim[14] = 150'h14fb2c6c716dc227695bc2b6dd9788b3cf6470;
    stim[15] = 150'h0f80a35961cfdc7e62d1e2f4fce9c46aad650e;
    stim[16] = 150'h1d05ee4b136b7e38e7379bd1ae681dbdcb8386;
    stim[17] = 150'h1ee49b2b5536d61dceca225a2e8b005d8b7cf5;
    stim[18] = 150'h1ea45632065b59af818f8404ad63ac8f765adb;
    stim[19] = 150'h1a058e20b304e7cf4eda91e34623258f1ece9b;
    stim[20] = 150'h16fcb033bac011bddc1395d08d6d8de64f2e70;
    stim[21] = 150'h18abaff77d59bd18551af01adc0674b78ebe22;
    stim[22] = 150'h129a34df4a986f73c4c7cdce50b553427faca7;
    stim[23] = 150'h1ebf92ff24e0f424bc1dcd3f61b112b3bda0fc;
    stim[24] = 150'h02520622a07b0bda6d2b446c65c85942eebcd7;
    stim[25] = 150'h07cd1f5039a2506aed4cbfce078387624d3d31;
    stim[26] = 150'h1d96e14d5b3fc173044c11d7377ca06611a4ac;
    stim[27] = 150'h1a49bb2e9a512f0ebd4cb16e793aab64861707;
    stim[28] = 150'h0b9f3915b715beabade8f7c5064142e1992a4c;
    stim[29] = 150'h121f948ff618d82b542fe6b3375267383ea0bd;
    stim[30] = 150'h016c80d1e151ddcbb3890e1e3af1077a8e6d67;
    stim[31] = 150'h147110f3b7fffc9dca50706bc83b54d813190a;
    stim[32] = 150'h0ed7913f33af3f707173a56313cee421206353;
    stim[33] = 150'h1c605ea66293718baf82cbd9d13c0ef1415cf4;
    stim[34] = 150'h131a7f7653f9c7034901d0e16bcdf3a9802f85;
    stim[35] = 150'h0c58de5f867bde48581670d2e9713279234b52;
    stim[36] = 150'h078ea578c6139c193e26eed680a40f7bd883c9;
    stim[37] = 150'h0662f3d0d9c78de8fe68342ca1ed2bd8aac5af;
    stim[38] = 150'h17ad613aa4dc82eea5c8ef8aa6eba7ada64c28;
    stim[39] = 150'h1b11a9f5e3123d837a512f63ffcc0b68b7bcc3;
    stim[40] = 150'h0cf7f3834c1690e9fc4bd4803dabb6e9eebc10;
    stim[41] = 150'h1f4f377f7210cf5963a85d51e4126cd894ac30;
    stim[42] = 150'h134f2a4625d5a5f6bb9fe3ca552ecb34f14fa1;
    stim[43] = 150'h1020512f425bcf7eb49f396a3a7221117d8970;
    stim[44] = 150'h1bd5cc042168c5907d613b6738262372952ecd;
    stim[45] = 150'h0637b94574213836e5a382102aa4c3f7a93d0a;
    stim[46] = 150'h1e38dbc49ca553414b9611e8ceb9ea22bfa5d4;
    stim[47] = 150'h0ff637a2109504ec578cda209d0e5db343c21a;
    stim[48] = 150'h00cd81f4e8fd027511f1b9f54ebbe359ed0132;
    stim[49] = 150'h16b135e6d733373cb5746bb62595efbb7cc569;
    stim[50] = 150'h1be7a15d700565306bc16f0432072ffb58254c;
    stim[51] = 150'h10f13ce40f725c594cbd2a6ee93dfe692526e1;
    stim[52] = 150'h162e6677159abd6d986d4e8389e7f896a1d221;
    stim[53] = 150'h0c4fc5803f8bc150f2218db5573e453ccc3bbf;
    stim[54] = 150'h0dcfefd757e943b00ecc944a1f2505d3ddd315;
    stim[55] = 150'h05157072304f3a3e2f45afc7d248002cabd931;
    stim[56] = 150'h0535ba1a0f9faa786d27d8e5a07a023a4d57a9;
    stim[57] = 150'h01ef58ee5627692db8c398942108cbe73f2d93;
    stim[58] = 150'h1c3c5ebe68c3285f033c9abca1a20d8e981ee5;
    stim[59] = 150'h15d3eb7aada8f9347affd472188985c47a099f;
    stim[60] = 150'h1a454fce64958df0080b5705ca2276aa791f2f;
    stim[61] = 150'h103b303e40fd1531ed4b96ba91bccd61b54dd8;
    stim[62] = 150'h1d63acff5d4700c8b1437dcd405f7e64618bdd;
    stim[63] = 150'h0665352d0e3d4570d0c2409556856bfe1a2510;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h13a4ba2c30923b44073;
      expv[2] = 74'h19db2ca676dd67e30c4;
      expv[3] = 74'h05fadf50b6d43c6b884;
      expv[4] = 74'h2eddd3bf169f492b261;
      expv[5] = 74'h3c8a25f34b6c2c6ad08;
      expv[6] = 74'h2600a6114a688743028;
      expv[7] = 74'h0fdc430eff6a9ee36a7;
      expv[8] = 74'h34980f933e71673c8bb;
      expv[9] = 74'h07729d911c634610714;
      expv[10] = 74'h1a99afa9a57c106d48d;
      expv[11] = 74'h324a8c5d57c1cbbac2f;
      expv[12] = 74'h21fff295dd33527e3e2;
      expv[13] = 74'h12f97abe5ba68de547f;
      expv[14] = 74'h3dc266352ab94f8d0b6;
      expv[15] = 74'h321c018061fdb373f64;
      expv[16] = 74'h0da9cc984592e555ddc;
      expv[17] = 74'h163d5c14fdb3d19b6c2;
      expv[18] = 74'h33d2b7838fa44fdce8d;
      expv[19] = 74'h23af8d2a4bc658aaefe;
      expv[20] = 74'h21734159a4f20430226;
      expv[21] = 74'h0af46e8f504bbfe3526;
      expv[22] = 74'h1f8ba4e9489b1c5c1ed;
      expv[23] = 74'h273cc9983b8cf9a922d;
      expv[24] = 74'h2f4512591717ff7ebde;
      expv[25] = 74'h06fb2c74cbf9f566c38;
      expv[26] = 74'h3c1bbf745d8a31ad3b3;
      expv[27] = 74'h01726cc917b54e2d81a;
      expv[28] = 74'h38a33d1e7d72d5cd99f;
      expv[29] = 74'h2792202f8fb84025010;
      expv[30] = 74'h196035eee8db0994272;
      expv[31] = 74'h0f850ec38db0e1dee15;
      expv[32] = 74'h0c1a750bcc42047d5e7;
      expv[33] = 74'h3e81e0e29eef068cf88;
      expv[34] = 74'h0e8f915669885e31b65;
      expv[35] = 74'h33772c70610eae41d92;
      expv[36] = 74'h3b5765e38eded995609;
      expv[37] = 74'h0facc7f820a4a6b97ef;
      expv[38] = 74'h1b62a8480861f671e68;
      expv[39] = 74'h31abc4e752289736635;
      expv[40] = 74'h298eabb247b794f9aa4;
      expv[41] = 74'h321bc618b3167f58ac4;
      expv[42] = 74'h3b798350b4f68c7a88b;
      expv[43] = 74'h00d34cbfb967afb3857;
      expv[44] = 74'h1437b83f6ba6674dbf4;
      expv[45] = 74'h277832bad1e290d5c62;
      expv[46] = 74'h1075bcfc2245423c52c;
      expv[47] = 74'h068578e3567081414ff;
      expv[48] = 74'h1482c3fe30caebd5417;
      expv[49] = 74'h3f9ed16bd19104d184e;
      expv[50] = 74'h31b51abbcfcc92752a9;
      expv[51] = 74'h024574099ffc27141d1;
      expv[52] = 74'h18ad2c2ebb52db82550;
      expv[53] = 74'h3194ef503abec27a1da;
      expv[54] = 74'h21fe3bcea6c83393930;
      expv[55] = 74'h33b61700d66dc073f4c;
      expv[56] = 74'h1647f3e3f68e9a8bdc4;
      expv[57] = 74'h1242dbece32969a93ae;
      expv[58] = 74'h226563f67743df38500;
      expv[59] = 74'h2e389c823b68e91ca6e;
      expv[60] = 74'h0cc00a8cdc0e8c63dee;
      expv[61] = 74'h2280e8555f2c5314fda;
      expv[62] = 74'h38c994fef9da9ae072f;
      expv[63] = 74'h19980965cbdbe4c5160;
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
