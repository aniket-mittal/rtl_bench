// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00380 dut (
    .clk_i(clk),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .fracta_28_o(out_vec[63:36]),
    .fractb_28_o(out_vec[35:8]),
    .exp_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hff6b0fdd16e268a7;
    stim[1] = 64'h50f4a0fdb63f8df2;
    stim[2] = 64'he32684831e3baed0;
    stim[3] = 64'h6d54e5d4e9a2f672;
    stim[4] = 64'h88b9ab0971a61a7c;
    stim[5] = 64'he11089c74aebd043;
    stim[6] = 64'hf55b5d7c5596747a;
    stim[7] = 64'h433af4c7ab054d5d;
    stim[8] = 64'h0a25303defa3c4de;
    stim[9] = 64'h05ccb9ab428c69fd;
    stim[10] = 64'h3051f9d7784cf8af;
    stim[11] = 64'heb563e5cbc4a2681;
    stim[12] = 64'h2d1e82e03a324801;
    stim[13] = 64'hd116ed855d4c4898;
    stim[14] = 64'h4a5b45f1b04b798d;
    stim[15] = 64'h1062e59a00d769a1;
    stim[16] = 64'h2c63b9fdbcb4bc74;
    stim[17] = 64'h3f8cc70de29dd637;
    stim[18] = 64'h29164abed8448bec;
    stim[19] = 64'heb5d38be230a52cb;
    stim[20] = 64'h1ce6e4b1a1c41b16;
    stim[21] = 64'h0c68fcb45362de57;
    stim[22] = 64'h38ccc517b066c2fd;
    stim[23] = 64'h55604d2f93cb9b04;
    stim[24] = 64'he11c0de9f9bc665d;
    stim[25] = 64'hdb88126e128337ea;
    stim[26] = 64'h6e076fe3d9fca3c9;
    stim[27] = 64'h9a545ec4adbd8de6;
    stim[28] = 64'ha186e739dab7b85d;
    stim[29] = 64'h67cd8f881bea57ed;
    stim[30] = 64'h18766e1d10d50969;
    stim[31] = 64'h68fafad8ad7817b0;
    stim[32] = 64'h26a7d6f3ac04f8bc;
    stim[33] = 64'h6cdeeab2723907f1;
    stim[34] = 64'h1022ef265594e4f6;
    stim[35] = 64'h10f24dbd6f2330db;
    stim[36] = 64'hd51b9ba30cb5d38d;
    stim[37] = 64'h202db1e93aa3b49e;
    stim[38] = 64'hae7132eb1d2166e6;
    stim[39] = 64'hbefddc1d86ba5a44;
    stim[40] = 64'h2012b574e240c53b;
    stim[41] = 64'h64558314deca601f;
    stim[42] = 64'h0dc837cb8aa5a530;
    stim[43] = 64'h5beea266d50bcac4;
    stim[44] = 64'h0de6062154d46c48;
    stim[45] = 64'h1184f825f246efb3;
    stim[46] = 64'h0cc5f7652821978f;
    stim[47] = 64'h4066fcd2832f4529;
    stim[48] = 64'hbdc45793c87f981a;
    stim[49] = 64'hcccc41faddfbda1f;
    stim[50] = 64'h534c0f02975c5307;
    stim[51] = 64'hbaece6847f622fc8;
    stim[52] = 64'h294776e606df2835;
    stim[53] = 64'h11d412dca148ba06;
    stim[54] = 64'h2ce19afc4b012b5e;
    stim[55] = 64'hc2c53e6cdc35518f;
    stim[56] = 64'h0a4a84b870e7d33c;
    stim[57] = 64'hb55c7024fcbf8c56;
    stim[58] = 64'ha208ce4d02c7272c;
    stim[59] = 64'h099fa166c3f8964c;
    stim[60] = 64'hc4179f64a88258e2;
    stim[61] = 64'hdd1e7b8b7f10ad28;
    stim[62] = 64'h0e422a4e53993d78;
    stim[63] = 64'hdcf0a6442e43fe1e;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h7587ee8xxxxxxxxx;
      expv[2] = 64'h7a507e80000001fe;
      expv[3] = 64'h53424180000001a1;
      expv[4] = 64'h6a72ea00000001c6;
      expv[5] = 64'h00b9ab1530d3e0da;
      expv[6] = 64'h4844e380000001e3;
      expv[7] = 64'h6daebe00000001c2;
      expv[8] = 64'h5d7a6380000001ea;
      expv[9] = 64'h000000151e26f086;
      expv[10] = 64'h00000014634fe8df;
      expv[11] = 64'h0000001667c57885;
      expv[12] = 64'h6b1f2e00000001f0;
      expv[13] = 64'h00000015924008d6;
      expv[14] = 64'h000000166244c074;
      expv[15] = 64'h6da2f880000007ba;
      expv[16] = 64'h7172cd0000000194;
      expv[17] = 64'h00000015a5e3a020;
      expv[18] = 64'h00000014eeb1b879;
      expv[19] = 64'h00000016245f60c5;
      expv[20] = 64'h6e9c5f00000001b0;
      expv[21] = 64'h0000001620d8b0d6;
      expv[22] = 64'h001d1f9716f2b843;
      expv[23] = 64'h66628b80000001a6;
      expv[24] = 64'h7026978000032f71;
      expv[25] = 64'h00000015e332e8aa;
      expv[26] = 64'h44093700000001f3;
      expv[27] = 64'h43b7f180000001b7;
      expv[28] = 64'h00000015ec6f30dc;
      expv[29] = 64'h00000015bdc2e85b;
      expv[30] = 64'h66c7c400000001b5;
      expv[31] = 64'h7b370e80000001cf;
      expv[32] = 64'h7d7d6c00000f8130;
      expv[33] = 64'h0000001427c5e0d1;
      expv[34] = 64'h000deeb5c83f8858;
      expv[35] = 64'h000a2ef4a727b0e4;
      expv[36] = 64'h000000151986d8ab;
      expv[37] = 64'h4dcdd180000001de;
      expv[38] = 64'h000000151da4f0aa;
      expv[39] = 64'h7899758000000175;
      expv[40] = 64'h7eee0e800000015c;
      expv[41] = 64'h000000160629d87d;
      expv[42] = 64'h6ac18a00000001c4;
      expv[43] = 64'h641be58000a5a5c8;
      expv[44] = 64'h775133001179591b;
      expv[45] = 64'h00039816a36240b7;
      expv[46] = 64'h00000016377d98a9;
      expv[47] = 64'h000000150cbc78e4;
      expv[48] = 64'h737e690000000150;
      expv[49] = 64'h00000017fcc0d080;
      expv[50] = 64'h00000337ded0f890;
      expv[51] = 64'h66078100000001bb;
      expv[52] = 64'h00000017117e40a6;
      expv[53] = 64'h63bb7300000001fe;
      expv[54] = 64'h0000001645d03052;
      expv[55] = 64'h00000014095af042;
      expv[56] = 64'h00000015aa8c7896;
      expv[57] = 64'h000000173e99e0b8;
      expv[58] = 64'h00000015fc62b0e1;
      expv[59] = 64'h44672680000001f9;
      expv[60] = 64'h00000017c4b26044;
      expv[61] = 64'h4bcfb20000000187;
      expv[62] = 64'h0000001485694088;
      expv[63] = 64'h00000014c9ebc0fe;
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
