// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179422 dut (
    .opA(in_vec[66:35]),
    .opB(in_vec[34:3]),
    .sel(in_vec[2:0]),
    .res(out_vec[34:3]),
    .z(out_vec[2:2]),
    .c(out_vec[1:1]),
    .v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6bc5b0572591f4f24;
    stim[1] = 67'h6e63fead48517417b;
    stim[2] = 67'h5b92bb411de81f0e6;
    stim[3] = 67'h213816155d0dc3942;
    stim[4] = 67'h2f3caf902b1b4d6ea;
    stim[5] = 67'h6a1af8dd40e8b4f1d;
    stim[6] = 67'h7787f7438baad4580;
    stim[7] = 67'h5788b5e79e1b3ffaf;
    stim[8] = 67'h3a0c8ff0e812ebd20;
    stim[9] = 67'h3a8613e1796273e54;
    stim[10] = 67'h3d7e62ef9e8f38b22;
    stim[11] = 67'h528d76455158fb19f;
    stim[12] = 67'h47abcf9b3243f29ad;
    stim[13] = 67'h18a9dfd27bd513d11;
    stim[14] = 67'h0405eb8fe552abc5f;
    stim[15] = 67'h50125f84550929160;
    stim[16] = 67'h28fc43205f63bd618;
    stim[17] = 67'h48ef384f9f82062f7;
    stim[18] = 67'h6fd3f1dbed3923163;
    stim[19] = 67'h6b8223c04345b7c31;
    stim[20] = 67'h614b23378286cb6af;
    stim[21] = 67'h275824e1a40302903;
    stim[22] = 67'h4295f0aed2dbd871f;
    stim[23] = 67'h4d7a51416d68afcf4;
    stim[24] = 67'h691d76fe5c19afbe1;
    stim[25] = 67'h3228c0ac4b0c4a7fa;
    stim[26] = 67'h7c898b3250a23aee5;
    stim[27] = 67'h10a5e45b712caac5f;
    stim[28] = 67'h6835ee740474fe777;
    stim[29] = 67'h27e0d417149589f3d;
    stim[30] = 67'h626f76ab5b50d7f88;
    stim[31] = 67'h24a3f20369b14942e;
    stim[32] = 67'h7741d178bd3a736f2;
    stim[33] = 67'h7ed848d2d3e9b3cbe;
    stim[34] = 67'h484cd918373a95a5f;
    stim[35] = 67'h78682cf0e8b9c9f97;
    stim[36] = 67'h4911809ad741b8d41;
    stim[37] = 67'h531f006b6da60b41f;
    stim[38] = 67'h19c3d84dc9823ca79;
    stim[39] = 67'h2514a34b0bd9986ce;
    stim[40] = 67'h11f78da28783947a6;
    stim[41] = 67'h0403efc198b3ccde3;
    stim[42] = 67'h4505cfbc4f55c9aab;
    stim[43] = 67'h38a9fdfea53d54391;
    stim[44] = 67'h054a73714f646650a;
    stim[45] = 67'h1333be9775808105e;
    stim[46] = 67'h593234e3625ba4215;
    stim[47] = 67'h1633806083dd365c7;
    stim[48] = 67'h51d5e7d480add03b0;
    stim[49] = 67'h2c55f0301daee377e;
    stim[50] = 67'h44c9dbff943ea33a3;
    stim[51] = 67'h5bf9b0b41ad327fb0;
    stim[52] = 67'h6237361e2c2dcbf8c;
    stim[53] = 67'h4c5a161d116fd5d9f;
    stim[54] = 67'h1c31eb4c93cb10754;
    stim[55] = 67'h2769d5d69c1adc89d;
    stim[56] = 67'h3eaa762f011558dcb;
    stim[57] = 67'h258119aaaa60911a1;
    stim[58] = 67'h3975263176c3485fa;
    stim[59] = 67'h57119fbef7bc127d9;
    stim[60] = 67'h1740b02aec704c4c1;
    stim[61] = 67'h4de5ef2541c3b854b;
    stim[62] = 67'h6d8ac055fac280270;
    stim[63] = 67'h10809fe0b77f4ade7;
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
      expv[0] = 35'h143a4fa88;
      expv[1] = 35'h6e73febf8;
      expv[2] = 35'h000000000;
      expv[3] = 35'h010802140;
      expv[4] = 35'h2b180d000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h0332cb9ba;
      expv[7] = 35'h000000000;
      expv[8] = 35'h221f7bc2b;
      expv[9] = 35'h4579ec1e8;
      expv[10] = 35'h1c0e20a20;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h1cd4cc012;
      expv[14] = 35'h000000000;
      expv[15] = 35'h251b889a2;
      expv[16] = 35'h08600081b;
      expv[17] = 35'h000000000;
      expv[18] = 35'h6ffbf3df8;
      expv[19] = 35'h283c6bfd0;
      expv[20] = 35'h000000000;
      expv[21] = 35'h275b26f18;
      expv[22] = 35'h000000000;
      expv[23] = 35'h3285aebe8;
      expv[24] = 35'h0d03c7400;
      expv[25] = 35'h0208402c0;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h3dc04ea3a;
      expv[31] = 35'h000000000;
      expv[32] = 35'h350051680;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h71cfc7c6a;
      expv[37] = 35'h000000000;
      expv[38] = 35'h50419ba63;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h1cb3efdf8;
      expv[42] = 35'h4f55cfbe8;
      expv[43] = 35'h136ca9c58;
      expv[44] = 35'h054062500;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h5283b80f8;
      expv[49] = 35'h000000000;
      expv[50] = 35'h54fffbff8;
      expv[51] = 35'h76ccd8af0;
      expv[52] = 35'h1dc8c9e18;
      expv[53] = 35'h000000000;
      expv[54] = 35'h63ce14b30;
      expv[55] = 35'h000000000;
      expv[56] = 35'h3fbf7eff8;
      expv[57] = 35'h7b208890a;
      expv[58] = 35'h304100110;
      expv[59] = 35'h5f558d412;
      expv[60] = 35'h2ad063dea;
      expv[61] = 35'h4de7ff758;
      expv[62] = 35'h684d407ca;
      expv[63] = 35'h000000000;
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
