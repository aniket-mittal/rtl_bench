// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070579 dut (
    .clk(clk),
    .reset(in_vec[42:42]),
    .cke(in_vec[41:41]),
    .left(in_vec[40:40]),
    .rotation(in_vec[39:39]),
    .arithmetic(in_vec[38:38]),
    .shift_signed(in_vec[37:37]),
    .shift(in_vec[36:32]),
    .din(in_vec[31:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h59136a0b2d1;
    stim[1] = 43'h43f2555e9f6;
    stim[2] = 43'h0732beff2dd;
    stim[3] = 43'h0980f97636a;
    stim[4] = 43'h1ee33f3d9c3;
    stim[5] = 43'h0fa3c406894;
    stim[6] = 43'h2e91ccc088c;
    stim[7] = 43'h125a55ccbb7;
    stim[8] = 43'h289b0093650;
    stim[9] = 43'h064467eda31;
    stim[10] = 43'h2833ac82e3d;
    stim[11] = 43'h2c07b01e7ed;
    stim[12] = 43'h2dab98864b7;
    stim[13] = 43'h2bc0030d9ba;
    stim[14] = 43'h1c84b8b492f;
    stim[15] = 43'h3b790448de3;
    stim[16] = 43'h3e0194870a2;
    stim[17] = 43'h003496471af;
    stim[18] = 43'h34e6d352d5b;
    stim[19] = 43'h112d845b6d0;
    stim[20] = 43'h3b8d5b4057b;
    stim[21] = 43'h140bd45a22d;
    stim[22] = 43'h3cc02b5ef2f;
    stim[23] = 43'h257ff19161b;
    stim[24] = 43'h26ab2d5cc90;
    stim[25] = 43'h1e48cf8240e;
    stim[26] = 43'h148beb775d0;
    stim[27] = 43'h204ab6f50c4;
    stim[28] = 43'h2be50910870;
    stim[29] = 43'h6d7bfb921f9;
    stim[30] = 43'h0fcc3846248;
    stim[31] = 43'h323e22928e9;
    stim[32] = 43'h0dd64d4301d;
    stim[33] = 43'h3999279ed45;
    stim[34] = 43'h29b9c845e4e;
    stim[35] = 43'h0414fe3e11b;
    stim[36] = 43'h3cec76d7e83;
    stim[37] = 43'h1cc6d29557c;
    stim[38] = 43'h2537e2dfec8;
    stim[39] = 43'h1b5d5c8ef40;
    stim[40] = 43'h32296f757d6;
    stim[41] = 43'h25eefaa858c;
    stim[42] = 43'h3685f770c9e;
    stim[43] = 43'h0973ad67699;
    stim[44] = 43'h346089cd50e;
    stim[45] = 43'h10b55e7336f;
    stim[46] = 43'h0190b363334;
    stim[47] = 43'h0ea91103804;
    stim[48] = 43'h22fe623fce5;
    stim[49] = 43'h38a54005ff9;
    stim[50] = 43'h26e25e2e746;
    stim[51] = 43'h23759706e13;
    stim[52] = 43'h25011f86966;
    stim[53] = 43'h46a5161ac4c;
    stim[54] = 43'h157a2121358;
    stim[55] = 43'h10f1dc549a7;
    stim[56] = 43'h37f15ebbd89;
    stim[57] = 43'h020e9f169a9;
    stim[58] = 43'h0e252a5fdcd;
    stim[59] = 43'h293febdb06f;
    stim[60] = 43'h0f1feddd3d9;
    stim[61] = 43'h1ebeaf07090;
    stim[62] = 43'h0706921b758;
    stim[63] = 43'h0a837ba58de;
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
      expv[0] = 32'h65a26d41;
      expv[1] = 32'h4aabd3ec;
      expv[2] = 32'hfe5ba000;
      expv[3] = 32'h97636a0f;
      expv[4] = 32'hf670ccfc;
      expv[5] = 32'h50f101a2;
      expv[6] = 32'h460e6604;
      expv[7] = 32'hab9976e0;
      expv[8] = 32'h2858049b;
      expv[9] = 32'h0467eda3;
      expv[10] = 32'ha75905c7;
      expv[11] = 32'h7b01e7ed;
      expv[12] = 32'h62192dee;
      expv[13] = 32'ha0030d9b;
      expv[14] = 32'h8b492f4b;
      expv[15] = 32'h891bc720;
      expv[16] = 32'h194870a2;
      expv[17] = 32'h092c8e35;
      expv[18] = 32'h4b56c000;
      expv[19] = 32'hdb400000;
      expv[20] = 32'hb4057bd5;
      expv[21] = 32'hbd45a22d;
      expv[22] = 32'h5ef2f02b;
      expv[23] = 32'hfffffffe;
      expv[24] = 32'hffecb573;
      expv[25] = 32'hcf8240e8;
      expv[26] = 32'hb775d000;
      expv[27] = 32'h0ab6f50c;
      expv[28] = 32'h1424421c;
      expv[29] = 32'h7243f37f;
      expv[30] = 32'h8c384624;
      expv[31] = 32'h11494748;
      expv[32] = 32'h26a180eb;
      expv[33] = 32'h8b24f3da;
      expv[34] = 32'h908bc9d3;
      expv[35] = 32'h27f1f08d;
      expv[36] = 32'h5fa0f1db;
      expv[37] = 32'h9557c6d2;
      expv[38] = 32'h00000fc5;
      expv[39] = 32'h477a06ae;
      expv[40] = 32'h5bdd5f58;
      expv[41] = 32'hffffffff;
      expv[42] = 32'h770c9e00;
      expv[43] = 32'haced3275;
      expv[44] = 32'h27354380;
      expv[45] = 32'h399b7800;
      expv[46] = 32'h00000005;
      expv[47] = 32'h0124440e;
      expv[48] = 32'h0001cc47;
      expv[49] = 32'h017fe550;
      expv[50] = 32'h0000978b;
      expv[51] = 32'he0dc2600;
      expv[52] = 32'h000011f8;
      expv[53] = 32'h0014586b;
      expv[54] = 32'hac000000;
      expv[55] = 32'ha4d38000;
      expv[56] = 32'h0af5dec4;
      expv[57] = 32'he9f169a9;
      expv[58] = 32'h54a97f73;
      expv[59] = 32'hb60dffd7;
      expv[60] = 32'ha7b3fdbb;
      expv[61] = 32'h83848757;
      expv[62] = 32'hb7580000;
      expv[63] = 32'hde37ba58;
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
