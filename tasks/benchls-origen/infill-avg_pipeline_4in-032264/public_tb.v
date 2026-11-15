// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 386;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_032264 dut (
    .Clk(clk),
    .Rst(in_vec[385:385]),
    .Start(in_vec[384:384]),
    .a(in_vec[383:352]),
    .b(in_vec[351:320]),
    .c(in_vec[319:288]),
    .d(in_vec[287:256]),
    .e(in_vec[255:224]),
    .f(in_vec[223:192]),
    .g(in_vec[191:160]),
    .h(in_vec[159:128]),
    .sa(in_vec[127:96]),
    .one(in_vec[95:64]),
    .two(in_vec[63:32]),
    .four(in_vec[31:0]),
    .Done(out_vec[32:32]),
    .avg(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 386'h3cda3e719023d999e9ca9e6a6be26a77e45cd2acf194eea1aa96269e9132b5ee63f30e1ff4a4448e2d586dd4a3a07a555;
    stim[1] = 386'h2c04562fbe77f3b575e1d0cf5d4baf3778d800e09c60d33a6f8bbc3650e2750019a5dbafc34c717a6483ef2b2681393be;
    stim[2] = 386'h12790563b19ffbc3df79e09dadaebe88c3bfdfb17e0449993e9c9afa12606dfd2da333a4d1f0292d8a42030ebed21ea2f;
    stim[3] = 386'h06294f3bf3bbea6cfbd95d7b3f54389e54d7fa7136b10f1e4657d4f31c252ffc28517c5a987a98a0a7066b87c415e405e;
    stim[4] = 386'h1f1998a1c167d9e408761fa747f80b695f023ac8f6732d7c4f58cf9409c7f9b5085202c7d17242cb2ced143e073310cd8;
    stim[5] = 386'h07eeba64063104a7d1dc10c56ebf51290b0f9f7666c57ad96ef9d7617fe1661c5d39dc4bc55db35aa240ac6ca342fd117;
    stim[6] = 386'h06e1ce8aae199b33d0e460de2448bd292920357d4e26ca76607b20a7969275f176638f05dc7b298b2bc935f4a622a3368;
    stim[7] = 386'h10a5c14a9bde95d1b0acdee2b22c71dd8e3dcf6192b427f90df5ca3c63564f1c84cac32c210a938c2c529fdc146cc67d9;
    stim[8] = 386'h1d4fc5dd43f6b6a16ab49b63e3ebfc8cdf1ddc1af044a2174a02d8a074ef5e98ad1b8e3512b2a931161ebd67799c68ce9;
    stim[9] = 386'h0b55d903fc8987668d0be7cd4ae307f0d942306d8051b6ac2b97ff4908028a31ddd4d307ffb8b5479091e9a9d7495efb1;
    stim[10] = 386'h0af37eb11897734e2f055e4614434710ad1c52ac7083b499f1f4ac10147cc0ebbc4af2498c05aa8145be5a698bf5716f4;
    stim[11] = 386'h07d8cb7509ff43d6530ea59fd4498396f403241f08db0fb79d0a57767539ff2e05d8b9dff12c26cb57b76c5868ef45d4a;
    stim[12] = 386'h0ab55a1257908bf4861b3446a5b7a645675a92e72f2409c5a845658018425283f9ee196c4fe2cdeb9cfca231a99cb7de7;
    stim[13] = 386'h040c024676afe27f387230341aefbf3a00c79b911355f25b34815627dbc9b0b2f81cea670536a670c741f457c078a6e01;
    stim[14] = 386'h082e8e7cc38179bc9c381f89c2f413f2d73a50b8ae78091e14bd92041ea68bbcfb21f7e6bb8cfe00ecdce7137c8e79546;
    stim[15] = 386'h1b4b1789fd1adbed7943fa4f9816c717874288d78bde44ca7175f27cca3dd42980ef01d7017d32caecbf3f5c5b521f2f0;
    stim[16] = 386'h1120d9cf5543c656ee0242121c9189cedec986d3e40615b3c0a908d0e032c16650621386563ac9b5559c42e6d45e5b090;
    stim[17] = 386'h1cc9b35b153bd4e4e34dcf8aaa349de69f58708d3462bb33d24ad839c7a36f2ed941d650488e9376408f77c7db06b3d34;
    stim[18] = 386'h12d9b275fac292c0cfe7cfd5218407d6efb396d8003d8672ade50e02802ab573953ded9c25f3552b53b40f050d40fd315;
    stim[19] = 386'h0a2c54e890db74fbb9e13af72808c8a2a4cf899894a08045f0f434d22e6ecd6e7fa9fd3c61f3e8bcd93bded4e5930d983;
    stim[20] = 386'h066630f37bdca55233739b849b73c61703775ad6162faf2e3cd0a67c4d050d7a23f738ce617037618cdf4c10bb53b1b54;
    stim[21] = 386'h1c92237fd51d9c33ef2ae1292c634c2152ad3f74ebab850130700f3ae68e13fdd12067431cee91087c840b910068e36d7;
    stim[22] = 386'h0d2f993f329de6d1a21891515623c12f8d457f360373777b6600d6aa6446bcc9dc8e0974367f331b6e250168a250490fb;
    stim[23] = 386'h1d1762f7ef5ddd961f35a52ba05fdf6f39b4f53dc6ef727d2c185b389f223dda48448720eb483d834ed0fe80e7edbddb0;
    stim[24] = 386'h1abf90724135dab5f8c86ca1adab95fed59d2609a52838c23bbce719da4cea14d50c956661661f1d9a7ae20da9106267c;
    stim[25] = 386'h16ad6623cb0afe125654fd9dd5d777b9bc40bb16f18a44d88c684c1f10c83be000b73b3722fe3815a6ed69ea9e0e39cf8;
    stim[26] = 386'h17690bc63351cc88d5f3bfae70dca30aabbb64ac6df4207a60a314762b383ac4f092b7bf07fe80bf732590f388abc2853;
    stim[27] = 386'h043a774d54e21a2e5568f0ea752e3ea25c89f65d979f4f392c2ad84d5afb21e488d3162cfd41549200a1b1f1d5f290ba2;
    stim[28] = 386'h01e3ff51080fe121b6fedc001d014ac2e1591075660996ff040f39e4835ba7bd0142c6e26d95cb42afca952d3ac4ffcd2;
    stim[29] = 386'h1d47543eedf4467668414e52c4bbb8fa75626240ecd3822d052f09e38827edbdd78295acd2c73ddb72508c59e3cf0b08b;
    stim[30] = 386'h02779e2a8ab1028b71f42a061ce1641a980c75aa84c02b4d7fb233b27138bd2052011105cfad911f477185711599976c4;
    stim[31] = 386'h1b3c7330de16b19b434143f064eae0205368866f1ad0a8b3226710af1e1d6cbd13b8136be852da2bba8721e59ce12072e;
    stim[32] = 386'h0916ada11b4e915d74e9e2a6cd6b348cf04509a562894c6e4f9d48d3b8fc4eb02501332ad4fce96c97196f84d6cfd8cd9;
    stim[33] = 386'h0215b7b97a1db2e0e1bc78335e3605280386125eb091b721fa4b33e47b1da548f5854555e217b142bafcf7f72ae54af4e;
    stim[34] = 386'h172ada2c9c80d462e31b7b383d6ca7269619c2053f49b7cb79b925269855633047cbd0a3da231e7fbbb6d16fdf76f552c;
    stim[35] = 386'h0b0e93bb638a9ebd06cee32767e5040d23fd660c13cd77955edc0339bbac1bf0b879694fa8dc5b59088f926f97b27f0b6;
    stim[36] = 386'h1bc9819288afa89dfff8b3c5c9b8f117f9ab87f86272f939d0359f11305f18fb9b2d8353757cb3d1f4c813c2146ebac7b;
    stim[37] = 386'h013969f52313bd9fc0a8de8e77a59a35755879eb3252293796bb305fe4c31121802d1b507f0a49fbc1f0a07d51c402e28;
    stim[38] = 386'h0d35e71bb843cc6cc3822e4985bdaa5da847a07cba298315d68be7d96234f1ae5cea8e1d5b06fc268e7305415a0569d77;
    stim[39] = 386'h185bd551e670b0f727b51afd7c476a5581d8c2d52532da89286520ab88754c19a225de6c5153c299abb9a25dc81e1e25f;
    stim[40] = 386'h061589f05cd317a83a9e03f30e33a549c3f9eade86346036718f51c3014ab6d57a2db1251a7b5077fbc4489daf5358688;
    stim[41] = 386'h18ab0d9ffa0c4eb0d6d734a15a4ebbc4f505e88ebcf4a1501fa424cf5d98545d5fc809a221db4bf9ccbc1487b98c89af7;
    stim[42] = 386'h1d736c83d4c0344e9663e0cec08dfe8830774de69a7ca8bba630befd66bf9d001feef1a309ebdb34ff4e678ca1d73f95c;
    stim[43] = 386'h023f0adf2a4d2828b44bb6b3aaa7c65a5af32586b36c913309098814997888bd501d32166ada79076dde9be40b5d64d93;
    stim[44] = 386'h0db26b093c632a1113e5877e90aa9d365f47abd0d76dfa3402a3b37f22dd87415225b66562994787ea6aca48722c0dc48;
    stim[45] = 386'h15f7dd87501eb915d95bf63e9049a6827bf6d802edc9372b6b3d841da30274425428bd2f077fa5336e935738aa42e2fb3;
    stim[46] = 386'h00b6f309fda53ae375d0b60c3388957af0d89bc6b5325f0ff0cf7cc7c13724afcc7454788576ac362c222c4c5195bfd99;
    stim[47] = 386'h1c6ad42bc2773620dbe3274a98c6e0c127da118e42801322df02c1f1639706a9b0e647548d77e4c413571c5457190c1cf;
    stim[48] = 386'h0eb381d911e8f33285efab019ea4b9d5d1f28ef7fe6e33fc5641075edd6c0e9228f47e76ce926c3c0fea37be68880cca1;
    stim[49] = 386'h17efd1a4bdba211efa8cb3224965c6276aa1e6395fc6c8c7de8a4910751ff60dea09e701fad42fae7599d214a44966563;
    stim[50] = 386'h09b6deeafde7ac06d612dc2a33060faed510c990b58f34ac6a493e9535d139c47044c8f4cc1d49269dea86f419ce59bd8;
    stim[51] = 386'h1c552ef760c7eb59d77344f0751abc7e6f6533729dde361d1c633768b754d4bd524d8f8d47d30c25f40cdf888520ff8e4;
    stim[52] = 386'h000d91fd4653faf12e651eea2c9f107be972bee17069575f7288a5531895188161b0b61097c6ae20b18ca1debd0f2b3cd;
    stim[53] = 386'h0d0524d94fda59565e92bbf2d6afe3158e927f26208f1dbb8c209a27480566b8d2b9d01ef30ab0e19973d8d7a8072d72b;
    stim[54] = 386'h1fa51a03f7dda747b45d7591d0f5e2513400b498b020f3bfd1d9cb3eb3f6098a5b267285ec7a89e037c6c604d84bee475;
    stim[55] = 386'h046acad553ddbe2fafa00f5b82af8d38cf540926013264f74139d17b1a9c1e2624d6be2254ca615fb65b30ffc8da75f8c;
    stim[56] = 386'h05ea838f8878286dfefe7dfbd33252a9efdfdc0495a07ee3272c782fb769ec459066e95e7224c937933d5c1c53a42f630;
    stim[57] = 386'h019c5d9c191cf11c2aa19175bcc5eeb22dea0a117377eccb3b216f16ebdaefe219cf5d4dba87835d81160b00e98ec3807;
    stim[58] = 386'h1eed9ad5bf2486610deec6ba35537a7fcfed6185c31ea1647b8c5fd3a33c4aae062383b6ac6f3efd29f37ec185bc08f3b;
    stim[59] = 386'h1a40b75fb9f3cef875e889b9ec0d30f89eb3356ed12adc2ce8d9069b75a7e0f0d32688bba1d85ba01fdebf4d5c7e323dc;
    stim[60] = 386'h1eb7482ba6b1b5c1848fb2328f9d6255b624da89e53005e2106f0c2da56d3835e14390277b813f5c390551fbc7c8624ad;
    stim[61] = 386'h0966cd5da8bdb71813c8daeafcd00d23ae757ad3a6eb148d90a389b9d6449392484b0b9b3708e8e222098e57c7514352b;
    stim[62] = 386'h19d0b017b6b650e0852177f377863c43beb6bfe7258f92226d0b29363aafcb49d2410658302330aa6f8ad73a6e6f788a6;
    stim[63] = 386'h1580a8da1e4eeb315f759e6570b8d33e87c38fe13715175d9ddb638c8c517f52efa5df09866a68fcdf6dc0a719267e5eb;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h0ef46ac1a;
      expv[14] = 33'h1ef46ac1a;
      expv[15] = 33'h1ef46ac1a;
      expv[16] = 33'h1ef46ac1a;
      expv[17] = 33'h1ef46ac1a;
      expv[18] = 33'h1ef46ac1a;
      expv[19] = 33'h1ef46ac1a;
      expv[20] = 33'h1ef46ac1a;
      expv[21] = 33'h1ef46ac1a;
      expv[22] = 33'h1ef46ac1a;
      expv[23] = 33'h1ef46ac1a;
      expv[24] = 33'h1ef46ac1a;
      expv[25] = 33'h1ef46ac1a;
      expv[26] = 33'h1aec7c532;
      expv[27] = 33'h1aec7c532;
      expv[28] = 33'h1aec7c532;
      expv[29] = 33'h1aec7c532;
      expv[30] = 33'h1aec7c532;
      expv[31] = 33'h1aec7c532;
      expv[32] = 33'h1aec7c532;
      expv[33] = 33'h1aec7c532;
      expv[34] = 33'h1aec7c532;
      expv[35] = 33'h1aec7c532;
      expv[36] = 33'h1aec7c532;
      expv[37] = 33'h1aec7c532;
      expv[38] = 33'h1aec7c532;
      expv[39] = 33'h1aec7c532;
      expv[40] = 33'h1fdfff92a;
      expv[41] = 33'h1fdfff92a;
      expv[42] = 33'h1fdfff92a;
      expv[43] = 33'h1fdfff92a;
      expv[44] = 33'h1fdfff92a;
      expv[45] = 33'h1fdfff92a;
      expv[46] = 33'h1fdfff92a;
      expv[47] = 33'h1fdfff92a;
      expv[48] = 33'h1fdfff92a;
      expv[49] = 33'h1fdfff92a;
      expv[50] = 33'h1fdfff92a;
      expv[51] = 33'h1fdfff92a;
      expv[52] = 33'h14c1fc52a;
      expv[53] = 33'h14c1fc52a;
      expv[54] = 33'h14c1fc52a;
      expv[55] = 33'h14c1fc52a;
      expv[56] = 33'h14c1fc52a;
      expv[57] = 33'h14c1fc52a;
      expv[58] = 33'h14c1fc52a;
      expv[59] = 33'h14c1fc52a;
      expv[60] = 33'h14c1fc52a;
      expv[61] = 33'h14c1fc52a;
      expv[62] = 33'h14c1fc52a;
      expv[63] = 33'h14c1fc52a;
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
