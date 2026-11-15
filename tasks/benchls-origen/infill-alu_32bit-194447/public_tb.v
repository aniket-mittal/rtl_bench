// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194447 dut (
    .opA(in_vec[66:35]),
    .opB(in_vec[34:3]),
    .sel(in_vec[2:0]),
    .res(out_vec[34:3]),
    .z(out_vec[2:2]),
    .c(out_vec[1:1]),
    .v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h0ee2576850055d7c0;
    stim[1] = 67'h766401f12bd2d35bf;
    stim[2] = 67'h1abb6bb3be7381936;
    stim[3] = 67'h6e41e901795bdaddc;
    stim[4] = 67'h4058c8a638e96edfa;
    stim[5] = 67'h087f0c4bd98693cd1;
    stim[6] = 67'h1032d37f88a00be7e;
    stim[7] = 67'h548c9fb6ed780fc6b;
    stim[8] = 67'h589fdca46589574c0;
    stim[9] = 67'h406265e573e4d78aa;
    stim[10] = 67'h63c1e4ca495d49da0;
    stim[11] = 67'h7683884f1715ed965;
    stim[12] = 67'h75ae40e0c0e8e63d7;
    stim[13] = 67'h3366c06874f0490d6;
    stim[14] = 67'h303dacc2c360afb9a;
    stim[15] = 67'h00900bfa715729c1c;
    stim[16] = 67'h750f4e7ef73f8219a;
    stim[17] = 67'h3fdf8a4885f89c344;
    stim[18] = 67'h483055a86ede00666;
    stim[19] = 67'h70af626095b3ce42a;
    stim[20] = 67'h6614a65989d9cbe79;
    stim[21] = 67'h5080e923e81a6bdf6;
    stim[22] = 67'h7337c3caba8909b73;
    stim[23] = 67'h091631c6659797b0a;
    stim[24] = 67'h595a2a59a46dfaf50;
    stim[25] = 67'h3548a37cf082841bc;
    stim[26] = 67'h0594eb238170dbb3a;
    stim[27] = 67'h0873a43f548a5d3a3;
    stim[28] = 67'h3611fa8871284023c;
    stim[29] = 67'h456ee23640700fa27;
    stim[30] = 67'h3c17323e705231563;
    stim[31] = 67'h07906134be445f2ad;
    stim[32] = 67'h3f0985bd4a5dc3b45;
    stim[33] = 67'h239125cc7219c0dcb;
    stim[34] = 67'h29243cc8f4de0bd42;
    stim[35] = 67'h1bea220c8a5da2ec1;
    stim[36] = 67'h75d24b7bb93295d4e;
    stim[37] = 67'h538fd26328c3e6a24;
    stim[38] = 67'h19901d10321102399;
    stim[39] = 67'h1c01e80fbebe2119b;
    stim[40] = 67'h7e88241db2b33be3d;
    stim[41] = 67'h57eb426273098a263;
    stim[42] = 67'h07f5dbc76b85f9ef5;
    stim[43] = 67'h6409a1657bb44c7f1;
    stim[44] = 67'h307de38a7e12a2dc2;
    stim[45] = 67'h3c8d93c84613b2c16;
    stim[46] = 67'h13a5359b90044f165;
    stim[47] = 67'h642b5e2d471c6a821;
    stim[48] = 67'h73510fe1f9b2eb864;
    stim[49] = 67'h699fbb9448669bf9a;
    stim[50] = 67'h7359188b3b33b70aa;
    stim[51] = 67'h08009db54cf20648d;
    stim[52] = 67'h497d8f1052d25a6f1;
    stim[53] = 67'h21f3f41f03320a077;
    stim[54] = 67'h4f5d5920e4a961b5e;
    stim[55] = 67'h3e01887cca5cdb4b9;
    stim[56] = 67'h50eeaf0766f4d1dd4;
    stim[57] = 67'h1b7b7cc4267746b43;
    stim[58] = 67'h7cfd28ad3df3f775a;
    stim[59] = 67'h6c2c91e0680de65a5;
    stim[60] = 67'h5f452b7166b6b6c4d;
    stim[61] = 67'h043ced59b18f30fd4;
    stim[62] = 67'h23d5dbe314894ba3a;
    stim[63] = 67'h1d462a26ce3270543;
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
      expv[0] = 35'h5ee7b4e40;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h11be16fe8;
      expv[4] = 35'h004848860;
      expv[5] = 35'h2ef8787ea;
      expv[6] = 35'h000000000;
      expv[7] = 35'h7dfc9ff68;
      expv[8] = 35'h3e2933f03;
      expv[9] = 35'h406045800;
      expv[10] = 35'h2d1f2ea43;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h0020ac808;
      expv[15] = 35'h7f6ff4058;
      expv[16] = 35'h750f02188;
      expv[17] = 35'h402075b70;
      expv[18] = 35'h000000000;
      expv[19] = 35'h10a342408;
      expv[20] = 35'h5c3ada720;
      expv[21] = 35'h000000000;
      expv[22] = 35'h7bbfcbff8;
      expv[23] = 35'h011611800;
      expv[24] = 35'h7dc8254e8;
      expv[25] = 35'h4ab75c830;
      expv[26] = 35'h0110cb238;
      expv[27] = 35'h5cfbfd3f0;
      expv[28] = 35'h49ee05778;
      expv[29] = 35'h000000000;
      expv[30] = 35'h7c57337e0;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h7399e5dc8;
      expv[34] = 35'h200408c00;
      expv[35] = 35'h118c7f208;
      expv[36] = 35'h000000000;
      expv[37] = 35'h2c702d9c8;
      expv[38] = 35'h677f1ad6a;
      expv[39] = 35'h3ebfe91f8;
      expv[40] = 35'h000000000;
      expv[41] = 35'h77ebca660;
      expv[42] = 35'h000000000;
      expv[43] = 35'h685554e62;
      expv[44] = 35'h3010a2880;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h1d0ef3ab0;
      expv[48] = 35'h0caef01e0;
      expv[49] = 35'h48069b900;
      expv[50] = 35'h3311100a0;
      expv[51] = 35'h000000000;
      expv[52] = 35'h76ab34a12;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h73a4ad313;
      expv[56] = 35'h2f1150f88;
      expv[57] = 35'h3f7f7ef40;
      expv[58] = 35'h3cf120250;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h7bc312a60;
      expv[62] = 35'h00814ba30;
      expv[63] = 35'h5f767a768;
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
