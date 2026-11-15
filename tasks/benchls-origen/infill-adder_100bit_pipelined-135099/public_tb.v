// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 202;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135099 dut (
    .clk(clk),
    .rst_n(in_vec[201:201]),
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[100:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 202'h1084033c2c27900eb5e9eb8ab9439146312b331d1f7a7145157;
    stim[1] = 202'h1c1e88be3e57c3c4d76458fdd88af33f6aa9189d29e926ea33e;
    stim[2] = 202'h3d0a2ddc0674cf57d57eed0c35cc0c73bb2c958e67231ca0500;
    stim[3] = 202'h32433809bbdbc76cbea5d21c285cc7240af16a55692b6cb08a1;
    stim[4] = 202'h2c1e87f4e6fe2d3d68495b9b0326b22165ae7d6aeecb426e802;
    stim[5] = 202'h35dee8fac87d72d504e0db34d9dacfbcdd9b0c149be3b8d33d9;
    stim[6] = 202'h2d4b71aee0292a064b8be04364500182c8bffeaad16db51f7eb;
    stim[7] = 202'h3deea8bab6878e7cdf4a507961a40927fca0a376c45385c1135;
    stim[8] = 202'h3372a5777ed7dd2b1f182a8dbd125ac95ef2a469b572cb0498c;
    stim[9] = 202'h246ccc4afa7e727012301bc31cf34fefa536ac82fb709f94665;
    stim[10] = 202'h1be47491efdc4fa87298de079cda26a6d4ab7c87826c1e84680;
    stim[11] = 202'h238ea5ad0ab651ae0b63b0100ad2eb7dde0f7a2b3a184af63a6;
    stim[12] = 202'h288eb195ee9e1ec1254a023e59bba1389adca12966449b3884d;
    stim[13] = 202'h24f79a63a39fff0bc990737b1f37e98b32ecf0089983403123d;
    stim[14] = 202'h3db6a8ba95b77f363822df8a56d6f1fff916b2513733e689c09;
    stim[15] = 202'h20620858ef9cc58c0b6bbf2606f7058767cc7702b96910abd8e;
    stim[16] = 202'h2a901425d10710d5c6357db9d17383a31bef3e926d91cdd6f8d;
    stim[17] = 202'h25a9b89ea648ea8ff83e1602946de9459662e3ad13ada9bc179;
    stim[18] = 202'h332683ce5a1464a44ffb8f6b9a9ec75ab057c657d4c555d377e;
    stim[19] = 202'h2b661b5bc264d05c94a121b5db922b86fc3462a021f97bedf83;
    stim[20] = 202'h21cd5a19b773510ac3fcc85f8a46ebd55e921171410d2d320ef;
    stim[21] = 202'h3eaec416551164cb5d85e597db51afdfb510523c7575a49c9a2;
    stim[22] = 202'h39de327c0c4e071a39839cd97bf775f1dce4b8e6196560da3ef;
    stim[23] = 202'h257c2f07e4a38d72eb167dfc9cdeee882bc48eb7e58f7cc7669;
    stim[24] = 202'h3d7c6b591a7ea442f5dfb7ab5e0b454ee49daf287690cb993e8;
    stim[25] = 202'h2ac8f140a0a48f68b1208c2180976c49e584fac7ae0f0b6760d;
    stim[26] = 202'h3c55556364839ae57339582b2d3850d23e26982c67a4dc2fe3e;
    stim[27] = 202'h29128f951e01badfea4d0f5c490667feb8f0f94c7db8a84e751;
    stim[28] = 202'h3a422280e834d144dcdd7b8344c95a045b4c0780730a525292a;
    stim[29] = 202'h3e70cdecdbf158f1332f487860895e91ac99e0cc214d4a63acb;
    stim[30] = 202'h21ac2030447e19a45469dcf668bf9b3e0a14f94eabe7a5a208e;
    stim[31] = 202'h2eaa85c94343052f1b172a024cf1a2604ebb5ead1c73608486f;
    stim[32] = 202'h27edae07a322867cb3e5fcb50d9b703a21737711eb959006bbe;
    stim[33] = 202'h2a57d54a93cf4af9cbc88507a2ee745299aba91ba35415947de;
    stim[34] = 202'h38eb255f282ff8948ed9d4e6f77a3a60d4bbc6779485dfe4453;
    stim[35] = 202'h3d0346293e6ab297427a964350faa82f1c0ad92879d1d575baa;
    stim[36] = 202'h2286fd34abac92c9df036c621bc680f0df29e1efc6a7663bee3;
    stim[37] = 202'h238166ab4a94ffc7a5ca76550426ae7a44af3bcb4057fa27899;
    stim[38] = 202'h2955db66145a90d0b58e5ac00c24efc5015708d06921d88da66;
    stim[39] = 202'h25426e27d978f58cae5677544f7299707a33933dd3bd45e25ae;
    stim[40] = 202'h3ef28a9c38e2419ae124627b5c2d3af1268be4d9f1f95660f54;
    stim[41] = 202'h2bd96d872f05cc7673ef39d35d1ed10c0c1322eddecd0910784;
    stim[42] = 202'h240e331fc2a7c094d0760f30734596e621b33a5a603a286ff8c;
    stim[43] = 202'h21dddb65024c6241845e5f346b44d4475ed2eaee92349749529;
    stim[44] = 202'h257696bd26a184234080359a105f22819df40e23de34e4258c0;
    stim[45] = 202'h3398fdfad9d2269aefb99e862594912d31e8f8229dc0c2a6ce0;
    stim[46] = 202'h3358f96e8073ba1092d80960c8a6c8a50eb7eb38fb49ce8ad6c;
    stim[47] = 202'h2457519ea1830d6dc87cb142ee3bad6f2ff4de77bd95e57f198;
    stim[48] = 202'h2cc4653f47e6534b74ba8716f8494a8d7e8abcc62d24100f2fa;
    stim[49] = 202'h341961ba5301d8b1285e4bfc60d85220f737cf64d165d39a165;
    stim[50] = 202'h3663e25ead5a957cc25f8f736795410349b322374d706af7ef9;
    stim[51] = 202'h3717d223de9f552dc82bc512f7023145c7f2b22377e2b352fcf;
    stim[52] = 202'h3c346b521fbd7eba2bba7383d7e325f41065ab26b589399802b;
    stim[53] = 202'h3d28e8761e2e4bd76cd1280ddf9453dbd061af187e3d6fd7bfa;
    stim[54] = 202'h39096393dc85bbec63ef5749b5e9acd255e9579f2dfbd82358f;
    stim[55] = 202'h2a04d4ab6f086f0f1029d4e4c713d5409992335d12e043c079e;
    stim[56] = 202'h25904077d20fe7eb08f618fe3d60f767cb73977f8e151a4a365;
    stim[57] = 202'h2faaa10190632af66f9adc005aa67432f9ba41b226902aa4479;
    stim[58] = 202'h2556fdb6edf586b5f51c72602cfc681f70ec30bf3f1fe42dd8f;
    stim[59] = 202'h298aa0aed059b2855c781a75a97b0240ca3e70096857490dd2f;
    stim[60] = 202'h3946cd07beff7fafb5fe0417a3f6f86fdbbaf4fe894fd9894d5;
    stim[61] = 202'h300931e894dddfa4e4d6173f8d210e1357d8293f8ed5335cd44;
    stim[62] = 202'h32e1a5a91f8bf3e84f4649f62fa3de2edf5f645e3dba7c9a6e5;
    stim[63] = 202'h3a53e075ff84ee59a6dd944b56f936f179f3153dfb65f3a32b9;
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
      expv[0] = 101'h00000000000000000000000000;
      expv[1] = 101'h00000000000000000000000000;
      expv[2] = 101'h00000000000000000000000000;
      expv[3] = 101'h00000000000000000000000000;
      expv[4] = 101'h19caf517b93e283e47b0b71135;
      expv[5] = 101'h180faa4a6af26cc3515c9d24ca;
      expv[6] = 101'h1e89aa0b41e603ec54fd828304;
      expv[7] = 101'h138be4c8a22e341ec31c6868b3;
      expv[8] = 101'h124b89db6c2914b36267323b50;
      expv[9] = 101'h182f3b3a8091c5e92482ac8a97;
      expv[10] = 101'h00000000000000000000000000;
      expv[11] = 101'h00000000000000000000000000;
      expv[12] = 101'h00000000000000000000000000;
      expv[13] = 101'h10bd5d8aebadf461ace85f73b0;
      expv[14] = 101'h0448c51f9c6831578993b5c6a7;
      expv[15] = 101'h18763316d26eff9561c4768d5c;
      expv[16] = 101'h0b25c8ba2722a449ab61482661;
      expv[17] = 101'h0fd260cf6c6435b7a1fcc9e394;
      expv[18] = 101'h01c84e578ffaf9fc9f525b295f;
      expv[19] = 101'h0c884cf80c7725613318b1c40e;
      expv[20] = 101'h1d12f9795f90ca219c50eca318;
      expv[21] = 101'h0488d3cb85aafa5eb438e0955f;
      expv[22] = 101'h063c176fa094681ed4cf9b807a;
      expv[23] = 101'h13c9c211a6168892b4e02f617d;
      expv[24] = 101'h19559199da99957bcfd9aa7d6b;
      expv[25] = 101'h136b178aa0ec78f1440e4a7306;
      expv[26] = 101'h1e30c047645996ca5eec713f46;
      expv[27] = 101'h143fb5def8f43be3921142978e;
      expv[28] = 101'h0fda628746ed1dabed871b296b;
      expv[29] = 101'h19790f80ad114fa7c5d794439a;
      expv[30] = 101'h06d7c2c69cf5494c0d82a0ac6f;
      expv[31] = 101'h0706b707a58f65b34803eeb32d;
      expv[32] = 101'h0da5d410e5cdae8f12e43716f6;
      expv[33] = 101'h1dc4abce2ef8f000e24d324abc;
      expv[34] = 101'h01a4b1a9ba59f79b6d3efd20cb;
      expv[35] = 101'h193f1a742e89dcb40109de4f80;
      expv[36] = 101'h108ecb6c73ec600dd737d32b4b;
      expv[37] = 101'h0cadc91aff18451edf97ed9efb;
      expv[38] = 101'h1eef0c429e4ab1c64979d020fe;
      expv[39] = 101'h05ec4e4f9588bc7bab4a18cd9e;
      expv[40] = 101'h0ba4d7b629cb1dd747abe39a72;
      expv[41] = 101'h1c6c052f7cb22969ea2ad579fc;
      expv[42] = 101'h01c639aea1a08f3a00b9c88ab1;
      expv[43] = 101'h1dc67e47f037fb5460bfcadae0;
      expv[44] = 101'h1867a181dddb663ad418962ffe;
      expv[45] = 101'h162b1fdaef7b112aa7a7d3c994;
      expv[46] = 101'h0b68bed705e2666123ce77f2d0;
      expv[47] = 101'h0ce210cdf861a8c4cbc5c8f305;
      expv[48] = 101'h1dc583bf6bf26da04774f20e34;
      expv[49] = 101'h08122891a0d0f4e9a1db093486;
      expv[50] = 101'h11590e1730921fae46fb8809f2;
      expv[51] = 101'h019e83c9c67ecefe3ebb859dc7;
      expv[52] = 101'h0fb7f293488cb8f199663ef261;
      expv[53] = 101'h073ae6805dca77654656fa42c7;
      expv[54] = 101'h1a66ca9326183125844e0d0403;
      expv[55] = 101'h166e263324493d5f50a82589d9;
      expv[56] = 101'h17a430b93b1b35df43acd97f45;
      expv[57] = 101'h1b4228b5082ba4e03e2e10ec64;
      expv[58] = 101'h1b9fb6f489495fe3ea47bda1a2;
      expv[59] = 101'h1a11e4312c074618d89d8644d4;
      expv[60] = 101'h151d7fadfcb892a9e71ab53dbc;
      expv[61] = 101'h013ac4bb7440b31be1ecab52d9;
      expv[62] = 101'h18b654057aaecf984afb9cac79;
      expv[63] = 101'h021a131e1260739dd2294d0cd1;
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
