// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04667 dut (
    .MASKE(in_vec[76:45]),
    .ROT(in_vec[44:44]),
    .LSH(in_vec[43:43]),
    .ASH(in_vec[42:42]),
    .SIZE(in_vec[41:40]),
    .SH_VAL(in_vec[39:32]),
    .SH_DAT(in_vec[31:0]),
    .SH_OUT(out_vec[36:5]),
    .MASK_SEL(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h07638c891bf4f145635a;
    stim[1] = 77'h1562d7427a00535017eb;
    stim[2] = 77'h19519be0ff891e9ca1b7;
    stim[3] = 77'h03b0297533ac73ae241e;
    stim[4] = 77'h0bfc8b28e8c3bd75a80b;
    stim[5] = 77'h1da80ae121352e696465;
    stim[6] = 77'h0468086f527bfb2f16be;
    stim[7] = 77'h1310ca9ef2eb9fbaae55;
    stim[8] = 77'h0580360acaaacfaeff2a;
    stim[9] = 77'h11fb88208e4eef50b71a;
    stim[10] = 77'h08b0af18504b57d9af4b;
    stim[11] = 77'h1fbd2ca2a6026a5c6ef4;
    stim[12] = 77'h10345e182bcb936c35b6;
    stim[13] = 77'h04d596d1482c7daab754;
    stim[14] = 77'h043644572b0f24534739;
    stim[15] = 77'h1457d5eb9e226119c0e6;
    stim[16] = 77'h16d6d2d91a8d4e9172f5;
    stim[17] = 77'h1a4479bab56684bcb618;
    stim[18] = 77'h09e37c86775726faf7b8;
    stim[19] = 77'h0ab2b0cb5c4fa05203f8;
    stim[20] = 77'h15ef0d8478e5cb87d03a;
    stim[21] = 77'h054f13d5b85dd28afc17;
    stim[22] = 77'h15082e5bf28da944fa82;
    stim[23] = 77'h0494ef8c3a615320d781;
    stim[24] = 77'h1572e9eb4cd75ebe1356;
    stim[25] = 77'h0dd8aafa0abd7f5267f4;
    stim[26] = 77'h1b1532be417c8a927ccc;
    stim[27] = 77'h1024183bc6f2fca8a4a2;
    stim[28] = 77'h1b197ca2fca645d15deb;
    stim[29] = 77'h083f22802d28323234dd;
    stim[30] = 77'h004f28070f3ade1c1c33;
    stim[31] = 77'h103f3651559201b96e3b;
    stim[32] = 77'h02b579c019f84842337c;
    stim[33] = 77'h0c31f7d35f705db6276f;
    stim[34] = 77'h13762edcdf8ceb7364b1;
    stim[35] = 77'h11fc027af96a6c0c3386;
    stim[36] = 77'h18dac9db831e7144380c;
    stim[37] = 77'h135386af23d515603e58;
    stim[38] = 77'h123172fd5bb1964817f6;
    stim[39] = 77'h17026d6ddb7153df4164;
    stim[40] = 77'h1c4eea066669a6e93893;
    stim[41] = 77'h1c8730ef9da2b52efcda;
    stim[42] = 77'h0ac23de7cc2f2fdc53ce;
    stim[43] = 77'h1dcf95dcf3c9d19447c0;
    stim[44] = 77'h0f1ddc52bec9d6913a3d;
    stim[45] = 77'h08bb74072b66357bd582;
    stim[46] = 77'h138baf10df006a4e8dfc;
    stim[47] = 77'h091756605efc14005df6;
    stim[48] = 77'h03b4277acc2ec74b7bdb;
    stim[49] = 77'h0b5f2faf4be0d60e97b9;
    stim[50] = 77'h11ffb3d1f7d16c73b606;
    stim[51] = 77'h0b1420e63b040ef9e558;
    stim[52] = 77'h03a3f1c4f089fc13dec1;
    stim[53] = 77'h1dc4945386e5627c9a03;
    stim[54] = 77'h1e79bb9962d46b1ab516;
    stim[55] = 77'h12bf00ed9073b7b41814;
    stim[56] = 77'h13a7885c6072b7036c28;
    stim[57] = 77'h0a3ed3501a838bf6bec5;
    stim[58] = 77'h14bf72e6ada9ee74d5d4;
    stim[59] = 77'h03e31317a34e3def61bd;
    stim[60] = 77'h0a0336c072baaf888304;
    stim[61] = 77'h044f3641678573bc48c1;
    stim[62] = 77'h15e343ea56b551598a31;
    stim[63] = 77'h0159f364426a70f8f474;
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
      expv[0] = 37'h06b5e28ad4;
      expv[1] = 37'h0a6a02fd60;
      expv[2] = 37'h07286dc7a9;
      expv[3] = 37'h1c483ce74c;
      expv[4] = 37'h1401200303;
      expv[5] = 37'h118008a115;
      expv[6] = 37'h1efb2f16bb;
      expv[7] = 37'h1aae559fab;
      expv[8] = 37'h127f81650a;
      expv[9] = 37'h01b880208e;
      expv[10] = 37'h0b57d94b4b;
      expv[11] = 37'h152c242222;
      expv[12] = 37'h0c01a0834b;
      expv[13] = 37'h044480d14c;
      expv[14] = 37'h043200452f;
      expv[15] = 37'h108ce07322;
      expv[16] = 37'h05cbd53a4d;
      expv[17] = 37'h10c5b0c5a6;
      expv[18] = 37'h1b826faf77;
      expv[19] = 37'h0a052f8f8f;
      expv[20] = 37'h0b2e1ce8e5;
      expv[21] = 37'h1f4a285c5d;
      expv[22] = 37'h13ea0aa50d;
      expv[23] = 37'h14c835e041;
      expv[24] = 37'h0005020027;
      expv[25] = 37'h10254105dd;
      expv[26] = 37'h191520b81c;
      expv[27] = 37'h12757e7fd2;
      expv[28] = 37'h1a2e8f5f46;
      expv[29] = 37'h0006028008;
      expv[30] = 37'h004f08061a;
      expv[31] = 37'h171db71da2;
      expv[32] = 37'h0f866f8668;
      expv[33] = 37'h04edebb6d0;
      expv[34] = 37'h06c963d6ec;
      expv[35] = 37'h0319c319ca;
      expv[36] = 37'h008a01c01e;
      expv[37] = 37'h1140048035;
      expv[38] = 37'h05fda59211;
      expv[39] = 37'h105914f7d1;
      expv[40] = 37'h184e200029;
      expv[41] = 37'h1e6d7e6d62;
      expv[42] = 37'h000020e5cf;
      expv[43] = 37'h0511f03469;
      expv[44] = 37'h044e8f75a9;
      expv[45] = 37'h089a240126;
      expv[46] = 37'h0d49d1bf80;
      expv[47] = 37'h0c2800bbfc;
      expv[48] = 37'h0394063a4e;
      expv[49] = 37'h1080d05020;
      expv[50] = 37'h0d819b1cf1;
      expv[51] = 37'h1df3cab004;
      expv[52] = 37'h107f04f061;
      expv[53] = 37'h0032680c05;
      expv[54] = 37'h0a28921174;
      expv[55] = 37'h14b7b41413;
      expv[56] = 37'h1204080032;
      expv[57] = 37'h0bf6bec583;
      expv[58] = 37'h1d35753b89;
      expv[59] = 37'h030101072e;
      expv[60] = 37'h0257c4419a;
      expv[61] = 37'h0ab0010485;
      expv[62] = 37'h08c5456635;
      expv[63] = 37'h005832204a;
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
