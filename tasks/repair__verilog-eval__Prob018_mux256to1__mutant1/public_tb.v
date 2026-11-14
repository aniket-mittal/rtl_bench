// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'hd0c00d0025c6f6c8895c77e9a5631b5800ed82b36697668ea7ec70188ad9adea4c;
    stim[1] = 264'ha55fe323d03a6148d6ad4c38a10e95a891f7c4c2130e81979f90573b7db91be804;
    stim[2] = 264'ha469e66d26230f58295476e06df107b1fbd223ef6e5369d70a254dcf2e4d9a9e23;
    stim[3] = 264'h874027f0a1253781a9c9a872155e9e8e0322af4ac49c4829135eb1ad716f68269f;
    stim[4] = 264'haa97a55f2c7c3737d2ccdbc46de9e3a6054cbbfb004450a69b77023b793f494954;
    stim[5] = 264'h770f5995a0ea022be3aea4238e87212dfdd54045f79b5cd514a851ebe64118c6b2;
    stim[6] = 264'hfdad1a7c057f72614fa9ce78e9ef0e779d9a133456d7567073392662a272e48564;
    stim[7] = 264'haf9351244100d9906214b61e191e4f8e6fed17a9aa4ca62bff8b2dc5fac35aca5a;
    stim[8] = 264'h136db7cc2c89db1c292b60fc868431d6aba2036cc6719aebddc04a10a9eadbc637;
    stim[9] = 264'h2803de5a06369a71f84c9bee645964c22f5123689acd81d6a0a1ad4f45043f6363;
    stim[10] = 264'hd81fd9e96130f5fb36d701f79dc988ceeafd58dd19cc7e828d0129c280f141add2;
    stim[11] = 264'h26a0e854aa4d7f79d40052c7552f96e69eeb2093d6d3b9df3dc7f14035017ba4a4;
    stim[12] = 264'hc0a0fdf5b41a7243585a94ba825555cee7b253cd80548898e8c67c420717908df1;
    stim[13] = 264'h21d574a6286dfed0e2b723e199bbcf7dcbf6976b8711f47e81932e90283f192a36;
    stim[14] = 264'h4eca6621e38b91075c38cb829fe7a46c2ee0ae6eb31617b28f50792e43d56708be;
    stim[15] = 264'h49aae6f070a224d161fbfca26230dfb6ef18694322acb2bf872d9bda9dca3a0e68;
    stim[16] = 264'h2acc28e8dc18d7c3b71b7f5ae08e77b0ea33ec5d0f475806f0e3d70c1bac52c9c0;
    stim[17] = 264'hfd5162803baec20597261e5e2294fcfa044c9d5a0220cc8177b44bd1c3a0f691d5;
    stim[18] = 264'h2e1044edc14abf7a803dccecee5c005cbf32af1f029f24f9c216473efa7c70cc46;
    stim[19] = 264'h1fad695277583ac053df2f16b89f33f80c3d316cac0e321e92aefd5860592448e2;
    stim[20] = 264'h167d1a96c0f348662b909b98d40a1a52b409dc1e4368bb1f6bd9c74ddf6aacda2c;
    stim[21] = 264'h4dbd2aac9ca786cfa5d53e2a9d387406e104f25ba46e225b9ee53c333a8d05db20;
    stim[22] = 264'hda8848fc22d9c8e429b3d776f02b2d58cfffcc195df7b457c25efae83559cfe401;
    stim[23] = 264'h3fe810931d3f68e4d5d687bc6a867a9fac0d8ba10526de02ddcc5f114b555f6a9f;
    stim[24] = 264'h78423addec975e230ca5e5892fa7993f4b11af2e6028c0f74a156d55752979bd55;
    stim[25] = 264'h87e72668bfdd8231828406ed0721aa9aa89d6e71170fcea100ad6c5698e86787d6;
    stim[26] = 264'ha4e5092de9798bfe903072abb71e0bc6a8aa1b5c647438472b57e96e5760e9b1e6;
    stim[27] = 264'h97fcc6d244298d476a031bc51f77889ce2d61aaac7244ab8871dc13f14ca2374af;
    stim[28] = 264'hf2739cc68abf1222a7bd1752dfc18b5d56bd1c491523bf3424814583671c9f9191;
    stim[29] = 264'hba5da2b2388c75ee6f52945ce7a28fa25303209c83626a97367cf1a25bc13fa034;
    stim[30] = 264'h851fadd59e0ccc8c66e13c48d18b812011e4f63ce5c8f212e2386b4708c6452051;
    stim[31] = 264'h84f97008b163c8e4f4811b0c3b7ee90a0be19e646caf559af2a7c8f86b604e32db;
    stim[32] = 264'hbe7ae5ec917e4c8f2815c731825c24adfa6e9b8bec4d47bf666e51ed9393af0e66;
    stim[33] = 264'h24befdb2bfdc77a8a570f422d8e5bf2b9a19d8bdcf4d18f1b74b4e5bb95b866567;
    stim[34] = 264'h29a50ee200a515e4db6c561775f06ea0d3eededf435e95fdf4d1f3a9578c9bcb54;
    stim[35] = 264'h956fb920c3e6c86ab84dae49987aa03ddbca3ff1dacfa7a9c9998d7ad69a4379eb;
    stim[36] = 264'h8e4343b20b1f5a86383d4bcbe5dc6b7cd0e9bf5a14ffa5658caf2b43872a0b07a1;
    stim[37] = 264'h3f31a7c652dcc61a75ea11166875f14b73f95e587a5f9209b447f6ef734b59179c;
    stim[38] = 264'h6202020848b6a76ecf9a051ab4e88b22600198501a522f06a9d85edc0bb0994c1b;
    stim[39] = 264'h17184049fb84c60fb6b0bca0c38bdc40653e04e78d435685a5405c266553965303;
    stim[40] = 264'h2746ab769ca9f30ef1341f39095cfef43b82037a710a1891b611096671e29be2f0;
    stim[41] = 264'h64bf794bdab42c9008bb5aff9bed96b12cf2807bb0438099c0f948549beed5134b;
    stim[42] = 264'h37cd4df00edddc40a968996ef963b3adacd48a10cba2a741de4818f3356c713eb5;
    stim[43] = 264'h6f342558288759301ba00e2a89fc4136648a49599a3cd681ccfbbce42b1b58527c;
    stim[44] = 264'h63a8596bc86b9dcef672d31a431a24b524cdc9f3e85f67dfde5ec7fb09fe2ecfeb;
    stim[45] = 264'h593fcda4ef4e502979d6b3eb146f2b610225cf2dfdf2eb6112d74f84462b0e7243;
    stim[46] = 264'hefd0e9cc2703bad8766bf4aff74ad4d2353415b4755e8ebd69a46bca2fc2c07385;
    stim[47] = 264'h8fb004317d8e61d749bf89f91fc48bb5325f69c6ebd82d1c3e1fe1809cd2a163d8;
    stim[48] = 264'hcfdfa33575304b2d35fa310aa93d2df2abf2761482d8c72f192512a3632bc2501c;
    stim[49] = 264'h4efadb8b8c3314b57959bbf762b67a9d9ef253ad8a48ae45b089bb29da84e1bbaf;
    stim[50] = 264'h7455d69387db1b265aa25afcb022730ef8a90a022f3f826f8abd47e6c8c992f713;
    stim[51] = 264'hf46ed6734491e9049eb8deb9385dec14232ec10f82cd9b1026408e43cef41d9d1f;
    stim[52] = 264'hbbca8ab9c3eef849110f38750710041900aa5bac7931ab92c0d3af259a2cf5ec41;
    stim[53] = 264'h57ddecc7dc3c1ec07bebf4d9d27aec5da1d17aae62c843038538423d83d0f96dee;
    stim[54] = 264'hd5edd955d74293d67aa3ced1ead2614f5033c442b51525de3059075a00408e0d35;
    stim[55] = 264'he4d0530786e4d4e607351a6ec35786b5e2ecf4301156d35a45f8790060c7174595;
    stim[56] = 264'h106ef91429a42afed4a08fc6a25ff8ec8d7f48e44dd7eec45c8b96ef256462e83e;
    stim[57] = 264'hab126e5b54303176ac10d5cbe032140786f54e06cc812575ef058cab0dc7bb25ec;
    stim[58] = 264'h568de8b67573816ca22970c572b5f5bb43fb1ac1f8609b2854780012c6366aa1d0;
    stim[59] = 264'h50b56a33530087b4b45791aa0ab9feabda0b64cb33af248a58e02bfae012ff6262;
    stim[60] = 264'ha83183629bfb0a1002328894f46eb5094518483be80ef3f1a16ba32261f1b70303;
    stim[61] = 264'h5dcb4ffa96a4947dfa53e5a23060f438850e97b763c40a3d9bc544a57baddf7dcc;
    stim[62] = 264'hfa634c15bb3682ccf52227031e886f71e4bda191db7935c2d0dd9a0403d9803bb0;
    stim[63] = 264'h75f68f6ff449df1a9af10707f432b16e5c7c82840654c62cb67d022a57394d2e24;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
