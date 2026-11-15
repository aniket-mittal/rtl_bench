// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01222 dut (
    .cae_inst(in_vec[96:65]),
    .cae_data(in_vec[64:1]),
    .cae_inst_vld(in_vec[0:0]),
    .inst_val(out_vec[26:26]),
    .inst_caep(out_vec[25:21]),
    .inst_aeg_wr(out_vec[20:20]),
    .inst_aeg_rd(out_vec[19:19]),
    .inst_aeg_idx(out_vec[18:1]),
    .err_unimpl(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h1ae3d6724b720f0072cf73df6;
    stim[1] = 97'h10e3e781eb380f6319c24bbe9;
    stim[2] = 97'h1e88cd9a376b7b20ee8baea2e;
    stim[3] = 97'h0f95b06f5ad7c726476cecc62;
    stim[4] = 97'h101a8e6f87892929b844a5cb2;
    stim[5] = 97'h00235237b9c26c153817440b3;
    stim[6] = 97'h18c3a6b4029f94400fe6c0f15;
    stim[7] = 97'h0b78844f395c44e17c0a2b1f8;
    stim[8] = 97'h00f2455bb2a6e2b5bcf80f425;
    stim[9] = 97'h0b0e0453a087be6690284a12a;
    stim[10] = 97'h1b019647747023250122630ec;
    stim[11] = 97'h08de67b34aeaf24f26563c539;
    stim[12] = 97'h0f24a1754e0afa770d2977b9b;
    stim[13] = 97'h15589eb78d9e48ab872ed4981;
    stim[14] = 97'h19945794d5f9e7b9a94d980b6;
    stim[15] = 97'h1ec0735ec3bc23051e46e556e;
    stim[16] = 97'h1aa3f05034e24604eab5d5eb0;
    stim[17] = 97'h066b1c660f3b4810429c41475;
    stim[18] = 97'h14f365a41d4c4912d4e1660f0;
    stim[19] = 97'h18fc19d039b5874f0102db4b9;
    stim[20] = 97'h1c983f4ddae5ecb9e27170623;
    stim[21] = 97'h0feba4481aea64261c02aa31f;
    stim[22] = 97'h1c7fddcf00bc294b8854a1723;
    stim[23] = 97'h109b04af7b89c5720517ac736;
    stim[24] = 97'h168769898eb090462eec4089a;
    stim[25] = 97'h017476dcd7f6b34c10a676120;
    stim[26] = 97'h174c3a64d0428720a3b0a12f6;
    stim[27] = 97'h01c553f0ecda64a53834d042f;
    stim[28] = 97'h1100ab8f634eaa0086302eaa6;
    stim[29] = 97'h1e4820e5718e3f58d2f631159;
    stim[30] = 97'h1dbc2a473069272143a5f6a72;
    stim[31] = 97'h13a70e260c37e6cb8535c0d3a;
    stim[32] = 97'h0baafbdb36b85f3e1f059fbb6;
    stim[33] = 97'h17a46efaace33a21f8c960ed1;
    stim[34] = 97'h067f3b714d3d220bcb8f61444;
    stim[35] = 97'h1c1179058526d11fa22e7d383;
    stim[36] = 97'h11b13b5e9881be16686d94c54;
    stim[37] = 97'h116c829560e80c0405f60091d;
    stim[38] = 97'h0450323e2dccefd1d167c8061;
    stim[39] = 97'h00a69e903b40cebd0042befe1;
    stim[40] = 97'h042664c63b3511ce65844cab8;
    stim[41] = 97'h1c27d337fa015f9c26bb5b446;
    stim[42] = 97'h01e1ca875aa86e15ba69f2aec;
    stim[43] = 97'h0df1c7d8ef2613d91a7fdcdad;
    stim[44] = 97'h184b4a9f612f62c710aeef6cc;
    stim[45] = 97'h1a0ab086a997a687464f1023e;
    stim[46] = 97'h11070b6ad261331733a5f8603;
    stim[47] = 97'h03dcdcaecd7d3b0daacd1cda5;
    stim[48] = 97'h08d9fbfab688554a49eb67004;
    stim[49] = 97'h043f37226e47525972000cc00;
    stim[50] = 97'h0cca42986af6e54b5d8b8d79c;
    stim[51] = 97'h07a7a6d6235d5dd3911ba8136;
    stim[52] = 97'h11c2c0e1b094314a180feed5f;
    stim[53] = 97'h09510aaada10b844f5bb60bae;
    stim[54] = 97'h1e40b2fee9337d418642f5e79;
    stim[55] = 97'h0a0a37f89e2ed86f417138f1c;
    stim[56] = 97'h067d671016f80631d5727c751;
    stim[57] = 97'h00eda81525408cdeb3dfef54a;
    stim[58] = 97'h0a9c38cb2a76728d39cbc440f;
    stim[59] = 97'h1f734913acab3faba686294d8;
    stim[60] = 97'h0dc7d77b5e0a9e64634e7f856;
    stim[61] = 97'h176376884d1ab0b95b29a40dd;
    stim[62] = 97'h1ddca06e2d617bbdf45764e30;
    stim[63] = 97'h04994da06a95c2ca82916e73f;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000001;
      expv[2] = 27'h0000000;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0000001;
      expv[6] = 27'h0000001;
      expv[7] = 27'h0000000;
      expv[8] = 27'h0000001;
      expv[9] = 27'h0000000;
      expv[10] = 27'h0000000;
      expv[11] = 27'h0000001;
      expv[12] = 27'h0000001;
      expv[13] = 27'h0000001;
      expv[14] = 27'h0000000;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000001;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000001;
      expv[20] = 27'h0000001;
      expv[21] = 27'h0000001;
      expv[22] = 27'h0000001;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000000;
      expv[25] = 27'h0000000;
      expv[26] = 27'h0000000;
      expv[27] = 27'h0000001;
      expv[28] = 27'h0000000;
      expv[29] = 27'h0000001;
      expv[30] = 27'h0000000;
      expv[31] = 27'h0000000;
      expv[32] = 27'h0000000;
      expv[33] = 27'h0000001;
      expv[34] = 27'h0000000;
      expv[35] = 27'h0000001;
      expv[36] = 27'h0000000;
      expv[37] = 27'h0000001;
      expv[38] = 27'h0000001;
      expv[39] = 27'h0000001;
      expv[40] = 27'h0000000;
      expv[41] = 27'h0000000;
      expv[42] = 27'h0000000;
      expv[43] = 27'h0000001;
      expv[44] = 27'h0000000;
      expv[45] = 27'h0000000;
      expv[46] = 27'h0000001;
      expv[47] = 27'h7200000;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000001;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000001;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000001;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000001;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000001;
      expv[62] = 27'h0000000;
      expv[63] = 27'h0000001;
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
