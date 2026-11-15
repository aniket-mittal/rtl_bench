// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 157;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_core dut (
    .clk_i(clk),
    .rst_ni(in_vec[156:156]),
    .test_en_i(in_vec[155:155]),
    .hart_id_i(in_vec[154:123]),
    .boot_addr_i(in_vec[122:91]),
    .instr_gnt_i(in_vec[90:90]),
    .instr_rvalid_i(in_vec[89:89]),
    .instr_rdata_i(in_vec[88:57]),
    .instr_err_i(in_vec[56:56]),
    .data_gnt_i(in_vec[55:55]),
    .data_rvalid_i(in_vec[54:54]),
    .data_rdata_i(in_vec[53:22]),
    .data_err_i(in_vec[21:21]),
    .irq_software_i(in_vec[20:20]),
    .irq_timer_i(in_vec[19:19]),
    .irq_external_i(in_vec[18:18]),
    .irq_fast_i(in_vec[17:3]),
    .irq_nm_i(in_vec[2:2]),
    .debug_req_i(in_vec[1:1]),
    .fetch_enable_i(in_vec[0:0]),
    .instr_req_o(out_vec[103:103]),
    .instr_addr_o(out_vec[102:71]),
    .data_req_o(out_vec[70:70]),
    .data_we_o(out_vec[69:69]),
    .data_be_o(out_vec[68:65]),
    .data_addr_o(out_vec[64:33]),
    .data_wdata_o(out_vec[32:1]),
    .core_sleep_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 157'h01d6d6c5779045daf289e6c40258457f8802bd13;
    stim[1] = 157'h0567631113f86c349c3d776c4ca4fede3e53c737;
    stim[2] = 157'h1f10be20362a3b173b04a42bd834071135b0dea8;
    stim[3] = 157'h19076eb1062f28adcc272c7fa163e4a6525c2072;
    stim[4] = 157'h1a946683643230b8350a1aa722c1116f7a5e70b6;
    stim[5] = 157'h1755062cb18efeab5dd8ab10fbf6f5638d9f280b;
    stim[6] = 157'h154077a57e7976db2fb25f8ef4f4a8fbd283672f;
    stim[7] = 157'h102906b8ef5159f4c9a8c0ff4af951f39b736f31;
    stim[8] = 157'h1c541cc052f563be0b7dc3488f67496515d3bb81;
    stim[9] = 157'h1d36a48f1b718f1a1977db563afe3be11844e2cb;
    stim[10] = 157'h1e2b500f346d2b22045ec5cc143acbc22cd47cfb;
    stim[11] = 157'h16c6c8cbd92bd1b08d85f92232db8001b453860b;
    stim[12] = 157'h141caa96ead45d98eb4e252164bcec29cd905e63;
    stim[13] = 157'h12be8c4df5dd0f8b48dab2921f3c89f59f92392e;
    stim[14] = 157'h17e7a54411eb640840e24909470095219d9f65d3;
    stim[15] = 157'h1ffa54d06680c5f91cb7ad040e9ad65f54c1e91f;
    stim[16] = 157'h11f6b22b8e3cb4240913aa88cf0fd8b6b537f6b1;
    stim[17] = 157'h1aaf17bf94689ead786b984603f01e93b1794f0e;
    stim[18] = 157'h12209789810d8e626b2103a645db68a2439ba50a;
    stim[19] = 157'h18475266d0fcd3ff6ec0429d091f2b8dfc5e3665;
    stim[20] = 157'h13f72110c6046580bf33a3ce2988cb66d822a765;
    stim[21] = 157'h129dfb21e4b422e84a47a9a2d2266195f7fd0805;
    stim[22] = 157'h1ad1fbce9baafaf7bea069b4a6fde7e349910c64;
    stim[23] = 157'h1af40ceeeae8a21c6fe574caa98362fc0c5acc84;
    stim[24] = 157'h1e72ea41131d199e236fcfdf74ee73836a93aba5;
    stim[25] = 157'h1a490d7ad284bb3318b8480efc20eb4067a4095b;
    stim[26] = 157'h168cef55a9933f1d3cfd691f3215b57f43b7cd37;
    stim[27] = 157'h115231bd9f7142b4f3117e150e48bf6aeda91c84;
    stim[28] = 157'h1413bfeead923b53a58dd70e308c97c2b3c86944;
    stim[29] = 157'h1aa48f5cdec46b319ddc083a48f1b6185119cba3;
    stim[30] = 157'h1c90238eeecde52fbf8dbb94da9a77a94b44dd84;
    stim[31] = 157'h1cd30ea6a5da2e30aa94c7dda252eb776a259ef0;
    stim[32] = 157'h1c4f6f855b2b956c7d9fb7839c4f20d5508edc86;
    stim[33] = 157'h140847ba14de9602b7723376ad0292bfb5a4ea9c;
    stim[34] = 157'h1f7713c28e9a007dd8e1a1bc43fc43d0b24b2acc;
    stim[35] = 157'h1b0474b575d66114da2c437f47b2aa16050bb529;
    stim[36] = 157'h194cace3702604acb6e5fdb464dd3d3e66df3080;
    stim[37] = 157'h123e3629fa2bf95d1cbbd6ef284dc572b4643810;
    stim[38] = 157'h1aa9a8c71fd1311204b5ca8ab2d0123c00da44c3;
    stim[39] = 157'h17aa76cd3886092ea5461f9fbd69250d1022cf8d;
    stim[40] = 157'h192fc00e2a1efbfbfcde1a452ce7a66d075756fd;
    stim[41] = 157'h11f17b0244d8b03a2ff0335d6cfe6eea03181611;
    stim[42] = 157'h1a928ac51d42c6d5bff0acd7e2d8350d8185b711;
    stim[43] = 157'h1e3e75f30380afa947fbcfb75ae50c533b2425f6;
    stim[44] = 157'h14d5476cba34533bc5dfc5bdfce00f56251d0ac6;
    stim[45] = 157'h1cd7087f289725576ecb278c87d9176047da5691;
    stim[46] = 157'h1f0c724cc8264a7be8fedcc49af05b2349f725ea;
    stim[47] = 157'h17748e270a2e477eba0e8aa5da0b84e24d1c2cc3;
    stim[48] = 157'h18b3a4cea569052b977490566a405727eea33a69;
    stim[49] = 157'h11ea2cc70e4acfaaf49978de40c0080a5a261ceb;
    stim[50] = 157'h1d72c717cdd6c1fa153bc9c9d88f9bb89cb5c668;
    stim[51] = 157'h0c18f621af5914223722bbbd81f1fde4c30de203;
    stim[52] = 157'h110656b16f456afe4e214466cdd509f1b910d6c2;
    stim[53] = 157'h15db729416fe707e79cc668d6cd513d2f50891f1;
    stim[54] = 157'h1242ffc615a1fca88306642ec6430b912abb52b2;
    stim[55] = 157'h1aaf19b77af42c7c881db692244c031e574d191f;
    stim[56] = 157'h18f56436fef3fef269959c71b9d1dd6100cd2324;
    stim[57] = 157'h1a0f00ac009991a1a1076da90e6b8db6cadf9f1d;
    stim[58] = 157'h10191d029fc1f0abe60893a5740cc9bf29ec54aa;
    stim[59] = 157'h1f099c5de5fb4e13a403e2cfc64ffead63592d88;
    stim[60] = 157'h132825d18ba1d83ed5e847699661aa39591f86c7;
    stim[61] = 157'h14bd81908cc1277430fab7b88d49fdea1c99fb04;
    stim[62] = 157'h1b305679762463e0bb646e2b4eceec005f38ba90;
    stim[63] = 157'h1af64d5c43983e3e366174910bdabc7288400046;
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
      expv[0] = 104'h79045dc01xxxxxxxxxxxxxxxxx;
      expv[1] = 104'h3f86c3401xxxxxxxxxxxxxxxxx;
      expv[2] = 104'h62a3b1401xxxxxxxxxxxxxxxxx;
      expv[3] = 104'h62f28ac01xxxxxxxxxxxxxxxxx;
      expv[4] = 104'h43230bc01xxxxxxxxxxxxxxxxx;
      expv[5] = 104'h18efeac01xxxxxxxxxxxxxxxxx;
      expv[6] = 104'he7976dc01xxxxxxxxxxxxxxxxx;
      expv[7] = 104'he7976dc21xxxxxxxxxxxxxxxxx;
      expv[8] = 104'he7976dc21xxxxxxxxxxxxxxxxx;
      expv[9] = 104'he7976dc2180000082000000000;
      expv[10] = 104'he7976dc2180000082000000000;
      expv[11] = 104'h8d088400180000082000000000;
      expv[12] = 104'h0d088402180000082000000000;
      expv[13] = 104'h8d088402180000082000000000;
      expv[14] = 104'h8d088402180000082000000000;
      expv[15] = 104'h8d088402180000082000000000;
      expv[16] = 104'h0d088404180000082000000000;
      expv[17] = 104'h0d088404180000082000000000;
      expv[18] = 104'h0d088404180000082000000000;
      expv[19] = 104'h8d0884043e00000148db45121c;
      expv[20] = 104'h8d0884043e00000148db45121c;
      expv[21] = 104'h8d0884063e00000148db45121c;
      expv[22] = 104'h8d0884061e0000000000000000;
      expv[23] = 104'h8d0883e41834220f9000000000;
      expv[24] = 104'h8d0883e611fffff35000000000;
      expv[25] = 104'h8d0883e611fffff35000000000;
      expv[26] = 104'h8d0883e611fffff35000000000;
      expv[27] = 104'h8d0883e811fffff35000000000;
      expv[28] = 104'h8d0883e81e00000150db45121c;
      expv[29] = 104'h8d0884041e00000150db45121c;
      expv[30] = 104'h0d0884061834220f99121cdb44;
      expv[31] = 104'h8d0884061834220f99121cdb44;
      expv[32] = 104'h8d0884061e0000000000000000;
      expv[33] = 104'h8d0884081e3422114800000000;
      expv[34] = 104'h8d08840a1e0000000000000000;
      expv[35] = 104'h8d08840a1e0000000000000000;
      expv[36] = 104'h8d08840a183421f77800000000;
      expv[37] = 104'h8d088404183421f77800000000;
      expv[38] = 104'h0d088406183421f77800000000;
      expv[39] = 104'h0d088406183421f77800000000;
      expv[40] = 104'h0d088406183421f77800000000;
      expv[41] = 104'h0d088406183421f77800000000;
      expv[42] = 104'h8d088406183421f77800000000;
      expv[43] = 104'h8d0884081e0003800000000000;
      expv[44] = 104'h8d0884041e0003800000000000;
      expv[45] = 104'h0d0884061e0003800000000000;
      expv[46] = 104'h8d0884061e0003800000000000;
      expv[47] = 104'h8d0884061e0003800000000000;
      expv[48] = 104'h8d08840611fffffff000000000;
      expv[49] = 104'h8d08840411fffffff000000000;
      expv[50] = 104'h0d08840611fffffff000000000;
      expv[51] = 104'h7591424011fffffff000000000;
      expv[52] = 104'h7456afc011fffffff000000000;
      expv[53] = 104'h6fe707c011fffffff000000000;
      expv[54] = 104'hda1fcac011fffffff000000000;
      expv[55] = 104'hda1fcac011fffffff000000000;
      expv[56] = 104'hda1fcac011fffffff000000000;
      expv[57] = 104'hda1fcac011fffffff000000000;
      expv[58] = 104'hda1fcac011fffffff000000000;
      expv[59] = 104'hda1fcac211fffffff000000000;
      expv[60] = 104'h5a1fcac411fffffff000000000;
      expv[61] = 104'h5a1fcac411fffffff000000000;
      expv[62] = 104'h5a1fcac411fffffff000000000;
      expv[63] = 104'hda1fcac41c000009b800000000;
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
