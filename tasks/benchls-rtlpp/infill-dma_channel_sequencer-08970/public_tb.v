// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08970 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h0ca2acce9bf42626df3651071ac14921ac3b44c5102f;
    stim[1] = 174'h13ec82871d2343f0c585f7de223651a91a90796f8c82;
    stim[2] = 174'h231685e862fc636b57ca076b9a9ed774f6bc0cb70b59;
    stim[3] = 174'h29951b3f3cf5bd6e8752b16368b357dad03d2e53d6c8;
    stim[4] = 174'h28529cece58009c0dbd36d0b121f19a375064b66a988;
    stim[5] = 174'h3d0181fd9150e875885d966b571ac2dbb9ace167762a;
    stim[6] = 174'h22d7677e87a02f937a2d16d3aeeb8e9d12d327912d96;
    stim[7] = 174'h38faff60888a41f31c437dae9d39a3c7fefa6e1a1ae0;
    stim[8] = 174'h20f057fd31140934f8498d099200cd0a2554eae5ccaa;
    stim[9] = 174'h2089f780783dab5e88ee42796f98d84ca6f9cbb09b6f;
    stim[10] = 174'h24c585dd289c742daa3df4c38dfe2b3eaef52c13b46e;
    stim[11] = 174'h3b1f68d97d7f2f1a194970e65e0af052b21e978c8a10;
    stim[12] = 174'h220807707a7b1774dcfc1f00489a411740aa961c9ad3;
    stim[13] = 174'h3895cecc95589b641bd45e78a94cea0003f79e4d0f5b;
    stim[14] = 174'h23c88607a0ab97d75f96fddb758b37e7954aadb099d2;
    stim[15] = 174'h2ccf968113ae2c4f03420fb0c4b5af050a0aad873778;
    stim[16] = 174'h24228a4445e13bfe4409f3f268f396bcaed699777a59;
    stim[17] = 174'h30ffbc6b72cdefd75b6971cc8f2bb1de7a5cc899ca88;
    stim[18] = 174'h2714b7d974904fbb4c13bf3ea2bd3794225f00524d3f;
    stim[19] = 174'h2110c78fe8dbaee54c6d9372a6835312b684cee1ebf8;
    stim[20] = 174'h35fe30faa6ffacb8b94660cce6b510813979c804094a;
    stim[21] = 174'h28443b41cbc7a62b5c940191fa949468a95bfccba26d;
    stim[22] = 174'h25d97977b8e260fbfbbeb7ecc3e59b0dab297b112e6a;
    stim[23] = 174'h31e64f707c1a5c09e1d99b020a9b037b0aff12996dff;
    stim[24] = 174'h375eb314b076a797e0e70ac5f15fee896b83a1cfe340;
    stim[25] = 174'h314add9a94bee5dfb4535f3a7d4286bb568d1ec25de8;
    stim[26] = 174'h2feede2c2b94d2a71553983fc69ce7d8432cf12c6f56;
    stim[27] = 174'h393be1c664f4461690d726b715e7e9afff55222721fb;
    stim[28] = 174'h2a8072039540406a9ed5e3ad596dba5f878a25ec9c7c;
    stim[29] = 174'h22b4a51ad42cc001dfb2537f6de13149ce8baf5ee4cd;
    stim[30] = 174'h206133bffa85d4f0ddc974db51e6161f77c460bc0b38;
    stim[31] = 174'h264d21d774b111b1c71326841660394eb9b06b3e6fe1;
    stim[32] = 174'h35c3f70207406ef7184b9eaddfef2a474cb1cee10f1c;
    stim[33] = 174'h2f25365f5d152c0df9254bfa0b835944462a1122af15;
    stim[34] = 174'h2f6aea96a6a5777a58cf3d5cac67cac664cf86502333;
    stim[35] = 174'h25d06e7bdb9b48612d8dc90157fa7819cb7725b66efc;
    stim[36] = 174'h3fb7872d2231219fd6ba96a424ac0a71c54245e91923;
    stim[37] = 174'h2875a6410860bac4f8affea8b6af3758e24eac0ab6a5;
    stim[38] = 174'h235c69d9096763e948fb51fb803d729abea0b3615cd8;
    stim[39] = 174'h38d1851004da9eebfab0f57cd73035220802174e149b;
    stim[40] = 174'h39726c0eda07db35040a4eb6c2881a01d27d96c3c694;
    stim[41] = 174'h21218c138ff9b6567ace23d83ef8c71f49f8aaf2edf5;
    stim[42] = 174'h3d66218fc35d9259ab64d9d5a1e0097b2af8f526444c;
    stim[43] = 174'h33d715ee90aa2686d55474f41c7b492a0fabc5156d51;
    stim[44] = 174'h221af6c4160df6d401fa7089ac95a5ec95db99af0909;
    stim[45] = 174'h1150a63ed4bd71cdb6bdbe3e9e8ab95ed1d8e9144e3a;
    stim[46] = 174'h25c06bdfdaf887049e37b22f865b8f6e87feb9fb0a09;
    stim[47] = 174'h0d51b606acb70079bb14a06de927cc3a01ff1368d8f2;
    stim[48] = 174'h3fd78001fd7753acd80d03cf17854597f32a63682d8c;
    stim[49] = 174'h22a53844a2a6d3832453d45b0e38e931c4c57f562ffc;
    stim[50] = 174'h2da5a23602c0df8599bf7ff39718ef7cd2fe175cc5ca;
    stim[51] = 174'h3c3584fb91100f5e9338063fdefdc2de76fa8a700ab1;
    stim[52] = 174'h24ae1fc5e8a5ffea5a62e3531c632917dfe91a658d13;
    stim[53] = 174'h3ec496cf2b5be5f321f9f83bbd23d99202827ff87d62;
    stim[54] = 174'h32b28ddceece6d2bf47fe7a282992b382f8b05c83993;
    stim[55] = 174'h0af5de41d925fcb2e1593d87df509da6af629b25aaa3;
    stim[56] = 174'h29a481b806aa191dd6c1cd9f410d72dda99e28202464;
    stim[57] = 174'h3625bdb121df9daeed19e0c81713d12149624b3f6dc4;
    stim[58] = 174'h39f0c1160577dadf7fed3ef2209e1d04abd21d4bc390;
    stim[59] = 174'h3fc65738166c32e6e20322638c31ec8db160e04dd660;
    stim[60] = 174'h3ced55bd89c85a9d031b7636a89942f53972feefa8b3;
    stim[61] = 174'h2df257cf16ec1dd26a732db24dd158982d87ea27d7f2;
    stim[62] = 174'h34054f0ebcada59b305ec8c8105b732cb4347fb396e6;
    stim[63] = 174'h2bce9e03ebbbf743333eace0df4dd4722adb490308e4;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'h10xxxxxxxxx;
      expv[2] = 41'h104fb20a1c2;
      expv[3] = 41'h108c5a17a1b;
      expv[4] = 41'h08a6546cfca;
      expv[5] = 41'h10002c004e3;
      expv[6] = 41'h08740607f62;
      expv[7] = 41'h10003d017ca;
      expv[8] = 41'h10e3ebfd823;
      expv[9] = 41'h0883c15ff4a;
      expv[10] = 41'h108041ed5aa;
      expv[11] = 41'h1093161774a;
      expv[12] = 41'h10ec7da365a;
      expv[13] = 41'h1008201dc1a;
      expv[14] = 41'h10e2573b322;
      expv[15] = 41'h100f22181ea;
      expv[16] = 41'h10333e5a043;
      expv[17] = 41'h10908a29113;
      expv[18] = 41'h0843fef1adb;
      expv[19] = 41'h048024827df;
      expv[20] = 41'h0454c6d9370;
      expv[21] = 41'h108b94660c8;
      expv[22] = 41'h102110ed072;
      expv[23] = 41'h101765e5deb;
      expv[24] = 41'h08c7993dc1f;
      expv[25] = 41'h080003b53c9;
      expv[26] = 41'h040025f72e9;
      expv[27] = 41'h0271553983c;
      expv[28] = 41'h10e2bcfd358;
      expv[29] = 41'h10aa01c80e3;
      expv[30] = 41'h080ad2946b6;
      expv[31] = 41'h1000542ea79;
      expv[32] = 41'h081934875de;
      expv[33] = 41'h10803a03778;
      expv[34] = 41'h103c94d97d2;
      expv[35] = 41'h103dabaa5ab;
      expv[36] = 41'h081741b9ef2;
      expv[37] = 41'h108011890ca;
      expv[38] = 41'h1021d699043;
      expv[39] = 41'h100d71a7642;
      expv[40] = 41'h10e34614403;
      expv[41] = 41'h08e5c9b03b3;
      expv[42] = 41'h08007fcdb2b;
      expv[43] = 41'h04001aec92b;
      expv[44] = 41'h026d55474f2;
      expv[45] = 41'h103592b4bdb;
      expv[46] = 41'h08454298fb2;
      expv[47] = 41'h108057c4383;
      expv[48] = 41'h103546d81aa;
      expv[49] = 41'h107f5e0007a;
      expv[50] = 41'h108a94e112b;
      expv[51] = 41'h10369688d82;
      expv[52] = 41'h10f0d613ee2;
      expv[53] = 41'h1012b87f17b;
      expv[54] = 41'h107b125b3ca;
      expv[55] = 41'h10caca3773a;
      expv[56] = 41'h102bd779072;
      expv[57] = 41'h10269206e03;
      expv[58] = 41'h10d896f6c4b;
      expv[59] = 41'h10e7c304583;
      expv[60] = 41'h08ff195ce02;
      expv[61] = 41'h10804e42d4b;
      expv[62] = 41'h08b7c95f3c2;
      expv[63] = 41'h1000656d2ca;
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
