// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ad_csc dut (
    .clk(clk),
    .sync(in_vec[114:99]),
    .data(in_vec[98:75]),
    .C1(in_vec[74:58]),
    .C2(in_vec[57:41]),
    .C3(in_vec[40:24]),
    .C4(in_vec[23:0]),
    .csc_sync(out_vec[23:8]),
    .csc_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 115'h52ef36ff22c6faead2c2fda40160a;
    stim[1] = 115'h68418d4977f322830d4dccb705c28;
    stim[2] = 115'h4a371d89ec5b19b9e1225c444c941;
    stim[3] = 115'h642f3e2065ca1c120aac89eb5bfea;
    stim[4] = 115'h5829f9eedcd2ba818edd509491301;
    stim[5] = 115'h27f6b63f7bd5c2a3887379c6fc03c;
    stim[6] = 115'h1c2005067aea4b32cd6d6d6289757;
    stim[7] = 115'h02bb70662c39027db5b1c8da41703;
    stim[8] = 115'h36743e177b1b9b0d136eec43f0d2b;
    stim[9] = 115'h55ef990b470bf235c3099c7de0111;
    stim[10] = 115'h070ff9fcded4c07cf0c2f7b73a836;
    stim[11] = 115'h3f07bea836afc190aba3bb376801f;
    stim[12] = 115'h251df67f40009706e3c4ebc2dbcad;
    stim[13] = 115'h6866bc5b017ff8942b9049c474267;
    stim[14] = 115'h4cea3b5f97b978e5528062e29e4e3;
    stim[15] = 115'h6566cd3adcd4bd676eb1bef61d7ca;
    stim[16] = 115'h57cf05ebbd7fb0075ce73766bd35c;
    stim[17] = 115'h41e7fc8f7a1914406dd0a51982e1a;
    stim[18] = 115'h759473876252ac1bd3dcd6c0d28c1;
    stim[19] = 115'h40c57957ba6d51ceeb6b4060b73e2;
    stim[20] = 115'h34ae28ea042cba591ea297eb0d0e8;
    stim[21] = 115'h1dde6cb0e81f2333fbd960867a177;
    stim[22] = 115'h781fb8cee094ff121f3c65824183f;
    stim[23] = 115'h417aaa92ead57f9f20c3950e7d293;
    stim[24] = 115'h54162c91d387919a1f9cf8b25755a;
    stim[25] = 115'h5e3a655a4b7e5a9ae9e1da0e4a21c;
    stim[26] = 115'h5954f89aff35c9c6f541e481f150a;
    stim[27] = 115'h2988a9fcdbfeaf204fb8b0f517227;
    stim[28] = 115'h5a6321ef63b6b810ff27df665923f;
    stim[29] = 115'h24ef528e8bdf37eacbc25d5010c9c;
    stim[30] = 115'h6bd45dfa70abce2b52ae52eab9e8f;
    stim[31] = 115'h0f8c9625224eba63fe5acdb15dbac;
    stim[32] = 115'h2bad47f0fd052d4269018afacc8c4;
    stim[33] = 115'h7c9accfa8aca354215ecfa788b7ab;
    stim[34] = 115'h49dfcf87e38dbc24a050a6c2b1c66;
    stim[35] = 115'h596a7f0c07969371d69ff690e86f3;
    stim[36] = 115'h3d0d5a0c25ccc19895a618ef2c5b4;
    stim[37] = 115'h2eaf9ca63be7ea6fb47b56eea46cf;
    stim[38] = 115'h0b0fa49d51edf5e9aa68a3555f4c1;
    stim[39] = 115'h732738985cf0a5876e285158e067a;
    stim[40] = 115'h18e9d4c01e8823253009576880329;
    stim[41] = 115'h4d697d7a4004a1c00192420277a23;
    stim[42] = 115'h5637fd71f3e67f302671355b2fd7d;
    stim[43] = 115'h0e4b4784290610103d0a35fd81cfc;
    stim[44] = 115'h59be004c647088c061eb88ba3b631;
    stim[45] = 115'h599e90ce49724cf8e532119c2886d;
    stim[46] = 115'h363eb85298fc54d128009079789e0;
    stim[47] = 115'h0ed02e196d092be7644527e18d90f;
    stim[48] = 115'h3ffdeb1cd92f8470d71ce06b2d4a3;
    stim[49] = 115'h3c4a6b06689551716d642317e747f;
    stim[50] = 115'h45a46d99dfcce762b71582de85fd6;
    stim[51] = 115'h5e230ab796a3c629703a271934083;
    stim[52] = 115'h23cfdcc9cfe70d2c61cb3b6e46e9b;
    stim[53] = 115'h6bf2fb9c3ab22fc2054fc7647507d;
    stim[54] = 115'h271da271fbb7b263faae18eb4696e;
    stim[55] = 115'h460e2fb767e7457711f5bcc7bf7d6;
    stim[56] = 115'h405ae8aaf6370835b08eca1e414f5;
    stim[57] = 115'h42afe2b65c42b46cc5d5d6558ba47;
    stim[58] = 115'h11e95d6726e73293b3407341648aa;
    stim[59] = 115'h67559f163d82fe93f2ca1b90d29d5;
    stim[60] = 115'h5744cf8113d79014cd7790de8ba33;
    stim[61] = 115'h6913b5aa8291323c8a56235a89569;
    stim[62] = 115'h3f57c1c946ea2ea8029923f6b89e7;
    stim[63] = 115'h7f97e53bd080b000efa4191f99a31;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'ha5de31;
      expv[5] = 24'hd083de;
      expv[6] = 24'h946e7a;
      expv[7] = 24'hc85e44;
      expv[8] = 24'hb0539a;
      expv[9] = 24'h4fedd1;
      expv[10] = 24'h384084;
      expv[11] = 24'h05768e;
      expv[12] = 24'h6ce832;
      expv[13] = 24'habdf9c;
      expv[14] = 24'h0e1f8e;
      expv[15] = 24'h7e0f31;
      expv[16] = 24'h4a3bec;
      expv[17] = 24'hd0cd90;
      expv[18] = 24'h99d44e;
      expv[19] = 24'hcacd6d;
      expv[20] = 24'haf9e82;
      expv[21] = 24'h83cf34;
      expv[22] = 24'heb288e;
      expv[23] = 24'h818ac3;
      expv[24] = 24'h695c4e;
      expv[25] = 24'h3bbcf3;
      expv[26] = 24'hf03f81;
      expv[27] = 24'h82f523;
      expv[28] = 24'ha82c20;
      expv[29] = 24'hbc74fc;
      expv[30] = 24'hb2a964;
      expv[31] = 24'h531103;
      expv[32] = 24'hb4c659;
      expv[33] = 24'h49de3c;
      expv[34] = 24'hd7a8d5;
      expv[35] = 24'h1f19c7;
      expv[36] = 24'h575ab3;
      expv[37] = 24'hf935d8;
      expv[38] = 24'h93bf75;
      expv[39] = 24'hb2d45a;
      expv[40] = 24'h7a1a76;
      expv[41] = 24'h5d5f49;
      expv[42] = 24'h161fe6;
      expv[43] = 24'he64ea5;
      expv[44] = 24'h31d304;
      expv[45] = 24'h9ad29d;
      expv[46] = 24'hac6f8e;
      expv[47] = 24'h1c9669;
      expv[48] = 24'hb37ca7;
      expv[49] = 24'hb33d13;
      expv[50] = 24'h6c7d89;
      expv[51] = 24'h1da0e0;
      expv[52] = 24'h7ffb8e;
      expv[53] = 24'h7894d8;
      expv[54] = 24'h8b4846;
      expv[55] = 24'hbc46d8;
      expv[56] = 24'h479f94;
      expv[57] = 24'hd7e5fa;
      expv[58] = 24'h4e3b5c;
      expv[59] = 24'h8c1c18;
      expv[60] = 24'h80b5e0;
      expv[61] = 24'h855f10;
      expv[62] = 24'h23d21c;
      expv[63] = 24'hceabbc;
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
