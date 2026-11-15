// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020610 dut (
    .Clk(clk),
    .Reset(in_vec[69:69]),
    .Ain(in_vec[68:37]),
    .Bin(in_vec[36:5]),
    .Start(in_vec[4:4]),
    .MorD(in_vec[3:3]),
    .HorL(in_vec[2:2]),
    .Sign(in_vec[1:1]),
    .We(in_vec[0:0]),
    .Ready(out_vec[32:32]),
    .DC(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h252a81a4d19f737bad;
    stim[1] = 70'h32e10db482a1289881;
    stim[2] = 70'h040b73217ec56b31eb;
    stim[3] = 70'h190a823e3c6c830c60;
    stim[4] = 70'h0a3a21df8022ac24ad;
    stim[5] = 70'h196e00bf5c1ec7f529;
    stim[6] = 70'h1f791d523d1022afa8;
    stim[7] = 70'h08cca9db376829bc98;
    stim[8] = 70'h1d58dfffbd5a0a4394;
    stim[9] = 70'h1024c249a8047005fe;
    stim[10] = 70'h143e47e6a5b453b333;
    stim[11] = 70'h15ea8a556c16932a90;
    stim[12] = 70'h188dfb562f7833b1a9;
    stim[13] = 70'h076864285a1bc9fe12;
    stim[14] = 70'h06ee3a6a4de5614458;
    stim[15] = 70'h013a44b1381ad28c62;
    stim[16] = 70'h1bb191969ccfa19bec;
    stim[17] = 70'h0ca52fb6379f7fd94e;
    stim[18] = 70'h02396c71c216fa009a;
    stim[19] = 70'h343cf25e78dc321a72;
    stim[20] = 70'h02510d3229a67ca12c;
    stim[21] = 70'h088b6c14d76c7d3d56;
    stim[22] = 70'h1296aba60fe1695f42;
    stim[23] = 70'h0ddb7947fdb53df9c4;
    stim[24] = 70'h1852f3264361ab942c;
    stim[25] = 70'h044a6d2e6b200663d0;
    stim[26] = 70'h1dd379f7ca70992a1f;
    stim[27] = 70'h0c30b45df1b6a744ef;
    stim[28] = 70'h298a51952f40c14775;
    stim[29] = 70'h253a3c9fac82baadc3;
    stim[30] = 70'h0897042c07e36c1255;
    stim[31] = 70'h17d03014ceef5f3751;
    stim[32] = 70'h0c2c0fce63e8a760cc;
    stim[33] = 70'h07a99e608e28a40994;
    stim[34] = 70'h193481ae129bb1529e;
    stim[35] = 70'h108ae955d8723c9673;
    stim[36] = 70'h1a82efdb4700601e8c;
    stim[37] = 70'h1646bcfd9582477657;
    stim[38] = 70'h1ea34abaf732264451;
    stim[39] = 70'h018feded3712138ca5;
    stim[40] = 70'h1ecdcc0baf0694d83c;
    stim[41] = 70'h1805727f50a9540e6b;
    stim[42] = 70'h19ec792158c3b0f407;
    stim[43] = 70'h123854d58f23438f48;
    stim[44] = 70'h00351a94aa937614c6;
    stim[45] = 70'h1302ff0d59a3a5aa4a;
    stim[46] = 70'h0f9c89e1b3793c3efb;
    stim[47] = 70'h12ca0cf95a7fda3c31;
    stim[48] = 70'h0f79b860f4e2330250;
    stim[49] = 70'h0daa82d2d9f0b8abfd;
    stim[50] = 70'h18c2f64f0762592f7d;
    stim[51] = 70'h03b6d336ff44072dd7;
    stim[52] = 70'h08dd6797cfe3a0a145;
    stim[53] = 70'h152da81fc2bf4f228f;
    stim[54] = 70'h142503bbe1d151497d;
    stim[55] = 70'h1dbdedfc22495d6201;
    stim[56] = 70'h13315132c24f4a9ee2;
    stim[57] = 70'h193ec689796e8ba2eb;
    stim[58] = 70'h08e02aa6dc8e369a44;
    stim[59] = 70'h062454d5a363c5d60e;
    stim[60] = 70'h149b5b307e1bc363b2;
    stim[61] = 70'h0bc0ca8065fca6600d;
    stim[62] = 70'h0261f0d052f665b777;
    stim[63] = 70'h1cd8c8f7dc2b01cda4;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h0205b990b;
      expv[4] = 33'h000000000;
      expv[5] = 33'h0205b990b;
      expv[6] = 33'h0cb7005fa;
      expv[7] = 33'h0cb7005fa;
      expv[8] = 33'h051d10efd;
      expv[9] = 33'h051d10efd;
      expv[10] = 33'h086b153de;
      expv[11] = 33'h086b153de;
      expv[12] = 33'h086b153de;
      expv[13] = 33'h0c46fdab1;
      expv[14] = 33'h0c46fdab1;
      expv[15] = 33'h08f326331;
      expv[16] = 33'h051d10f19;
      expv[17] = 33'h051d10f19;
      expv[18] = 33'h08f326331;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h0445b60a6;
      expv[24] = 33'h0445b60a6;
      expv[25] = 33'h000000000;
      expv[26] = 33'h022536973;
      expv[27] = 33'h022536973;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h044b82160;
      expv[33] = 33'h044b82160;
      expv[34] = 33'h03d4cf304;
      expv[35] = 33'h000000000;
      expv[36] = 33'h03d4cf304;
      expv[37] = 33'h03d4cf304;
      expv[38] = 33'h000000000;
      expv[39] = 33'h04dca1814;
      expv[40] = 33'h00c7f6f69;
      expv[41] = 33'h0e0d29b04;
      expv[42] = 33'h00c7f6f6a;
      expv[43] = 33'h0c02b93fa;
      expv[44] = 33'h0cf63c90a;
      expv[45] = 33'h0c02b93fa;
      expv[46] = 33'h0c02b93fa;
      expv[47] = 33'h02461b203;
      expv[48] = 33'h02461b203;
      expv[49] = 33'h0cf63c90b;
      expv[50] = 33'h0cf63c90b;
      expv[51] = 33'h0cf63c90e;
      expv[52] = 33'h0cf63c90e;
      expv[53] = 33'h046eb3cbe;
      expv[54] = 33'h0a96d40fe;
      expv[55] = 33'h07830dc73;
      expv[56] = 33'h0edef6fe1;
      expv[57] = 33'h0edef6fe1;
      expv[58] = 33'h0a96d4102;
      expv[59] = 33'h0a96d4102;
      expv[60] = 33'h0c9f6344b;
      expv[61] = 33'h05b25267d;
      expv[62] = 33'h05e065403;
      expv[63] = 33'h05e065403;
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
