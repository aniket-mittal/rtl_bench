// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 138;
  localparam OW = 136;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05942 dut (
    .clk(clk),
    .rst(in_vec[137:137]),
    .stall(in_vec[136:136]),
    .ex_aluresult(in_vec[135:104]),
    .ex_td(in_vec[103:99]),
    .ex_d2(in_vec[98:67]),
    .ex_WREG(in_vec[66:66]),
    .ex_WMEM(in_vec[65:65]),
    .ex_LW(in_vec[64:64]),
    .ex_instr(in_vec[63:32]),
    .ex_pc(in_vec[31:0]),
    .me_aluresult(out_vec[135:104]),
    .me_td(out_vec[103:99]),
    .me_d2(out_vec[98:67]),
    .me_WREG(out_vec[66:66]),
    .me_WMEM(out_vec[65:65]),
    .me_LW(out_vec[64:64]),
    .me_instr(out_vec[63:32]),
    .me_pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 138'h22ccf32d61f3e40a97bf29b341b927629d5;
    stim[1] = 138'h2a08bbc0373054f0fc01348c32f29592bd9;
    stim[2] = 138'h159ec5e232339f316e2a9a3c2464dc038ce;
    stim[3] = 138'h1c2ecb5f934483817e51a21b7d307a2311a;
    stim[4] = 138'h158d115e7d38d25ae0351b56006dd0d0bd1;
    stim[5] = 138'h1a9d50ac63ce5aa2126dc63317535382d51;
    stim[6] = 138'h0861a3be3d373a3238429b5dd354a089df6;
    stim[7] = 138'h05487b6a437e3daf22644fcd80d636380c6;
    stim[8] = 138'h134ba579b956968d78cfbbcb760266cbf6f;
    stim[9] = 138'h168599a8b3319c4efe5c914f8cd2cd5146b;
    stim[10] = 138'h06255d2b47a79db644c8fab377bade4de61;
    stim[11] = 138'h182a7f24cc880509d49440f90040b1548c8;
    stim[12] = 138'h05931715715947d6f549a1045684cc52663;
    stim[13] = 138'h0f8608b2f7ed5ea10d6b876c7f40f0f363d;
    stim[14] = 138'h08566dec6ca0005259bbb99b0c6c108ab28;
    stim[15] = 138'h1226d382aebc77ef4bdd6a3ed781315803e;
    stim[16] = 138'h113c221cdd257213faaf77684820bfe6c09;
    stim[17] = 138'h03e040869b109984e41f0012d9163425b51;
    stim[18] = 138'h130c5e14e82f591ed454d56694699731b9f;
    stim[19] = 138'h18be431b1ddb6cb9271c535395d109e40b5;
    stim[20] = 138'h17646fc34e4f56468487bf1ed7d9007a919;
    stim[21] = 138'h01d32063e3b2f9812b2ea243c430472ccd6;
    stim[22] = 138'h01ad50ac86c7470772361838fa752fd9deb;
    stim[23] = 138'h076e4e5f6f140afcc5e1994a234f55eb5ac;
    stim[24] = 138'h0784408a0083aa00b5cbd3226f38030f875;
    stim[25] = 138'h076b87f02e8ef0ab9a62881cdb6ae543671;
    stim[26] = 138'h032698b7bd6f6524e8f88090bf9325af14c;
    stim[27] = 138'h0a6cc1c5424ace8a9587f594f8cf10021e3;
    stim[28] = 138'h034141f79aefc7f8f12040a2b1cd7e1dd7d;
    stim[29] = 138'h1ce5062f5cdafa3cde3928ea3643d2bec05;
    stim[30] = 138'h10abc05738741ea639f14ca0d74c048f454;
    stim[31] = 138'h1929d2c00d3c0b89e7c34dc16750f0c9e81;
    stim[32] = 138'h1196af96a1564f345d0382c193f9fa93a07;
    stim[33] = 138'h1d13f16c949da6bc360a879716ba56364a7;
    stim[34] = 138'h16fba6cbf463ea95d32ff7908947e3d5ff7;
    stim[35] = 138'h04ca60976c30d8baead588d02a08d6ea9f8;
    stim[36] = 138'h10c0f9488b5e98800fa5ee492983ccf896b;
    stim[37] = 138'h13d8c57289dc34901ebe32e288435ac0496;
    stim[38] = 138'h081b6c848aff299505a2cdf2f97867a3dbe;
    stim[39] = 138'h03844c9aa7516420b146d49cc0a5311a2b9;
    stim[40] = 138'h001db1551e240d7ce4fc152b9b052085046;
    stim[41] = 138'h07becf519a3a4f343d3b2281dfefaab772a;
    stim[42] = 138'h011dd0aa465b5672c9337a5654c323b515d;
    stim[43] = 138'h11c44644ce6e6d72237f6c6a193b759b959;
    stim[44] = 138'h14e9bcee0c9a83a7669b3c2b4278d19eeb8;
    stim[45] = 138'h1d119e109ae4b460d5efad235abd2e7b1a4;
    stim[46] = 138'h16dba65a0be7779030e3ae0a0e8ec04a7cd;
    stim[47] = 138'h1322cc733019adbcc699d696581c7f61d5b;
    stim[48] = 138'h18590b9c23405bddd0ee15282d7b67f046c;
    stim[49] = 138'h1fbe6a3b43871a793119a17068c26604a5e;
    stim[50] = 138'h1ea2d23174065a2360383d65328caeca66d;
    stim[51] = 138'h0ca13f243c443e847dc14d0404617d72b16;
    stim[52] = 138'h369d026ff4403576b7a193edc69e9886acb;
    stim[53] = 138'h1c9ea8afc2f71dcd14f8328e6716106d3ea;
    stim[54] = 138'h168f93b3c06e18a412fda1541a17c83bfcd;
    stim[55] = 138'h1f8654f8b3ae1a868b830fa38f77c7d91de;
    stim[56] = 138'h1c6f626d4e2aeece3485e1c981b393f74a8;
    stim[57] = 138'h0778105b6124553da1fa7174c6bd5ee5a29;
    stim[58] = 138'h18cd7aa59b5780683c0e9654307e456e11c;
    stim[59] = 138'h17670677766c311d33552b3523bd8cd36e0;
    stim[60] = 138'h13d76380883ddd584954177d36ab9403b17;
    stim[61] = 138'h0572eee06c43afffc7ecd3f46ce9cfd850d;
    stim[62] = 138'h0b5cfb56b1a3c04d71419d27fafd94b0cf3;
    stim[63] = 138'h0a0b40fcb94da5f8edbc5af4dfb0b86f13e;
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
      expv[0] = 136'h0000000000000000000000002000000000;
      expv[1] = 136'h0000000000000000000000002000000000;
      expv[2] = 136'h0000000000000000000000002000000000;
      expv[3] = 136'h000000000000000000000000204dc038ce;
      expv[4] = 136'h0000000000000000000000002007a2311a;
      expv[5] = 136'h00000000000000000000000020dd0d0bd1;
      expv[6] = 136'h0000000000000000000000002035382d51;
      expv[7] = 136'h861a3be3d373a3238429b5dd354a089df6;
      expv[8] = 136'h5487b6a437e3daf22644fcd80d636380c6;
      expv[9] = 136'h00000000000000000000000020266cbf6f;
      expv[10] = 136'h000000000000000000000000202cd5146b;
      expv[11] = 136'h6255d2b47a79db644c8fab377bade4de61;
      expv[12] = 136'h000000000000000000000000200b1548c8;
      expv[13] = 136'h5931715715947d6f549a1045684cc52663;
      expv[14] = 136'hf8608b2f7ed5ea10d6b876c7f40f0f363d;
      expv[15] = 136'h8566dec6ca0005259bbb99b0c6c108ab28;
      expv[16] = 136'h000000000000000000000000201315803e;
      expv[17] = 136'h000000000000000000000000200bfe6c09;
      expv[18] = 136'h3e040869b109984e41f0012d9163425b51;
      expv[19] = 136'h0000000000000000000000002099731b9f;
      expv[20] = 136'h00000000000000000000000020109e40b5;
      expv[21] = 136'h000000000000000000000000209007a919;
      expv[22] = 136'h1d32063e3b2f9812b2ea243c430472ccd6;
      expv[23] = 136'h1ad50ac86c7470772361838fa752fd9deb;
      expv[24] = 136'h76e4e5f6f140afcc5e1994a234f55eb5ac;
      expv[25] = 136'h784408a0083aa00b5cbd3226f38030f875;
      expv[26] = 136'h76b87f02e8ef0ab9a62881cdb6ae543671;
      expv[27] = 136'h32698b7bd6f6524e8f88090bf9325af14c;
      expv[28] = 136'ha6cc1c5424ace8a9587f594f8cf10021e3;
      expv[29] = 136'h34141f79aefc7f8f12040a2b1cd7e1dd7d;
      expv[30] = 136'h000000000000000000000000203d2bec05;
      expv[31] = 136'h00000000000000000000000020c048f454;
      expv[32] = 136'h000000000000000000000000200f0c9e81;
      expv[33] = 136'h000000000000000000000000209fa93a07;
      expv[34] = 136'h00000000000000000000000020a56364a7;
      expv[35] = 136'h000000000000000000000000207e3d5ff7;
      expv[36] = 136'h4ca60976c30d8baead588d02a08d6ea9f8;
      expv[37] = 136'h000000000000000000000000203ccf896b;
      expv[38] = 136'h0000000000000000000000002035ac0496;
      expv[39] = 136'h81b6c848aff299505a2cdf2f97867a3dbe;
      expv[40] = 136'h3844c9aa7516420b146d49cc0a5311a2b9;
      expv[41] = 136'h01db1551e240d7ce4fc152b9b052085046;
      expv[42] = 136'h7becf519a3a4f343d3b2281dfefaab772a;
      expv[43] = 136'h11dd0aa465b5672c9337a5654c323b515d;
      expv[44] = 136'h00000000000000000000000020b759b959;
      expv[45] = 136'h000000000000000000000000208d19eeb8;
      expv[46] = 136'h00000000000000000000000020d2e7b1a4;
      expv[47] = 136'h00000000000000000000000020ec04a7cd;
      expv[48] = 136'h00000000000000000000000020c7f61d5b;
      expv[49] = 136'h00000000000000000000000020b67f046c;
      expv[50] = 136'h0000000000000000000000002026604a5e;
      expv[51] = 136'h00000000000000000000000020caeca66d;
      expv[52] = 136'h0000000000000000000000002000000000;
      expv[53] = 136'h0000000000000000000000002000000000;
      expv[54] = 136'h000000000000000000000000206106d3ea;
      expv[55] = 136'h000000000000000000000000207c83bfcd;
      expv[56] = 136'h000000000000000000000000207c7d91de;
      expv[57] = 136'h00000000000000000000000020393f74a8;
      expv[58] = 136'h778105b6124553da1fa7174c6bd5ee5a29;
      expv[59] = 136'h00000000000000000000000020e456e11c;
      expv[60] = 136'h00000000000000000000000020d8cd36e0;
      expv[61] = 136'h00000000000000000000000020b9403b17;
      expv[62] = 136'h572eee06c43afffc7ecd3f46ce9cfd850d;
      expv[63] = 136'hb5cfb56b1a3c04d71419d27fafd94b0cf3;
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
