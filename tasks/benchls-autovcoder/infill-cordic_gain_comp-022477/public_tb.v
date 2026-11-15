// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022477 dut (
    .clk(clk),
    .x(in_vec[100:69]),
    .y(in_vec[68:37]),
    .z(in_vec[36:5]),
    .rst_n(in_vec[4:4]),
    .mode(in_vec[3:3]),
    .en(in_vec[2:2]),
    .phase(in_vec[1:0]),
    .done(out_vec[97:97]),
    .mode_out(out_vec[96:96]),
    .xt(out_vec[95:64]),
    .yt(out_vec[63:32]),
    .zt(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h0bbf28afead797f57562700264;
    stim[1] = 101'h08c00ab48ee380cf1fdd3e910f;
    stim[2] = 101'h0c21e378e3637a3ee7e5c67e3e;
    stim[3] = 101'h1d75b9ea4c7cf43cc9d0b853fb;
    stim[4] = 101'h19be49c790b42f41838928d2da;
    stim[5] = 101'h048f6aee60380e032b0edf2992;
    stim[6] = 101'h127870f85fbada4bce310897d8;
    stim[7] = 101'h08ed23c84455502052ed5ee813;
    stim[8] = 101'h18ac6995f6e9b9ae50f17aef67;
    stim[9] = 101'h0bdeca7b858356f3392c4ef6ff;
    stim[10] = 101'h01edf7d696366e9152cd0dd69b;
    stim[11] = 101'h16db7839240b8946e31476bf19;
    stim[12] = 101'h108bb87415668d5c90a9617554;
    stim[13] = 101'h1fdf8a0279d7f25c82f1167858;
    stim[14] = 101'h05bbb40c8294961cb1e7b1035c;
    stim[15] = 101'h11ceed7882a3f1e170e55be2d6;
    stim[16] = 101'h0150d6e531097d3887c9ad8533;
    stim[17] = 101'h0995fcc8eb5d2ec9b8023668ba;
    stim[18] = 101'h11f41941a8182c4623fe8f1bd7;
    stim[19] = 101'h1bf1371f534bf3437bea27b3b1;
    stim[20] = 101'h0c7932302451ea6e3645fc38ba;
    stim[21] = 101'h09d681e39a74c74cd9250eb3d4;
    stim[22] = 101'h0b25e3b1b88f5f9f78b65ec057;
    stim[23] = 101'h1d3851cf1d75cbf329a5c9aa34;
    stim[24] = 101'h0d37571b94d671dc38722c985d;
    stim[25] = 101'h0297d45618fb6c1474dfe503db;
    stim[26] = 101'h0fc34588b4ddc1996cc5f240f1;
    stim[27] = 101'h11198a8f186a2f3353034e0136;
    stim[28] = 101'h041a70f6f3fe5c4e7384961794;
    stim[29] = 101'h0ad0e1c9d10d01c51c8852ac39;
    stim[30] = 101'h021a7533fd2fe20acb2775fd95;
    stim[31] = 101'h116d40422bfe7c58b36d4553da;
    stim[32] = 101'h11f195541e89029bb33fb24c70;
    stim[33] = 101'h1cf14c8564d8a94f56d3654596;
    stim[34] = 101'h13be096a16e189e9b99d4464fb;
    stim[35] = 101'h108988a80dd108ac00345cf911;
    stim[36] = 101'h19f7f5feda97596c43a87d78fe;
    stim[37] = 101'h032733d5aa9dbd6a26a78ecb50;
    stim[38] = 101'h067508b6bb7cab47fb596fb73c;
    stim[39] = 101'h11ffd9a7763f375fed95da01b9;
    stim[40] = 101'h05b5484776846ea94ae92ca17a;
    stim[41] = 101'h169fe7573f4558890d81b75b34;
    stim[42] = 101'h0f6947a805fbed1849d7e43ebd;
    stim[43] = 101'h0ebb8afd8631ac7dd7c9de195f;
    stim[44] = 101'h132fd9794e14d388da30ccbfd7;
    stim[45] = 101'h195c34b5189a3ff531ac21d371;
    stim[46] = 101'h036bad13d7cc0b3df7ca75f233;
    stim[47] = 101'h04bc992d4822abcbe746252335;
    stim[48] = 101'h1e3360cf1b936be713ea789cb0;
    stim[49] = 101'h08f408cfa80c9bf585cf8c14db;
    stim[50] = 101'h12f8c03b1d6a2c1d04f6418996;
    stim[51] = 101'h05c0e3a7195d9bdbfcb6166a7c;
    stim[52] = 101'h17479b5a9ee9c80d525a79fd75;
    stim[53] = 101'h033900b1555c19fa2e6a589894;
    stim[54] = 101'h175a019e64da9c44c7a4f2793a;
    stim[55] = 101'h0f6d475ba8a99cc937b004f037;
    stim[56] = 101'h0f604348cbd146f1460e44da7b;
    stim[57] = 101'h155fb1a465345e5897035a9079;
    stim[58] = 101'h0d58a42df6652d3501ee4894fb;
    stim[59] = 101'h1b76f8bfc89ba10711986738bc;
    stim[60] = 101'h08101055266aca84b0cf0c9d46;
    stim[61] = 101'h157aee6600bf07e412a990f130;
    stim[62] = 101'h11c8007434995aa3a4d23179ba;
    stim[63] = 101'h051dab85434d22665215110fbd;
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
      expv[3] = 98'h33af020a5107620b73f2e33f1;
      expv[4] = 98'h0000000000000000000000000;
      expv[5] = 98'h0000000000000000000000000;
      expv[6] = 98'h0000000000000000000000000;
      expv[7] = 98'h0000000000000000000000000;
      expv[8] = 98'h0000000000000000000000000;
      expv[9] = 98'h0000000000000000000000000;
      expv[10] = 98'h339aa2c5f1ac8293fc96277b7;
      expv[11] = 98'h0000000000000000000000000;
      expv[12] = 98'h0000000000000000000000000;
      expv[13] = 98'h2b4ecbfeccc825074854b0baa;
      expv[14] = 98'h0000000000000000000000000;
      expv[15] = 98'h31bd9f8870c8911b78f3d881a;
      expv[16] = 98'h2bb0edc580cd3ade4787b20ea;
      expv[17] = 98'h0000000000000000000000000;
      expv[18] = 98'h0000000000000000000000000;
      expv[19] = 98'h2bbc36f2e27526e111ff478de;
      expv[20] = 98'h0000000000000000000000000;
      expv[21] = 98'h0000000000000000000000000;
      expv[22] = 98'h22fcaaeb8e5118caac928759e;
      expv[23] = 98'h23627f039dbdb7ee0c5b2f602;
      expv[24] = 98'h2f27eb866f3a95edf4d2e4d51;
      expv[25] = 98'h34033f684c9c640dac39164c2;
      expv[26] = 98'h0000000000000000000000000;
      expv[27] = 98'h0000000000000000000000000;
      expv[28] = 98'h2b79db3b7db26d587678b8ff7;
      expv[29] = 98'h213eef300c5ac89269c24b0bc;
      expv[30] = 98'h0000000000000000000000000;
      expv[31] = 98'h20a37c797f255bc75a71e5014;
      expv[32] = 98'h0000000000000000000000000;
      expv[33] = 98'h0000000000000000000000000;
      expv[34] = 98'h2f125b558178b0579490ad5d4;
      expv[35] = 98'h0000000000000000000000000;
      expv[36] = 98'h0000000000000000000000000;
      expv[37] = 98'h3e2b3325fe5b97dc51d43ebc7;
      expv[38] = 98'h0000000000000000000000000;
      expv[39] = 98'h31f5e4a70ea13818cdacb7db9;
      expv[40] = 98'h0000000000000000000000000;
      expv[41] = 98'h0000000000000000000000000;
      expv[42] = 98'h2d2748c2ffc7540366c0dbad9;
      expv[43] = 98'h34addd0b61d11f5a64ebf21f5;
      expv[44] = 98'h34791d10e1e170f8dbe4ef0ca;
      expv[45] = 98'h2c1c152d34467ec1ad18665fe;
      expv[46] = 98'h0000000000000000000000000;
      expv[47] = 98'h0000000000000000000000000;
      expv[48] = 98'h21702b19b27856dccc628d6e7;
      expv[49] = 98'h0000000000000000000000000;
      expv[50] = 98'h0000000000000000000000000;
      expv[51] = 98'h2c0b5a8d3f370e689d7f3f3b4;
      expv[52] = 98'h31bf329e6dfc55e3fe5b0b353;
      expv[53] = 98'h2d5a33c0dfab870736d863015;
      expv[54] = 98'h20fa7c9facc4f8bac7352c4c4;
      expv[55] = 98'h0000000000000000000000000;
      expv[56] = 98'h24af13dc02a14f642bd802781;
      expv[57] = 98'h0000000000000000000000000;
      expv[58] = 98'h0000000000000000000000000;
      expv[59] = 98'h0000000000000000000000000;
      expv[60] = 98'h0000000000000000000000000;
      expv[61] = 98'h0000000000000000000000000;
      expv[62] = 98'h0000000000000000000000000;
      expv[63] = 98'h0000000000000000000000000;
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
