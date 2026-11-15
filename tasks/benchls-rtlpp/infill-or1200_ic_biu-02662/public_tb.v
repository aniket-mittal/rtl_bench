// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 111;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02662 dut (
    .clk(clk),
    .rst(in_vec[111:111]),
    .icbiu_dat_i(in_vec[110:79]),
    .icbiu_ack_i(in_vec[78:78]),
    .icbiu_err_i(in_vec[77:77]),
    .ic_en(in_vec[76:76]),
    .icqmem_adr_i(in_vec[75:44]),
    .icqmem_cycstb_i(in_vec[43:43]),
    .icqmem_ci_i(in_vec[42:42]),
    .icqmem_sel_i(in_vec[41:38]),
    .icqmem_tag_i(in_vec[37:34]),
    .spr_cs(in_vec[33:33]),
    .spr_write(in_vec[32:32]),
    .spr_dat_i(in_vec[31:0]),
    .icbiu_dat_o(out_vec[110:79]),
    .icbiu_adr_o(out_vec[78:47]),
    .icbiu_cyc_o(out_vec[46:46]),
    .icbiu_stb_o(out_vec[45:45]),
    .icbiu_we_o(out_vec[44:44]),
    .icbiu_sel_o(out_vec[43:40]),
    .icbiu_cab_o(out_vec[39:39]),
    .icqmem_dat_o(out_vec[38:7]),
    .icqmem_ack_o(out_vec[6:6]),
    .icqmem_rty_o(out_vec[5:5]),
    .icqmem_err_o(out_vec[4:4]),
    .icqmem_tag_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 112'ha25d1f47892822251ff89280a553;
    stim[1] = 112'he17d215965f1c9917756f8cf7096;
    stim[2] = 112'h550dd87e37d8b606fa58595550c3;
    stim[3] = 112'h6211899baef79c8bcea02865ffcf;
    stim[4] = 112'h3ac24db7ed43263cb2d397ddac13;
    stim[5] = 112'h78abf259d08bcdf91d2f7df3f2c8;
    stim[6] = 112'h60aef72bfbac1d919c2c0d44d4b0;
    stim[7] = 112'h4a609209058c0563f9b7ef6ea334;
    stim[8] = 112'h1740329d22470717965fcc4c1da7;
    stim[9] = 112'h7a364f020c56774c9295df7ded08;
    stim[10] = 112'h02c98a9f18fba2dd9c9abb5d79df;
    stim[11] = 112'h7570d044aa3f846de5ecce48f7e6;
    stim[12] = 112'h2a575697b47c2240c30c0bef4c4a;
    stim[13] = 112'h73bd935278dd34850739cdb24209;
    stim[14] = 112'hf612e61f18872d8f0d6fa0496857;
    stim[15] = 112'h5eaeb27b9872a652ad9325c3fbc1;
    stim[16] = 112'h65e886c7c5b28e6595d8a10233a4;
    stim[17] = 112'h0069b01fc07dc92b2a95110477a8;
    stim[18] = 112'h325c56bceb6e2b51aa03556b5c70;
    stim[19] = 112'h7c051aed7a94bbf1c2ce9c4b9e14;
    stim[20] = 112'h32b0c7aa5d609913f83f810fb4d6;
    stim[21] = 112'h7a4e8d9d90e33b736227b47fbefc;
    stim[22] = 112'h4c908f79cb52fa72c86ce77f2a5c;
    stim[23] = 112'h2724b09f1411c216fd9216877495;
    stim[24] = 112'h011c2c3e9eee63bf2264ad48c2c0;
    stim[25] = 112'h1f22f7686faedafb8a38eb396996;
    stim[26] = 112'h6e6e215fcfb2888308bcfba2656a;
    stim[27] = 112'h4a586ab73659a48ab83102a37cb7;
    stim[28] = 112'h606425f04f5835705c21718ac130;
    stim[29] = 112'h5abfb1d19d005b69a9dc746e1cb9;
    stim[30] = 112'h277ec806b7cfe40c99851f9a51d8;
    stim[31] = 112'h65addbac0071f69a0ebcbbe46f07;
    stim[32] = 112'h2bfcdc7ebc1894a1479f3a11b6dc;
    stim[33] = 112'h50a71fef2d321bf4789eb7abd42c;
    stim[34] = 112'h7837872acb1cb9bae02cf8547cb1;
    stim[35] = 112'h423cea1624028db8c19e4d8dffe7;
    stim[36] = 112'h3c796291cdbfc3e3ec7f8ae42e8c;
    stim[37] = 112'h5604e68415321dcbab6eb5a4d845;
    stim[38] = 112'h7646ede180b3f4e7cbea38e33a37;
    stim[39] = 112'h65c5d0c938895c7515f43fca2999;
    stim[40] = 112'h1d594e09c307e5d50ff8c47948ba;
    stim[41] = 112'h021890eb5a0753e9be1fec781121;
    stim[42] = 112'h717f19f241471093460ff97bb0f3;
    stim[43] = 112'h77259a74bc9a84299ff8d9174359;
    stim[44] = 112'h3a64beed87c3ed4c05f08eee5868;
    stim[45] = 112'h6024bf1241c147f233154497c4b7;
    stim[46] = 112'h383cc6ffba99f800676eddad9bbc;
    stim[47] = 112'h298992b3f037715dce5ad4c6c49b;
    stim[48] = 112'h6968617355cae5ef9ae9df454253;
    stim[49] = 112'h5ad69ef4099343cbfd2d5c7bd9f4;
    stim[50] = 112'h1056699488241b2d4c6423e14e3a;
    stim[51] = 112'h3e305aa8b3e42972722ed6ac3688;
    stim[52] = 112'h571fd64d77d9629bf61291b4b3a1;
    stim[53] = 112'h6f1d00ce882307e1a362a5a9b6d5;
    stim[54] = 112'h349bef4173564561512ce754f625;
    stim[55] = 112'h61ae4bb329e83713ef508dad0e8d;
    stim[56] = 112'h79cb19247a0f118a8a95e8811669;
    stim[57] = 112'h266e8919f451cc3b78ab5d1834de;
    stim[58] = 112'h5562c185746443e017add09ac3df;
    stim[59] = 112'h6e7c40fd9a737d07d05f9d9b8530;
    stim[60] = 112'h6ff4457983fd6167d762657610b9;
    stim[61] = 112'h381ec53feb9af1bbfb4266a55635;
    stim[62] = 112'h304fe7cc0272be05b18853dee5c2;
    stim[63] = 112'h03535899711af8aba6263ffe5a68;
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
      expv[0] = 111'h00000000xxxxxxxxxf225d1f47ae;
      expv[1] = 111'h00000000xxxxxxxxxd617d215951;
      expv[2] = 111'h00000000xxxxx0xxxxxxxxxxxxxx;
      expv[3] = 111'h00000000xxxxxxxx6a6211899b91;
      expv[4] = 111'h00000000xxxxxxxxxb3ac24db7d1;
      expv[5] = 111'h000000000xxxxxxxxxxxxxxxxxxx;
      expv[6] = 111'h00000000xxx0xxxxxxxxxxxxxxxx;
      expv[7] = 111'h00000000xxx0xxxxx64a6092092d;
      expv[8] = 111'h00000000xxxxxxxxx91740329d11;
      expv[9] = 111'h00000000xxxxxxxxxa7a364f0225;
      expv[10] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[11] = 111'h00000000xxxxxxxx077570d04491;
      expv[12] = 111'h00000000xxxxxx0xxxxxxxxxxxxx;
      expv[13] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[14] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[15] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[16] = 111'h00000000xxxxxxxxx765e886c7c6;
      expv[17] = 111'h000000000xxxxxxx6a0069b01fc5;
      expv[18] = 111'h00000000xxxxxxxx68325c56bcd1;
      expv[19] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[20] = 111'h00000000xx0xxxxxxxxxxxxxxxxx;
      expv[21] = 111'h000000000xxxxxxxxxxxxxxxxxxx;
      expv[22] = 111'h00000000xxxxxxxx614c908f79cb;
      expv[23] = 111'h00000000x0xxx0xxxxxxxxxxxxxx;
      expv[24] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[25] = 111'h00000000xxxxxxxx681f22f76851;
      expv[26] = 111'h00000000xxxxxxxx626e6e215fcf;
      expv[27] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[28] = 111'h00000000xxxxxxxxx0606425f048;
      expv[29] = 111'h00000000xx0xxxxxxxxxxxxxxxxx;
      expv[30] = 111'h00000000xxxxx0xxxxxxxxxxxxx1;
      expv[31] = 111'h000000000xxxxxx06a65addbac2f;
      expv[32] = 111'h00000000x0xxxx0xxxxxxxxxxxxx;
      expv[33] = 111'h00000000xxx0xxxxx250a71fef11;
      expv[34] = 111'h00000000xxxxxxxx007837872acb;
      expv[35] = 111'h00000000x0xxxxxx06423cea1611;
      expv[36] = 111'h00000000xxxxxxxx613c796291cf;
      expv[37] = 111'h00000000xxx0xxxxxxxxxxxxxxxx;
      expv[38] = 111'h000000000xxxxxxx6f7646ede1aa;
      expv[39] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[40] = 111'h00000000xxxxxxxx6f1d594e09ce;
      expv[41] = 111'h00000000x0xxxxxxxxxxxxxxxxxx;
      expv[42] = 111'h000000000xxxxxxx08717f19f243;
      expv[43] = 111'h00000000xxxxxxxxxfxxxxxxxxxx;
      expv[44] = 111'h00000000xxxxxxx0073a64beedac;
      expv[45] = 111'h000000000x0xxxxxxc6024bf1245;
      expv[46] = 111'h00000000xxxxx00xxxxxxxxxxxxx;
      expv[47] = 111'h000000000xxxxxxxxxxxxxxxxxxx;
      expv[48] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[49] = 111'h00000000xxxxxxxxx45ad69ef42b;
      expv[50] = 111'h00000000xxx0xxxx6110566994a9;
      expv[51] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[52] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[53] = 111'h00000000xxxxxx0x0d6f1d00cea8;
      expv[54] = 111'h00000000xxxxxx0xxxxxxxxxxxxx;
      expv[55] = 111'h00000000xxxxxxxx6d61ae4bb311;
      expv[56] = 111'h00000000x0xxxxxxxxxxxxxxxxxx;
      expv[57] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[58] = 111'h00000000xxxxxx00xxxxxxxxxxxx;
      expv[59] = 111'h00000000xxxxxxxxxxxxxxxxxxxx;
      expv[60] = 111'h00000000xxxx0xxxxd6ff44579a8;
      expv[61] = 111'h00000000xxxxxxxxxd381ec53fd1;
      expv[62] = 111'h00000000xxxxx0xxx6304fe7cc22;
      expv[63] = 111'h000000000xxxxxxxxxxxxxxxxxxx;
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
