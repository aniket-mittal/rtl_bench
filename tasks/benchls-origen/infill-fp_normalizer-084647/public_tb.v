// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084647 dut (
    .a(in_vec[127:64]),
    .b(in_vec[63:0]),
    .delta_1(out_vec[127:64]),
    .delta_2(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'hdeaa27c24f42b9158dbfc23728a85047;
    stim[1] = 128'h49d8d4b4d52213dc3dda2b3347034855;
    stim[2] = 128'h795f53c38f2804f9cd9eb6b3f5216816;
    stim[3] = 128'hccf85ee259e1af218f0b285785c726d2;
    stim[4] = 128'ha56be4e842319df9762b33fe472af64b;
    stim[5] = 128'h5090ae42da90f55282b84b9d6b5c0607;
    stim[6] = 128'hc388f07ae638540653818a7fe4fc8865;
    stim[7] = 128'h834f53695af3b50b87a8f7e1b04a15a0;
    stim[8] = 128'h6065f2b9ecb834949b012f8c60cb2c24;
    stim[9] = 128'h6871f10584fb4d28c5a22ad596113921;
    stim[10] = 128'hb6a6403df00eb489ee6bf34b04a04155;
    stim[11] = 128'h06381a54e245f377e9b8ac5bde93b124;
    stim[12] = 128'h78acd7448636e8e92d592839bb7b709d;
    stim[13] = 128'ha0c621d799f0c6a18941d2f5467618cb;
    stim[14] = 128'h49c5d36b8144fda08bedf75b9fc1a961;
    stim[15] = 128'h04fad5f72764541ecd53101abcf1aa9c;
    stim[16] = 128'h0ba382de0532fce810fa3f9a94d96482;
    stim[17] = 128'h5b27a946773704c063c821f914b74ecb;
    stim[18] = 128'h7e9ab563da7e3086cf4828584edeb58f;
    stim[19] = 128'h42d2cefc926231e61806ac7120eee6af;
    stim[20] = 128'h21c7fc9b0eb20f17c7453aaeb1fdab61;
    stim[21] = 128'h26a5cd8e10f192d3be8a613d439cbc61;
    stim[22] = 128'hcf3e1d58799da087a350701388fdd3f2;
    stim[23] = 128'hc680a262e988ea2803324200cb40cc60;
    stim[24] = 128'h2cc4ac218ef12e629ddce3a13f87d8a8;
    stim[25] = 128'hb8274012297ee5a8ebd8925928202a1d;
    stim[26] = 128'h1d6d8c86515355f93e5b7444c1997b3c;
    stim[27] = 128'h8c0379aa25dc27183d5d703fdb5b3217;
    stim[28] = 128'h034f77a0081646d92326f36d7731570e;
    stim[29] = 128'hd99416030bc4305c3f9029ab702e85db;
    stim[30] = 128'h45df1bbc4d390e4f622fac195105d6d7;
    stim[31] = 128'hcf9f1c48adac8b36e91552e960a2e773;
    stim[32] = 128'hfaddfb4efa65998361a7d4263fafc5de;
    stim[33] = 128'hfb02c5cc1b80f4b746e3a96ed1dd98b5;
    stim[34] = 128'h92cc950eb8153a64ffe4dafcc95c2583;
    stim[35] = 128'hba8ce57b29c2beade6340e8d5cb7a222;
    stim[36] = 128'ha3acffad8adae1333a027bc68150f62b;
    stim[37] = 128'h294bbdb8c379e5d2bc38637801962398;
    stim[38] = 128'h58556b8ce8460d3faf976399df32c15b;
    stim[39] = 128'h51392ef72c01ee811a77e507cbd6739b;
    stim[40] = 128'hcf7396aa588964aec304ffcab4138e95;
    stim[41] = 128'hb328d938e0290097b206aea71778d895;
    stim[42] = 128'he30818b91e82d5ac8f054392215b3d8c;
    stim[43] = 128'h3f98f16ded90f911c45c5379d5911274;
    stim[44] = 128'h1789867f3d392290d15a64895eeec308;
    stim[45] = 128'hfe281764630be45242657550603f0b9e;
    stim[46] = 128'hdd5fadf29c55064db40abecdd3e2f95c;
    stim[47] = 128'h3468c3b3f3b70cd50071c84ced235d0f;
    stim[48] = 128'hb95abbd166effc2a71162a5dfee62d42;
    stim[49] = 128'h77e0652fab89b45a5c0ebe8a7e5656ce;
    stim[50] = 128'h99b577131ed926860b8a29c9fd3b3e34;
    stim[51] = 128'h2accf487a33a6ef6c7253bc7594f3474;
    stim[52] = 128'he5d95cb1ef040998d9ab0c94f3a9c13d;
    stim[53] = 128'h40483351ffad49cb30c45703fd20db19;
    stim[54] = 128'h882af549b9e79ac649116e65ca6c6ee1;
    stim[55] = 128'he4d3d1495cdb348b8061fc77073cfe49;
    stim[56] = 128'hdd2deb2d0f778326a8e8b990b7ac9f36;
    stim[57] = 128'h833e9d0348e967fbae48241d54a40b01;
    stim[58] = 128'heb2089c40e310419642cb7dedcb7908f;
    stim[59] = 128'h08d1011c5e4add5716853dd09c9507bb;
    stim[60] = 128'h5b5d14d09895909a810c6a4e2b2b91f4;
    stim[61] = 128'h1f3d805595bdd6ad7402b5813b4a3f58;
    stim[62] = 128'hdd929f541c67b30f07358c019dd5b6b1;
    stim[63] = 128'h2128d7ef8ca12042ce3fa413583d3f48;
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
      expv[0] = 128'h9e9a27c24f42b915cdafc23728a85047;
      expv[1] = 128'h09c8d4b4d52213dc7dca2b3347034855;
      expv[2] = 128'h394f53c38f2804f98d8eb6b3f5216816;
      expv[3] = 128'h8ce85ee259e1af21cefb285785c726d2;
      expv[4] = 128'he55be4e842319df9361b33fe472af64b;
      expv[5] = 128'h104ae42da90f5520c2a84b9d6b5c0607;
      expv[6] = 128'h8378f07ae6385406134c53ff27e44328;
      expv[7] = 128'hc33f53695af3b50bc798f7e1b04a15a0;
      expv[8] = 128'h204be573d9706928dac97c6306596120;
      expv[9] = 128'h283f882c27da69408578ab565844e484;
      expv[10] = 128'hf68c807be01d6912ae5bf34b04a04155;
      expv[11] = 128'h46281a54e245f377a9a8ac5bde93b124;
      expv[12] = 128'h389cd7448636e8e96d492839bb7b709d;
      expv[13] = 128'he0ac43af33e18d42c90e97aa33b0c658;
      expv[14] = 128'h09aba6d70289fb40cbddf75b9fc1a961;
      expv[15] = 128'h44ead5f72764541e8d2c406af3c6aa70;
      expv[16] = 128'h4b7e0b7814cbf3a050ea3f9a94d96482;
      expv[17] = 128'h1b0f528cee6e098023b821f914b74ecb;
      expv[18] = 128'h3e8ab563da7e30868f3828584edeb58f;
      expv[19] = 128'h02ab3bf24988c79857ed58e241ddcd5e;
      expv[20] = 128'h61aff9361d641e2e872a755d63fb56c2;
      expv[21] = 128'h668b9b1c21e325a6fe7a613d439cbc61;
      expv[22] = 128'h8f2e1d58799da087e2fe02711fba7e40;
      expv[23] = 128'h863a262e988ea280430908032d033180;
      expv[24] = 128'h6ca958431de25cc4ddcce3a13f87d8a8;
      expv[25] = 128'hf80e802452fdcb50abc8925928202a1d;
      expv[26] = 128'h5d5d8c86515355f97e4b7444c1997b3c;
      expv[27] = 128'hcbdde6a897709c607d4d703fdb5b3217;
      expv[28] = 128'h433f77a0081646d9630de6daee62ae1c;
      expv[29] = 128'h99782c06178860b87f2a6adc0ba176c0;
      expv[30] = 128'h05cf1bbc4d390e4f221fac195105d6d7;
      expv[31] = 128'h8f8f1c48adac8b36a8faa5d2c145cee6;
      expv[32] = 128'hbacdfb4efa659983218fa84c7f5f8bbc;
      expv[33] = 128'hbadb17306e03d2dc06bea5bb477662d4;
      expv[34] = 128'hd2bc950eb8153a64bfc9b5f992b84b06;
      expv[35] = 128'hfa7ce57b29c2beada6181d1ab96f4444;
      expv[36] = 128'he39cffad8adae13379d9ef1a0543d8ac;
      expv[37] = 128'h693bbdb8c379e5d2fc28637801962398;
      expv[38] = 128'h183ad719d08c1a7eef7ec733be6582b6;
      expv[39] = 128'h11292ef72c01ee815a5fca0f97ace736;
      expv[40] = 128'h8f4e5aa9622592b882e9ff9568271d2a;
      expv[41] = 128'hf318d938e0290097f1ed5d4e2ef1b12a;
      expv[42] = 128'ha2f818b91e82d5acceea872442b67b18;
      expv[43] = 128'h7f88f16ded90f911844c5379d5911274;
      expv[44] = 128'h5779867f3d392290914a64895eeec308;
      expv[45] = 128'hbe181764630be452024aeaa0c07e173c;
      expv[46] = 128'h9d4fadf29c55064df3fabecdd3e2f95c;
      expv[47] = 128'h7458c3b3f3b70cd5403e4267691ae878;
      expv[48] = 128'hf94abbd166effc2a30fc54bbfdcc5a84;
      expv[49] = 128'h378ca5f571368b401bfebe8a7e5656ce;
      expv[50] = 128'hd99aee263db24d0c4b7a29c9fd3b3e34;
      expv[51] = 128'h6abcf487a33a6ef6870a778eb29e68e8;
      expv[52] = 128'ha5c95cb1ef040998999b0c94f3a9c13d;
      expv[53] = 128'h00383351ffad49cb70a8ae07fa41b632;
      expv[54] = 128'hc81af549b9e79ac608db732e53637708;
      expv[55] = 128'ha4af4525736cd22cc02fe3b839e7f248;
      expv[56] = 128'h9d1deb2d0f778326e8d8b990b7ac9f36;
      expv[57] = 128'hc32e9d0348e967fbee38241d54a40b01;
      expv[58] = 128'haad89c40e3104190241cb7dedcb7908f;
      expv[59] = 128'h489808e2f256eab8566a7ba1392a0f76;
      expv[60] = 128'h1b4d14d09895909ac0fc6a4e2b2b91f4;
      expv[61] = 128'h5f2d805595bdd6ad33dad604ed28fd60;
      expv[62] = 128'h9d6a7d50719ecc3c471b18033bab6d62;
      expv[63] = 128'h6118d7ef8ca120428e2fa413583d3f48;
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
