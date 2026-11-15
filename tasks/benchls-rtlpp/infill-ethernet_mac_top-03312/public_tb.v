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

  rtlpp_03312 dut (
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
    stim[0] = 87'h7a255aa35cc565148b4e4a;
    stim[1] = 87'h6459decf2200dd9d4a4499;
    stim[2] = 87'h0f7ff70289eba4a65f17d3;
    stim[3] = 87'h1e03d75c7d4a5b94393414;
    stim[4] = 87'h64a5eafb6f5e41a0b420b5;
    stim[5] = 87'h7eeeaa3e2d76546729ae59;
    stim[6] = 87'h360b19af1d2d75168244f7;
    stim[7] = 87'h69d3ce5b6829c782acb8d7;
    stim[8] = 87'h449a627268d399077d8df2;
    stim[9] = 87'h49b3c8203d9072b9146c54;
    stim[10] = 87'h73c2e089cd57049c09b951;
    stim[11] = 87'h6959f0f3bfed2130d858d6;
    stim[12] = 87'h1c82311b2288fd55a7bb55;
    stim[13] = 87'h1092b74459522c037f8ef4;
    stim[14] = 87'h5799cba0ba79ebc4b308b3;
    stim[15] = 87'h4bbeb6a19206e25eb893c7;
    stim[16] = 87'h1ad19de161b84ebc3bf8b1;
    stim[17] = 87'h63de95f074a0433701dbe3;
    stim[18] = 87'h6a8ed7a4b239cd53513795;
    stim[19] = 87'h41b5a13014bdeee2adda46;
    stim[20] = 87'h083b984bbaceb8d0fee4a3;
    stim[21] = 87'h7debae305f3c8b4f7503a9;
    stim[22] = 87'h52bb1c47e38b0be5fd1b16;
    stim[23] = 87'h2e0c1bce32c6cf54b0afc1;
    stim[24] = 87'h21e0d91118b5b58ab0f933;
    stim[25] = 87'h118336f19d242450791927;
    stim[26] = 87'h435eb721c6d2cd71de3727;
    stim[27] = 87'h703234cec40e8ca18be8c2;
    stim[28] = 87'h08ff19dcb344380c76c140;
    stim[29] = 87'h1baf0a11e1bcbcccb4e160;
    stim[30] = 87'h401d24c6f9a78e705ad626;
    stim[31] = 87'h01946716b7f0c8fcc62842;
    stim[32] = 87'h38e0e0e0c5cb4ff973f986;
    stim[33] = 87'h36a4a14aac6464b0a69205;
    stim[34] = 87'h56900ae06fa91b5c24ba15;
    stim[35] = 87'h0a31983c80f34933f33495;
    stim[36] = 87'h3bbe612d3926b13df9b7b5;
    stim[37] = 87'h1603aabcff65d831393b80;
    stim[38] = 87'h4622cbbce5b2abd2385344;
    stim[39] = 87'h682daad60ee1696ae86bb7;
    stim[40] = 87'h01b0de2411599c8565c420;
    stim[41] = 87'h7a6759eb2bfbdb2f59c8b6;
    stim[42] = 87'h290e787af38921d6022772;
    stim[43] = 87'h241e982690c14790195056;
    stim[44] = 87'h3a9f78e9dba0d889a58b76;
    stim[45] = 87'h53dff090a73ae8ade0f602;
    stim[46] = 87'h05a5e48fb27474bda38103;
    stim[47] = 87'h2232ae8b19ee583834c624;
    stim[48] = 87'h2a929296a6a3b09f3e9e82;
    stim[49] = 87'h633fa42b534c7980272fe7;
    stim[50] = 87'h32d3b23bda5fa6bf7bf152;
    stim[51] = 87'h38d617e599e7be5ade3910;
    stim[52] = 87'h08867f4dcf2daac3761b10;
    stim[53] = 87'h39fdc53316ab95d3e713e3;
    stim[54] = 87'h62223d4bb832ea9ae97041;
    stim[55] = 87'h299f6aff4de7629e88c795;
    stim[56] = 87'h4be45f6e3c77594f344d65;
    stim[57] = 87'h44b4f6ad529c6dcb065b84;
    stim[58] = 87'h7478ddd3b400f51ee08334;
    stim[59] = 87'h5bcfbec5aae79d47c19225;
    stim[60] = 87'h6dc1578882f4dfea1a28c3;
    stim[61] = 87'h703678cc509348ad842a13;
    stim[62] = 87'h2aad9e5de131d11526aae7;
    stim[63] = 87'h520ab702bfaba785730336;
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
      expv[3] = 87'h47bffb8144000000000011;
      expv[4] = 87'h4f01ebae1e000000000210;
      expv[5] = 87'h0000000000000000000000;
      expv[6] = 87'h0000000000000000000000;
      expv[7] = 87'h5b058cd78e000000000211;
      expv[8] = 87'h74e9e72d94000000000211;
      expv[9] = 87'h624d313914000000000011;
      expv[10] = 87'h64d9e4100e000000000210;
      expv[11] = 87'h79e17044d6000000000010;
      expv[12] = 87'h34acf879ee000000000211;
      expv[13] = 87'h0e41188da0000000000210;
      expv[14] = 87'h48495ba21c000000000210;
      expv[15] = 87'h2bcce5d06c000000000011;
      expv[16] = 87'h25df5b50e8000000000211;
      expv[17] = 87'h4d68cef090000000000010;
      expv[18] = 87'h71ef4af81a000000000011;
      expv[19] = 87'h35476bd268000000000210;
      expv[20] = 87'h60dad0980a000000000211;
      expv[21] = 87'h0000000000000000000000;
      expv[22] = 87'h0000000000000000000000;
      expv[23] = 87'h295d8e23f0000000000211;
      expv[24] = 87'h17060de728000000000010;
      expv[25] = 87'h50f06c888c000000000011;
      expv[26] = 87'h48c19b78ce000000000211;
      expv[27] = 87'h21af5b90f2000000000211;
      expv[28] = 87'h78191a6752000000000011;
      expv[29] = 87'h047f8cee68000000000010;
      expv[30] = 87'h4dd78508d0000000000010;
      expv[31] = 87'h600e92635c000000000211;
      expv[32] = 87'h00ca338b6a000000000011;
      expv[33] = 87'h5c70707052000000000211;
      expv[34] = 87'h5b5250a546000000000210;
      expv[35] = 87'h2b48057036000000000210;
      expv[36] = 87'h4518cc1e40000000000210;
      expv[37] = 87'h5ddf30968c000000000210;
      expv[38] = 87'h0b01d55e7e000000000010;
      expv[39] = 87'h631165de52000000000210;
      expv[40] = 87'h3416d56b26000000000211;
      expv[41] = 87'h40d86f1208000000000010;
      expv[42] = 87'h3d33acf5a4000000000211;
      expv[43] = 87'h14873c3d78000000000011;
      expv[44] = 87'h520f4c1348000000000211;
      expv[45] = 87'h1d4fbc74fc000000000211;
      expv[46] = 87'h29eff84862000000000011;
      expv[47] = 87'h02d2f247e8000000000011;
      expv[48] = 87'h511957458c000000000210;
      expv[49] = 87'h1549494b62000000000011;
      expv[50] = 87'h319fd215b8000000000211;
      expv[51] = 87'h1969d91dfc000000000011;
      expv[52] = 87'h5c6b0bf2cc000000000010;
      expv[53] = 87'h04433fa6f6000000000010;
      expv[54] = 87'h1cfee299aa000000000011;
      expv[55] = 87'h71111ea5cc000000000010;
      expv[56] = 87'h54cfb57f96000000000210;
      expv[57] = 87'h65f22fb70e000000000210;
      expv[58] = 87'h225a7b56b8000000000210;
      expv[59] = 87'h7a3c6ee9ca000000000210;
      expv[60] = 87'h2de7df62e4000000000210;
      expv[61] = 87'h36e0abc460000000000011;
      expv[62] = 87'h781b3c6618000000000011;
      expv[63] = 87'h5556cf2ed0000000000211;
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
