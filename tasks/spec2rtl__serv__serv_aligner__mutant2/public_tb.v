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

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6487787119c291fc8;
    stim[1] = 67'h495bc5cc26742513d;
    stim[2] = 67'h100cae7a4cd06dcd0;
    stim[3] = 67'h1d221b4f98d9d0c23;
    stim[4] = 67'h3194a3df7c18d344d;
    stim[5] = 67'h3f49f15765872be2e;
    stim[6] = 67'h3276c9742bc9edc22;
    stim[7] = 67'h311dfbf1aa25a4d37;
    stim[8] = 67'h144e8fd2cb195ade2;
    stim[9] = 67'h02ab58bb61d1e025f;
    stim[10] = 67'h3c6a75308953d816d;
    stim[11] = 67'h0c5634515c79b11da;
    stim[12] = 67'h2a5f59ce83ec5d690;
    stim[13] = 67'h3872aa9090d3e407e;
    stim[14] = 67'h1a7ca674fa9cf8eb9;
    stim[15] = 67'h25ebcbec60affc497;
    stim[16] = 67'h0c196a52d90a9920a;
    stim[17] = 67'h1cc7b746712490a73;
    stim[18] = 67'h28eef38aba253dedf;
    stim[19] = 67'h0d0f1aea0f2865847;
    stim[20] = 67'h0dd3569973cd32a68;
    stim[21] = 67'h289e34777e33685fd;
    stim[22] = 67'h210f1cd11e74bec3a;
    stim[23] = 67'h04d8110e3a4f4ca56;
    stim[24] = 67'h063a288364c97670a;
    stim[25] = 67'h2098288f61ef5ab49;
    stim[26] = 67'h095960cdf3531a736;
    stim[27] = 67'h1525881cf5e61e9eb;
    stim[28] = 67'h0b3d8a6302d6bfe99;
    stim[29] = 67'h0a1f970c0fcec8dc0;
    stim[30] = 67'h068321c0130c24d73;
    stim[31] = 67'h08c92a252902b912d;
    stim[32] = 67'h024b8a68ac3027416;
    stim[33] = 67'h2e92c9ca21e2e239b;
    stim[34] = 67'h1ba4fd056c6a8552a;
    stim[35] = 67'h27092735c175a0540;
    stim[36] = 67'h39c63655590f20752;
    stim[37] = 67'h2c0841303d14fca87;
    stim[38] = 67'h3a0c1e427913ff176;
    stim[39] = 67'h05b6de768197ece02;
    stim[40] = 67'h04fd6de12734411ac;
    stim[41] = 67'h360fd98d4cd18f8b1;
    stim[42] = 67'h286bf4128caa3df14;
    stim[43] = 67'h2b882d1a17ec4ef48;
    stim[44] = 67'h0477364af285ef43c;
    stim[45] = 67'h16e1a0c4e020dcfa2;
    stim[46] = 67'h3d6b8fcc665d62767;
    stim[47] = 67'h0f7af440fc7b2f1d3;
    stim[48] = 67'h2b920d0e54b760f38;
    stim[49] = 67'h030c43363bdb60ff8;
    stim[50] = 67'h024da728a71e4d876;
    stim[51] = 67'h321f1b017fecc07ac;
    stim[52] = 67'h09c87d5133929d84a;
    stim[53] = 67'h1ce7d1a80fea1d95d;
    stim[54] = 67'h33a56cb317d2cccfe;
    stim[55] = 67'h10b6da543e0f1464b;
    stim[56] = 67'h07aabad125fedd4d7;
    stim[57] = 67'h3c5ab1f727ac400d3;
    stim[58] = 67'h3b33998e5bbe0426a;
    stim[59] = 67'h1d5288e5e07e1b26f;
    stim[60] = 67'h1d0a7a129a7dd29ed;
    stim[61] = 67'h3e61700abd61b2c4d;
    stim[62] = 67'h2a554b3c68fe2d8b6;
    stim[63] = 67'h25670b7c600f83e6c;
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
      expv[0] = 66'hx3xxxxxxx243bc3xx;
      expv[1] = 66'h0ce84a27a4ade2e61;
      expv[2] = 66'h19a0db9a0806573d2;
      expv[3] = 66'h31b3a1844e910da7c;
      expv[4] = 66'h2689a18478ca51f03;
      expv[5] = 66'h17c5e6899fa4f8ac3;
      expv[6] = 66'h1b846689993b64ba9;
      expv[7] = 66'h09a6e689b88efdf95;
      expv[8] = 66'h1632b5bc4a2747e96;
      expv[9] = 66'h03a3c04be155ac5db;
      expv[10] = 66'h12a7b02d9e353a984;
      expv[11] = 66'h223b702d862b1a292;
      expv[12] = 66'h3ad2302d952face7c;
      expv[13] = 66'h080ff02d9c395548c;
      expv[14] = 66'h31d7302dad3e533af;
      expv[15] = 66'h015ff892f2f5e5f63;
      expv[16] = 66'h32153241460cb5296;
      expv[17] = 66'h2249214e6e63dba33;
      expv[18] = 66'h344a7bdbd47779c55;
      expv[19] = 66'h0b08fbdbe6878d758;
      expv[20] = 66'h254d0b08c6e9ab4d3;
      expv[21] = 66'h10bf8b08f44f1a3c3;
      expv[22] = 66'h3d8750bf90878e690;
      expv[23] = 66'h194ad0bf826c08879;
      expv[24] = 66'h2ce150bf831d14423;
      expv[25] = 66'h356910bfb04c14483;
      expv[26] = 66'h34e6f56904acb0677;
      expv[27] = 66'h3d3d75692a92c40ef;
      expv[28] = 66'h05ad7fd3259ec5318;
      expv[29] = 66'h1f9d91b8050fcb860;
      expv[30] = 66'h261849ae634190e00;
      expv[31] = 66'h12057225a46495129;
      expv[32] = 66'h18604e82c125c5345;
      expv[33] = 66'h03c5c473774964e51;
      expv[34] = 66'h18d50aa54dd27e82b;
      expv[35] = 66'h02eb40a81384939ae;
      expv[36] = 66'h321e40ea5ce31b2aa;
      expv[37] = 66'h3a29f950f60420981;
      expv[38] = 66'h3227fe2edd060f213;
      expv[39] = 66'h032fd9c042db6f3b4;
      expv[40] = 66'h0e688235827eb6f09;
      expv[41] = 66'h19a31f163b07ecc6a;
      expv[42] = 66'h19547be29435fa094;
      expv[43] = 66'h2fd89de915c4168d0;
      expv[44] = 66'h250bde87823b9b257;
      expv[45] = 66'h0041b9f44b70d0627;
      expv[46] = 66'h0cbac4ecfeb5c7e63;
      expv[47] = 66'h38f65e3a47bd7a207;
      expv[48] = 66'h01e71e3a55c90687a;
      expv[49] = 66'h01ff1e3a4186219b9;
      expv[50] = 66'h1b0ede3a4126d394d;
      expv[51] = 66'h00f59e3a590f8d813;
      expv[52] = 66'h3b095e3a44e43ea91;
      expv[53] = 66'h3b2b9e3a6e73e8d48;
      expv[54] = 66'h199ffb2b99d2b65a0;
      expv[55] = 66'h28c97b2ba85b6d2a9;
      expv[56] = 66'h3a9ae8c963d55d691;
      expv[57] = 66'h001a7a9afe2d58fc1;
      expv[58] = 66'h084d401a5d99ccc7a;
      expv[59] = 66'h364dc01a6ea944737;
      expv[60] = 66'h34fba53d8e853d094;
      expv[61] = 66'h2589a53dbf30b805d;
      expv[62] = 66'h11fc5b16d52aa59e3;
      expv[63] = 66'h001f07cd92b385be3;
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
