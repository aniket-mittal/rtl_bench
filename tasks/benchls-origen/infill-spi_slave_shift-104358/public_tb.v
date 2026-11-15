// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 324;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104358 dut (
    .clk(clk),
    .SCK(in_vec[323:323]),
    .MOSI(in_vec[322:322]),
    .SSEL(in_vec[321:321]),
    .data_in(in_vec[320:1]),
    .toggle_out(in_vec[0:0]),
    .MISO(out_vec[1:1]),
    .LED(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 324'h6b1c9a3819693ba40cf55428f89feff4a49f410f7053f0c111125d6a7c370add0803c034ae1264162;
    stim[1] = 324'hecaecea88bf306ac9e064988630da2882c2c2c1b4ff85b6858cce8193b11e4fcfcbd31d872796cdf6;
    stim[2] = 324'h0a1aeda7e192da0025f3d2b71064e9adfe16bd06a8b15d58e3535fd3b0ded0f5ee358e05de60e92a4;
    stim[3] = 324'h7396c2499d603542d572337737603ac818e42c0a2e8bff165a970b5e2cc0f153e05db5d801ffa34e4;
    stim[4] = 324'h657a50c1602719150d15be8316962c8aae4d72cd23a4c32d66ecc5479747863fb1944a7fb6c83573a;
    stim[5] = 324'h7bf4c7d1ae37ed39e1c3c87bb7fb79a90a72c888ed74bf3596d5dc6ff0d2e9e7596aad5170194d64e;
    stim[6] = 324'h4fc69bbd482c5f47858cdbec44f661031936e34ec739f47a0a5fa7d2e3e7ca3f4765971d2d478e89b;
    stim[7] = 324'hde1b10de67d684fc7e04792c6402fd26389fe289e36dda692bdb575172f29715d1a600e310c40fe37;
    stim[8] = 324'h38d0d24bf75efd0552a850bc16c8f8e1b0cd15e388b9532f8d0f084e0880b0ecf32786bf18442ad04;
    stim[9] = 324'h16ae95545ecaf5b5f78f86076c1d3ca92b94cd261ab0985891a507025710c36d31c1f4cc7a5980a93;
    stim[10] = 324'hf287a92160b816c8bc4b481d58f2ae1dfba1106949abb332e7e53e9470ee18d0941ab592cdcae7f87;
    stim[11] = 324'h28a82f0355b8b41c93027932e716d9fe057d5fb8d18de99e88229aeb8bf16f9ee8541e2517c0f4d30;
    stim[12] = 324'hcb52da245c261580b121005d2d9d8eb17e6ae26b10830696e10a74d7033cf8c197f5b162df7eb7158;
    stim[13] = 324'hd3fad108aab8ff2b1f363532c918ebe8c96eb149730341510eb116cf4b22e9d9b10a2677615499d53;
    stim[14] = 324'h1c01cafad8555186170119cf10fe4de843577747309c555d8f8dd328ee60f2f45fe4ab01413335cd5;
    stim[15] = 324'h5d136909d83733c993d7e305d9ab082baca9572a69ed5f6ae4ebb9fbad37909393d15d233db576df9;
    stim[16] = 324'h5c0abb53b1621935aa4d70e2723880dc62811e79a644fcdd00c1cbfd5d921e742d241c9f9a7948e40;
    stim[17] = 324'h225f1557275edfa3cdf18f9ab83594227ac4a4bad4670b30e525af7edf7c9d31ff86acb792b7a38f2;
    stim[18] = 324'h68808e832d28eb0bd554d51d34fe892f2e323029c4bbe09e47717b126583334d421e8ebb7702a705c;
    stim[19] = 324'h56111389a137bce8240fe6fdad2838aefbdc7df19cef8788c257e56c0942e8086ae25c65e4566b21f;
    stim[20] = 324'h8f624d738b17dde7208916f3410b939d182b46413c9dd73311edd0f37d3556cb052da8e0ad568a1d1;
    stim[21] = 324'hc404da5631e3547dbd6f4ff0ac35a92bcdee54ffa1e2fd0ed630514d8101433672019d8672f3c2135;
    stim[22] = 324'hc01d924974de8016aa05f977b4c484c3449004fdd71e0ca771c51f9a515abc445b8bc67007bb4c16d;
    stim[23] = 324'hac42b4660d55f1a6c17ed91aad59c9c0add4e37649e484b1b118f62d5f9e06bc1a243fcb6a59bad16;
    stim[24] = 324'h1135edce57396ccc2de175a953c963db54cc46483c41d32f9494e99f758cd7816b0b576047d0183eb;
    stim[25] = 324'h3103c69d5aceec4bf84ad72986b483351cb97cf1bfc63df91e1c35ebae5c3759c3d84c85d7b324c71;
    stim[26] = 324'h2556b995011b719cc67b5e06c1cc202cc9a79c95a5d1c4ffeb05d139d9650dcce213e31e916f9b077;
    stim[27] = 324'h2a22e6faa4d73327864ae5c92f047a9221863293ec40be88c43bfea8097f1653aa15d5c8b85255346;
    stim[28] = 324'h247cbcdb276a2fc0b4bb5ca0366ddac616f65877129ff040c722c9cb5816f13bbff63880586cd2ac6;
    stim[29] = 324'h63bad504131ff560ed8e0f18d46261708facfed710d03178f3c83c7223eae5dcb1511d84c44548c2a;
    stim[30] = 324'h557f2966a0ad75ac568af7bd5eb7ae6e48e0a12a8cd5f0014bfac47ea94f606afcb1a686ca32400b6;
    stim[31] = 324'h3337e2463a3c369a166023d5ee6047c1e452ec0de45a56323a8e172cee67e199cb24012f4bdad8bbc;
    stim[32] = 324'h395d6c0d493f4fc357a6617a6653a5ab64eb7e73d4ee14fafe365584b7112c6425b5476ae83d25394;
    stim[33] = 324'ha72732474056a1e7269572db7b56790f4b8cb366a5779f10787e77c1cfc693712ce8c6bca4b9a7e60;
    stim[34] = 324'hbaf34286647fac0dfcb399bda50a0fce5feb1d65238cce43aa4131ef5d25d7aca31eb3c778de2aff5;
    stim[35] = 324'hc3dc8d156c9aaef4783b4ba1dd9bb0b4743710c0bfd8da9919744fd428138f88e6879a67fd7423b8c;
    stim[36] = 324'h6cc925bc98957a64b1d4e14b40f3283dea0fbd0838383a20ce092ffb80a352850ea6730b3d7d5b5ae;
    stim[37] = 324'hbf2947bee411e8f67c90cecd9fc07b018fef6db47d35210681c94de553fe4e2dd4f7e5e4a071084b9;
    stim[38] = 324'hf4be91ceb43324b3323dbeaa2d828f4327fb552b0d6ecc02092e413176c645c9809be78536f438230;
    stim[39] = 324'hd44a2d11fefb430ac6de882eed67343b526e8c47661dc44dbb8428137c57e6c2827a09c0f07f4df11;
    stim[40] = 324'haf8fbd74b4ab41657b463d852aeb86666752c59cb5924cba77a95fd857537caa2942f3937d185ff6d;
    stim[41] = 324'hfcaea2212a62392e75fb260f6fee583f6380d19424740c6386ba98f84ba5c596f6c25a5d7b1de57ea;
    stim[42] = 324'h82331f1b3dcdda9bf4c0542186d1cf315b86fadbae58abe123c0703a927e413a15d7c1ddb9886c240;
    stim[43] = 324'h076d4523ef9161900966bd56005bdf67153df387bc24d1949086ac0fbbc95041ccb47e4055d34d27e;
    stim[44] = 324'h999a3be393db4f9f51f0d953741f955dcaa615b3bbbdca49e62dd810aee07e1e6ac451694fb46c2ad;
    stim[45] = 324'h210e41bee30015a6991d83230abf5956dbb0a1027245b4143721d0a3bda3f6096c71db3fc5e6b58af;
    stim[46] = 324'h72f6bd260dbb00903e5b0b63c5540e23f8e9e494bb947e3b3293da5b398c2c125b51a3419a8f9459b;
    stim[47] = 324'h941c90df39c00cbfc800ec944ced74dcde786feced8110d5a4cfafed0d5d30aa4f4f7b5da63970ac0;
    stim[48] = 324'hb72b513b44b7fbc1a52d2cc2e7bd2f7945a2665c4c3241318b98254b027df9e43c279bc7ffcfa792a;
    stim[49] = 324'hcd131066c6130734b618297be60cfe0e6d18f82028c8e28c774edf7bf227ff453012e55f459781d68;
    stim[50] = 324'hf99bb2885535d5a0ad624d042d6cc9031c1a44efebaf062737da96f8dd7f320c1d657dd71ff8a8a8c;
    stim[51] = 324'h310db45d5424b0210046e2a695a25ab66a0781e7f4c30a77245ad9fd99edc1389f5278aeb6cb6b8da;
    stim[52] = 324'hcd9e5130d5b1d264df312d922e27bd1d5c3d6ae6e4806973e942ae7d20bfec5e4888964954c41560c;
    stim[53] = 324'h90981183076f62634c1769c1a34ff5624c95329f00dce2adc391cfadf6239ea83d222a0e8e24ddb3a;
    stim[54] = 324'h76c1f7cf4a4df5bdbea1e2ad90fed915d26725e6d3119ee541b65acea9ef7686239c81e1bf96bcf58;
    stim[55] = 324'h372f68b014167568690a7391d8a091b41e6f2ae2170e4266aa1aa9c556d5b4e095418739a3158aa50;
    stim[56] = 324'h22c15fc39e69ba35b1ca93414e61b94677170c905e662496f45d40a7f7afe95919157d4a4844862fe;
    stim[57] = 324'h3a0b6ccea0fa13c1518bff755fb2705e767f88e3e5307bdec065cf123171be97b19fdf04faab0fc32;
    stim[58] = 324'h8c3ffa24f8daa6689056ac2b40bff3f08076dd15e329d08af70fd24c2f6770f9fc5c8004bb5d79277;
    stim[59] = 324'h621b2f2933dd65e50cc481c5fac4774d7d75c379f0348904d3ab41c94812fc4ed8ea249045971e90d;
    stim[60] = 324'hd5a7033a8d54fe0458dce33c960286279eb565e5c851ce59f34295625f54c58d6c36332a7135877c4;
    stim[61] = 324'hefbc44784be6cb9dd185756c46370d347300907a33220bd8286f17f351ff168ad79477a3da1eb856c;
    stim[62] = 324'h72f0b9fc074b8b525fccd1fe956ded5a41dd9c793a916344702ec4e133253ed14254e0c59f6830655;
    stim[63] = 324'he663dfca2b3346c88bb52d5a884b0bb008790a2a42447a7acc574b27b3342f4e2efea25fbdcb24eab;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h2;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h0;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h0;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h1;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h0;
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
