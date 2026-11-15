// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_142474 dut (
    .data_in(in_vec[255:128]),
    .key(in_vec[127:0]),
    .data_out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'hdcb957207593daa6f9822d4c59bbc86bf0d2f95fdc1e25e11981f977a8baa36d;
    stim[1] = 256'h549ba4913463c4b0c0bdbc6d3cb257a8764d0a9aadf6727492ec60cc5812fe18;
    stim[2] = 256'ha9649fb5a2ae369a51614dac0f606bd4e2641f4a7bf60651007a5f76f3062ccd;
    stim[3] = 256'h75d6a8aff7c067428010e830e28ade181eb343b5732c59effa2ba843937800c2;
    stim[4] = 256'h91ca63fedbe362836c758ba3e36e0f2b1905ab772b77bc9e5d4eb75c527f1374;
    stim[5] = 256'h00eca9e20dc7d3ad650e0e4d2f567051e0c348ec5a33e1d6dda69c56c0d8441d;
    stim[6] = 256'hf209277800a4bbc0591b8bfb3c08d35d4c7924d830cc7ce3d57f28bb2c3521b8;
    stim[7] = 256'h23fc4008fb5297d54f8f14835798dd9f7deebd0154707eb575e3cc20a9fb4557;
    stim[8] = 256'h20ca8ccf7e1657894056712f384326093ae8f7b8fd75b136e66fb81238516e8e;
    stim[9] = 256'h50e5a60b4707b356f0f014df0f633a8ebca6bea4e3913f238f6b93c270481f72;
    stim[10] = 256'hdf893999e8c25922b3c99a47b2b94475c7f37e234374d72cf76fa9e5a236f89b;
    stim[11] = 256'h6d5f01049cd70a4435303e741d53c50f5ac221c851c7c448ab805a59a551ca20;
    stim[12] = 256'h9d9247f9aa0c900d37f01c9392a4fef9856c24214d3933129018254831eb39db;
    stim[13] = 256'h55f46798e91d050738d054aad9937d8e212ca43f7a84ecee4662efdbf8efc20f;
    stim[14] = 256'ha807cacc1c2b11716fbf9f46b0dff0864807106b4318090802b392839dd2884e;
    stim[15] = 256'h356e6b50a3fef4492ca34cab1276b60cbff707d9b954d44ec3ce040cbac1d4e0;
    stim[16] = 256'hc425db1e41ec6c435a878bd3e8fcd22ab2659458c1e80c74bfcff56fa1cf73e8;
    stim[17] = 256'h39b2d6a84bf936da21249815715739d079ae2e8d876038396fbb537eb58cb5b8;
    stim[18] = 256'h840be10942bf6f36860d82facbb07ca9908390a8a35eedf0b6d5559600efff7e;
    stim[19] = 256'hc119541a53027c99673fa8f82d4a85f1afd4843398f041acacad933049fa353e;
    stim[20] = 256'h3115c85f558ae9dafd0b5b8021cb2f2e75e04bc3322d99554b39115db14f9443;
    stim[21] = 256'h264b312c5d4ada0879f1f828ebc36af00501a1060f9a3128d159443734a44b87;
    stim[22] = 256'h81730f68ab76edeab5a45a4ea4cf10280c46274e8784baec66f5388c14ba46b1;
    stim[23] = 256'h2b72142b850e356d0ad64af0a6e854cb58ee69e96ba4b75a6643ef65f1c51af3;
    stim[24] = 256'h343a92d48296339627862b93b7ad54dcc2113eb8229ac4cff696895d2772deb7;
    stim[25] = 256'hd460e2f22a6831069b31d6e0262106ced21fbe7367615d755ea2f667480dee07;
    stim[26] = 256'h3bef3b84c5d995b06990176b048317138395dfd031a2e3c2a3b4a9688dd6fd9f;
    stim[27] = 256'h0e5feec0ff98ba7723153299ac5187657924db80cdc63e5d4e900b966bbf2b57;
    stim[28] = 256'hd277a1be142177a3f02a922ac25dd92dd97a38880f17dda67215b688b1e8ae4a;
    stim[29] = 256'h2cc6062b51b757f400b6d2044acfb2acfff6eb9294ab8a9905429c6a86fd9e92;
    stim[30] = 256'h813b9cd1e2b9f374fb84d770a2f9e41ebfae97815e08ab03217d137cafa1609d;
    stim[31] = 256'h6959bace7dc9d2e6a2226182a32072605f10fb27360bbace406baf6fb97ad41f;
    stim[32] = 256'h3acf3c09d2e21314adb9c79260a8918b290760a6174ea936cf81f4a039ab5f10;
    stim[33] = 256'hefc6cdfeab77b6fc2511e9ea8c650768dc6ac5ac16b2ebb1b31509b3201ab912;
    stim[34] = 256'hdfc246076f7aad7db3e998dc3a30ff90683b6b9a4e0586305b8c85289186eb10;
    stim[35] = 256'h525df40bf2d6a5eaf0df3ecad3c5e53d5c2bb6f98acd7f2f386edb30a3114b67;
    stim[36] = 256'hd0538425afac69232533ea0e06bd21e795daefb883a928c5464c4fc7831b8255;
    stim[37] = 256'h9219492b77652b35b54aa46dabedf8e7803ac486f5f659ce2f962cda0e564a40;
    stim[38] = 256'h6af77cae4147ed9df090315c0002870c496be450d6bdba293a226fa46fbf8b09;
    stim[39] = 256'h22acfd0a76699ed8a82becb82a9841c6ee16165649896bfefb639908198fe3fb;
    stim[40] = 256'hbebffb05763fd9011a49902d5fd019367c1301e67522b44d241383bf75ec756b;
    stim[41] = 256'h03f12a884e984efb2a063e37bd27fc7f26adbc500b904c4ade71f8a8cc395acf;
    stim[42] = 256'h329c99b11034e4af23ec6e3e51b0f98c9b3ee33810e2b157150b81d1f7fe0c43;
    stim[43] = 256'hf4eae65c29224365464bb48ef44e7a1fe0f823c2c8f31515fe3de31813c8ce20;
    stim[44] = 256'he53f8475512540aa6ee06aa02ac9880501bf7fefa3fe765d952cd9ab227848aa;
    stim[45] = 256'h33626e95f35d99b31b7455fbd994e3bd9d6baea87e7bb8d307657134949d87be;
    stim[46] = 256'hdc7abf8e7735352d23fac236c20fed34ef3bf835462ee2f1578ed8b506581299;
    stim[47] = 256'h3237abd65928b9400f0cb4a95cc274dfe5b1b90c3535f9080822b4b213fc45f5;
    stim[48] = 256'h486af5a0d357f92be87636c74e12332d792a38bfc2e4016adffc68a16507366d;
    stim[49] = 256'ha68eb0fb36f681407d2e3e1546bbb5ed268995d7c3e4988ddac11134af899fcc;
    stim[50] = 256'h9aa732a2f2ef6ee1a41bcd0dc9a008e9989d70c9ca4ce29efad8175025decf1e;
    stim[51] = 256'h57152d0da2fa6d5a4f600d9984d5ff5e49ce400c1561eba3a85fffee6d26a415;
    stim[52] = 256'h2d73c9ebfbd8a727157876bb8b2a18e2e903449d1085a83a99e246c8ba840e78;
    stim[53] = 256'hcdd4a1e3523284228b1898595f74321e89ac0f34c307e87344425f3a85e714ac;
    stim[54] = 256'hdf7eda81c7d1c3df9124c67a5ee409f0c94c30972bec653ea7104784daf9dfd9;
    stim[55] = 256'h2689c27ea4ebba08776b282638ae1780507ba76b2741a78cd750b700ebdf45f8;
    stim[56] = 256'h7b3c56761dd8e59ec5a151b6d7b61392a4ef5d9c9c4aa487ad59eba171d5f72f;
    stim[57] = 256'ha076c63115c81a3b87a013bf5b86ea2663a10e1880f280b2ffbee4f70f6b5bba;
    stim[58] = 256'he22520f888878acc1202dc8b0f26ef607a3b8883219fa7efcb9d81060e140498;
    stim[59] = 256'h309b051b3ea78e5527b3eaf8bd78ff62befa53c3292a083fc1536ced7f1100db;
    stim[60] = 256'h238cb8b9cb8d953e4bc43badfa4e2761831f96348b409de7f841eb479c2c247f;
    stim[61] = 256'h9c24f5d66f9fa648ff28291230d07395d60d0f95814e28f3a1a04004a99fb6cb;
    stim[62] = 256'he07c94049436abad52771b020051d3e4c718ba3ed15fffb1ae821daf77a25eb3;
    stim[63] = 256'h73d1423f75224469b1ea999a8ce2e5b757091bd46b0e601266a6074fb9b46101;
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
      expv[0] = 128'hf0d2f95fxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h764d0a9axxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'he2641f4axxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'h1eb343b5xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'h1905ab77xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'he0c348ecxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'h4c7924d8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 128'h7deebd01xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 128'h3ae8f7b8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'hbca6bea4xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 128'hc7f37e23xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'h5ac221c8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'h856c2421xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'h212ca43fxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'h4807106bxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hbff707d9xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hb2659458xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'h79ae2e8dxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 128'h908390a8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 128'hafd48433xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 128'h75e04bc3xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 128'h0501a106xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 128'h0c46274exxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'h58ee69e9xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 128'hc2113eb8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 128'hd21fbe73xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 128'h8395dfd0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'h7924db80xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hd97a3888xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 128'hfff6eb92xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hbfae9781xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 128'h5f10fb27xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'h290760a6xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 128'hdc6ac5acxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'h683b6b9axxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'h5c2bb6f9xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 128'h95daefb8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 128'h803ac486xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 128'h496be450xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 128'hee161656xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'h7c1301e6xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'h26adbc50xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 128'h9b3ee338xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 128'he0f823c2xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 128'h01bf7fefxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 128'h9d6baea8xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hef3bf835xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 128'he5b1b90cxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'h792a38bfxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 128'h268995d7xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 128'h989d70c9xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 128'h49ce400cxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'he903449dxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 128'h89ac0f34xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 128'hc94c3097xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 128'h507ba76bxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 128'ha4ef5d9cxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 128'h63a10e18xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 128'h7a3b8883xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 128'hbefa53c3xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'h831f9634xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'hd60d0f95xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 128'hc718ba3exxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 128'h57091bd4xxxxxxxxxxxxxxxxxxxxxxxx;
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
