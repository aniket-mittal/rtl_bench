// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 120;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210351 dut (
    .clk(clk),
    .idex_en(in_vec[119:119]),
    .memtoreg(in_vec[118:118]),
    .reg_write(in_vec[117:117]),
    .mem_read(in_vec[116:116]),
    .mem_write(in_vec[115:115]),
    .reg_dst(in_vec[114:114]),
    .alusrc_a(in_vec[113:113]),
    .branch(in_vec[112:112]),
    .jump(in_vec[111:111]),
    .halt(in_vec[110:110]),
    .word_en(in_vec[109:109]),
    .ld_en(in_vec[108:108]),
    .pc_plus2(in_vec[107:92]),
    .read_data1(in_vec[91:76]),
    .read_data2(in_vec[75:60]),
    .sign_extend(in_vec[59:44]),
    .instr_rt(in_vec[43:41]),
    .instr_rd(in_vec[40:38]),
    .rs(in_vec[37:35]),
    .alusrc_b(in_vec[34:34]),
    .aluop(in_vec[33:32]),
    .branch_label(in_vec[31:16]),
    .jump_addr(in_vec[15:0]),
    .memtoreg_reg(out_vec[118:118]),
    .reg_write_reg(out_vec[117:117]),
    .mem_read_reg(out_vec[116:116]),
    .mem_write_reg(out_vec[115:115]),
    .reg_dst_reg(out_vec[114:114]),
    .alusrc_a_reg(out_vec[113:113]),
    .branch_reg(out_vec[112:112]),
    .jump_reg(out_vec[111:111]),
    .halt_reg(out_vec[110:110]),
    .word_en_reg(out_vec[109:109]),
    .ld_en_reg(out_vec[108:108]),
    .pc_plus2_reg(out_vec[107:92]),
    .read_data1_reg(out_vec[91:76]),
    .read_data2_reg(out_vec[75:60]),
    .sign_extend_reg(out_vec[59:44]),
    .instr_rt_reg(out_vec[43:41]),
    .instr_rd_reg(out_vec[40:38]),
    .rs_reg(out_vec[37:35]),
    .alusrc_b_reg(out_vec[34:34]),
    .aluop_reg(out_vec[33:32]),
    .branch_label_reg(out_vec[31:16]),
    .jump_addr_reg(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 120'h7e6e7fd928c61ffd9c014de6595a9f;
    stim[1] = 120'hdde36807a3df53615edf38b65d1428;
    stim[2] = 120'h85aff1040d5b14eed510919d553d74;
    stim[3] = 120'hd4c5dadca6e7e3c5b6a4faefcdf271;
    stim[4] = 120'hd84fe5a956aa18b3afd82b0ed515c0;
    stim[5] = 120'h52f50f71ffe1dc340aa7abfad0fe3d;
    stim[6] = 120'h770cbcc0be0e6d90fbeac31a0f6109;
    stim[7] = 120'h81c7b96e2f5cf67415101f85849961;
    stim[8] = 120'hb2d4ce583cc4f696da66d39cf9b2b5;
    stim[9] = 120'h50ea98a75e4b9b4d80bb64aa12dcff;
    stim[10] = 120'hd7ffdbbb511c569a7f1009171048aa;
    stim[11] = 120'h99100738dbe6536d2226742a425963;
    stim[12] = 120'h2ec15cd3562c679dcf0235abe23f98;
    stim[13] = 120'h14a0285116b0ddf7be6904daa9cbc5;
    stim[14] = 120'h2809ddbc0ff9976caef7d9605786fb;
    stim[15] = 120'hf4a2e60b76f992f8034bb957e481db;
    stim[16] = 120'hd948705bfd140836e56b77feba46f8;
    stim[17] = 120'hef7a5ef027729a709ba8405ee1ac1d;
    stim[18] = 120'h2541d1b696269357a4598357da2378;
    stim[19] = 120'h043cc77e9a7c66bca8f9c2ca32ab25;
    stim[20] = 120'h40e4b7655b76b5edf6ff70717f4dde;
    stim[21] = 120'h9dc79db2e5505cf9c5c809d32518ac;
    stim[22] = 120'hbf38b61711692bf7ac1af703f00a00;
    stim[23] = 120'hc3ca7d962a12138b61e200266333d8;
    stim[24] = 120'hdeb266e4dc07d1153fda42ccedd426;
    stim[25] = 120'h8bc33e01bb9beeb4194a5d6e5eed1f;
    stim[26] = 120'h54dff4052175484adc470929141fdf;
    stim[27] = 120'hfaa09c92bb40b062aba7790558a3e1;
    stim[28] = 120'hd1b50468b0ed0ffa2493c28819b623;
    stim[29] = 120'h59972b6db428400dc7cf5233058421;
    stim[30] = 120'hbd1201d39d56b86e4bfc321212ea7c;
    stim[31] = 120'h2ca7bae1f9e2f35e52b8c193931f9d;
    stim[32] = 120'h364fe44ed5bf881b0ef64434e5b149;
    stim[33] = 120'hbac2073faaef853b0cdb87cb9699ef;
    stim[34] = 120'hf900d127f66b65e1a672c7088091d3;
    stim[35] = 120'h453fa9f44acf754735b250b4c1a8c2;
    stim[36] = 120'h9aba9494e4fa5b5ae909998edad1bc;
    stim[37] = 120'hd97d1954349358936f829ad312e73d;
    stim[38] = 120'hed6faa5e0c549e96845c6386c9e990;
    stim[39] = 120'h29fb9048b547dc15910b0e680beecf;
    stim[40] = 120'hde8000310d095015f4031e9b628d4c;
    stim[41] = 120'h24332b43d5ee0d83ab3bc5f34f5e9a;
    stim[42] = 120'haae444aa996535ec0af15eff21e16e;
    stim[43] = 120'h727721f4d497583955812cbd67b6dc;
    stim[44] = 120'he5a8caa479be5a83f52cf285a1ba1d;
    stim[45] = 120'hb712f9b6e6b783d507855db8823fc2;
    stim[46] = 120'h71f691ad31e5acf66838f6ad39aa8f;
    stim[47] = 120'h3de4f09eb8e69ce226894d3a08928f;
    stim[48] = 120'hd5e91f8eefb4417680acbed9704d3f;
    stim[49] = 120'h5ef1cccf86507678df2833f8543eab;
    stim[50] = 120'h580d4f249fa10240a53edcc80266ce;
    stim[51] = 120'h13e367ddd441748801a421abb8f192;
    stim[52] = 120'h87c2086a7f1023ad85ca44aaaa8a09;
    stim[53] = 120'h5354d1a46b1f1da0d13b1aeafe835f;
    stim[54] = 120'h4c936eec596c33eadf93c44a625072;
    stim[55] = 120'h414f3d4ed996fdca2850429c9eb1ae;
    stim[56] = 120'h31a32bcaf64e16f6379a736e8f3664;
    stim[57] = 120'hf046251fd04d9294c43265e8840d47;
    stim[58] = 120'he6a853fa939cd3a2b29a0fa985298c;
    stim[59] = 120'hec57dee28d86f464d6314447d727d5;
    stim[60] = 120'h74d4cb9c5c82542deb4dbf5c237d79;
    stim[61] = 120'h0a72c54d0f79ff71463ee72d9b5767;
    stim[62] = 120'h15bd6903ec050dc45df55b87ab28f8;
    stim[63] = 120'he3f14a7fa19fa00ac6f928e890d164;
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
      expv[0] = 119'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 119'hxxxxxxxxxxxxxxxxxxx0xxxxxxxxxx;
      expv[2] = 119'h5de36807a3df53615edf38b65d1428;
      expv[3] = 119'h05aff1040d5b14eed510919d553d74;
      expv[4] = 119'h54c5dadca6e7e3c5b6a4faefcdf271;
      expv[5] = 119'h584fe5a956aa18b3afd82b0ed515c0;
      expv[6] = 119'h584fe5a956aa18b3afd02b0ed515c0;
      expv[7] = 119'h584fe5a956aa18b3afd02b0ed515c0;
      expv[8] = 119'h01c7b96e2f5cf67415101f85849961;
      expv[9] = 119'h32d4ce583cc4f696da66d39cf9b2b5;
      expv[10] = 119'h32d4ce583cc4f696da60139cf9b2b5;
      expv[11] = 119'h57ffdbbb511c569a7f1009171048aa;
      expv[12] = 119'h19100738dbe6536d2226742a425963;
      expv[13] = 119'h19100738dbe6536d2220342a425963;
      expv[14] = 119'h19100738dbe6536d2220342a425963;
      expv[15] = 119'h19100738dbe6536d2220342a425963;
      expv[16] = 119'h74a2e60b76f992f8034bb957e481db;
      expv[17] = 119'h5948705bfd140836e56b77feba46f8;
      expv[18] = 119'h6f7a5ef027729a709ba8405ee1ac1d;
      expv[19] = 119'h6f7a5ef027729a709ba0005ee1ac1d;
      expv[20] = 119'h6f7a5ef027729a709ba0005ee1ac1d;
      expv[21] = 119'h6f7a5ef027729a709ba0005ee1ac1d;
      expv[22] = 119'h1dc79db2e5505cf9c5c809d32518ac;
      expv[23] = 119'h3f38b61711692bf7ac1af703f00a00;
      expv[24] = 119'h43ca7d962a12138b61e200266333d8;
      expv[25] = 119'h5eb266e4dc07d1153fda42ccedd426;
      expv[26] = 119'h0bc33e01bb9beeb4194a5d6e5eed1f;
      expv[27] = 119'h0bc33e01bb9beeb419401d6e5eed1f;
      expv[28] = 119'h7aa09c92bb40b062aba7790558a3e1;
      expv[29] = 119'h51b50468b0ed0ffa2493c28819b623;
      expv[30] = 119'h51b50468b0ed0ffa2490028819b623;
      expv[31] = 119'h3d1201d39d56b86e4bfc321212ea7c;
      expv[32] = 119'h3d1201d39d56b86e4bf0321212ea7c;
      expv[33] = 119'h3d1201d39d56b86e4bf0321212ea7c;
      expv[34] = 119'h3ac2073faaef853b0cdb87cb9699ef;
      expv[35] = 119'h7900d127f66b65e1a672c7088091d3;
      expv[36] = 119'h7900d127f66b65e1a67007088091d3;
      expv[37] = 119'h1aba9494e4fa5b5ae909998edad1bc;
      expv[38] = 119'h597d1954349358936f829ad312e73d;
      expv[39] = 119'h6d6faa5e0c549e96845c6386c9e990;
      expv[40] = 119'h6d6faa5e0c549e9684502386c9e990;
      expv[41] = 119'h5e8000310d095015f4031e9b628d4c;
      expv[42] = 119'h5e8000310d095015f4001e9b628d4c;
      expv[43] = 119'h2ae444aa996535ec0af15eff21e16e;
      expv[44] = 119'h2ae444aa996535ec0af01eff21e16e;
      expv[45] = 119'h65a8caa479be5a83f52cf285a1ba1d;
      expv[46] = 119'h3712f9b6e6b783d507855db8823fc2;
      expv[47] = 119'h3712f9b6e6b783d507801db8823fc2;
      expv[48] = 119'h3712f9b6e6b783d507801db8823fc2;
      expv[49] = 119'h55e91f8eefb4417680acbed9704d3f;
      expv[50] = 119'h55e91f8eefb4417680a03ed9704d3f;
      expv[51] = 119'h55e91f8eefb4417680a03ed9704d3f;
      expv[52] = 119'h55e91f8eefb4417680a03ed9704d3f;
      expv[53] = 119'h07c2086a7f1023ad85ca44aaaa8a09;
      expv[54] = 119'h07c2086a7f1023ad85c004aaaa8a09;
      expv[55] = 119'h07c2086a7f1023ad85c004aaaa8a09;
      expv[56] = 119'h07c2086a7f1023ad85c004aaaa8a09;
      expv[57] = 119'h07c2086a7f1023ad85c004aaaa8a09;
      expv[58] = 119'h7046251fd04d9294c43265e8840d47;
      expv[59] = 119'h66a853fa939cd3a2b29a0fa985298c;
      expv[60] = 119'h6c57dee28d86f464d6314447d727d5;
      expv[61] = 119'h6c57dee28d86f464d6300447d727d5;
      expv[62] = 119'h6c57dee28d86f464d6300447d727d5;
      expv[63] = 119'h6c57dee28d86f464d6300447d727d5;
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
