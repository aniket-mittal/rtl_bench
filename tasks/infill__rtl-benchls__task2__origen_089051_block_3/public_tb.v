// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089051 dut (
    .ui_clk(clk),
    .rst(in_vec[132:132]),
    .rd_start(in_vec[131:131]),
    .rd_ack(in_vec[130:130]),
    .app_rdy(in_vec[129:129]),
    .app_rd_data_vld(in_vec[128:128]),
    .app_rd_data(in_vec[127:0]),
    .rd_req(out_vec[164:164]),
    .rd_done(out_vec[163:163]),
    .rd_busy(out_vec[162:162]),
    .app_cmd(out_vec[161:159]),
    .app_en(out_vec[158:158]),
    .app_addr(out_vec[157:129]),
    .rd_ddr_data_vld(out_vec[128:128]),
    .rd_ddr_data(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h10f56c77fba9bec71d99631e2580b88ccb;
    stim[1] = 133'h151dcceefdb08854857a4a93f7066a92cb;
    stim[2] = 133'h0a54d0cb99cb5a9614316b84194675fc80;
    stim[3] = 133'h0cb07ec62bc42e6b0f09f04bcb2a9160bb;
    stim[4] = 133'h093a8c0234b5e4e8620a49778f884681c3;
    stim[5] = 133'h085e895ee20b343ea2fde86853dc45d1b6;
    stim[6] = 133'h0ffdc94c2c3a58d49d1cf6fe37dc570494;
    stim[7] = 133'h0f1c9a5e292f9dcddd171873574c5911e0;
    stim[8] = 133'h017d93ccbcfaa214c405a8830524bd678c;
    stim[9] = 133'h07afed233c4a3e9d4c435d36b175042f5a;
    stim[10] = 133'h08692f7a6f5755399e176ddec82cbaa019;
    stim[11] = 133'h0119349100bb21241da4b171970b209550;
    stim[12] = 133'h099803567ccc0399a4d4249ff07001105b;
    stim[13] = 133'h0f803c58f4cc82d830b6cfb57377d0c41d;
    stim[14] = 133'h05f81903eb089d43c6c1eacaa6db217c3e;
    stim[15] = 133'h04ae33344b4bef48597e66057255a9a5fd;
    stim[16] = 133'h0bb7687618960bb951f55eef35f06ef3fa;
    stim[17] = 133'h075bfdc2a306bb5910ace5a606d5dca524;
    stim[18] = 133'h085abd35f8a3c31cdc4e115f30b38bdd8f;
    stim[19] = 133'h0fa4791b1bbc70b675aed96687281b75a9;
    stim[20] = 133'h07e5a6e2177307a95c921236a253f6dc1b;
    stim[21] = 133'h06a9267a7275c1e88f90ff9581ec89f4c7;
    stim[22] = 133'h051d5c97b8ccfc12b8a03771626ba1fccc;
    stim[23] = 133'h0c6e561d8dc83e22f708fd83efa1977f6a;
    stim[24] = 133'h017831c5d6559a3da19c618b2721283429;
    stim[25] = 133'h01bf88df6a75f9704a9f447bef02b5c183;
    stim[26] = 133'h0d3f275e0071f21c54a6584c0a2174a8d5;
    stim[27] = 133'h07ebc2e22bd3742ed4aadf3c0c56713b10;
    stim[28] = 133'h0c84ef138259071bf5f04c4c3ffb7e8bc1;
    stim[29] = 133'h09a8eb46a6de2ce4e3b384c42d212a50ec;
    stim[30] = 133'h04765432b11eafcb85b874e1de36566c39;
    stim[31] = 133'h06628510c0cb3e4a264b50fcefa67612ed;
    stim[32] = 133'h03d4470ed23a613a2aaafae6d35367cc93;
    stim[33] = 133'h0b309b9d1e121dcf7884901cf636cdb945;
    stim[34] = 133'h0e93fc0d6a248007b37e8a448b9545e821;
    stim[35] = 133'h00edb26b10eacc86602bb8966fd71f5802;
    stim[36] = 133'h0b208b09258d84d911549315ac5591a5f3;
    stim[37] = 133'h010c79354e29fb8cca68d8b03c3026c142;
    stim[38] = 133'h0b5d96e71dc978ee8d2b6cb844bfb37761;
    stim[39] = 133'h0260ad2d9329488459629f3867782e80dd;
    stim[40] = 133'h06ed1a6c46e274630f45820916326701e5;
    stim[41] = 133'h0a5383a707b0fffc5f65ac709d5f5d1bec;
    stim[42] = 133'h07ad989f593fc782bc91958de85dbed755;
    stim[43] = 133'h06043b38a8a2e0647a43eb605cd2f576f7;
    stim[44] = 133'h0c9d66d6c0d77bb715c840681ca4894f5e;
    stim[45] = 133'h077ead86cf52fdaafd32d62dc6d3ca9652;
    stim[46] = 133'h07144d48afb4f3e84d00f3792f7a66c840;
    stim[47] = 133'h071ff6e07fd6af773883f761b2bbed2736;
    stim[48] = 133'h0e00b430f3c0f31235fa28ed95efcae417;
    stim[49] = 133'h0c0bba45f6612d0e5338805f3d6bc5b702;
    stim[50] = 133'h0acb4a72a943aab7f95175e9a7104f285a;
    stim[51] = 133'h0ab78c68f8310ba925c2720bcc22e2ac81;
    stim[52] = 133'h0d286a890b59e75f968e26360932b60320;
    stim[53] = 133'h078e5acd7e6dccfeeea3b90244332e615c;
    stim[54] = 133'h09c26ae02e7c29bcea9f22d745074956d6;
    stim[55] = 133'h03009a8b7d1f72a92c33fdd4129b7e5efd;
    stim[56] = 133'h07588a01b6ec957781fbd3cdc200bbbd6e;
    stim[57] = 133'h09bb07f79379b081a81b704344e2bccbb8;
    stim[58] = 133'h0c24b35b087fc20dd0b4acf685966b9ae8;
    stim[59] = 133'h0cf1b7f56facdf73ed2092e6211be7945d;
    stim[60] = 133'h0c091e06f82fc6ddf25f08ef4d048d27aa;
    stim[61] = 133'h0d0db82a0464891a9ca84b1bb1706954bb;
    stim[62] = 133'h04f101d3b35a012b564d817826dba06aa7;
    stim[63] = 133'h0fb8144f6d1f5424134b449502ad619788;
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
      expv[0] = 165'h000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 165'h0000000000f56c77fba9bec71d99631e2580b88ccb;
      expv[2] = 165'h00000000011dcceefdb08854857a4a93f7066a92cb;
      expv[3] = 165'h000000000054d0cb99cb5a9614316b84194675fc80;
      expv[4] = 165'h14c0000000b07ec62bc42e6b0f09f04bcb2a9160bb;
      expv[5] = 165'h14c00000013a8c0234b5e4e8620a49778f884681c3;
      expv[6] = 165'h14c00000005e895ee20b343ea2fde86853dc45d1b6;
      expv[7] = 165'h14c0000001fdc94c2c3a58d49d1cf6fe37dc570494;
      expv[8] = 165'h14800000011c9a5e292f9dcddd171873574c5911e0;
      expv[9] = 165'h14800000017d93ccbcfaa214c405a8830524bd678c;
      expv[10] = 165'h1480000001afed233c4a3e9d4c435d36b175042f5a;
      expv[11] = 165'h1480000000692f7a6f5755399e176ddec82cbaa019;
      expv[12] = 165'h148000000119349100bb21241da4b171970b209550;
      expv[13] = 165'h14800000019803567ccc0399a4d4249ff07001105b;
      expv[14] = 165'h1480000001803c58f4cc82d830b6cfb57377d0c41d;
      expv[15] = 165'h1480000001f81903eb089d43c6c1eacaa6db217c3e;
      expv[16] = 165'h1480000000ae33344b4bef48597e66057255a9a5fd;
      expv[17] = 165'h1480000001b7687618960bb951f55eef35f06ef3fa;
      expv[18] = 165'h14800000015bfdc2a306bb5910ace5a606d5dca524;
      expv[19] = 165'h14800000005abd35f8a3c31cdc4e115f30b38bdd8f;
      expv[20] = 165'h1480000001a4791b1bbc70b675aed96687281b75a9;
      expv[21] = 165'h1480000001e5a6e2177307a95c921236a253f6dc1b;
      expv[22] = 165'h1480000000a9267a7275c1e88f90ff9581ec89f4c7;
      expv[23] = 165'h14800000011d5c97b8ccfc12b8a03771626ba1fccc;
      expv[24] = 165'h14800000006e561d8dc83e22f708fd83efa1977f6a;
      expv[25] = 165'h14800000017831c5d6559a3da19c618b2721283429;
      expv[26] = 165'h1480000001bf88df6a75f9704a9f447bef02b5c183;
      expv[27] = 165'h14800000013f275e0071f21c54a6584c0a2174a8d5;
      expv[28] = 165'h1480000001ebc2e22bd3742ed4aadf3c0c56713b10;
      expv[29] = 165'h148000000084ef138259071bf5f04c4c3ffb7e8bc1;
      expv[30] = 165'h1480000001a8eb46a6de2ce4e3b384c42d212a50ec;
      expv[31] = 165'h1480000000765432b11eafcb85b874e1de36566c39;
      expv[32] = 165'h1480000000628510c0cb3e4a264b50fcefa67612ed;
      expv[33] = 165'h1480000001d4470ed23a613a2aaafae6d35367cc93;
      expv[34] = 165'h1480000001309b9d1e121dcf7884901cf636cdb945;
      expv[35] = 165'h148000000093fc0d6a248007b37e8a448b9545e821;
      expv[36] = 165'h1480000000edb26b10eacc86602bb8966fd71f5802;
      expv[37] = 165'h1480000001208b09258d84d911549315ac5591a5f3;
      expv[38] = 165'h14800000010c79354e29fb8cca68d8b03c3026c142;
      expv[39] = 165'h14800000015d96e71dc978ee8d2b6cb844bfb37761;
      expv[40] = 165'h148000000060ad2d9329488459629f3867782e80dd;
      expv[41] = 165'h1480000000ed1a6c46e274630f45820916326701e5;
      expv[42] = 165'h14800000005383a707b0fffc5f65ac709d5f5d1bec;
      expv[43] = 165'h1480000001ad989f593fc782bc91958de85dbed755;
      expv[44] = 165'h1480000000043b38a8a2e0647a43eb605cd2f576f7;
      expv[45] = 165'h14800000009d66d6c0d77bb715c840681ca4894f5e;
      expv[46] = 165'h14800000017ead86cf52fdaafd32d62dc6d3ca9652;
      expv[47] = 165'h1480000001144d48afb4f3e84d00f3792f7a66c840;
      expv[48] = 165'h14800000011ff6e07fd6af773883f761b2bbed2736;
      expv[49] = 165'h148000000000b430f3c0f31235fa28ed95efcae417;
      expv[50] = 165'h14800000000bba45f6612d0e5338805f3d6bc5b702;
      expv[51] = 165'h1480000000cb4a72a943aab7f95175e9a7104f285a;
      expv[52] = 165'h1480000000b78c68f8310ba925c2720bcc22e2ac81;
      expv[53] = 165'h1480000001286a890b59e75f968e26360932b60320;
      expv[54] = 165'h14800000018e5acd7e6dccfeeea3b90244332e615c;
      expv[55] = 165'h1480000001c26ae02e7c29bcea9f22d745074956d6;
      expv[56] = 165'h1480000001009a8b7d1f72a92c33fdd4129b7e5efd;
      expv[57] = 165'h1480000001588a01b6ec957781fbd3cdc200bbbd6e;
      expv[58] = 165'h1480000001bb07f79379b081a81b704344e2bccbb8;
      expv[59] = 165'h148000000024b35b087fc20dd0b4acf685966b9ae8;
      expv[60] = 165'h1480000000f1b7f56facdf73ed2092e6211be7945d;
      expv[61] = 165'h1480000000091e06f82fc6ddf25f08ef4d048d27aa;
      expv[62] = 165'h14800000010db82a0464891a9ca84b1bb1706954bb;
      expv[63] = 165'h1480000000f101d3b35a012b564d817826dba06aa7;
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
