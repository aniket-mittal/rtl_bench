// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 257;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00088 dut (
    .clk(clk),
    .cam_enable(in_vec[256:256]),
    .cam_data_in(in_vec[255:0]),
    .cam_hit_out(out_vec[8:8]),
    .cam_addr_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 257'h1b8c02aa9095ffb78955c3b2e261c600f77a99c641c7645b6077355a94befdd18;
    stim[1] = 257'h00d18774d55235ec6e6e1def08a3c49a506638eb7d9aba994062617a41ed7c882;
    stim[2] = 257'h0c564bd100eb8c4a0ce0f90f51f88b8cba3d90b2cf5ab2d77904a12b1fa3e7e9b;
    stim[3] = 257'h0db1d4e2789576b13d1378d12f1284f7a48a0e21cb4336b28b98a3a4bc07acc69;
    stim[4] = 257'h1f442f3803123b90faeb28e259b1be3f7516d601e871ef28a7018e457f19fb184;
    stim[5] = 257'h0d9721ee1dc40d2077f9f35218e199943d63750993d878af298f7a528bfdc778d;
    stim[6] = 257'h032747d3e07b4b59944e604bc8cf473dce30c297e51d51a9bb0b81905f4f8bcdd;
    stim[7] = 257'h13cf952111a48d5f5a4f165e17477f3a002bf1e6a84b8c5e2541a0153d2519579;
    stim[8] = 257'h188d38cdd4d3f0358fec09a77f23c1a0b377ee0fbc75da9055dd2790059bc0e86;
    stim[9] = 257'h0cd8fb0369873e09f6d8eafc44720cdc40b4c2cddf155c1f89abffc75d5e3f846;
    stim[10] = 257'h1799d11a2964f5781500fc43bd587e486c822e48cca5b3bafbf95ed110ebbcf26;
    stim[11] = 257'h135117a267c8d2a1d00ef815a686ff8d36c9bb371de750f40413bd63ae47ecb1a;
    stim[12] = 257'h0284acddefcd1bac89b95f476d38dac168f622d08693fff5adb4dec0bcfeca30f;
    stim[13] = 257'h1b373546e4772b16d2a750864f6911ec21fddd48c6e09298abd8e30f267e9d280;
    stim[14] = 257'h0ddb0bcd1028a4df85787f0ec9ac2edd721ee20eaf43a1ff54242c55bdfdd8d94;
    stim[15] = 257'h14e90a0ccb94add0892ebffd4b6fc362281f639e7832bfbe94e313379d2f54837;
    stim[16] = 257'h1cf06b1c0631005421fbad329df5bac26b8e35b75aa3eba48a5d568a4e5393168;
    stim[17] = 257'h18c23281dd6fd4c7e48deee9c74e930d4d656905bf067c3cfafff061598292c79;
    stim[18] = 257'h0bacfc26fea0efeeaf2f943f110cf069afa108cf57870089fe08b2bf87129cb62;
    stim[19] = 257'h1b8585424ec79dbc5c0d4eec8426f651b0d8719bef126e0c148ca73aeeb24768f;
    stim[20] = 257'h044acbaee37b2eda0dd8f64f70b16ccebdbd11d969c07afd404ac6a8c675d4969;
    stim[21] = 257'h0ed7943cffc0b406fc728ff3d454f25381b9c5d4ac467dc732eaa04c4ea9f0f9e;
    stim[22] = 257'h0c8700231128c4090f972a9c041b05a997ab687970ecff6a2a913d78bf57c06b6;
    stim[23] = 257'h010063131ebfce107b5a7dbbf27cd5203b6e3cf8628f19ed0486635cd2df09d16;
    stim[24] = 257'h0decf6f551036bebe01db24d95d0a41963213f8c08cb8e38fda498e6e69668061;
    stim[25] = 257'h0a0f01fe83c0ba48229caf017a998e8d71dafcb56eac5668662a77ed70c6b0c38;
    stim[26] = 257'h029095cf92dd8a34e7a4e6072e2c7dffdd2c0b435dfd54e314e3531e25f6e1fd7;
    stim[27] = 257'h0e2ec913bde187b446907c3e75082eee76c39cc7184df37257fd2c33d1e317383;
    stim[28] = 257'h051023efbf4370d9aeab066470713a1dabdd2ee21e46b2f7737242bce9f6932da;
    stim[29] = 257'h0b9544a8681c8955691d0166fc4a69c01581faca8ef3b7c04d41a3be8f68b85c2;
    stim[30] = 257'h0f4211f78e292119718fa51765e8c061ae3cb729510a3bf2595cb69914a234679;
    stim[31] = 257'h1b9d68b2a0d5ae5c4444aca157f2641bb7b01365286b5f1e3a6ed38916f855bb5;
    stim[32] = 257'h0d533d008eecfdf5c55c22dad78c250aa905ebfd007111809f942340765bfa077;
    stim[33] = 257'h00f80e208d93326f951fee92e32f00fb3338600fbb6377d578e2b73ee7167bb26;
    stim[34] = 257'h09dd1ba0455ad21079f8bd840d74fc8a292fd62a3bee913a29379d7be72b02a3e;
    stim[35] = 257'h1a52c023d4a202ea01a536ca02c0afcee1e3ac7f4929a585cdeef44ecbe3f1981;
    stim[36] = 257'h0b3f3c21cae588e3fbf4db5bf11e3a102a4aa49b33777be5bd4cb834e85c177f8;
    stim[37] = 257'h018e30e569d265121df88b635ef7b86d4103796b7f7c61279c93971305fdea81b;
    stim[38] = 257'h1fc5f872cb153461dff6f6b0a59c0f7bca94fdddd302937119059ce666e5533ab;
    stim[39] = 257'h16d6e63210e04fafe94a6fc949a5a6cde52ee35442a4f9eb84f95ad1d847a629d;
    stim[40] = 257'h1fe7d2fd8e5bd8332a390e6414ff8003916fa6e261122c30e52dd0e8430a3b2d7;
    stim[41] = 257'h0222b71c1fc2bbbb12b84bf6608b367a6e01f0b370317992ada06c776ed9dc21a;
    stim[42] = 257'h1771ac29ded688f32e7bbce182480232e831739a53f94eab9d80f67c67e98793b;
    stim[43] = 257'h118bf66710d0b297175217bb57174ccdc88f5af44bdad87975acb0af98e598a13;
    stim[44] = 257'h04ba990c7c0bdee5e45bf1cdfeed3c7a95cee8009de36595affa9bd88e01e4ee1;
    stim[45] = 257'h163bb97cfdd493439407e78e2b5385e6164783541fc37fd219671a3edfd3db0a6;
    stim[46] = 257'h187630e14cc2d0afd3c91c9aa525fd2435c437968b6cb997c27d07337b6e5a049;
    stim[47] = 257'h1825efe7ab0ec81df939a6ee122e389d69dbb84f760ab9f741e838dccbbe61bc4;
    stim[48] = 257'h0c9663211bf2bd88ff4a24c2cec3652d855fdfd1be129db2afcdc1002408ed85d;
    stim[49] = 257'h10743521423da5f06ead1bbdd0b059beae527679c6a5e6de59bf7262f5d088a58;
    stim[50] = 257'h14ab473a90d7ffb1350f71af08d212d001c9473102c37e0e23ba4286f2ddb7f10;
    stim[51] = 257'h160061446d83ff054cf6ee7d583d59061ce099d8c0f684709709650ffcc59fab9;
    stim[52] = 257'h103b194ad41f6b180271c9ee7d5ff5d49ef7b93afa24057921c65fcb665fcf3bf;
    stim[53] = 257'h1579912d76db3305ba6290ff770b42c1d3151b81b03194b6482b8608a3a27dc8e;
    stim[54] = 257'h078a251999f7896ba6e80b093b7360e79219152b217749fd1c97d94a1cfe03f63;
    stim[55] = 257'h19e8a165193b0fa65f68c054588c90db00bad6a149235d6d92391891b1c2dcbdd;
    stim[56] = 257'h021d404689bca18e4ca26f7139e348bc937a36791181fb9556ca8afbe5ce55d5c;
    stim[57] = 257'h1b3f5fe829814c47b641ca2d76fcfe175f2c5f704e4b4d32c2b39a976722f91f5;
    stim[58] = 257'h1141c663b8913310b84e3d9409d693c3ffe70c522a4b2271a0d067c7bd89d9a6f;
    stim[59] = 257'h16850d5db16a6e7ca0502864b91a953edf963c67a3080e455c52a827fda060f04;
    stim[60] = 257'h1e4e7e6b6a4990338761135a98e04dfd1234811edcf5a92fc8982db6d24f7ff42;
    stim[61] = 257'h1a14d0560ebacc2483a7d43c927184f23844f8fab3ef286d3cfe170d432f6e87a;
    stim[62] = 257'h0043addf8ecacb07ee50acab70a4f4b1964c15d19ff38265e1fb9e7865dd262d8;
    stim[63] = 257'h07e2c416f6d8633548c8df65c4a459f0663d390f144944cee43c531ced8dd6d92;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h103;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h102;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h100;
      expv[9] = 9'h101;
      expv[10] = 9'h000;
      expv[11] = 9'h101;
      expv[12] = 9'h101;
      expv[13] = 9'h000;
      expv[14] = 9'h107;
      expv[15] = 9'h000;
      expv[16] = 9'h100;
      expv[17] = 9'h103;
      expv[18] = 9'h100;
      expv[19] = 9'h000;
      expv[20] = 9'h100;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h100;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h100;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h100;
      expv[40] = 9'h100;
      expv[41] = 9'h100;
      expv[42] = 9'h000;
      expv[43] = 9'h100;
      expv[44] = 9'h100;
      expv[45] = 9'h000;
      expv[46] = 9'h101;
      expv[47] = 9'h100;
      expv[48] = 9'h102;
      expv[49] = 9'h000;
      expv[50] = 9'h103;
      expv[51] = 9'h104;
      expv[52] = 9'h100;
      expv[53] = 9'h100;
      expv[54] = 9'h101;
      expv[55] = 9'h000;
      expv[56] = 9'h100;
      expv[57] = 9'h000;
      expv[58] = 9'h100;
      expv[59] = 9'h100;
      expv[60] = 9'h102;
      expv[61] = 9'h101;
      expv[62] = 9'h101;
      expv[63] = 9'h000;
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
