// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 184;
  localparam OW = 166;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005397 dut (
    .pclk(clk),
    .mem_addr_add(in_vec[183:176]),
    .mem_write_add(in_vec[175:175]),
    .mem_write_data_add(in_vec[174:92]),
    .mem_addr_age(in_vec[91:84]),
    .mem_write_age(in_vec[83:83]),
    .mem_write_data_age(in_vec[82:0]),
    .mem_read_data_add(out_vec[165:83]),
    .mem_read_data_age(out_vec[82:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 184'hb987ef7126da82d17e3dd46c1cb4718a18d8031044489f;
    stim[1] = 184'hbf65c7ef71abed079320192b24a9e33d5a0ca03a5ae9e5;
    stim[2] = 184'h91ef33eb7fcfe7106f94b798cbf9943b244faf3c8258d9;
    stim[3] = 184'h3708a7945c3cbc7a3e08c7dbc903d9db7ec477edbeb21f;
    stim[4] = 184'hbcc8af2c7505736dc53b3762b06e2810e3cb17ca72a8d3;
    stim[5] = 184'h7fcc9b0b1bb6a9ace81dec0627655f74ea8a6c83cb0cca;
    stim[6] = 184'h220627c15ce42f47100cde084a3b8af621e1cf47c67e7d;
    stim[7] = 184'hc40c6084ca655937212fc5c6d3522dc9f4f77ed3949908;
    stim[8] = 184'h8000a780c6f02864c7012bc0d4b4cd54f0d6bd17595285;
    stim[9] = 184'h328108a330603be9b8aa19e50bd00240d94a7599cd092a;
    stim[10] = 184'ha47248c3f7b1a78353234a15c20264062c6d1dc0a31950;
    stim[11] = 184'hf020967f85e461130124eec5f8a8e40d6837bfd23db7b1;
    stim[12] = 184'h01e6415c9c7e8b3b522fcb8cf9c9efb2fe2afcfb4e104b;
    stim[13] = 184'ha447507d8b499ad54a5ad692c740643dda09dcdac0ee18;
    stim[14] = 184'he3bbff48e6c3acddd7f02a671b8553c5b0e18ad29e092d;
    stim[15] = 184'h6df6a5ef3c3b88d4b00a7cf11fc1372e3d976e8a798d05;
    stim[16] = 184'hbdd9e901797a2080d64e6ee223033c5cff6d86aa3846b7;
    stim[17] = 184'h410cfbff5d41c65251188fd9d76c5c6f06d82777847eda;
    stim[18] = 184'ha53b2fc9db5a71ee9b98def5cdfd6c1c833d3a49c4cbf7;
    stim[19] = 184'h5a301e181112ea74cea97aa0fba64d627e7ba13e1c5763;
    stim[20] = 184'h09cc21816bf4f508cbb4f1df89f615b22b4c046eb82c68;
    stim[21] = 184'h5fad2741898c769aedf75876b0ce70154f13f58cc64ec7;
    stim[22] = 184'h5ad96973db0127468f595da5d8422ad3eeb6002b752823;
    stim[23] = 184'h40b2c69b92454d3ff9e30ae918169670899e90a53fb146;
    stim[24] = 184'h53c83aac074f57745617e4b05d4f63ef0ec9350d740071;
    stim[25] = 184'h990b98146b7a40e1b5805d599f180a8022caf998d5ed07;
    stim[26] = 184'hef3cfe62afd666c103dd258d94793455bf100123181ad7;
    stim[27] = 184'h5afbe799168ef9eed1e8a9b173daafe4b1a5d84eb7e724;
    stim[28] = 184'ha0d771ca34696d49d0fb8b0c92b6cc86b4ee32847358ce;
    stim[29] = 184'hda26e8b3a032b09fb2b766c97faf9fe043c5c45751c7ad;
    stim[30] = 184'hd9006f6454db448a9182554bae67a0bc078890cb5c93fc;
    stim[31] = 184'hc18b3b0ddccaebe27eff68950b9d0728d54ea6f2e6cd43;
    stim[32] = 184'h70c330ba3c11333e30252f9ce88f4ed6210fde7fc21e33;
    stim[33] = 184'he17c88e7e9f75de8f33874f6093cb56c2c2d1ac0a6ecba;
    stim[34] = 184'he88951824149e09e083a9a7656cd20a3e97626585134de;
    stim[35] = 184'h5623a096e477fb917f8e9e7991b4f3bd29e132452d1a22;
    stim[36] = 184'h6c2fa1d07fef08046b63c2438929988d58f50a20d176e0;
    stim[37] = 184'h127e8ff6645ad868a78737a9282f13111627ddaf14878b;
    stim[38] = 184'h1804f35ca9d21d5f49125cb70ba2f5ef79b4a4eeead1b5;
    stim[39] = 184'h569e421d3f3615d0db41b15b3cb9d86f9ee6afb9d04f4b;
    stim[40] = 184'hca8770a53f68ccce458d42ee1602d07a1947c50cc382a0;
    stim[41] = 184'hc8f6915fc7e1b783d07f2cb78e24d08e328e5f040cf983;
    stim[42] = 184'hae53789c4e83aca9d5fe83cbff18d24d6f071ca4282fba;
    stim[43] = 184'h0517ad60871a07e1d5f9d1a53fda6b212a678694c17167;
    stim[44] = 184'he2e81f8a6e35046020c6e1008c8ec3d7a6eaab3dafa5d4;
    stim[45] = 184'h1580978e678f11f10b0b13c7d8771bc929f3d44ddfac18;
    stim[46] = 184'h09174c283042c90080c8a2600f46dcf596b119ecc1100a;
    stim[47] = 184'hc6f68e2362ec907e818ac28b180361f0541e0e91340f61;
    stim[48] = 184'hed236945a304c244a50961a646df54453a28a7574e5a65;
    stim[49] = 184'h2eead07a53a1f8b2dde1aa6077c669a95aa3d01bdc6d82;
    stim[50] = 184'h341fa53558414bd1904854348ccc47518a49b4df3a669a;
    stim[51] = 184'h77980d46be9a71a57c3c68022df80f0cb44504e922c09e;
    stim[52] = 184'h55ddd52f5adc9c063a487ce2ae37e454e089e27ac998f8;
    stim[53] = 184'h3d3d781368596dc8ee6abdd3c6c244bc0162f066343867;
    stim[54] = 184'he56364371b441cadd766f4c734e9f4acdfaee6a3835abd;
    stim[55] = 184'hf46101a95a5c9b349aab64fa814395e09a612bb18914a0;
    stim[56] = 184'h1b70c87067d931c0a8e20ebafb97d52d450f56f54441e4;
    stim[57] = 184'hbdca18f8eb6019b6ae7de2e1220bcd74f1393227aed327;
    stim[58] = 184'hecd453e60bfb14b6979bd8d050ed683e32b34c4f9a9cdb;
    stim[59] = 184'h9f018dce792df35719041239052838817ddec478f703b0;
    stim[60] = 184'h78f636c002a97d7c7521b8cc4dbbfc6ba8b3ea609c5016;
    stim[61] = 184'hd97da25614bcb8d15d824736f1fb520318d990aaae1df6;
    stim[62] = 184'hba9fa1e5a283350fe77307c08dd2cda1cfe67aa76e15db;
    stim[63] = 184'hf4ac9381e6b73b0b0459bfdfe3c6f3c1c787194568cc69;
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
      expv[0] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 166'hxxxxxxxxxxxxxxxxxxxxxx180a8022caf998d5ed07;
      expv[37] = 166'hxxxxxxxxxxxxxxxxxxxxxx180a8022caf998d5ed07;
      expv[38] = 166'hxxxxxxxxxxxxxxxxxxxxxx180a8022caf998d5ed07;
      expv[39] = 166'hxxxxxxxxxxxxxxxxxxxxxx180a8022caf998d5ed07;
      expv[40] = 166'hxxxxxxxxxxxxxxxxxxxxxx180a8022caf998d5ed07;
      expv[41] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 166'h2a7b1f787649a86ba0038xxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 166'h2a7b1f787649a86ba0038xxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 166'h2a7b1f787649a86ba0038xxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 166'h2610c0b5fa7a8465da78exxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 166'h2610c0b5fa7a8465da78exxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 166'hxxxxxxxxxxxxxxxxxxxxxx4f63ef0ec9350d740071;
      expv[60] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
