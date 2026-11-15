// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104119 dut (
    .a(in_vec[37:6]),
    .flagc(in_vec[5:5]),
    .shift(in_vec[4:0]),
    .q(out_vec[32:1]),
    .c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h0e3d844307;
    stim[1] = 38'h03840739b4;
    stim[2] = 38'h306a15fd22;
    stim[3] = 38'h25b8bf4ae6;
    stim[4] = 38'h2be2405fbc;
    stim[5] = 38'h15b643e367;
    stim[6] = 38'h06ceabe353;
    stim[7] = 38'h09f6767653;
    stim[8] = 38'h1e16111bda;
    stim[9] = 38'h1edd39622a;
    stim[10] = 38'h3eec27b3b4;
    stim[11] = 38'h06afe40bb9;
    stim[12] = 38'h0b6dfa98bd;
    stim[13] = 38'h346b4ead3e;
    stim[14] = 38'h0d9fc3d94e;
    stim[15] = 38'h38f7e08764;
    stim[16] = 38'h028bf09e9a;
    stim[17] = 38'h1567242cc0;
    stim[18] = 38'h14c7b94704;
    stim[19] = 38'h19025c5120;
    stim[20] = 38'h2ced03da66;
    stim[21] = 38'h11030c836b;
    stim[22] = 38'h3ad9b2a562;
    stim[23] = 38'h292d8b295b;
    stim[24] = 38'h2d78797cef;
    stim[25] = 38'h0404528dbf;
    stim[26] = 38'h38db6189b6;
    stim[27] = 38'h2acf84f046;
    stim[28] = 38'h13023dd08a;
    stim[29] = 38'h0da527e6ef;
    stim[30] = 38'h1093648913;
    stim[31] = 38'h1098f8e4de;
    stim[32] = 38'h0b9c3f7683;
    stim[33] = 38'h3ba0c8b122;
    stim[34] = 38'h2920f81f3a;
    stim[35] = 38'h340a25fa31;
    stim[36] = 38'h1054abbbc8;
    stim[37] = 38'h327fb13b05;
    stim[38] = 38'h017cd6a175;
    stim[39] = 38'h1b0a11a6fa;
    stim[40] = 38'h164834cee1;
    stim[41] = 38'h3b9add3395;
    stim[42] = 38'h0a1b3961cc;
    stim[43] = 38'h2a053eb307;
    stim[44] = 38'h32c5a09b90;
    stim[45] = 38'h13d314fc59;
    stim[46] = 38'h3af3cf29a5;
    stim[47] = 38'h313bf6640b;
    stim[48] = 38'h2bdd95b490;
    stim[49] = 38'h022ebb32d2;
    stim[50] = 38'h1d55a3c66a;
    stim[51] = 38'h3d89b4745d;
    stim[52] = 38'h08933f4ca4;
    stim[53] = 38'h22d6359ec9;
    stim[54] = 38'h1c9a1fc4dc;
    stim[55] = 38'h190fc1e84b;
    stim[56] = 38'h0936c1d3a1;
    stim[57] = 38'h297024a23e;
    stim[58] = 38'h1a1753a481;
    stim[59] = 38'h26cc171d72;
    stim[60] = 38'h23c7193056;
    stim[61] = 38'h1c0e99b725;
    stim[62] = 38'h2385cd743c;
    stim[63] = 38'h3a18bad12e;
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
      expv[0] = 33'h060e3d844;
      expv[1] = 33'h00739a1c2;
      expv[2] = 33'h0e0d42bfa;
      expv[3] = 33'h0bcb717e9;
      expv[4] = 33'h1e2405fb5;
      expv[5] = 33'h06d5b643e;
      expv[6] = 33'h157c686ce;
      expv[7] = 33'h0ecec89f6;
      expv[8] = 33'h058446f3c;
      expv[9] = 33'h188bdba72;
      expv[10] = 33'h027b3bf76;
      expv[11] = 33'h17f205d1a;
      expv[12] = 33'h1b6fd4c52;
      expv[13] = 33'h11ad3ab4e;
      expv[14] = 33'h0f651b3f8;
      expv[15] = 33'h17c7bf043;
      expv[16] = 33'h02fc27a05;
      expv[17] = 33'h0ab392166;
      expv[18] = 33'h10a63dca3;
      expv[19] = 33'h0c812e289;
      expv[20] = 33'h09d9da07b;
      expv[21] = 33'h106d1030c;
      expv[22] = 33'h1f5b3654a;
      expv[23] = 33'h05b1652a9;
      expv[24] = 33'h12f9ed787;
      expv[25] = 33'h0808a51b4;
      expv[26] = 33'h0d8626f1b;
      expv[27] = 33'h01559f09e;
      expv[28] = 33'h14226047b;
      expv[29] = 33'h0fcdcda52;
      expv[30] = 33'h0c9121093;
      expv[31] = 33'h0263e3932;
      expv[32] = 33'h10b9c3f76;
      expv[33] = 33'h0f7419162;
      expv[34] = 33'h083e07cd2;
      expv[35] = 33'h12fd1d028;
      expv[36] = 33'h1bc82a55d;
      expv[37] = 33'h18c9fec4e;
      expv[38] = 33'h06b50b05f;
      expv[39] = 33'h028469bb6;
      expv[40] = 33'h15920d33b;
      expv[41] = 33'h16e99cee6;
      expv[42] = 33'h161c50d9c;
      expv[43] = 33'h062a053eb;
      expv[44] = 33'h009b9962d;
      expv[45] = 33'h098a7e24f;
      expv[46] = 33'h0debcf3ca;
      expv[47] = 33'h0c8313bf6;
      expv[48] = 33'h15b495eec;
      expv[49] = 33'h0eccb045d;
      expv[50] = 33'h119baab47;
      expv[51] = 33'h0c4da3a2f;
      expv[52] = 33'h0a4499fa6;
      expv[53] = 33'h0f68b58d6;
      expv[54] = 33'h09a1fc4ce;
      expv[55] = 33'h1d0990fc1;
      expv[56] = 33'h124db074e;
      expv[57] = 33'h05c09288d;
      expv[58] = 33'h0685d4e92;
      expv[59] = 33'h05c75cd98;
      expv[60] = 33'h1c64c1478;
      expv[61] = 33'h19703a66d;
      expv[62] = 33'h185cd7431;
      expv[63] = 33'h0b44f4317;
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
