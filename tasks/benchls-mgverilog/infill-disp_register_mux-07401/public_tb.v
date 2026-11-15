// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 261;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07401 dut (
    .clk(clk),
    .rst(in_vec[260:260]),
    .GPIOe0000000_we(in_vec[259:259]),
    .Test(in_vec[258:256]),
    .disp_cpudata(in_vec[255:224]),
    .Test_data0(in_vec[223:192]),
    .Test_data1(in_vec[191:160]),
    .Test_data2(in_vec[159:128]),
    .Test_data3(in_vec[127:96]),
    .Test_data4(in_vec[95:64]),
    .Test_data5(in_vec[63:32]),
    .Test_data6(in_vec[31:0]),
    .disp_num(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 261'h1d0b9336f4ca1617d89b39faf2b6c1bf3f16890a8b45b57c7b3e0f122c647edc48;
    stim[1] = 261'h1c81836db410599085c96b1835e0c933a423ff7a3ef7c532addf77a89cbb4c2643;
    stim[2] = 261'h01639cb06c609576f6019a3bbd0c422852e440fd36f9ad5fa9cb9708b928fc7e98;
    stim[3] = 261'h0db4d312b549b940275dbe3e85889519c0f98b1410280e4c61a56e26bb7157f384;
    stim[4] = 261'h0fc34d5ba027c723e4fd10064505d5c72847be07eaf1424a873b7a6608ac76de4f;
    stim[5] = 261'h0e28a1d533d6b1e4addc99a2c68a70512fae6817e9a01c3d4eeadbe74cd2453906;
    stim[6] = 261'h08f61e4de2f29b1a1dee8b55b9d733f13ec8d6f7d79ff25c7c1e2058c3411770a9;
    stim[7] = 261'h0b8535b2127c5c8e20df2bc363454315db8cf84be8ec12a7bdd752b0b8acc4abd3;
    stim[8] = 261'h069c9245e326711bf9e6251e3b3a27afb466eb8e9c1e98362dd809cbc826c1dbf1;
    stim[9] = 261'h0eb53af9f030764db54832f391a9ad7ae07ed8aa14a594e0255633cb92fc600542;
    stim[10] = 261'h0d27acc3cfc181d5fed466939b01cfef44ccfa4b21d225c2bc4ca4b777fc896b8b;
    stim[11] = 261'h0bccdedb8cddb55c490430cb1a317444821547c138ac4c2fc13db9ff44afdec733;
    stim[12] = 261'h0cb7c65f5bd7e1e7fcf37352d5eb2cfe401a9b57a679252f91d2d2755cbd0b367b;
    stim[13] = 261'h026b57ecc40d27d179f9bb0b05fa29b1b79bd0ed1924b5328dc492a69581e59ee7;
    stim[14] = 261'h0ffbed0998d9a19896b9cea48f223dabf231ea941f8b254dae4819f59af06c7321;
    stim[15] = 261'h0964045d4bfd667ea1c6c7f54e9a4941c77eaded3a5cedf2a1f43368b12546a43c;
    stim[16] = 261'h06f3de31ec2f6b340aaa812436a526001304045c6eb8cae87766184760d468d66c;
    stim[17] = 261'h0bc82578f25655485b4975c407b669b3b7d72a76cb2026f837a8bb19133d92e4d5;
    stim[18] = 261'h0f2ff282cca35b9693f07bbdde2e797be112289540873f3878fb862a1e15ce46ec;
    stim[19] = 261'h0e05b01a241bdd20e9e41e4bca03973a749004691507beec925b1f0cd8c2ce2b61;
    stim[20] = 261'h00114c92c6397785a5c6299e407f50e46e7deb9f396532e938719e8b9574473b2e;
    stim[21] = 261'h02967b6888cb57830a5081958bfc791ac3eac958d1143c2df6e6d784c832ad7958;
    stim[22] = 261'h0b83db4ee02f9c8ce155861282194a2d61e642321310dae1e6f2e71875c6f6824b;
    stim[23] = 261'h0571fa3976660cb0270ac30865d3c0fae9eabd27e3ff5ec701488bbe5f3b46bfb6;
    stim[24] = 261'h08dc3b9e468565a0b2cc81a7fc4528f23e25845ef6069d7114accb60f4fb6ffab4;
    stim[25] = 261'h0b7425942089574924333e522edbe451eabab7b095efa164e3c35d8651c32b55a2;
    stim[26] = 261'h0492fee1c5f209c3ef107a57d5ea34f78fbb710075273662021917b233c9bb5370;
    stim[27] = 261'h06407020ed888f1fb5e41a8f8ae3335721740ccc73b4adf9d9c0508967dd698c46;
    stim[28] = 261'h0739c49550066f9c9596e269bd1aed67bece02702ea3f6f47df2f53b3046804fce;
    stim[29] = 261'h007b168e5d5d02857dfc5024639a0789f2a61ecd8e3c80529008ceff7e175d3cf4;
    stim[30] = 261'h0b7113cf27a8644ca8b5c1591c522dbbda1b383586e3a044e52da37a7b46e9e745;
    stim[31] = 261'h07f870b14923aef93ebd9a5062939ce33fbe8a8855f9938b4dc138b94bc2715c92;
    stim[32] = 261'h0f102b30eaba68c32f991c2468740fbb0d7b2a1cc51be2450b1964b122f594e3aa;
    stim[33] = 261'h0ae8f47507d3e1bc2f27241f4becf38b6b6ac5070b9410c708e5791cc256fffa60;
    stim[34] = 261'h076da60bceb36f179c260ee07d61fd0528a2d5af4c59d09d1cc9635d8fd378f24f;
    stim[35] = 261'h0424c12ef03927371179e4512800f5a90cd70d8d674576c7e849ed719c6c1c8577;
    stim[36] = 261'h08b4bb8007257af3ea37dd95ceaf473ee1570a7228286b5e8994600855545b6655;
    stim[37] = 261'h0e55a888498412fcc503c97d4e18de6ae03a1f03a64f97b17947c0657ab32f70c6;
    stim[38] = 261'h0aa96756d998f7d5efd9fe486e07b7c2b0b1b399bf3a74caa33a8b34b3df63b6f3;
    stim[39] = 261'h01643418fcd2b5e264d0c19b8b983e91d6183d7c2e16734c22dc8d7cfa6b1b9a50;
    stim[40] = 261'h05ef23456c1bfc1e1aea16fa7d4516d811563e1abeaba361e397dde41edf7ba546;
    stim[41] = 261'h094a78cc3d1f9594b865f1764d3bcd1fb2cc193d8ba83b695d29877cf101b58619;
    stim[42] = 261'h0778d63243ba98048851e712d963a432459f417641963c156a2e21a45c5dfcfe80;
    stim[43] = 261'h0085a620fecb7caa05f1b223a266268f062eabe6ca7cf3119c348d33e7c72ff085;
    stim[44] = 261'h087314ac343ebcc3697bcd5632627a33b2268a274056d444aeb676fdb8bbbe5970;
    stim[45] = 261'h0c1463254e368c62e0cdecb8751dcb7369fa55dd25fdc83f7c31b398a600e71f2f;
    stim[46] = 261'h03c66ab5e25014a940d67b67ae6a76f02e5f5db37faabb11ef608660e7675c64ab;
    stim[47] = 261'h0d08990cef99201011a17073aae2a911a3278ae868ad5f6396dd5117ff088b98bd;
    stim[48] = 261'h06ed3c1fa01458dd57311bf793520814a18943aa3068e8a73e5052187882343fa0;
    stim[49] = 261'h0f8ff56a8d32fbca7e15659a166dda58a2630c0f46998b420556b812932e6a3712;
    stim[50] = 261'h099f0427181382b22fbaa4d354e35feef9625594d1705c19645900f70ab04d161a;
    stim[51] = 261'h0376b75d33d024aac88b9aae61636e81c6aeee4aa231cb2aea0829b25696a74de4;
    stim[52] = 261'h0fcd7cb296aa61a21255f2178c09f1299132a6f36b8a2fe8c3f4e5f4a4af40c26f;
    stim[53] = 261'h04c7901163ecffab7f4e793bcb1c05fc919d3d7e89a2fd2dc1f4770e8ddc3416d2;
    stim[54] = 261'h0b718c53db3158df63f316d0d51dcb010ce057fb8817363b4d9d845fcbd9b0475b;
    stim[55] = 261'h04a2399e17e8f0ce70a1b12ca7569e2ebd65b4764f54f292c81e6ed770086fde98;
    stim[56] = 261'h0bb7f1953e525315e85011aebde6c6cb9b1d545e2b7505bd693e77a8f0d3a1d5ef;
    stim[57] = 261'h02bf18819df735246542647394494650323cfd64ac4db76e485426572986dae610;
    stim[58] = 261'h03701c55533f4a33a481f49c14039660b5dcb7f61aedd72fc9b7a6f1400aeac4f0;
    stim[59] = 261'h0fd0a709974e132168dcc8a9aa7bb2c57f75bbc1307d421046c241daf9e1377269;
    stim[60] = 261'h0854b436029508606374f464eb331255131e1f1cd1e5c9c187d8f56929f0416f4e;
    stim[61] = 261'h08100b66f81a6b35b4330a8eebca7d515f4253c198ab58bac47382fcb25049d297;
    stim[62] = 261'h033a6ed447d651599b36b9d433bc8e0ec5305301a714ba7c457a537dce404b2fb5;
    stim[63] = 261'h0614e2e025503de90ce1b722ee6681ed3689864593b3da0c46404df5a72363406f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h609576f6;
      expv[4] = 32'h280e4c61;
      expv[5] = 32'hac76de4f;
      expv[6] = 32'headbe74c;
      expv[7] = 32'hf61e4de2;
      expv[8] = 32'h454315db;
      expv[9] = 32'hd809cbc8;
      expv[10] = 32'h5633cb92;
      expv[11] = 32'hd225c2bc;
      expv[12] = 32'h31744482;
      expv[13] = 32'h1a9b57a6;
      expv[14] = 32'hf9bb0b05;
      expv[15] = 32'hf06c7321;
      expv[16] = 32'hfd667ea1;
      expv[17] = 32'h66184760;
      expv[18] = 32'hb669b3b7;
      expv[19] = 32'h15ce46ec;
      expv[20] = 32'h5b1f0cd8;
      expv[21] = 32'h5b1f0cd8;
      expv[22] = 32'h5081958b;
      expv[23] = 32'h194a2d61;
      expv[24] = 32'hff5ec701;
      expv[25] = 32'hdc3b9e46;
      expv[26] = 32'hdbe451ea;
      expv[27] = 32'hbb710075;
      expv[28] = 32'hc0508967;
      expv[29] = 32'h46804fce;
      expv[30] = 32'h46804fce;
      expv[31] = 32'h522dbbda;
      expv[32] = 32'hc2715c92;
      expv[33] = 32'hf594e3aa;
      expv[34] = 32'h27241f4b;
      expv[35] = 32'hd378f24f;
      expv[36] = 32'hd70d8d67;
      expv[37] = 32'hb4bb8007;
      expv[38] = 32'h47c0657a;
      expv[39] = 32'hd9fe486e;
      expv[40] = 32'hd2b5e264;
      expv[41] = 32'haba361e3;
      expv[42] = 32'h1f9594b8;
      expv[43] = 32'h5dfcfe80;
      expv[44] = 32'h5dfcfe80;
      expv[45] = 32'h7314ac34;
      expv[46] = 32'hfa55dd25;
      expv[47] = 32'h6a76f02e;
      expv[48] = 32'had5f6396;
      expv[49] = 32'h50521878;
      expv[50] = 32'h2e6a3712;
      expv[51] = 32'h1382b22f;
      expv[52] = 32'h636e81c6;
      expv[53] = 32'haf40c26f;
      expv[54] = 32'h9d3d7e89;
      expv[55] = 32'h1dcb010c;
      expv[56] = 32'h65b4764f;
      expv[57] = 32'he6c6cb9b;
      expv[58] = 32'h42647394;
      expv[59] = 32'h039660b5;
      expv[60] = 32'he1377269;
      expv[61] = 32'h54b43602;
      expv[62] = 32'h100b66f8;
      expv[63] = 32'hbc8e0ec5;
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
