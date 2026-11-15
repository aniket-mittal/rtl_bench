// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 145;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02107 dut (
    .sctag_cpx_data_pa(in_vec[144:0]),
    .sctag_cpx_data_buf_pa(out_vec[144:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 145'h0a2532a09161f735fe4b2796fb456a07537bd;
    stim[1] = 145'h13d056a2a93f5df45dd6e4d648334ebf4f0b1;
    stim[2] = 145'h174e25b48b7ecb2323e4a2204086c7515be57;
    stim[3] = 145'h00c903e67190ba25d2a3093d4f19aa849a0d3;
    stim[4] = 145'h0f99d270b100d1fa8ecb1e8b5d78ec2b054bf;
    stim[5] = 145'h02dd2fced253f0724b9b056012d0a11fd7b81;
    stim[6] = 145'h1c3cf6080bf682a1cfebd8fb5e45acd4367ca;
    stim[7] = 145'h1665851348e3252e1e29c1ad711e85ba08400;
    stim[8] = 145'h1028ac5002caf00b380d3abf061eeecbf69c5;
    stim[9] = 145'h199709eca7db181afbd36c539261c6c26cbd4;
    stim[10] = 145'h02b28dc1f3de3faca10240ad6fdcd88f0433b;
    stim[11] = 145'h1ed31bda08d9f8dac43f9c1d88eed04b5280b;
    stim[12] = 145'h0925be0ac91b87672be27b8a9fa3f46d055d1;
    stim[13] = 145'h188904185699add069c279edda43b0dfc7638;
    stim[14] = 145'h0b97e335abed2ca79b71a1091303fbbfde4ad;
    stim[15] = 145'h0eead40f7898ba5a0b9d712aee41807cd1ad0;
    stim[16] = 145'h0a3b89aef7d1eb62f8a927bd187be4d3417ab;
    stim[17] = 145'h14f24d524d272736b9f33742d54299863ecbb;
    stim[18] = 145'h0dd4fc970ae772cb6465476bf927806c63a9c;
    stim[19] = 145'h0f8ef611578b1d8e41e4e7761e7bc121e085b;
    stim[20] = 145'h0d6c38dd2e613b2e3a042c994fb60f63a9e49;
    stim[21] = 145'h0f01bc5979188955b395eeb3048d3d173b296;
    stim[22] = 145'h103c13dc90e54158421d7d1154fd8bc6eeb81;
    stim[23] = 145'h04fdc0957d49b227e0ae866d41a546948ce76;
    stim[24] = 145'h057546ce6dee996451bc69fc4eadcb89af9b6;
    stim[25] = 145'h1129ed0037d7f103d0dae5117050dd9cd2b75;
    stim[26] = 145'h09fdaea65047fd251917fd8756f38b7b593d9;
    stim[27] = 145'h0e30756c26153cd7367cd17f687c15c054f09;
    stim[28] = 145'h049f964d3c84c6448b7dc144d3f1e43c24d9f;
    stim[29] = 145'h1f6c03fb03d3ab6b338b90217a6232aa838b1;
    stim[30] = 145'h03331c5b3f7c116bc3d3698eddda9a1ea0dbd;
    stim[31] = 145'h0d300e49eec1d16ef65d67db3dbbb07ccdfc6;
    stim[32] = 145'h14fedfcf38ad01b060059fefe65b322633bc8;
    stim[33] = 145'h0c11c8e708fdfbf585562329b9017f22b23bb;
    stim[34] = 145'h101b06a3405070313a2c7cd491a846e7ad4eb;
    stim[35] = 145'h01b3ba9af8beb313924f5372f8cafc8ccf8da;
    stim[36] = 145'h0a0d93494d57d3b7f1855ce5680d482c777b5;
    stim[37] = 145'h1416481c4c9288d163183824d72ca742b3166;
    stim[38] = 145'h030025aa649fd511207789c784afc52ef1846;
    stim[39] = 145'h1989c35ca793f8ccce6f2884132b4e04dfe08;
    stim[40] = 145'h07c117ed1b4a1f5bb92ceb34ab88a213e9519;
    stim[41] = 145'h03992cbf01c24c1a8e1e9b30579bbfb057138;
    stim[42] = 145'h09fafa8be3e0469ec5b9e27066f0c02206ba6;
    stim[43] = 145'h042cc44f1cfed7cbca2ccf72300d54af1a9c7;
    stim[44] = 145'h1cd95b490e113deab4b8c44e8314e60bfdec3;
    stim[45] = 145'h05f7e16e8ed7b52764c0df60f79ac26578963;
    stim[46] = 145'h035676bc87799f6c1c7362ae39fd6623a9b27;
    stim[47] = 145'h1fa69823b2f9cb351fe21a61f0431ecd080c3;
    stim[48] = 145'h1f41c0b2a1eebdb7da4f50450fd93c55a29e2;
    stim[49] = 145'h13545b224a0ddb644632dda499bfad35fc717;
    stim[50] = 145'h1b093f46bde5957f7f96c9c0e1ffc2d401ab7;
    stim[51] = 145'h07fc26b6862be3442851be69ad318b87f5736;
    stim[52] = 145'h093ccfdd1c2d363851dda95605b80c4ba5560;
    stim[53] = 145'h01213290a0753ddf88038279b3b6d2d2bd68b;
    stim[54] = 145'h13ad0b81a8bc05b7c86ece79d91c52fe9a078;
    stim[55] = 145'h1b1b75e8fa755a8dce853865d6f24ebe6d935;
    stim[56] = 145'h15f8b7fea3f5b8166f292300e8878ef20a410;
    stim[57] = 145'h18b73a6fdd97207dfd61de73998a1df10610c;
    stim[58] = 145'h104c7b7c37175657e0280e8fbc4ac52353370;
    stim[59] = 145'h01f298ae3883f2ddb2650a8c181530cc97764;
    stim[60] = 145'h0e6be867a2b2c0458f6a3c172f87cd8b9cce7;
    stim[61] = 145'h18b1169d7d7955ffa5a20136b9c1a38f7226a;
    stim[62] = 145'h1fabf4c04a288201fa71030f5bc3ebb574042;
    stim[63] = 145'h11efa320daf1d41938f38ab01b7bec6504b9c;
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
      expv[0] = 145'h0a2532a09161f735fe4b2796fb456a07537bd;
      expv[1] = 145'h13d056a2a93f5df45dd6e4d648334ebf4f0b1;
      expv[2] = 145'h174e25b48b7ecb2323e4a2204086c7515be57;
      expv[3] = 145'h00c903e67190ba25d2a3093d4f19aa849a0d3;
      expv[4] = 145'h0f99d270b100d1fa8ecb1e8b5d78ec2b054bf;
      expv[5] = 145'h02dd2fced253f0724b9b056012d0a11fd7b81;
      expv[6] = 145'h1c3cf6080bf682a1cfebd8fb5e45acd4367ca;
      expv[7] = 145'h1665851348e3252e1e29c1ad711e85ba08400;
      expv[8] = 145'h1028ac5002caf00b380d3abf061eeecbf69c5;
      expv[9] = 145'h199709eca7db181afbd36c539261c6c26cbd4;
      expv[10] = 145'h02b28dc1f3de3faca10240ad6fdcd88f0433b;
      expv[11] = 145'h1ed31bda08d9f8dac43f9c1d88eed04b5280b;
      expv[12] = 145'h0925be0ac91b87672be27b8a9fa3f46d055d1;
      expv[13] = 145'h188904185699add069c279edda43b0dfc7638;
      expv[14] = 145'h0b97e335abed2ca79b71a1091303fbbfde4ad;
      expv[15] = 145'h0eead40f7898ba5a0b9d712aee41807cd1ad0;
      expv[16] = 145'h0a3b89aef7d1eb62f8a927bd187be4d3417ab;
      expv[17] = 145'h14f24d524d272736b9f33742d54299863ecbb;
      expv[18] = 145'h0dd4fc970ae772cb6465476bf927806c63a9c;
      expv[19] = 145'h0f8ef611578b1d8e41e4e7761e7bc121e085b;
      expv[20] = 145'h0d6c38dd2e613b2e3a042c994fb60f63a9e49;
      expv[21] = 145'h0f01bc5979188955b395eeb3048d3d173b296;
      expv[22] = 145'h103c13dc90e54158421d7d1154fd8bc6eeb81;
      expv[23] = 145'h04fdc0957d49b227e0ae866d41a546948ce76;
      expv[24] = 145'h057546ce6dee996451bc69fc4eadcb89af9b6;
      expv[25] = 145'h1129ed0037d7f103d0dae5117050dd9cd2b75;
      expv[26] = 145'h09fdaea65047fd251917fd8756f38b7b593d9;
      expv[27] = 145'h0e30756c26153cd7367cd17f687c15c054f09;
      expv[28] = 145'h049f964d3c84c6448b7dc144d3f1e43c24d9f;
      expv[29] = 145'h1f6c03fb03d3ab6b338b90217a6232aa838b1;
      expv[30] = 145'h03331c5b3f7c116bc3d3698eddda9a1ea0dbd;
      expv[31] = 145'h0d300e49eec1d16ef65d67db3dbbb07ccdfc6;
      expv[32] = 145'h14fedfcf38ad01b060059fefe65b322633bc8;
      expv[33] = 145'h0c11c8e708fdfbf585562329b9017f22b23bb;
      expv[34] = 145'h101b06a3405070313a2c7cd491a846e7ad4eb;
      expv[35] = 145'h01b3ba9af8beb313924f5372f8cafc8ccf8da;
      expv[36] = 145'h0a0d93494d57d3b7f1855ce5680d482c777b5;
      expv[37] = 145'h1416481c4c9288d163183824d72ca742b3166;
      expv[38] = 145'h030025aa649fd511207789c784afc52ef1846;
      expv[39] = 145'h1989c35ca793f8ccce6f2884132b4e04dfe08;
      expv[40] = 145'h07c117ed1b4a1f5bb92ceb34ab88a213e9519;
      expv[41] = 145'h03992cbf01c24c1a8e1e9b30579bbfb057138;
      expv[42] = 145'h09fafa8be3e0469ec5b9e27066f0c02206ba6;
      expv[43] = 145'h042cc44f1cfed7cbca2ccf72300d54af1a9c7;
      expv[44] = 145'h1cd95b490e113deab4b8c44e8314e60bfdec3;
      expv[45] = 145'h05f7e16e8ed7b52764c0df60f79ac26578963;
      expv[46] = 145'h035676bc87799f6c1c7362ae39fd6623a9b27;
      expv[47] = 145'h1fa69823b2f9cb351fe21a61f0431ecd080c3;
      expv[48] = 145'h1f41c0b2a1eebdb7da4f50450fd93c55a29e2;
      expv[49] = 145'h13545b224a0ddb644632dda499bfad35fc717;
      expv[50] = 145'h1b093f46bde5957f7f96c9c0e1ffc2d401ab7;
      expv[51] = 145'h07fc26b6862be3442851be69ad318b87f5736;
      expv[52] = 145'h093ccfdd1c2d363851dda95605b80c4ba5560;
      expv[53] = 145'h01213290a0753ddf88038279b3b6d2d2bd68b;
      expv[54] = 145'h13ad0b81a8bc05b7c86ece79d91c52fe9a078;
      expv[55] = 145'h1b1b75e8fa755a8dce853865d6f24ebe6d935;
      expv[56] = 145'h15f8b7fea3f5b8166f292300e8878ef20a410;
      expv[57] = 145'h18b73a6fdd97207dfd61de73998a1df10610c;
      expv[58] = 145'h104c7b7c37175657e0280e8fbc4ac52353370;
      expv[59] = 145'h01f298ae3883f2ddb2650a8c181530cc97764;
      expv[60] = 145'h0e6be867a2b2c0458f6a3c172f87cd8b9cce7;
      expv[61] = 145'h18b1169d7d7955ffa5a20136b9c1a38f7226a;
      expv[62] = 145'h1fabf4c04a288201fa71030f5bc3ebb574042;
      expv[63] = 145'h11efa320daf1d41938f38ab01b7bec6504b9c;
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
