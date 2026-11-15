// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 61;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00534 dut (
    .clk(clk),
    .rst(in_vec[81:81]),
    .flush_i(in_vec[80:80]),
    .adv_i(in_vec[79:79]),
    .start_i(in_vec[78:78]),
    .is_sub_i(in_vec[77:77]),
    .signa_i(in_vec[76:76]),
    .exp10a_i(in_vec[75:66]),
    .fract24a_i(in_vec[65:42]),
    .infa_i(in_vec[41:41]),
    .signb_i(in_vec[40:40]),
    .exp10b_i(in_vec[39:30]),
    .fract24b_i(in_vec[29:6]),
    .infb_i(in_vec[5:5]),
    .snan_i(in_vec[4:4]),
    .qnan_i(in_vec[3:3]),
    .anan_sign_i(in_vec[2:2]),
    .addsub_agtb_i(in_vec[1:1]),
    .addsub_aeqb_i(in_vec[0:0]),
    .add_rdy_o(out_vec[60:60]),
    .add_sign_o(out_vec[59:59]),
    .add_sub_0_o(out_vec[58:58]),
    .add_shl_o(out_vec[57:53]),
    .add_exp10shl_o(out_vec[52:43]),
    .add_exp10sh0_o(out_vec[42:33]),
    .add_fract28_o(out_vec[32:5]),
    .add_inv_o(out_vec[4:4]),
    .add_inf_o(out_vec[3:3]),
    .add_snan_o(out_vec[2:2]),
    .add_qnan_o(out_vec[1:1]),
    .add_anan_sign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h2205e8b937397111d2f24;
    stim[1] = 82'h2919a8c3a975d5953eefb;
    stim[2] = 82'h0a5237dd3eb6f262b6195;
    stim[3] = 82'h165232ac5c571d6cbca46;
    stim[4] = 82'h1f438a71131008a951f21;
    stim[5] = 82'h12712f69c63ebe97063eb;
    stim[6] = 82'h119f1bfc6b0f952ab968a;
    stim[7] = 82'h163607e86339d440f9247;
    stim[8] = 82'h096c7b9b2defbba4731c4;
    stim[9] = 82'h06dd894794edd0c8f23ce;
    stim[10] = 82'h1d089239b5e1ec96a6aaf;
    stim[11] = 82'h1ddf8a3bf1bacb91cd5a9;
    stim[12] = 82'h07bc8015d256587892325;
    stim[13] = 82'h0c6fa8432cbefa23eda1d;
    stim[14] = 82'h1ca0ba7fa1df71c60555a;
    stim[15] = 82'h13961c3e48eac01b0c381;
    stim[16] = 82'h1da5c5feb6b90cee6353e;
    stim[17] = 82'h129f94cda270355f81947;
    stim[18] = 82'h3aa1ee3e9c5a1543856fc;
    stim[19] = 82'h1354dc9297db7c664150b;
    stim[20] = 82'h11e74b86d76e57f18a047;
    stim[21] = 82'h04729729f1445f8d86580;
    stim[22] = 82'h0e396a69331537bad7758;
    stim[23] = 82'h0466e4dff8b85a57eae43;
    stim[24] = 82'h0ec0704846c11bb4227e6;
    stim[25] = 82'h106b19321936373c1f71a;
    stim[26] = 82'h098433b705ca9d6749100;
    stim[27] = 82'h1158e474336378934f5e3;
    stim[28] = 82'h0509f74c9dbf5b95f22e2;
    stim[29] = 82'h051216be20053115d9820;
    stim[30] = 82'h0286fea89141b4c0c1cdc;
    stim[31] = 82'h1f425c052805bc2512018;
    stim[32] = 82'h14b4b4eb68f5021791ac1;
    stim[33] = 82'h0ed3a787933b317946246;
    stim[34] = 82'h0c0c538d9e62025f048cb;
    stim[35] = 82'h1e3272f6371a0ecceaf63;
    stim[36] = 82'h0305ec6c0737db902b6f6;
    stim[37] = 82'h0df5963bec4460658e98e;
    stim[38] = 82'h1dac33af373e5503ff3fc;
    stim[39] = 82'h08a8ff42b2ee6b8e94c08;
    stim[40] = 82'h0580d42bb5e20e9e9d6d6;
    stim[41] = 82'h16d0b4f18db95f7061df1;
    stim[42] = 82'h1699f57974e41cdf58e0e;
    stim[43] = 82'h0c939560685cfabe574c1;
    stim[44] = 82'h1d5c36f886812754dc6b5;
    stim[45] = 82'h098c5a46e352335962ddb;
    stim[46] = 82'h069e7a250f78f4e0f8cd0;
    stim[47] = 82'h187ed810ab9d2e546ddd2;
    stim[48] = 82'h041244d174d00638eec2b;
    stim[49] = 82'h081af6e70ab00caa09da6;
    stim[50] = 82'h1e77117fce297951e4404;
    stim[51] = 82'h17d0e03214866683b0a16;
    stim[52] = 82'h0a702cabc96be7e724a8c;
    stim[53] = 82'h0451e0b8f15a74e955ad0;
    stim[54] = 82'h024d6e98d805cb031f5a7;
    stim[55] = 82'h167c4d443bb2d2029b361;
    stim[56] = 82'h16a0cc7be0c5ab6203beb;
    stim[57] = 82'h015b379ff7cc7baeec0f9;
    stim[58] = 82'h2447b6b6206f73fdfd625;
    stim[59] = 82'h15b1f29811509a2c9333c;
    stim[60] = 82'h24c36295e3feced9c6500;
    stim[61] = 82'h15051b1bacc9d65f5d8de;
    stim[62] = 82'h1c2a1fa3fef8bce126c02;
    stim[63] = 82'h0091260ef6389d52439fe;
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
      expv[0] = 61'h0xxxxxxxxxxxxxxx;
      expv[1] = 61'h0xxxxxxxxxxxxxxx;
      expv[2] = 61'h0xxxxxxxxxxxxxxx;
      expv[3] = 61'h0xxxxxxxxxxxxxxx;
      expv[4] = 61'h0xxxxxxxxxxxxxxx;
      expv[5] = 61'h080330cc0000000e;
      expv[6] = 61'h080330cc0000000e;
      expv[7] = 61'h080330cc0000000e;
      expv[8] = 61'h080330cc0000000e;
      expv[9] = 61'h000de3780000000d;
      expv[10] = 61'h000de3780000000d;
      expv[11] = 61'h0400100400000008;
      expv[12] = 61'h001f77dc00000009;
      expv[13] = 61'h001f77dc00000009;
      expv[14] = 61'h0c0110440000001b;
      expv[15] = 61'h081595640000000a;
      expv[16] = 61'h081595640000000a;
      expv[17] = 61'h0c1df77c0000000f;
      expv[18] = 61'h0c1df77c0000000f;
      expv[19] = 61'h00141504e9fe86e6;
      expv[20] = 61'h00141504e9fe86e6;
      expv[21] = 61'h00141504e9fe86e6;
      expv[22] = 61'h00141504e9fe86e6;
      expv[23] = 61'h0814bd2e0000000f;
      expv[24] = 61'h0814bd2e0000000f;
      expv[25] = 61'h00142d0a0000000f;
      expv[26] = 61'h00142d0a0000000f;
      expv[27] = 61'h000a6a9aeeb5dd26;
      expv[28] = 61'h000a6a9aeeb5dd26;
      expv[29] = 61'h000a6a9aeeb5dd26;
      expv[30] = 61'h000a6a9aeeb5dd26;
      expv[31] = 61'h000a6a9aeeb5dd26;
      expv[32] = 61'h00180e0200000009;
      expv[33] = 61'h00180e0200000009;
      expv[34] = 61'h0035354e59d243e0;
      expv[35] = 61'h088b5ade09448026;
      expv[36] = 61'h001a769c00000009;
      expv[37] = 61'h001a769c00000009;
      expv[38] = 61'h000188620000000a;
      expv[39] = 61'h0006499200000008;
      expv[40] = 61'h083eafac58efb0e3;
      expv[41] = 61'h083eafac58efb0e3;
      expv[42] = 61'h083eafac58efb0e3;
      expv[43] = 61'h083eafac58efb0e3;
      expv[44] = 61'h081caf2a0000000f;
      expv[45] = 61'h001cd7340000000a;
      expv[46] = 61'h0c19f67caf95d2e0;
      expv[47] = 61'h0c19f67caf95d2e0;
      expv[48] = 61'h040248920000000d;
      expv[49] = 61'h040248920000000d;
      expv[50] = 61'h08318462691b8d26;
      expv[51] = 61'h002fd3f66042ade4;
      expv[52] = 61'h002fd3f66042ade4;
      expv[53] = 61'h000358d600000019;
      expv[54] = 61'h000358d600000019;
      expv[55] = 61'h000358d600000019;
      expv[56] = 61'h000358d600000019;
      expv[57] = 61'h000358d600000019;
      expv[58] = 61'h000358d600000019;
      expv[59] = 61'h000358d600000019;
      expv[60] = 61'h000358d600000019;
      expv[61] = 61'h000358d600000019;
      expv[62] = 61'h000358d600000019;
      expv[63] = 61'h0812f4bc00000009;
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
