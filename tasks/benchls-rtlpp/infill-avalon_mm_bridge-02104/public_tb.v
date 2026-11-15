// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02104 dut (
    .clk(clk),
    .downstream_readdata(in_vec[51:36]),
    .downstream_readdatavalid(in_vec[35:35]),
    .downstream_waitrequest(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .upstream_address(in_vec[32:28]),
    .upstream_burstcount(in_vec[27:25]),
    .upstream_byteenable(in_vec[24:23]),
    .upstream_debugaccess(in_vec[22:22]),
    .upstream_nativeaddress(in_vec[21:18]),
    .upstream_read(in_vec[17:17]),
    .upstream_write(in_vec[16:16]),
    .upstream_writedata(in_vec[15:0]),
    .downstream_address(out_vec[51:48]),
    .downstream_arbitrationshare(out_vec[47:44]),
    .downstream_burstcount(out_vec[43:43]),
    .downstream_byteenable(out_vec[42:41]),
    .downstream_debugaccess(out_vec[40:40]),
    .downstream_nativeaddress(out_vec[39:36]),
    .downstream_read(out_vec[35:35]),
    .downstream_write(out_vec[34:34]),
    .downstream_writedata(out_vec[33:18]),
    .upstream_readdata(out_vec[17:2]),
    .upstream_readdatavalid(out_vec[1:1]),
    .upstream_waitrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h39a6c6ed6e69a;
    stim[1] = 52'h4e43452b43113;
    stim[2] = 52'he9faee2e9168b;
    stim[3] = 52'h5dc1bd7b15060;
    stim[4] = 52'h6a3a2ce6b8fed;
    stim[5] = 52'h4ad783777c85c;
    stim[6] = 52'hfadc3d206259c;
    stim[7] = 52'hb84462ab1ff48;
    stim[8] = 52'h22d27f871feb2;
    stim[9] = 52'hf3db693be6005;
    stim[10] = 52'hf431687f1ded0;
    stim[11] = 52'h0b5bf427de37c;
    stim[12] = 52'h9d0cfc769fdff;
    stim[13] = 52'h4f6d2f9fe4e77;
    stim[14] = 52'h2eedfaf5adda5;
    stim[15] = 52'h63f62ae2952e8;
    stim[16] = 52'hd5cf2daa159db;
    stim[17] = 52'h582f37ca135ec;
    stim[18] = 52'ha14371cc28a37;
    stim[19] = 52'h1dfeb91291ec8;
    stim[20] = 52'h8316ba709f688;
    stim[21] = 52'h7b376c6aeee10;
    stim[22] = 52'he38869b79cf7d;
    stim[23] = 52'h3d6db91ab69fa;
    stim[24] = 52'hf82231e78d1bf;
    stim[25] = 52'h706fa28f0f7f3;
    stim[26] = 52'h1764ecbf07c36;
    stim[27] = 52'h1f79a262e1f4f;
    stim[28] = 52'heddbf0112e023;
    stim[29] = 52'hcbe5f50e4d3b1;
    stim[30] = 52'h9c68ee7d5ea70;
    stim[31] = 52'h837fe6a1450a5;
    stim[32] = 52'ha022ad062fd3f;
    stim[33] = 52'ha1c7722a363f5;
    stim[34] = 52'h57d5bc2f65b6d;
    stim[35] = 52'h67803ea1fdfe8;
    stim[36] = 52'h929a3045c91d5;
    stim[37] = 52'hb5f73c0cb142b;
    stim[38] = 52'h6a8866a45f70d;
    stim[39] = 52'h72788a44996a6;
    stim[40] = 52'he5657d33b5f4f;
    stim[41] = 52'h9ced6991f4a07;
    stim[42] = 52'h5f12e8fb52afe;
    stim[43] = 52'hf2772cf34abfb;
    stim[44] = 52'hb55afe84f5c5e;
    stim[45] = 52'h821576683b644;
    stim[46] = 52'h10dbf681d48bb;
    stim[47] = 52'hce752e8ef0cba;
    stim[48] = 52'h3000e937a225b;
    stim[49] = 52'hc27f79ba613bd;
    stim[50] = 52'ha9d72f2de4ac6;
    stim[51] = 52'h4ab2ad5c80a29;
    stim[52] = 52'hfcc134e52346d;
    stim[53] = 52'hd0cfbcdcf3f3f;
    stim[54] = 52'he5fdab74f9e0e;
    stim[55] = 52'hd13a229e4b69a;
    stim[56] = 52'h817e30b7b3173;
    stim[57] = 52'hb173be69e95de;
    stim[58] = 52'hbad9f6557f356;
    stim[59] = 52'h8fd1f46a442c1;
    stim[60] = 52'h2606b59670572;
    stim[61] = 52'h61bde4818244c;
    stim[62] = 52'h4b43e89633d4c;
    stim[63] = 52'hc9baaeb803789;
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
      expv[0] = 52'h67b5b9a680001;
      expv[1] = 52'h51ad0c44c0001;
      expv[2] = 52'he1ba45a2c0001;
      expv[3] = 52'hd3ec54183a7ea;
      expv[4] = 52'hc79aa3fb57706;
      expv[5] = 52'h33ddb21700000;
      expv[6] = 52'hd181896700000;
      expv[7] = 52'h25ac7fd23eb71;
      expv[8] = 52'hf49c7facae111;
      expv[9] = 52'h91ef980148b49;
      expv[10] = 52'h83fc77b43cf6d;
      expv[11] = 52'h419f78df3d0c5;
      expv[12] = 52'hc3da7f7fc2d6f;
      expv[13] = 52'hf4ff939de7432;
      expv[14] = 52'hf7d6b76953db5;
      expv[15] = 52'hf78a94ba0bbb7;
      expv[16] = 52'hf5a89676d8fd9;
      expv[17] = 52'hf6a88d7b3573d;
      expv[18] = 52'h16b0a28dd60bd;
      expv[19] = 52'h90ca47b22850c;
      expv[20] = 52'ha3c27da2077fa;
      expv[21] = 52'hc3abbb8420c5b;
      expv[22] = 52'h95de73df5ecdd;
      expv[23] = 52'h90ea9a7eb8e20;
      expv[24] = 52'h979eb46fcf5b7;
      expv[25] = 52'h94bcbdfcfe089;
      expv[26] = 52'h95fc9f0d9c1bf;
      expv[27] = 52'h938b87d3c5d93;
      expv[28] = 52'h00c4b808c7de7;
      expv[29] = 52'h50b934ec7b76f;
      expv[30] = 52'he3f57a9c32f97;
      expv[31] = 52'h65851429671a3;
      expv[32] = 52'hd098bf4fe0dfe;
      expv[33] = 52'hd1a898fd6808b;
      expv[34] = 52'hd1bd96db6871d;
      expv[35] = 52'hd587b7fa15f57;
      expv[36] = 52'hd297a47559e01;
      expv[37] = 52'hc0b2850ae4a68;
      expv[38] = 52'hc591bdc36d7dd;
      expv[39] = 52'ha29265a980000;
      expv[40] = 52'hd1ce97d3c0001;
      expv[41] = 52'h94c79281f9595;
      expv[42] = 52'h87ed4abfa73b5;
      expv[43] = 52'hc7cd2afed7c4a;
      expv[44] = 52'he4939717bc9dd;
      expv[45] = 52'h63a0ad912d56b;
      expv[46] = 52'h6487522ee0855;
      expv[47] = 52'he4bb832e8436e;
      expv[48] = 52'he1de8896f39d5;
      expv[49] = 52'he5e984ef4c003;
      expv[50] = 52'he1b792b1b09fd;
      expv[51] = 52'he2f2828a6a75d;
      expv[52] = 52'he7948d1b52acb;
      expv[53] = 52'hc6f38fcfff304;
      expv[54] = 52'hc3d3a783b433f;
      expv[55] = 52'h24f92da6b97f6;
      expv[56] = 52'h05de8c5cf44e8;
      expv[57] = 52'he3a7a577a05f8;
      expv[58] = 52'he2d5bcd5ac5cf;
      expv[59] = 52'he3a990b06eb67;
      expv[60] = 52'he4d9815ca3f47;
      expv[61] = 52'he48689130981b;
      expv[62] = 52'he4d88f53186f7;
      expv[63] = 52'he5e08de252d0f;
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
