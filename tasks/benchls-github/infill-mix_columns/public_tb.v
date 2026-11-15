// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mix_columns dut (
    .in(in_vec[127:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h3c5551534327f98d931734b146d0dd3f;
    stim[1] = 128'h3fa426074384e22ac053256107e62fd5;
    stim[2] = 128'hf407be9585459d4e2b8d42091f6d6d9b;
    stim[3] = 128'h1bf28eb6a0afd6531a9ce93efd2cad37;
    stim[4] = 128'h62dd2d99a4b3f708303446eace190b50;
    stim[5] = 128'h7d12d5d511684b7ca5e72401f2533b98;
    stim[6] = 128'h2f4a1168fa223452facb1a9d51b3656b;
    stim[7] = 128'hcda4573cbf923119a4ee7f88711c07b0;
    stim[8] = 128'h0d11031de33070cdbc5434d724e94482;
    stim[9] = 128'h076d0e4f9f67ab1d48a195db3e05af0c;
    stim[10] = 128'h8936ae60f3ca53ed0d2cfb38a17f57e7;
    stim[11] = 128'h83785ac2cf7c86e0f24ab9902c2d7f81;
    stim[12] = 128'h48a489ba077edc2630b4605a83ec8cb9;
    stim[13] = 128'h56d152be298562f20408a33bd32f5fe4;
    stim[14] = 128'h3b854d6bd4df25da19edaebb2356afe7;
    stim[15] = 128'h01900bcaf1c4785254f52348bb868d2b;
    stim[16] = 128'h4358945d8d6fa95c1b4765857a3ad5cd;
    stim[17] = 128'h5c52e75a85c844c21a309fbfafc67487;
    stim[18] = 128'h8e10bed637a5315874516bd052a8c3b2;
    stim[19] = 128'had9bccc2d8128c133cf25baea67b7c85;
    stim[20] = 128'he0b7f41e300e9d27eaf04451c3442be8;
    stim[21] = 128'ha01a7b440cd2239cebaa9e2388d7cbfd;
    stim[22] = 128'h778115da85e33359b39e7b81f20fb945;
    stim[23] = 128'h4cff97219f849e1875432e01dcd76b88;
    stim[24] = 128'ha27373c8b35e8a50864d9203f06a60d6;
    stim[25] = 128'h6c00b2945ccd2b5f9c6f699300f28a60;
    stim[26] = 128'hb318f645f1cfea138a2f05f420473836;
    stim[27] = 128'h18fbfcc77d9c43f7c4fde89a77957f52;
    stim[28] = 128'h9c2fadecdf360cfeceec1a09d1690bf1;
    stim[29] = 128'h1d21d1b0a843a95f55cdee1e3c3c9f5f;
    stim[30] = 128'h87d7648c20a9f1024ea40ed5aa95b586;
    stim[31] = 128'h9bf59651f4abf3ab3ab6e36accc3a146;
    stim[32] = 128'h2d6354e228c5ec8c4712dbdb44b9928c;
    stim[33] = 128'ha42034ebadefb08d69b6eb894df7c777;
    stim[34] = 128'hcdf36165e4f25645e2e4ac5d98405123;
    stim[35] = 128'h9b0ca4a4a42a9836eacdc32fb1270d32;
    stim[36] = 128'he9daeb55bb0a7185a304374fa9ba6d8b;
    stim[37] = 128'h76cf9637a487ab0581c6f880e111fefb;
    stim[38] = 128'h328aa46d6be9e72197dab1006cbd5db3;
    stim[39] = 128'h057208123643180f0be4dafeda9c457d;
    stim[40] = 128'hc29b363a73bd133091587298e79d0cd9;
    stim[41] = 128'ha91627af851dea263dcb70cc35f5ed0d;
    stim[42] = 128'h5b004e4fa32eb6c6f2f0d56ccf4802c3;
    stim[43] = 128'hf26d91fbc348d71293b59e118968ef55;
    stim[44] = 128'hd3a5a6fd1c5b3c6cb913cd4c24ea1800;
    stim[45] = 128'h4600e68e9839ecc4c89552e89225aaeb;
    stim[46] = 128'hfd518145c22da2580670bac9c150581e;
    stim[47] = 128'hb8feddac3ab6be183d1f1a77a1fe8823;
    stim[48] = 128'hd6bb38f8aa8f1aba81b80a5b96938e2b;
    stim[49] = 128'h4b1e35d9469c57855f2d90661ac459c4;
    stim[50] = 128'h27980c3f64210ae4935eea5eb448c9b2;
    stim[51] = 128'hf63c708e122151af147bf739d22b3111;
    stim[52] = 128'h63d60e89c30bbb732e4b6197c5b883f7;
    stim[53] = 128'h9b34bffc1caf6aa96644dcc81f035788;
    stim[54] = 128'h44c4348dea8ce46f9255f0d6d8bddf62;
    stim[55] = 128'h4c6fcdb52404f93067705de500c5968b;
    stim[56] = 128'h88b0b2f4f5d842d982ecba83317b6ae1;
    stim[57] = 128'h47f890505204e68dddd33c26fee80220;
    stim[58] = 128'h654c2e420e023c41f16cda69152d85ca;
    stim[59] = 128'h214c3186d410b8f07a263796ef202ba6;
    stim[60] = 128'h99a69e75b28149ab17e47c54608617cd;
    stim[61] = 128'he6116b8d89f173fe787eab403efc57fe;
    stim[62] = 128'hb269f5d40165b96552b961ec03240cd2;
    stim[63] = 128'h3e5317fd78e49d7e6b4a3ffe5c9212a7;
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
      expv[0] = 128'h85363ee69b90011a815024f405be76b9;
      expv[1] = 128'ha801decdd94766f72a687aefc574db71;
      expv[2] = 128'hd1b6308f0dfd33d091e539a07fe91e0c;
      expv[3] = 128'h03db2f2634d74d245c270d270f7ec9f3;
      expv[4] = 128'h0c2d557f62d3faa39078adedf7b131fb;
      expv[5] = 128'hcce8baf1ad606be8461d0935a981644e;
      expv[6] = 128'hf9e0fffaefb046a72ec4b9e562e895f3;
      expv[7] = 128'h1d5b83c7e0ca644b8d6a376d71f0a8f3;
      expv[8] = 128'h37373d3f30de7fff7c9fe20aaea3d8de;
      expv[9] = 128'hf880a7f43aaa924c266eae41d0d26af0;
      expv[10] = 128'h9d6c58d80664b356ad7b84b068414205;
      expv[11] = 128'h0d5f122367469f6b08267ac5d176673f;
      expv[12] = 128'h5421309a76a2b0e79db9aa300776bc97;
      expv[13] = 128'h28a7fa1e566c656388d11cd1778875cd;
      expv[14] = 128'hc496995336c434320b8a6505f4820249;
      expv[15] = 128'h68edc21784b83310c7883fba5a0b418b;
      expv[16] = 128'ha709cfb345ef4ff21fbf021ea2a7bde0;
      expv[17] = 128'hf39035e5d4009887447fd5e4e723134d;
      expv[18] = 128'h5fa19890f36d187da0bb981d36f5aae2;
      expv[19] = 128'hf90de8240260fccb808091aa2351b1e7;
      expv[20] = 128'hf38c8644c8b7768dd18c613392def2fa;
      expv[21] = 128'h4a5d8012ca4a27c6953e03545f86ce7e;
      expv[22] = 128'hb98ba9a24554ebf63e98433212795b31;
      expv[23] = 128'h342ae5fe342d1490008069f0225c5ec8;
      expv[24] = 128'h7119747645da12ba51b2f148f3523bb6;
      expv[25] = 128'hfe35b43580ff26bc686a8f84e71a5db8;
      expv[26] = 128'he6c793aa4a42c40b8f2fa85c87d04d73;
      expv[27] = 128'h1d2d52baf16c65adfd9c476d6795ead7;
      expv[28] = 128'h13c2ddfe0d59e8a7bb2a0dadf8efa6f3;
      expv[29] = 128'h38874eac789143b716e37de0fca1c459;
      expv[30] = 128'h9f1217225363763cb0da92c9d8d9dfd2;
      expv[31] = 128'hee9aaa774d1c44123c19efcf3aef9ca1;
      expv[32] = 128'h49f5db9f641aa152b8ce8ead460c4de4;
      expv[33] = 128'hec53ca2e562eb5b271b192ef289db609;
      expv[34] = 128'h8bf65314cda475191983a2cf99c81fe4;
      expv[35] = 128'h39d0334d8375ff296f1acb752fdada86;
      expv[36] = 128'h023501bb87b9c7bc29bd18537afa4f3a;
      expv[37] = 128'h0765d7ad6f5261d1308537bdef21013a;
      expv[38] = 128'h28a75ca230b134f1f1f034c9ea59a529;
      expv[39] = 128'h86eb5151be97541f055359c4284b4b56;
      expv[40] = 128'h258f7b841917b85b3b2f9ea9bc0b120a;
      expv[41] = 128'hfb431b94fabc3d2f80ec597f8ee5165d;
      expv[42] = 128'hb7c6163d5ff8abf14d0107f09c9add9d;
      expv[43] = 128'h227bb01c802308e5764a32a70b26dbad;
      expv[44] = 128'h128e3d8c85828b9bdd9fff9675c3fe9e;
      expv[45] = 128'he4f9182b480135f595e7da4f11d6deef;
      expv[46] = 128'hd6827a46123d5862effa59492f97036c;
      expv[47] = 128'h038f08b3138cc376365a8facebe631c8;
      expv[48] = 128'ha10b0e09653bc41f9bafc09c3c097fea;
      expv[49] = 128'h58f14f5fe119e0103fc8e390fea63b20;
      expv[50] = 128'hce27e68345dc66546b54e0a6d0d6b839;
      expv[51] = 128'h4d90a34ab90c7b036bd9d1c2e2c6a855;
      expv[52] = 128'h204f297448703008778c056d36c7629a;
      expv[53] = 128'h32d5d5de114e87a81459c2b9e468317e;
      expv[54] = 128'h6606643dcbb10493e6e55dbfcaa166d5;
      expv[55] = 128'h516b66078d0c99f1e685995549bb745e;
      expv[56] = 128'h86ca40721941d93709179fd66498a69b;
      expv[57] = 128'h5d577401c3e60d15d5021cdfe61372b3;
      expv[58] = 128'h72cdb349670fb7aefe35896c12116c18;
      expv[59] = 128'h216c9e09cbd7a4343ff993a828746876;
      expv[60] = 128'h3302876205db47483114f7098b8384b0;
      expv[61] = 128'h02f4ad4a8c1b87e599228bddcada750e;
      expv[62] = 128'he5b04de2717ea215f97406edb48d5292;
      expv[63] = 128'h635c5fe724693f0dc940462fa0f21831;
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
