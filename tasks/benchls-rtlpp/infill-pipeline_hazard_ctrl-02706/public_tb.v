// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 202;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02706 dut (
    .br_taken(in_vec[201:201]),
    .src_reg_used(in_vec[200:199]),
    .is_eret(in_vec[198:198]),
    .id_en(in_vec[197:197]),
    .id_rd_addr(in_vec[196:192]),
    .id_gpr_we_(in_vec[191:191]),
    .id_mem_op(in_vec[190:186]),
    .op(in_vec[185:179]),
    .rs1_addr(in_vec[178:174]),
    .rs2_addr(in_vec[173:169]),
    .id_rs1_addr(in_vec[168:164]),
    .id_rs2_addr(in_vec[163:159]),
    .ex_en(in_vec[158:158]),
    .ex_rd_addr(in_vec[157:153]),
    .ex_gpr_we_(in_vec[152:152]),
    .ex_mem_op(in_vec[151:147]),
    .mem_pc(in_vec[146:115]),
    .mem_en(in_vec[114:114]),
    .mem_exp_code(in_vec[113:110]),
    .mepc_i(in_vec[109:78]),
    .ic_busy(in_vec[77:77]),
    .dc_busy(in_vec[76:76]),
    .issue_id(in_vec[75:74]),
    .if_hart_id(in_vec[73:72]),
    .id_hart_id(in_vec[71:70]),
    .ex_hart_id(in_vec[69:68]),
    .hart_ic_stall(in_vec[67:67]),
    .hart_dc_stall(in_vec[66:66]),
    .hart_ic_flush(in_vec[65:65]),
    .hart_dc_flush(in_vec[64:64]),
    .if_pc(in_vec[63:32]),
    .ex_pc(in_vec[31:0]),
    .mepc_o(out_vec[118:87]),
    .exp_code(out_vec[86:83]),
    .save_exp(out_vec[82:82]),
    .restore_exp(out_vec[81:81]),
    .if_stall(out_vec[80:80]),
    .id_stall(out_vec[79:79]),
    .ex_stall(out_vec[78:78]),
    .mem_stall(out_vec[77:77]),
    .if_flush(out_vec[76:76]),
    .id_flush(out_vec[75:75]),
    .ex_flush(out_vec[74:74]),
    .mem_flush(out_vec[73:73]),
    .new_pc(out_vec[72:41]),
    .rs1_fwd_ctrl(out_vec[40:39]),
    .rs2_fwd_ctrl(out_vec[38:37]),
    .ex_rs1_fwd_en(out_vec[36:36]),
    .ex_rs2_fwd_en(out_vec[35:35]),
    .cache_miss(out_vec[34:34]),
    .cm_hart_id(out_vec[33:32]),
    .cm_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 202'h15bc159274bfa06d7d3ab44ee98f5508dd41e783eaf50c9c78f;
    stim[1] = 202'h1530ad0f96fe00e943d473f17dfdafe20187ad22d2118f67139;
    stim[2] = 202'h31a9aab353274adaaa2e3f744df71991f2ee7f5a4aab72c3d24;
    stim[3] = 202'h3ff4618d93f82d039e88a00506037861e203ae642d489aec0b0;
    stim[4] = 202'h1b55716dda3ea23508ca5b187f9315bc0d15a460768bba07e09;
    stim[5] = 202'h1ee1639f4e7c7c8d2532c09597577a5b725cdbc3c2dac1fd052;
    stim[6] = 202'h1a295c18045d531c07cec4f0782ec7cc1a992cadc6b264d9f30;
    stim[7] = 202'h16dd16a39fe747e8d16be118a920b572e72abe4728d9a60abfa;
    stim[8] = 202'h217d5131a4e06f63e57f550d73ee03287f70de2e4bb8f466466;
    stim[9] = 202'h0b5466532b14c2248b8426a83e7d2d88fd5ed813078867dde39;
    stim[10] = 202'h0b6b91b4aa08b20f689e9562d9b5961420c5a5605d51a5e4be1;
    stim[11] = 202'h22461ba535b72eb21f1b2f80871419b0733b7abe3e18adbd3f2;
    stim[12] = 202'h2c6d56199b46bd123ba15793b99fa5465a6a06cb54c34280281;
    stim[13] = 202'h160b2c3b6b260471e2a0e0120c28a92b6c9a3c58dc4945c3f2a;
    stim[14] = 202'h3e1fd22298cc3ccb531f23ea5444718e83938520feffc17b78f;
    stim[15] = 202'h2d2297a04c41bf987a453eab6c2893aa546bedee0656e4c0b2d;
    stim[16] = 202'h33ba506f6b05bf46dea96d5093e8f6803093ea932ab775bb4a1;
    stim[17] = 202'h1c4ed333eac225b687b306f66471846c9fb33d43f25dfae524c;
    stim[18] = 202'h3f7289d8b834d674a6f346ca5d3e3d10493d1fe25f70d5a1f0e;
    stim[19] = 202'h1f6ece4188bff185d59073f57dbcc0c791e3ebfe3794f95fa13;
    stim[20] = 202'h045fb3b66bb443105fbf40a0f179e1605851d57bbacf5aec714;
    stim[21] = 202'h1a18e2d13043bc78ac1f476dfade37e07326f2b57c777632566;
    stim[22] = 202'h36df73086b2c4e6678e4c66865dca82ea35a013f966f38d431e;
    stim[23] = 202'h0acf0fab70bad56ef684a31ffd6eb32e486ff23877bfee85404;
    stim[24] = 202'h227f5a268cb6a2f39ca982d162ece53abe3c082b1a3bb25f8aa;
    stim[25] = 202'h358ca927a662c61b77ff004ac6efd0c566932a888b08468c8c3;
    stim[26] = 202'h08634dc3e475686078bbd65a8e0574837b6b0826332fa53230d;
    stim[27] = 202'h3d8117639a201da3a896a07d290db145023daa7995b9a18e032;
    stim[28] = 202'h184d3b0312b537ffa11f5c07cc09e489b66cfdc8f3da5a36bb7;
    stim[29] = 202'h017006007caacc3fdeaf921172d3e059ecb6ae0ae8085100baa;
    stim[30] = 202'h05e65b12aaf9bc80fc9724a912bf52bc8d5f1797fde79a3ae4e;
    stim[31] = 202'h30d5725c9a3ebb4d981727c0061acaf6da80b8f8da0b8caf45d;
    stim[32] = 202'h37a03ce0a0638272b75b7551df8b3c0dca19d140429771326ac;
    stim[33] = 202'h2e6ae2a4333e2f5ee9cfd2279b7a7c4954e75532f3a76484019;
    stim[34] = 202'h281cc6fae51f7885e871ab0054398190c21a71223898f3d6455;
    stim[35] = 202'h146ef5f72deb3f57f4e50cd03370e5a49cadec603a66311732a;
    stim[36] = 202'h08f9bece3a0b53abdb67f23e59e665428a3ff0cf4fadde906e4;
    stim[37] = 202'h0e43b4b42903b034c56ee1a51f722e111852cb9dbbbf8666674;
    stim[38] = 202'h263523a611486b0dc496ea69e1851bd23904d3de6dc5490e9b1;
    stim[39] = 202'h220431bd936c632b1719f5766e64764709bb3d46aae5621772c;
    stim[40] = 202'h15bf445c059746567a8ef334b8f4df41fe4835061bee3bbcc25;
    stim[41] = 202'h32c97d86a198279d7f2c0da00a37d8b8aaf60b9fd0bad604fa9;
    stim[42] = 202'h0b0fd8a2170e1a97eb3ab1fba17174990a07d2e09c57133ea5d;
    stim[43] = 202'h3c40249448e13af322b5c87b43184ea55d8064792e5e4baad21;
    stim[44] = 202'h0b2bcb22269b79c66093eb0419ed75279fa6cab834a829a1189;
    stim[45] = 202'h350c52cb16664c0d4588f3aef547fba305c664178edd9d5b352;
    stim[46] = 202'h3767541229253a430864e60a285ed1fa8baebc1376dcccb1e43;
    stim[47] = 202'h1531f818ef23d644c776f70f915b60e41207af05dbbef893d0d;
    stim[48] = 202'h067d8a92ac9251bf08470d2cc4186412b177307ecbc6538500a;
    stim[49] = 202'h23cf386d13cdb08a4a4169a052274b7935204c9f345c3a104e5;
    stim[50] = 202'h3162d5dd31903758b03cf0d56ea77afef99fb9ca5e7000adfad;
    stim[51] = 202'h3b74c2dce30e6b8f0fe69a437f6203b3d75a7fb7577f7aa64e0;
    stim[52] = 202'h112d69022dc17e11eb85fd0065799704a1f9996503df7c57ead;
    stim[53] = 202'h19f200e2e1cb68fef56a894016c7afb5502ab1cf1956179c2dd;
    stim[54] = 202'h3fe1dab4671b9af0188310cc02338618b86b7c02fec0e29a2fe;
    stim[55] = 202'h2308e96ff4155fb5b0dd70a7e618f96e89b41a30d9deab725d9;
    stim[56] = 202'h2b8cf49171844ebf65689e355c124d0d94e4519da34810d0748;
    stim[57] = 202'h2d7f54b251306aacc213be4cb8ffe24e0eb2987f682d58d1c54;
    stim[58] = 202'h3a6d3ba508d757d3dc9fe1468edaed1e049b774a21a5d7e88b1;
    stim[59] = 202'h34849126033de4c7def23f85a43b7f91eb21a9d0f51e03e30ca;
    stim[60] = 202'h300dc6c5519562e11745cce5dc492ef7f4d616c7f0ecf2162be;
    stim[61] = 202'h3ffa01b2c63f2147bb97269322155dc79113c6a2c00363e5980;
    stim[62] = 202'h2f4d2c166f57d15dea622b51e0d7d7b669bd3c5e7715257a679;
    stim[63] = 202'h24b10d1f71b6344592c75998c43c345b77b928a57d3cce84568;
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
      expv[0] = 119'h6d7d3ab41ddf000000000000000000;
      expv[1] = 119'h6943d473e5ff00000000047ad22d21;
      expv[2] = 119'h5aaa2e3f6dff0000000007e7f5a4aa;
      expv[3] = 119'h0000000001e0000000000000000000;
      expv[4] = 119'h0000000000020000000005bba07e09;
      expv[5] = 119'h0000000001e20000000006ac1fd052;
      expv[6] = 119'h1c07cec4e41f0000000006264d9f30;
      expv[7] = 119'h0000000001e00000000007abe4728d;
      expv[8] = 119'h0000000001ce00000000078f466466;
      expv[9] = 119'h0000000001c20000000005867dde39;
      expv[10] = 119'h0f689e9545df00000000045a5605d5;
      expv[11] = 119'h00000000000a00000000078adbd3f2;
      expv[12] = 119'h0000000001e20000000005a06cb54c;
      expv[13] = 119'h0000000001e20000000004945c3f2a;
      expv[14] = 119'h4b531f23d5ff0000000007fc17b78f;
      expv[15] = 119'h0000000001ea0000000005bedee065;
      expv[16] = 119'h46dea96d241f0000000004775bb4a1;
      expv[17] = 119'h3687b306ec1f0000000007dfae524c;
      expv[18] = 119'h74a6f346941f00000000050d5a1f0e;
      expv[19] = 119'h05d59073edff00000000063ebfe379;
      expv[20] = 119'h0000000001c20000000004f5aec714;
      expv[21] = 119'h78ac1f475c1f00000000056f2b57c7;
      expv[22] = 119'h6678e4c655ff0000000007f38d431e;
      expv[23] = 119'h0000000001e20000000005ff23877b;
      expv[24] = 119'h739ca982a5ff0000000006bb25f8aa;
      expv[25] = 119'h1b77ff0015ff00000000068468c8c3;
      expv[26] = 119'h6078bbd635ff0000000005b0826332;
      expv[27] = 119'h23a896a07dff00000000069a18e032;
      expv[28] = 119'h0000000001e20000000006cfdc8f3d;
      expv[29] = 119'h0000000001e2000000000485100baa;
      expv[30] = 119'h0000000001c2000000000579a3ae4e;
      expv[31] = 119'h0000000001e000000000070b8f8da0;
      expv[32] = 119'h72b75b7525ff0000000006771326ac;
      expv[33] = 119'h0000000001ea000000000575532f3a;
      expv[34] = 119'h00000000000a00000000068f3d6455;
      expv[35] = 119'h57f4e50ca41f0000000006dec603a6;
      expv[36] = 119'h0000000001e60000000006dde906e4;
      expv[37] = 119'h0000000001e20000000004f8666674;
      expv[38] = 119'h0dc496ea55ff000000000000000000;
      expv[39] = 119'h2b1719f56dff00000000055621772c;
      expv[40] = 119'h0000000001e2000000000000000000;
      expv[41] = 119'h0000000001ce0000000006ad604fa9;
      expv[42] = 119'h17eb3ab1f5ff000000000000000000;
      expv[43] = 119'h7322b5c875ff0000000005064792e5;
      expv[44] = 119'h0000000001e000000000066cab834a;
      expv[45] = 119'h0000000001e20000000004664178ed;
      expv[46] = 119'h0000000001e00000000006ebc1376d;
      expv[47] = 119'h000000000000000000000000000000;
      expv[48] = 119'h0000000001e200000000056538500a;
      expv[49] = 119'h0000000001e0000000000404c9f345;
      expv[50] = 119'h58b03cf0adff0000000005000adfad;
      expv[51] = 119'h0000000001ea0000000087f7aa64e0;
      expv[52] = 119'h0000000001c20000000005f7c57ead;
      expv[53] = 119'h0000000001e00000000005ab1cf195;
      expv[54] = 119'h701883109ddf0000000006b7c02fec;
      expv[55] = 119'h0000000001e20000000005eab725d9;
      expv[56] = 119'h0000000001ea00000000064519da34;
      expv[57] = 119'h2cc213be1dff0000000006d58d1c54;
      expv[58] = 119'h53dc9fe10dff00000000045d7e88b1;
      expv[59] = 119'h0000000001e800000000071a9d0f51;
      expv[60] = 119'h611745cccdff0000000004cf2162be;
      expv[61] = 119'h0000000001ea0000000005363e5980;
      expv[62] = 119'h5dea622b25ff00000000055257a679;
      expv[63] = 119'h0000000001ea0000000007cce84568;
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
