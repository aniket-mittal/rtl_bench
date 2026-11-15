// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039865 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .d_read_en(in_vec[99:99]),
    .d_write_en(in_vec[98:98]),
    .d_addr(in_vec[97:66]),
    .d_write_data(in_vec[65:34]),
    .wbm_done_pls_i(in_vec[33:33]),
    .wbm_dat_i(in_vec[32:1]),
    .wbm_ack_i(in_vec[0:0]),
    .done_o(out_vec[103:103]),
    .d_data_out(out_vec[102:71]),
    .wbm_dat_o(out_vec[70:39]),
    .wbm_we_o(out_vec[38:38]),
    .wbm_sel_o(out_vec[37:34]),
    .wbm_adr_o(out_vec[33:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_stb_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1213dec54741a3342216fdd56e;
    stim[1] = 101'h159e6635b0ca20d323002996d9;
    stim[2] = 101'h0292dd126de4e2d0b68c6af573;
    stim[3] = 101'h0ad4623247a2eac54ab7c1398f;
    stim[4] = 101'h0c47b0da52b7232c889aa61984;
    stim[5] = 101'h0fcde6eb651cf59a72bd7cbacf;
    stim[6] = 101'h0f685e6b9a4df2842c858ffbcf;
    stim[7] = 101'h019fe4510e6e8af4819cb4e8a2;
    stim[8] = 101'h0c6e0b025656b516767af5194c;
    stim[9] = 101'h0ca06bfcdf248840f7772aa184;
    stim[10] = 101'h091e10346a96724a95ac471543;
    stim[11] = 101'h05974635c29784ddcaa8b5915e;
    stim[12] = 101'h0a8aec8755ff320bd8d7c58d9c;
    stim[13] = 101'h08ac9c9fd8331b3f43f664be8e;
    stim[14] = 101'h0707dad818936d0cdd6c385998;
    stim[15] = 101'h0b9c7e32613ab36129ea4a4163;
    stim[16] = 101'h0f7b6ec28aa567bbabcc474d77;
    stim[17] = 101'h07ff66c29240cc52991fa5c42b;
    stim[18] = 101'h03910e087056554140bf222c4c;
    stim[19] = 101'h0fe7a5d27d8449143cd5320e2e;
    stim[20] = 101'h0087cd36ba3601d987d990d9b3;
    stim[21] = 101'h0e140b264c87c2660d92bbc925;
    stim[22] = 101'h00b84dff448cf68ad48c2bd0fa;
    stim[23] = 101'h027e7383267143c2df21f8a174;
    stim[24] = 101'h10c2e7e2e5b63bc8b608544128;
    stim[25] = 101'h0e9f34a888d1fa5e517477074d;
    stim[26] = 101'h04e091facd2a056bd85ac97b72;
    stim[27] = 101'h0459928e4a096085ed46e71164;
    stim[28] = 101'h04e4bd36567d5611053809faca;
    stim[29] = 101'h060da3233b2473526293c29fbe;
    stim[30] = 101'h062817f1020a6b724020c3dd82;
    stim[31] = 101'h021fb581dcf100d6d863e71706;
    stim[32] = 101'h028baeb98af64097a553aa44a3;
    stim[33] = 101'h037a54a003073aba21cc52c466;
    stim[34] = 101'h0c34f752222cd739933153a698;
    stim[35] = 101'h0acd4c92cc06c97d98ee2f066a;
    stim[36] = 101'h0bc3a62105d50133ce5220c534;
    stim[37] = 101'h00ff984e3c28cf13420ab66f65;
    stim[38] = 101'h0ef5fe6ae28941788256d0ea6e;
    stim[39] = 101'h09c305a5632fa6f02a1dd1db23;
    stim[40] = 101'h01c202cb59155c8cb93bf3d9b9;
    stim[41] = 101'h0affd564a34df258bcbce65dbc;
    stim[42] = 101'h0e9f0d6372bb98086983996c50;
    stim[43] = 101'h07fce3cee40a0e1f0f55664463;
    stim[44] = 101'h0d764a848c83ec994fd1a03f17;
    stim[45] = 101'h0a9f356dc9f8cb8e4f9b8e497c;
    stim[46] = 101'h074d545cea7f4d5571e2ca8980;
    stim[47] = 101'h00c3f219ce1b46fce8aa5c598e;
    stim[48] = 101'h0e5474778fb97460b1efc517db;
    stim[49] = 101'h09d72a8e3da8048f4bf8433c4c;
    stim[50] = 101'h01ffa359aa3f984f85d1c0a3cc;
    stim[51] = 101'h0b319073bc5794a140e1fcdf30;
    stim[52] = 101'h0c034fa0d1f59a88392805d6e9;
    stim[53] = 101'h0d17de700e0cbc1dfbd2c2f260;
    stim[54] = 101'h0165a6b1f3604b148424e33d67;
    stim[55] = 101'h02c7dde050457cf2bd7e0a3bf8;
    stim[56] = 101'h0f8db2a6c1b66a3a27ef59772c;
    stim[57] = 101'h09a7c0b1d9f7a04f18549a275e;
    stim[58] = 101'h00b9464ed038e54575f9c351ad;
    stim[59] = 101'h0007454d05bf7a1030e7717120;
    stim[60] = 101'h0c9c0fcd1f42caed8a64e5fa1a;
    stim[61] = 101'h0cc359920e9d96d323d0d2d7f1;
    stim[62] = 101'h036f1857947f991600a4f04841;
    stim[63] = 101'h0c68bdaf9b38b2c86dc10e1ed7;
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
      expv[0] = 104'h00000000000000003c00000000;
      expv[1] = 104'h00000000000000003c00000000;
      expv[2] = 104'h00000000000000003c00000000;
      expv[3] = 104'h00000000000000003c00000000;
      expv[4] = 104'h80000000000000003c00000000;
      expv[5] = 104'h80000000000000003c00000000;
      expv[6] = 104'h00000000000000003c00000000;
      expv[7] = 104'h80000000000000003c00000000;
      expv[8] = 104'h00000000000000003c00000000;
      expv[9] = 104'h000000004ad6a2cefc6e0b0257;
      expv[10] = 104'h800000004ad6a2cefc6e0b0257;
      expv[11] = 104'h800000004ad6a2cefc6e0b0257;
      expv[12] = 104'h0000000052f09bb97d974635c3;
      expv[13] = 104'h8000000052f09bb97d974635c3;
      expv[14] = 104'h0000000052f09bb97d974635c3;
      expv[15] = 104'h8000000052f09bb97d974635c3;
      expv[16] = 104'h0000000052f09bb93f9c7e3263;
      expv[17] = 104'h7311d35dd2f09bb93f9c7e3260;
      expv[18] = 104'h7311d35dd2f09bb93f9c7e3260;
      expv[19] = 104'h7311d35dd2f09bb93f9c7e3260;
      expv[20] = 104'h7311d35db0892287ffe7a5d27f;
      expv[21] = 104'h7311d35db0892287bfe7a5d27c;
      expv[22] = 104'h7311d35d90f84cc1fe140b264f;
      expv[23] = 104'h7311d35d90f84cc1fe140b264f;
      expv[24] = 104'h00000000000000003c00000000;
      expv[25] = 104'h00000000000000003c00000000;
      expv[26] = 104'h000000001a3f4bca7e9f34a88b;
      expv[27] = 104'h000000001a3f4bca7e9f34a88b;
      expv[28] = 104'h000000001a3f4bca7e9f34a88b;
      expv[29] = 104'h000000001a3f4bca7e9f34a88b;
      expv[30] = 104'h000000001a3f4bca7e9f34a88b;
      expv[31] = 104'h000000001a3f4bca7e9f34a88b;
      expv[32] = 104'h000000001a3f4bca7e9f34a88b;
      expv[33] = 104'h000000001a3f4bca3e9f34a888;
      expv[34] = 104'h000000001a3f4bca3e9f34a888;
      expv[35] = 104'h00000000459ae7327c34f75223;
      expv[36] = 104'h80000000459ae7327c34f75223;
      expv[37] = 104'h00000000459ae7327c34f75223;
      expv[38] = 104'h80000000459ae7327c34f75223;
      expv[39] = 104'h80000000459ae7327c34f75223;
      expv[40] = 104'h80000000459ae7327c34f75223;
      expv[41] = 104'h80000000459ae7327c34f75223;
      expv[42] = 104'h00000000459ae7323effd564a3;
      expv[43] = 104'h00000000459ae7323effd564a3;
      expv[44] = 104'h55599118c59ae7323effd564a0;
      expv[45] = 104'h55599118c59ae7323d764a848f;
      expv[46] = 104'hd5599118c59ae7323d764a848f;
      expv[47] = 104'hd5599118c59ae7323d764a848f;
      expv[48] = 104'h55599118c59ae7323d764a848f;
      expv[49] = 104'h55599118f72e8c167e5474778f;
      expv[50] = 104'h55599118f72e8c167e5474778f;
      expv[51] = 104'h55599118f72e8c167e5474778f;
      expv[52] = 104'h55599118f72e8c167e5474778f;
      expv[53] = 104'h55599118f72e8c163e5474778c;
      expv[54] = 104'h55599118f72e8c163e5474778c;
      expv[55] = 104'hd5599118f72e8c163e5474778c;
      expv[56] = 104'h55599118f72e8c163e5474778c;
      expv[57] = 104'h55599118b6cd4744ff8db2a6c3;
      expv[58] = 104'hd5599118b6cd4744ff8db2a6c3;
      expv[59] = 104'h55599118b6cd4744ff8db2a6c3;
      expv[60] = 104'h55599118b6cd4744ff8db2a6c3;
      expv[61] = 104'h55599118e8595db17c9c0fcd1f;
      expv[62] = 104'hd5599118e8595db17c9c0fcd1f;
      expv[63] = 104'hd5599118e8595db17c9c0fcd1f;
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
