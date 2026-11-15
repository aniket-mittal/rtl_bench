// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_NVDLA_SDP_CORE_Y_cvt_core_chn_in_rsci_chn_in_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[67:67]),
    .chn_in_rsci_oswt(in_vec[66:66]),
    .chn_in_rsci_biwt(in_vec[65:65]),
    .chn_in_rsci_bdwt(in_vec[64:64]),
    .chn_in_rsci_d(in_vec[63:0]),
    .chn_in_rsci_bawt(out_vec[65:65]),
    .chn_in_rsci_wen_comp(out_vec[64:64]),
    .chn_in_rsci_d_mxwt(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h53b6c7cf92402657d;
    stim[1] = 68'h1b53065da0b9614fb;
    stim[2] = 68'hee0cd9c3fc9c414fa;
    stim[3] = 68'hb39862750e7bda6bc;
    stim[4] = 68'h8283f239254359e4f;
    stim[5] = 68'hdfcc5b9b1b94a65d7;
    stim[6] = 68'hc489bb7260a9ebc2e;
    stim[7] = 68'he8f16a4943d396863;
    stim[8] = 68'hc6094381c7c24017b;
    stim[9] = 68'hb62c001d4e840e306;
    stim[10] = 68'hc62c42ad7fca1df6b;
    stim[11] = 68'hc509c59de077ba546;
    stim[12] = 68'haf13cf6ada2ab0ce7;
    stim[13] = 68'hc1ac8cce127a5c158;
    stim[14] = 68'hf268aa8cb1cfb6148;
    stim[15] = 68'hf6ca94a6e68be03ca;
    stim[16] = 68'hacdc0f6434f869c07;
    stim[17] = 68'haf135270223e2f2da;
    stim[18] = 68'hf8eba015d6e79924e;
    stim[19] = 68'hc3c1677d788da5a9d;
    stim[20] = 68'hc3a05bc9327c63587;
    stim[21] = 68'h9fce4866ff37b0bb0;
    stim[22] = 68'he1011d6d089380433;
    stim[23] = 68'h9fb030201480594dc;
    stim[24] = 68'hbc1062c0eaeabe7d9;
    stim[25] = 68'h98508b730c7fa2f3d;
    stim[26] = 68'ha905ab7d6965ad85d;
    stim[27] = 68'hcbfa08d32a6348f03;
    stim[28] = 68'hbb7106e10efa7743d;
    stim[29] = 68'hdd94b88900356efcb;
    stim[30] = 68'he6d59949672bd8eb9;
    stim[31] = 68'hfb19da8b300d89592;
    stim[32] = 68'ha4ccac14f945f6168;
    stim[33] = 68'he793eb3cc23659f43;
    stim[34] = 68'h95b3a2e36c3254abf;
    stim[35] = 68'h8fe226b490a7b5192;
    stim[36] = 68'ha4b43db8060ec8b34;
    stim[37] = 68'hf7eed82d0581fc31e;
    stim[38] = 68'ha5e0be41e241acddf;
    stim[39] = 68'h8666dba0cd0111038;
    stim[40] = 68'hc7ecc92e89173c323;
    stim[41] = 68'hde7be3f37a6d93d99;
    stim[42] = 68'hf0efb25e52856da4c;
    stim[43] = 68'h9658eda34f6ffcce8;
    stim[44] = 68'hdd5cc211a7731fe5d;
    stim[45] = 68'hd854e7608e4de17c9;
    stim[46] = 68'h827534b201edc2f65;
    stim[47] = 68'hce9db4c98d974fffe;
    stim[48] = 68'h9f82e7a89733b79d6;
    stim[49] = 68'hce4d462c7bc00e047;
    stim[50] = 68'ha044f90abcd6fc827;
    stim[51] = 68'h8cf20d37b2e0af832;
    stim[52] = 68'ha5f7c287eae715533;
    stim[53] = 68'hc2bc267b37412de14;
    stim[54] = 68'hb456bd2cb062f1bce;
    stim[55] = 68'h9d1d5bff9baf78cd6;
    stim[56] = 68'hf9bad4a1d71ecca67;
    stim[57] = 68'hcf693f7417cf8e1ec;
    stim[58] = 68'hcb7b7c762b82515dd;
    stim[59] = 68'hcbf3510062831823a;
    stim[60] = 68'hf26c907781c0cdff9;
    stim[61] = 68'hccb1b4cde191bb16d;
    stim[62] = 68'hfddc7f7ee49c28676;
    stim[63] = 68'he4dc82c8e755118f0;
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
      expv[0] = 66'h03b6c7cf92402657d;
      expv[1] = 66'h1b53065da0b9614fb;
      expv[2] = 66'h3e0cd9c3fc9c414fa;
      expv[3] = 66'h3e0cd9c3fc9c414fa;
      expv[4] = 66'h1283f239254359e4f;
      expv[5] = 66'h0fcc5b9b1b94a65d7;
      expv[6] = 66'h0489bb7260a9ebc2e;
      expv[7] = 66'h38f16a4943d396863;
      expv[8] = 66'h38f16a4943d396863;
      expv[9] = 66'h38f16a4943d396863;
      expv[10] = 66'h062c42ad7fca1df6b;
      expv[11] = 66'h0509c59de077ba546;
      expv[12] = 66'h3f13cf6ada2ab0ce7;
      expv[13] = 66'h3f13cf6ada2ab0ce7;
      expv[14] = 66'h3f13cf6ada2ab0ce7;
      expv[15] = 66'h36ca94a6e68be03ca;
      expv[16] = 66'h3cdc0f6434f869c07;
      expv[17] = 66'h3cdc0f6434f869c07;
      expv[18] = 66'h3cdc0f6434f869c07;
      expv[19] = 66'h03c1677d788da5a9d;
      expv[20] = 66'h03a05bc9327c63587;
      expv[21] = 66'h1fce4866ff37b0bb0;
      expv[22] = 66'h31011d6d089380433;
      expv[23] = 66'h31011d6d089380433;
      expv[24] = 66'h3c1062c0eaeabe7d9;
      expv[25] = 66'h18508b730c7fa2f3d;
      expv[26] = 66'h3905ab7d6965ad85d;
      expv[27] = 66'h3905ab7d6965ad85d;
      expv[28] = 66'h3905ab7d6965ad85d;
      expv[29] = 66'h0d94b88900356efcb;
      expv[30] = 66'h36d59949672bd8eb9;
      expv[31] = 66'h36d59949672bd8eb9;
      expv[32] = 66'h34ccac14f945f6168;
      expv[33] = 66'h34ccac14f945f6168;
      expv[34] = 66'h34ccac14f945f6168;
      expv[35] = 66'h1fe226b490a7b5192;
      expv[36] = 66'h34b43db8060ec8b34;
      expv[37] = 66'h34b43db8060ec8b34;
      expv[38] = 66'h35e0be41e241acddf;
      expv[39] = 66'h35e0be41e241acddf;
      expv[40] = 66'h35e0be41e241acddf;
      expv[41] = 66'h35e0be41e241acddf;
      expv[42] = 66'h30efb25e52856da4c;
      expv[43] = 66'h1658eda34f6ffcce8;
      expv[44] = 66'h0d5cc211a7731fe5d;
      expv[45] = 66'h0854e7608e4de17c9;
      expv[46] = 66'h127534b201edc2f65;
      expv[47] = 66'h0e9db4c98d974fffe;
      expv[48] = 66'h1f82e7a89733b79d6;
      expv[49] = 66'h0e4d462c7bc00e047;
      expv[50] = 66'h3044f90abcd6fc827;
      expv[51] = 66'h3044f90abcd6fc827;
      expv[52] = 66'h3044f90abcd6fc827;
      expv[53] = 66'h3044f90abcd6fc827;
      expv[54] = 66'h3044f90abcd6fc827;
      expv[55] = 66'h1d1d5bff9baf78cd6;
      expv[56] = 66'h39bad4a1d71ecca67;
      expv[57] = 66'h0f693f7417cf8e1ec;
      expv[58] = 66'h0b7b7c762b82515dd;
      expv[59] = 66'h0bf3510062831823a;
      expv[60] = 66'h326c907781c0cdff9;
      expv[61] = 66'h0cb1b4cde191bb16d;
      expv[62] = 66'h3ddc7f7ee49c28676;
      expv[63] = 66'h34dc82c8e755118f0;
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
