// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 119;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_512x54 dut (
    .CLK(clk),
    .A(in_vec[118:110]),
    .CEN(in_vec[109:109]),
    .D(in_vec[108:55]),
    .GWEN(in_vec[54:54]),
    .WEN(in_vec[53:0]),
    .Q(out_vec[53:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 119'h2d98619a4e2e2f26319a815c276836;
    stim[1] = 119'h306b9d36c74240e73828c7655332c2;
    stim[2] = 119'h2ca8efd3af0813358f80d68ea5c830;
    stim[3] = 119'h3e36332004c5cb46f4b5dbcd8bcc40;
    stim[4] = 119'h3e1848543787f046765aa6fc90a19a;
    stim[5] = 119'h4b743b4e086895bb8ceced1b0eacc4;
    stim[6] = 119'h76b31735b06e85a20d2197a38d3cf7;
    stim[7] = 119'h19eba8d247355f73327702cd6c6b78;
    stim[8] = 119'h5c87f3dfe845fc105acaa4c3786b1e;
    stim[9] = 119'h4541726d462a179d1074241229e5ee;
    stim[10] = 119'h77868d601aa9364792ecf5bbe4b806;
    stim[11] = 119'h5c061ebe29f8d64543e1b79415d716;
    stim[12] = 119'h4d69cc40ae0633d798b2dc149dc54d;
    stim[13] = 119'h2c5ce31a0e34dbb16464d64c1077f5;
    stim[14] = 119'h67335eebb5799f59ae7430735616a9;
    stim[15] = 119'h40a1c2b641750d40f9732c2cdec54c;
    stim[16] = 119'h58ee412ba03ef66494c8c9ecf6d64f;
    stim[17] = 119'h33db736c4fea31c44922f0712bee91;
    stim[18] = 119'h432e634f9ca606ec92166ca8656691;
    stim[19] = 119'h05a2c5297e1dd457ff423e2b3859e1;
    stim[20] = 119'h00464f5d24d6c56a1f1f32bfd69a64;
    stim[21] = 119'h5e3bdd852819300fa00454a0af225d;
    stim[22] = 119'h78195264aaa014bb4ee712f27e2b64;
    stim[23] = 119'h30d8bd9b7d5a4c4bb8d08b9a82b2eb;
    stim[24] = 119'h68c50406db13f083865657772e50ad;
    stim[25] = 119'h32af59743746f1d920a78dd1c13ad9;
    stim[26] = 119'h46304419aa27589adbb1a53e472231;
    stim[27] = 119'h2b3237e8ad518b5fc0c9e65dfcce19;
    stim[28] = 119'h685a61f331fa699b7eb420e8e60922;
    stim[29] = 119'h2069414ae4e44e5a55df1c9af2a20b;
    stim[30] = 119'h44283afb3bdf2252d27a2b3702dc7d;
    stim[31] = 119'h15d41137c1bac36340ce846fd807db;
    stim[32] = 119'h1c90d15d9e6834cef57633f581dd6d;
    stim[33] = 119'h4cea2079021b688c8c57af58566864;
    stim[34] = 119'h534e9ddfa1d3256f0eb5850080eccd;
    stim[35] = 119'h5b8fa59fb84ab50bf737156422cd0c;
    stim[36] = 119'h3ada5a5f5fdaee06274c10a61060f1;
    stim[37] = 119'h7394e4efdc9c33431b33815d495bdb;
    stim[38] = 119'h36d793fd5291e40fa6ee932543397a;
    stim[39] = 119'h6a9777e23e336f8f974b7d1935c96c;
    stim[40] = 119'h7089e778858d35b5825c62521dec6c;
    stim[41] = 119'h2871dad1c2169d7117017bfb90b374;
    stim[42] = 119'h5ed1cd4d12311613bb79f85f6150c4;
    stim[43] = 119'h0556df3733cc1e2a5eedea0103fe50;
    stim[44] = 119'h7cda918f1164b5e001c0ab17b677fc;
    stim[45] = 119'h6850949442239e135c05d412386d0d;
    stim[46] = 119'h6689b35521d05d206dabd41cc22145;
    stim[47] = 119'h4a6ec68e9b1fa4b95de9d2a9a1b73a;
    stim[48] = 119'h542c73e0178c5309435d9a3c84cae9;
    stim[49] = 119'h25602aa2dcb9b312d45205c0970dc9;
    stim[50] = 119'h2516c866e702ba02f6037646f3de3a;
    stim[51] = 119'h67866421894d5692e94c53759ed214;
    stim[52] = 119'h4f58b3f1906605030354eda7f87974;
    stim[53] = 119'h5084a17e9638c13f11b3a7d79658d1;
    stim[54] = 119'h116e4e99f663423b5d9805f312bcb8;
    stim[55] = 119'h0001989aa1c26ce29a458c1261a6f7;
    stim[56] = 119'h04a2ef9f4c1f3657e70db5f963a236;
    stim[57] = 119'h6a69fe7bfc6b13551194f7f27a37b9;
    stim[58] = 119'h755dc39a7de7fb0827d152fad4763f;
    stim[59] = 119'h6604918f87cb73b73bdfe1489c9306;
    stim[60] = 119'h28649cd6a638a5cb27e8abd30fa24f;
    stim[61] = 119'h43507f15e25b81c45ce5153449d767;
    stim[62] = 119'h6bc21879f2491444f833a39f66d793;
    stim[63] = 119'h771539ca954bf80f5aa8926d2e2f0b;
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
      expv[0] = 54'hxxxxxxxxxxxxxx;
      expv[1] = 54'hxxxxxxxxxxxxxx;
      expv[2] = 54'hxxxxxxxxxxxxxx;
      expv[3] = 54'hxxxxxxxxxxxxxx;
      expv[4] = 54'hxxxxxxxxxxxxxx;
      expv[5] = 54'hxxxxxxxxxxxxxx;
      expv[6] = 54'hxxxxxxxxxxxxxx;
      expv[7] = 54'hxxxxxxxxxxxxxx;
      expv[8] = 54'hxxxxxxxxxxxxxx;
      expv[9] = 54'hxxxxxxxxxxxxxx;
      expv[10] = 54'h02e4da8c542f3a;
      expv[11] = 54'h0d1ac035526c8f;
      expv[12] = 54'hxxxxxxxxxxxxxx;
      expv[13] = 54'hxxxxxxxxxxxxxx;
      expv[14] = 54'hxxxxxxxxxxxxxx;
      expv[15] = 54'hxxxxxxxxxxxxxx;
      expv[16] = 54'hxxxxxxxxxxxxxx;
      expv[17] = 54'hxxxxxxxxxxxxxx;
      expv[18] = 54'hxxxxxxxxxxxxxx;
      expv[19] = 54'hxxxxxxxxxxxxxx;
      expv[20] = 54'hxxxxxxxxxxxxxx;
      expv[21] = 54'h0c9eba4xxxxxxx;
      expv[22] = 54'h0c9eba4xxxxxxx;
      expv[23] = 54'hxxxxxxxxxxxxxx;
      expv[24] = 54'hxxxxxxxxb49897;
      expv[25] = 54'h0a080dbxxxxxxx;
      expv[26] = 54'h0a080dbxxxxxxx;
      expv[27] = 54'h0a080dbxxxxxxx;
      expv[28] = 54'h0a080dbxxxxxxx;
      expv[29] = 54'hxxxxxxxxxxxxxx;
      expv[30] = 54'hxxxxxxxxxxxxxx;
      expv[31] = 54'hxxxxxxxxxxxxxx;
      expv[32] = 54'hxxxxxxxxxxxxxx;
      expv[33] = 54'hxxxxxxxxxxxxxx;
      expv[34] = 54'hxxxxxxxxxxxxxx;
      expv[35] = 54'h1d3bbf43a64ade;
      expv[36] = 54'hxxxxxxxxxxxxxx;
      expv[37] = 54'hxxxxxxxxxxxxxx;
      expv[38] = 54'h29c9dfbxxxxxxx;
      expv[39] = 54'hxxxxxxxxxxxxxx;
      expv[40] = 54'h2eefc47c66df1f;
      expv[41] = 54'h13cef10b1a6b6b;
      expv[42] = 54'h13cef10b1a6b6b;
      expv[43] = 54'hxxxxxxxxxxxxxx;
      expv[44] = 54'hxxxxxxxxxxxxxx;
      expv[45] = 54'h35231e2xxxxxxx;
      expv[46] = 54'hxxxxxxxxxxxxxx;
      expv[47] = 54'hxxxxxxxxxxxxxx;
      expv[48] = 54'hxxxxxxxxxxxxxx;
      expv[49] = 54'hxxxxxxxxxxxxxx;
      expv[50] = 54'hxxxxxxxxxxxxxx;
      expv[51] = 54'hxxxxxxxxxxxxxx;
      expv[52] = 54'hxxxxxxxxxxxxxx;
      expv[53] = 54'h3167e32xxxxxxx;
      expv[54] = 54'h0942fd2xxxxxxx;
      expv[55] = 54'h0942fd2xxxxxxx;
      expv[56] = 54'h0331354384d9c5;
      expv[57] = 54'h0331354384d9c5;
      expv[58] = 54'h0331354384d9c5;
      expv[59] = 54'hxxxxxxxxcff610;
      expv[60] = 54'hxxxxxxxx96e76e;
      expv[61] = 54'hxxxxxxxx96e76e;
      expv[62] = 54'hxxxxxxxxxxxxxx;
      expv[63] = 54'hxxxxxxxxxxxxxx;
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
