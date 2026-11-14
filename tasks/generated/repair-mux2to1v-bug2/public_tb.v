// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h1f3690f8fee4a15f69a1760ea84030f4de2440efefc663e6f2e;
    stim[1] = 201'h04fa2c92f7c9697c3f2b7f91cacf6022a2770160b756dfa7f0e;
    stim[2] = 201'h0715b6506763027400e846d7f28da29759cc093df88f68c2db0;
    stim[3] = 201'h1fc2a608258451ba9cab656524b072de938b8bb02eeccf5a66b;
    stim[4] = 201'h143e0c00f335cde9a416bea9c2522c38d6048e43594917bbfbd;
    stim[5] = 201'h1c74545a15f1b01facbf9e16bd38d8d67c256c6004e9c715510;
    stim[6] = 201'h1bdd0c023a192a9bcd2336482e96ed47b9521104aa43cf4eadd;
    stim[7] = 201'h00c318e42f784a17630115a2223f96236ed5f8b520d60de26d3;
    stim[8] = 201'h00191aa3a8720aa37e4effb7324b9cf572045196d543cef9b2e;
    stim[9] = 201'h0c3ed0891a62a0f888714668ffa3d31edff26510d14a5a7804d;
    stim[10] = 201'h1b991d53911b9525d81a14da85e5cfc06acf5fd9bfb3203dfa8;
    stim[11] = 201'h11aa0280b0eb251cff80e824747b85a2abfeea3a5551185cdb7;
    stim[12] = 201'h0960202dd31dfdaca9ab081723fd51c9f765a973408ffa4f112;
    stim[13] = 201'h065f9a3644bc7fe80d30fa92932a5db5e3c7e9250c846c0a5b1;
    stim[14] = 201'h074c4661589ff0013d14496ef4f337d9857f87d852be5e98ae2;
    stim[15] = 201'h08f181d4d3e74c24340b8487f0a722be50a7eee27b87cf4836b;
    stim[16] = 201'h1480b391aeafb35bc7bb7c9569b33658f29bb3d30f2bf9b1c47;
    stim[17] = 201'h1c6fc2c4aa45d9249deef13e94be0b5888ceda974adfca84b71;
    stim[18] = 201'h177a465d1179b2471321b622d70af03b430bfc571716cd0eb3a;
    stim[19] = 201'h0ef907225970665b3b153ebc93da4fb729913eff427a5ab0c9d;
    stim[20] = 201'h04ad3fa87673d199fa45bef081803533a60ba2beab11b2c18a9;
    stim[21] = 201'h0c5e060d58c307845eb48cf0827558d003e0f5b75424f7585a5;
    stim[22] = 201'h05bcaebf996e50ecf247eeb9c3da9800abf99c8b877e08aad30;
    stim[23] = 201'h131c10b1cacc1cdb079c8a28d2ca5e08fc82b63be71bd139a1e;
    stim[24] = 201'h186526e4f9db14e228b231db5985df8c80d8983d4efd5652842;
    stim[25] = 201'h0b5f277ccb99fb697db4356d41e0eb6cdd5fc482495b799cf95;
    stim[26] = 201'h089c0b2787f2e5f73ab638a42bfeea016971d0b32da05da5784;
    stim[27] = 201'h17b0d543be5538ae9fbf4eb78cde81b64507b6f3b3cc742ea2b;
    stim[28] = 201'h0477f01d641202fefffad80bd9e01e18dcf411d23e59d61b701;
    stim[29] = 201'h19dcd5fdb4a85e4b6313bd9201e4ce2012889ade47b56312fc3;
    stim[30] = 201'h00127519b1b85a98b3b484c0591d375a6f6648d65aa77c1b33e;
    stim[31] = 201'h0c00be67f24a42962dedac658418354a62780c848d7fe53b9a2;
    stim[32] = 201'h0bc85b7d13386b662b1424f9ec9f09836cca938047170313362;
    stim[33] = 201'h0a7de329b21664fb2732c77ca029e108432cb013ef356f5696f;
    stim[34] = 201'h106a7b7e224e80683c236a584ca80e0c887a02e274a89e6f701;
    stim[35] = 201'h1c65a62cf0841d0c0412d23a7ac7fced5970cfe758db70f34d2;
    stim[36] = 201'h1722286823f4e9d29e00af65a778fb0379e4c3d6fd429802323;
    stim[37] = 201'h0c802ef2170924bb36d3d30593c83513eec52041ef3cf3dba70;
    stim[38] = 201'h13232076b38b568b9f131eaed7962249198e176a6e41e532e1e;
    stim[39] = 201'h0afbb3ca866f71909b85364512419cd87e0847cb9ebbba0ab45;
    stim[40] = 201'h180ea49961a71072d1d74544f86baffa04b9e711b2e551a6c77;
    stim[41] = 201'h09e87d40fa69f98547c8c7f6a52dc5c0ef9f08da7fba136daec;
    stim[42] = 201'h02d2b8652f2c13175f825df3153339bb1c33a28a9567fffa884;
    stim[43] = 201'h1d9d41582904a34f220adecbc7850e59b882c7a559949e4add3;
    stim[44] = 201'h0613a527698d59a0303ce24c6479fba80ad21ad8e573d7170fd;
    stim[45] = 201'h0d9f1860d4ba465d20b62e264e2544e8de4f281d0beb44721b2;
    stim[46] = 201'h1455fb93ed1fa6edcb8526ed873a5eaa57673b5bf2f9692c32e;
    stim[47] = 201'h04e43d75816670c24572aefdeab6443636399d76d9d0b0a0c22;
    stim[48] = 201'h0cc7453667d09aa26763b61e5e815092eb5717548f653e7675a;
    stim[49] = 201'h0207fe4bab6f4b7ceb175df0d1f5d5157e2bde32a308c09aa10;
    stim[50] = 201'h126b2f6547478a79ae974514c2e73f6babce056ebc19df10b66;
    stim[51] = 201'h03b55bbfdce7dfe0af11f5fd98f435d0aa5a6944629ad61c492;
    stim[52] = 201'h16e0f8ecf2e40b9a1c57ab8910c613e730219856de833330d7d;
    stim[53] = 201'h1cc4671623d698fd74d1e0d83528737668a6f6dfed87ae9e4d1;
    stim[54] = 201'h01c1c89c1782e7b6d4f4c986d24563763a6496d8fbb1494fdc8;
    stim[55] = 201'h0343d09182c2103429e2cb6767f8008d37b83dc5a00d38cae52;
    stim[56] = 201'h1f28ae8de23606d2f945679f85bcf5bdc1af4b612f8e24b904b;
    stim[57] = 201'h1e3f5a5a4d6c5f3de16edb1bd667cf23d060a990f3602be7137;
    stim[58] = 201'h02384da690db669b40edf28051cb52801c6b91171f03f4809cf;
    stim[59] = 201'h17b96dfbe7d9888524c7e8bb297350f61b9218da7ecf82c505c;
    stim[60] = 201'h0121c974dfef49c24a5be4a381d22a4438557a78e620d91b3ec;
    stim[61] = 201'h03b201ae399b22ae8792574154a657a01693134f49fa0fe7f3a;
    stim[62] = 201'h18dc4034d15022ede18b207aaca76cd594118399609cb8b171f;
    stim[63] = 201'h1e021d70f6d37639322d45d4ff605a770355cdf1df7a1123115;
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
      expv[0] = 100'h20187a6f122077f7e331f3797;
      expv[1] = 100'h67b011513b80b05bab6fd3f87;
      expv[2] = 100'h46d14bace6049efc47b4616d8;
      expv[3] = 100'hfe1530412c228dd4e55b2b292;
      expv[4] = 100'ha1f0600799ae6f4d20b5f54e1;
      expv[5] = 100'h9c6c6b3e12b6300274e38aa88;
      expv[6] = 100'hdee86011d0c954de6919b2417;
      expv[7] = 100'h0618c7217bc250bb1808ad111;
      expv[8] = 100'h25ce7ab90228cb6aa1e77cd97;
      expv[9] = 100'h61f68448d31507c4438a3347f;
      expv[10] = 100'hf2e7e03567afecdfd9901efd4;
      expv[11] = 100'h8d501405875928e7fc074123a;
      expv[12] = 100'hfea8e4fbb2d4b9a047fd27889;
      expv[13] = 100'h32fcd1b225e3ff406987d4949;
      expv[14] = 100'h799becc2bfc3ec295f2f4c571;
      expv[15] = 100'h478c0ea69f3a6121a05c243f8;
      expv[16] = 100'ha4059c8d757d9ade3ddbe4ab4;
      expv[17] = 100'he37e1625522ec924ef7789f4a;
      expv[18] = 100'h85781da185fe2b8b8b668759d;
      expv[19] = 100'h77c83912cb8332d9d8a9f5e49;
      expv[20] = 100'h2569fd43b39e8ccfd22df7840;
      expv[21] = 100'h62f0306ac6183c22f5a467841;
      expv[22] = 100'hed4c0055fcce45c3bf0455698;
      expv[23] = 100'h652f047e415b1df38de89cd0f;
      expv[24] = 100'hc2efc6406c4c1ea77eab29421;
      expv[25] = 100'h5af93be65ccfdb4beda1ab6a0;
      expv[26] = 100'hff7500b4b8e85996d02ed2bc2;
      expv[27] = 100'hbd86aa1df2a9c574fdfa75bc6;
      expv[28] = 100'h23bf80eb209017f7ffd6c05ec;
      expv[29] = 100'hcee6afeda542f25b189dec900;
      expv[30] = 100'h8e9bad37b3246b2d53be0d99f;
      expv[31] = 100'h0c1aa5313c064246bff29dcd1;
      expv[32] = 100'h4f84c1b66549c0238b81899b1;
      expv[33] = 100'h53ef194d90b327d939963be50;
      expv[34] = 100'h8353dbf112740341e11b52c26;
      expv[35] = 100'h63fe76acb867f3ac6db879a69;
      expv[36] = 100'hb91143411fa74e94f0057b2d3;
      expv[37] = 100'he41a89f7629020f79e79edd38;
      expv[38] = 100'hcb11248cc70bb53720f29970f;
      expv[39] = 100'h57dd9e54337b8c84dc29b2289;
      expv[40] = 100'hc07524cb0d3883968eba2a27c;
      expv[41] = 100'h96e2e077cf846d3fdd09b6d76;
      expv[42] = 100'h999cdd8e19d1454ab3fffd442;
      expv[43] = 100'hecea0ac148251a791056f65e3;
      expv[44] = 100'h309d293b4c6acd0181e712632;
      expv[45] = 100'h12a2746f27940e85f5a2390d9;
      expv[46] = 100'h9d2f552bb39dadf97cb496197;
      expv[47] = 100'h5b221b1b1ccebb6ce85850611;
      expv[48] = 100'h40a84975ab8baa47b29f3b3ad;
      expv[49] = 100'hfaea8abf15ef195184604d508;
      expv[50] = 100'h739fb5d5e702b75e0cef885b3;
      expv[51] = 100'h7a1ae8552d34a2314d6b0e249;
      expv[52] = 100'hb707c76797205cd0e2bd5c488;
      expv[53] = 100'he62338b11eb4c7eba68f06c1a;
      expv[54] = 100'h22b1bb1d324b6c7dd8a4a7ee4;
      expv[55] = 100'hfc00469bdc1ee2d0069c65729;
      expv[56] = 100'hf945746f11b03697ca2b3cfc2;
      expv[57] = 100'hf1fad2d26b62f9ef0b76d8deb;
      expv[58] = 100'h11c26d3486db34da076f94028;
      expv[59] = 100'hb9a87b0dc90c6d3f67c16282e;
      expv[60] = 100'he915221c2abd3c73106c8d9f6;
      expv[61] = 100'h532bd00b4989a7a4fd07f3f9d;
      expv[62] = 100'hc6e201a68a81176f0c5903d56;
      expv[63] = 100'hf010eb87b69bb1c9916a2ea7f;
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
