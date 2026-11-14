// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  usb_fs_nb_out_pe dut (
    .clk_48mhz_i(clk),
    .rst_ni(in_vec[51:51]),
    .link_reset_i(in_vec[50:50]),
    .dev_addr_i(in_vec[49:43]),
    .out_ep_enabled_i(in_vec[42:41]),
    .out_ep_control_i(in_vec[40:39]),
    .out_ep_full_i(in_vec[38:37]),
    .out_ep_stall_i(in_vec[36:35]),
    .out_ep_iso_i(in_vec[34:33]),
    .out_datatog_we_i(in_vec[32:32]),
    .out_datatog_status_i(in_vec[31:30]),
    .out_datatog_mask_i(in_vec[29:28]),
    .rx_pkt_start_i(in_vec[27:27]),
    .rx_pkt_end_i(in_vec[26:26]),
    .rx_pkt_valid_i(in_vec[25:25]),
    .rx_pid_i(in_vec[24:21]),
    .rx_addr_i(in_vec[20:14]),
    .rx_endp_i(in_vec[13:10]),
    .rx_data_put_i(in_vec[9:9]),
    .rx_data_i(in_vec[8:1]),
    .tx_pkt_end_i(in_vec[0:0]),
    .out_ep_current_o(out_vec[30:27]),
    .out_ep_data_put_o(out_vec[26:26]),
    .out_ep_put_addr_o(out_vec[25:21]),
    .out_ep_data_o(out_vec[20:13]),
    .out_ep_newpkt_o(out_vec[12:12]),
    .out_ep_acked_o(out_vec[11:11]),
    .out_ep_rollback_o(out_vec[10:10]),
    .out_ep_setup_o(out_vec[9:8]),
    .out_data_toggle_o(out_vec[7:6]),
    .tx_pkt_start_o(out_vec[5:5]),
    .tx_pid_o(out_vec[4:1]),
    .event_datatog_out_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h660c0a05b0441;
    stim[1] = 52'h3b2f7bb670cdd;
    stim[2] = 52'hc93a9b8512923;
    stim[3] = 52'hdff8275cf7ad6;
    stim[4] = 52'h8e302aed21e9b;
    stim[5] = 52'hcb6b149c451bd;
    stim[6] = 52'haf37d189c2f7d;
    stim[7] = 52'h8bc2c8e55cbd3;
    stim[8] = 52'hdda53a8e97e5f;
    stim[9] = 52'he0a4a3d5a3dc3;
    stim[10] = 52'he0d2a94253653;
    stim[11] = 52'hd5f05440a00e4;
    stim[12] = 52'hed58e1606dfc5;
    stim[13] = 52'h9f20190721861;
    stim[14] = 52'hf91f3a9dcdfc2;
    stim[15] = 52'ha52d35915c7ef;
    stim[16] = 52'hd80f6c6622431;
    stim[17] = 52'hf6566f0c9297e;
    stim[18] = 52'he80ba00cc4031;
    stim[19] = 52'hd823a551b50e7;
    stim[20] = 52'hcb9dc7af3ea85;
    stim[21] = 52'hcece8ab038f7f;
    stim[22] = 52'h9cddf37c9425d;
    stim[23] = 52'ha74f15d079fd3;
    stim[24] = 52'hcfe2bcfb30220;
    stim[25] = 52'h873a4b2cc7606;
    stim[26] = 52'h99882f564dcde;
    stim[27] = 52'h9e229977b09a5;
    stim[28] = 52'h9db2eabe8f6ac;
    stim[29] = 52'h9b41ab5ac352d;
    stim[30] = 52'h8c2f3b66c2d1b;
    stim[31] = 52'ha4780259e8499;
    stim[32] = 52'hd0efafe9ea36c;
    stim[33] = 52'h9c59b761a8d66;
    stim[34] = 52'h888adb53a91b2;
    stim[35] = 52'h9fade2c0d2960;
    stim[36] = 52'hfd9dcef286312;
    stim[37] = 52'hee237cb063114;
    stim[38] = 52'h8c1d0b648d6be;
    stim[39] = 52'hd6f34354a418e;
    stim[40] = 52'hfc2beaf3eb38d;
    stim[41] = 52'hb796a58f97f65;
    stim[42] = 52'hf98ba9b1e3d37;
    stim[43] = 52'hc62f78570fd67;
    stim[44] = 52'hf6b8fe956d603;
    stim[45] = 52'he2ded92296af6;
    stim[46] = 52'hae1a3f54ad3c7;
    stim[47] = 52'he71f4384f562a;
    stim[48] = 52'he0efa47386ceb;
    stim[49] = 52'hec3697f7e2f6d;
    stim[50] = 52'hf899a13c01b91;
    stim[51] = 52'hb8c3268e5201e;
    stim[52] = 52'hff4ab946a9e62;
    stim[53] = 52'hc93f2401c1171;
    stim[54] = 52'hdf0b027564ed4;
    stim[55] = 52'hb4ce63219abe1;
    stim[56] = 52'he201d3c11a252;
    stim[57] = 52'h8b583cf6527a9;
    stim[58] = 52'hde1c974ff6a5b;
    stim[59] = 52'hdeef67cc2bbb8;
    stim[60] = 52'he8f426eb0e6bc;
    stim[61] = 52'hdd005f45dc122;
    stim[62] = 52'h989a5f7cce0f9;
    stim[63] = 52'ha8254cafee14f;
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
      expv[0] = 31'h00000000;
      expv[1] = 31'h00000000;
      expv[2] = 31'h00000000;
      expv[3] = 31'h00000000;
      expv[4] = 31'h000d6000;
      expv[5] = 31'h0009a000;
      expv[6] = 31'h0009a000;
      expv[7] = 31'h0017c000;
      expv[8] = 31'h001d2000;
      expv[9] = 31'h0005e000;
      expv[10] = 31'h0005e000;
      expv[11] = 31'h00052000;
      expv[12] = 31'h00052000;
      expv[13] = 31'h001c4000;
      expv[14] = 31'h001c4000;
      expv[15] = 31'h001c2000;
      expv[16] = 31'h001ee040;
      expv[17] = 31'h001ee000;
      expv[18] = 31'h001ee000;
      expv[19] = 31'h001ee000;
      expv[20] = 31'h001ee000;
      expv[21] = 31'h00084000;
      expv[22] = 31'h0017e000;
      expv[23] = 31'h0005c000;
      expv[24] = 31'h001d2040;
      expv[25] = 31'h00020000;
      expv[26] = 31'h00006000;
      expv[27] = 31'h00006000;
      expv[28] = 31'h00006000;
      expv[29] = 31'h000ac000;
      expv[30] = 31'h000ac000;
      expv[31] = 31'h000ac080;
      expv[32] = 31'h000ac080;
      expv[33] = 31'h0016c000;
      expv[34] = 31'h0016c040;
      expv[35] = 31'h0016c080;
      expv[36] = 31'h0016c080;
      expv[37] = 31'h00112000;
      expv[38] = 31'h00112000;
      expv[39] = 31'h000be000;
      expv[40] = 31'h000be000;
      expv[41] = 31'h0018c000;
      expv[42] = 31'h00164000;
      expv[43] = 31'h00164000;
      expv[44] = 31'h00164000;
      expv[45] = 31'h00002000;
      expv[46] = 31'h000f6000;
      expv[47] = 31'h001c60c0;
      expv[48] = 31'h0002a000;
      expv[49] = 31'h0002a000;
      expv[50] = 31'h0016c000;
      expv[51] = 31'h00190000;
      expv[52] = 31'h00190000;
      expv[53] = 31'h00062000;
      expv[54] = 31'h00062000;
      expv[55] = 31'h000d4000;
      expv[56] = 31'h001e0000;
      expv[57] = 31'h00052000;
      expv[58] = 31'h001a8000;
      expv[59] = 31'h0005a000;
      expv[60] = 31'h001b8000;
      expv[61] = 31'h000bc000;
      expv[62] = 31'h000bc000;
      expv[63] = 31'h000bc0c0;
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
