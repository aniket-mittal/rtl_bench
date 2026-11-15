// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 27;
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
    .rst_ni(in_vec[109:109]),
    .link_reset_i(in_vec[108:108]),
    .link_active_i(in_vec[107:107]),
    .dev_addr_i(in_vec[106:100]),
    .in_ep_enabled_i(in_vec[99:88]),
    .in_ep_stall_i(in_vec[87:76]),
    .in_ep_has_data_i(in_vec[75:64]),
    .in_ep_data_i(in_vec[63:56]),
    .in_ep_data_done_i(in_vec[55:44]),
    .in_ep_iso_i(in_vec[43:32]),
    .data_toggle_clear_i(in_vec[31:20]),
    .rx_pkt_start_i(in_vec[19:19]),
    .rx_pkt_end_i(in_vec[18:18]),
    .rx_pkt_valid_i(in_vec[17:17]),
    .rx_pid_i(in_vec[16:13]),
    .rx_addr_i(in_vec[12:6]),
    .rx_endp_i(in_vec[5:2]),
    .tx_pkt_end_i(in_vec[1:1]),
    .tx_data_get_i(in_vec[0:0]),
    .in_ep_current_o(out_vec[26:23]),
    .in_ep_rollback_o(out_vec[22:22]),
    .in_ep_xact_end_o(out_vec[21:21]),
    .in_ep_get_addr_o(out_vec[20:16]),
    .in_ep_data_get_o(out_vec[15:15]),
    .in_ep_newpkt_o(out_vec[14:14]),
    .tx_pkt_start_o(out_vec[13:13]),
    .tx_pid_o(out_vec[12:9]),
    .tx_data_avail_o(out_vec[8:8]),
    .tx_data_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h07ece9e2f0680295ef445f8becf8;
    stim[1] = 110'h08c870335d889ff10ed5af9ed16c;
    stim[2] = 110'h3cec20b056c85da5394b9cff474c;
    stim[3] = 110'h20b9cfa503af0597dc65d515dfcf;
    stim[4] = 110'h25b238cfe37bb25e7ba59e6dca98;
    stim[5] = 110'h354d52efa65a16acdb5df5b0e60e;
    stim[6] = 110'h31b77c2fe76e2e11a679865da25f;
    stim[7] = 110'h3e1f6d0e080213197f226b370f08;
    stim[8] = 110'h3199c183d33dd18c48768067d2dd;
    stim[9] = 110'h25f744897f61019613954569de1e;
    stim[10] = 110'h325a0e330b7a11bfa330d31c510a;
    stim[11] = 110'h230d142a5315fd483365db8df954;
    stim[12] = 110'h347afdd9e9a05b139848cea0c712;
    stim[13] = 110'h317cd57fe4417a738bfae9a33f22;
    stim[14] = 110'h29a01d27092a3bac9818c3cda1bb;
    stim[15] = 110'h3daf9b1ad71279de33e859362841;
    stim[16] = 110'h3a92c22d55ea104893e0f5e82143;
    stim[17] = 110'h3c23b01e66db70186eb3420f0c3b;
    stim[18] = 110'h3f9235fe2af431bd3e86dccc77d0;
    stim[19] = 110'h25ce66c7f073e911c0df7ef94803;
    stim[20] = 110'h2dba58376643e294f8c26461067f;
    stim[21] = 110'h209550ed42bab4d5b8a49824f114;
    stim[22] = 110'h38a5b140ff2cfe2311ab9e3d4a87;
    stim[23] = 110'h209b8f7b4a1c5b540b723975f6b7;
    stim[24] = 110'h38f2ea9dee59d191bcb033082fee;
    stim[25] = 110'h3775f5fbe8ae19ea18ab568366c2;
    stim[26] = 110'h2442ae5c6afd1a668d1f8e32b1c7;
    stim[27] = 110'h25d1c3f6f68be316cbfbf904c16f;
    stim[28] = 110'h3112557af33b54b2596c6e251be8;
    stim[29] = 110'h3eecad58ba4eca131ec381bca41e;
    stim[30] = 110'h377b93cfe1f0f62ad6726ac24ade;
    stim[31] = 110'h2cc7ab191c61a64444ed75f1b1e7;
    stim[32] = 110'h386b38830250db52575b2fcbeccd;
    stim[33] = 110'h3189328340149a72dd9c3cceb312;
    stim[34] = 110'h2f678e09d80202f2a6e8f4b5fa78;
    stim[35] = 110'h3039e59e03eb98092ed5724c04f2;
    stim[36] = 110'h378ec059041bfd06b30133701090;
    stim[37] = 110'h298abd446b20df792099c63cc856;
    stim[38] = 110'h389b4294042128b93d1c9b84b601;
    stim[39] = 110'h293d21e46bd2f410f199c1cdfbe8;
    stim[40] = 110'h323578f1689d5a2bdc2a6ca7b770;
    stim[41] = 110'h39e391da9b6aafc3a65162b27442;
    stim[42] = 110'h31a138f5b9f70f21bc57c1e66d0a;
    stim[43] = 110'h2f4e6a1a5d04cc44afd85996a402;
    stim[44] = 110'h31d22dbc909cfe39071f3b667a3f;
    stim[45] = 110'h2411a81285c30517972b20f1b092;
    stim[46] = 110'h2323b53794fd5e17f18b8b9c207c;
    stim[47] = 110'h20b6b5a824666efe3bb59f56d0c9;
    stim[48] = 110'h2bb38c68ef0b0a9feb2be1025b7b;
    stim[49] = 110'h3c2cc209b05ce8710eb74183b63c;
    stim[50] = 110'h3cb13d4fb01681c8e6d60bcaa004;
    stim[51] = 110'h37c885df230e7dd0d2ba3d571fb3;
    stim[52] = 110'h34de4bd3419fb94a3d5ca63b4a71;
    stim[53] = 110'h2587251c581b3178f3163fb290f0;
    stim[54] = 110'h39d1256621e6a3014f45d423e2f1;
    stim[55] = 110'h3fa1ca982b6c70ec9d6efc6a31c7;
    stim[56] = 110'h39f70d7ee96c73dbf3a309559ff8;
    stim[57] = 110'h2b5979d29b4dc3df8b43c28430a9;
    stim[58] = 110'h23ddad5dc3c73c793cb7d52f42ce;
    stim[59] = 110'h31b4d1381de371e143abb9025a97;
    stim[60] = 110'h351cebbee2ceaba951bf8433b801;
    stim[61] = 110'h3cdd1ca4e0af5fa18f1fee976ced;
    stim[62] = 110'h3a923476ba9358fc2df0843a7e84;
    stim[63] = 110'h34407cce3b817937f0001232dc2b;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h000005d;
      expv[4] = 27'h0000005;
      expv[5] = 27'h00000b2;
      expv[6] = 27'h0000016;
      expv[7] = 27'h000002e;
      expv[8] = 27'h0000013;
      expv[9] = 27'h00000d1;
      expv[10] = 27'h0000001;
      expv[11] = 27'h0000011;
      expv[12] = 27'h00000fd;
      expv[13] = 27'h000005b;
      expv[14] = 27'h000007a;
      expv[15] = 27'h000003b;
      expv[16] = 27'h0000079;
      expv[17] = 27'h0000010;
      expv[18] = 27'h0000070;
      expv[19] = 27'h0000031;
      expv[20] = 27'h00000e9;
      expv[21] = 27'h00000e2;
      expv[22] = 27'h00000b4;
      expv[23] = 27'h00000fe;
      expv[24] = 27'h000005b;
      expv[25] = 27'h00000d1;
      expv[26] = 27'h0000019;
      expv[27] = 27'h000001a;
      expv[28] = 27'h00000e3;
      expv[29] = 27'h0000054;
      expv[30] = 27'h00000ca;
      expv[31] = 27'h00000f6;
      expv[32] = 27'h00000a6;
      expv[33] = 27'h00000db;
      expv[34] = 27'h000009a;
      expv[35] = 27'h0000002;
      expv[36] = 27'h0000098;
      expv[37] = 27'h00000fd;
      expv[38] = 27'h00000df;
      expv[39] = 27'h0000028;
      expv[40] = 27'h00000f4;
      expv[41] = 27'h000005a;
      expv[42] = 27'h00000af;
      expv[43] = 27'h000000f;
      expv[44] = 27'h00000cc;
      expv[45] = 27'h00000fe;
      expv[46] = 27'h0000005;
      expv[47] = 27'h000005e;
      expv[48] = 27'h000006e;
      expv[49] = 27'h000000a;
      expv[50] = 27'h00000e8;
      expv[51] = 27'h0000081;
      expv[52] = 27'h000007d;
      expv[53] = 27'h00000b9;
      expv[54] = 27'h0000031;
      expv[55] = 27'h00000a3;
      expv[56] = 27'h0000070;
      expv[57] = 27'h0000073;
      expv[58] = 27'h00000c3;
      expv[59] = 27'h000003c;
      expv[60] = 27'h0000071;
      expv[61] = 27'h00000ab;
      expv[62] = 27'h000005f;
      expv[63] = 27'h0000058;
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
