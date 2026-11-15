// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_66b64b dut (
    .clk(clk),
    .reset(in_vec[67:67]),
    .i_data(in_vec[66:1]),
    .i_valid(in_vec[0:0]),
    .o_data(out_vec[64:1]),
    .o_rd_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'he5d34045b488d8a24;
    stim[1] = 68'h88b1545bbdc55b048;
    stim[2] = 68'h03bcb2c80d022e1e6;
    stim[3] = 68'h1fc6411da0d5b7b45;
    stim[4] = 68'h5be5d80fa2fb9a7dc;
    stim[5] = 68'h31179ad287ca21b84;
    stim[6] = 68'h3b02d19672f31b179;
    stim[7] = 68'h424724e8673de0207;
    stim[8] = 68'h4a3f5ce5987c3db79;
    stim[9] = 68'h126b6c8a8bfdb99de;
    stim[10] = 68'h32b58b57dbdd8c754;
    stim[11] = 68'h636764bca4e1a63b0;
    stim[12] = 68'h221a928a3addb1935;
    stim[13] = 68'h26fc0f443216366f0;
    stim[14] = 68'h1cd09a9fa4bdde475;
    stim[15] = 68'h55a28d329080590dc;
    stim[16] = 68'h163b2dc2f391457f7;
    stim[17] = 68'h0f48fe3ef6eac07f3;
    stim[18] = 68'h7e71cd48e0c2f14f5;
    stim[19] = 68'h5d4ec1c56c7d9e29f;
    stim[20] = 68'h389fc925bb047e3ce;
    stim[21] = 68'h43e039d20fa6e8000;
    stim[22] = 68'h2488be9051f594c10;
    stim[23] = 68'h507ada5ba11f678af;
    stim[24] = 68'h3d9e1b3e46ff011d8;
    stim[25] = 68'h017facc6d58f9369c;
    stim[26] = 68'h148e5beec89b99bb0;
    stim[27] = 68'h532f0afe5d94ac961;
    stim[28] = 68'h36f8bfd7dfeab7165;
    stim[29] = 68'h220e6e194420b38ae;
    stim[30] = 68'h749a8303a9ddea387;
    stim[31] = 68'h60155afcfc7df7ffb;
    stim[32] = 68'h1acaca87df117a7c8;
    stim[33] = 68'h7641c209ac91b3101;
    stim[34] = 68'h210507ce6650da815;
    stim[35] = 68'h008d0e13c601247ae;
    stim[36] = 68'h4bf7a3ef33739ba3a;
    stim[37] = 68'h70c79b88b6de66ef3;
    stim[38] = 68'h5af0d1e8841f29066;
    stim[39] = 68'h7b69ba1f33c4af9a2;
    stim[40] = 68'h50c021ec871360b5f;
    stim[41] = 68'h7c47f2c4c63402c22;
    stim[42] = 68'h4f1972d1e65b20972;
    stim[43] = 68'h075a82fcbaa8d513b;
    stim[44] = 68'he398ea62a76ff3dad;
    stim[45] = 68'h17db29acab82f0ab3;
    stim[46] = 68'h47fc1bb9daaae52b7;
    stim[47] = 68'h39b9f38f5b7598e07;
    stim[48] = 68'h1c02db7dd02ae51f2;
    stim[49] = 68'h3b5c3bfd65059113e;
    stim[50] = 68'hc9b91d95c5788499c;
    stim[51] = 68'h008db43fd4b718793;
    stim[52] = 68'h213c43fee59811b6d;
    stim[53] = 68'h00fd2777aa4f3cd8f;
    stim[54] = 68'h242b642ed2c7a3d39;
    stim[55] = 68'h059ccf4596ea3b9e9;
    stim[56] = 68'h0f9bef8c61b2f0c5a;
    stim[57] = 68'h73bfc443027e3b4f7;
    stim[58] = 68'h66f7058adab84a28e;
    stim[59] = 68'h090d35eb248fcb1ca;
    stim[60] = 68'h04e29e6fd6735828a;
    stim[61] = 68'h22b91ce6e117fc890;
    stim[62] = 68'h5654644e373c394a8;
    stim[63] = 68'h1ac8ed47b5697d89c;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'hxxxxxxxxxxxxxxxxx;
      expv[2] = 65'h08b1545bbdc55b049;
      expv[3] = 65'h03bcb2c80d022e1e7;
      expv[4] = 65'h1f1904768356ded1x;
      expv[5] = 65'h1e5d80fa2fb9a7dc7;
      expv[6] = 65'h05e6b4a1f2886e11f;
      expv[7] = 65'h02d19672f31b1787f;
      expv[8] = 65'h1c93a19cf78081bb1;
      expv[9] = 65'h15ce5987c3db79091;
      expv[10] = 65'h1b22a2ff6e677ca3f;
      expv[11] = 65'h0b57dbdd8c75528fd;
      expv[12] = 65'h12f2938698ec4a3f5;
      expv[13] = 65'h08a3addb193528fd7;
      expv[14] = 65'h110c858d9bc221a93;
      expv[15] = 65'h1fa4bdde474886a4b;
      expv[16] = 65'h0a420164371cd09a9;
      expv[17] = 65'h0f391457f673426a7;
      expv[18] = 65'h1dbab01fc963b2dc3;
      expv[19] = 65'h00c2f14f43d23f8fb;
      expv[20] = 65'h11f678a7fe71cd48f;
      expv[21] = 65'h1047e3cf753b0715b;
      expv[22] = 65'h09ba0005d4ec1c56d;
      expv[23] = 65'h1594c11753b0715b1;
      expv[24] = 65'h1d9e2bdd4ec1c56c7;
      expv[25] = 65'h1011d941eb696e847;
      expv[26] = 65'h04da7507ada5ba11f;
      expv[27] = 65'h19bb141eb696e847d;
      expv[28] = 65'h1258507ada5ba11f7;
      expv[29] = 65'h11654cbc2bf97652b;
      expv[30] = 65'h02bb6f8bfd7dfeab7;
      expv[31] = 65'h186dbe2ff5f7faadd;
      expv[32] = 65'h1ef49a8303a9ddea3;
      expv[33] = 65'h0980556bf3f1f7dff;
      expv[34] = 65'h060155afcfc7df7fe;
      expv[35] = 65'h1d9070826b246cc41;
      expv[36] = 65'h008d0e13c601247af;
      expv[37] = 65'h0fde8fbccdce6e8eb;
      expv[38] = 65'h0c79b88b6de66ef29;
      expv[39] = 65'h1c347a2107ca419f1;
      expv[40] = 65'h09ba1f33c4af9a3c3;
      expv[41] = 65'h0087b21c4d82d7f0d;
      expv[42] = 65'h1f2c4c63402c23431;
      expv[43] = 65'h1cb47996c825cd0c1;
      expv[44] = 65'h02fcbaa8d513b4301;
      expv[45] = 65'h098a9dbfcf6b075a9;
      expv[46] = 65'h17db29acab82f0ab3;
      expv[47] = 65'h1ff06ee76aab94ad9;
      expv[48] = 65'h1b9f38f5b7598e071;
      expv[49] = 65'h00b6df740ab947cb9;
      expv[50] = 65'h1c3bfd65059113ee7;
      expv[51] = 65'h04765715e2126739b;
      expv[52] = 65'h008db43fd4b718793;
      expv[53] = 65'h04f10ffb966046db1;
      expv[54] = 65'h0fd2777aa4f3cd8e9;
      expv[55] = 65'h0ad90bb4b1e8f4e01;
      expv[56] = 65'h1ccf4596ea3b9e891;
      expv[57] = 65'h0fbe3186cbc316859;
      expv[58] = 65'h1c443027e3b4f6167;
      expv[59] = 65'h0162b6ae128a3f3bf;
      expv[60] = 65'h15eb248fcb1cbceff;
      expv[61] = 65'h19bf59cd60a2f3bfd;
      expv[62] = 65'h0e6e117fc891ceff1;
      expv[63] = 65'h138dcf0e52a73bfc5;
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
