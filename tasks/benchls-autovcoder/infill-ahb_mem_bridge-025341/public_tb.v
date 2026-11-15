// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025341 dut (
    .clk(clk),
    .rst_n(in_vec[102:102]),
    .mem_addr(in_vec[101:70]),
    .mem_wr(in_vec[69:69]),
    .mem_byte_en(in_vec[68:67]),
    .mem_req(in_vec[66:66]),
    .mem_wr_data(in_vec[65:34]),
    .d_mhrdata(in_vec[33:2]),
    .d_mhready(in_vec[1:1]),
    .d_mhresp(in_vec[0:0]),
    .mem_rd_data(out_vec[144:113]),
    .mem_rdy(out_vec[112:112]),
    .core_mem_addr(out_vec[111:80]),
    .core_mem_addr_vld(out_vec[79:79]),
    .core_mwr_mrd(out_vec[78:78]),
    .d_mhaddr(out_vec[77:46]),
    .d_mhtrans(out_vec[45:44]),
    .d_mhwrite(out_vec[43:43]),
    .d_mhwdata(out_vec[42:11]),
    .d_mhsize(out_vec[10:8]),
    .d_mhburst(out_vec[7:5]),
    .d_mhprot(out_vec[4:1]),
    .d_mhmasterlock(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h0faab3e0e2802d25cd63cd4887;
    stim[1] = 103'h33e00550c30431308923ecea8f;
    stim[2] = 103'h4c1b8928e3df517a27d63007c6;
    stim[3] = 103'h6f43266da2462d4ea6b8b6a28b;
    stim[4] = 103'h0712b41fcb368b7d67a5950760;
    stim[5] = 103'h4c598382912c5640f8923f56df;
    stim[6] = 103'h569cbcd3fbef37d78faa690849;
    stim[7] = 103'h7832ab36be504eb32e8dd9eab7;
    stim[8] = 103'h7a8c3faf1a3ea79fa872295bb2;
    stim[9] = 103'h7314f9d1c4d15f05ac947d9f7f;
    stim[10] = 103'h7281819a09b064189024443171;
    stim[11] = 103'h6916bdff6c3adfbf7bf91cce5f;
    stim[12] = 103'h7cc5f1f0f1f13630addf8b30e0;
    stim[13] = 103'h6d5d14f2b30303c82de614e10b;
    stim[14] = 103'h7673e03a6bfda5aed5b3e35bdc;
    stim[15] = 103'h66033e5a2e1362e4badd1fe647;
    stim[16] = 103'h3200f67de1cda0e04fcd85ae1b;
    stim[17] = 103'h66821c5a3b36cee4e5ccc6797b;
    stim[18] = 103'h4497a66932d61bd7102cfbbfef;
    stim[19] = 103'h6a0c786062e4f1eb118e490817;
    stim[20] = 103'h6580ccf44ea6d047736ea4be8c;
    stim[21] = 103'h6ddce0922cbba08e9ba79a8af3;
    stim[22] = 103'h577759e0e2f83f4fdff8d124b6;
    stim[23] = 103'h4e943903f6ac4caed32d80203f;
    stim[24] = 103'h760803de07e229ff4996708d4e;
    stim[25] = 103'h61afe6e832e141ff91fb94537d;
    stim[26] = 103'h69bccc1e011662cc0e86831547;
    stim[27] = 103'h4f6da81946faea230373a049fc;
    stim[28] = 103'h76332d1715b85130fcf2912252;
    stim[29] = 103'h4cbff1ae7e79dfd244568c00ea;
    stim[30] = 103'h4e4ebef855ae945961e2206bc9;
    stim[31] = 103'h54750fef42a8726ddfc4b129fb;
    stim[32] = 103'h5ad30358e399997531c93a07b8;
    stim[33] = 103'h4e2a31d4629e8cdb9c9362057c;
    stim[34] = 103'h530a68f3784199e593d985aa0f;
    stim[35] = 103'h6749844c27949f2b4f0546e6e0;
    stim[36] = 103'h46795c59de54b5e9a9c71527f4;
    stim[37] = 103'h40429bb89043cf25596d098c04;
    stim[38] = 103'h7f07f654dc882ed3b5c33ed761;
    stim[39] = 103'h50751e9b2b7c7a414738b3a5fa;
    stim[40] = 103'h7f10a7e0332e22c814da02cb8b;
    stim[41] = 103'h4ea72f3ccea94ea8ab044a4cb8;
    stim[42] = 103'h58016428cbffb4fc817f5f1683;
    stim[43] = 103'h6a169f1daee8cba1730d5a34bd;
    stim[44] = 103'h78f28148ac3fa4e283829137e6;
    stim[45] = 103'h48917e8f2e145b66c01167c4ce;
    stim[46] = 103'h7f8e8b1a9ed93da9cbfd7f39b8;
    stim[47] = 103'h5c3bf70ac2a41428b122cb5b6b;
    stim[48] = 103'h75e8310ac425e8cf9efc71dc90;
    stim[49] = 103'h6a7672f6ba00ee52862350172c;
    stim[50] = 103'h729753025a827bf8a13406b9d4;
    stim[51] = 103'h52f8d95c19c64155020ce665e9;
    stim[52] = 103'h409b5f58c4d6ec7fd7a324d424;
    stim[53] = 103'h6a6d771c547e7ef99d81da96e9;
    stim[54] = 103'h61d1c10cba9300ec425df88555;
    stim[55] = 103'h7f45da329dbffe89c563223a1c;
    stim[56] = 103'h77bdd19c8808b6a8cda37ce0d5;
    stim[57] = 103'h5b74366cd023bd79313a575006;
    stim[58] = 103'h5891690b89f4c60f4e16ae8351;
    stim[59] = 103'h4017cdcc0a46da100925214d2f;
    stim[60] = 103'h6c2e9381f44dd02c0f6f558a1e;
    stim[61] = 103'h6661082305a951f6b3ae4008f4;
    stim[62] = 103'h5ff204a4d7297c99a90e5bcac7;
    stim[63] = 103'h3ab0dc450556ff4c6d3a636a43;
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
      expv[0] = 145'h0b1e6a4433eaacf834faab3e0c80000000002;
      expv[1] = 145'h091f67547cf80154333e00550c00000000002;
      expv[2] = 145'h1eb1803e3306e24a34c1b8928c80000000002;
      expv[3] = 145'h15c5b5145bd0c99b66f43266d880000000002;
      expv[4] = 145'h1d2ca83b01c4ad07e0712b41fc00000000102;
      expv[5] = 145'h0491fab6f31660e080c598382800000000202;
      expv[6] = 145'h1d53484245a72f34c569cbcd3c80000000302;
      expv[7] = 145'h146ecf55be0caacd8f832ab36a80000000302;
      expv[8] = 145'h03914add9ea30febc3a8c3faf04a09d665b02;
      expv[9] = 145'h04a3ecfbfcc53e747b314f9d1e4a09d665802;
      expv[10] = 145'h0122218b8ca0606683281819a01a2be0b5902;
      expv[11] = 145'h1fc8e672fa45af7fce916bdff69a2be0b5902;
      expv[12] = 145'h0efc59870f317c7c07cc5f1f0c875bf7ef202;
      expv[13] = 145'h0f30a7085b57453c86d5d14f28875bf7ef202;
      expv[14] = 145'h0d9f1adeed9cf80e87673e03a4875bf7ef102;
      expv[15] = 145'h16e8ff323980cf968e6033e5a2875bf7ef102;
      expv[16] = 145'h1e6c2d70dc803d9f77200f67dc80000000002;
      expv[17] = 145'h0e6633cbd9a08716866821c5a080000000302;
      expv[18] = 145'h0167ddff7125e99a44497a669080000000202;
      expv[19] = 145'h0c724840ba831e1816a0c7860480000000002;
      expv[20] = 145'h1b7525f46960333d0a580ccf4600000000102;
      expv[21] = 145'h1d3cd4579b7738248eddce092280000000102;
      expv[22] = 145'h1fc68925b5ddd6783577759e0c977411d3002;
      expv[23] = 145'h196c0101f3a50e40cce943903e977411d3202;
      expv[24] = 145'h0cb3846a7d8200f78b60803de2558995da002;
      expv[25] = 145'h0fdca29be86bf9ba061afe6e80fc453fe9202;
      expv[26] = 145'h143418aa3a6f3307829bccc1e07c453fe9002;
      expv[27] = 145'h1b9d024fe3db6a0658f6da81967c453fe9002;
      expv[28] = 145'h079489129d8ccb45cb6332d1727c453fe9202;
      expv[29] = 145'h02b46007532ffc6b8ccbff1ae6b70a261fb02;
      expv[30] = 145'h0f11035e4393afbe08e4ebef864f3bfa48a02;
      expv[31] = 145'h1e25894fd51d43fbd14750fef44f3bfa48802;
      expv[32] = 145'h0e49d03dc6b4c0d635ad30358ccf3bfa48802;
      expv[33] = 145'h049b102be38a8c7514e2a31d44cf3bfa48802;
      expv[34] = 145'h1ecc2d5074c29a3cc530a68f34cf3bfa48b02;
      expv[35] = 145'h182a373709d261130e749844c2cf3bfa48802;
      expv[36] = 145'h0e38a93fa19e5716486795c59e4f3bfa48b02;
      expv[37] = 145'h0b684c602010a6ee000429bb884f3bfa48a02;
      expv[38] = 145'h0e19f6bb0fc1fd950bf07f654e4f3bfa48b02;
      expv[39] = 145'h19c59d2fd41d47a6c50751e9b0cf3bfa48902;
      expv[40] = 145'h06d0165c5fc429f807f10a7e00cf3bfa48a02;
      expv[41] = 145'h18225265c3a9cbcf28ea72f3ce4f3bfa48902;
      expv[42] = 145'h0bfaf8b41600590a218016428c4f3bfa48902;
      expv[43] = 145'h186ad1a5ea85a7c76ea169f1dacf3bfa48902;
      expv[44] = 145'h1c1489bf3e3ca0522f8f28148acf3bfa48902;
      expv[45] = 145'h008b3e2672245fa3cc8917e8f287f49c50102;
      expv[46] = 145'h1febf9cdcfe3a2c68bf8e8b1aa428b6cd8302;
      expv[47] = 145'h09165adb570efdc2b1c3bf70ac428b6cd8002;
      expv[48] = 145'h17e38ee48d7a0c42bb5e8310ae428b6cd8002;
      expv[49] = 145'h111a80b96a9d9cbd86a7672f68c28b6cd8302;
      expv[50] = 145'h09a035ceaca5d4c08329753024428b6cd8302;
      expv[51] = 145'h1067332f44be3657012f8d95c0428b6cd8302;
      expv[52] = 145'h1d1926a12026d7d63809b5f58e428b6cd8002;
      expv[53] = 145'h0c0ed4b74a9b5dc70aa6d771c6428b6cd8202;
      expv[54] = 145'h12efc42aa8747043061d1c10c8c28b6cd8302;
      expv[55] = 145'h0b1911d0efd1768c8bf45da32a428b6cd8302;
      expv[56] = 145'h0d1be706adef7467237bdd19c8428b6cd8102;
      expv[57] = 145'h09d2ba8036dd0d9b01b74366cc428b6cd8202;
      expv[58] = 145'h10b5741a86245a42e1891690b8428b6cd8102;
      expv[59] = 145'h09290a697005f37300017cdcc0428b6cd8102;
      expv[60] = 145'h1b7aac50fb0ba4e04ec2e9381ec28b6cd8202;
      expv[61] = 145'h1d720047a9984208ca6610823209ba0581802;
      expv[62] = 145'h0872de5637fc812909ff204a4e09ba0581a02;
      expv[63] = 145'h09d31b521eac37114bab0dc45200000000002;
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
