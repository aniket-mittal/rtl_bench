// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035296 dut (
    .in1(in_vec[133:70]),
    .in2(in_vec[69:6]),
    .enable(in_vec[5:5]),
    .unit(in_vec[4:2]),
    .op(in_vec[1:0]),
    .out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h2d3fd355fdb582ca582674e6dbe3d2fa15;
    stim[1] = 134'h02bec994a86b8d1752f26c3f944e116fab;
    stim[2] = 134'h32a13e7bef9e6965d50d4ca74e8412c610;
    stim[3] = 134'h28e7caa1d2dd9fb51df61ba2d77665b014;
    stim[4] = 134'h204d0b512cd2cca286fc5cbba4b97d919f;
    stim[5] = 134'h1bb131c4bb0411f0fffb228fb674aa968c;
    stim[6] = 134'h208e4479b8b85354c092f3390773be8f52;
    stim[7] = 134'h22800f7ecd562d78ae5f9941a82af1d038;
    stim[8] = 134'h28921a8bfffe6f4dce4855f8f18cfbc08d;
    stim[9] = 134'h1193fc0e55bdeadb6c1211e774e725adeb;
    stim[10] = 134'h2b4b0d18248e47bcaea8ac7bdfcc1b19bd;
    stim[11] = 134'h2ab9eab555d9458b5f1b25e7f17ffd8315;
    stim[12] = 134'h13ac9ff2fe32fc25d2110d650b8ede476e;
    stim[13] = 134'h25e583da0bd16a21857dbfe7d5835ffe9b;
    stim[14] = 134'h04d8d93833c5b45c61af05eb73c63ce743;
    stim[15] = 134'h273e6d69c9aee706fd3ba0af788c7f823c;
    stim[16] = 134'h356345d6aa02042dd8c0653a45ecef0b24;
    stim[17] = 134'h3bd4c3c16e946bf9e0b9dfb9ee5ad8339b;
    stim[18] = 134'h3bb7c8e0be7a48c52082aec076465b83ec;
    stim[19] = 134'h0bb7e73d3f164ddff360f6c184dde2ce85;
    stim[20] = 134'h22b3ff3568e4e657f063dd1cb76e94d212;
    stim[21] = 134'h0d63d9cf624ecd1baeb58a7eff4416e6e9;
    stim[22] = 134'h25be7d2d8ea0618151c7ff403000919755;
    stim[23] = 134'h1ac623c82f5038f382bf26c302175c031f;
    stim[24] = 134'h1df27df92c2c879cb6175c93fedd49a788;
    stim[25] = 134'h34ecf2dc9dbc13db905d247afeb861b784;
    stim[26] = 134'h37e8d90d803928f13c16f8c397a2d35ea7;
    stim[27] = 134'h0e610170c7a2df4fde35c959635d3307e8;
    stim[28] = 134'h0795974a4a018e329971e46cf1a17654a9;
    stim[29] = 134'h2d0ef642ac0d6c664a1e5773975e58e3d1;
    stim[30] = 134'h2e57af25a933b25fd37a02f0df2d97ffc4;
    stim[31] = 134'h11eafb28315a84436b3105815d08762e74;
    stim[32] = 134'h059c2697c2ba237471084f69794934cf25;
    stim[33] = 134'h0c8be378f7b042194ec0fffd120713c694;
    stim[34] = 134'h0a496735cd37b664ae4dd53f52d883aea3;
    stim[35] = 134'h3a9a2ceb649b1ed4b49b48425e2b67d607;
    stim[36] = 134'h0d7ba78fd0ccbb4e2c59afcbc88554371c;
    stim[37] = 134'h1f557105dd551ccad19f533dfa55b551e9;
    stim[38] = 134'h20836ba3ffaf6fd75db110bfada104b338;
    stim[39] = 134'h004416edd38cbc50eb5e15c7a7e3f30a7d;
    stim[40] = 134'h02b505e4c79668295eba8bd6226d5d5167;
    stim[41] = 134'h3bc6df65aa32af9f8a340248a1b9d20a45;
    stim[42] = 134'h01a6482d139fb8ced156fd788c22c65979;
    stim[43] = 134'h2f4624e2c335d920a43fb04ee880d8ec2b;
    stim[44] = 134'h09df48f7a96b2f4b13f71fa575ad0e57c6;
    stim[45] = 134'h07aca3ca7816738eb337f8bccbbbdeab27;
    stim[46] = 134'h3162bf61584d706c61d4183154619fdced;
    stim[47] = 134'h2d0a0e6f4ed3ee6d40cf490178dac1acd8;
    stim[48] = 134'h00a6bd7d5f75821c8839f3d74e218dbb91;
    stim[49] = 134'h37d6a15d34d536efdfd803cee63cef3983;
    stim[50] = 134'h1de65dca237ea18e8498d46a8c39d87024;
    stim[51] = 134'h2dd5b076b8bbcd52896981f175566f699f;
    stim[52] = 134'h292e842ba7015a0b33d1dc34294d158799;
    stim[53] = 134'h1ee8f26d057af5d07603c5b7a723871448;
    stim[54] = 134'h3b0ca0d11ed0026af84012a771ab2ab00c;
    stim[55] = 134'h3800e6865ed05299ef8fb310a4db76c0eb;
    stim[56] = 134'h05db185c15ae5bc9765733713c38c26f0e;
    stim[57] = 134'h02a879469ef4a47b4aa04be4051de4dc9b;
    stim[58] = 134'h2d2c2ea4dda2a88615339ef1f41a96340f;
    stim[59] = 134'h0f72a8a5cfd64ac0874ab9e956d497c1d4;
    stim[60] = 134'h041ef4317808a6748def82fd56ef08e1db;
    stim[61] = 134'h3c70347963a13ce68bb02d6df286df5f2d;
    stim[62] = 134'h10a506ec93c14f22def7bb540602020964;
    stim[63] = 134'h16691f60183bda1cacbe71bb1c036d9ceb;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h4ef67fdffefbf99f;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000001;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h820a2300d9092204;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000001;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h6fee47d9e97ccad8;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000001;
      expv[63] = 64'h0000000000000000;
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
