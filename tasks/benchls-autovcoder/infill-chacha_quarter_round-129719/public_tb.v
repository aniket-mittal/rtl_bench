// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_129719 dut (
    .clk(clk),
    .reset(in_vec[128:128]),
    .a(in_vec[127:96]),
    .b(in_vec[95:64]),
    .c(in_vec[63:32]),
    .d(in_vec[31:0]),
    .a_out(out_vec[127:96]),
    .b_out(out_vec[95:64]),
    .c_out(out_vec[63:32]),
    .d_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h121585c17d002e1f8ef1bd8a425c8cbd0;
    stim[1] = 129'h111d42d2db5437b11306487446c029001;
    stim[2] = 129'h0e13ec6757ec0a15e05708be8a6d64929;
    stim[3] = 129'h01fceef083d14c867123220e1ec2984d4;
    stim[4] = 129'h0ac6afc69af917747c0e43bbd56a03065;
    stim[5] = 129'h1ba0f2ab3fb61bf35104baaf3ddf8187d;
    stim[6] = 129'h02b11e1e277359c4697235c0f9547df31;
    stim[7] = 129'h07f4670f6b0730d8efb708711fb20ada9;
    stim[8] = 129'h0d5435c361a0497c68b15830a98b8d2c8;
    stim[9] = 129'h0c65adfd482e3a587c7d1b4e06a56bf98;
    stim[10] = 129'h0b0ec94afdb443fcf96bdd271c124dc5a;
    stim[11] = 129'h0f89105b3e6e67b538a8747c7c1d6ff7a;
    stim[12] = 129'h072592b765d84d760fcf713b8acfbea9d;
    stim[13] = 129'h04a0ef0e7aea4118e911c9738ff9b2829;
    stim[14] = 129'h03e396d0391c3dbf06da2fcaf36b6f44c;
    stim[15] = 129'h0671762bb6c6652f7f152c0a248e6a980;
    stim[16] = 129'h0886e2f68fe3b54f2c52a522fcacf7640;
    stim[17] = 129'h001ae528c78c24a590c5aeae2f0edd7f6;
    stim[18] = 129'h06594c48db2ffa78dcc13033ead6f8c66;
    stim[19] = 129'h0c8e9c171da7c32705cffe53806c995f3;
    stim[20] = 129'h0e9784fa6fa4db7d956ff11112fc0c767;
    stim[21] = 129'h0d3cc97a4f19695935254b2f22d8eaa7f;
    stim[22] = 129'h06869b1eb118ef56ca8242c87a7bfe433;
    stim[23] = 129'h0c751e7f35d7de2237150aaff283efb92;
    stim[24] = 129'h018312023dbaf6a77d43544cbdc085fdd;
    stim[25] = 129'h05b1c9067042cf5d3f436db02f8b5e0bc;
    stim[26] = 129'h0946a53811a91a5535e1748ee3e8ec540;
    stim[27] = 129'h07f0c546d3fd5dd467c3662ef2d29226a;
    stim[28] = 129'h056b5be9e29e6dc0b8b945ef9ea371d17;
    stim[29] = 129'h04e740a44c528ca8214b8f5ad616416f7;
    stim[30] = 129'h0a606655f18dddd2ee3e46747522c2983;
    stim[31] = 129'h05293bca2790004471e7c9399ac762f6e;
    stim[32] = 129'h1d6d1b89d6acb36f1344447354bc8dbb1;
    stim[33] = 129'h048e4b8246d3d38610d158687a7a51bab;
    stim[34] = 129'h079310980f95cb38ed283957739b2ecef;
    stim[35] = 129'h039499e27eda53c6d4467a98d718cd5a2;
    stim[36] = 129'h099e0fd5fb287c571f1225f734247fc74;
    stim[37] = 129'h0ce3edccd67112813c991a5b36a0b8f8a;
    stim[38] = 129'h0c4506d1fd9bff47e771ddc718902adc8;
    stim[39] = 129'h00d230b1aa0e600a31ce8f0eaedd78c58;
    stim[40] = 129'h0412afc0a834faebea41e582fbb1837e3;
    stim[41] = 129'h0d5216b662ebaf9ebd28ef3fef1baebed;
    stim[42] = 129'h0249160f88a6046d4eb2278667a5f6381;
    stim[43] = 129'h01c41ace90f2bf27c2dea9f4aa6c2faf0;
    stim[44] = 129'h0aa37487c300a9081a1b6f7c9793e2494;
    stim[45] = 129'h048699294ab001f1b133f6c4887aec859;
    stim[46] = 129'h0f57c351b1f9d55f8142bcf5aa152e68f;
    stim[47] = 129'h025e9055ba81eb8ba2a3728d97cd7ca01;
    stim[48] = 129'h0115a7d82d3a2e0e40a2c7b9349e112fd;
    stim[49] = 129'h067898499f004ce80755f43f6385f6862;
    stim[50] = 129'h01189a66cb9b214a2479b5be2aaa34d59;
    stim[51] = 129'h0e89152bbfdc1af28dabbd8080a0183cf;
    stim[52] = 129'h0d47b273c61f2032ed4ec4b3714a95b04;
    stim[53] = 129'h1a98d69b9ed243c15f04b9a62bb0c34c6;
    stim[54] = 129'h092dd78bb98ecc122016335471333b9ad;
    stim[55] = 129'h0c87010567587b2f592e24499e41182dd;
    stim[56] = 129'h02f16f8fcf0a3c05be3bcc721cd90b67f;
    stim[57] = 129'h0375202e4d3681542c44928bd43680297;
    stim[58] = 129'h0dda859e9dba249bef23c70744779da07;
    stim[59] = 129'h0ad4dedf5f22e473b6cac49c67e7f40ab;
    stim[60] = 129'h0fa71b2fed1766860683d37903b759bca;
    stim[61] = 129'h0452511fc99f00be6b8b32c804e14f769;
    stim[62] = 129'h06ab7df0a5d2c2e5e7f77737155691eb0;
    stim[63] = 129'h04a2794049db1b39381ac190f494a5ff4;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxx0xxxxxxxxxxxxxx00;
      expv[5] = 128'h00000000000000000000000000000000;
      expv[6] = 128'h00000000000000000000000000000000;
      expv[7] = 128'hxxxxxxxxxxx00000xxxxxxxxxx000000;
      expv[8] = 128'hxxxxxxxxx0000000xxxxxxxx00000000;
      expv[9] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[10] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[11] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[12] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[13] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[14] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[15] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[16] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[17] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[18] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[19] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[20] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[21] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[22] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[23] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[24] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[25] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[26] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[27] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[28] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[29] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[30] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[31] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[32] = 128'h00000000000000000000000000000000;
      expv[33] = 128'h00000000000000000000000000000000;
      expv[34] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[35] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[36] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[37] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[38] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[39] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[40] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[41] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[42] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[43] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[44] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[45] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[46] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[47] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[48] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[49] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[50] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[51] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[52] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[53] = 128'h00000000000000000000000000000000;
      expv[54] = 128'h00000000000000000000000000000000;
      expv[55] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[56] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[57] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[58] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[59] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[60] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[61] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[62] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
      expv[63] = 128'hxxxxxxxx00000000xxxxxxxx00000000;
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
