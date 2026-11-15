// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096725 dut (
    .A(in_vec[98:67]),
    .B(in_vec[66:35]),
    .shift(in_vec[34:34]),
    .AluB_1(in_vec[33:33]),
    .ins(in_vec[32:1]),
    .syscall(in_vec[0:0]),
    .aluX(out_vec[63:32]),
    .aluY(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h4e2cdd5ecef017492f30b0249;
    stim[1] = 99'h0fe012eebf839afbc1a10b35e;
    stim[2] = 99'h0e6521edebbab576784959500;
    stim[3] = 99'h744c57bd8b3cfae24402d067d;
    stim[4] = 99'h7214093aa5224ba32638f8a22;
    stim[5] = 99'h01f00f7183575075a1e2ff36d;
    stim[6] = 99'h6095f4c486eb65b7491de7abd;
    stim[7] = 99'h0aa507c94a63828f15623711f;
    stim[8] = 99'h5a9fb3e0cdfbcfa030175425d;
    stim[9] = 99'h1f04b2892e34bad9155cdcb34;
    stim[10] = 99'h03aefa7f1f7c3e660edb12a91;
    stim[11] = 99'h6e8fea071f93c6299c6ddee19;
    stim[12] = 99'h37c2ff4fed93d323eb3ece5cc;
    stim[13] = 99'h3c29d178b3b5c88951c41d8bd;
    stim[14] = 99'h5945be15eddbbab984847e539;
    stim[15] = 99'h2738ded49b5a7b88213df0c46;
    stim[16] = 99'h402a7a5207b40f4da5d622d43;
    stim[17] = 99'h13fa143c1a8a4fa23e1cdcb74;
    stim[18] = 99'h768308520356aad4532aa024a;
    stim[19] = 99'h10a70a7ac768b2a911be7deb7;
    stim[20] = 99'h08cb1829efd8a2e237595c460;
    stim[21] = 99'h4672db8dc9f429c834425d6e5;
    stim[22] = 99'h1ef73e951f1e6118e69c1502a;
    stim[23] = 99'h683b983379bb5670d80446747;
    stim[24] = 99'h037330d7d1520a3355684d4b2;
    stim[25] = 99'h1168017fc2d5365d1e83402de;
    stim[26] = 99'h6c05731e7ea3e72992173a229;
    stim[27] = 99'h4bc08078bec953be1188d1c88;
    stim[28] = 99'h2357bdb2fc7f68810a6e47185;
    stim[29] = 99'h58c392fceaebf151055163591;
    stim[30] = 99'h3221f4392699ac1001d6887f2;
    stim[31] = 99'h590f374060a75e8c60cb3e167;
    stim[32] = 99'h2f48969f51d4286bade38a63f;
    stim[33] = 99'h061dbc60caa2d0d056c1e4413;
    stim[34] = 99'h755641e9b2959c1863da07929;
    stim[35] = 99'h75373ed4e476164eac22a1fe1;
    stim[36] = 99'h5dd5e86312c430cb3b04c6506;
    stim[37] = 99'h3d11057b85b6f92d7a9b0075b;
    stim[38] = 99'h5f5187d5740f7759aabf879d9;
    stim[39] = 99'h50258e988783cef2be0ab57f7;
    stim[40] = 99'h7f4bf7949146e98813979c8f6;
    stim[41] = 99'h7903d3db748130012ac1bdaaf;
    stim[42] = 99'h415a148d92bc467b7d4918e34;
    stim[43] = 99'h033ea2c4b571a1ddd131c01ad;
    stim[44] = 99'h28fa263b4b65dce9948bbe463;
    stim[45] = 99'h36407a747f1ec161380e7e0df;
    stim[46] = 99'h099b666671524f062dc9aa873;
    stim[47] = 99'h75bd5416e835d0f06036d5aab;
    stim[48] = 99'h4767f3b16cc0d94677e0b288a;
    stim[49] = 99'h6a36f9f9522735b93cb06ac78;
    stim[50] = 99'h0eefd40239370745c5d4ece7f;
    stim[51] = 99'h420499d98e4a9936290d8639f;
    stim[52] = 99'h53eada5083f4c43414e1a4505;
    stim[53] = 99'h31a76bb0bf9fea8c91480a514;
    stim[54] = 99'h65598423561c020ad3d53a04b;
    stim[55] = 99'h0107bcf9ca438a05efe1f9076;
    stim[56] = 99'h20b317b89179a2b4d8c93ac4d;
    stim[57] = 99'h6389f7a8e59c80ab03c2978ac;
    stim[58] = 99'h20a228eeaf6ce5a80e2fff55f;
    stim[59] = 99'h3103dcecccd497015e2a9822f;
    stim[60] = 99'h1b72f0e5649985d907c5c6a90;
    stim[61] = 99'h16142dff5dbb1b19c077a3cdf;
    stim[62] = 99'h080f4e4f235f422f3bfcfaf62;
    stim[63] = 99'h1d836af12f23a22cc7ee678e9;
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
      expv[0] = 64'h9c59babd0000000a;
      expv[1] = 64'h7f0735f77f0735f7;
      expv[2] = 64'hd7756aecc24aca80;
      expv[3] = 64'h1679f5c40000000a;
      expv[4] = 64'he428127531c7c511;
      expv[5] = 64'h03e01ee30000000a;
      expv[6] = 64'h0dd6cb6e0000000a;
      expv[7] = 64'h154a0f920000000a;
      expv[8] = 64'hb53f67c10000000a;
      expv[9] = 64'h3e0965125c6975b2;
      expv[10] = 64'h075df4fe0000000a;
      expv[11] = 64'hdd1fd40e0000000a;
      expv[12] = 64'hdb27a64759f672e6;
      expv[13] = 64'h676b91120000000a;
      expv[14] = 64'hb28b7c2b0000000a;
      expv[15] = 64'h4e71bda909ef8623;
      expv[16] = 64'h8054f4a40000000a;
      expv[17] = 64'h27f42878f0e6e5ba;
      expv[18] = 64'h06ad55a806ad55a8;
      expv[19] = 64'h214e14f50000000a;
      expv[20] = 64'h11963053bacae230;
      expv[21] = 64'h8ce5b71b0000000a;
      expv[22] = 64'h3e3cc23134e0a815;
      expv[23] = 64'hf376ace10000000a;
      expv[24] = 64'ha2a41466a2a41466;
      expv[25] = 64'h22d002ff85aa6cba;
      expv[26] = 64'hd80ae63c0000000a;
      expv[27] = 64'h978100f17d92a77c;
      expv[28] = 64'h46af7b650000000a;
      expv[29] = 64'hb18725f90000000a;
      expv[30] = 64'h6443e8724d335820;
      expv[31] = 64'hc14ebd180000000a;
      expv[32] = 64'h5e912d3e0000000a;
      expv[33] = 64'h9545a1a00000000a;
      expv[34] = 64'h652b38300000000a;
      expv[35] = 64'hea6e7da90000000a;
      expv[36] = 64'hbbabd0c6d8263283;
      expv[37] = 64'h0b6df25a0000000a;
      expv[38] = 64'hbea30faa0000000a;
      expv[39] = 64'ha04b1d310000000a;
      expv[40] = 64'hfe97ef29228dd310;
      expv[41] = 64'hf207a7b60000000a;
      expv[42] = 64'h25788cf6ea48c71a;
      expv[43] = 64'h6ae343bb0000000a;
      expv[44] = 64'h51f44c760000000a;
      expv[45] = 64'h6c80f4e80000000a;
      expv[46] = 64'h1336cccc0000000a;
      expv[47] = 64'hd06ba1e00000000a;
      expv[48] = 64'hd981b28cbf059445;
      expv[49] = 64'hd46df3f2e583563c;
      expv[50] = 64'h726e0e8b0000000a;
      expv[51] = 64'h840933b30000000a;
      expv[52] = 64'ha7d5b4a10000000a;
      expv[53] = 64'h634ed7617f3fd519;
      expv[54] = 64'hac3804150000000a;
      expv[55] = 64'h9487140b7f0fc83b;
      expv[56] = 64'h22f345690000000a;
      expv[57] = 64'hc713ef51cb390156;
      expv[58] = 64'h414451dd0000000a;
      expv[59] = 64'h99a92e020000000a;
      expv[60] = 64'h36e5e1cac9330bb2;
      expv[61] = 64'hbb7636330000000a;
      expv[62] = 64'h101e9c9edfe7d7b1;
      expv[63] = 64'h5e4744590000000a;
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
