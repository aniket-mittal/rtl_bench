// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 123;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  usb_fs_nb_in_pe dut (
    .clk_48mhz_i(clk),
    .rst_ni(in_vec[122:122]),
    .link_reset_i(in_vec[121:121]),
    .link_active_i(in_vec[120:120]),
    .dev_addr_i(in_vec[119:113]),
    .in_ep_enabled_i(in_vec[112:101]),
    .in_ep_stall_i(in_vec[100:89]),
    .in_ep_has_data_i(in_vec[88:77]),
    .in_ep_data_i(in_vec[76:69]),
    .in_ep_data_done_i(in_vec[68:57]),
    .in_ep_iso_i(in_vec[56:45]),
    .in_datatog_we_i(in_vec[44:44]),
    .in_datatog_status_i(in_vec[43:32]),
    .in_datatog_mask_i(in_vec[31:20]),
    .rx_pkt_start_i(in_vec[19:19]),
    .rx_pkt_end_i(in_vec[18:18]),
    .rx_pkt_valid_i(in_vec[17:17]),
    .rx_pid_i(in_vec[16:13]),
    .rx_addr_i(in_vec[12:6]),
    .rx_endp_i(in_vec[5:2]),
    .tx_pkt_end_i(in_vec[1:1]),
    .tx_data_get_i(in_vec[0:0]),
    .in_xact_starting_o(out_vec[46:46]),
    .in_xact_start_ep_o(out_vec[45:42]),
    .in_ep_current_o(out_vec[41:38]),
    .in_ep_rollback_o(out_vec[37:37]),
    .in_ep_xact_end_o(out_vec[36:36]),
    .in_ep_get_addr_o(out_vec[35:31]),
    .in_ep_data_get_o(out_vec[30:30]),
    .in_ep_newpkt_o(out_vec[29:29]),
    .in_data_toggle_o(out_vec[28:17]),
    .tx_pkt_start_o(out_vec[16:16]),
    .tx_pid_o(out_vec[15:12]),
    .tx_data_avail_o(out_vec[11:11]),
    .tx_data_o(out_vec[10:3]),
    .event_timeout_in_o(out_vec[2:2]),
    .event_nak_in_o(out_vec[1:1]),
    .event_nodata_in_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 123'h0fa059feb6b0bf99dda8cebb135988e;
    stim[1] = 123'h105c1afbbcb5e7403d40184d0b7c96b;
    stim[2] = 123'h7d78e3dad4edcfcdefd24bb6e318172;
    stim[3] = 123'h45c53986bcee9163487bbdb59c733e0;
    stim[4] = 123'h6c3ae363935f75c252290db1eda6521;
    stim[5] = 123'h60bb6f127a3d6e9354b6cb0a7a1e8dc;
    stim[6] = 123'h5337833696049f7333a98d89f43801c;
    stim[7] = 123'h4daffe52df3e3b66d7a12316a840272;
    stim[8] = 123'h56722e1da683194224cd6df5333c563;
    stim[9] = 123'h73a72c16c010201c0ffd1c559b3d5ca;
    stim[10] = 123'h4f4e57d528cbcb69fa560d42799e66b;
    stim[11] = 123'h73f5205693b4b7cabb398a4af2a9da9;
    stim[12] = 123'h4205f594329f8e7f1247364f51bf7c4;
    stim[13] = 123'h50160645e45c276128ce839f9b4f251;
    stim[14] = 123'h5762cd8e4d250fcaa08b291807fb3eb;
    stim[15] = 123'h40087be7d4eaa67dc3e25c3b52c455b;
    stim[16] = 123'h6f8be6ad85e960f508db535096c5fbc;
    stim[17] = 123'h5a4fceac164e676875302fd479786f5;
    stim[18] = 123'h474589f52a45a5c26552a7d2f0a869c;
    stim[19] = 123'h58d09aa7263abe1b716063a216dbbf1;
    stim[20] = 123'h4e2a98ad801bf98871e7c9aa05fbd9d;
    stim[21] = 123'h5ae23d597ffe48af45cbcacbd71f6bb;
    stim[22] = 123'h7c3610252b73a765d0a1de32ac784f6;
    stim[23] = 123'h754aadfd93bbf782fb4e2e55e7b6ba1;
    stim[24] = 123'h5c73bbfc8b2823a3466c8198ddf085f;
    stim[25] = 123'h6285582255094736b2396ee935caea1;
    stim[26] = 123'h76bc4c3eb66c276bcd1685335e43832;
    stim[27] = 123'h693dc5aa030095780c1446b018767fe;
    stim[28] = 123'h5b9c62841b41233db84433e382455ac;
    stim[29] = 123'h66d2b69efb74973549a97bb9aa5dc8d;
    stim[30] = 123'h48204fa6003f3e849e71fc9684a9a5d;
    stim[31] = 123'h7e4b0d9da6a4ce357976004e1b3eec2;
    stim[32] = 123'h46b559cb36b3c89b65f2bf8d80ec45c;
    stim[33] = 123'h7cd82cdda3e1494530f2851e6f56a26;
    stim[34] = 123'h70b56983d9c737c29c5a8464668303c;
    stim[35] = 123'h449d3c25eee1880c1a436956e35229a;
    stim[36] = 123'h5f04b65493c5d3cc0c322dbe56df363;
    stim[37] = 123'h4c0d2e3c4081779bfd55ba2567d7af9;
    stim[38] = 123'h7929dfe3a356bab55cfa5586f8ef4e6;
    stim[39] = 123'h6859f711a066bdde07a7c32fe1a61b2;
    stim[40] = 123'h5b0d5b59050fa322d882068d799d974;
    stim[41] = 123'h7461c168a34e18d1cc57a4da8c48c01;
    stim[42] = 123'h674767cdeedc5467d632c3d4ce9947e;
    stim[43] = 123'h41b21b2b975dd9bac5b3bc01802ea20;
    stim[44] = 123'h560227f8f617be96013316039778e0d;
    stim[45] = 123'h5ba30f716946b4886bb243bd54037ce;
    stim[46] = 123'h7c8d0695bdb8602352cc6a9b635c8ac;
    stim[47] = 123'h504870ef01389b4db1ec49829abbec7;
    stim[48] = 123'h61ad11feb8ba0e51c49cab7ee798fb6;
    stim[49] = 123'h4e247f6b7f518b8ec2746a03befa2a8;
    stim[50] = 123'h75f77c41f8bf4b36137b8bc311231e8;
    stim[51] = 123'h7b34b33f97ccc663aa337b2b8030dde;
    stim[52] = 123'h6c0c24534de74fb1de488a51d5737ff;
    stim[53] = 123'h6438c6a188590e1b7ff6e2342ba8bf1;
    stim[54] = 123'h585432d8fe0261529fdf9feab73c9e3;
    stim[55] = 123'h56df4ebdb1ecc5362ec707fab792492;
    stim[56] = 123'h6633277f74162742e6d5e935e175ebd;
    stim[57] = 123'h62e5e79b85b313ed83ab36cad690cb0;
    stim[58] = 123'h4e378c226272c54f4de23084bb67d27;
    stim[59] = 123'h4dd019ee1a094f1faf15e4f3abd8cc0;
    stim[60] = 123'h424b73a9c872d188b0a5571bf300c84;
    stim[61] = 123'h168f7c305a138c70bf87c53d3b17c89;
    stim[62] = 123'h5840589082cd0d557317e06022bb7e2;
    stim[63] = 123'h7e13a5a9259c7d7ee2ad9be59fb4657;
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
      expv[0] = 47'h0c0000000000;
      expv[1] = 47'h280000000000;
      expv[2] = 47'h000000000000;
      expv[3] = 47'h200000000738;
      expv[4] = 47'h200003300240;
      expv[5] = 47'h1c00000005d0;
      expv[6] = 47'h1c00000005b8;
      expv[7] = 47'h000011a00278;
      expv[8] = 47'h200014e000e8;
      expv[9] = 47'h08001ca60460;
      expv[10] = 47'h280000000080;
      expv[11] = 47'h280000000728;
      expv[12] = 47'h0400000002d8;
      expv[13] = 47'h100006800638;
      expv[14] = 47'h280006800098;
      expv[15] = 47'h180006820438;
      expv[16] = 47'h000006820298;
      expv[17] = 47'h000000000580;
      expv[18] = 47'h1c0000000198;
      expv[19] = 47'h000000000690;
      expv[20] = 47'h1c00000002f8;
      expv[21] = 47'h0000100007e0;
      expv[22] = 47'h000011080120;
      expv[23] = 47'h200000000698;
      expv[24] = 47'h1c00000007d8;
      expv[25] = 47'h200000000088;
      expv[26] = 47'h000000000518;
      expv[27] = 47'h000000000098;
      expv[28] = 47'h2c0000000250;
      expv[29] = 47'h0c0000000488;
      expv[30] = 47'h1c0000000258;
      expv[31] = 47'h00000d0004f8;
      expv[32] = 47'h1c0000000338;
      expv[33] = 47'h240000000720;
      expv[34] = 47'h000000000520;
      expv[35] = 47'h1800000004d8;
      expv[36] = 47'h20000d020620;
      expv[37] = 47'h00000d020748;
      expv[38] = 47'h2400074405d8;
      expv[39] = 47'h0000000002e8;
      expv[40] = 47'h0000000002f0;
      expv[41] = 47'h000000000688;
      expv[42] = 47'h000000000060;
      expv[43] = 47'h200000000150;
      expv[44] = 47'h0c0003000760;
      expv[45] = 47'h0c00020006f8;
      expv[46] = 47'h2c00020002d0;
      expv[47] = 47'h040000000180;
      expv[48] = 47'h000000000268;
      expv[49] = 47'h280000000038;
      expv[50] = 47'h280000000628;
      expv[51] = 47'h1c0000000528;
      expv[52] = 47'h000000000318;
      expv[53] = 47'h000000000538;
      expv[54] = 47'h200000000438;
      expv[55] = 47'h1000116c0180;
      expv[56] = 47'h0000006e0310;
      expv[57] = 47'h000000000098;
      expv[58] = 47'h240000000448;
      expv[59] = 47'h000000000310;
      expv[60] = 47'h040004160538;
      expv[61] = 47'h080000000000;
      expv[62] = 47'h200000000000;
      expv[63] = 47'h140000040430;
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
