// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121269 dut (
    .clk(clk),
    .areset(in_vec[131:131]),
    .sel(in_vec[130:130]),
    .ntp_time_a(in_vec[129:66]),
    .ntp_time_upd_a(in_vec[65:65]),
    .ntp_time_b(in_vec[64:1]),
    .ntp_time_upd_b(in_vec[0:0]),
    .ntp_time(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'hd210c15d245661ccd0e3b7276ae2a309c;
    stim[1] = 132'ha52a529f5a9ee82d2cd34c4da9418aeb2;
    stim[2] = 132'h20a8c3d52755467b5f117ff9aafb0698b;
    stim[3] = 132'h31f1ded12a3f836f9742926b61b710d8e;
    stim[4] = 132'h4d2e1d9496164d391c3da4f265b671c85;
    stim[5] = 132'h489370b19df009f555f50670424edee7f;
    stim[6] = 132'h2b3b43f48f01eadecac1a7f835bfbd443;
    stim[7] = 132'h2108dd584de106c4e7dade876fc4f3110;
    stim[8] = 132'h7b421455304ff383fa5c682b1b7cd0300;
    stim[9] = 132'h4d254e47bf8616235da6d6603c73cb013;
    stim[10] = 132'h131cd9e7474d6060a0d7d55f4971b7d37;
    stim[11] = 132'h3d5376ba7ee82bff39d27f871b317bfe5;
    stim[12] = 132'h479cdcf9ebcf9390d6d0265d6feae2a51;
    stim[13] = 132'h0825b1a8da9fb6956043d55e32a21be68;
    stim[14] = 132'h4be4b023a06b4fe13a4ff8266cdce4858;
    stim[15] = 132'h6fad037698a5a4088a0d3cbcf288662d5;
    stim[16] = 132'h5b64383363584638e142c5ce2ce163ebf;
    stim[17] = 132'h6401498b08e021e5cdac2d4822f8ce9d2;
    stim[18] = 132'h561bbe691b36f416da8bfe8c05a9a2f84;
    stim[19] = 132'h6639794ea262fbe8c3069e6dd74dbff0d;
    stim[20] = 132'h566701248293cdc7b65de85b7ba41603b;
    stim[21] = 132'h4bf8e35e0b134c5672d2b4aca2a7d79eb;
    stim[22] = 132'h20299929791bc0837375062dea488847a;
    stim[23] = 132'h2c559fb2304ba99515e867dcfce9a4b0e;
    stim[24] = 132'h49141c9fe976b80b2b9dab8c2b9f69069;
    stim[25] = 132'h06e09d8225c089d7e02d121006c32e968;
    stim[26] = 132'h24ecc1819397ee6cf7cf38a2df7c085c7;
    stim[27] = 132'h6a71f580edef1ff34952b7ca6afc97c8e;
    stim[28] = 132'h5bf76ad4074ece48504515e4026b8f768;
    stim[29] = 132'h9faca38bfe9ed50ea71437035af124d3c;
    stim[30] = 132'h56ca0079f3d3f18665276e95a382ea491;
    stim[31] = 132'h5c7363e5a3db16956876f0ea20f98c647;
    stim[32] = 132'h0bc615a634007f4c86b55cf0ed2eb710c;
    stim[33] = 132'h65a7e9f3faaf4b21ea53db7e6a002e999;
    stim[34] = 132'h65498c250e5427fa923cb47c145c379c1;
    stim[35] = 132'h35c327fb3bf58c9371a6ad4f79f2ed6e2;
    stim[36] = 132'h40e82cd02276fcdd401ab7f8480342f89;
    stim[37] = 132'h1020e9ebb1bd2d3d0332591ad548af54d;
    stim[38] = 132'h5ac114f1a6c492f43f5ce9525ff25feaf;
    stim[39] = 132'h452448f9299a998b819afa06ae198eeee;
    stim[40] = 132'h0f60748243251d3b2c73414c8e82d0444;
    stim[41] = 132'h3f749aca935d3b71c19ceeec6fb70141f;
    stim[42] = 132'h5bbf79f5d124d67917fc8f1fc9c19c777;
    stim[43] = 132'h5a1725f03d7bf393af79fbe271e931b59;
    stim[44] = 132'h2de6ff189cb89f67fd009c2428599c18f;
    stim[45] = 132'h0fcae2935d951ff9d1f41be7bb6d43abf;
    stim[46] = 132'h4f9d09f9b28e3f2350f054fa4af24193a;
    stim[47] = 132'h285a6a5078879b3551f34390300541353;
    stim[48] = 132'h11847a3a8927e2fdb92a45f3453f649d3;
    stim[49] = 132'h12f0127d0b01314ac4e531ff36e240cea;
    stim[50] = 132'h69124d38f99e1bacb4827662bc8ca2f0e;
    stim[51] = 132'h4aa11cd2210160baf1ae9a37bb11f8022;
    stim[52] = 132'h650076ad14e314210ce1104fb5a6616c7;
    stim[53] = 132'h558bd64c3bc8953f2c60fd494f5f6a858;
    stim[54] = 132'h6ddd13e1cb4ac3375afb95369666dacd5;
    stim[55] = 132'h125bb1d95409961014adad6665ff8628c;
    stim[56] = 132'h3ffe400ea090fe6e496a875672e7d838e;
    stim[57] = 132'h7dc8770ad1858ce7b7a60b6b4fad18ebf;
    stim[58] = 132'h76ebc1075ad5e0545ef116b6cc50e59e9;
    stim[59] = 132'h31084e9246e0b76b900452439f9f55ade;
    stim[60] = 132'h08821072ea95425a0c61f9ab92698f481;
    stim[61] = 132'h29ab282d8acf9a6265a8802a95e35de93;
    stim[62] = 132'h18e026267088dbeb9760b4dbee2ad8318;
    stim[63] = 132'h08fb8d666175eecf7e7294ab4fcdae646;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'h82a30f549d5519ed;
      expv[4] = 64'hc7c77b44a8fe0dbe;
      expv[5] = 64'hc7c77b44a8fe0dbe;
      expv[6] = 64'hafa833821276f73f;
      expv[7] = 64'hafa833821276f73f;
      expv[8] = 64'hc7c77b44a8fe0dbe;
      expv[9] = 64'hed085154c13fce0f;
      expv[10] = 64'hd2e34158dbe68180;
      expv[11] = 64'h06beaafa4b8dbe9b;
      expv[12] = 64'hf54ddae9fba0affc;
      expv[13] = 64'hf54ddae9fba0affc;
      expv[14] = 64'h06beaafa4b8dbe9b;
      expv[15] = 64'h2f92c08e81ad3f84;
      expv[16] = 64'hd27fc13366e7242c;
      expv[17] = 64'h0a162e71670b1f5f;
      expv[18] = 64'h0a162e71670b1f5f;
      expv[19] = 64'hd45ff4602d4d17c2;
      expv[20] = 64'hd45ff4602d4d17c2;
      expv[21] = 64'hb2ef42dbdd20b01d;
      expv[22] = 64'hb2ef42dbdd20b01d;
      expv[23] = 64'hb2ef42dbdd20b01d;
      expv[24] = 64'h2fe38d782c4d3159;
      expv[25] = 64'h2450727fa5dae02c;
      expv[26] = 64'h01689080361974b4;
      expv[27] = 64'h1b8276089702275f;
      expv[28] = 64'h1b8276089702275f;
      expv[29] = 64'h8228af20135c7bb4;
      expv[30] = 64'h8228af20135c7bb4;
      expv[31] = 64'h5b2801e7cf4fc619;
      expv[32] = 64'h43b7875107cc6323;
      expv[33] = 64'h43b7875107cc6323;
      expv[34] = 64'h969fa7cfeabd2c87;
      expv[35] = 64'h91e5a3e0a2e1bce0;
      expv[36] = 64'h91e5a3e0a2e1bce0;
      expv[37] = 64'h03a0b34089dbf375;
      expv[38] = 64'h1992c8d6aa457aa6;
      expv[39] = 64'h4083a7aec6f4b4f4;
      expv[40] = 64'h1992c8d6aa457aa6;
      expv[41] = 64'h639a0a6474168222;
      expv[42] = 64'hfdd26b2a4d74edc7;
      expv[43] = 64'h6efde7d7449359e4;
      expv[44] = 64'hbfe478fe4e0ce3bb;
      expv[45] = 64'hbfe478fe4e0ce3bb;
      expv[46] = 64'hb79bfc6272e27d9f;
      expv[47] = 64'h3e7427e6ca38fc8d;
      expv[48] = 64'h8f9a1c81802a09a9;
      expv[49] = 64'h3e7427e6ca38fc8d;
      expv[50] = 64'h4bc049f42c04c52b;
      expv[51] = 64'ha44934e3e6786eb2;
      expv[52] = 64'ha413b315e4651787;
      expv[53] = 64'ha413b315e4651787;
      expv[54] = 64'h6307ea4a7afb542c;
      expv[55] = 64'hd7dca9b4b336d66a;
      expv[56] = 64'ha56d6b332ffc3146;
      expv[57] = 64'h496ec76550265840;
      expv[58] = 64'h496ec76550265840;
      expv[59] = 64'hf788b5b662872cf4;
      expv[60] = 64'hf788b5b662872cf4;
      expv[61] = 64'hc4213a491b82ddae;
      expv[62] = 64'hc4213a491b82ddae;
      expv[63] = 64'h63809899c2236fae;
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
