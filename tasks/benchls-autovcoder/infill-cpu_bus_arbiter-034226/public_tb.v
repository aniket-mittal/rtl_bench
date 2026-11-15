// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 140;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034226 dut (
    .clk_cpu(clk),
    .io_iBus_cmd_valid(in_vec[135:135]),
    .io_iBus_cmd_payload_pc(in_vec[134:103]),
    .io_dBus_cmd_valid(in_vec[102:102]),
    .io_dBus_cmd_payload_wr(in_vec[101:101]),
    .io_dBus_cmd_payload_address(in_vec[100:69]),
    .io_dBus_cmd_payload_data(in_vec[68:37]),
    .io_dBus_cmd_payload_size(in_vec[36:35]),
    .io_masterBus_cmd_ready(in_vec[34:34]),
    .io_masterBus_rsp_valid(in_vec[33:33]),
    .io_masterBus_rsp_payload_data(in_vec[32:1]),
    .clk_cpu_reset_(in_vec[0:0]),
    .io_iBus_cmd_ready(out_vec[139:139]),
    .io_iBus_rsp_valid(out_vec[138:138]),
    .io_iBus_rsp_payload_error(out_vec[137:137]),
    .io_iBus_rsp_payload_inst(out_vec[136:105]),
    .io_dBus_cmd_ready(out_vec[104:104]),
    .io_dBus_rsp_ready(out_vec[103:103]),
    .io_dBus_rsp_error(out_vec[102:102]),
    .io_dBus_rsp_data(out_vec[101:70]),
    .io_masterBus_cmd_valid(out_vec[69:69]),
    .io_masterBus_cmd_payload_write(out_vec[68:68]),
    .io_masterBus_cmd_payload_address(out_vec[67:36]),
    .io_masterBus_cmd_payload_data(out_vec[35:4]),
    .io_masterBus_cmd_payload_mask(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h7bd3f499d3280379009fc1a0998802476d;
    stim[1] = 136'he98b5afb9a877e242963b9be6b8b3ec95f;
    stim[2] = 136'h840491cb9bf1f50e7791c9640a5e07694e;
    stim[3] = 136'h8e8cc5a44897dd1ebfde9e8146c909a9e2;
    stim[4] = 136'h7513bf50eda6e8f334d96a53d6d1029a9a;
    stim[5] = 136'hb41a3af257b2f799e0c704726bdf87d016;
    stim[6] = 136'h542e7c3f6a28f44cb4e0e22d4bee8b6dac;
    stim[7] = 136'hc4453ddf587bba5b5f7439ddd76cf76194;
    stim[8] = 136'h433fa856bb1d0acbd5cfccccc0a83ae2d2;
    stim[9] = 136'h65405bc73decc1b62fcf0c006df3408142;
    stim[10] = 136'h927f5794af4754244df24b14fc9e505c92;
    stim[11] = 136'hc3eabc417b12ed93f21d7935434885e296;
    stim[12] = 136'h3e766f38be225f8bbe46c625bf08390914;
    stim[13] = 136'h0fbfddf7c9e0865af3933ffdf6e1c36fc4;
    stim[14] = 136'h9013e65eb647d4f7b9a094eb47529cb542;
    stim[15] = 136'hf9820f5c2fc737b9241565c99e62c74c66;
    stim[16] = 136'h3fe4d635543fc91e1182fdb1f0efb0a9c4;
    stim[17] = 136'h40814aae2387a1b892909b2441ebdf972e;
    stim[18] = 136'h6eff7b8beb34d642958be4fad142d9b76a;
    stim[19] = 136'hffe5419960c8fcff9af9294eb986b6f718;
    stim[20] = 136'h5ec08c59ce37e842a307b9f6e9e2443406;
    stim[21] = 136'h24ce059f362f24f6e02a65284fdcc20310;
    stim[22] = 136'h0221e479bc4f890c5f7c29caa0625c7280;
    stim[23] = 136'h25d29e4b58b730d68d258aecf76587b3cc;
    stim[24] = 136'h54f6e0ef50ec92e4d7504999f36a3c5f36;
    stim[25] = 136'h628451028272bc857f7e6532cd01f044de;
    stim[26] = 136'h2c8d34adf36398bb67fc0cc1ddf4a95ad4;
    stim[27] = 136'h596e99693333a0ba334ba999a65aabac1a;
    stim[28] = 136'h794349e1bd58c001474d99e1c5a4fc40e8;
    stim[29] = 136'h80cfd0184656ac451d3d92e2d4865da5cc;
    stim[30] = 136'hc5799cbe0e2ac5e4dba5cc4c9bcbbb56ee;
    stim[31] = 136'hc2cd7aedb5899f4adfad9a5724902a2d70;
    stim[32] = 136'ha17336f866b80ec41bb966b19b5fcc13e4;
    stim[33] = 136'he7b6d0d194a776c8492427952115720570;
    stim[34] = 136'he76079ea197f93b79a34e62f4407f814e8;
    stim[35] = 136'hbde206edaca196452bc1cd1cd4f24b0844;
    stim[36] = 136'h0fad58b1fa6a5e69fd90a2bb6d896b6a46;
    stim[37] = 136'h6b2bad0e4274ebc678d96540bb2c8c3636;
    stim[38] = 136'h6a30ac102db604ab7e60f358cfd20d7c72;
    stim[39] = 136'h6ba48fc9250d709d5372e179a00d21f5ec;
    stim[40] = 136'hed51bc5e93c3b03ba319131809440b4014;
    stim[41] = 136'h5d27509129a602bbdd94d495a957998192;
    stim[42] = 136'h4759554918eea1711898a0b3d847fdb57c;
    stim[43] = 136'h40fe2afe28d226c57c41f67595e1aeef3e;
    stim[44] = 136'h2b9c8e08557ad601fd6ee6530d7d066c4e;
    stim[45] = 136'hcd9350372a38f790079d778d667787ff70;
    stim[46] = 136'h599853fe9cb8ae8f39704663be79a90a66;
    stim[47] = 136'h3644a2356c0bbd4bfca7311c139657c882;
    stim[48] = 136'h8dfbca74368c9b365981c0e320bdca195a;
    stim[49] = 136'h2313b0e8d38f410674f1dece78b399c1d4;
    stim[50] = 136'hf50e0f103385837c0d15b7ad1ed66942c8;
    stim[51] = 136'h76dde432088163688c04d92f8a5b0ca8e8;
    stim[52] = 136'h8488d995aa8a8548816b8266f79549297c;
    stim[53] = 136'hd17a14bb3fd129ac5b1febc1ef91a84d6e;
    stim[54] = 136'ha10ae8e8bc23d0154bee9f9765befef62e;
    stim[55] = 136'hdfd5222914f505e1673b04439dc0315c06;
    stim[56] = 136'h3db1908ea7e7bc1dc982c3b21cf9e2a50e;
    stim[57] = 136'hac16fe8288732afcd65d798074b8e0c7ae;
    stim[58] = 136'he02e66604dec2ee589c516e863400f5aa0;
    stim[59] = 136'hb5090231e76d2d3560470a36a6f65e45e8;
    stim[60] = 136'h28062971c885fe867559f959ffff298f4a;
    stim[61] = 136'h2cb02610e838cbca03be231a58b80fc584;
    stim[62] = 136'h9167a9ccca72237c7bb122841838aaf00c;
    stim[63] = 136'ha6d8a8fb0c026af80bbdc9c78fedb254f4;
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
      expv[0] = 140'h18802476c310048eda99401bc804fe0d04f;
      expv[1] = 140'hx8b3ec95ex167d92bed316b5f74b1dcdf36;
      expv[2] = 140'hx5e07694exbc0ed29e08092397bc8e4b208;
      expv[3] = 140'h4c909a9e31921353c644bee8f5fef4f40a2;
      expv[4] = 140'h4d1029a9b1a20535376d374799a6cb529ee;
      expv[5] = 140'h5df87d0163bf0fa02ebd97bccf063823938;
      expv[6] = 140'h5ee8b6dac3dd16db5b5147a265a707116a6;
      expv[7] = 140'h56cf761952d9eec32ac3ddd2dafba1ceeec;
      expv[8] = 140'h0a83ae2d215075c5a4867f50adae7e66664;
      expv[9] = 140'h9f34081433e6810284ca80b78e7e7860036;
      expv[10] = 140'h89e505c9313ca0b92624feaf296f9258a7c;
      expv[11] = 140'h54885e2962910bc52fd8976c9f90ebc9aa8;
      expv[12] = 140'hd083909152107212287cecde71f236312de;
      expv[13] = 140'h4e1c36fc51c386df8a4f0432d79c99ffef8;
      expv[14] = 140'hd529cb5432a5396a862027ccbdcd04a75a2;
      expv[15] = 140'hc62c74c670c58e98cef3041eb820ab2e4ce;
      expv[16] = 140'h0efb0a9c41df61538aa1fe48f08c17ed8ff;
      expv[17] = 140'h1ebdf972e3d7bf2e5c8102955c9484d9221;
      expv[18] = 140'h142d9b76a285b36ed759a6b214ac5f27d6f;
      expv[19] = 140'h186b6f71830d6dee330647e7fcd7c94a75f;
      expv[20] = 140'h1e24434063c488680e71bf4215183dcfb76;
      expv[21] = 140'hddcc203113b9840620499c0b3e015329428;
      expv[22] = 140'h0625c72800c4b8e5000443c8f3fbe14e554;
      expv[23] = 140'h56587b3cd2cb0f679ac5b986b4692c5767f;
      expv[24] = 140'h56a3c5f362d478be6e87649726ba824ccfc;
      expv[25] = 140'h901f044df203e089bcc508a205fbf329968;
      expv[26] = 140'h1f4a95ad53e952b5ab9b1cc5db3fe0660e8;
      expv[27] = 140'hc5aabac1b0b5575834b2dd32d29a5d4ccd2;
      expv[28] = 140'h9a4fc40e9349f881d0f28693c33a6ccf0e4;
      expv[29] = 140'h0865da5cd10cbb4b9a32b56228e9ec9716f;
      expv[30] = 140'h5cbbb56ee39776adde8af3397cdd2e6264c;
      expv[31] = 140'h8902a2d71120545ae2859af5dbfd6cd2b94;
      expv[32] = 140'h55fcc13e42bf9827cb35c07620ddcb358cf;
      expv[33] = 140'h11572057022ae40ae2cf6da1a349213ca94;
      expv[34] = 140'h807f814e900ff029d2cec0f3d4d1a7317a1;
      expv[35] = 140'h8f24b08451e496108a7bc40ddb5e0e68e6e;
      expv[36] = 140'h1896b6a47312d6d48fd352f34fec8515db8;
      expv[37] = 140'h52c8c3636259186c6e13a75e33c6cb2a058;
      expv[38] = 140'hdd20d7c733a41af8e4d4615820f3079ac68;
      expv[39] = 140'h00d21f5ec01a43ebd8d7491f929b970bcd4;
      expv[40] = 140'h1440b401428816802adaa378bd18c898c06;
      expv[41] = 140'h1579981922af330324ba4ea122eca6a4adc;
      expv[42] = 140'h047fdb57c08ffb6af88eb2aa92c4c5059ef;
      expv[43] = 140'h9e1aeef3f3c35dde7c81fc55fce20fb3ac8;
      expv[44] = 140'h17d066c4f2fa0cd89eabd6b00feb7732988;
      expv[45] = 140'hc7787ff710ef0ffee29b26a06e3cebbc6b1;
      expv[46] = 140'hc79a90a670f35214ccb330a7fdcb82331de;
      expv[47] = 140'h59657c88232caf9107605dea5fe53988e08;
      expv[48] = 140'h0bdca195a17b9432b61bf794e8cc0e07194;
      expv[49] = 140'h0b399c1d41673383aa9c7a0833a78ef6738;
      expv[50] = 140'hcd66942c91acd28592ea1c1e2068adbd68f;
      expv[51] = 140'h45b0ca8e80b61951d0edbbc8646026c97c3;
      expv[52] = 140'hd9549297d32a9252fa0911b32b0b5c1337f;
      expv[53] = 140'hd91a84d6f323509adea2f42976d8ff5e0fc;
      expv[54] = 140'h9befef62f37dfdec5e4215d1d15f74fcbb4;
      expv[55] = 140'h9c0315c0738062b80ebfaa445239d8221c8;
      expv[56] = 140'h8f9e2a50f1f3c54a1c7b63211d4c161d90c;
      expv[57] = 140'h8b8e0c7af171c18f5e582dfd05b2ebcc03c;
      expv[58] = 140'h5400f5aa02801eb5426f61772c4e28b7431;
      expv[59] = 140'h4f65e45e91ecbc8bd33b6969ab023851b58;
      expv[60] = 140'h5ff298f4b3fe531e96442ff433aacfcacf8;
      expv[61] = 140'h0b80fc5841701f8b0b41c65e501df118d2f;
      expv[62] = 140'h038aaf00c07155e01a53911be3dd8914208;
      expv[63] = 140'hdedb254f53db64a9ea4db151f65dee4e3c3;
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
