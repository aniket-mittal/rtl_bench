// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_143598 dut (
    .clk(clk),
    .reset(in_vec[129:129]),
    .message(in_vec[128:1]),
    .start(in_vec[0:0]),
    .hash(out_vec[128:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h28eff085277b2033c989c7721abd61626;
    stim[1] = 130'h292754f11648bc59649ab4c3aab33c60c;
    stim[2] = 130'h0e4d67de519aee2b5c70f8a255cbae6ec;
    stim[3] = 130'h25059c63bdcce0b86026eff7f3feb3b90;
    stim[4] = 130'h1520b230eafdc63414592887252361469;
    stim[5] = 130'h182167387e390bc36a96351b48667b840;
    stim[6] = 130'h0893e479f8d4595b973c5e59ab8c57cc1;
    stim[7] = 130'h1049c85ffb18ed9165b60ca9b80b709a9;
    stim[8] = 130'h14bbd7039e769dfd38387cff2d13d5ec7;
    stim[9] = 130'h05884b3813216809cdb53011600e6647a;
    stim[10] = 130'h096f945453ac4ce465f10420dd2b76b07;
    stim[11] = 130'h0da4a31ecdab76a66fc380ad3fc0c22fb;
    stim[12] = 130'h1bc251dc5797117ac552c89cbc2caf64c;
    stim[13] = 130'h1db5eb5ed4ffe560df0e083cc3b4e5cf2;
    stim[14] = 130'h1c6df2deb8dccf7b68c697fdc2dd27ddd;
    stim[15] = 130'h0ea61d5ee52855a5d29d63ea97596344c;
    stim[16] = 130'h11ecda99e042bf719f1d9778bba7bca6e;
    stim[17] = 130'h0f3e7bf5468275f02650fa25e33210f03;
    stim[18] = 130'h1a5048ef1b8fefcc77d2349737a7a2bbc;
    stim[19] = 130'h0433e28aa9d1b054ee9a2fcd9e7b3d048;
    stim[20] = 130'h102bd402325520478e7ad5f12f4c46775;
    stim[21] = 130'h1d8870833a747ee699140933fee37d95a;
    stim[22] = 130'h067ef98f5ece8b94be02c3f056a9bb0ec;
    stim[23] = 130'h0189fa094935f3b7347d116e1e82cffdc;
    stim[24] = 130'h1b4fefee0957cb632adae632cf699da63;
    stim[25] = 130'h06ab7eb0285d6e057971c582a4b664311;
    stim[26] = 130'h0981d63551a4e696893ae507233e48bfb;
    stim[27] = 130'h0d12af7ef66568c387db7ca43d5f78e0b;
    stim[28] = 130'h16cb2f2c1fa2b0868d29d1cfcaeb42bf9;
    stim[29] = 130'h04ee8eeddcf87c9b948ff8a259c09749e;
    stim[30] = 130'h0b63fff5ea6dcbdbf396e6b58021785fd;
    stim[31] = 130'h174bdce0b5f482f22ee820de673fe6c29;
    stim[32] = 130'h07c92dc2f8c83904dcb7f44c03f3ce63e;
    stim[33] = 130'h1eb6fb46af33b5640a6c539af58e3f1bd;
    stim[34] = 130'h05efa2825b1399d5ebcae3b318b28b5b1;
    stim[35] = 130'h02721eda851df591b480d4d56945e4444;
    stim[36] = 130'h060653f4fd42f3780240e05b3a4cd3491;
    stim[37] = 130'h3517a5600f8cbfec9f893cf8a71c37077;
    stim[38] = 130'h117f7ffa250410f1972b70404b1d348c3;
    stim[39] = 130'h07aaf11581097a880f709b6d114122e93;
    stim[40] = 130'h1ff7dda10b59db1dbfb53d66c49d45476;
    stim[41] = 130'h08a3cdb0a9892017beb9ea6b20c48ba8a;
    stim[42] = 130'h1e083a5ba95ef4226343d19de75041d5b;
    stim[43] = 130'h1df481a25d89b2206274dd79541a77481;
    stim[44] = 130'h1f07f3604abb364e4b2d3a1f6709c92ca;
    stim[45] = 130'h077eb67ce691b5aab9721eabdb1b186bf;
    stim[46] = 130'h0a1ed35529e21c00752da09c31b988813;
    stim[47] = 130'h06b1775508277940b711abdbfd4b87098;
    stim[48] = 130'h141e49a805029614305c3663dc5b1fad2;
    stim[49] = 130'h00f636b59beb0633c2e506bbb3b770d35;
    stim[50] = 130'h1d0f33b976391aecfa42071282d0c6ffb;
    stim[51] = 130'h1bceef134c85273774833a148b1a03088;
    stim[52] = 130'h00c3894d4fcad7cb3f07e66ebd24b81f8;
    stim[53] = 130'h18433447c723c71723012079ea99640e3;
    stim[54] = 130'h0d8aad31bc5edf6ab94e3b28fa1dedc91;
    stim[55] = 130'h1c185d47a206c1b8a17edca53403a664e;
    stim[56] = 130'h1353cec0905ada9fcf6f3b20303fc26ab;
    stim[57] = 130'h05ce5f41b9967944061db709a54d6d7e1;
    stim[58] = 130'h170015dd6c713ee9a3591c2e546b00206;
    stim[59] = 130'h07a4d7c7644f58def1a5dd5486dba43fa;
    stim[60] = 130'h136039c1ff8e1a5c494b6b8500ade941c;
    stim[61] = 130'h12cdecae3e2f67abec156b9e143199541;
    stim[62] = 130'h10ec4d757e17df7d920c8e4056b2bb06e;
    stim[63] = 130'h192f48f4d01deef3a9bc8055ae6a00ab4;
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
      expv[0] = 129'h000000000000000000000000000000000;
      expv[1] = 129'h000000000000000000000000000000000;
      expv[2] = 129'h000000000000000000000000000000000;
      expv[3] = 129'h000000000000000000000000000000000;
      expv[4] = 129'h000000000000000000000000000000000;
      expv[5] = 129'h000000000000000000000000000000000;
      expv[6] = 129'h000000000000000000000000000000000;
      expv[7] = 129'h0000000000000000000000001a27b1c73;
      expv[8] = 129'h0000000000000000000000001a27b1c73;
      expv[9] = 129'h0000000000000000000000001a27b1c73;
      expv[10] = 129'h0000000000000000000000002ee388cab;
      expv[11] = 129'h0000000000000000000000002ee388cab;
      expv[12] = 129'h0000000000000000000000002ee388cab;
      expv[13] = 129'h0000000000000000000000003c882be97;
      expv[14] = 129'h0000000000000000000000003c882be97;
      expv[15] = 129'h0000000000000000000000003c882be97;
      expv[16] = 129'h0000000000000000000000003c882be97;
      expv[17] = 129'h0000000000000000000000004b2e49485;
      expv[18] = 129'h0000000000000000000000004b2e49485;
      expv[19] = 129'h0000000000000000000000004b2e49485;
      expv[20] = 129'h000000000000000000000000657e92375;
      expv[21] = 129'h000000000000000000000000657e92375;
      expv[22] = 129'h000000000000000000000000657e92375;
      expv[23] = 129'h000000000000000000000000830702ba7;
      expv[24] = 129'h000000000000000000000000830702ba7;
      expv[25] = 129'h000000000000000000000000830702ba7;
      expv[26] = 129'h000000000000000000000000830702ba7;
      expv[27] = 129'h00000000000000000000000089b2816a9;
      expv[28] = 129'h00000000000000000000000089b2816a9;
      expv[29] = 129'h00000000000000000000000089b2816a9;
      expv[30] = 129'h000000000000000000000000a07db0969;
      expv[31] = 129'h000000000000000000000000a07db0969;
      expv[32] = 129'h000000000000000000000000a07db0969;
      expv[33] = 129'h000000000000000000000000b7c98d773;
      expv[34] = 129'h000000000000000000000000b7c98d773;
      expv[35] = 129'h000000000000000000000000b7c98d773;
      expv[36] = 129'h000000000000000000000000bdb92ff97;
      expv[37] = 129'h000000000000000000000000000000000;
      expv[38] = 129'h000000000000000000000000000000000;
      expv[39] = 129'h000000000000000000000000000000000;
      expv[40] = 129'h000000000000000000000000000000000;
      expv[41] = 129'h00000000000000000000000009b13ba45;
      expv[42] = 129'h00000000000000000000000009b13ba45;
      expv[43] = 129'h00000000000000000000000009b13ba45;
      expv[44] = 129'h00000000000000000000000009b13ba45;
      expv[45] = 129'h00000000000000000000000027a5bd469;
      expv[46] = 129'h00000000000000000000000027a5bd469;
      expv[47] = 129'h00000000000000000000000027a5bd469;
      expv[48] = 129'h00000000000000000000000031c4909bb;
      expv[49] = 129'h00000000000000000000000031c4909bb;
      expv[50] = 129'h00000000000000000000000031c4909bb;
      expv[51] = 129'h00000000000000000000000031c4909bb;
      expv[52] = 129'h0000000000000000000000004ed3c4551;
      expv[53] = 129'h0000000000000000000000004ed3c4551;
      expv[54] = 129'h0000000000000000000000004ed3c4551;
      expv[55] = 129'h0000000000000000000000004ed3c4551;
      expv[56] = 129'h0000000000000000000000005c5e7186b;
      expv[57] = 129'h0000000000000000000000005c5e7186b;
      expv[58] = 129'h0000000000000000000000005c5e7186b;
      expv[59] = 129'h000000000000000000000000622cd0c85;
      expv[60] = 129'h000000000000000000000000622cd0c85;
      expv[61] = 129'h000000000000000000000000622cd0c85;
      expv[62] = 129'h000000000000000000000000622cd0c85;
      expv[63] = 129'h000000000000000000000000622cd0c85;
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
