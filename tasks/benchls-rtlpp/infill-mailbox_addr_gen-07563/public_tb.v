// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07563 dut (
    .clk(clk),
    .x_avg(in_vec[98:67]),
    .x_enable(in_vec[66:66]),
    .y_avg(in_vec[65:34]),
    .y_enable(in_vec[33:33]),
    .reset(in_vec[32:32]),
    .frame_counter(in_vec[31:0]),
    .mb_addr(out_vec[65:34]),
    .mb_in(out_vec[33:2]),
    .mb_enable(out_vec[1:1]),
    .mb_reset(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h0bfb123785772342d94316973;
    stim[1] = 99'h01dbcab31fa1f2e798dfc0201;
    stim[2] = 99'h29853a932086611cc0ae4fb99;
    stim[3] = 99'h565d9c91001c5c4389a83ce90;
    stim[4] = 99'h49dd0804a4f840300bc5b9d44;
    stim[5] = 99'h33ddec015b7880ae208e78a25;
    stim[6] = 99'h0c53eecd9ed18b1ea62949a94;
    stim[7] = 99'h173ac4d6ec7bc5decc0b5e223;
    stim[8] = 99'h10f9efe1fb85f64629e0cfa61;
    stim[9] = 99'h56dd2fd3ea413a674ea77ac72;
    stim[10] = 99'h369bcaa77691758229eae8aba;
    stim[11] = 99'h324f4b81ac7736d78ed36a340;
    stim[12] = 99'h0e984292ea6c00458ff91d07d;
    stim[13] = 99'h49fea41f9756dc3182730ec16;
    stim[14] = 99'h03c67ded9c76c13d22bff4574;
    stim[15] = 99'h3098ae82bafe368c0c02ad7bf;
    stim[16] = 99'h007c6dbf8713d88a0308207cd;
    stim[17] = 99'h6dcd6d2ddd8a1848a3199a984;
    stim[18] = 99'h32385deb576488218505677be;
    stim[19] = 99'h7b7d4eff8681219c2b64af42d;
    stim[20] = 99'h2e8f24dfd23fa449846337bbb;
    stim[21] = 99'h47ec951af68d4cfc6c57080cc;
    stim[22] = 99'h24dfa8926daf6a8ae98b549c9;
    stim[23] = 99'h61c8bc771121cec0ee68eb976;
    stim[24] = 99'h77dd5cbcc3650b778b699f40a;
    stim[25] = 99'h65889523e645b13e8543ec8f8;
    stim[26] = 99'h40712574b8c6b00f2c2d48ad2;
    stim[27] = 99'h73a3d7a9a92c49ac0c0796327;
    stim[28] = 99'h48063c72063caa4c6dc9c8045;
    stim[29] = 99'h0e72319da06908df664304d40;
    stim[30] = 99'h1f5fb65981f67ea28dfdfab57;
    stim[31] = 99'h57e0780e8914b3e2cbbcb85f2;
    stim[32] = 99'h16efceca28ed88a78fcac2506;
    stim[33] = 99'h3a8579ddef40b4b5cd3dce26d;
    stim[34] = 99'h1bacaa29ab7f00a6a8d0df0d3;
    stim[35] = 99'h1a5df5bb25e439844c43c076d;
    stim[36] = 99'h659d595e51e3b3f0cb5109deb;
    stim[37] = 99'h0af7838d9a7df515778263892;
    stim[38] = 99'h330e77e8e182a5c44a863dc29;
    stim[39] = 99'h553c2c5d4615803f4b346229a;
    stim[40] = 99'h2b3f1ea9b0293ab5637071b77;
    stim[41] = 99'h77f55c4c00fbeae805929d45b;
    stim[42] = 99'h0ec841ade96443140aeb562cf;
    stim[43] = 99'h465828afa11ed8410ac77de60;
    stim[44] = 99'h401286ff57d3fe1ecb95fb2d1;
    stim[45] = 99'h6f5b4b822d79b1800453bcd78;
    stim[46] = 99'h078cee494eeaef6de61458efa;
    stim[47] = 99'h1d66a1ff614986aa2d729f247;
    stim[48] = 99'h701f8f45761615658f4e38cca;
    stim[49] = 99'h18f0b0fd57c63fab80559f925;
    stim[50] = 99'h1b49b40b2e442e37cd35c8893;
    stim[51] = 99'h6aae249f295c504a0551dfa01;
    stim[52] = 99'h63ada0abea3209c50feaab9b1;
    stim[53] = 99'h5b5061acd4226ba5a583a842b;
    stim[54] = 99'h0a3510f67c42416d4362e30b0;
    stim[55] = 99'h6216b82e4eef82f10e4998d8b;
    stim[56] = 99'h389176f9dce40692fcad68794;
    stim[57] = 99'h1b6b8ee235adeee3495d9c393;
    stim[58] = 99'h19d6541e7314abe30487e9432;
    stim[59] = 99'h2435c4270770c803ebddbf849;
    stim[60] = 99'h67fa18e46c22e7b82d6464d25;
    stim[61] = 99'h5a7450151f808fa06f461abfd;
    stim[62] = 99'h54936ad812f6c74d44e589e4c;
    stim[63] = 99'h513151de543c469c01cafda68;
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
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h00000000000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h00000000000000000;
      expv[4] = 66'h00000000000000000;
      expv[5] = 66'h00000000000000000;
      expv[6] = 66'h1c28d889d9eef600a;
      expv[7] = 66'h3776b1c39ed18b1ea;
      expv[8] = 66'h3bcadaf40b9d626b6;
      expv[9] = 66'h30003689087cf7f0e;
      expv[10] = 66'h260c83066b6e97e9e;
      expv[11] = 66'h02f988021b4de553a;
      expv[12] = 66'h02f988021b4de5538;
      expv[13] = 66'h07309568874c21496;
      expv[14] = 66'h07309568874c21494;
      expv[15] = 66'h2776929a1c76c13d2;
      expv[16] = 66'h2776929a1c76c13d0;
      expv[17] = 66'h2776929a1c76c13d0;
      expv[18] = 66'h034d20f7f6e6b696e;
      expv[19] = 66'h2d31cce5191c2ef5a;
      expv[20] = 66'h3413dea74681219c2;
      expv[21] = 66'h28d4715e9747926fe;
      expv[22] = 66'h15526ac063f64a8d6;
      expv[23] = 66'h389d26bb526fd4492;
      expv[24] = 66'h0ac57d1e5121cec0e;
      expv[25] = 66'h29952b60fbeeae5e6;
      expv[26] = 66'h07d3fccff2c44a91e;
      expv[27] = 66'h297bd2c3b8c6b00f2;
      expv[28] = 66'h297bd2c3b8c6b00f0;
      expv[29] = 66'h3d63ca5d863caa4c6;
      expv[30] = 66'h39751c2f606908df6;
      expv[31] = 66'h39751c2f606908df4;
      expv[32] = 66'h39751c2f606908df4;
      expv[33] = 66'h39751c2f606908df4;
      expv[34] = 66'h1239f58a1d42bceee;
      expv[35] = 66'h0ec27cdb6b7f00a6a;
      expv[36] = 66'h0ec27cdb6b7f00a68;
      expv[37] = 66'h00000000000000000;
      expv[38] = 66'h00000000000000000;
      expv[39] = 66'h03a032fe99873bf46;
      expv[40] = 66'h176f9ed52a9e162ea;
      expv[41] = 66'h3deb019330293ab56;
      expv[42] = 66'h3deb019330293ab54;
      expv[43] = 66'h3311798a876420d6e;
      expv[44] = 66'h3311798a876420d6c;
      expv[45] = 66'h0e613033e009437fa;
      expv[46] = 66'h0e613033e009437f8;
      expv[47] = 66'h1c17dae303c67724a;
      expv[48] = 66'h047dcd914eb350ffa;
      expv[49] = 66'h3548aad5380fc7a2a;
      expv[50] = 66'h0dced6c7cc78587ea;
      expv[51] = 66'h0dced6c7cc78587e8;
      expv[52] = 66'h0dced6c7cc78587e8;
      expv[53] = 66'h31817ec231d6d055e;
      expv[54] = 66'h03b6d1e12da830d66;
      expv[55] = 66'h12a614a7051a887b2;
      expv[56] = 66'h00000000000000000;
      expv[57] = 66'h00000000000000000;
      expv[58] = 66'h00000000000000000;
      expv[59] = 66'h1f0acf1b8ceb2a0f2;
      expv[60] = 66'h36e7c6160770c803e;
      expv[61] = 66'h298e9fbb73fd0c722;
      expv[62] = 66'h1c98fa9f9f808fa06;
      expv[63] = 66'h1c98fa9f9f808fa04;
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
