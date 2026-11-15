// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 160;
  localparam OW = 159;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_096471 dut (
    .clk(clk),
    .rst(in_vec[159:159]),
    .mem_to_reg_in(in_vec[158:158]),
    .mem_write_in(in_vec[157:157]),
    .mem_read_in(in_vec[156:156]),
    .reg_write_in(in_vec[155:155]),
    .reg_dst_in(in_vec[154:154]),
    .alu_src_in(in_vec[153:153]),
    .alu_op_in(in_vec[152:150]),
    .Rtype_in(in_vec[149:149]),
    .lw_in(in_vec[148:148]),
    .sw_in(in_vec[147:147]),
    .j_in(in_vec[146:146]),
    .beq_in(in_vec[145:145]),
    .bne_in(in_vec[144:144]),
    .nop_in(in_vec[143:143]),
    .pc_plus4_in(in_vec[142:111]),
    .read_data1_in(in_vec[110:79]),
    .read_data2_in(in_vec[78:47]),
    .address_in(in_vec[46:15]),
    .rs_in(in_vec[14:10]),
    .rt_in(in_vec[9:5]),
    .rd_in(in_vec[4:0]),
    .mem_to_reg_out(out_vec[158:158]),
    .mem_write_out(out_vec[157:157]),
    .mem_read_out(out_vec[156:156]),
    .reg_write_out(out_vec[155:155]),
    .reg_dst_out(out_vec[154:154]),
    .alu_src_out(out_vec[153:153]),
    .alu_op_out(out_vec[152:150]),
    .Rtype_out(out_vec[149:149]),
    .lw_out(out_vec[148:148]),
    .sw_out(out_vec[147:147]),
    .j_out(out_vec[146:146]),
    .beq_out(out_vec[145:145]),
    .bne_out(out_vec[144:144]),
    .nop_out(out_vec[143:143]),
    .pc_plus4_out(out_vec[142:111]),
    .read_data1_out(out_vec[110:79]),
    .read_data2_out(out_vec[78:47]),
    .address_out(out_vec[46:15]),
    .rs_out(out_vec[14:10]),
    .rt_out(out_vec[9:5]),
    .rd_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 160'hc8bf970e0b34d3ef81a83d46d798eed048a6ed9c;
    stim[1] = 160'ha2661cb459fcc396f69de50ddfb1f24472e57f16;
    stim[2] = 160'h571509d7561fb54beee87ae35abee847e503367f;
    stim[3] = 160'h3e4a29fcecd9d38e57c7aa8f29cff6e9f53ee67f;
    stim[4] = 160'h29a027e68394de6292f53c8b8b6806965a069a1b;
    stim[5] = 160'h2c813c98a4e9ef24f3d6d0e8b76fe2d732cca755;
    stim[6] = 160'h6adae65e4976df31599155578e1430624e544732;
    stim[7] = 160'h31aac1c264d0af0d10313b98bd4aef54963a382e;
    stim[8] = 160'h3a857bfb7274cafdf30488596f20c88485b777f3;
    stim[9] = 160'h4b9990657fe5f1c3478b44b0065c1a8009fbd5aa;
    stim[10] = 160'h5947d7f46ca8c86b8916284e255bf8d36ea201de;
    stim[11] = 160'h6f7c0abe703173fcbeb1d210c49851c0f7f5533d;
    stim[12] = 160'h536379ffc2973ba5fd72fb26e612ebca520a6a50;
    stim[13] = 160'h0d8894caa8f886ea61b8826c3d1c6c799ef4626e;
    stim[14] = 160'h7309445a8c95c4e5a4129229631de36e69773f7b;
    stim[15] = 160'h5133ba0e7c967a1e61e3536d181828d8a365abba;
    stim[16] = 160'h1d0cc6b654c4d8b98467ae80225cd1d14348601b;
    stim[17] = 160'h7f50a9f0f70ef652364db4fbc919b48b36229bc0;
    stim[18] = 160'h3eba80defa5a23a89c1e0b678112056c05a9184a;
    stim[19] = 160'h169cc81c8242bf69fda13f141d55e05134ab093e;
    stim[20] = 160'h0d02822336f889ea4339641424be76d8c5cb4868;
    stim[21] = 160'h3646303789bff0d83890377765e30fe47887a7e9;
    stim[22] = 160'h401f632a4750a5ca6770996d6789e91ce6923462;
    stim[23] = 160'h72551e0600394dc0308393203a87aac28b5d928c;
    stim[24] = 160'h06f96af59623f2e76dee490d2927bf7ba50682d1;
    stim[25] = 160'h5166f9e5e6d4fd939cc3531c9a7ab11f6ec87e7c;
    stim[26] = 160'h6032ebf3276fafe6c83b18988847c706906e5248;
    stim[27] = 160'h728b970f94144c3e50d3f7481889808286b72b01;
    stim[28] = 160'h0dc52573940cd41a7823d09d7e2f2d4737ff8cae;
    stim[29] = 160'h3465ca4007fbb313a1da68544291831e7385d83e;
    stim[30] = 160'h64cf43b490b3041b6972b005014f8c992bbf36f0;
    stim[31] = 160'h758511eb9692b79447ea68a0df620c99735cd3ee;
    stim[32] = 160'h3d345f817976af60e707020615b73ef38e0f2e7c;
    stim[33] = 160'h172ce3df90d2a16efde087b5400722bf80acc86b;
    stim[34] = 160'h7b6315975fc58da24ce9ff9141d0b4056e2cecb9;
    stim[35] = 160'h15bf440d015eaec1ab3980a0f252437d3d1a4fc1;
    stim[36] = 160'h3d67c1fc9e01711486ed04950defa0e7c797f684;
    stim[37] = 160'h2673322b3160cbbfe508f94b34fb0f33880f4da5;
    stim[38] = 160'h01da208ff68535b86dfb24c485be3542a2dd7f71;
    stim[39] = 160'h64dc447d689217c0374eaaf57e99d21724b1e477;
    stim[40] = 160'h309d045ece19100787a0a4fe542cff5e077941aa;
    stim[41] = 160'h17141608deef313c207c56416edce468a0766080;
    stim[42] = 160'h26abe8163df95e02feb2c2b406c050b580920c98;
    stim[43] = 160'h6a258fb99f5596c5c517f7b5c0b65a36a3645015;
    stim[44] = 160'h086f3a7334273a450367298ee7ae53b71fc85b94;
    stim[45] = 160'h78873e08a4ed2e7b9753bb8852501857c658b10b;
    stim[46] = 160'h5abc8a1d15d9bfa1e4665bf66ec427e0d5068329;
    stim[47] = 160'h06eaaa5f470da761ba4de3b9cfd7cdb93cf7fa59;
    stim[48] = 160'h5f352baf45ba2e0f8b23e82511367d0dd2c29884;
    stim[49] = 160'h0979e1b6062a00f089d642b9e2a9dab8355afc69;
    stim[50] = 160'h5beb99bd869548e6f0becfdf09ec5b7a568c0d00;
    stim[51] = 160'h1fb4b5d1d3f252693a08e01defb1ca7f5cee2a09;
    stim[52] = 160'h168991cfc11f5c170184bec2e18fb787ee3564fc;
    stim[53] = 160'h3735211b4a2552f442a7c23fefadedf0a82d64a7;
    stim[54] = 160'h06844596574f91ac54252638629487c68bcc89a5;
    stim[55] = 160'h40376aeef0247921e29e6a13278f76dbd1f13019;
    stim[56] = 160'h2e54cb7bbb1c6d922e517559a162f51c1ce53b43;
    stim[57] = 160'h347d685bd93b7184e461ea511da85f972484a16a;
    stim[58] = 160'h4734619fd5d68a41dc144bca0a416a53f179d632;
    stim[59] = 160'h5e6955a46dce12584dd418c4ca8df68e4192b2d0;
    stim[60] = 160'h1f6c7e77946fb7e06db316cc8167a312b18199ef;
    stim[61] = 160'h3d713fc30d7d58f016351bfacf9039adb59c261b;
    stim[62] = 160'h4318e2fe1398a2a78c22f0043687e08bb306fa75;
    stim[63] = 160'h14855808040563b94b260cc4723134249cbd2019;
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
      expv[0] = 159'h0000800000000000000000000000000000000000;
      expv[1] = 159'h0000800000000000000000000000000000000000;
      expv[2] = 159'h0000800000000000000000000000000000000000;
      expv[3] = 159'h571509d7561fb54beee87ae35abee847e503367f;
      expv[4] = 159'h3e4a29fcecd9d38e57c7aa8f29cff6e9f53ee67f;
      expv[5] = 159'h29a027e68394de6292f53c8b8b6806965a069a1b;
      expv[6] = 159'h2c813c98a4e9ef24f3d6d0e8b76fe2d732cca755;
      expv[7] = 159'h6adae65e4976df31599155578e1430624e544732;
      expv[8] = 159'h31aac1c264d0af0d10313b98bd4aef54963a382e;
      expv[9] = 159'h3a857bfb7274cafdf30488596f20c88485b777f3;
      expv[10] = 159'h4b9990657fe5f1c3478b44b0065c1a8009fbd5aa;
      expv[11] = 159'h5947d7f46ca8c86b8916284e255bf8d36ea201de;
      expv[12] = 159'h6f7c0abe703173fcbeb1d210c49851c0f7f5533d;
      expv[13] = 159'h536379ffc2973ba5fd72fb26e612ebca520a6a50;
      expv[14] = 159'h0d8894caa8f886ea61b8826c3d1c6c799ef4626e;
      expv[15] = 159'h7309445a8c95c4e5a4129229631de36e69773f7b;
      expv[16] = 159'h5133ba0e7c967a1e61e3536d181828d8a365abba;
      expv[17] = 159'h1d0cc6b654c4d8b98467ae80225cd1d14348601b;
      expv[18] = 159'h7f50a9f0f70ef652364db4fbc919b48b36229bc0;
      expv[19] = 159'h3eba80defa5a23a89c1e0b678112056c05a9184a;
      expv[20] = 159'h169cc81c8242bf69fda13f141d55e05134ab093e;
      expv[21] = 159'h0d02822336f889ea4339641424be76d8c5cb4868;
      expv[22] = 159'h3646303789bff0d83890377765e30fe47887a7e9;
      expv[23] = 159'h401f632a4750a5ca6770996d6789e91ce6923462;
      expv[24] = 159'h72551e0600394dc0308393203a87aac28b5d928c;
      expv[25] = 159'h06f96af59623f2e76dee490d2927bf7ba50682d1;
      expv[26] = 159'h5166f9e5e6d4fd939cc3531c9a7ab11f6ec87e7c;
      expv[27] = 159'h6032ebf3276fafe6c83b18988847c706906e5248;
      expv[28] = 159'h728b970f94144c3e50d3f7481889808286b72b01;
      expv[29] = 159'h0dc52573940cd41a7823d09d7e2f2d4737ff8cae;
      expv[30] = 159'h3465ca4007fbb313a1da68544291831e7385d83e;
      expv[31] = 159'h64cf43b490b3041b6972b005014f8c992bbf36f0;
      expv[32] = 159'h758511eb9692b79447ea68a0df620c99735cd3ee;
      expv[33] = 159'h3d345f817976af60e707020615b73ef38e0f2e7c;
      expv[34] = 159'h172ce3df90d2a16efde087b5400722bf80acc86b;
      expv[35] = 159'h7b6315975fc58da24ce9ff9141d0b4056e2cecb9;
      expv[36] = 159'h15bf440d015eaec1ab3980a0f252437d3d1a4fc1;
      expv[37] = 159'h3d67c1fc9e01711486ed04950defa0e7c797f684;
      expv[38] = 159'h2673322b3160cbbfe508f94b34fb0f33880f4da5;
      expv[39] = 159'h01da208ff68535b86dfb24c485be3542a2dd7f71;
      expv[40] = 159'h64dc447d689217c0374eaaf57e99d21724b1e477;
      expv[41] = 159'h309d045ece19100787a0a4fe542cff5e077941aa;
      expv[42] = 159'h17141608deef313c207c56416edce468a0766080;
      expv[43] = 159'h26abe8163df95e02feb2c2b406c050b580920c98;
      expv[44] = 159'h6a258fb99f5596c5c517f7b5c0b65a36a3645015;
      expv[45] = 159'h086f3a7334273a450367298ee7ae53b71fc85b94;
      expv[46] = 159'h78873e08a4ed2e7b9753bb8852501857c658b10b;
      expv[47] = 159'h5abc8a1d15d9bfa1e4665bf66ec427e0d5068329;
      expv[48] = 159'h06eaaa5f470da761ba4de3b9cfd7cdb93cf7fa59;
      expv[49] = 159'h5f352baf45ba2e0f8b23e82511367d0dd2c29884;
      expv[50] = 159'h0979e1b6062a00f089d642b9e2a9dab8355afc69;
      expv[51] = 159'h5beb99bd869548e6f0becfdf09ec5b7a568c0d00;
      expv[52] = 159'h1fb4b5d1d3f252693a08e01defb1ca7f5cee2a09;
      expv[53] = 159'h168991cfc11f5c170184bec2e18fb787ee3564fc;
      expv[54] = 159'h3735211b4a2552f442a7c23fefadedf0a82d64a7;
      expv[55] = 159'h06844596574f91ac54252638629487c68bcc89a5;
      expv[56] = 159'h40376aeef0247921e29e6a13278f76dbd1f13019;
      expv[57] = 159'h2e54cb7bbb1c6d922e517559a162f51c1ce53b43;
      expv[58] = 159'h347d685bd93b7184e461ea511da85f972484a16a;
      expv[59] = 159'h4734619fd5d68a41dc144bca0a416a53f179d632;
      expv[60] = 159'h5e6955a46dce12584dd418c4ca8df68e4192b2d0;
      expv[61] = 159'h1f6c7e77946fb7e06db316cc8167a312b18199ef;
      expv[62] = 159'h3d713fc30d7d58f016351bfacf9039adb59c261b;
      expv[63] = 159'h4318e2fe1398a2a78c22f0043687e08bb306fa75;
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
