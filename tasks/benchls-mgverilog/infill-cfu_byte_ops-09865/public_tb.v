// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09865 dut (
    .clk(clk),
    .cmd_valid(in_vec[76:76]),
    .cmd_payload_function_id(in_vec[75:66]),
    .cmd_payload_inputs_0(in_vec[65:34]),
    .cmd_payload_inputs_1(in_vec[33:2]),
    .rsp_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .cmd_ready(out_vec[33:33]),
    .rsp_valid(out_vec[32:32]),
    .rsp_payload_outputs_0(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h0891c32dcb2e8bac4c21;
    stim[1] = 77'h0c503c0206daedb6cd2f;
    stim[2] = 77'h0be257be98bf914329b0;
    stim[3] = 77'h1c54ac9c55221ef3a0fa;
    stim[4] = 77'h0779a2a6c345e4674ca6;
    stim[5] = 77'h112d6b101879d2494d98;
    stim[6] = 77'h1f80d4820d504d717d6e;
    stim[7] = 77'h0f37d34b8a53f925c9ac;
    stim[8] = 77'h199341abe4bf1fb0c0c4;
    stim[9] = 77'h06a362099a6ba61c46ce;
    stim[10] = 77'h17d9a8a0933559e850ec;
    stim[11] = 77'h1b38c7d548212cc905d0;
    stim[12] = 77'h1fd3621b68cd5f347cee;
    stim[13] = 77'h01930473984851aafe08;
    stim[14] = 77'h03de721ce7fea3e428c6;
    stim[15] = 77'h1e5af5568d4cdd9b5198;
    stim[16] = 77'h0b671d6772092e056684;
    stim[17] = 77'h18f73f48cfb694bcd3e6;
    stim[18] = 77'h1a13f758a6c680265190;
    stim[19] = 77'h0f8e76127116dea0246a;
    stim[20] = 77'h1ff2ee3fea942502f166;
    stim[21] = 77'h1663bb6d0b0320378afa;
    stim[22] = 77'h06c85ea2b29c27ba7840;
    stim[23] = 77'h1ae94851f22cd835ec86;
    stim[24] = 77'h1ca5149cd2757ced28ca;
    stim[25] = 77'h0fecda74aab50aa7201c;
    stim[26] = 77'h056d5e4b9e715d52ec5e;
    stim[27] = 77'h0e7e0ad1422b498a8a1a;
    stim[28] = 77'h0c44135fa68a975c449e;
    stim[29] = 77'h021f56479f19e44af170;
    stim[30] = 77'h1551909fc6dc2fcd742e;
    stim[31] = 77'h1b10f7fca16567e9d0ac;
    stim[32] = 77'h1e04abda77b48c304d46;
    stim[33] = 77'h12a1036dd05c2d1853b4;
    stim[34] = 77'h00202313d814dfe2ff6a;
    stim[35] = 77'h1652dedcd548691c7544;
    stim[36] = 77'h0b5172db6eaf512e8dea;
    stim[37] = 77'h154d55b5f5ba44441582;
    stim[38] = 77'h1a740b2ec9bc70fccbc2;
    stim[39] = 77'h02eaf8e15d958d7fc81e;
    stim[40] = 77'h18d31e5e8ad1406ad522;
    stim[41] = 77'h056474ffbcdee1c55d00;
    stim[42] = 77'h1eceb436555caa464dac;
    stim[43] = 77'h15fa9dfeced74ec04a6a;
    stim[44] = 77'h199cada9edc681d53b26;
    stim[45] = 77'h05a249b68b59f9b1e840;
    stim[46] = 77'h0dfcba6f94b80b5c40b4;
    stim[47] = 77'h0f9adafbc9d3c57a454c;
    stim[48] = 77'h1aaf33dbf86344561d6e;
    stim[49] = 77'h16b4c4bd652e0f1b618e;
    stim[50] = 77'h079a69732633a9c99098;
    stim[51] = 77'h0a9641ba22edcad43279;
    stim[52] = 77'h011f6a54d0aeecef00be;
    stim[53] = 77'h1c012ce17e0bbe179f1a;
    stim[54] = 77'h1dc7a74e0fff9d5fdad2;
    stim[55] = 77'h1bb87bcf07b543d9c5c2;
    stim[56] = 77'h15dfeca9807b4a975e3e;
    stim[57] = 77'h020f00b964e624660ff0;
    stim[58] = 77'h0ebe8a438e43dec55d64;
    stim[59] = 77'h14683041cec200103966;
    stim[60] = 77'h0bffc6104bacfe7e2faa;
    stim[61] = 77'h0e967a6d5a0415106b28;
    stim[62] = 77'h0c94a81bba5b96a2f6c2;
    stim[63] = 77'h03858a9e37661ba15002;
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
      expv[0] = 34'h000000420;
      expv[1] = 34'h20000036c;
      expv[2] = 34'h0000004c3;
      expv[3] = 34'h34815272b;
      expv[4] = 34'h28b0d9516;
      expv[5] = 34'h17860235a;
      expv[6] = 34'h300000255;
      expv[7] = 34'h094e2d2f4;
      expv[8] = 34'h100000476;
      expv[9] = 34'h20000048e;
      expv[10] = 34'h1b3241456;
      expv[11] = 34'h1104aaf8c;
      expv[12] = 34'h3000003e9;
      expv[13] = 34'h000000394;
      expv[14] = 34'h2ff9ce139;
      expv[15] = 34'h1cac5aabd;
      expv[16] = 34'h082dc59c7;
      expv[17] = 34'h3ed33d2cf;
      expv[18] = 34'h10000044e;
      expv[19] = 34'h2a23921b9;
      expv[20] = 34'h300000447;
      expv[21] = 34'h300000540;
      expv[22] = 34'h0e53515e8;
      expv[23] = 34'h3d13e284a;
      expv[24] = 34'h39d342745;
      expv[25] = 34'h0b554b96c;
      expv[26] = 34'h239e749ea;
      expv[27] = 34'h2510a2d41;
      expv[28] = 34'h2a2e9d704;
      expv[29] = 34'h063e789ab;
      expv[30] = 34'h300000399;
      expv[31] = 34'h1000003af;
      expv[32] = 34'h3ed9df62a;
      expv[33] = 34'h1000002f8;
      expv[34] = 34'h20000048f;
      expv[35] = 34'h1000002c4;
      expv[36] = 34'h2000004d4;
      expv[37] = 34'h376beb6aa;
      expv[38] = 34'h36fb2cb02;
      expv[39] = 34'h2a6ea1c7d;
      expv[40] = 34'h30000041b;
      expv[41] = 34'h037ef3f1d;
      expv[42] = 34'h1eaa9b0b5;
      expv[43] = 34'h3adcdfee5;
      expv[44] = 34'h38ede56d4;
      expv[45] = 34'h0000003eb;
      expv[46] = 34'h074a7d974;
      expv[47] = 34'h02e4f7d6d;
      expv[48] = 34'h3187f6f33;
      expv[49] = 34'h34b592f31;
      expv[50] = 34'h031933a59;
      expv[51] = 34'h0bb886e90;
      expv[52] = 34'h2d42ca95b;
      expv[53] = 34'h300000485;
      expv[54] = 34'h3ff83d3e9;
      expv[55] = 34'h3b783cf78;
      expv[56] = 34'h3780654df;
      expv[57] = 34'h09c9a7403;
      expv[58] = 34'h009c70945;
      expv[59] = 34'h30dce0830;
      expv[60] = 34'h2d748218f;
      expv[61] = 34'h081569b9e;
      expv[62] = 34'h296ee062a;
      expv[63] = 34'h2d98da762;
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
