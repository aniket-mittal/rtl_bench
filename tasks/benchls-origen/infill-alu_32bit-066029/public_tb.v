// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066029 dut (
    .ALU_OP(in_vec[66:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .F(out_vec[33:2]),
    .ZF(out_vec[1:1]),
    .OF(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h33daf867aabcc4c14;
    stim[1] = 67'h7d2005bf9e68ac289;
    stim[2] = 67'h0c00f2ad6ff322607;
    stim[3] = 67'h767d8d418fba7a677;
    stim[4] = 67'h23eb4b04dc4c33fa7;
    stim[5] = 67'h3dbbab473b43b5695;
    stim[6] = 67'h7efa2a15b0b6cf9ae;
    stim[7] = 67'h7c647dca95f182a0a;
    stim[8] = 67'h7831ca49b25d236f1;
    stim[9] = 67'h327a32711636ffdb7;
    stim[10] = 67'h6b34f04749a6dfcfb;
    stim[11] = 67'h0b1efb30033b5a5dc;
    stim[12] = 67'h158384b413cf97cb2;
    stim[13] = 67'h2543bc498a2638aa6;
    stim[14] = 67'h71e6fd99ad097ebac;
    stim[15] = 67'h7d3417026b4aed1c9;
    stim[16] = 67'h142a5f1289e78ce34;
    stim[17] = 67'h53c30ec5f7ddeed6b;
    stim[18] = 67'h46b4e313355993f1f;
    stim[19] = 67'h3e5ef0e53dc953d4a;
    stim[20] = 67'h30ee23cad8f1541a0;
    stim[21] = 67'h19ef6a626693ae72a;
    stim[22] = 67'h330012f8a8da01015;
    stim[23] = 67'h1cad7711758f3e8c4;
    stim[24] = 67'h020a563ae09a34cb7;
    stim[25] = 67'h23bafa48931bee12a;
    stim[26] = 67'h5080b9bc508b828b1;
    stim[27] = 67'h326104b6494484570;
    stim[28] = 67'h61a675be4dac25c32;
    stim[29] = 67'h28b2c4a5b55b286ae;
    stim[30] = 67'h346cfb0b2974636ce;
    stim[31] = 67'h7ebe54732a49406b0;
    stim[32] = 67'h363e0f0f89e37fc01;
    stim[33] = 67'h0ed64a470c5496587;
    stim[34] = 67'h494706ab3f79d17a7;
    stim[35] = 67'h7a5bf00dc2764404e;
    stim[36] = 67'h5024746197f79073a;
    stim[37] = 67'h4190745a9ca13a988;
    stim[38] = 67'h151fcf00472d00ba3;
    stim[39] = 67'h7c4d6030f6d5dd5fe;
    stim[40] = 67'h76e35da50bde80581;
    stim[41] = 67'h7147065b712ff746e;
    stim[42] = 67'h3457f336a5f6a627b;
    stim[43] = 67'h060b636a9601ebba8;
    stim[44] = 67'h7288bb24e9b4d91b5;
    stim[45] = 67'h59a9819eb19cabe3e;
    stim[46] = 67'h724fd015cbe1207bb;
    stim[47] = 67'h12a443b78d4794c4b;
    stim[48] = 67'h351f9c4c705d91a1a;
    stim[49] = 67'h67ea3d3c8983891a4;
    stim[50] = 67'h6690b64f0a93b843f;
    stim[51] = 67'h70b4705bebcf3f7f1;
    stim[52] = 67'h4f46d59d5c8a14dc9;
    stim[53] = 67'h6b3e4114eafd5e498;
    stim[54] = 67'h1fa12ce927d34d04d;
    stim[55] = 67'h3e74c1f3252a7decc;
    stim[56] = 67'h50d07a3cf239da195;
    stim[57] = 67'h47ce0590a4c7f6c3c;
    stim[58] = 67'h23f262def5eae8ef9;
    stim[59] = 67'h7d01967caaa794e95;
    stim[60] = 67'h3ab700f1b75391d1f;
    stim[61] = 67'h3575f5da6866eff93;
    stim[62] = 67'h5450e3efca246d6dc;
    stim[63] = 67'h221e5e857de9ba819;
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
      expv[0] = 34'h10040c604;
      expv[1] = 34'h002dfc800;
      expv[2] = 34'h300088818;
      expv[3] = 34'h030000000;
      expv[4] = 34'h3e9de3fa8;
      expv[5] = 34'h001102420;
      expv[6] = 34'h2a15b0000;
      expv[7] = 34'h07dca9000;
      expv[8] = 34'h124d80000;
      expv[9] = 34'h260400120;
      expv[10] = 34'h000000002;
      expv[11] = 34'h0c6968400;
      expv[12] = 34'h1f3e5ffcc;
      expv[13] = 34'h3d96138f8;
      expv[14] = 34'h3f6668000;
      expv[15] = 34'h20b813000;
      expv[16] = 34'h37bf7fcf0;
      expv[17] = 34'h2f947fbd0;
      expv[18] = 34'h3039dc149;
      expv[19] = 34'h008030290;
      expv[20] = 34'h1c0220948;
      expv[21] = 34'h3fffb9cb8;
      expv[22] = 34'h1097b0180;
      expv[23] = 34'h36bdfe75c;
      expv[24] = 34'h002850298;
      expv[25] = 34'h02845168c;
      expv[26] = 34'h3fd4dcc50;
      expv[27] = 34'h1269ec22c;
      expv[28] = 34'h000000002;
      expv[29] = 34'h37a7b33d4;
      expv[30] = 34'h0a0c12404;
      expv[31] = 34'h11cc80000;
      expv[32] = 34'h000200c18;
      expv[33] = 34'h315009000;
      expv[34] = 34'h230360968;
      expv[35] = 34'h300dc0000;
      expv[36] = 34'h20b38fb7c;
      expv[37] = 34'h38c6bbcc5;
      expv[38] = 34'h1cff3ee9c;
      expv[39] = 34'h300000000;
      expv[40] = 34'h371aed280;
      expv[41] = 34'h065b70000;
      expv[42] = 34'h282023210;
      expv[43] = 34'h18058caa0;
      expv[44] = 34'h127000000;
      expv[45] = 34'h203356eb4;
      expv[46] = 34'h380000000;
      expv[47] = 34'h3f9f5fdec;
      expv[48] = 34'h2a8188480;
      expv[49] = 34'h000000002;
      expv[50] = 34'h000000002;
      expv[51] = 34'h02df00000;
      expv[52] = 34'h2f43a9e78;
      expv[53] = 34'h000000002;
      expv[54] = 34'h3fcdb7b7c;
      expv[55] = 34'h020408004;
      expv[56] = 34'h3a5a808e8;
      expv[57] = 34'h3257f1519;
      expv[58] = 34'h186228c58;
      expv[59] = 34'h3e5000000;
      expv[60] = 34'h0021b8380;
      expv[61] = 34'h0a2000120;
      expv[62] = 34'h28b1da081;
      expv[63] = 34'h3fdf90138;
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
