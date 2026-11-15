// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 144;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215824 dut (
    .clk(clk),
    .ir(in_vec[143:128]),
    .rf_d2(in_vec[127:112]),
    .reg_data_form_id_112(in_vec[111:0]),
    .reg_index_la_sa(out_vec[24:22]),
    .reg_index_lm_sm(out_vec[21:19]),
    .freeze(out_vec[18:18]),
    .reg_or_mem_enable(out_vec[17:17]),
    .mem_data_for_sa_sm(out_vec[16:1]),
    .nop_mux_select(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 144'h4ffe0559c4b7d8f9bb8c25cea212170b7ea9;
    stim[1] = 144'ha0f3762e5524e5abd6f81e8dfbe67dc33112;
    stim[2] = 144'hd071c406f945acd80971e4bf2d662e84b1e0;
    stim[3] = 144'hf2413ca3926d44ef411c9dcb5ac332a6e272;
    stim[4] = 144'hd433d963beef0d111f14009ff3f72458240f;
    stim[5] = 144'h63485061c1c369b1bbf6fd0a52231f9c37ff;
    stim[6] = 144'h2e3e3924842ff9807b0f93f87d4bf2a1b581;
    stim[7] = 144'h006c576bd0bfcabfa4df1ce1290b138f6730;
    stim[8] = 144'h6b948339c757ae9a7e057481d257ece493d3;
    stim[9] = 144'h0670907f877e9d71b4a5302db98dd115537f;
    stim[10] = 144'had3bd2f591f8e8cb9f245ef864ac15409118;
    stim[11] = 144'hd78e82fbf5b6cd8c18f97877721a6173647b;
    stim[12] = 144'h43d7b9a6d3cdfc2475197051e7d0ec4b72fa;
    stim[13] = 144'heb9241ba47fecf8d80a1de8813978dbb1c8d;
    stim[14] = 144'h995e84154f1cb809275b577fd8577ae12cd1;
    stim[15] = 144'hf1523afb61e79b546f9c36f38fdd0524cba0;
    stim[16] = 144'h8203f4eda710cfbe7f888472e6452b82dee2;
    stim[17] = 144'h643a4bc553e648bd3cd261f3b2db9a89fb11;
    stim[18] = 144'hbd8149f6f0fd52b4891e74ff122cf8adfdd6;
    stim[19] = 144'h30aac19a1c16522a1c90d8425133adbb2cf1;
    stim[20] = 144'h05bf71e8ea60ac90f8742918376eabe0fe6b;
    stim[21] = 144'he7c85dad9a83e451324c9d5f63c3b25210f3;
    stim[22] = 144'hd8bd82313fb4a168dc975f665a9982bd1aa5;
    stim[23] = 144'h03b9650ffe6960da09602f05f809d6b10329;
    stim[24] = 144'h35d4ed1608cc9c4e257ba8d5b81e162f9578;
    stim[25] = 144'haa6164fd52375c18215ab523b29d6b381a8b;
    stim[26] = 144'h8b19e3c09ab84d3a2a8a01c1c0b4e1f42392;
    stim[27] = 144'h58b8547ba25b798e10153f40e618a24b3036;
    stim[28] = 144'h530bf523d4337ebe1fa19e6895e024e96fa3;
    stim[29] = 144'h3e4af5f120250e91eb052efda120d25d4633;
    stim[30] = 144'h19b33a21548244a044333620f01e0e1c0ac7;
    stim[31] = 144'h09f95b542f7adfc21793e35f9ed1a3fab12f;
    stim[32] = 144'h9c94f8f8016c3f6596d6a96dcc5d9e60fbe3;
    stim[33] = 144'he2aede089bcd3176f1fedc9a51c99c1b4dfe;
    stim[34] = 144'h2b8ff4b51fd45f4285d86fa39a755c00982d;
    stim[35] = 144'ha7bc7d188899266f17c156a2a302ba9c887e;
    stim[36] = 144'h8530d425c176ed45d3887e28262511ae501d;
    stim[37] = 144'he632f7c9436d1eee7cc9c433adf1164f7c62;
    stim[38] = 144'h30ec9ec606ac8848b6df2191ee5ef3176dfd;
    stim[39] = 144'ha9c64cdf36852c2897a7f36b8b94436f1b43;
    stim[40] = 144'h0992758a8cec14329c8314cef4620cffb1cc;
    stim[41] = 144'hb6b61ea05ebdbad42a50ccf121d2eed8c6ac;
    stim[42] = 144'ha3948da63b02c5cc2c66458ee26d55d75e93;
    stim[43] = 144'hcb17e659927097793c93db35941cc4816c20;
    stim[44] = 144'h7e40a086bd5605b1d87627ac145d8938bec5;
    stim[45] = 144'hb5636b0d9e54a051caa1e7313bd37d064d71;
    stim[46] = 144'ha2cf4374be17e4bf654bcbcf8bcf4a6cef0f;
    stim[47] = 144'h255fe7a773f1bccabbf125b3999d1b97bd0b;
    stim[48] = 144'hdcc88210e97d586c4699982e5adc3828bf1d;
    stim[49] = 144'he79eb449f17f142a0be316c66382ce3d847f;
    stim[50] = 144'h03ba6e1fc2bace84474f7789b73cdb639a4a;
    stim[51] = 144'heca0d1928cf0a60d13b47e3ccf2239e3ffad;
    stim[52] = 144'h2c811f54f17e16523bc5dedbc34244b03acc;
    stim[53] = 144'h6343431b84a4a759f0836549e1c5e6f40a43;
    stim[54] = 144'h27745ed6be6e91e1d27b7c137dd1f0bead37;
    stim[55] = 144'hd719fa8b75ef2c9434819dfe8703a491f482;
    stim[56] = 144'hcb0091b647de7122891560919bc08ddc54e6;
    stim[57] = 144'h52d12067f7220ad9f24d752041a88a2981d3;
    stim[58] = 144'h72067d6ab7377c9620abf3c235b2a87df140;
    stim[59] = 144'h2629bd7538cb831db45dcb2763d033352fbd;
    stim[60] = 144'hc008b638c3d4653a8dbe0c3b3ffdc3e23a19;
    stim[61] = 144'h5013a5e4a859089208fd95fd71ea44be7334;
    stim[62] = 144'hd38f5694536c56fb236d853cb966f0d207bc;
    stim[63] = 144'h720d1ae091dada1edfed98cd1ce9825ee461;
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
      expv[0] = 25'h0000001;
      expv[1] = 25'h0460ab2;
      expv[2] = 25'h0000001;
      expv[3] = 25'h00d63c0;
      expv[4] = 25'h0000001;
      expv[5] = 25'h00c481e;
      expv[6] = 25'h0000000;
      expv[7] = 25'h0000000;
      expv[8] = 25'h0000000;
      expv[9] = 25'h0000000;
      expv[10] = 25'h0000000;
      expv[11] = 25'h0000001;
      expv[12] = 25'h00cc8f7;
      expv[13] = 25'h04f734c;
      expv[14] = 25'h0000000;
      expv[15] = 25'h0000000;
      expv[16] = 25'h0000000;
      expv[17] = 25'h0000000;
      expv[18] = 25'h0000000;
      expv[19] = 25'h0000000;
      expv[20] = 25'h0000000;
      expv[21] = 25'h0000000;
      expv[22] = 25'h0000001;
      expv[23] = 25'h00c354a;
      expv[24] = 25'h0000000;
      expv[25] = 25'h0000000;
      expv[26] = 25'h0000000;
      expv[27] = 25'h0000001;
      expv[28] = 25'h044a8f7;
      expv[29] = 25'h085ea46;
      expv[30] = 25'h0000000;
      expv[31] = 25'h0000000;
      expv[32] = 25'h0000000;
      expv[33] = 25'h0000000;
      expv[34] = 25'h0000000;
      expv[35] = 25'h0000000;
      expv[36] = 25'h0000000;
      expv[37] = 25'h0000000;
      expv[38] = 25'h0000000;
      expv[39] = 25'h0000000;
      expv[40] = 25'h0000000;
      expv[41] = 25'h0000000;
      expv[42] = 25'h0000000;
      expv[43] = 25'h0000001;
      expv[44] = 25'h00ed840;
      expv[45] = 25'h0000000;
      expv[46] = 25'h0000000;
      expv[47] = 25'h0000000;
      expv[48] = 25'h0000001;
      expv[49] = 25'h00d7e3a;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h0000000;
      expv[54] = 25'h0000000;
      expv[55] = 25'h0000001;
      expv[56] = 25'h00de905;
      expv[57] = 25'h016a9cd;
      expv[58] = 25'h05440ce;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000001;
      expv[61] = 25'h00e7433;
      expv[62] = 25'h04d4bc9;
      expv[63] = 25'h0540f78;
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
