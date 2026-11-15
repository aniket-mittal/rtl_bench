// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  cordic_demod dut (
    .clk(clk),
    .resetn(in_vec[66:66]),
    .s_axis_valid(in_vec[65:65]),
    .s_axis_data(in_vec[64:1]),
    .m_axis_ready(in_vec[0:0]),
    .s_axis_ready(out_vec[65:65]),
    .m_axis_valid(out_vec[64:64]),
    .m_axis_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h0a83c20d15181de72;
    stim[1] = 67'h35340c7f7006763f3;
    stim[2] = 67'h5ba971b40dbc4db8c;
    stim[3] = 67'h4949401dfdb9b79cd;
    stim[4] = 67'h6935b523ace04533f;
    stim[5] = 67'h58f51d9f14e747d42;
    stim[6] = 67'h7d7ae01b6a987b5b8;
    stim[7] = 67'h51b92d19f708ce06e;
    stim[8] = 67'h78b26e75d65466614;
    stim[9] = 67'h7b2a2ca4acdcee4ae;
    stim[10] = 67'h5e353dfaff009ea00;
    stim[11] = 67'h76f42982691ac1aed;
    stim[12] = 67'h552ee87ae6c60a075;
    stim[13] = 67'h46bab1319a790ef9b;
    stim[14] = 67'h422d99f5830035530;
    stim[15] = 67'h75c78894d7fa65493;
    stim[16] = 67'h60f55e86bf64ade32;
    stim[17] = 67'h7e24fb110417a474a;
    stim[18] = 67'h53ddb5514d9b2b867;
    stim[19] = 67'h4e0c43bef2cd3e471;
    stim[20] = 67'h528c451afffa99f42;
    stim[21] = 67'h104c686cadbb8e116;
    stim[22] = 67'h29ab2281224b73966;
    stim[23] = 67'h5ab2f57dfebf0d4b8;
    stim[24] = 67'h47e1f862bb1fdc63a;
    stim[25] = 67'h7b40425653a6d5c8c;
    stim[26] = 67'h726937f49939656bb;
    stim[27] = 67'h58df8439b3e61f2b9;
    stim[28] = 67'h6936aaf13dd1cccc7;
    stim[29] = 67'h702e290d4e074c7f3;
    stim[30] = 67'h6112a566c42a5af39;
    stim[31] = 67'h4a0c1e396f2d75852;
    stim[32] = 67'h4afce996704ccfff4;
    stim[33] = 67'h0aa6b6d2271a859f1;
    stim[34] = 67'h6d808e2c75f58abbe;
    stim[35] = 67'h5d23bad4d0a184c4f;
    stim[36] = 67'h4ba69669b83e414fc;
    stim[37] = 67'h769e4c9f26010597d;
    stim[38] = 67'h65d5cbc73761f9d1c;
    stim[39] = 67'h5c42ac26090de67d0;
    stim[40] = 67'h4a5ba4c70bdbbb757;
    stim[41] = 67'h5318b78b7f0a88ffe;
    stim[42] = 67'h4941ff16318375e50;
    stim[43] = 67'h5d0ce97e2134d8548;
    stim[44] = 67'h78c0376668171bc2a;
    stim[45] = 67'h6c1c20605015d5832;
    stim[46] = 67'h74a20ecd7380411b9;
    stim[47] = 67'h710f0d9deb7af4374;
    stim[48] = 67'h4a240622eb8d807bc;
    stim[49] = 67'h5b297b2a0c5f6dc0e;
    stim[50] = 67'h5aab7a1d986109ef5;
    stim[51] = 67'h6fe9773f37ee5f1d3;
    stim[52] = 67'h594b6447af0eef3e4;
    stim[53] = 67'h4b91d7d4756da3a73;
    stim[54] = 67'h4b593e56004a28bfe;
    stim[55] = 67'h516d2a04c84fe4710;
    stim[56] = 67'h462ef6ab5b09a2df2;
    stim[57] = 67'h43731798e028d185a;
    stim[58] = 67'h5ee75218dab80fef1;
    stim[59] = 67'h5fa092f4e5db3f7b5;
    stim[60] = 67'h67b167bf3ad5e369b;
    stim[61] = 67'h71bf9cdec687998c5;
    stim[62] = 67'h42dfe080600657196;
    stim[63] = 67'h67304c2ed4e2dc12a;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'h2xxxxxxxxxxxxxxxx;
      expv[2] = 66'h2000000003fe62703;
      expv[3] = 66'h2000000003fe62703;
      expv[4] = 66'h2000000003fe62703;
      expv[5] = 66'h0cc7eeb3000000000;
      expv[6] = 66'h0cc7eeb3000000000;
      expv[7] = 66'h0cc7eeb30cc7eeb30;
      expv[8] = 66'h0cc7eeb30cc7eeb30;
      expv[9] = 66'h0cc7eeb30cc7eeb30;
      expv[10] = 66'h0b2be60c8e63f7598;
      expv[11] = 66'h0b2be60c8e63f7598;
      expv[12] = 66'h0b2be60c8e63f7598;
      expv[13] = 66'h0b2be60c8e63f7598;
      expv[14] = 66'h0ac4e3e2ef98fdd66;
      expv[15] = 66'h0ac4e3e2ef98fdd66;
      expv[16] = 66'h0ac4e3e2ef98fdd66;
      expv[17] = 66'h0ac4e3e2ef98fdd66;
      expv[18] = 66'h0ac4e3e2ef98fdd66;
      expv[19] = 66'h0ad1c4281ef19a52b;
      expv[20] = 66'h0ad1c4281ef19a52b;
      expv[21] = 66'h0ad1c4281ef19a52b;
      expv[22] = 66'h2ad1c4281ef19a52b;
      expv[23] = 66'h2f6d231a600000000;
      expv[24] = 66'h2f6d231a600000000;
      expv[25] = 66'h2f6d231a600000000;
      expv[26] = 66'h0ce9b572300000000;
      expv[27] = 66'h0ce9b572300000000;
      expv[28] = 66'h0ce9b5723ce9b5723;
      expv[29] = 66'h0ce9b5723ce9b5723;
      expv[30] = 66'h0ce9b5723ce9b5723;
      expv[31] = 66'h0b5e902b4e74dab91;
      expv[32] = 66'h0b5e902b4e74dab91;
      expv[33] = 66'h0b5e902b4e74dab91;
      expv[34] = 66'h2b5e902b4e74dab91;
      expv[35] = 66'h02829d51000000000;
      expv[36] = 66'h02829d51000000000;
      expv[37] = 66'h02829d5102829d510;
      expv[38] = 66'h02829d5102829d510;
      expv[39] = 66'h02829d5102829d510;
      expv[40] = 66'h01414ea883c3ebf98;
      expv[41] = 66'h01414ea883c3ebf98;
      expv[42] = 66'h01414ea883c3ebf98;
      expv[43] = 66'h01414ea883c3ebf98;
      expv[44] = 66'h023249a6e373984f6;
      expv[45] = 66'h023249a6e373984f6;
      expv[46] = 66'h023249a6e373984f6;
      expv[47] = 66'h023249a6e373984f6;
      expv[48] = 66'h023249a6e373984f6;
      expv[49] = 66'h01c3d69cf3b9e1843;
      expv[50] = 66'h01c3d69cf3b9e1843;
      expv[51] = 66'h01c3d69cf3b9e1843;
      expv[52] = 66'h01c3d69cf3b9e1843;
      expv[53] = 66'h01c3d69cf3b9e1843;
      expv[54] = 66'h01c3d69cf3b9e1843;
      expv[55] = 66'h01ff74b5339da41a7;
      expv[56] = 66'h01ff74b5339da41a7;
      expv[57] = 66'h01ff74b5339da41a7;
      expv[58] = 66'h01ff74b5339da41a7;
      expv[59] = 66'h01ff74b5339da41a7;
      expv[60] = 66'h01ff74b5339da41a7;
      expv[61] = 66'h01ff74b5339da41a7;
      expv[62] = 66'h01e2879463ad9fc01;
      expv[63] = 66'h01e2879463ad9fc01;
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
