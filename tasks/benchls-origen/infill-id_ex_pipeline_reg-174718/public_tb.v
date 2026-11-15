// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 148;
  localparam OW = 148;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174718 dut (
    .clk(clk),
    .inc_pc(in_vec[147:116]),
    .read_data_1(in_vec[115:84]),
    .read_data_2(in_vec[83:52]),
    .sign_extended(in_vec[51:20]),
    .rt(in_vec[19:15]),
    .rd(in_vec[14:10]),
    .mem_to_reg(in_vec[9:9]),
    .reg_write(in_vec[8:8]),
    .branch(in_vec[7:7]),
    .mem_read(in_vec[6:6]),
    .mem_write(in_vec[5:5]),
    .reg_dest(in_vec[4:4]),
    .alu_src(in_vec[3:3]),
    .alu_op(in_vec[2:0]),
    .inc_pc_reg(out_vec[147:116]),
    .read_data_1_reg(out_vec[115:84]),
    .read_data_2_reg(out_vec[83:52]),
    .sign_extended_reg(out_vec[51:20]),
    .rt_reg(out_vec[19:15]),
    .rd_reg(out_vec[14:10]),
    .mem_to_reg_reg(out_vec[9:9]),
    .reg_write_reg(out_vec[8:8]),
    .branch_reg(out_vec[7:7]),
    .mem_read_reg(out_vec[6:6]),
    .mem_write_reg(out_vec[5:5]),
    .reg_dest_reg(out_vec[4:4]),
    .alu_src_reg(out_vec[3:3]),
    .alu_op_reg(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 148'hbe38383833c85027e6d83ff2a8cd46035c467;
    stim[1] = 148'h56c68842ec5d7ebe8913aeba889a623722f2a;
    stim[2] = 148'h85180abad07a79ee81f6fbf2dae43023101bf;
    stim[3] = 148'h68dc5978dd8b4241fd5bf02402d9a90a87718;
    stim[4] = 148'h928ad8f0b6343bebcb15c9313bb9d0d828d82;
    stim[5] = 148'h192eaccd2216df181d6ce4dac3703532b335f;
    stim[6] = 148'h740cbc3393f716cf6abf33c5a46d555655352;
    stim[7] = 148'hc94ccd6806ef23182013882b1b3dc30872a0d;
    stim[8] = 148'h5ff14fdfdc283797ca598bb7a43ecec8866bc;
    stim[9] = 148'h004adcbca3e2541d48deb352de56c6c32d4d9;
    stim[10] = 148'h61e20593a2525c465d1e9ded1bfee25fe70cc;
    stim[11] = 148'h0c28f53e7e93c16467133b10c4efd683cb124;
    stim[12] = 148'h1d2ae0d5760422f7f418b805b752c2adb11d3;
    stim[13] = 148'h3c1f046c2c32a06ef9b66e27668f1300eaf94;
    stim[14] = 148'h87a2b87f6c25f4e60c4c31dd217f12f7f4514;
    stim[15] = 148'heea016159eb289b9a8699dae30d35a04a1599;
    stim[16] = 148'hd2ef17f7d0e1c2052e50b08231be7a93e270e;
    stim[17] = 148'h82219bb12f27c7a4b686f4e898ee723c14993;
    stim[18] = 148'h3ae64f011b38cb2591c5a57e8fa9cd3431561;
    stim[19] = 148'hce138904e31297794a6c77a143bc3759dd14c;
    stim[20] = 148'hae25dd0af5508dbfaa371f806908da7af3e82;
    stim[21] = 148'hb1868126ef3c9cdcf7fc78cf7e155187432eb;
    stim[22] = 148'h5de3e0440dc436a1b18c72eaa7449e9f43b45;
    stim[23] = 148'h17a3fc8a1b56df9af2d636e0e1f858d351acf;
    stim[24] = 148'h2fd9fcdb87df7d8f7be6703ae737c08876f5c;
    stim[25] = 148'h86fc60d93cdf22c9a8e906117959577498f4a;
    stim[26] = 148'h6718c4bdf7b92972577aa903d6088d052c39c;
    stim[27] = 148'h3cf5cbf766b991fd517b6f8b84554aa2c158a;
    stim[28] = 148'hdefc6aab5fdfbab10e3cff3ecdb7d6bc6caad;
    stim[29] = 148'h9dbd196879c3a2ca4612f962f69a2b1da18a3;
    stim[30] = 148'h8276146c36cd5fd31886ddcce15ea4fa745c4;
    stim[31] = 148'h955f8dfae6ae1d34c6483746ef9b701ea17ab;
    stim[32] = 148'hd41c670e12ca11edea7aa80135cea3e150cad;
    stim[33] = 148'h30f11ecf8fa2890fbb3507a178acf97de24b5;
    stim[34] = 148'h9fb6b6de7f8558d023e95b98d9c67edcb56c1;
    stim[35] = 148'h7150d59aa9f1218db1c5a72b7100a8ba8f5e9;
    stim[36] = 148'hd4daf841abeaaac980d089057494a1edb4ce8;
    stim[37] = 148'h1a2adeae85c01c1dbece7b21fcf10279da966;
    stim[38] = 148'h0445f590084ddd75d4c27a2622ebbb844297b;
    stim[39] = 148'hac447be8defc54d5d9af7712659e726862c2b;
    stim[40] = 148'h08362fa23ffae8c259eeec247e05e92b0e803;
    stim[41] = 148'hf277ecab8e77ec2653fc386c271d358c78f4a;
    stim[42] = 148'h8abab54bedf5df50c146de412f1ee7b2981fe;
    stim[43] = 148'h9f88b6756234cab8999869579ac21d593469d;
    stim[44] = 148'h0a2f41d9138ae9a33aacb08d71ce842948663;
    stim[45] = 148'hce034c913aaad28cb42fbf49978c204ee8a51;
    stim[46] = 148'hf1935751a871da9ceb62848a5a35d0227192d;
    stim[47] = 148'h45ecf22bf2a5bdbdc94366fb93b7747ea46c4;
    stim[48] = 148'hc8409f2f2cf5f7f883964d1b3b353a130e69f;
    stim[49] = 148'h0ec87640b081fff20b8f8b713f6edb915a37e;
    stim[50] = 148'h07e37025f9f5615585f1c55747beff4ba592a;
    stim[51] = 148'h1086a2fb6c470372dfc548041910fbb04255c;
    stim[52] = 148'h74f0af2b35eb1816fb2ca9f594cadad7bbd20;
    stim[53] = 148'h9c3c1bf44d8c366736dad47d6407ceef9f120;
    stim[54] = 148'h1256f185320236aa1db32c527bb39d5d7b4dd;
    stim[55] = 148'hc5afc38ae6945cd864a4a8bd51cdd25c33498;
    stim[56] = 148'h4ab86a646e8d1ea829f6a3bfc5b21ec4d6f90;
    stim[57] = 148'h5517d54fc67ce1247bc39c21db0c6a634e313;
    stim[58] = 148'hb94614fbe43a1973b259d62d96976928b2ffe;
    stim[59] = 148'h08cb2095d9e2d60291fad8edb65c2a30358e4;
    stim[60] = 148'hb335490fa23b18257570efe6354b28a630643;
    stim[61] = 148'h3fbe61142f44fa1d700bbe95ad781c25fd073;
    stim[62] = 148'he84bc5d29d79e618360e03bee5e91662090db;
    stim[63] = 148'h0f0a00b36ac9466d473c0cce6504883236110;
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
      expv[0] = 148'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 148'hbe38383833c85027e6d83ff2a8cd46035c467;
      expv[2] = 148'h56c68842ec5d7ebe8913aeba889a623722f2a;
      expv[3] = 148'h85180abad07a79ee81f6fbf2dae43023101bf;
      expv[4] = 148'h68dc5978dd8b4241fd5bf02402d9a90a87718;
      expv[5] = 148'h928ad8f0b6343bebcb15c9313bb9d0d828d82;
      expv[6] = 148'h192eaccd2216df181d6ce4dac3703532b335f;
      expv[7] = 148'h740cbc3393f716cf6abf33c5a46d555655352;
      expv[8] = 148'hc94ccd6806ef23182013882b1b3dc30872a0d;
      expv[9] = 148'h5ff14fdfdc283797ca598bb7a43ecec8866bc;
      expv[10] = 148'h004adcbca3e2541d48deb352de56c6c32d4d9;
      expv[11] = 148'h61e20593a2525c465d1e9ded1bfee25fe70cc;
      expv[12] = 148'h0c28f53e7e93c16467133b10c4efd683cb124;
      expv[13] = 148'h1d2ae0d5760422f7f418b805b752c2adb11d3;
      expv[14] = 148'h3c1f046c2c32a06ef9b66e27668f1300eaf94;
      expv[15] = 148'h87a2b87f6c25f4e60c4c31dd217f12f7f4514;
      expv[16] = 148'heea016159eb289b9a8699dae30d35a04a1599;
      expv[17] = 148'hd2ef17f7d0e1c2052e50b08231be7a93e270e;
      expv[18] = 148'h82219bb12f27c7a4b686f4e898ee723c14993;
      expv[19] = 148'h3ae64f011b38cb2591c5a57e8fa9cd3431561;
      expv[20] = 148'hce138904e31297794a6c77a143bc3759dd14c;
      expv[21] = 148'hae25dd0af5508dbfaa371f806908da7af3e82;
      expv[22] = 148'hb1868126ef3c9cdcf7fc78cf7e155187432eb;
      expv[23] = 148'h5de3e0440dc436a1b18c72eaa7449e9f43b45;
      expv[24] = 148'h17a3fc8a1b56df9af2d636e0e1f858d351acf;
      expv[25] = 148'h2fd9fcdb87df7d8f7be6703ae737c08876f5c;
      expv[26] = 148'h86fc60d93cdf22c9a8e906117959577498f4a;
      expv[27] = 148'h6718c4bdf7b92972577aa903d6088d052c39c;
      expv[28] = 148'h3cf5cbf766b991fd517b6f8b84554aa2c158a;
      expv[29] = 148'hdefc6aab5fdfbab10e3cff3ecdb7d6bc6caad;
      expv[30] = 148'h9dbd196879c3a2ca4612f962f69a2b1da18a3;
      expv[31] = 148'h8276146c36cd5fd31886ddcce15ea4fa745c4;
      expv[32] = 148'h955f8dfae6ae1d34c6483746ef9b701ea17ab;
      expv[33] = 148'hd41c670e12ca11edea7aa80135cea3e150cad;
      expv[34] = 148'h30f11ecf8fa2890fbb3507a178acf97de24b5;
      expv[35] = 148'h9fb6b6de7f8558d023e95b98d9c67edcb56c1;
      expv[36] = 148'h7150d59aa9f1218db1c5a72b7100a8ba8f5e9;
      expv[37] = 148'hd4daf841abeaaac980d089057494a1edb4ce8;
      expv[38] = 148'h1a2adeae85c01c1dbece7b21fcf10279da966;
      expv[39] = 148'h0445f590084ddd75d4c27a2622ebbb844297b;
      expv[40] = 148'hac447be8defc54d5d9af7712659e726862c2b;
      expv[41] = 148'h08362fa23ffae8c259eeec247e05e92b0e803;
      expv[42] = 148'hf277ecab8e77ec2653fc386c271d358c78f4a;
      expv[43] = 148'h8abab54bedf5df50c146de412f1ee7b2981fe;
      expv[44] = 148'h9f88b6756234cab8999869579ac21d593469d;
      expv[45] = 148'h0a2f41d9138ae9a33aacb08d71ce842948663;
      expv[46] = 148'hce034c913aaad28cb42fbf49978c204ee8a51;
      expv[47] = 148'hf1935751a871da9ceb62848a5a35d0227192d;
      expv[48] = 148'h45ecf22bf2a5bdbdc94366fb93b7747ea46c4;
      expv[49] = 148'hc8409f2f2cf5f7f883964d1b3b353a130e69f;
      expv[50] = 148'h0ec87640b081fff20b8f8b713f6edb915a37e;
      expv[51] = 148'h07e37025f9f5615585f1c55747beff4ba592a;
      expv[52] = 148'h1086a2fb6c470372dfc548041910fbb04255c;
      expv[53] = 148'h74f0af2b35eb1816fb2ca9f594cadad7bbd20;
      expv[54] = 148'h9c3c1bf44d8c366736dad47d6407ceef9f120;
      expv[55] = 148'h1256f185320236aa1db32c527bb39d5d7b4dd;
      expv[56] = 148'hc5afc38ae6945cd864a4a8bd51cdd25c33498;
      expv[57] = 148'h4ab86a646e8d1ea829f6a3bfc5b21ec4d6f90;
      expv[58] = 148'h5517d54fc67ce1247bc39c21db0c6a634e313;
      expv[59] = 148'hb94614fbe43a1973b259d62d96976928b2ffe;
      expv[60] = 148'h08cb2095d9e2d60291fad8edb65c2a30358e4;
      expv[61] = 148'hb335490fa23b18257570efe6354b28a630643;
      expv[62] = 148'h3fbe61142f44fa1d700bbe95ad781c25fd073;
      expv[63] = 148'he84bc5d29d79e618360e03bee5e91662090db;
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
