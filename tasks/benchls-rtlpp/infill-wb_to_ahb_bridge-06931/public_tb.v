// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 113;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06931 dut (
    .clk_i(clk),
    .rst_n_i(in_vec[110:110]),
    .from_m_wb_adr_o(in_vec[109:78]),
    .from_m_wb_sel_o(in_vec[77:74]),
    .from_m_wb_we_o(in_vec[73:73]),
    .from_m_wb_dat_o(in_vec[72:41]),
    .from_m_wb_cyc_o(in_vec[40:40]),
    .from_m_wb_stb_o(in_vec[39:39]),
    .from_m_wb_cti_o(in_vec[38:36]),
    .from_m_wb_bte_o(in_vec[35:34]),
    .mHRDATA(in_vec[33:2]),
    .mHRESP(in_vec[1:1]),
    .mHREADY(in_vec[0:0]),
    .to_m_wb_ack_i(out_vec[112:112]),
    .to_m_wb_err_i(out_vec[111:111]),
    .to_m_wb_dat_i(out_vec[110:79]),
    .mHSEL(out_vec[78:78]),
    .mHSIZE(out_vec[77:75]),
    .mHREADYOUT(out_vec[74:74]),
    .mHWRITE(out_vec[73:73]),
    .mHBURST(out_vec[72:70]),
    .mHADDR(out_vec[69:38]),
    .mHTRANS(out_vec[37:36]),
    .mHWDATA(out_vec[35:4]),
    .mHPROT(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h5b04f1d79216ce627d0b9eac9cf4;
    stim[1] = 111'h5804eb850f1fc8ceb65144e93435;
    stim[2] = 111'h162a0a592e9ffd90b955b76125c7;
    stim[3] = 111'h093f000fac4124d7a4166131e7f7;
    stim[4] = 111'h0ca74d5097c996af5118ca677571;
    stim[5] = 111'h2f2827febe8c77041696dd96345b;
    stim[6] = 111'h054a383c5bc742af725fc8095098;
    stim[7] = 111'h02c2d9343de11c89f4766fc82ac2;
    stim[8] = 111'h2c254087136bce6f8d9b9e14ba66;
    stim[9] = 111'h28d4893a40a57080c31e95b4ab7d;
    stim[10] = 111'h04184253cfbae69c1bc94ab9038d;
    stim[11] = 111'h0da94889952601ad11cef3b5a9e2;
    stim[12] = 111'h3df944a551af16694654f46e1bf8;
    stim[13] = 111'h3b512b4af8d3fdfd444f5da0ccae;
    stim[14] = 111'h0e5f3be3b4826ee80a34dec77c03;
    stim[15] = 111'h331b452c1349f60c2609827a8e89;
    stim[16] = 111'h1f7753e6fac3775f43f2af5da78a;
    stim[17] = 111'h2cfb2d7c394cdb7ec6f1951110a3;
    stim[18] = 111'h2781feaf347bf2e96a81a8c91bb6;
    stim[19] = 111'h3cedb0001ff37992730f83a5076c;
    stim[20] = 111'h030061943e473eb191971bff1454;
    stim[21] = 111'h19033ad613c0884b578078969193;
    stim[22] = 111'h2a7ecddd1259986a19f9f4f75d62;
    stim[23] = 111'h0f9d578752af76917eefa0bae805;
    stim[24] = 111'h0954723f0b7965a48ff8912d73e8;
    stim[25] = 111'h1677d6b04aa6887fdeb10cce9e90;
    stim[26] = 111'h114a85e67ea64c407364327707cd;
    stim[27] = 111'h2dbc8403b7c8f5201161205f6e8e;
    stim[28] = 111'h251bfa493d01b2b4f53505407985;
    stim[29] = 111'h232865cfa78077a7a56ba730aa2a;
    stim[30] = 111'h143ddabdfaca1a2e06b251e1cedc;
    stim[31] = 111'h3e6acbaf18be9cccd5d2da821d39;
    stim[32] = 111'h15e279a689ed11948ce64ba7f330;
    stim[33] = 111'h2e0292fe567d1534e649abbe60fa;
    stim[34] = 111'h32daf5bcbdd0d493c228b411699e;
    stim[35] = 111'h166001496ad57df385aea019f523;
    stim[36] = 111'h221ce9996a1279df8a6071e6be27;
    stim[37] = 111'h30b2a42be60a9a5719ba3487d97a;
    stim[38] = 111'h1f912b1cedecde5a154e890d8810;
    stim[39] = 111'h01cf3c358c70e66bf40f40d823ac;
    stim[40] = 111'h3b243a7c13186ed1c6d54dad3326;
    stim[41] = 111'h11cd797010658184d6cb9dbaf156;
    stim[42] = 111'h17e64af939804a4dc49039a62771;
    stim[43] = 111'h3f2303877b4b9f359266993c8bcc;
    stim[44] = 111'h20eecd8a83e97c944d66ff0fa219;
    stim[45] = 111'h104837400c902baf0067f9667dc9;
    stim[46] = 111'h3c2b75c9a7b8c8a93fba72326c8f;
    stim[47] = 111'h0747a17d73cbe146ecc06e7d9c32;
    stim[48] = 111'h2cab3eb19119bfb4a9d38d26cb9a;
    stim[49] = 111'h3b50aa5989b33112257baedd9ce2;
    stim[50] = 111'h1b955dd889369f51915d9fe03fea;
    stim[51] = 111'h08f4e359588e63414ab72838153c;
    stim[52] = 111'h27176109f008a578be78cb556d01;
    stim[53] = 111'h26dead1cec2b4e44905750148d6b;
    stim[54] = 111'h333807e296ee5e0a3f1070c5361b;
    stim[55] = 111'h159ad05bee778197efe8f892cd64;
    stim[56] = 111'h32e4e793d58f1ea62ad7d0c0c46d;
    stim[57] = 111'h33ebcc3b5f4d90cbf10943d8f778;
    stim[58] = 111'h1736898ea6ef76ff1c2f4018240e;
    stim[59] = 111'h373a59e480d2b00247a2f17e0213;
    stim[60] = 111'h1b486db427c10eab5ed12771e20e;
    stim[61] = 111'h152fb66669fdb9b3a4181397a57e;
    stim[62] = 111'h3633884071cbeae464ffac2a7cc0;
    stim[63] = 111'h167ae7c1e943db87d9c4b224552c;
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
      expv[0] = 113'h073d5939ed61b04f1d780b67313ex;
      expv[1] = 113'h0289d2686961804eb8508fe4675bx;
      expv[2] = 113'h0b6ec24b8d6162a0a5904ffec85cx;
      expv[3] = 113'h0cc263cfe94093f000f820926bd2x;
      expv[4] = 113'h0194ceeae560ca74d508e4cb57a8x;
      expv[5] = 113'h0dbb2c68b162f2827fe8463b820bx;
      expv[6] = 113'h079012a1316054a383c4e3a157b9x;
      expv[7] = 113'h0cdf905581402c2d9340f08e44fax;
      expv[8] = 113'h0f3c2974cd62c2540870b5e737c6x;
      expv[9] = 113'h052b6956fd428d4893a452b84061x;
      expv[10] = 113'h029572071d604184253cdd734e0dx;
      expv[11] = 113'h0de76b53c540da9488989300d688x;
      expv[12] = 113'h01e8dc37f143df944a54d78b34a3x;
      expv[13] = 113'h0ebb41995943b512b4ac69fefea2x;
      expv[14] = 113'h09bd8ef80140e5f3be3841377405x;
      expv[15] = 113'h0304f51d116331b452c0a4fb0613x;
      expv[16] = 113'h0d5ebb4f1561f7753e6c61bbafa1x;
      expv[17] = 113'h0b2a22214142cfb2d7c0a66dbf63x;
      expv[18] = 113'h0b5192376942781feaf03df974b5x;
      expv[19] = 113'h07074a0edd63cedb0000f9bcc939x;
      expv[20] = 113'h0637fe28ad6030061940239f58c8x;
      expv[21] = 113'h08f12d2325619033ad60e04425abx;
      expv[22] = 113'h0be9eebac562a7ecddd02ccc350cx;
      expv[23] = 113'h074175d00960f9d5787457bb48bfx;
      expv[24] = 113'h01225ae7d560954723f0bcb2d247x;
      expv[25] = 113'h02199d3d2161677d6b0453443fefx;
      expv[26] = 113'h0064ee0f9d6114a85e6453262039x;
      expv[27] = 113'h0a40bedd1d62dbc84038e47a9008x;
      expv[28] = 113'h020a80f30d4251bfa49080d95a7ax;
      expv[29] = 113'h0f4e6154556232865cf8c03bd3d2x;
      expv[30] = 113'h04a3c39db96143ddabdc650d1703x;
      expv[31] = 113'h05b5043a7543e6acbaf05f4e666ax;
      expv[32] = 113'h04974fe661415e279a68f688ca46x;
      expv[33] = 113'h0b577cc1f162e0292fe43e8a9a73x;
      expv[34] = 113'h096822d339432daf5bc8e86a49e1x;
      expv[35] = 113'h0d4033ea4561660014946abef9c2x;
      expv[36] = 113'h08e3cd7c496221ce9994093cefc5x;
      expv[37] = 113'h0c690fb2f5630b2a42bc054d2b8cx;
      expv[38] = 113'h05121b102541f912b1ccf66f2d0ax;
      expv[39] = 113'h0681b04759401cf3c358387335fax;
      expv[40] = 113'h0a9b5a664963b243a7c08c3768e3x;
      expv[41] = 113'h0f3b75e2a9411cd7970032c0c26bx;
      expv[42] = 113'h00734c4ee1417e64af90c02526e2x;
      expv[43] = 113'h053279179963f2303874a5cf9ac9x;
      expv[44] = 113'h05fe1f4435620eecd8a8f4be4a26x;
      expv[45] = 113'h07f2ccfb9141048374004815d780x;
      expv[46] = 113'h0ce464d91d63c2b75c98dc64549fx;
      expv[47] = 113'h08dcfb386160747a17d4e5f0a376x;
      expv[48] = 113'h0f1a4d973542cab3eb188cdfda54x;
      expv[49] = 113'h0f5dbb39c543b50aa598d9988912x;
      expv[50] = 113'h0b3fc07fd541b955dd889b4fa8c8x;
      expv[51] = 113'h0650702a79408f4e35944731a0a5x;
      expv[52] = 113'h0196aada01427176109c0452bc5fx;
      expv[53] = 113'h0ea0291ad1426dead1cc15a72248x;
      expv[54] = 113'h08e18a6c356333807e28772f051fx;
      expv[55] = 113'h01f1259acd6159ad05bc3bc0cbf7x;
      expv[56] = 113'h07a18188d9432e4e793cc78f5315x;
      expv[57] = 113'h0287b1eef5633ebcc3b4a6c865f8x;
      expv[58] = 113'h0e8030481961736898e877bb7f8ex;
      expv[59] = 113'h0de2fc04254373a59e4869580123x;
      expv[60] = 113'h0a4ee3c41961b486db40e08755afx;
      expv[61] = 113'h08272f4af94152fb6664fedcd9d2x;
      expv[62] = 113'h075854f9814363388404e5f57232x;
      expv[63] = 113'h016448aa5d4167ae7c1ca1edc3ecx;
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
