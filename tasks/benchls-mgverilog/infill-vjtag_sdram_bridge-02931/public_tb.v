// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 105;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02931 dut (
    .clk(clk),
    .vjtag_byteenable(in_vec[104:101]),
    .vjtag_writedata(in_vec[100:69]),
    .vjtag_address(in_vec[68:37]),
    .sdram_readdatavalid(in_vec[36:36]),
    .sdram_waitrequest(in_vec[35:35]),
    .sdram_readdata(in_vec[34:3]),
    .vjtag_write(in_vec[2:2]),
    .vjtag_read(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .leds(out_vec[111:104]),
    .vjtag_readdata(out_vec[103:72]),
    .vjtag_waitrequest(out_vec[71:71]),
    .vjtag_readdatavalid(out_vec[70:70]),
    .sdram_address(out_vec[69:38]),
    .sdram_read(out_vec[37:37]),
    .sdram_write(out_vec[36:36]),
    .sdram_writedata(out_vec[35:4]),
    .sdram_byteenable(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 105'h0e1ae5130a948496df41ebc20ef;
    stim[1] = 105'h1fec7ffd13d3b89ac0410e27d5b;
    stim[2] = 105'h1be8d5d8da8e5f2645e9b0c70ac;
    stim[3] = 105'h07c15b0acadb5880b96c91a02ce;
    stim[4] = 105'h1f2bfabb80a1548cb500c21db5e;
    stim[5] = 105'h04233d159637891e181953a6032;
    stim[6] = 105'h0ccb0cf548878822747060b8952;
    stim[7] = 105'h0c43ef36118b4d4eb770f5bb972;
    stim[8] = 105'h0ff709c38091cbd948d242e6e78;
    stim[9] = 105'h199aae5d528fe0c6ce97fac953e;
    stim[10] = 105'h1ab5fd93d375b408c897c0f0af1;
    stim[11] = 105'h12ffa53b5a5bc65a272d7ddbc70;
    stim[12] = 105'h0edac516cf69def5564f73e2e92;
    stim[13] = 105'h1622f03ca65c8a6800839f3eefe;
    stim[14] = 105'h0ae0678347bf00aa2ce03f00d5e;
    stim[15] = 105'h09c824172e05642be142476dc9a;
    stim[16] = 105'h01b494b730a6ef3ee4f2a0e7202;
    stim[17] = 105'h0bd4b088e43fd186ffcd62ceaca;
    stim[18] = 105'h1391e6b3027152b3af1148555f6;
    stim[19] = 105'h00a8af2cfd1942a36a305026eea;
    stim[20] = 105'h11d12fcafd8ee11c994fb3d6ef6;
    stim[21] = 105'h0a36ed4be2fccdc7f50819bc78a;
    stim[22] = 105'h1f6824d20087b05b67334243b98;
    stim[23] = 105'h0ee8a02727886979e21ab8b59d6;
    stim[24] = 105'h1d4196b142f07d97474aa75afce;
    stim[25] = 105'h100e310a3f85ee186b8a6d8923e;
    stim[26] = 105'h1ef7f12c5110aeab56d7b5521fe;
    stim[27] = 105'h11966e9793a8367e2ed351260d8;
    stim[28] = 105'h0a005735ee92c895fe12adc889c;
    stim[29] = 105'h10b339d4495d54b6015bb2fecc8;
    stim[30] = 105'h0065c339b56f05cdd972289b4d8;
    stim[31] = 105'h1dd1ddcbecfaf6d5bfbae2397c4;
    stim[32] = 105'h181d4bcf58de4381ea0be0ba55e;
    stim[33] = 105'h11496d58c81e242c75e0aef2d00;
    stim[34] = 105'h1032293295e7d927a618cc5a5f2;
    stim[35] = 105'h1fbc02d742d6035b35508f1cee8;
    stim[36] = 105'h087986b07ff86edc2c1ca954c4c;
    stim[37] = 105'h14dc1082521070010b5a42a8ec1;
    stim[38] = 105'h0aaa2c1d6529b780b5b8ac2c5cc;
    stim[39] = 105'h084022b6b6ee8da3fc7dd11a67c;
    stim[40] = 105'h09fe6f1cdc43783c01eeb1d81d2;
    stim[41] = 105'h038e2747ae05bcf990c0a79d456;
    stim[42] = 105'h0f2b25f35ccd85596f7af8dc0cc;
    stim[43] = 105'h087fb0456474f060e39f7c379a2;
    stim[44] = 105'h1fb36a276e2684a0d67268a8e72;
    stim[45] = 105'h186419e0227a861e25553286efc;
    stim[46] = 105'h1d898b5b89da16d18b876fcbb44;
    stim[47] = 105'h198e2a912c4a107dfb6ab9e558e;
    stim[48] = 105'h07d98f583df756a37af8f3d4916;
    stim[49] = 105'h1d5c54266b5891f077b7d491d76;
    stim[50] = 105'h16112f0e198ac2e6ab9db87ac84;
    stim[51] = 105'h1d62ed62d1e13a9cc9ef6041c9a;
    stim[52] = 105'h03e46160f4dbc906b8de8bb7966;
    stim[53] = 105'h076f59ca5f0ccd9d519d95c5c88;
    stim[54] = 105'h054eee149146b485e3ae261cd30;
    stim[55] = 105'h16d5cabe13385c52bb2ee2eb19a;
    stim[56] = 105'h1b88d5817cbd51f461979fe8b98;
    stim[57] = 105'h1ab1875f8344633292ea3dac0d6;
    stim[58] = 105'h1aeb5eb2a4de8d85df8b222d9de;
    stim[59] = 105'h033227574b38d3a016ea9608f46;
    stim[60] = 105'h028fc194318d791b10b930181fa;
    stim[61] = 105'h0e65fb3bb649c4a4eb5481953d4;
    stim[62] = 105'h1328e753c7f1dec34e45962534a;
    stim[63] = 105'h035f189e3182f9c83e0574d2b3a;
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
      expv[0] = 112'h0083d7841d529092dbf0d7289857;
      expv[1] = 112'h01821c4fab3a7713582f63ffe89f;
      expv[2] = 112'h00d3618e15d1cbe4c89f46aec6dd;
      expv[3] = 112'h00d92340595b6b10173e0ad85653;
      expv[4] = 112'h0001843b6b542a9196b95fd5dc0f;
      expv[5] = 112'h0032a74c0606f123c32119e8acb2;
      expv[6] = 112'h00e0c1712a10f1044ea65867aa46;
      expv[7] = 112'h00e1eb772e7169a9d6e21f79b086;
      expv[8] = 112'h00a485cdcf92397b290fb84e1c07;
      expv[9] = 112'h002ff592a791fc18d9fcd572ea9c;
      expv[10] = 112'h002f81e15eaeb6811905afec9e9d;
      expv[11] = 112'h005afbb78e4b78cb44c7fd29dad9;
      expv[12] = 112'h009ee7c5d22d3bdeaae6d628b677;
      expv[13] = 112'h00073e7ddf8b914d00311781e53b;
      expv[14] = 112'h00c07e01abb7e01545b7033c1a35;
      expv[15] = 112'h00848edb9340ac857c2e4120b974;
      expv[16] = 112'h00e541ce4094dde7dcada4a5b980;
      expv[17] = 112'h009ac59d59c7fa30dfeea5844725;
      expv[18] = 112'h002290aabe4e2a5675fc8f359819;
      expv[19] = 112'h0060a04ddd2328546d65457967e0;
      expv[20] = 112'h009f67adde71dc23933e897e57e8;
      expv[21] = 112'h00103378f15f99b8fea1b76a5f15;
      expv[22] = 112'h006684877350f60b6ccb4126900f;
      expv[23] = 112'h0035716b3a310d2f3c7745013937;
      expv[24] = 112'h00954eb5f95e0fb2e8fa0cb58a1e;
      expv[25] = 112'h0014db1247f0bdc30d70718851f8;
      expv[26] = 112'h00af6aa43fa215d56af7bf89628f;
      expv[27] = 112'h00a6a24c1bb506cfc5ccb374bc98;
      expv[28] = 112'h00255b9113125912bfd002b9af75;
      expv[29] = 112'h00b765fd996baa96c00599cea248;
      expv[30] = 112'h00e451369b6de0b9bb032e19cda0;
      expv[31] = 112'h0075c472f8df5edab7de8eee5f6e;
      expv[32] = 112'h0017c174ab1bc8703d70ea5e7acc;
      expv[33] = 112'h00c15de5a0c3c4858e8a4b6ac648;
      expv[34] = 112'h003198b4be3cfb24f4e1914994a8;
      expv[35] = 112'h00a11e39dd5ac06b668de016ba1f;
      expv[36] = 112'h003952a9893f0ddb8593cc3583f4;
      expv[37] = 112'h00b48551d8420e002146e084129a;
      expv[38] = 112'h00715858b9e536f016955160eb25;
      expv[39] = 112'h00fba234cf1dd1b47f920115b5b4;
      expv[40] = 112'h00dd63b03ac86f07802ff378e6e4;
      expv[41] = 112'h00814f3a8a80b79f323c713a3d71;
      expv[42] = 112'h00f5f1b81959b0ab2dd9592f9ae7;
      expv[43] = 112'h003ef86f34ce9e0c1c63fd822b24;
      expv[44] = 112'h00e4d151ce04d0941aed9b513b7f;
      expv[45] = 112'h00aa650ddf4f50c3c49320cf011c;
      expv[46] = 112'h000edf9768fb42da315c4c5adc4e;
      expv[47] = 112'h00d573cab149420fbf7c7154896c;
      expv[48] = 112'h00f1e7a922beead46f7ecc7ac1e3;
      expv[49] = 112'h006fa923aeeb123e0efae2a1335e;
      expv[50] = 112'h003b70f590f1585cd550897870cb;
      expv[51] = 112'h00dec08393fc2753992b176b168e;
      expv[52] = 112'h00bd176f2c9b7920d73f230b07a1;
      expv[53] = 112'h003b2b8b91e199b3aa0b7ace52f3;
      expv[54] = 112'h005c4c39a6e8d690bc4a7770a482;
      expv[55] = 112'h005dc5d633670b8a5766ae55f09b;
      expv[56] = 112'h002f3fd173d7aa3e8c0c46ac0bed;
      expv[57] = 112'h00d47b581aa88c6652758c3afc1d;
      expv[58] = 112'h0016445b3bdbd1b0bbf75af5952d;
      expv[59] = 112'h00d52c11e8a71a7402f9913aba51;
      expv[60] = 112'h007260303fb1af2362247e0ca181;
      expv[61] = 112'h00a9032a7a4938949d532fd9ddb7;
      expv[62] = 112'h008b2c4a693e3bd869e9473a9e39;
      expv[63] = 112'h000ae9a567305f3907eaf8c4f181;
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
