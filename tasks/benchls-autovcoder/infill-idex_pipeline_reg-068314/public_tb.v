// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 163;
  localparam OW = 161;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068314 dut (
    .clk(clk),
    .reset(in_vec[162:162]),
    .write(in_vec[161:161]),
    .RegWrite_in(in_vec[160:160]),
    .MemtoReg_in(in_vec[159:159]),
    .MemRead_in(in_vec[158:158]),
    .MemWrite_in(in_vec[157:157]),
    .ALUSrc_in(in_vec[156:156]),
    .Branch_in(in_vec[155:155]),
    .ALUop_in(in_vec[154:153]),
    .pc_in(in_vec[152:121]),
    .ALU_A_in(in_vec[120:89]),
    .ALU_B_in(in_vec[88:57]),
    .imm_in(in_vec[56:25]),
    .funct7_in(in_vec[24:18]),
    .funct3_in(in_vec[17:15]),
    .rs1_in(in_vec[14:10]),
    .rs2_in(in_vec[9:5]),
    .rd_in(in_vec[4:0]),
    .RegWrite_out(out_vec[160:160]),
    .MemtoReg_out(out_vec[159:159]),
    .MemRead_out(out_vec[158:158]),
    .MemWrite_out(out_vec[157:157]),
    .ALUSrc_out(out_vec[156:156]),
    .Branch_out(out_vec[155:155]),
    .ALUop_out(out_vec[154:153]),
    .pc_out(out_vec[152:121]),
    .ALU_A_out(out_vec[120:89]),
    .ALU_B_out(out_vec[88:57]),
    .imm_out(out_vec[56:25]),
    .funct7_out(out_vec[24:18]),
    .funct3_out(out_vec[17:15]),
    .rs1_out(out_vec[14:10]),
    .rs2_out(out_vec[9:5]),
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
    stim[0] = 163'h60729a961b37ef53539217b215fe0bceba5ead84a;
    stim[1] = 163'h4f880244f5c81364af5e70e8bd206fe89a1e3fed6;
    stim[2] = 163'h28c6408d659e49b7b6f315a4c7a3695acedb1ef2c;
    stim[3] = 163'h21a06385ffab1a4903e1ae84cd47afb5efc947f22;
    stim[4] = 163'h04cd307b7cc3a3485fb13a3067f1723edcddea4c2;
    stim[5] = 163'h1446ba3c227239f18ddab253939ccfb36ead49c42;
    stim[6] = 163'h114db0c5455ad78b7dc5aa2b5a3bf38b4b431418b;
    stim[7] = 163'h213eb465e3f8c8a87a65c736bc09985f3a06c8af1;
    stim[8] = 163'h18ee450225124207c12b2e2e073ab5f21ca9e57e7;
    stim[9] = 163'h18803c1638a3253137273451b42a264bedc3b6366;
    stim[10] = 163'h0a6cca96d93e0e1906f56402516ce90d7a1c14555;
    stim[11] = 163'h2aa3c7a8386991ac2e544b7ae2921202d5537c2dc;
    stim[12] = 163'h5ebb58f7f5de25ebf978717b2cbaee4eb162f5b27;
    stim[13] = 163'h1db17155ddc75d19ac2a0a162d60c63b47b14eb2a;
    stim[14] = 163'h35a6f751250b6c25fcf17086a028538cde425925e;
    stim[15] = 163'h10f095593574638dff88f42b4a2339f183c463634;
    stim[16] = 163'h25e7f2a4f5a3aca7d6ad8ec14453cc4a52a7750a2;
    stim[17] = 163'h3465a183ad9c9fc6296d093e682fe6d2dab4c84e9;
    stim[18] = 163'h0d217024cf9e827e025deb85fbad469b8c232e5a1;
    stim[19] = 163'h2597ab2399453f2488cf8c58eb64ea0a6d69435e9;
    stim[20] = 163'h11ad0c5919137176c539a1b5c89917089f7ba9c5e;
    stim[21] = 163'h140437b4f223664e046b8d25192f397ea1f099b3c;
    stim[22] = 163'h03ad559c164a5ce3fb6b32d9e780e63e0ec581b0e;
    stim[23] = 163'h2d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
    stim[24] = 163'h0b364d052cceab53143d4c1b04523523df815c838;
    stim[25] = 163'h1d09cf4a2b94d37db5d3ef027e73a099bdcfa2cdc;
    stim[26] = 163'h198db57337a551f25cbbe5c87dd02a958f8053568;
    stim[27] = 163'h16ce23b7917b7030dad5e2c9c994e33577d6996ac;
    stim[28] = 163'h075e50f787b924ec954ee6befe95dc49592cd4ad3;
    stim[29] = 163'h3383f9c93d7ce81215649a56cfa156dce115c0904;
    stim[30] = 163'h0bf38ec88b4783d369cde4a8679e2f3bd012569a9;
    stim[31] = 163'h318ef4a807a0faa7c68f818026e81dd86dbdef369;
    stim[32] = 163'h376ef2d1a0c367bf6fdf9d8cb88f24342960ddc09;
    stim[33] = 163'h212e1d68bb8b5fab99ddfa64dd0d2bb163f1a2363;
    stim[34] = 163'h289c5780c51d1fbdd0bbbcc9320adffaeeef47c19;
    stim[35] = 163'h14969d852298de9c2f5f804d018c3641aa926ff95;
    stim[36] = 163'h31613fc3a5accb725f2def84092ed84b098de687f;
    stim[37] = 163'h3436d7285fbc4962155a2b1d89f05f63307b3e68f;
    stim[38] = 163'h78f95c91306e8740a715c49c30257000cf39a5106;
    stim[39] = 163'h11b55271d23b7ff86898dabe7a8edadeec9bcee56;
    stim[40] = 163'h2ce01d72e999c1117e43090638b2f78384d5d2d8a;
    stim[41] = 163'h0206e8511dca11b77f902b178f1c923a3c4e3d3cc;
    stim[42] = 163'h274bc6b2b97aea03921f40386eaeee1422ecb9961;
    stim[43] = 163'h04982c19447d3aa76ad238da6f7a59168d6021d3c;
    stim[44] = 163'h199c61b8309e1e3fff161429bf93a7a7be1d390af;
    stim[45] = 163'h2a4e8bee974c7bf87c48f4b916dbaea29b63180e7;
    stim[46] = 163'h33439c27e581141515bed66c3f7d366a5fd81c425;
    stim[47] = 163'h0aca76f6ca1a415a7190fd83f7ce8407d9965c36e;
    stim[48] = 163'h33ff8ea03d6aedc9099e82372049dbf0fe9d19700;
    stim[49] = 163'h24422987d0b47a893b1006fba255b5be70edcb4f6;
    stim[50] = 163'h2f35017d15263fb46b74b962a4c596bd99fbeec38;
    stim[51] = 163'h3ff20906eec9f061f2b477ddb55dad696b21ffb57;
    stim[52] = 163'h22ac970b8009db85f37a214c68bc54d2a482a5ed8;
    stim[53] = 163'h3e0674ba5bfed270f7f8e36df94a60290ad905b60;
    stim[54] = 163'h3a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
    stim[55] = 163'h03fa692910c4bbed39fbfd0efb0cc548d32a3d16b;
    stim[56] = 163'h011f46c732378e615e803bec6f28bfc483b5f4133;
    stim[57] = 163'h1e4b05c2a6710b769a6c51ced5ac6d90f519886e7;
    stim[58] = 163'h13187e2378b9128938ce82e60333a80b1787cb435;
    stim[59] = 163'h15054603186fbb102c6c9a473ce7e2a0f8fc9da1a;
    stim[60] = 163'h1b27c95e55a167987f695875ec14ffc2f49d64ef7;
    stim[61] = 163'h183890ba0d8b0b556444cad2fa5415e8b47719fea;
    stim[62] = 163'h2cd7c2d6490d4a8de547f19bcc6cf13bf51a7ad61;
    stim[63] = 163'h2e0ba112d85f4b149d507462f7be6a92310bcaac5;
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
      expv[0] = 161'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 161'h00000000000000000000000000000000000000000;
      expv[2] = 161'h00000000000000000000000000000000000000000;
      expv[3] = 161'h08c6408d659e49b7b6f315a4c7a3695acedb1ef2c;
      expv[4] = 161'h01a06385ffab1a4903e1ae84cd47afb5efc947f22;
      expv[5] = 161'h01a06385ffab1a4903e1ae84cd47afb5efc947f22;
      expv[6] = 161'h01a06385ffab1a4903e1ae84cd47afb5efc947f22;
      expv[7] = 161'h01a06385ffab1a4903e1ae84cd47afb5efc947f22;
      expv[8] = 161'h013eb465e3f8c8a87a65c736bc09985f3a06c8af1;
      expv[9] = 161'h013eb465e3f8c8a87a65c736bc09985f3a06c8af1;
      expv[10] = 161'h013eb465e3f8c8a87a65c736bc09985f3a06c8af1;
      expv[11] = 161'h013eb465e3f8c8a87a65c736bc09985f3a06c8af1;
      expv[12] = 161'h0aa3c7a8386991ac2e544b7ae2921202d5537c2dc;
      expv[13] = 161'h00000000000000000000000000000000000000000;
      expv[14] = 161'h00000000000000000000000000000000000000000;
      expv[15] = 161'h15a6f751250b6c25fcf17086a028538cde425925e;
      expv[16] = 161'h15a6f751250b6c25fcf17086a028538cde425925e;
      expv[17] = 161'h05e7f2a4f5a3aca7d6ad8ec14453cc4a52a7750a2;
      expv[18] = 161'h1465a183ad9c9fc6296d093e682fe6d2dab4c84e9;
      expv[19] = 161'h1465a183ad9c9fc6296d093e682fe6d2dab4c84e9;
      expv[20] = 161'h0597ab2399453f2488cf8c58eb64ea0a6d69435e9;
      expv[21] = 161'h0597ab2399453f2488cf8c58eb64ea0a6d69435e9;
      expv[22] = 161'h0597ab2399453f2488cf8c58eb64ea0a6d69435e9;
      expv[23] = 161'h0597ab2399453f2488cf8c58eb64ea0a6d69435e9;
      expv[24] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[25] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[26] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[27] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[28] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[29] = 161'h0d9cd56a57e295de56b599e8806dc7e64d6e6c5ec;
      expv[30] = 161'h1383f9c93d7ce81215649a56cfa156dce115c0904;
      expv[31] = 161'h1383f9c93d7ce81215649a56cfa156dce115c0904;
      expv[32] = 161'h118ef4a807a0faa7c68f818026e81dd86dbdef369;
      expv[33] = 161'h176ef2d1a0c367bf6fdf9d8cb88f24342960ddc09;
      expv[34] = 161'h012e1d68bb8b5fab99ddfa64dd0d2bb163f1a2363;
      expv[35] = 161'h089c5780c51d1fbdd0bbbcc9320adffaeeef47c19;
      expv[36] = 161'h089c5780c51d1fbdd0bbbcc9320adffaeeef47c19;
      expv[37] = 161'h11613fc3a5accb725f2def84092ed84b098de687f;
      expv[38] = 161'h1436d7285fbc4962155a2b1d89f05f63307b3e68f;
      expv[39] = 161'h00000000000000000000000000000000000000000;
      expv[40] = 161'h00000000000000000000000000000000000000000;
      expv[41] = 161'h0ce01d72e999c1117e43090638b2f78384d5d2d8a;
      expv[42] = 161'h0ce01d72e999c1117e43090638b2f78384d5d2d8a;
      expv[43] = 161'h074bc6b2b97aea03921f40386eaeee1422ecb9961;
      expv[44] = 161'h074bc6b2b97aea03921f40386eaeee1422ecb9961;
      expv[45] = 161'h074bc6b2b97aea03921f40386eaeee1422ecb9961;
      expv[46] = 161'h0a4e8bee974c7bf87c48f4b916dbaea29b63180e7;
      expv[47] = 161'h13439c27e581141515bed66c3f7d366a5fd81c425;
      expv[48] = 161'h13439c27e581141515bed66c3f7d366a5fd81c425;
      expv[49] = 161'h13ff8ea03d6aedc9099e82372049dbf0fe9d19700;
      expv[50] = 161'h04422987d0b47a893b1006fba255b5be70edcb4f6;
      expv[51] = 161'h0f35017d15263fb46b74b962a4c596bd99fbeec38;
      expv[52] = 161'h1ff20906eec9f061f2b477ddb55dad696b21ffb57;
      expv[53] = 161'h02ac970b8009db85f37a214c68bc54d2a482a5ed8;
      expv[54] = 161'h1e0674ba5bfed270f7f8e36df94a60290ad905b60;
      expv[55] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[56] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[57] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[58] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[59] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[60] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[61] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[62] = 161'h1a7efe3f53a06ccddd7c5b3bca68a0d18b29067c7;
      expv[63] = 161'h0cd7c2d6490d4a8de547f19bcc6cf13bf51a7ad61;
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
