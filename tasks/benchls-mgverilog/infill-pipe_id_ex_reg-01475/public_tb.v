// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 125;
  localparam OW = 124;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01475 dut (
    .clk(clk),
    .i_wreg(in_vec[124:124]),
    .i_m2reg(in_vec[123:123]),
    .i_wmem(in_vec[122:122]),
    .i_aluc(in_vec[121:118]),
    .i_aluimm(in_vec[117:117]),
    .i_a(in_vec[116:85]),
    .i_b(in_vec[84:53]),
    .i_imm(in_vec[52:21]),
    .i_rn(in_vec[20:16]),
    .i_shift(in_vec[15:15]),
    .i_jal(in_vec[14:14]),
    .i_pc4(in_vec[13:6]),
    .i_sa(in_vec[5:1]),
    .rst(in_vec[0:0]),
    .o_wreg(out_vec[123:123]),
    .o_m2reg(out_vec[122:122]),
    .o_wmem(out_vec[121:121]),
    .o_aluc(out_vec[120:117]),
    .o_aluimm(out_vec[116:116]),
    .o_a(out_vec[115:84]),
    .o_b(out_vec[83:52]),
    .o_imm(out_vec[51:20]),
    .o_rn(out_vec[19:15]),
    .o_shift(out_vec[14:14]),
    .o_jal(out_vec[13:13]),
    .o_pc4(out_vec[12:5]),
    .o_sa(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 125'h04a658078d01aed3cdb79540ca012bd9;
    stim[1] = 125'h04329b093620bdc685ffee58d4502e5d;
    stim[2] = 125'h17d63ef63fa1b0e4475dab21aa07bf92;
    stim[3] = 125'h16b4817b2c95a66aca825a4abaf960b2;
    stim[4] = 125'h14556f14bb742b1ec2320c9187f6f988;
    stim[5] = 125'h0348cb9b6088f096e4317bb6a7d86052;
    stim[6] = 125'h03658692aa5efd0c5e46a1abcd6f1a5c;
    stim[7] = 125'h0df2dbcb4155ec4cd5ac1ca948f98cd8;
    stim[8] = 125'h0b492d2aae20a17b5dcaa30abe320da4;
    stim[9] = 125'h0f3647503b711b36e20957c1eee95942;
    stim[10] = 125'h0f6aa668445bbd2c034d2452a30636ce;
    stim[11] = 125'h08c3ac88e47a20d3cd906958a4c74980;
    stim[12] = 125'h1bfda539d7e5f32e4e7c7366023237d0;
    stim[13] = 125'h179f5de965e073a6bccb931d34d24d66;
    stim[14] = 125'h1368465faa96459e660947a1751495e4;
    stim[15] = 125'h1800b6b29bafb4337fa4328821bb0234;
    stim[16] = 125'h09dbb7dd19d37436846895ec90e76938;
    stim[17] = 125'h0d6bd52fbeda86cc46186c5d1369967a;
    stim[18] = 125'h19999d8576bec81cced69f8628b0edba;
    stim[19] = 125'h0975be29c4bb3e8ee92984bf8c9590e8;
    stim[20] = 125'h19a4b29ad2a97f1ed64376014a42952a;
    stim[21] = 125'h165b6792a2e9a6b2f41015aad5d5e08e;
    stim[22] = 125'h0608376c945913fd7f04982f08762a74;
    stim[23] = 125'h1d12b7a13341ad90139b636abadc2c6c;
    stim[24] = 125'h117ade32457df04f74f4e953157f8ae0;
    stim[25] = 125'h1966f1ffa149ace0afa048a5be61d59e;
    stim[26] = 125'h1be87967c8e966233a7309e00b725b00;
    stim[27] = 125'h001c9d3075f95f25269e7bd964926ae0;
    stim[28] = 125'h1dc2e6272800fa1bc6f700bf355c03f6;
    stim[29] = 125'h117dc8f4fb3d71be2aca1f86410505d6;
    stim[30] = 125'h1212b4154caa813e32565b169fd045b7;
    stim[31] = 125'h0f27e6b5d5e4625c7249197d405b5e2c;
    stim[32] = 125'h001ac060df06ab5c9e6a8316b62861f6;
    stim[33] = 125'h039ff7ad2494413c219d26a6e54d1dda;
    stim[34] = 125'h06386feb1d29f3fc72a85cb47a592a1e;
    stim[35] = 125'h06fc76a1fd19fe79e388e94b01ae4ae6;
    stim[36] = 125'h1992daab9a790e2d1d19bf9bf2995a5e;
    stim[37] = 125'h01cb05b09b6fb9ec56589b743a25367e;
    stim[38] = 125'h039ba060cfa718c0c31fecc37b6dfc60;
    stim[39] = 125'h03a5ae58bf7fa2fee94434069fb5ac20;
    stim[40] = 125'h01fd0de4ce3813b1e9d4caa23c54b73c;
    stim[41] = 125'h155f55da3c56831f34fee1ba85e85a58;
    stim[42] = 125'h0210e58c5653676ad24c77e4eae26e7a;
    stim[43] = 125'h13c5fb921a677e951f130be624be762a;
    stim[44] = 125'h195d96f94cc5e3c99942931e2129abc8;
    stim[45] = 125'h0a14dc0b1219c5f34fe7646e3a48dfa8;
    stim[46] = 125'h17c624b978fcdabf1ee9f028f1111eb8;
    stim[47] = 125'h08053af02c0dc9ca3e36cf09ccae327e;
    stim[48] = 125'h036fb00a6d4bb62345d82f65d2de614c;
    stim[49] = 125'h12b49f970e276159a0f71174324b4b98;
    stim[50] = 125'h189ad3d005c4c6857f40ac56a606a4a0;
    stim[51] = 125'h1047bdcd3079a658a7d8dcb108afcdc6;
    stim[52] = 125'h1ee128e65122c5ee0ce609887d29559a;
    stim[53] = 125'h08a92ec922a3fa2c947908a3a8252d3a;
    stim[54] = 125'h16eef0f1afcb502d7e28fd8d9214d146;
    stim[55] = 125'h10f4c210620a17757f90f7c93b505ef8;
    stim[56] = 125'h19dcc24271f6fd3eda28dbd0d60341a0;
    stim[57] = 125'h07d69becd5826c4de24c9ca7a3062eb0;
    stim[58] = 125'h1a180cc7a6df6a16cd475b3be54b7cb4;
    stim[59] = 125'h0b862fc590d79cbc4a0f5b88f14bdbc0;
    stim[60] = 125'h11c388a0d0fdd6d86f3c378b7c88aed4;
    stim[61] = 125'h058b3e48d97f5803efadc93ab4b1f464;
    stim[62] = 125'h026f01a8b652d70aeb9206cbdc03b98e;
    stim[63] = 125'h1a016b0e1e7475cf18e5cb8eee0aca20;
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
      expv[0] = 124'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 124'h0000000000000000000000000000000;
      expv[2] = 124'h0000000000000000000000000000000;
      expv[3] = 124'hbeb1f7b1fd0d87223aed590d503dfc9;
      expv[4] = 124'hb5a40bd964ad33565412d255d7cb059;
      expv[5] = 124'ha2ab78a5dba158f61190648c3fb7cc4;
      expv[6] = 124'h1a465cdb044784b7218bddb53ec3029;
      expv[7] = 124'h1b2c349552f7e862f2350d5e6b78d2e;
      expv[8] = 124'h6f96de5a0aaf6266ad60e54a47cc66c;
      expv[9] = 124'h5a49695571050bdaee551855f1906d2;
      expv[10] = 124'h79b23a81db88d9b7104abe0f774aca1;
      expv[11] = 124'h7b55334222dde9601a6922951831b67;
      expv[12] = 124'h461d644723d1069e6c834ac5263a4c0;
      expv[13] = 124'hdfed29cebf2f997273e39b301191be8;
      expv[14] = 124'hbcfaef4b2f039d35e65c98e9a6926b3;
      expv[15] = 124'h9b4232fd54b22cf3304a3d0ba8a4af2;
      expv[16] = 124'hc005b594dd7da19bfd2194410dd811a;
      expv[17] = 124'h4eddbee8ce9ba1b42344af64873b49c;
      expv[18] = 124'h6b5ea97df6d4366230c362e89b4cb3d;
      expv[19] = 124'hccccec2bb5f640e676b4fc3145876dd;
      expv[20] = 124'h4badf14e25d9f477494c25fc64ac874;
      expv[21] = 124'hcd2594d6954bf8f6b21bb00a5214a95;
      expv[22] = 124'hb2db3c95174d3597a080ad56aeaf047;
      expv[23] = 124'h3041bb64a2c89febf824c17843b153a;
      expv[24] = 124'he895bd099a0d6c809cdb1b55d6e1636;
      expv[25] = 124'h8bd6f1922bef827ba7a74a98abfc570;
      expv[26] = 124'hcb378ffd0a4d67057d02452df30eacf;
      expv[27] = 124'hdf43cb3e474b3119d3984f005b92d80;
      expv[28] = 124'h00e4e983afcaf92934f3decb2493570;
      expv[29] = 124'hee1731394007d0de37b805f9aae01fb;
      expv[30] = 124'h8bee47a7d9eb8df15650fc3208282eb;
      expv[31] = 124'h0000000000000000000000000000000;
      expv[32] = 124'h793f35aeaf2312e39248cbea02daf16;
      expv[33] = 124'h00d60306f8355ae4f35418b5b1430fb;
      expv[34] = 124'h1cffbd6924a209e10ce935372a68eed;
      expv[35] = 124'h31c37f58e94f9fe39542e5a3d2c950f;
      expv[36] = 124'h37e3b50fe8cff3cf1c474a580d72573;
      expv[37] = 124'hcc96d55cd3c87168e8cdfcdf94cad2f;
      expv[38] = 124'h0e582d84db7dcf62b2c4dba1d129b3f;
      expv[39] = 124'h1cdd03067d38c60618ff661bdb6fe30;
      expv[40] = 124'h1d2d72c5fbfd17f74a21a034fdad610;
      expv[41] = 124'h0fe86f2671c09d8f4ea65511e2a5b9e;
      expv[42] = 124'haafaaed1e2b418f9a7f70dd42f42d2c;
      expv[43] = 124'h10872c62b29b3b569263bf27571373d;
      expv[44] = 124'h9e2fdc90d33bf4a8f8985f3125f3b15;
      expv[45] = 124'hcaecb7ca662f1e4cca1498f1094d5e4;
      expv[46] = 124'h50a6e05890ce2f9a7f3b2371d246fd4;
      expv[47] = 124'hbe3125cbc7e6d5f8f74f81478888f5c;
      expv[48] = 124'h4029d781606e4e51f1b6784e657193f;
      expv[49] = 124'h1b7d80536a5db11a2ec17b2e96f30a6;
      expv[50] = 124'h95a4fcb8713b0acd07b88ba1925a5cc;
      expv[51] = 124'hc4d69e802e26342bfa0562b53035250;
      expv[52] = 124'h823dee6983cd32c53ec6e588457e6e3;
      expv[53] = 124'hf709473289162f7067304c43e94aacd;
      expv[54] = 124'h45497649151fd164a3c8451d412969d;
      expv[55] = 124'hb777878d7e5a816bf147ec6c90a68a3;
      expv[56] = 124'h87a610831050bbabfc87be49da82f7c;
      expv[57] = 124'hcee612138fb7e9f6d146de86b01a0d0;
      expv[58] = 124'h3eb4df66ac13626f1264e53d1831758;
      expv[59] = 124'hd0c0663d36fb50b66a3ad9df2a5be5a;
      expv[60] = 124'h5c317e2c86bce5e2507adc478a5ede0;
      expv[61] = 124'h8e1c450687eeb6c379e1bc5be44576a;
      expv[62] = 124'h2c59f246cbfac01f7d6e49d5a58fa32;
      expv[63] = 124'h13780d45b296b8575c90365ee01dcc7;
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
