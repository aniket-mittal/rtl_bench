// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 62;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09637 dut (
    .clk(clk),
    .ff_tx_data(in_vec[60:53]),
    .ff_tx_eop(in_vec[52:52]),
    .ff_tx_err(in_vec[51:51]),
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
    .ff_tx_rdy(out_vec[61:61]),
    .ff_rx_data(out_vec[60:53]),
    .ff_rx_dval(out_vec[52:52]),
    .ff_rx_eop(out_vec[51:51]),
    .ff_rx_sop(out_vec[50:50]),
    .rx_err(out_vec[49:44]),
    .readdata(out_vec[43:12]),
    .waitrequest(out_vec[11:11]),
    .mdio_out(out_vec[10:10]),
    .mdio_oen(out_vec[9:9]),
    .mdc(out_vec[8:8]),
    .led_an(out_vec[7:7]),
    .led_char_err(out_vec[6:6]),
    .led_link(out_vec[5:5]),
    .led_disp_err(out_vec[4:4]),
    .led_crs(out_vec[3:3]),
    .led_col(out_vec[2:2]),
    .txp(out_vec[1:1]),
    .rx_recovclkout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h1e5c954f87b7e178;
    stim[1] = 61'h14a7be504e924a1a;
    stim[2] = 61'h0f635261f690a4b4;
    stim[3] = 61'h185192605333de90;
    stim[4] = 61'h0048e61dcfbca852;
    stim[5] = 61'h02b17ff7572542a2;
    stim[6] = 61'h1959b49eb172d1e1;
    stim[7] = 61'h1a4f35c5468a5b34;
    stim[8] = 61'h01b07a58bfd20833;
    stim[9] = 61'h1273ce192cfaa887;
    stim[10] = 61'h07c7fb7df7a041c2;
    stim[11] = 61'h060a5a1d082a9d15;
    stim[12] = 61'h132a274398d04066;
    stim[13] = 61'h0f988cb6e1b3bcd4;
    stim[14] = 61'h178200ffbd33f093;
    stim[15] = 61'h1015e9ab66bbb412;
    stim[16] = 61'h038186cb414e1f02;
    stim[17] = 61'h00438565c409b716;
    stim[18] = 61'h1a7e7819d1608dd2;
    stim[19] = 61'h17b8be7ce90ef5a2;
    stim[20] = 61'h01313976098c7ca3;
    stim[21] = 61'h05f0cede0329f255;
    stim[22] = 61'h15422cb478a5bef2;
    stim[23] = 61'h033c149b4ad7a402;
    stim[24] = 61'h179376ead492d174;
    stim[25] = 61'h0355ba45cc302205;
    stim[26] = 61'h14c578c63afefaa1;
    stim[27] = 61'h12e97c420632f315;
    stim[28] = 61'h05caf09550885522;
    stim[29] = 61'h06f9e3813dde6661;
    stim[30] = 61'h0b0a583f375cb1e0;
    stim[31] = 61'h101989323ab6a2d2;
    stim[32] = 61'h09fa3116045e8681;
    stim[33] = 61'h17348cace3badee1;
    stim[34] = 61'h082b1a5cebc21b02;
    stim[35] = 61'h14faa51b29754f00;
    stim[36] = 61'h144d6d6b6472ae00;
    stim[37] = 61'h111b2bd984076022;
    stim[38] = 61'h05682733b6fbf636;
    stim[39] = 61'h1d69f600554a9702;
    stim[40] = 61'h1faa22e8a558ef40;
    stim[41] = 61'h155aa44fa94351a1;
    stim[42] = 61'h17d8477d1d291e20;
    stim[43] = 61'h0cbc2ad12ccce880;
    stim[44] = 61'h08bdb01d90ba7d77;
    stim[45] = 61'h1b436d6163facb23;
    stim[46] = 61'h17d88eec754565e0;
    stim[47] = 61'h084c13e591d2cb22;
    stim[48] = 61'h0095f38d4e95e447;
    stim[49] = 61'h17a740572c2ba1f3;
    stim[50] = 61'h10c4408314ce7171;
    stim[51] = 61'h00e12bcd31b30115;
    stim[52] = 61'h0898827942a05411;
    stim[53] = 61'h025fc49252695266;
    stim[54] = 61'h15f26263a0a136b2;
    stim[55] = 61'h06d0f7512d97ded5;
    stim[56] = 61'h1eb0a2f8a6f17b15;
    stim[57] = 61'h0f7ad3d19b01f390;
    stim[58] = 61'h11efe0f2dfefc3a1;
    stim[59] = 61'h153fa0a320e5ae47;
    stim[60] = 61'h125d3f4746c8b710;
    stim[61] = 61'h0b98de12324cb7f3;
    stim[62] = 61'h1cbfc08852ae9951;
    stim[63] = 61'h0ade1b478c06a4c1;
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
      expv[0] = 62'h0000000000000200;
      expv[1] = 62'h0000000000000200;
      expv[2] = 62'h0000000000000200;
      expv[3] = 62'h2f7000fb48525e20;
      expv[4] = 62'h1848002999ef4a20;
      expv[5] = 62'h00400ee7de542a22;
      expv[6] = 62'h02a80bab92a15a22;
      expv[7] = 62'h19480f58b968f321;
      expv[8] = 62'h3a5402a3452d9e20;
      expv[9] = 62'h01a80c5fe9041b23;
      expv[10] = 62'h32780c967d544723;
      expv[11] = 62'h27d40efbd020ea22;
      expv[12] = 62'h26100e84154e8f21;
      expv[13] = 62'h333001cc68203622;
      expv[14] = 62'h0f880b70d9de6e20;
      expv[15] = 62'h37900fde99f84b23;
      expv[16] = 62'h100c05b35dda0a22;
      expv[17] = 62'h038005a0a70f8222;
      expv[18] = 62'h205002e204db8e22;
      expv[19] = 62'h3a7c0ce8b046ea22;
      expv[20] = 62'h17a80e74877ada22;
      expv[21] = 62'h01280b04c63e5b23;
      expv[22] = 62'h05e80f0194f92f21;
      expv[23] = 62'h35500a3c52df7a22;
      expv[24] = 62'h032c0da56bd20222;
      expv[25] = 62'h3798056a4968be20;
      expv[26] = 62'h034c02e618110721;
      expv[27] = 62'h14c4031d7f7d5321;
      expv[28] = 62'h12e0010319798f21;
      expv[29] = 62'h25d00aa8442a9222;
      expv[30] = 62'h06e8009eef333321;
      expv[31] = 62'h2b100f9bae58fa20;
      expv[32] = 62'h1008091d5b516a22;
      expv[33] = 62'h29f80b022f434321;
      expv[34] = 62'h172c0671dd6f7b21;
      expv[35] = 62'h28300e75e10d8222;
      expv[36] = 62'h34f80d94baa78220;
      expv[37] = 62'h144405b239570a20;
      expv[38] = 62'h31180cc203b01222;
      expv[39] = 62'h056009db7dfb1e22;
      expv[40] = 62'h1d60002aa54b8222;
      expv[41] = 62'h3fb00452ac77aa20;
      expv[42] = 62'h355807d4a1a8d321;
      expv[43] = 62'h17c80e8e948f1a20;
      expv[44] = 62'h0cac089666744220;
      expv[45] = 62'h08ac0ec85d3ebf23;
      expv[46] = 62'h3b5000b1fd659b23;
      expv[47] = 62'h17c8063aa2b2fa20;
      expv[48] = 62'h084402c8e9659a22;
      expv[49] = 62'h008c06a74af22723;
      expv[50] = 62'h37b40b9615d0fb23;
      expv[51] = 62'h10c4018a6738bb21;
      expv[52] = 62'h00e00698d9808f21;
      expv[53] = 62'h08880ca1502a0b21;
      expv[54] = 62'h225c092934a93622;
      expv[55] = 62'h35f801d0509b5a22;
      expv[56] = 62'h06c80896cbef6f21;
      expv[57] = 62'h1ea80c5378bd8f21;
      expv[58] = 62'h2f7808cd80f9ca20;
      expv[59] = 62'h31f4096ff7e1db21;
      expv[60] = 62'h353c019072d72f23;
      expv[61] = 62'h124c03a3645b8a20;
      expv[62] = 62'h0b880919265bfb23;
      expv[63] = 62'h3cbc0429574cab21;
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
