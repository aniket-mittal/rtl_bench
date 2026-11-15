// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11351 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h2880c3e68e29d4e092b5af434ba8c9b;
    stim[1] = 122'h2edc47216a3ee3a148b22bca1956b1e;
    stim[2] = 122'h256b4f3294b3571fe2596d0b3d5938d;
    stim[3] = 122'h2267ce32d09c0079cbc41f35f3cc18b;
    stim[4] = 122'h1adc7dc8e1df2db1435fa439f3a1144;
    stim[5] = 122'h16524fbc5938e9835aff01fd529118a;
    stim[6] = 122'h00d7664b920b426954c80a31be3f95f;
    stim[7] = 122'h299ecf93617d0d5437599995b86e31c;
    stim[8] = 122'h1cc4a13f59220e73334deaf25f18186;
    stim[9] = 122'h3335fda838b3b6002a7cbd409f7de6a;
    stim[10] = 122'h020bf670f7d003a9afcdb6298f37deb;
    stim[11] = 122'h19dbef196f90f6232df71ecedc27ed2;
    stim[12] = 122'h11ac27635ac595ee53d42a0874f8d47;
    stim[13] = 122'h2cd4720e1fe1af5688eb05498258006;
    stim[14] = 122'h03be5e987b808a0b70f6bbc9f49d4f4;
    stim[15] = 122'h2d7673961e017282a9794988894685d;
    stim[16] = 122'h10068c9c6997fa60cbe84a2ba951cfe;
    stim[17] = 122'h0f34ff7346053456c1cca77f67e0085;
    stim[18] = 122'h3ec7fda8a0260c122f4166e26f45f8e;
    stim[19] = 122'h1c91f3260856e0dedfd4854678f6654;
    stim[20] = 122'h3db89818b334972445cf2b88a692fe8;
    stim[21] = 122'h1c27720483b57a4a2a5545c6841d876;
    stim[22] = 122'h28770b3566be354a58df7f0dd82a8df;
    stim[23] = 122'h1be38764da01a0041c0f3a0dc493f06;
    stim[24] = 122'h33bbf9b208144524c3b52ab795bba17;
    stim[25] = 122'h2082f166227c0fc77cd1c196aaf3ec7;
    stim[26] = 122'h316f2aca69e820db1355fa4fd9e0ec7;
    stim[27] = 122'h334ce0e18b73e330e7c46c7665df99b;
    stim[28] = 122'h2ba97958d5a543f33edfac3def630a8;
    stim[29] = 122'h3a1f5e09bc620c78313eb52faa30de6;
    stim[30] = 122'h1ed4bd9c2044157100fb434b2396696;
    stim[31] = 122'h12646aede72fabde6566c71ab49b4e3;
    stim[32] = 122'h389702eb2f2c6e15e965f02c9bcbb51;
    stim[33] = 122'h364d5f256bc6193ba0567aa7915e3ca;
    stim[34] = 122'h3e5c353059d76b6c5451055b9db4b01;
    stim[35] = 122'h17e20eae16de4cbc456d9ddb7da29b2;
    stim[36] = 122'h0dcb1c4912320832604228b3772e762;
    stim[37] = 122'h1107a41be733fb3dbd574555141c5c3;
    stim[38] = 122'h11518da1461f2d5f69e4be252f3e6c1;
    stim[39] = 122'h36e7fb9035132a606168a831623cd83;
    stim[40] = 122'h390b587d46ca880226dfba1fec3681c;
    stim[41] = 122'h11b9dec591d2ffbcdac9780f89c1912;
    stim[42] = 122'h0db1045ea1d7ae293be95a456e598a6;
    stim[43] = 122'h28c596749cc259c4ede6c5be5ea7fe0;
    stim[44] = 122'h10504688ccd0d1e4bb6122dd264786a;
    stim[45] = 122'h040cdc17063b7f678058c1b13d12a37;
    stim[46] = 122'h2593af9829d85d92ff51078338dc9ec;
    stim[47] = 122'h37138d0d62976067a954397b1dede8f;
    stim[48] = 122'h3e66980b3fe168c8eee3f0084ace45a;
    stim[49] = 122'h2e77f6eaae37fd104ddf1d609140f2b;
    stim[50] = 122'h1bb78b1ac9cf7ebf4f48a86680361e6;
    stim[51] = 122'h2d10e82843735c54adfafbef4af2ec1;
    stim[52] = 122'h003643f0f8ea86981ad600857a164fa;
    stim[53] = 122'h2286ed0b020c96aa4e64ad80b10f6e4;
    stim[54] = 122'h2aa6bfb9c7a69cce56e69149fe886b9;
    stim[55] = 122'h20db8f8d6347a6b475e1a6171ce01c0;
    stim[56] = 122'h0c3eea6153666f2dbcfeab46bbfd4ec;
    stim[57] = 122'h00d81a9d77eb1f3b6d56621df3b7949;
    stim[58] = 122'h27ab9576161e2f5883e448133a50eb6;
    stim[59] = 122'h25f9fb4f9a15b030e74ec748f7bb84a;
    stim[60] = 122'h0b962106d9b7ef1ccb5f990741533ed;
    stim[61] = 122'h322672495f0428bd1b4edfb80d3fc5f;
    stim[62] = 122'h20a3fa634f4a6e4e1b730a361c3a464;
    stim[63] = 122'h319563e74900f341454d0fbb4f43cde;
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
      expv[0] = 53'h17a1a5d464aa54;
      expv[1] = 53'h15e50cab58a6d8;
      expv[2] = 53'h16859eac9c41de;
      expv[3] = 53'h0f9af9e60c441b;
      expv[4] = 53'h121cf9d08a413f;
      expv[5] = 53'h00fea9488c2d52;
      expv[6] = 53'h0518df1fcae897;
      expv[7] = 53'h0ccadc3718c1de;
      expv[8] = 53'h15792f8c0c5807;
      expv[9] = 53'h1ea04fbef31648;
      expv[10] = 53'h1b14c79bef540b;
      expv[11] = 53'h0f676e13f69629;
      expv[12] = 53'h15043a7c6a4a35;
      expv[13] = 53'h02a4c12c00241b;
      expv[14] = 53'h1de4fa4ea7a13f;
      expv[15] = 53'h04c444a34282dc;
      expv[16] = 53'h0515d4a8e7849b;
      expv[17] = 53'h13bfb3f004401f;
      expv[18] = 53'h137137a2fc548b;
      expv[19] = 53'h02a33c7b32c13f;
      expv[20] = 53'h15c453497f401f;
      expv[21] = 53'h02e3420ec3d629;
      expv[22] = 53'h1f86ec1546eed0;
      expv[23] = 53'h1d06e249f80c13;
      expv[24] = 53'h155bcaddd0823d;
      expv[25] = 53'h00cb5579f67e21;
      expv[26] = 53'h1d27ecf0764a35;
      expv[27] = 53'h163b32efccd00f;
      expv[28] = 53'h161ef7b185615e;
      expv[29] = 53'h1a97d5186f1a25;
      expv[30] = 53'h01a591cb34a13f;
      expv[31] = 53'h038d5a4da7100f;
      expv[32] = 53'h18164de5da801f;
      expv[33] = 53'h1d53c8af1e514e;
      expv[34] = 53'h02adceda58423d;
      expv[35] = 53'h0eedbed14d801f;
      expv[36] = 53'h1459bb973b500f;
      expv[37] = 53'h02aa8a0e2e5d23;
      expv[38] = 53'h1f12979f36001f;
      expv[39] = 53'h1418b11e6c100f;
      expv[40] = 53'h1d0ff61b40e2dc;
      expv[41] = 53'h1c07c4e0c8ec13;
      expv[42] = 53'h0d22b72cc51c03;
      expv[43] = 53'h02df2f53ff001f;
      expv[44] = 53'h116e9323c31c03;
      expv[45] = 53'h00d89e8951c23d;
      expv[46] = 53'h03c19c6e4f42dc;
      expv[47] = 53'h1cbd8ef6f456c8;
      expv[48] = 53'h1804256722b40b;
      expv[49] = 53'h0eb048a0794658;
      expv[50] = 53'h1433401b0f441b;
      expv[51] = 53'h1df7a57976023d;
      expv[52] = 53'h0042bd0b27ed52;
      expv[53] = 53'h16c05887b7001f;
      expv[54] = 53'h08a4ff4435a01f;
      expv[55] = 53'h130b8e700e001f;
      expv[56] = 53'h15a35dfea721de;
      expv[57] = 53'h110ef9dbca425c;
      expv[58] = 53'h04099d2875801f;
      expv[59] = 53'h03a47bddc2500f;
      expv[60] = 53'h0c83a0a99f41de;
      expv[61] = 53'h0fdc069fe2cc93;
      expv[62] = 53'h051b0e1d23013f;
      expv[63] = 53'h07dda7a1e6c09f;
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
