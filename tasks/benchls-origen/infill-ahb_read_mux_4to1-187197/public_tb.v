// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 138;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_187197 dut (
    .HRDATA1(in_vec[137:106]),
    .HRDATA2(in_vec[105:74]),
    .HRDATA3(in_vec[73:42]),
    .HRDATA4(in_vec[41:10]),
    .HRESP1(in_vec[9:9]),
    .HRESP2(in_vec[8:8]),
    .HRESP3(in_vec[7:7]),
    .HRESP4(in_vec[6:6]),
    .HREADY1(in_vec[5:5]),
    .HREADY2(in_vec[4:4]),
    .HREADY3(in_vec[3:3]),
    .HREADY4(in_vec[2:2]),
    .addr(in_vec[1:0]),
    .HRDATA(out_vec[33:2]),
    .HRESP(out_vec[1:1]),
    .HREADY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 138'h10fb3c5429cd09a7ca5a37d01f54baee9ac;
    stim[1] = 138'h2ecd68487dbe3eede5c4b2926c5cba67221;
    stim[2] = 138'h36b92bea7e4630a33fa54a0aa5cb7aee70e;
    stim[3] = 138'h35dc8747f4a6e2477ddee7d6b5e08fdf0dd;
    stim[4] = 138'h34bd7d75e99f5463c7c690ff5933d99acf9;
    stim[5] = 138'h1624f88691fc4bb01d50c57710e945171f2;
    stim[6] = 138'h272db3bbf038af93969f56881c1808c39a8;
    stim[7] = 138'h227583208d6def60362e417380a20cea92f;
    stim[8] = 138'h0be8822cd30794af3e0525492a3ae18a6b3;
    stim[9] = 138'h06f067470ddebad21af289d8bc57076617f;
    stim[10] = 138'h14f3b77370e67f13d96d3edf5a39229688f;
    stim[11] = 138'h21eab90083490a224458288f74c702d4e6a;
    stim[12] = 138'h0fb30453a69c81dbdaf7922e5dcd7fa83ec;
    stim[13] = 138'h2e927d375e05d0b276bc9ee67602104bcef;
    stim[14] = 138'h103e16c7aa3f9adb16801c6cdef2b3d3200;
    stim[15] = 138'h150c8dacccf45d9869393e501065a11a3b8;
    stim[16] = 138'h30508878e2367db96fb0d3d8276df8049ab;
    stim[17] = 138'h001a81f5a2cb206cbac78325c9a9e58bb33;
    stim[18] = 138'h3adb306143e692c529d1b877a1d4743b09d;
    stim[19] = 138'h0b9d1fdae1b479fd19041a5d5be9ab187d4;
    stim[20] = 138'h105c6dc3eb509204476863d501569373c50;
    stim[21] = 138'h0e3c9cdbe455cecc16c0272c02cb22651d1;
    stim[22] = 138'h36399746cf90d1b69a12cf07d2308b4ad8c;
    stim[23] = 138'h05b553dffe47c1c8af12b2175708083907d;
    stim[24] = 138'h0f4dd7256270e6fadb5a59219db5638bb75;
    stim[25] = 138'h35923fe010316194a3b9b0f73965b392576;
    stim[26] = 138'h3497abb2f29b66e3f2bcfe58ff27ad4c755;
    stim[27] = 138'h3b80e890f88da6af8aaf067d61e97258663;
    stim[28] = 138'h264e81dd9eca69c015e42f3c56cdc63b40b;
    stim[29] = 138'h1d210e11fd2dafe5c9d25856da3a27bc7da;
    stim[30] = 138'h3fc11ef6f8dea61bf0388e5190d010d5354;
    stim[31] = 138'h34dbfbc1f6d8816f1de66d80231950a2587;
    stim[32] = 138'h170d4d2ab68577b99415abea50aa4b930dd;
    stim[33] = 138'h0cc2564f197545cbc79502ca50b692dfe16;
    stim[34] = 138'h1c73e6f79c989f49a0b23f8c55e5322cfea;
    stim[35] = 138'h2fcf819a8ab8c3ddf1e981be9274c90f2bd;
    stim[36] = 138'h3658db4201802d41ae12c1836dd4d9c80cb;
    stim[37] = 138'h23a925383ebaebda632ae05deae56fdca53;
    stim[38] = 138'h09b36260d5cc56ec481b04105b113725f11;
    stim[39] = 138'h1aa6f3d358e24f932157f7f1ec7cce296a2;
    stim[40] = 138'h21ae5a5c7c578875c3fa5c9c484f9bbd4f7;
    stim[41] = 138'h1d7c2b9225c1fe58c5c38d217ef6c798d67;
    stim[42] = 138'h09e48a2b2eef5ce541de1297f3981d97b4b;
    stim[43] = 138'h05bf1b2af4a2cbda68593aaa798ebbfaca8;
    stim[44] = 138'h1c2d36df752e663fdff0ee36f0fc2959eae;
    stim[45] = 138'h05369c92275f8105529ef892ea5f62bfe45;
    stim[46] = 138'h389aa76d7fe2ab0404af5bbd06766fcdc69;
    stim[47] = 138'h1aa75b7b62c86b7acf4d8fa17ed20089178;
    stim[48] = 138'h1120079b450ca443032f62aa86434fbeff8;
    stim[49] = 138'h1afb7a4b3263ec2595bdade7a5b43a9a1b4;
    stim[50] = 138'h175c7997ad4314ec8fa44aeccdafdb76b44;
    stim[51] = 138'h1e0fcb4063079fa603d0f036591d333c922;
    stim[52] = 138'h01df43867b2aeff199eac507fe1b31940ec;
    stim[53] = 138'h2cc3db974d200ab91c3c36aa14762c807e4;
    stim[54] = 138'h15eaddaa7e2b8afbdd023b032ef6447ec13;
    stim[55] = 138'h20765aaba268b642da608669ce18b146b4a;
    stim[56] = 138'h212ba70b85362b33839a625ed7bfeae2285;
    stim[57] = 138'h09bb8256bdd3e5d546d8351e0af7f90d7ad;
    stim[58] = 138'h01a3df46e2c642a33868bdc80c8882c27f5;
    stim[59] = 138'h32a95f03a1bb74c3fc738e32808b6787edb;
    stim[60] = 138'h1924cce7cc5a240e3ee4caf6e8eeacee5a0;
    stim[61] = 138'h265b485855e8d54d2f4dbf97c18b3b2d42a;
    stim[62] = 138'h387a92161a7761447fb15c085c6e90f883c;
    stim[63] = 138'h259a492193dbc689d2133931a60b43867c8;
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
      expv[0] = 34'h10fb3c541;
      expv[1] = 34'h3dbe3eedc;
      expv[2] = 34'h3fa54a0a9;
      expv[3] = 34'h34a6e2475;
      expv[4] = 34'h299f5463d;
      expv[5] = 34'h1d50c5772;
      expv[6] = 34'h272db3bbd;
      expv[7] = 34'h00a20cea9;
      expv[8] = 34'h2a3ae18a4;
      expv[9] = 34'h3c5707663;
      expv[10] = 34'h1a3922969;
      expv[11] = 34'h0458288f5;
      expv[12] = 34'h0fb30453b;
      expv[13] = 34'h3602104bf;
      expv[14] = 34'h103e16c7a;
      expv[15] = 34'h150c8dacf;
      expv[16] = 34'h276df8048;
      expv[17] = 34'h09a9e58b8;
      expv[18] = 34'h03e692c51;
      expv[19] = 34'h0b9d1fdae;
      expv[20] = 34'h105c6dc3c;
      expv[21] = 34'h2455cecc3;
      expv[22] = 34'h36399746c;
      expv[23] = 34'h3e47c1c89;
      expv[24] = 34'h2270e6faf;
      expv[25] = 34'h23b9b0f70;
      expv[26] = 34'h329b66e3f;
      expv[27] = 34'h21e972586;
      expv[28] = 34'h16cdc63b4;
      expv[29] = 34'h09d25856f;
      expv[30] = 34'h3fc11ef6e;
      expv[31] = 34'h231950a25;
      expv[32] = 34'h368577b99;
      expv[33] = 34'h079502ca4;
      expv[34] = 34'h20b23f8c7;
      expv[35] = 34'h0ab8c3ddd;
      expv[36] = 34'h2dd4d9c82;
      expv[37] = 34'h2ae56fdca;
      expv[38] = 34'h15cc56ec7;
      expv[39] = 34'h2157f7f1e;
      expv[40] = 34'h084f9bbd7;
      expv[41] = 34'h3ef6c798f;
      expv[42] = 34'h33981d97a;
      expv[43] = 34'h05bf1b2ad;
      expv[44] = 34'h1ff0ee36f;
      expv[45] = 34'h275f81054;
      expv[46] = 34'h3fe2ab040;
      expv[47] = 34'h1aa75b7b5;
      expv[48] = 34'h1120079b7;
      expv[49] = 34'h1afb7a4b1;
      expv[50] = 34'h175c7997a;
      expv[51] = 34'h03d0f0364;
      expv[52] = 34'h01df43865;
      expv[53] = 34'h2cc3db977;
      expv[54] = 34'h2ef6447ec;
      expv[55] = 34'h1a608669d;
      expv[56] = 34'h05362b338;
      expv[57] = 34'h3dd3e5d56;
      expv[58] = 34'h22c642a33;
      expv[59] = 34'h008b6787e;
      expv[60] = 34'h1924cce7d;
      expv[61] = 34'h2f4dbf97d;
      expv[62] = 34'h387a92161;
      expv[63] = 34'h259a4921a;
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
