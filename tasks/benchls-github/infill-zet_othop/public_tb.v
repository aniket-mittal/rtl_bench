// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 84;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_othop dut (
    .x(in_vec[83:68]),
    .y(in_vec[67:52]),
    .seg(in_vec[51:36]),
    .off(in_vec[35:20]),
    .iflags(in_vec[19:4]),
    .func(in_vec[3:1]),
    .word_op(in_vec[0:0]),
    .out(out_vec[28:9]),
    .oflags(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 84'h237a3c5c537da9687a231;
    stim[1] = 84'haaf3078d5637ab5b88595;
    stim[2] = 84'h29c22afaadf8a78034ffe;
    stim[3] = 84'h909df9fd217218fa231b0;
    stim[4] = 84'hbefe0be594fac832a95a7;
    stim[5] = 84'h053c3b2eb0297854e8fdf;
    stim[6] = 84'h9cb8560ed25396fad34dc;
    stim[7] = 84'h00668bd4accbea7c10ba7;
    stim[8] = 84'hcea8a8e217f717719b94f;
    stim[9] = 84'h55a5c6ead31b73b3f3062;
    stim[10] = 84'h6e3b71e8e6aab1dbc4d88;
    stim[11] = 84'hd99c1a498d6af759b1719;
    stim[12] = 84'h0b31122db610c155201d8;
    stim[13] = 84'h4be32eff7e5e8bd6646d6;
    stim[14] = 84'h1cc6442fd0769ff00c3c5;
    stim[15] = 84'hb87e938a59daba5932bf9;
    stim[16] = 84'h25f3d3432bab47a43b5b0;
    stim[17] = 84'h5934e2c90bf50eb6d6dc3;
    stim[18] = 84'hd818e8c4aeee37ed3c2cb;
    stim[19] = 84'hdf7475562832e0a5782f2;
    stim[20] = 84'h7522b54f24ee11e739690;
    stim[21] = 84'hb9b216e68d2f2b2ecb864;
    stim[22] = 84'hfc01d8b76b526e8c29bbd;
    stim[23] = 84'hafb787e3772b78ecea8ce;
    stim[24] = 84'h4eebefc8bf895e60aab27;
    stim[25] = 84'h0cefc241bef48399c1e0b;
    stim[26] = 84'h0c7269e85d8690689f22d;
    stim[27] = 84'hf88ba052b6b92d26f4616;
    stim[28] = 84'h90aa990ddf0a5a5222bf3;
    stim[29] = 84'hed81571626c6100b71a81;
    stim[30] = 84'h4e881e86892603b75a5fa;
    stim[31] = 84'hb8ee4596693f988786425;
    stim[32] = 84'h9ea231e32c267d517fad5;
    stim[33] = 84'h4b0c961f10bfc8523177a;
    stim[34] = 84'h423acc8bace78c950a94f;
    stim[35] = 84'h99b078826896cd160471a;
    stim[36] = 84'hf01a21f66809e3b4b34f9;
    stim[37] = 84'h58f4c061093a6bc2d574a;
    stim[38] = 84'h0f1f2061ed9de2d54b855;
    stim[39] = 84'hfd03ddd88acdf9a8a92c0;
    stim[40] = 84'hd0003dd67490620dab37a;
    stim[41] = 84'h88b8003c0ba590ddc5e15;
    stim[42] = 84'h1545ed747e4e4f4e8ec4b;
    stim[43] = 84'hf4256c2438ee12968a006;
    stim[44] = 84'hca6b0b290f19ef17ada20;
    stim[45] = 84'h19721cab8724f488eafe1;
    stim[46] = 84'h9a012dd4d59c206b594f9;
    stim[47] = 84'h50233304ce98c73a8f507;
    stim[48] = 84'h810d8cd407addacf09e6e;
    stim[49] = 84'hf579d942beb7d10899e38;
    stim[50] = 84'h59d9fc5ea086defa8a6d0;
    stim[51] = 84'h441127ee891e2e3dd562e;
    stim[52] = 84'hf887c6a7aa6cc12167b54;
    stim[53] = 84'h9d799a7c3d92066a0a2a6;
    stim[54] = 84'h3abdd91cdaf60d4ae7889;
    stim[55] = 84'he7cc223792f2596a6bccd;
    stim[56] = 84'hfc913b0b603e7dd1246b5;
    stim[57] = 84'h4ba1bda53223e8c5368f9;
    stim[58] = 84'h9276de1ba985d6374b6f3;
    stim[59] = 84'hf0d56c558989716c7c7fd;
    stim[60] = 84'h564358086237a48e31075;
    stim[61] = 84'h9536b96cd86febbd6bfcf;
    stim[62] = 84'h0f9efdf0cd3ca686238ea;
    stim[63] = 84'h9df5483c4c9b54a93862b;
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
      expv[0] = 29'h0a821c22;
      expv[1] = 29'h0abbb7bd;
      expv[2] = 29'h17fd9098;
      expv[3] = 29'h05756876;
      expv[4] = 29'h1217cb7b;
      expv[5] = 29'h1680d408;
      expv[6] = 29'h1ba09a6b;
      expv[7] = 29'h1717a97e;
      expv[8] = 29'h04ef14f0;
      expv[9] = 29'h1b83e87e;
      expv[10] = 29'h1d89b29d;
      expv[11] = 29'h1362e02c;
      expv[12] = 29'h18403a07;
      expv[13] = 29'h0e5dfe9f;
      expv[14] = 29'h1a01ca1b;
      expv[15] = 29'h0a617e17;
      expv[16] = 29'h05f71570;
      expv[17] = 29'h02140b43;
      expv[18] = 29'h16785982;
      expv[19] = 29'h05712315;
      expv[20] = 29'h05167124;
      expv[21] = 29'h13f78d7a;
      expv[22] = 29'h0c517715;
      expv[23] = 29'h106f3554;
      expv[24] = 29'h19df91f8;
      expv[25] = 29'h1983c038;
      expv[26] = 29'h0b384580;
      expv[27] = 29'h1940a48c;
      expv[28] = 29'h1ce95691;
      expv[29] = 29'h05820420;
      expv[30] = 29'h12b4bf4f;
      expv[31] = 29'h0f2e16e1;
      expv[32] = 29'h069badbe;
      expv[33] = 29'h0262ee2f;
      expv[34] = 29'h161d8bdb;
      expv[35] = 29'h0e0ce28d;
      expv[36] = 29'h0f669c6a;
      expv[37] = 29'h03aae8ae;
      expv[38] = 29'h1c24aa4f;
      expv[39] = 29'h1302a72d;
      expv[40] = 29'h0f566f67;
      expv[41] = 29'h0033a33d;
      expv[42] = 29'h111d89da;
      expv[43] = 29'h08d84942;
      expv[44] = 29'h036c77a5;
      expv[45] = 29'h1139cb9b;
      expv[46] = 29'h1cb29f2b;
      expv[47] = 29'h1a660862;
      expv[48] = 29'h021bc339;
      expv[49] = 29'h1933c739;
      expv[50] = 29'h147b2355;
      expv[51] = 29'h123846a1;
      expv[52] = 29'h17009eeb;
      expv[53] = 29'h0934f94e;
      expv[54] = 29'h1bc71070;
      expv[55] = 29'h12d1991a;
      expv[56] = 29'h0d6adaab;
      expv[57] = 29'h08651e53;
      expv[58] = 29'h15be35e4;
      expv[59] = 29'h12f8ff8f;
      expv[60] = 29'h0ca5b25d;
      expv[61] = 29'h1a9d45d0;
      expv[62] = 29'h1a471c72;
      expv[63] = 29'h0a78c588;
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
