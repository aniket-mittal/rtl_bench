// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
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
    .clk(clk),
    .load(in_vec[102:102]),
    .ena(in_vec[101:100]),
    .data(in_vec[99:0]),
    .q(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h4de0364a1fa93de6feaa76b09d;
    stim[1] = 103'h5a516bfe66e8d48834c43e393b;
    stim[2] = 103'h56f89cb8ad73311227d37d7eec;
    stim[3] = 103'h28e9dcf1381542a5a4dd6b5373;
    stim[4] = 103'h611bb90af9793436a4af17ec4e;
    stim[5] = 103'h666e8e379fa2d15e5db132c823;
    stim[6] = 103'h1a3952a4f1fa28bcac43b69b76;
    stim[7] = 103'h06c0522e63e2cd650694dd15bd;
    stim[8] = 103'h27548bf1f4ef232b6f917532af;
    stim[9] = 103'h312acd64e97506e479ee4ead86;
    stim[10] = 103'h752b7887252f73e426009282f1;
    stim[11] = 103'h0ffee4225d7c83ea44ced8353f;
    stim[12] = 103'h1310eec3b16847c0f47f540d95;
    stim[13] = 103'h451c8c4bbb33ec4485cac44d55;
    stim[14] = 103'h78bddab226831094d4f8c6c526;
    stim[15] = 103'h24036f2fe2bb9ccf8c7b99e374;
    stim[16] = 103'h79c053c2fe192e13e6e1fb1fc9;
    stim[17] = 103'h12e6f6865a6fed29edabd5cb21;
    stim[18] = 103'h43d4500bd3d035a4c15b9cc0e3;
    stim[19] = 103'h2f192807dd92c1c93a08b4a670;
    stim[20] = 103'h456f9232873c394ed41012ac8c;
    stim[21] = 103'h477d40bed0aedbf933c7a40fb5;
    stim[22] = 103'h2f2eebfc3a2c68172aa99423f2;
    stim[23] = 103'h75264e4b2f3b88b5de7e158b86;
    stim[24] = 103'h06f6d538cc077ae85931828782;
    stim[25] = 103'h2f541008905d19e556d458d541;
    stim[26] = 103'h247ca1cb432b470cefd9113b12;
    stim[27] = 103'h2defbb68e0574c681fd8daf8df;
    stim[28] = 103'h61fa141bb7753749835e33c01c;
    stim[29] = 103'h1d78dcd343a6104cba6b0d219e;
    stim[30] = 103'h362218a5bddb40ffd602d5753f;
    stim[31] = 103'h2e1519e017e4eeb69a41aa5cfe;
    stim[32] = 103'h6138732a76379f90b97e736223;
    stim[33] = 103'h5c6170481b85135a93e0e99fd7;
    stim[34] = 103'h174b926de39b7282dcdc2ffd15;
    stim[35] = 103'h3ac8740c7654363e3ecb333439;
    stim[36] = 103'h03dbf56e8c2806d9f8f61fc3f7;
    stim[37] = 103'h79b919f1d7ae6ed378ad2ddcd7;
    stim[38] = 103'h6d3014ddd0a8d5bcaeb7cf396b;
    stim[39] = 103'h1e72d8520f074b4451fc746708;
    stim[40] = 103'h3558abd4b8d2c0f3d3c8510c0e;
    stim[41] = 103'h5e2ab1227074e1e9b22a5ff428;
    stim[42] = 103'h664366f05a6cf22f2f7b2f554f;
    stim[43] = 103'h7d1947c979da29bc153ea5bb72;
    stim[44] = 103'h0698b3cc6a0d440690bfe3539a;
    stim[45] = 103'h12e2f9d136b84db191103cbb70;
    stim[46] = 103'h48f574dcb351d16d41571e35ec;
    stim[47] = 103'h2ed83ec931701e98d100bd8b6e;
    stim[48] = 103'h67de0e0c8b1acbddc1d8127c5a;
    stim[49] = 103'h2e06df571a6a64c98aedc0902c;
    stim[50] = 103'h41872134718551e7b0a4878daf;
    stim[51] = 103'h3cbd850a962f10159f5388ac95;
    stim[52] = 103'h03e54b58f95e8f036021f23abf;
    stim[53] = 103'h6f3d475be2285f62e0d3bd6d00;
    stim[54] = 103'h3d2ead71f5f2abf0c4ec93bc58;
    stim[55] = 103'h23c7eb9276f79c1f56536c0a2e;
    stim[56] = 103'h403487ace62283a0de1bdba856;
    stim[57] = 103'h5608bc7633e3e609802e5b0368;
    stim[58] = 103'h1434a2c6df17a50f6977ddd3d6;
    stim[59] = 103'h70a064c2784e56232c4db6a513;
    stim[60] = 103'h5afbcde62e98e4224cdf036d08;
    stim[61] = 103'h71e37af9955f8c694bfa3982f8;
    stim[62] = 103'h40b6e57c64e61109256f989662;
    stim[63] = 103'h15a262097be1bc6b25559030ef;
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
      expv[0] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 100'hde0364a1fa93de6feaa76b09d;
      expv[2] = 100'ha516bfe66e8d48834c43e393b;
      expv[3] = 100'h6f89cb8ad73311227d37d7eec;
      expv[4] = 100'hdf139715ae662244fa6fafdd8;
      expv[5] = 100'h11bb90af9793436a4af17ec4e;
      expv[6] = 100'h66e8e379fa2d15e5db132c823;
      expv[7] = 100'hb37471bcfd168af2ed8996411;
      expv[8] = 100'hb37471bcfd168af2ed8996411;
      expv[9] = 100'h66e8e379fa2d15e5db132c823;
      expv[10] = 100'h66e8e379fa2d15e5db132c823;
      expv[11] = 100'h52b7887252f73e426009282f1;
      expv[12] = 100'h52b7887252f73e426009282f1;
      expv[13] = 100'ha95bc439297b9f21300494178;
      expv[14] = 100'h51c8c4bbb33ec4485cac44d55;
      expv[15] = 100'h8bddab226831094d4f8c6c526;
      expv[16] = 100'h17bb5644d062129a9f18d8a4d;
      expv[17] = 100'h9c053c2fe192e13e6e1fb1fc9;
      expv[18] = 100'hce029e17f0c9709f370fd8fe4;
      expv[19] = 100'h3d4500bd3d035a4c15b9cc0e3;
      expv[20] = 100'h7a8a017a7a06b4982b73981c6;
      expv[21] = 100'h56f9232873c394ed41012ac8c;
      expv[22] = 100'h77d40bed0aedbf933c7a40fb5;
      expv[23] = 100'hefa817da15db7f2678f481f6a;
      expv[24] = 100'h5264e4b2f3b88b5de7e158b86;
      expv[25] = 100'h5264e4b2f3b88b5de7e158b86;
      expv[26] = 100'ha4c9c965e77116bbcfc2b170c;
      expv[27] = 100'h499392cbcee22d779f8562e19;
      expv[28] = 100'h932725979dc45aef3f0ac5c32;
      expv[29] = 100'h1fa141bb7753749835e33c01c;
      expv[30] = 100'h0fd0a0ddbba9ba4c1af19e00e;
      expv[31] = 100'h0fd0a0ddbba9ba4c1af19e00e;
      expv[32] = 100'h1fa141bb7753749835e33c01c;
      expv[33] = 100'h138732a76379f90b97e736223;
      expv[34] = 100'hc6170481b85135a93e0e99fd7;
      expv[35] = 100'he30b8240dc289ad49f074cfeb;
      expv[36] = 100'he30b8240dc289ad49f074cfeb;
      expv[37] = 100'he30b8240dc289ad49f074cfeb;
      expv[38] = 100'h9b919f1d7ae6ed378ad2ddcd7;
      expv[39] = 100'hd3014ddd0a8d5bcaeb7cf396b;
      expv[40] = 100'he980a6ee8546ade575be79cb5;
      expv[41] = 100'he980a6ee8546ade575be79cb5;
      expv[42] = 100'he2ab1227074e1e9b22a5ff428;
      expv[43] = 100'h64366f05a6cf22f2f7b2f554f;
      expv[44] = 100'hd1947c979da29bc153ea5bb72;
      expv[45] = 100'hd1947c979da29bc153ea5bb72;
      expv[46] = 100'h68ca3e4bced14de0a9f52ddb9;
      expv[47] = 100'h8f574dcb351d16d41571e35ec;
      expv[48] = 100'h1eae9b966a3a2da82ae3c6bd9;
      expv[49] = 100'h7de0e0c8b1acbddc1d8127c5a;
      expv[50] = 100'hfbc1c19163597bb83b024f8b4;
      expv[51] = 100'h1872134718551e7b0a4878daf;
      expv[52] = 100'h1872134718551e7b0a4878daf;
      expv[53] = 100'h1872134718551e7b0a4878daf;
      expv[54] = 100'hf3d475be2285f62e0d3bd6d00;
      expv[55] = 100'hf3d475be2285f62e0d3bd6d00;
      expv[56] = 100'he7a8eb7c450bec5c1a77ada01;
      expv[57] = 100'h03487ace62283a0de1bdba856;
      expv[58] = 100'h608bc7633e3e609802e5b0368;
      expv[59] = 100'h3045e3b19f1f304c0172d81b4;
      expv[60] = 100'h0a064c2784e56232c4db6a513;
      expv[61] = 100'hafbcde62e98e4224cdf036d08;
      expv[62] = 100'h1e37af9955f8c694bfa3982f8;
      expv[63] = 100'h0b6e57c64e61109256f989662;
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
