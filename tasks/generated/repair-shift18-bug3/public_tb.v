// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h96551cfe55db8f861;
    stim[1] = 68'hdea033abbc9f1f72b;
    stim[2] = 68'hfc963eb8895490eff;
    stim[3] = 68'h566600519e63c0eb2;
    stim[4] = 68'hb1e3a4ac44dad89d8;
    stim[5] = 68'h64dfb4dd25512ef1b;
    stim[6] = 68'h32876649aab0c6484;
    stim[7] = 68'h5c21135993f467278;
    stim[8] = 68'h16c2bb387ef5c189f;
    stim[9] = 68'hc64534a9a3f515dc4;
    stim[10] = 68'h43c32ca1f69ee088b;
    stim[11] = 68'hc98de1c8afe3a68c3;
    stim[12] = 68'h96e3a2745eaca5816;
    stim[13] = 68'h9a6005430de1d5ac7;
    stim[14] = 68'hf63c64380d25db2aa;
    stim[15] = 68'hcdb91742f557bcefa;
    stim[16] = 68'h9237030d0eef0ec3d;
    stim[17] = 68'hb34667f721a8b9d99;
    stim[18] = 68'hf35a7a62163c79ced;
    stim[19] = 68'hfa22c2cdd0590e76c;
    stim[20] = 68'h20f2b0f18c58f80c8;
    stim[21] = 68'h19e4ddcbec4ac16df;
    stim[22] = 68'hd9ce85840ac5b5f08;
    stim[23] = 68'h6baf38d9541b31865;
    stim[24] = 68'h847d321b5909ce10f;
    stim[25] = 68'he3fd5947cd3e9f09b;
    stim[26] = 68'h64d22dc7065bda06b;
    stim[27] = 68'hd7d10b87a4967411a;
    stim[28] = 68'h721529bcfed647eab;
    stim[29] = 68'h00a9789f376c86ea3;
    stim[30] = 68'h5f019150a71c64f15;
    stim[31] = 68'h53dc5dc3eeb533282;
    stim[32] = 68'he9edf9a4b1362fbca;
    stim[33] = 68'hb5c68790f2249768b;
    stim[34] = 68'h6e73383eb0880089f;
    stim[35] = 68'h567e1963487d5541a;
    stim[36] = 68'h6c6b946f8193e4fcd;
    stim[37] = 68'h479baceb19e83257c;
    stim[38] = 68'hfe4bb5746f4c586e4;
    stim[39] = 68'h6577d5a8dc61119aa;
    stim[40] = 68'h92f35ddd6232a22aa;
    stim[41] = 68'hc7ec803a2339ff55f;
    stim[42] = 68'h3b3b5c5bb19618c49;
    stim[43] = 68'h4faf22a4d6acef407;
    stim[44] = 68'h6106f656407d1c6ab;
    stim[45] = 68'hd41f855a1f430ed96;
    stim[46] = 68'ha4b747e8c85553b2b;
    stim[47] = 68'h19cdfda9d115061aa;
    stim[48] = 68'h8934dbb41ff8b7c9b;
    stim[49] = 68'ha8a55be50a55937fa;
    stim[50] = 68'h8314fd4aa4827ed32;
    stim[51] = 68'ha75570212fb3f20d4;
    stim[52] = 68'hbe3bd5c253b7e0c1a;
    stim[53] = 68'h89dd78c40bc23c1ad;
    stim[54] = 68'h5d7c9937208e7f826;
    stim[55] = 68'hee12d90aa2495b38e;
    stim[56] = 68'he6289a79eb4d461e1;
    stim[57] = 68'h3f3d33840a816fbe8;
    stim[58] = 68'hbfa979a59847fcfa5;
    stim[59] = 68'h242e7239bce84dee4;
    stim[60] = 68'h6723f251d16632df6;
    stim[61] = 68'h4c0a037a0ff6829d9;
    stim[62] = 68'hfd300655771bc9f17;
    stim[63] = 68'hc4d0c1d64ec0d3c86;
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
      expv[1] = 64'h6551cfe55db8f861;
      expv[2] = 64'hea033abbc9f1f72b;
      expv[3] = 64'hc963eb8895490eff;
      expv[4] = 64'h63eb8895490eff00;
      expv[5] = 64'h1e3a4ac44dad89d8;
      expv[6] = 64'h0f1d256226d6c4ec;
      expv[7] = 64'h0f1d256226d6c4ec;
      expv[8] = 64'h1d256226d6c4ec00;
      expv[9] = 64'h1d256226d6c4ec00;
      expv[10] = 64'h64534a9a3f515dc4;
      expv[11] = 64'hc8a695347ea2bb88;
      expv[12] = 64'h98de1c8afe3a68c3;
      expv[13] = 64'h6e3a2745eaca5816;
      expv[14] = 64'ha6005430de1d5ac7;
      expv[15] = 64'h63c64380d25db2aa;
      expv[16] = 64'hdb91742f557bcefa;
      expv[17] = 64'h237030d0eef0ec3d;
      expv[18] = 64'h34667f721a8b9d99;
      expv[19] = 64'h35a7a62163c79ced;
      expv[20] = 64'ha22c2cdd0590e76c;
      expv[21] = 64'ha22c2cdd0590e76c;
      expv[22] = 64'ha22c2cdd0590e76c;
      expv[23] = 64'h9ce85840ac5b5f08;
      expv[24] = 64'hce742c20562daf84;
      expv[25] = 64'h47d321b5909ce10f;
      expv[26] = 64'h3fd5947cd3e9f09b;
      expv[27] = 64'h1feaca3e69f4f84d;
      expv[28] = 64'h7d10b87a4967411a;
      expv[29] = 64'h00fa2170f492ce82;
      expv[30] = 64'h00fa2170f492ce82;
      expv[31] = 64'hfa2170f492ce8200;
      expv[32] = 64'h2170f492ce820000;
      expv[33] = 64'h9edf9a4b1362fbca;
      expv[34] = 64'h5c68790f2249768b;
      expv[35] = 64'h2e343c879124bb45;
      expv[36] = 64'h343c879124bb4500;
      expv[37] = 64'h1a1e43c8925da280;
      expv[38] = 64'h343c879124bb4500;
      expv[39] = 64'he4bb5746f4c586e4;
      expv[40] = 64'hf25daba37a62c372;
      expv[41] = 64'h2f35ddd6232a22aa;
      expv[42] = 64'h7ec803a2339ff55f;
      expv[43] = 64'h7ec803a2339ff55f;
      expv[44] = 64'hfd900744673feabe;
      expv[45] = 64'hfec803a2339ff55f;
      expv[46] = 64'h41f855a1f430ed96;
      expv[47] = 64'h4b747e8c85553b2b;
      expv[48] = 64'h4b747e8c85553b2b;
      expv[49] = 64'h934dbb41ff8b7c9b;
      expv[50] = 64'h8a55be50a55937fa;
      expv[51] = 64'h314fd4aa4827ed32;
      expv[52] = 64'h75570212fb3f20d4;
      expv[53] = 64'he3bd5c253b7e0c1a;
      expv[54] = 64'h9dd78c40bc23c1ad;
      expv[55] = 64'hd78c40bc23c1ad00;
      expv[56] = 64'he12d90aa2495b38e;
      expv[57] = 64'h6289a79eb4d461e1;
      expv[58] = 64'h6289a79eb4d461e1;
      expv[59] = 64'hfa979a59847fcfa5;
      expv[60] = 64'hfa979a59847fcfa5;
      expv[61] = 64'hfd4bcd2cc23fe7d2;
      expv[62] = 64'hfa979a59847fcfa4;
      expv[63] = 64'hd300655771bc9f17;
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
