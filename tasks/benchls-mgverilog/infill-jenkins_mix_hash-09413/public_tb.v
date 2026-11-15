// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 203;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09413 dut (
    .CLK(clk),
    .RST(in_vec[202:202]),
    .emit(in_vec[201:201]),
    .onloop(in_vec[200:200]),
    .wcount(in_vec[199:192]),
    .ia(in_vec[191:160]),
    .ib(in_vec[159:128]),
    .ic(in_vec[127:96]),
    .k0(in_vec[95:64]),
    .k1(in_vec[63:32]),
    .k2(in_vec[31:0]),
    .o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 203'h4b99818139c144ff2080e891506844d31d92a4af7bb957f406b;
    stim[1] = 203'h4aa9a6dd9bdfac5e54126862fd04bab469bac2a1d8fc1a8d914;
    stim[2] = 203'h23fa0dafb2806cd028afad5f1eaeaa71987e22ef7192c4ff0b3;
    stim[3] = 203'h327223a32af9283d88546f540327d86c2dd4a3ee75c42782f34;
    stim[4] = 203'h1cd59018da72a593c497531213ccfe35f3362d66fe4132bec98;
    stim[5] = 203'h172727c87e7509d9894cbaf94154aa4a83a3fdb889932f4ad77;
    stim[6] = 203'h39e0421a6fd5bea5492d8f0e2f63ab2a4951f774568a82f8051;
    stim[7] = 203'h1bca6884e701a62ec40b9f8dbb55c6b7422fb40e4ed22652ec6;
    stim[8] = 203'h0fc6a5fe075028f58907f51280a5cd932ebce10a18387ef61fc;
    stim[9] = 203'h14ac624dafc52509dc62c190d85ae894981927d5251ea398997;
    stim[10] = 203'h48a4ea6436358bf4213655d3f695fbc46e7f4c3193e920735fe;
    stim[11] = 203'h242e47ab24cee107e8fbf059c6468aac35d15a216cff396a2d8;
    stim[12] = 203'h2ddb89396b2a685714419d87d0a26918e7419ddd78397a0f9ce;
    stim[13] = 203'h323df106d12759f3e2f22b8259dd900a07aafde8339abfd5043;
    stim[14] = 203'h06da9ef84a051e10ba802efe1edd8f4c2508c25af591bfc5dca;
    stim[15] = 203'h2096b721ea49920f33a1c4d8de6317184e146a3a424d926b098;
    stim[16] = 203'h32f79129970df8d05921bad3de9b76c62c5cb53bf523adf678e;
    stim[17] = 203'h33c2469514dfd714b1a9bed990c5b078b7600c0411f91cd9a8c;
    stim[18] = 203'h33ff88b68ae627fadb8a475ea3c159b626ce9d6a8d3409ab685;
    stim[19] = 203'h3db1e92acb156bd1d1c83ccb63ec719c9c493eaeebb17f7dfc3;
    stim[20] = 203'h1ee71be282f39db084d93f63fbe2778c16c6e42611db101f026;
    stim[21] = 203'h14903997e4c0602338f0baec6141ed363ffe5aabdde90a47b36;
    stim[22] = 203'h3ccb733693d986322bcb9e97ee9fe083d70396f1df4b299264a;
    stim[23] = 203'h1e46d4e5369e4236da0e913660f1d7f3b39c1f078f27071f2d5;
    stim[24] = 203'h0ec2a54766491a86196753dead25c70497cdee9ed815c1dae8d;
    stim[25] = 203'h2b67f3923a6da7886e6d7f948d32e2d8c7a2eaf74f296dbba04;
    stim[26] = 203'h0834715a61c392843ac5ea12c735fe72b83f991bfbb90186c9d;
    stim[27] = 203'h3ee5ee21771f71ba4d48d4e6087788fc6fa8206dd5ba6f33ea0;
    stim[28] = 203'h148410e21710802b1bcf44cefe6bb3050358c2a6fc9dd389693;
    stim[29] = 203'h176c57a8f36176d3cc2fa6d8ee36aa2765905ab22f5ab2a0852;
    stim[30] = 203'h052d325b5c4757e1ee7799591e559acc6ef5344f80b6b1276f2;
    stim[31] = 203'h10ba2d82785cdfdd5286eb3c6352e0be26f2c25bc4739173e81;
    stim[32] = 203'h17fc799221ab5a9103e27196227d9e19e875d156d20be739896;
    stim[33] = 203'h1ab707faaa42ebcd8ecb528bdc76c42c8ec03cc170bf89ee2e1;
    stim[34] = 203'h2adc58b1ea5b5c9b6f26437709f7b61763efaa1cea13c352926;
    stim[35] = 203'h0f56ef0328dc5f0936d5e4c01dde884afd859b424f3b1d02a12;
    stim[36] = 203'h35adc9d92199ac5bab042db74725f227a2d310faad559b83bf4;
    stim[37] = 203'h1929312b25d14c89c58a8c54b9325ba3280e1f73f9dd56514d8;
    stim[38] = 203'h21e86640c25af617c83240f1dc3eb28249ec52c5229aab2bf82;
    stim[39] = 203'h0e094a35ff20df1accc45ae8e62e7fcccbbe7ccd94b9368474d;
    stim[40] = 203'h0a3ab03c0afd6d95c60426b149d49a01f83cd2c2f1808eef074;
    stim[41] = 203'h27c32dc61928241d94457cd53067c0ded4d9450361d5b5d728a;
    stim[42] = 203'h324108f6e717e5f2f78f95f1e082189ba466e7fcc80834aa3d4;
    stim[43] = 203'h1e63d8c7fecf48358588bf5ae73edb0a6350951b1e30ce45f0c;
    stim[44] = 203'h09310521807013830fd90dab5908349a0c5005b33a3e2d29d56;
    stim[45] = 203'h15ad02eb51e504383e8d91943af28d9ca1bcc91d224f8383703;
    stim[46] = 203'h3ad9f97e35e371e3d1adab11cacc33240201ceba4eadb0075db;
    stim[47] = 203'h09f8583dd18a4fdc32c4e4d147a4d89a644a08a563a332977f9;
    stim[48] = 203'h3d8011a4d04cec23d13b4a874f3a496f950a9e7b13d062d2328;
    stim[49] = 203'h1dff8fd386b9004cbff470a67a11753e1c325fd3b72ef9c14b3;
    stim[50] = 203'h0d1d15e6afcf38ca8e6cd23fe968512a12d3486a940d5283c33;
    stim[51] = 203'h31338388bf24a53e4f3021f2a8679ee70d406c5f61a7f342983;
    stim[52] = 203'h1a367407513b28f1101237ed703ed477d0a86423e4d931aa10f;
    stim[53] = 203'h230ead9453759d20262b551be7ae2f917fc25bc91615bbac8b4;
    stim[54] = 203'h378429df5db69af5e112810bd767aeb8e479cc6355b31e0fea9;
    stim[55] = 203'h0e3d2d6f518c5bd5017ae1c2f770c92cdea275524c1ff22cd90;
    stim[56] = 203'h148ec5b78555b412763bc482c8ce08e23d0627de4064d4cbc61;
    stim[57] = 203'h27f5eedc63657e68086133d9dc8119c53ef51a1853cd8a5113b;
    stim[58] = 203'h1262b431732b951f3a31244bfe7840acc3b49d31d78fc17bcdf;
    stim[59] = 203'h03414fd6514fc88ea95b854b03842fa83d6ee79aa847d6e026c;
    stim[60] = 203'h17a210fc6d222b9c9252ba4e192fb9d05f20cd4196d439c4afd;
    stim[61] = 203'h2be5dcb44c9aa1aed29a733d4265ca5edb944c85b96c43dd870;
    stim[62] = 203'h33bb64c84eda6776da5ba0c97bf6a169bd7e2ce87ede159e892;
    stim[63] = 203'h2744eeebdf7ec2cace91738df373d9abb77a704ff77119176b3;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hfad5f1ea;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'h00000000;
      expv[12] = 32'hbf059c64;
      expv[13] = 32'h19d87d0a;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'h1c4d8de6;
      expv[17] = 32'hf87d5647;
      expv[18] = 32'hf87d5647;
      expv[19] = 32'hf87d5647;
      expv[20] = 32'hf87d5647;
      expv[21] = 32'hf87d5647;
      expv[22] = 32'hf87d5647;
      expv[23] = 32'hf87d5647;
      expv[24] = 32'hf87d5647;
      expv[25] = 32'hf87d5647;
      expv[26] = 32'hd7f948d3;
      expv[27] = 32'hd7f948d3;
      expv[28] = 32'hf87d5647;
      expv[29] = 32'hf87d5647;
      expv[30] = 32'hf87d5647;
      expv[31] = 32'hf87d5647;
      expv[32] = 32'hf87d5647;
      expv[33] = 32'hf87d5647;
      expv[34] = 32'hf87d5647;
      expv[35] = 32'h6437709f;
      expv[36] = 32'h6437709f;
      expv[37] = 32'h17192403;
      expv[38] = 32'h17192403;
      expv[39] = 32'h240f1dc3;
      expv[40] = 32'h240f1dc3;
      expv[41] = 32'h240f1dc3;
      expv[42] = 32'h57cd5306;
      expv[43] = 32'h17192403;
      expv[44] = 32'h17192403;
      expv[45] = 32'h17192403;
      expv[46] = 32'h17192403;
      expv[47] = 32'h17192403;
      expv[48] = 32'h17192403;
      expv[49] = 32'h17192403;
      expv[50] = 32'h17192403;
      expv[51] = 32'h17192403;
      expv[52] = 32'h17192403;
      expv[53] = 32'h17192403;
      expv[54] = 32'hb551be7a;
      expv[55] = 32'h17192403;
      expv[56] = 32'h17192403;
      expv[57] = 32'h17192403;
      expv[58] = 32'h133d9dc8;
      expv[59] = 32'h133d9dc8;
      expv[60] = 32'h133d9dc8;
      expv[61] = 32'h133d9dc8;
      expv[62] = 32'ha733d426;
      expv[63] = 32'h17192403;
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
