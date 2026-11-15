// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143025 dut (
    .user_clk(clk),
    .trn_rd(in_vec[86:23]),
    .trn_rsof(in_vec[22:22]),
    .trn_reof(in_vec[21:21]),
    .trn_rsrc_rdy(in_vec[20:20]),
    .trn_rsrc_dsc(in_vec[19:19]),
    .trn_rrem(in_vec[18:11]),
    .trn_rerrfwd(in_vec[10:10]),
    .trn_rbar_hit(in_vec[9:3]),
    .trn_recrc_err(in_vec[2:2]),
    .user_rst(in_vec[1:1]),
    .m_axis_rx_tready(in_vec[0:0]),
    .m_axis_rx_tdata(out_vec[104:41]),
    .m_axis_rx_tvalid(out_vec[40:40]),
    .m_axis_rx_tkeep(out_vec[39:32]),
    .m_axis_rx_tlast(out_vec[31:31]),
    .m_axis_rx_tuser(out_vec[30:9]),
    .trn_rdst_rdy(out_vec[8:8]),
    .np_counter(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h30000739e4cc278c39105e;
    stim[1] = 87'h4f412bd2a0da5d1026e7f3;
    stim[2] = 87'h7303e9327dfb75f9f1fcb0;
    stim[3] = 87'h4fa9cac1025b9b208f9110;
    stim[4] = 87'h516e63982a75e218350369;
    stim[5] = 87'h57780be5a0e928b1ec3bd8;
    stim[6] = 87'h0811e4d9b7d8db94e4002c;
    stim[7] = 87'h213dcbac8e7e0f6278d8ed;
    stim[8] = 87'h478d01022a365f0fba33f5;
    stim[9] = 87'h33fab3756f016428d91bf8;
    stim[10] = 87'h7e66d9cacabd9d5eeadb1d;
    stim[11] = 87'h0177c14049f530404a2ab0;
    stim[12] = 87'h1d468308fb9a312f005928;
    stim[13] = 87'h4281fcb7d62cffe6d68aeb;
    stim[14] = 87'h6cd718e3fcd8b289b08784;
    stim[15] = 87'h231d2a9cafed777398f5e8;
    stim[16] = 87'h2467d5877b8fac0d77f624;
    stim[17] = 87'h3e5a4885595580560991e1;
    stim[18] = 87'h53a1d03a0e5336bd73e0bc;
    stim[19] = 87'h2d87eb9df369ae02e44219;
    stim[20] = 87'h2056d00ecf9a80e8c15a35;
    stim[21] = 87'h25fbb3dda48748c1a1a29d;
    stim[22] = 87'h5e6511bb0770836a1fe5e5;
    stim[23] = 87'h33cd5a2d46489bfc43e98c;
    stim[24] = 87'h50ff699eca640acee1fc34;
    stim[25] = 87'h6b54c0f3c64f5e0ff6a541;
    stim[26] = 87'h1348585733e4769641cdad;
    stim[27] = 87'h41a7fa5e892f29b8674e9d;
    stim[28] = 87'h2a1ae30755156abde53b7c;
    stim[29] = 87'h587614c851e4879d704a31;
    stim[30] = 87'h7bf06a007d8941b5db6528;
    stim[31] = 87'h6c3cbd9365f4edc589711d;
    stim[32] = 87'h2902c789af7c69bea17b65;
    stim[33] = 87'h31d8da4c5be4cfd8dc4b31;
    stim[34] = 87'h4c6cd5c0066b86df2c9c4c;
    stim[35] = 87'h57d79d3ef0854a30ec5d4c;
    stim[36] = 87'h5c5e8476fb94a4418943e5;
    stim[37] = 87'h52bc6b851503e698afca40;
    stim[38] = 87'h7039bb6bd7802a3034d679;
    stim[39] = 87'h3e93ceb70565a6bcd305b9;
    stim[40] = 87'h03b63af485be7ec92ebe59;
    stim[41] = 87'h1bc320dfd75012e2d87af5;
    stim[42] = 87'h18b8aca30d7b962e737755;
    stim[43] = 87'h6059848a9c130291a39724;
    stim[44] = 87'h67183cb5463a3140723754;
    stim[45] = 87'h494be4f5080926521b9d54;
    stim[46] = 87'h727486ff620c642587b57c;
    stim[47] = 87'h4c7277617a1c33cfa10125;
    stim[48] = 87'h7208fdb715f171300804f1;
    stim[49] = 87'h2a61536510b6246b741411;
    stim[50] = 87'h062e75963e9849465a687c;
    stim[51] = 87'h38327a79ba560a205d33e4;
    stim[52] = 87'h1420d91295e28dbfd7cdd9;
    stim[53] = 87'h4c5f0471e6ee238f989459;
    stim[54] = 87'h428c95e5580088361de04d;
    stim[55] = 87'h269887234f869ca5390e90;
    stim[56] = 87'h1a0d1f5cbbcb251855d855;
    stim[57] = 87'h1b709b91f09037125e2fe5;
    stim[58] = 87'h015af4cf9583c44991d830;
    stim[59] = 87'h4db0f7d1a18a67098e00e9;
    stim[60] = 87'h4a479b02302dc389ea13d1;
    stim[61] = 87'h4c4b78457344343ba19261;
    stim[62] = 87'h7c408454710038b50bdaf1;
    stim[63] = 87'h380a1b75dfbdb92af292d5;
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
      expv[0] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxx00;
      expv[2] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxx00;
      expv[3] = 105'h1cc0fa4c9f7edd7e7ff4b000101;
      expv[4] = 105'h1cc0fa4c9f7edd7e6ff4b000101;
      expv[5] = 105'h1cc0fa4c9f7edd7e6a0cb000101;
      expv[6] = 105'h1cc0fa4c9f7edd7e6a0cb000101;
      expv[7] = 105'h1cc0fa4c9f7edd7e6a0cb000101;
      expv[8] = 105'h1cc0fa4c9f7edd7e6a04b000101;
      expv[9] = 105'h1cc0fa4c9f7edd7e6a04b000101;
      expv[10] = 105'h0cfeacdd5bc0590a3ff3f800101;
      expv[11] = 105'h0cfeacdd5bc0590a2ff3f800101;
      expv[12] = 105'h0cfeacdd5bc0590a2ff3f800101;
      expv[13] = 105'h0cfeacdd5bc0590a2ff3f800101;
      expv[14] = 105'h0cfeacdd5bc0590a2ff3f800100;
      expv[15] = 105'h0cfeacdd5bc0590a2ff3f800100;
      expv[16] = 105'h0cfeacdd5bc0590a2ff3f800100;
      expv[17] = 105'h0919f561dee3eb035ff62400101;
      expv[18] = 105'h0919f561dee3eb034ff62400101;
      expv[19] = 105'h0919f561dee3eb0347ce2400102;
      expv[20] = 105'h0919f561dee3eb0347c62400102;
      expv[21] = 105'h0919f561dee3eb0347c62400102;
      expv[22] = 105'h0919f561dee3eb0347c62400102;
      expv[23] = 105'h0919f561dee3eb0347c62400102;
      expv[24] = 105'h0919f561dee3eb0347c62400102;
      expv[25] = 105'h0919f561dee3eb0347c62400102;
      expv[26] = 105'h1ad5303cf193d783fff54000103;
      expv[27] = 105'h1ad5303cf193d783eff54000103;
      expv[28] = 105'h1ad5303cf193d783eff54000103;
      expv[29] = 105'h1ad5303cf193d783eff54000103;
      expv[30] = 105'h1ad5303cf193d783e09d4000104;
      expv[31] = 105'h1ad5303cf193d783e09d4000104;
      expv[32] = 105'h1ad5303cf193d783e0954000104;
      expv[33] = 105'h1ad5303cf193d783e0954000104;
      expv[34] = 105'h0c76369316f933f63ff33000104;
      expv[35] = 105'h0c76369316f933f62ff33000104;
      expv[36] = 105'h0c76369316f933f62ff33000104;
      expv[37] = 105'h0c76369316f933f62ff33000104;
      expv[38] = 105'h0c76369316f933f62ff33000104;
      expv[39] = 105'h0c76369316f933f629ab3000104;
      expv[40] = 105'h0c76369316f933f629a33000105;
      expv[41] = 105'h0c76369316f933f629a33000105;
      expv[42] = 105'h06f0c837f5d404b8bff2f400105;
      expv[43] = 105'h06f0c837f5d404b8b6eaf400106;
      expv[44] = 105'h06f0c837f5d404b8b6eaf400106;
      expv[45] = 105'h06f0c837f5d404b8b6eaf400107;
      expv[46] = 105'h06f0c837f5d404b8b6eaf400107;
      expv[47] = 105'h06f0c837f5d404b8b6eaf400107;
      expv[48] = 105'h06f0c837f5d404b8a6e2f400107;
      expv[49] = 105'h06f0c837f5d404b8a6e2f400107;
      expv[50] = 105'h0a9854d9442d891adff41000108;
      expv[51] = 105'h018b9d658fa612519ff41000108;
      expv[52] = 105'h0e0c9e9e6e9582881ff41000108;
      expv[53] = 105'h05083644a578a36ffff41000109;
      expv[54] = 105'h1317c11c79bb88e3fff41000109;
      expv[55] = 105'h10a325795600220d9ff41000109;
      expv[56] = 105'h10a325795600220d921c1000109;
      expv[57] = 105'h10a325795600220d8214100010a;
      expv[58] = 105'h06dc26e47c240dc49ff7e40010a;
      expv[59] = 105'h0056bd33e560f1127ff7e40010a;
      expv[60] = 105'h0056bd33e560f1126ff7e40010a;
      expv[61] = 105'h0056bd33e560f1126ff7e40010a;
      expv[62] = 105'h0056bd33e560f1126ff7e40010a;
      expv[63] = 105'h0056bd33e560f1126ff7e40010a;
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
