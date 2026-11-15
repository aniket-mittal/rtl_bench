// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119880 dut (
    .clk(clk),
    .nR(in_vec[69:69]),
    .newIN(in_vec[68:68]),
    .in(in_vec[67:4]),
    .loadData(in_vec[3:3]),
    .loadKey(in_vec[2:2]),
    .doneData(in_vec[1:1]),
    .doneKey(in_vec[0:0]),
    .loadPkt(out_vec[97:97]),
    .donePkt(out_vec[96:96]),
    .infoIN(out_vec[95:88]),
    .countIN(out_vec[87:83]),
    .newKey(out_vec[82:82]),
    .newData(out_vec[81:81]),
    .enc_dec(out_vec[80:80]),
    .blockIN(out_vec[79:64]),
    .KEY(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h083e3745efe6fc3610;
    stim[1] = 70'h015f00a56e18823533;
    stim[2] = 70'h2c6ea053ed950fdbaa;
    stim[3] = 70'h3ddd49db4c703a816b;
    stim[4] = 70'h2b1ddee6ce0ad5ff36;
    stim[5] = 70'h2f51c08c47af0d3cdd;
    stim[6] = 70'h3f56eedba7d71699a8;
    stim[7] = 70'h2b1274b78cd8ddc939;
    stim[8] = 70'h3696c7728f2b67fd5b;
    stim[9] = 70'h2d13c764c7b53c511c;
    stim[10] = 70'h2cb72f9c321fbdbab3;
    stim[11] = 70'h215f9e118e7d507e0c;
    stim[12] = 70'h2195e70014708b79c6;
    stim[13] = 70'h3b9da73dd5b255aaa5;
    stim[14] = 70'h2813f9637f95858883;
    stim[15] = 70'h357c2f479b57388d15;
    stim[16] = 70'h28cf719058954a517c;
    stim[17] = 70'h20080bc0183b181657;
    stim[18] = 70'h38493cd8e9c3c0d51e;
    stim[19] = 70'h3c59f784c7bc1697cb;
    stim[20] = 70'h2f7631add5a149b8ef;
    stim[21] = 70'h31a4ebaa093e63436d;
    stim[22] = 70'h3e22052a4a52a7f6f2;
    stim[23] = 70'h2725b34dd8f076a4f7;
    stim[24] = 70'h30f3cf32711fa967f1;
    stim[25] = 70'h26772f4cd6a4989c38;
    stim[26] = 70'h2f691b4aee04f999f7;
    stim[27] = 70'h2f7d4d7dc7bfeabed6;
    stim[28] = 70'h37e59f0e4381b23065;
    stim[29] = 70'h3db48022c5fb1c85f1;
    stim[30] = 70'h2a9a612c48b26ebbed;
    stim[31] = 70'h39287a358a0be126c1;
    stim[32] = 70'h3d73114967131b72a8;
    stim[33] = 70'h3ca30ec59f09d9b1d1;
    stim[34] = 70'h25761a1f08b56b7552;
    stim[35] = 70'h2f7d10686bb9bbe697;
    stim[36] = 70'h2fd7dae74be17cf831;
    stim[37] = 70'h233564306c79446199;
    stim[38] = 70'h2100990fb3aabd01c2;
    stim[39] = 70'h2a8d9634ff14aa1746;
    stim[40] = 70'h26d40671ddd9f75515;
    stim[41] = 70'h2bfdd2506ca3e65f6f;
    stim[42] = 70'h1fd0373b18c202dd31;
    stim[43] = 70'h3cbb14d3805297e9ae;
    stim[44] = 70'h3beca328f62ee86090;
    stim[45] = 70'h2c95363c28300750e9;
    stim[46] = 70'h2d657215e679668fd4;
    stim[47] = 70'h26b59576e8f1e38cdb;
    stim[48] = 70'h3c631557ba794ae389;
    stim[49] = 70'h33182c8fa68b05fda2;
    stim[50] = 70'h362ce1700a04a63566;
    stim[51] = 70'h2d27dbbb92db69af5d;
    stim[52] = 70'h3de4e5e5bfe7f97fa4;
    stim[53] = 70'h2bf0c7da9e90094dc4;
    stim[54] = 70'h26d134e18570efeb69;
    stim[55] = 70'h08da445febfaac9250;
    stim[56] = 70'h3f88f251027918aec7;
    stim[57] = 70'h2c3b9c934fd377f229;
    stim[58] = 70'h30e7740895b8e510a7;
    stim[59] = 70'h2b104753aaf6283917;
    stim[60] = 70'h24e37ba25797b44edf;
    stim[61] = 70'h3c61773952294d209b;
    stim[62] = 70'h3c34f09fd9fe762d21;
    stim[63] = 70'h26858016bb68cb96e3;
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
      expv[0] = 98'h0000000000000000000000000;
      expv[1] = 98'h0000000000000000000000000;
      expv[2] = 98'h0000000000000000000000000;
      expv[3] = 98'h0000000000000000000000000;
      expv[4] = 98'h0000000000000000000000000;
      expv[5] = 98'h2000000000000000000000000;
      expv[6] = 98'h0000000000000000000000000;
      expv[7] = 98'h0000000000000000000000000;
      expv[8] = 98'h2000000000000000000000000;
      expv[9] = 98'h0000000000000000000000000;
      expv[10] = 98'h100040000b1274b78cd8ddc93;
      expv[11] = 98'h000000000b1274b78cd8ddc93;
      expv[12] = 98'h000000000b1274b78cd8ddc93;
      expv[13] = 98'h000000000b1274b78cd8ddc93;
      expv[14] = 98'h000000000b1274b78cd8ddc93;
      expv[15] = 98'h200000000b1274b78cd8ddc93;
      expv[16] = 98'h000000000b1274b78cd8ddc93;
      expv[17] = 98'h000000000b1274b78cd8ddc93;
      expv[18] = 98'h000000000b1274b78cd8ddc93;
      expv[19] = 98'h000000000b1274b78cd8ddc93;
      expv[20] = 98'h200000000b1274b78cd8ddc93;
      expv[21] = 98'h000000000b1274b78cd8ddc93;
      expv[22] = 98'h100040000c59f784c7bc1697c;
      expv[23] = 98'h000000000c59f784c7bc1697c;
      expv[24] = 98'h200000000c59f784c7bc1697c;
      expv[25] = 98'h000000000c59f784c7bc1697c;
      expv[26] = 98'h100026a4fc59f784c7bc1697c;
      expv[27] = 98'h000006a4fc59f784c7bc1697c;
      expv[28] = 98'h000006a4fc59f784c7bc1697c;
      expv[29] = 98'h000006a4fc59f784c7bc1697c;
      expv[30] = 98'h200006a4fc59f784c7bc1697c;
      expv[31] = 98'h000006a4fc59f784c7bc1697c;
      expv[32] = 98'h100046a4fdb48022c5fb1c85f;
      expv[33] = 98'h000006a4fdb48022c5fb1c85f;
      expv[34] = 98'h200006a4fdb48022c5fb1c85f;
      expv[35] = 98'h000006a4fdb48022c5fb1c85f;
      expv[36] = 98'h100029b1ddb48022c5fb1c85f;
      expv[37] = 98'h000009b1ddb48022c5fb1c85f;
      expv[38] = 98'h000009b1ddb48022c5fb1c85f;
      expv[39] = 98'h000009b1ddb48022c5fb1c85f;
      expv[40] = 98'h000009b1ddb48022c5fb1c85f;
      expv[41] = 98'h000009b1ddb48022c5fb1c85f;
      expv[42] = 98'h0000000000000000000000000;
      expv[43] = 98'h0000000000000000000000000;
      expv[44] = 98'h0000000000000000000000000;
      expv[45] = 98'h2000000000000000000000000;
      expv[46] = 98'h0000000000000000000000000;
      expv[47] = 98'h1000286090000000000000000;
      expv[48] = 98'h0000086090000000000000000;
      expv[49] = 98'h0000086090000000000000000;
      expv[50] = 98'h2000086090000000000000000;
      expv[51] = 98'h0000086090000000000000000;
      expv[52] = 98'h0000086090000000000000000;
      expv[53] = 98'h0000086090000000000000000;
      expv[54] = 98'h2000086090000000000000000;
      expv[55] = 98'h0000000000000000000000000;
      expv[56] = 98'h0000000000000000000000000;
      expv[57] = 98'h0000000000000000000000000;
      expv[58] = 98'h2000000000000000000000000;
      expv[59] = 98'h0000000000000000000000000;
      expv[60] = 98'h100040000c3b9c934fd377f22;
      expv[61] = 98'h000000000c3b9c934fd377f22;
      expv[62] = 98'h000000000c3b9c934fd377f22;
      expv[63] = 98'h200000000c3b9c934fd377f22;
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
