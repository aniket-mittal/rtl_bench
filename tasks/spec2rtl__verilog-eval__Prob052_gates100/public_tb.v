// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'ha23b48fa1fca082fcbf6b8665;
    stim[1] = 100'h2b61b5fe013ebc69dcbf8d5f8;
    stim[2] = 100'hcec32734da38fff473b012aa0;
    stim[3] = 100'h06ae92e43039f55e031506d8d;
    stim[4] = 100'hf35d80f0c091d50c7970c98b5;
    stim[5] = 100'h6bf9a06df6c3d221c9f3a2214;
    stim[6] = 100'h2df9eaaee64f9276388e25a9c;
    stim[7] = 100'h43146bee049c78096a35eb568;
    stim[8] = 100'h25653dd7c403af83a9371e5e8;
    stim[9] = 100'h0957f301e1003eb5a5584da8f;
    stim[10] = 100'h483875d097954facf94c22c77;
    stim[11] = 100'hee79a094581d2542a857995e7;
    stim[12] = 100'h9becf870d0cc1f53cbf0ff812;
    stim[13] = 100'h1fc6f5d858bc7dd154d530cb1;
    stim[14] = 100'h62ff944455183fab3e63d4bcb;
    stim[15] = 100'h5e7d3e6cee5646a5d2c91fa0c;
    stim[16] = 100'h350f13505e3abe077b9d5b59a;
    stim[17] = 100'h59fa17e997a7978b22435ee4c;
    stim[18] = 100'h0192b694c96f79146659a30ae;
    stim[19] = 100'h12eeb5a457e6ecada185842c3;
    stim[20] = 100'h8d2d2a993a10747f317b47ba0;
    stim[21] = 100'hd6b49165a5ff38134a1309582;
    stim[22] = 100'ha0ba9b5af7b3f1134b29c3206;
    stim[23] = 100'h9feeeddbac212855e3419ae04;
    stim[24] = 100'h417715c92a2c28fcfc15809ce;
    stim[25] = 100'h5ba5af1601d4f7edafa865275;
    stim[26] = 100'he393b4d2b607de47cea3fdfad;
    stim[27] = 100'h8a10c4e20ba5e77d59372de29;
    stim[28] = 100'hfd8aeb555808cc0caf5df3fba;
    stim[29] = 100'hc01a4af44e223f701bfc0fe38;
    stim[30] = 100'h830cf73adec2d8d628d3b826d;
    stim[31] = 100'h97069de81e89be8a783291fbf;
    stim[32] = 100'hcf44d493480f16567d6927110;
    stim[33] = 100'h184da3d69f974829ca0d5b1d1;
    stim[34] = 100'h7ad349f39d3e85778c1e40ffa;
    stim[35] = 100'hc7826ee100a27e786080c9700;
    stim[36] = 100'hcfd5f4fc0b2278e21fbbb1983;
    stim[37] = 100'hbfc1a52b055245f69b0864c80;
    stim[38] = 100'h985692f752c22e0b9a0696774;
    stim[39] = 100'h3291240132aa7cfec04fcd635;
    stim[40] = 100'h8cce48d0ef44178ce49da89e0;
    stim[41] = 100'h2918cd309200816cf0df39c24;
    stim[42] = 100'h044739e9370f3a11ff5391e8f;
    stim[43] = 100'h8d32870c9441bf3c150d9264a;
    stim[44] = 100'h86bd4d0b10b43b6575df029ae;
    stim[45] = 100'hb37914f0494b7da46061a1f63;
    stim[46] = 100'h614fac742d9137bdf0a00174b;
    stim[47] = 100'h65c4f9f108fa45b9cec3158d6;
    stim[48] = 100'hab15930f4e0c3dcc6e56c12ba;
    stim[49] = 100'hc55200fa138a7f99b0b741883;
    stim[50] = 100'h40a29cc4cff9b59b4b2f48830;
    stim[51] = 100'h8f18ef6816528560246af4890;
    stim[52] = 100'hb193fb5a8baf2ba16cde42766;
    stim[53] = 100'h518554c473b2459cc5a363eea;
    stim[54] = 100'h3c7dac6351a99098449405515;
    stim[55] = 100'hc9d6c3d0647cfe148acb99b0c;
    stim[56] = 100'h29cb921f10456d08771a6c012;
    stim[57] = 100'h9db080b26354d46d45f681c61;
    stim[58] = 100'h1e91c555429b6e9869bfeb147;
    stim[59] = 100'h41f208b2d7235e0c6137dfb7e;
    stim[60] = 100'h59f36a9cd568c4009c567f78a;
    stim[61] = 100'hafd54e235901813ebe2e53d68;
    stim[62] = 100'ha084757ae22c5c3d6dc1d3dc0;
    stim[63] = 100'h4b05147d65ee2047037e43938;
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
      expv[0] = 3'h2;
      expv[1] = 3'h3;
      expv[2] = 3'h3;
      expv[3] = 3'h3;
      expv[4] = 3'h2;
      expv[5] = 3'h2;
      expv[6] = 3'h2;
      expv[7] = 3'h2;
      expv[8] = 3'h3;
      expv[9] = 3'h2;
      expv[10] = 3'h2;
      expv[11] = 3'h2;
      expv[12] = 3'h2;
      expv[13] = 3'h3;
      expv[14] = 3'h2;
      expv[15] = 3'h2;
      expv[16] = 3'h3;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h3;
      expv[20] = 3'h3;
      expv[21] = 3'h2;
      expv[22] = 3'h2;
      expv[23] = 3'h3;
      expv[24] = 3'h2;
      expv[25] = 3'h3;
      expv[26] = 3'h2;
      expv[27] = 3'h3;
      expv[28] = 3'h2;
      expv[29] = 3'h2;
      expv[30] = 3'h3;
      expv[31] = 3'h3;
      expv[32] = 3'h3;
      expv[33] = 3'h2;
      expv[34] = 3'h2;
      expv[35] = 3'h3;
      expv[36] = 3'h3;
      expv[37] = 3'h2;
      expv[38] = 3'h3;
      expv[39] = 3'h2;
      expv[40] = 3'h2;
      expv[41] = 3'h2;
      expv[42] = 3'h2;
      expv[43] = 3'h3;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h2;
      expv[47] = 3'h3;
      expv[48] = 3'h3;
      expv[49] = 3'h3;
      expv[50] = 3'h3;
      expv[51] = 3'h2;
      expv[52] = 3'h3;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h2;
      expv[56] = 3'h3;
      expv[57] = 3'h3;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h2;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h3;
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
