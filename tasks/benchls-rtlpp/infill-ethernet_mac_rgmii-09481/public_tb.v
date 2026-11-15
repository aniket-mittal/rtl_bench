// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09481 dut (
    .clk(clk),
    .ff_tx_data(in_vec[93:62]),
    .ff_tx_eop(in_vec[61:61]),
    .ff_tx_err(in_vec[60:60]),
    .ff_tx_mod(in_vec[59:58]),
    .ff_tx_sop(in_vec[57:57]),
    .ff_tx_wren(in_vec[56:56]),
    .ff_tx_clk(in_vec[55:55]),
    .ff_rx_rdy(in_vec[54:54]),
    .ff_rx_clk(in_vec[53:53]),
    .address(in_vec[52:45]),
    .read(in_vec[44:44]),
    .writedata(in_vec[43:12]),
    .write(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .rgmii_in(in_vec[9:6]),
    .rx_control(in_vec[5:5]),
    .tx_clk(in_vec[4:4]),
    .rx_clk(in_vec[3:3]),
    .set_10(in_vec[2:2]),
    .set_1000(in_vec[1:1]),
    .mdio_in(in_vec[0:0]),
    .ff_tx_rdy(out_vec[86:86]),
    .ff_rx_data(out_vec[85:54]),
    .ff_rx_dval(out_vec[53:53]),
    .ff_rx_eop(out_vec[52:52]),
    .ff_rx_mod(out_vec[51:50]),
    .ff_rx_sop(out_vec[49:49]),
    .rx_err(out_vec[48:43]),
    .readdata(out_vec[42:11]),
    .waitrequest(out_vec[10:10]),
    .rgmii_out(out_vec[9:6]),
    .tx_control(out_vec[5:5]),
    .ena_10(out_vec[4:4]),
    .eth_mode(out_vec[3:3]),
    .mdio_out(out_vec[2:2]),
    .mdio_oen(out_vec[1:1]),
    .mdc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h3211f552c8457d4b6238cc1a;
    stim[1] = 94'h39dfd958633825c58c048e6a;
    stim[2] = 94'h14ac4036712160a1ee983352;
    stim[3] = 94'h0ab6820fc9013b0e19c7b209;
    stim[4] = 94'h3b2ffcf33fcd9171ec51a802;
    stim[5] = 94'h1ed893dcbe250a1ad9447135;
    stim[6] = 94'h13cd87388086ae9673e5320a;
    stim[7] = 94'h2f8c00cc1bd5765e9dec28a7;
    stim[8] = 94'h2b4c07dc8b8cd11721f901d3;
    stim[9] = 94'h0e04227d393fa962ff0d58b4;
    stim[10] = 94'h3be854d7d359d68e2b56fad5;
    stim[11] = 94'h038f094054c763c55de959d2;
    stim[12] = 94'h3ddb957f15698f803c7e7b48;
    stim[13] = 94'h176fce7635bafac4b0bbb315;
    stim[14] = 94'h2c9c49eef5359eb1a737324e;
    stim[15] = 94'h077a9421cbb6968f4fc285be;
    stim[16] = 94'h2011b557d33f1537e16f621f;
    stim[17] = 94'h1422dcab280e84edeff5311f;
    stim[18] = 94'h12357a7f06da111463a1780b;
    stim[19] = 94'h38c36ca9508602a95c291bb7;
    stim[20] = 94'h0035ab1b08bef3a993874021;
    stim[21] = 94'h38c61d7d4d9dff3b4e430a56;
    stim[22] = 94'h393b913ef0ee439cf658fa66;
    stim[23] = 94'h231cc1db1912ba5530efc869;
    stim[24] = 94'h37feb962c78b97ee2755413d;
    stim[25] = 94'h128535ca8da1e782cf115649;
    stim[26] = 94'h2ce1aaa4fdbb1c60b3d7ea04;
    stim[27] = 94'h1571c1fec33a1be6a09d5875;
    stim[28] = 94'h2be33a35ba590f56a7f3b88c;
    stim[29] = 94'h084c72b550b0c296f224b0da;
    stim[30] = 94'h1a61362071ae0b5607e22b61;
    stim[31] = 94'h35c683ecccabe0656c02eb22;
    stim[32] = 94'h18a57266f5eaaf7702bfb963;
    stim[33] = 94'h0a2159eb175707bd02e41168;
    stim[34] = 94'h1a37c53a24cf2fc09ef59396;
    stim[35] = 94'h0e9bc25119f04472cb4b831f;
    stim[36] = 94'h2c42003314fca9f049e4db50;
    stim[37] = 94'h09cc6e75f3b53478a80cc026;
    stim[38] = 94'h2ca0090a06bab8f492a22b3e;
    stim[39] = 94'h1018f1bdd6898eff69db888d;
    stim[40] = 94'h06f1680e58aa5ec43903d8c9;
    stim[41] = 94'h0818170863cbf37b8e850988;
    stim[42] = 94'h2c445a6c2b412c2f23cdd2da;
    stim[43] = 94'h39c2c2c95303be19d4243bf0;
    stim[44] = 94'h131fd6627ebbd4d17c3bf903;
    stim[45] = 94'h2baf57f926986340970678bf;
    stim[46] = 94'h061cd301cc6a2821e1c94125;
    stim[47] = 94'h2e4b188d67590bdc5f6dd883;
    stim[48] = 94'h1ff181b8e32b88b238c3021c;
    stim[49] = 94'h23fdde51a295a457339051f9;
    stim[50] = 94'h35483a64b25c715e246a3321;
    stim[51] = 94'h09540acc58673e60ac0a21fd;
    stim[52] = 94'h3c49d945cf19e1af9fd609c7;
    stim[53] = 94'h0c10134e9b2c75453269e078;
    stim[54] = 94'h19e27b8bbae8bbaf3fbf924d;
    stim[55] = 94'h101c88821d9cc5251b471911;
    stim[56] = 94'h30dea3409253bbf82cf7e1f8;
    stim[57] = 94'h02b54a74bc4b7154d2f0206d;
    stim[58] = 94'h207ca73a8a5f7a9bd9010add;
    stim[59] = 94'h20a46708a4b46d78b39040ff;
    stim[60] = 94'h153e254f3843dc9fe508c833;
    stim[61] = 94'h2d5e79d6195ecede3af1e1bc;
    stim[62] = 94'h0bb7733e0112295c3fb1bd46;
    stim[63] = 94'h3737c8d007d97d0a3d6221fe;
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
      expv[0] = 87'h0000000000000000000000;
      expv[1] = 87'h0000000000000000000000;
      expv[2] = 87'h0000000000000000000000;
      expv[3] = 87'h0000000000000000000348;
      expv[4] = 87'h0000000000000000000204;
      expv[5] = 87'h3b2ffcf33e000000000008;
      expv[6] = 87'h7b2ffcf30c000000000134;
      expv[7] = 87'h7b2ffcf30c000000000208;
      expv[8] = 87'h2f8c00cc2e0000000000bc;
      expv[9] = 87'h2b4c07dcae0000000001cc;
      expv[10] = 87'h2b4c07dc8c0000000000b0;
      expv[11] = 87'h3be854d7ee0000000002d4;
      expv[12] = 87'h7be854d7cc0000000001c8;
      expv[13] = 87'h3be854d7cc000000000340;
      expv[14] = 87'h3be854d7cc000000000314;
      expv[15] = 87'h0000000000000000000000;
      expv[16] = 87'h0000000000000000000000;
      expv[17] = 87'h2011b557e200000000021c;
      expv[18] = 87'h6011b557c000000000011c;
      expv[19] = 87'h6011b557c000000000000c;
      expv[20] = 87'h6011b557c00000000003bc;
      expv[21] = 87'h6011b557c0000000000024;
      expv[22] = 87'h2011b557c0000000000258;
      expv[23] = 87'h6011b557c0000000000278;
      expv[24] = 87'h2011b557c0000000000064;
      expv[25] = 87'h0000000000000000000000;
      expv[26] = 87'h0000000000000000000000;
      expv[27] = 87'h0000000000000000000210;
      expv[28] = 87'h1571c1fee2000000000074;
      expv[29] = 87'h5571c1fec0000000000090;
      expv[30] = 87'h5571c1fec00000000000c8;
      expv[31] = 87'h1571c1fec0000000000364;
      expv[32] = 87'h5571c1fec0000000000328;
      expv[33] = 87'h1571c1fec000000000016c;
      expv[34] = 87'h0a2159eb22000000000160;
      expv[35] = 87'h4a2159eb00000000000398;
      expv[36] = 87'h0a2159eb0000000000031c;
      expv[37] = 87'h4a2159eb00000000000340;
      expv[38] = 87'h09cc6e75f2000000000038;
      expv[39] = 87'h49cc6e75c0000000000338;
      expv[40] = 87'h49cc6e75c0000000000094;
      expv[41] = 87'h49cc6e75c00000000000c4;
      expv[42] = 87'h0818170872000000000180;
      expv[43] = 87'h2c445a6c3a0000000002c8;
      expv[44] = 87'h39c2c2c96a0000000003e0;
      expv[45] = 87'h79c2c2c94800000000010c;
      expv[46] = 87'h79c2c2c9480000000000bc;
      expv[47] = 87'h79c2c2c948000000000134;
      expv[48] = 87'h2e4b188d7600000000008c;
      expv[49] = 87'h1ff181b8f2000000000210;
      expv[50] = 87'h5ff181b8c00000000001e4;
      expv[51] = 87'h5ff181b8c0000000000324;
      expv[52] = 87'h5ff181b8c00000000001f4;
      expv[53] = 87'h3c49d945e20000000001dc;
      expv[54] = 87'h0c10134ea2000000000060;
      expv[55] = 87'h4c10134e80000000000254;
      expv[56] = 87'h0c10134e80000000000104;
      expv[57] = 87'h4c10134e800000000001e0;
      expv[58] = 87'h4c10134e80000000000074;
      expv[59] = 87'h4c10134e800000000002d4;
      expv[60] = 87'h4c10134e800000000000fc;
      expv[61] = 87'h4c10134e8000000000002c;
      expv[62] = 87'h0000000000000000000000;
      expv[63] = 87'h0000000000000000000000;
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
