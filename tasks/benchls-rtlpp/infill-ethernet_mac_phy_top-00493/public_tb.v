// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00493 dut (
    .clk(clk),
    .ff_tx_data(in_vec[86:55]),
    .ff_tx_eop(in_vec[54:54]),
    .ff_tx_err(in_vec[53:53]),
    .ff_tx_mod(in_vec[52:51]),
    .ff_tx_sop(in_vec[50:50]),
    .ff_tx_wren(in_vec[49:49]),
    .ff_tx_clk(in_vec[48:48]),
    .ff_rx_rdy(in_vec[47:47]),
    .ff_rx_clk(in_vec[46:46]),
    .address(in_vec[45:38]),
    .read(in_vec[37:37]),
    .writedata(in_vec[36:5]),
    .write(in_vec[4:4]),
    .reset(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .rxp(in_vec[1:1]),
    .ref_clk(in_vec[0:0]),
    .ff_tx_rdy(out_vec[86:86]),
    .ff_rx_data(out_vec[85:54]),
    .ff_rx_dval(out_vec[53:53]),
    .ff_rx_eop(out_vec[52:52]),
    .ff_rx_mod(out_vec[51:50]),
    .ff_rx_sop(out_vec[49:49]),
    .rx_err(out_vec[48:43]),
    .readdata(out_vec[42:11]),
    .waitrequest(out_vec[10:10]),
    .mdio_out(out_vec[9:9]),
    .mdio_oen(out_vec[8:8]),
    .mdc(out_vec[7:7]),
    .led_an(out_vec[6:6]),
    .led_char_err(out_vec[5:5]),
    .led_link(out_vec[4:4]),
    .led_disp_err(out_vec[3:3]),
    .led_crs(out_vec[2:2]),
    .led_col(out_vec[1:1]),
    .txp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h1979700d184a0a45bdc00a;
    stim[1] = 87'h770ebdd29c85d7b8899f58;
    stim[2] = 87'h2eb591551443575faee342;
    stim[3] = 87'h2b3a26cae0e1184f002c10;
    stim[4] = 87'h10c8ca04e572b86f0e1c64;
    stim[5] = 87'h125a984b87801adfee3133;
    stim[6] = 87'h451310c2b9a18b97f01171;
    stim[7] = 87'h26aaccbf8f38d065822bb6;
    stim[8] = 87'h06965004bee50152c23d90;
    stim[9] = 87'h1c333f1c88f303f0875c71;
    stim[10] = 87'h40776fff88a1f442704ff0;
    stim[11] = 87'h5ef0ec42ab0a62af5247b3;
    stim[12] = 87'h1e2f40547bcc66d95530e2;
    stim[13] = 87'h7582af2eb2554409a849a2;
    stim[14] = 87'h6309dd949b80d1fa0f30c2;
    stim[15] = 87'h0848d242de5c0e3700e572;
    stim[16] = 87'h42455e52b8ecaa2eb0a0f3;
    stim[17] = 87'h0ed38d830f4d167269e6d6;
    stim[18] = 87'h736ce21353e9179ff8e840;
    stim[19] = 87'h08216931583ed62a39e1e2;
    stim[20] = 87'h158312db69f7264b0a5440;
    stim[21] = 87'h7c7caff7539a824b114e76;
    stim[22] = 87'h3cbb9afcd5935a3bbdda74;
    stim[23] = 87'h1d47f38067363124ff7c94;
    stim[24] = 87'h47ca51c48bc9dae9b41a10;
    stim[25] = 87'h5b74e42654fd34a0d23210;
    stim[26] = 87'h3620ecf313e38fcced6b43;
    stim[27] = 87'h0d301408f4ea15e99c0586;
    stim[28] = 87'h61654ac50d71830a651034;
    stim[29] = 87'h49f38a5e3b44297b552de2;
    stim[30] = 87'h4174ca23871aaadcfa48b0;
    stim[31] = 87'h6c3756c8dfc0a866700be5;
    stim[32] = 87'h0774e4fd76315512175735;
    stim[33] = 87'h78ee6681a3382929193e71;
    stim[34] = 87'h3f2fce73137eb8c1f74f14;
    stim[35] = 87'h6fb4abf069b4139b2cc083;
    stim[36] = 87'h77e8e227122310b3a8fe73;
    stim[37] = 87'h4155c1125ecd63d839c844;
    stim[38] = 87'h108b02802fce4696471596;
    stim[39] = 87'h4d19ded51120e6e89a60b4;
    stim[40] = 87'h7c236fbccabfeceb1f8d17;
    stim[41] = 87'h328598ae3920d445faab66;
    stim[42] = 87'h42d9356f5da354e2f38320;
    stim[43] = 87'h5724257a7666d66b4a40b2;
    stim[44] = 87'h6018aba33629e810403960;
    stim[45] = 87'h6ff72ff0c22b04d4d16546;
    stim[46] = 87'h1707e9535bb990f6f51067;
    stim[47] = 87'h1b851f3527f4134b209571;
    stim[48] = 87'h4c56b909aa047c189bda90;
    stim[49] = 87'h4f871da923c1329d6bf481;
    stim[50] = 87'h379a93593eadcd01f9a187;
    stim[51] = 87'h5afc3aabc7d64b266753b4;
    stim[52] = 87'h2bb9c4036d2641577588f7;
    stim[53] = 87'h77e1003b8e781b283797c2;
    stim[54] = 87'h62af1435be60369dc19e44;
    stim[55] = 87'h70a347ede868dc4313a115;
    stim[56] = 87'h0da2ea90a9c4e594c8bf02;
    stim[57] = 87'h70b06615789f4a1c82af65;
    stim[58] = 87'h4c540f19f615247d911d17;
    stim[59] = 87'h74a5c2547eabdbc7716ba4;
    stim[60] = 87'h1ad8b551e5aca659108e24;
    stim[61] = 87'h28774c705f4fdb4287a210;
    stim[62] = 87'h74914afa3780a1ed7eae10;
    stim[63] = 87'h7bbc0141ec0045f25f55e1;
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
      expv[3] = 87'h2ebf5dc69802eb59155043;
      expv[4] = 87'h709e00580202b3a26ca86c;
      expv[5] = 87'h30de1c38e0010c8ca04e6a;
      expv[6] = 87'h75bfdc62420125a984b8c7;
      expv[7] = 87'h572fe022ce0451310c2ce4;
      expv[8] = 87'h20cb045756026aaccbfe43;
      expv[9] = 87'h42a5847b0e006965004866;
      expv[10] = 87'h47e10eb8c601c333f1ccc4;
      expv[11] = 87'h6884e09ff6040776fffc44;
      expv[12] = 87'h055ea48f7605ef0ec42ce1;
      expv[13] = 87'h4db2aa61fc01e2f405406d;
      expv[14] = 87'h081350935807582af2ec61;
      expv[15] = 87'h63f41e619c06309dd94845;
      expv[16] = 87'h1c6e01cace00848d242c4b;
      expv[17] = 87'h545d6141ee042455e528e5;
      expv[18] = 87'h2ce4d3cd8600ed38d83643;
      expv[19] = 87'h6f3ff1d0880736ce21304c;
      expv[20] = 87'h2c5473c3dc008216931449;
      expv[21] = 87'h4c9614a8a40158312db06c;
      expv[22] = 87'h4496229cca07c7caff764d;
      expv[23] = 87'h74777bb4da03cbb9afce4e;
      expv[24] = 87'h2249fef92201d47f38066a;
      expv[25] = 87'h75d3683416047ca51c4844;
      expv[26] = 87'h6941a4642a05b74e42644e;
      expv[27] = 87'h5f99dad68803620ecf34c5;
      expv[28] = 87'h6bd3380b0800d301408e6f;
      expv[29] = 87'h0614ca2046061654ac5642;
      expv[30] = 87'h12f6aa5bec049f38a5e061;
      expv[31] = 87'h15b9f4916204174ca23842;
      expv[32] = 87'h50cce017ec06c3756c8ace;
      expv[33] = 87'h2a242eae5a00774e4fd6ea;
      expv[34] = 87'h1252327ce2078ee66818e0;
      expv[35] = 87'h3183ee9e2a03f2fce73240;
      expv[36] = 87'h673659810406fb4abf00ed;
      expv[37] = 87'h216751fcca077e8e2274c1;
      expv[38] = 87'h47b07390bc04155c11224e;
      expv[39] = 87'h4d2c8e2b160108b0280667;
      expv[40] = 87'h0dd134c17a04d19ded5640;
      expv[41] = 87'h59d63f1a3607c236fbcacd;
      expv[42] = 87'h288bf556dc0328598ae661;
      expv[43] = 87'h69c5e7065c042d9356f04e;
      expv[44] = 87'h2cd694815a05724257a46b;
      expv[45] = 87'h10208072f806018aba3062;
      expv[46] = 87'h09a9a2ca8006ff72ff0a49;
      expv[47] = 87'h61edea20cc01707e9532cd;
      expv[48] = 87'h6696412ac201b851f354e6;
      expv[49] = 87'h383137b53604c56b909c60;
      expv[50] = 87'h653ad7e92004f871da90e4;
      expv[51] = 87'h5a03f3431c0379a93596e7;
      expv[52] = 87'h564ccea75205afc3aabe4e;
      expv[53] = 87'h02aeeb11d602bb9c4036eb;
      expv[54] = 87'h36506f2f84077e1003b843;
      expv[55] = 87'h2d3b833cac062af1435a62;
      expv[56] = 87'h3886274216070a347edae8;
      expv[57] = 87'h4b29917e3400da2ea90865;
      expv[58] = 87'h5439055edc070b066156ec;
      expv[59] = 87'h08fb223a2a04c540f19eeb;
      expv[60] = 87'h778ee2d75c074a5c25426e;
      expv[61] = 87'h4cb2211c6001ad8b551e6e;
      expv[62] = 87'h36850f441e028774c7044a;
      expv[63] = 87'h43dafd5c2a074914afa066;
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
