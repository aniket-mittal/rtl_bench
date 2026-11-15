// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 134;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108972 dut (
    .clk(clk),
    .rst(in_vec[132:132]),
    .inst_mem_read(in_vec[131:131]),
    .inst_mem_address(in_vec[130:99]),
    .data_mem_read(in_vec[98:98]),
    .data_mem_write(in_vec[97:97]),
    .data_mem_address(in_vec[96:65]),
    .data_mem_wdata(in_vec[64:33]),
    .mem_rdata(in_vec[32:1]),
    .mem_resp(in_vec[0:0]),
    .inst_mem_rdata(out_vec[133:102]),
    .inst_mem_resp(out_vec[101:101]),
    .data_mem_rdata(out_vec[100:69]),
    .data_mem_resp(out_vec[68:68]),
    .mem_read(out_vec[67:67]),
    .mem_write(out_vec[66:66]),
    .mem_address(out_vec[65:34]),
    .mem_wdata(out_vec[33:2]),
    .state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h15ce13f5da243be91b627521240a7f8a88;
    stim[1] = 133'h122f50ea3a0f1e98f89997148f37dec731;
    stim[2] = 133'h0d3505ba84ae68329b02d35332c772f151;
    stim[3] = 133'h030b04816fc66e9c18738ef5da9691610e;
    stim[4] = 133'h0a7a7572fe9968a54dc572b759e929723f;
    stim[5] = 133'h0a707577d323191a8f9b8e42d6bc027947;
    stim[6] = 133'h0046da237cb9fbe24cdb1881a93b178b45;
    stim[7] = 133'h032e5e22acbbaac53e10e4d57fb248940f;
    stim[8] = 133'h083e136cc8849e9e6ec29ca902f9d7c9a0;
    stim[9] = 133'h07e2faaa483c354e939f0472d8bdb25a94;
    stim[10] = 133'h0eb18dae284ca6b33fc443004e561216ce;
    stim[11] = 133'h0c0c1d57301157d82a8df43410051b0cdf;
    stim[12] = 133'h08ed1ce3e2581c0ca5860f552ee45a5190;
    stim[13] = 133'h051eed2d2051a8104f7bd8014be1b3a3c2;
    stim[14] = 133'h0ccdc4d1e327947737b1c406874e257ed5;
    stim[15] = 133'h0cdd58dd8edfcb1ed482d1ea9d483afd9b;
    stim[16] = 133'h0b1c8bfa3d3b4d94b42a9b8bf131236691;
    stim[17] = 133'h01b6faa4ceaecbebc3ebc222d3cd34af9f;
    stim[18] = 133'h006a0ac520ddd40e39765b7bd2de3e6df3;
    stim[19] = 133'h0b55b0542e50ada966d210f68110639741;
    stim[20] = 133'h080616bc2bbef92b9972d4ccdd0fc46a0d;
    stim[21] = 133'h088c13dd3de3bf4f74172c3edcef79e4b3;
    stim[22] = 133'h01761398bb0b2ed1bfd3f83ed13534f990;
    stim[23] = 133'h006994c459a8917a58fb3d9b86da333455;
    stim[24] = 133'h0e5d21123ee551ece64a89ca79d43a871b;
    stim[25] = 133'h0daac4de2d378a635968aa1005bafda683;
    stim[26] = 133'h0787b3e2ee7a42fd90f516c4f67a04a5ef;
    stim[27] = 133'h0c7cb3045fdb3f0db25f908fd582067ccc;
    stim[28] = 133'h053802d7c0123aeeca76d5c932210a1e8c;
    stim[29] = 133'h0210a461e840597c8066ebc8de24fbc1b9;
    stim[30] = 133'h0a3ef3b18b6ed8dd42bea0ee010afb3a34;
    stim[31] = 133'h0f63f9b7e653730067259c4944d06e99ba;
    stim[32] = 133'h064abe7bf8ad6fd23de740f658214e4366;
    stim[33] = 133'h0c3c29e30b9d3468d5a65bd4db4a7219df;
    stim[34] = 133'h0dfbc16d6c0603fabf1dbc96c07845d1f9;
    stim[35] = 133'h01f89502dad778a70d2c20064a673256b2;
    stim[36] = 133'h00581d5ac653b7aec0f615c3b08e856944;
    stim[37] = 133'h0703aeb70055e62796a7d5b739ab20cb0d;
    stim[38] = 133'h0ca0dfa8481eeca7e9408de7889961f37b;
    stim[39] = 133'h05a25e62c4dd57e19dc3daa24966439c87;
    stim[40] = 133'h050c89ce3c43c05089a4981ec6db6fa2f7;
    stim[41] = 133'h0beb655342cefb245787b7442beb34789e;
    stim[42] = 133'h02b897d71b5f2b13084c438931737df41f;
    stim[43] = 133'h062a662abc67e3e0f923dcdbed5a06cff3;
    stim[44] = 133'h05fd2011e253baaf272fbb1c4ac6ec9c3a;
    stim[45] = 133'h01cfcb43f077759f0d31d3fe934ef32bb2;
    stim[46] = 133'h0e0e0b4cee36aaf4aff8f134cf0daa8017;
    stim[47] = 133'h013c9f5a4bdd87273565ac76b16b094f63;
    stim[48] = 133'h0debe1f2aaafbc12fc8f382dc2a3fbe9d3;
    stim[49] = 133'h0de8120390737f8e70194acab23f2c2aea;
    stim[50] = 133'h025b0287bc3f36d3ffc5a9b05bb36a04d3;
    stim[51] = 133'h0de9a57edee9df80a8f65f6cc72b3b944c;
    stim[52] = 133'h0ee2cd042d072546030fb47ed3573d0705;
    stim[53] = 133'h019871c0f414507442040c419df6f3b947;
    stim[54] = 133'h02f851b1f430bd9c4820bd987653e764db;
    stim[55] = 133'h0721d561f0662aa0a9940a6605f7c3b64c;
    stim[56] = 133'h0c42bb2fc8cf2e89e47dd0fa795c02bb11;
    stim[57] = 133'h071b69b75066ba1b119333d1d3119a1ca3;
    stim[58] = 133'h0c52140a8749a34b01ac3b862f3829b9aa;
    stim[59] = 133'h0c00b3dd6150513daa1e86e7e9224f2a37;
    stim[60] = 133'h0ca1be651cf4c0b69186a0460d5319d898;
    stim[61] = 133'h03a24a08f808e7c93e3a12ac047c0a2c3f;
    stim[62] = 133'h0885122ea29ab22a633123b1ddf9b97af1;
    stim[63] = 133'h0c5800ab85e60b775e0d6dd3322de8056a;
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
      expv[0] = 134'h014ff15100a7f8a8800000000000000000;
      expv[1] = 134'h26fbd8e6137dec73000000000000000000;
      expv[2] = 134'h18ee5e2a0c772f15000000000000000000;
      expv[3] = 134'h12d22c21c9691610e9858240b400000001;
      expv[4] = 134'h3d252e47fe929723e93d3ab97c00000001;
      expv[5] = 134'h17804f28cbc02794764632351f371c85ae;
      expv[6] = 134'h2762f168b3b178b448236d11bc00000001;
      expv[7] = 134'h36491281db248940f977558a7c21c9aafe;
      expv[8] = 134'h1f3af9340f9d7c9a01093d3cdd85395206;
      expv[9] = 134'h17b64b528bdb25a940786a9d273e08e5b2;
      expv[10] = 134'h0ac242d9c561216ce0994d667f8886009e;
      expv[11] = 134'h00a3619bc051b0cdf022afb0551be86822;
      expv[12] = 134'h1c8b4a320e45a51908768e71f000000001;
      expv[13] = 134'h3c3674785e1b3a3c2a8f76969000000001;
      expv[14] = 134'h29c4afdab4e257ed4a66e268f000000001;
      expv[15] = 134'h29075fb35483afd9bdbf963da905a3d53a;
      expv[16] = 134'h26246cd233123669098e45fd1c00000001;
      expv[17] = 134'h39a695f3dcd34af9fd5d97d787d78445a6;
      expv[18] = 134'h1bc7cdbe4de3e6df31bba81c72ecb6f7a6;
      expv[19] = 134'h220c72e811063974000000000000000000;
      expv[20] = 134'h21f88d41b0fc46a0c8030b5e1400000001;
      expv[21] = 134'h1def3c964ef79e4b3bc77e9ee82e587dba;
      expv[22] = 134'h26a69f3213534f9908bb09cc5c00000001;
      expv[23] = 134'h1b46668aada333454834ca622c00000001;
      expv[24] = 134'h3a8750e35d43a871a00000000000000000;
      expv[25] = 134'h375fb4d07bafda682ad5626f1400000001;
      expv[26] = 134'h0f4094bdc7a04a5efcf485fb21ea2d89ee;
      expv[27] = 134'h3040cf99982067cccfb67e1b64bf211faa;
      expv[28] = 134'h042143d18210a1e8c02475dd94edab9266;
      expv[29] = 134'h049f7837024fbc1b9080b2f900cdd791be;
      expv[30] = 134'h215f674690afb3a3400000000000000000;
      expv[31] = 134'h1a0dd3374d06e99babb1fcdbf000000001;
      expv[32] = 134'h0429c86cc214e4366b255f3dfc00000001;
      expv[33] = 134'h294e433bf4a7219dea1e14f18400000001;
      expv[34] = 134'h0f08ba3f07845d1f980c07f57e3b792d82;
      expv[35] = 134'h0ce64ad64673256b28fc4a816c00000001;
      expv[36] = 134'h11d0ad2888e85694482c0ead6000000001;
      expv[37] = 134'h35641961bab20cb0cb81d75b8000000001;
      expv[38] = 134'h132c3e6f49961f37a00000000000000000;
      expv[39] = 134'h2cc87390f66439c86ad12f316000000001;
      expv[40] = 134'h1b6df45ecdb6fa2f788780a11349303d8e;
      expv[41] = 134'h3d668f13deb34789e59df648af0f6e8856;
      expv[42] = 134'h2e6fbe83d737df41f6be56261098871262;
      expv[43] = 134'h2b40d9fe55a06cff38cfc7c1f247b9b7da;
      expv[44] = 134'h18dd93874c6ec9c3a4a7755e4e5f763896;
      expv[45] = 134'h29de657654ef32bb20eeeb3e1a63a7fd26;
      expv[46] = 134'h21b55002d0daa8017c6d55e95ff1e2699e;
      expv[47] = 134'h2d6129ec76b094f6289e4fad2400000001;
      expv[48] = 134'h147f7d3a4a3fbe9d355f7825f91e705b86;
      expv[49] = 134'h07e5855d43f2c2aeaaf40901c800000001;
      expv[50] = 134'h366d409a7b36a04d292d8143dc00000001;
      expv[51] = 134'h2567728992b3b944cdd3bf0151ecbed98e;
      expv[52] = 134'h2ae7a0e09573d0705a0e4a8c061f68fda6;
      expv[53] = 134'h3ede7728ff6f3b9468cc38e07800000001;
      expv[54] = 134'h0a7cec9b453e764db8617b3890417b30ee;
      expv[55] = 134'h3ef876c99f7c3b64c0cc5541532814cc0a;
      expv[56] = 134'h2b80576215c02bb1119e5d13c8fba1f4f2;
      expv[57] = 134'h223343947119a1ca2b8db4dba800000001;
      expv[58] = 134'h2705373553829b9aa00000000000000000;
      expv[59] = 134'h2449e546f224f2a36a0059eeb000000001;
      expv[60] = 134'h2a633b1315319d898a50df328c00000001;
      expv[61] = 134'h0f814587e7c0a2c3e9d125047c00000001;
      expv[62] = 134'h3f372f5e1f9b97af000000000000000000;
      expv[63] = 134'h05bd00ad42de8056aa2c0055c000000001;
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
