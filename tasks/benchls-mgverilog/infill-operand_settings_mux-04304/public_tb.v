// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04304 dut (
    .clock(clk),
    .resetn(in_vec[102:102]),
    .i_settings(in_vec[101:100]),
    .i_register_settings(in_vec[99:68]),
    .i_dataa(in_vec[67:36]),
    .i_dataa_valid(in_vec[35:35]),
    .i_datab(in_vec[34:3]),
    .i_datab_valid(in_vec[2:2]),
    .i_dataouta_stall(in_vec[1:1]),
    .i_dataoutb_stall(in_vec[0:0]),
    .o_dataa_stall(out_vec[67:67]),
    .o_datab_stall(out_vec[66:66]),
    .o_dataouta(out_vec[65:34]),
    .o_dataouta_valid(out_vec[33:33]),
    .o_dataoutb(out_vec[32:1]),
    .o_dataoutb_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h144c2ef66ae7d365ee85be0d54;
    stim[1] = 103'h014871d9e0eea286cb3d274117;
    stim[2] = 103'h5bac8a81e6a49bb5cae0b675e8;
    stim[3] = 103'h62e73765ecc1ae7e6b92d233a6;
    stim[4] = 103'h5fcb38cab7f5241c88ad2e4dbd;
    stim[5] = 103'h6b384157f4528055cd10b4f8a9;
    stim[6] = 103'h652b8ee5e7f6dca598d59d8aaa;
    stim[7] = 103'h6052c169b9a8d1ee8bec279a6c;
    stim[8] = 103'h48ef89db1cd58fb8ed865ae5d1;
    stim[9] = 103'h4e0029e810b1b8fb1c9414fa1d;
    stim[10] = 103'h2eb8206be70c303a2c1e5a1f61;
    stim[11] = 103'h6ae9c246f8720d48a4a212b2b8;
    stim[12] = 103'h79d282f5676364cacd1facda0c;
    stim[13] = 103'h6445a387682d64a2fd3a30ab87;
    stim[14] = 103'h5120613bc2a9fc3f64360052cd;
    stim[15] = 103'h47f26e63c540481209bb41d207;
    stim[16] = 103'h77fd361b641703a71ee3a6042d;
    stim[17] = 103'h62fc0650df1a3acae2848ee7e6;
    stim[18] = 103'h66783cb46905ae52f6aa92b136;
    stim[19] = 103'h696419e3f060a933c693d8822d;
    stim[20] = 103'h18b0d74d7b30bda54b80945ba5;
    stim[21] = 103'h5ed5008cc8a73951b7de9bf539;
    stim[22] = 103'h5baca9aa88650d3689d2ea5431;
    stim[23] = 103'h6f7f2dec268119d060383652f1;
    stim[24] = 103'h59534e3f5ea3ec5ac6cf849c49;
    stim[25] = 103'h4ee996421b3b18d79e4d2a30bc;
    stim[26] = 103'h57804b759a90cad26394aca3e6;
    stim[27] = 103'h55e1f61f6a258b6a30d7ab3827;
    stim[28] = 103'h7d4ddecfe4c107fb22b95490e6;
    stim[29] = 103'h594f9d2be91f0df685484b084c;
    stim[30] = 103'h72e707debfe0d59e53a6be8a38;
    stim[31] = 103'h7c3efcfea782587da6b6813415;
    stim[32] = 103'h44bf4ccec159225fe6dd5f1d94;
    stim[33] = 103'h49f3060a3a8e2c39200f634165;
    stim[34] = 103'h5f775cce8c0e787d701a29e2fb;
    stim[35] = 103'h59b8295341475566283ca3b5fe;
    stim[36] = 103'h40c8c2ecd69489c8ffa572c1af;
    stim[37] = 103'h6959df76467c226122f8a715ca;
    stim[38] = 103'h5717653055100156779097a7d3;
    stim[39] = 103'h7475d1949aaa4c15a7e67d1669;
    stim[40] = 103'h4b2dcd2d098ccbf94ed57bde5d;
    stim[41] = 103'h4170f31cb1b11b7fb478e55c6b;
    stim[42] = 103'h636ba26dd13722665410073f8f;
    stim[43] = 103'h7e03e50f40520210d6b1f39774;
    stim[44] = 103'h47f004d42da325cc8ee96da103;
    stim[45] = 103'h4c51302f247d1827b6166297e4;
    stim[46] = 103'h61926e9ae0bd4c38c159275f93;
    stim[47] = 103'h42a8ff653d3d894c480d36cc8b;
    stim[48] = 103'h443b9f604027c44b90fc190409;
    stim[49] = 103'h36a0a5fe771b9d4687c5158efa;
    stim[50] = 103'h604bee65aca89d4f15d8d77263;
    stim[51] = 103'h46db4c42c943bf20b134a0061d;
    stim[52] = 103'h46d509cb280815cb8109338555;
    stim[53] = 103'h547b1442ab8a33a3e115352f47;
    stim[54] = 103'h75fdfaa3c4b95a5dea94d0f6d8;
    stim[55] = 103'h55c9989c61845c2d156727eb54;
    stim[56] = 103'h4c12bf6a8574262680e6135669;
    stim[57] = 103'h6d49359a100a22be03ee74124b;
    stim[58] = 103'h4e723031aa158e8a6759257dc4;
    stim[59] = 103'h5ee9f5b6c7b08c36cdcfaad1fb;
    stim[60] = 103'h45e27613425d0c625974c22baa;
    stim[61] = 103'h4b44b58507bd928067e50f37f7;
    stim[62] = 103'h71af42d6ac5ba2d1947d24bacc;
    stim[63] = 103'h7aa3742577f5cc0d5a17d02e3b;
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
      expv[0] = 68'h1130bbd9ba16f8355;
      expv[1] = 68'hc3ba8a1b2cf49d045;
      expv[2] = 68'h2eb22a07ab82d9d7a;
      expv[3] = 68'hb306b9f9a5ce6ecbd;
      expv[4] = 68'h7f2ce32ae2b4b936f;
      expv[5] = 68'h514a0157367082afe;
      expv[6] = 68'h9fdb72966a571dcbc;
      expv[7] = 68'h26a347ba20a582d37;
      expv[8] = 68'h73563ee3b6196b974;
      expv[9] = 68'h42c6e3ec725053e87;
      expv[10] = 68'h5c30c0e8bd7040d7c;
      expv[11] = 68'h21c8352295d3848de;
      expv[12] = 68'h274a0bd5b3a505ead;
      expv[13] = 68'he0b5928be88b470ed;
      expv[14] = 68'h448184ef10d8014b3;
      expv[15] = 68'hd501204826ed07481;
      expv[16] = 68'h5ff4d86daffa6c36d;
      expv[17] = 68'hbc68eb2b85f80ca1b;
      expv[18] = 68'ha416b94bccf07968d;
      expv[19] = 68'h4182a4cf12c833c7f;
      expv[20] = 68'h62c35d35ee02516e9;
      expv[21] = 68'h7b5402331f7a6fd4e;
      expv[22] = 68'h6eb2a6aa274ba950c;
      expv[23] = 68'h5a0467419efe5bd84;
      expv[24] = 68'h654d38fd5b3e12712;
      expv[25] = 68'h2cec635e7934a8c2f;
      expv[26] = 68'h9e012dd64e52b28f9;
      expv[27] = 68'hd787d87d835eace09;
      expv[28] = 68'hb5377b3f9a9bbd9fd;
      expv[29] = 68'h253e74af95212c213;
      expv[30] = 68'h0b9c1f7ac5ce0fbd6;
      expv[31] = 68'h70fbf3fa987df9fd5;
      expv[32] = 68'h0564897f9b757c765;
      expv[33] = 68'h6a38b0e4803d8d059;
      expv[34] = 68'hfddd733a0068a78be;
      expv[35] = 68'ha6e0a54d20f28ed7f;
      expv[36] = 68'hda522723fe95cb06b;
      expv[37] = 68'h99f0898492b3beec8;
      expv[38] = 68'hdc5d94c15e425e9f4;
      expv[39] = 68'h51d7465248eba3292;
      expv[40] = 68'h66332fe53b55ef797;
      expv[41] = 68'hc6c46dfed1e39571a;
      expv[42] = 68'hc4dc899946d744dbb;
      expv[43] = 68'h380f943d1c07ca1e9;
      expv[44] = 68'hf68c97323ba5b6840;
      expv[45] = 68'h11f4609ed8598a5f9;
      expv[46] = 68'hc2f530e30324dd35c;
      expv[47] = 68'hf4f625312034db322;
      expv[48] = 68'h409f112e43f064102;
      expv[49] = 68'h9a8297f9cd414bfce;
      expv[50] = 68'hf2a2753c4097dccb4;
      expv[51] = 68'h650efc82c4d280187;
      expv[52] = 68'h6020572e0424ce155;
      expv[53] = 68'hd1ec510a8454d4bd1;
      expv[54] = 68'h17f7ea8f2bfbf5478;
      expv[55] = 68'h17266271959c9fad5;
      expv[56] = 68'h55d0989a03984d59a;
      expv[57] = 68'hc0288af81a926b342;
      expv[58] = 68'h28563a299d6495f71;
      expv[59] = 68'hfba7d6db373eab47e;
      expv[60] = 68'h8974318965d308aea;
      expv[61] = 68'hdef64a019f943cdfd;
      expv[62] = 68'h06bd0b5a835e85ad5;
      expv[63] = 68'hea8dd095f546e84ae;
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
