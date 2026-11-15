// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075629 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[102:102]),
    .req(in_vec[101:101]),
    .tuple(in_vec[100:5]),
    .cmd_fwd_port(in_vec[4:1]),
    .cmd_mode(in_vec[0:0]),
    .ack(out_vec[4:4]),
    .fwd_port(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h684df7188e1c2826ffa6542320;
    stim[1] = 103'h4fe3c7c1ad983bc252f60d3312;
    stim[2] = 103'h269fe7100fa14581b583f886f2;
    stim[3] = 103'h09013b7a52fc3070cca0a2daa8;
    stim[4] = 103'h1a5ec7d8af6d60bd911210b863;
    stim[5] = 103'h1c1d738f56aa56559fb9584ab4;
    stim[6] = 103'h1dfb9f3a13cbd288f5729bf2be;
    stim[7] = 103'h2c86b1ab5db1f9a96d150b1245;
    stim[8] = 103'h2e5c7f66660f2918c5f741ab7a;
    stim[9] = 103'h102b51e8a4f39d7034279fe62c;
    stim[10] = 103'h2485ce8befb12a1a5e8ac67489;
    stim[11] = 103'h1128cc1c66d4579a83f2db3152;
    stim[12] = 103'h3322f5c6ddc1414f2345b313f9;
    stim[13] = 103'h3927e555de759c1cf31c6efe8d;
    stim[14] = 103'h37096489dc0c97ead9db250a45;
    stim[15] = 103'h2e877f8d03bf02e8a3ff5e015a;
    stim[16] = 103'h20e53111a9b88faa6cfb83c58e;
    stim[17] = 103'h121fe4572823d5b099eff426fb;
    stim[18] = 103'h3397b38bdf991e53d746626519;
    stim[19] = 103'h33b6635011070481f251fcb73e;
    stim[20] = 103'h3ae77da7fc9f14ed9cb34ed7db;
    stim[21] = 103'h1a219790579a341ebafe768e31;
    stim[22] = 103'h2c7266c57177d3e0a4cfdf74d6;
    stim[23] = 103'h4d0e1c94c6711175b14d7c9de2;
    stim[24] = 103'h2cc89d984b1058c70219549f37;
    stim[25] = 103'h16133e70edc116af54c96be448;
    stim[26] = 103'h21dff5611b7870a8364be3d593;
    stim[27] = 103'h0a8b05f870a28484bffdc7675e;
    stim[28] = 103'h376bcbcd44b32bd93ebed11e4b;
    stim[29] = 103'h3e1c15c57b3075900a43ad5550;
    stim[30] = 103'h0afc1e4f9c1757e329755caa7f;
    stim[31] = 103'h3ef646dd3a0371ba502e3693d0;
    stim[32] = 103'h46c4a6b3b9649d445142ce1b1e;
    stim[33] = 103'h02da1ec4db4df246fe7182dcbc;
    stim[34] = 103'h1e66b00fe237074cd4379f3512;
    stim[35] = 103'h3f8b6415975f07a0df60c877ff;
    stim[36] = 103'h29bb4412b7e9f2881d9ba6ddc7;
    stim[37] = 103'h251cbbaf468630b4be590932ca;
    stim[38] = 103'h0eb8f398fcb71c72c8b0630b00;
    stim[39] = 103'h3c3d83c22310b7806f79ed0107;
    stim[40] = 103'h0ee092557c46cac59c9f9d6375;
    stim[41] = 103'h2204a25a3b75fed254bda220f6;
    stim[42] = 103'h328eedff3248acc1369b4ea284;
    stim[43] = 103'h2b5083057bfec512523384efd0;
    stim[44] = 103'h02b248a10e67631c7d360e588f;
    stim[45] = 103'h2017bbedf8fc90cb8c4b0a29cc;
    stim[46] = 103'h0dcf15553522729f3aa3680c04;
    stim[47] = 103'h38494a860e43a7a890677f577e;
    stim[48] = 103'h000e383af0489885ddca35aed4;
    stim[49] = 103'h1dba5448530d63c3c49648c10f;
    stim[50] = 103'h0080a86ad95bd43704e7aff641;
    stim[51] = 103'h10e286f38314836f0acf6dd99a;
    stim[52] = 103'h0b41668acb9810525ae3cab63f;
    stim[53] = 103'h32a04c88273b193bdbed9fb0e3;
    stim[54] = 103'h37e9fd4e9d793616f5abbd0801;
    stim[55] = 103'h37f4476613520d5d35e7989782;
    stim[56] = 103'h2bf600beef65ba8c6ab17b5ce5;
    stim[57] = 103'h31063a9e309639459c24957d33;
    stim[58] = 103'h31fdc3c49a917fe95895e390e7;
    stim[59] = 103'h3a393cbedd750b3df1c62d8011;
    stim[60] = 103'h0656484141eba03ef1144588c4;
    stim[61] = 103'h201b826287f2eec1cd4805774f;
    stim[62] = 103'h03b3489f1b433c60ed2e2e50b9;
    stim[63] = 103'h2b9871ac659951d1ac753b4731;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h19;
      expv[4] = 5'h09;
      expv[5] = 5'h09;
      expv[6] = 5'h09;
      expv[7] = 5'h09;
      expv[8] = 5'h10;
      expv[9] = 5'h1d;
      expv[10] = 5'h0d;
      expv[11] = 5'h10;
      expv[12] = 5'h00;
      expv[13] = 5'h10;
      expv[14] = 5'h10;
      expv[15] = 5'h10;
      expv[16] = 5'h1d;
      expv[17] = 5'h17;
      expv[18] = 5'h07;
      expv[19] = 5'h10;
      expv[20] = 5'h1f;
      expv[21] = 5'h10;
      expv[22] = 5'h00;
      expv[23] = 5'h1b;
      expv[24] = 5'h00;
      expv[25] = 5'h10;
      expv[26] = 5'h00;
      expv[27] = 5'h10;
      expv[28] = 5'h00;
      expv[29] = 5'h10;
      expv[30] = 5'h18;
      expv[31] = 5'h08;
      expv[32] = 5'h18;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h10;
      expv[37] = 5'h10;
      expv[38] = 5'h15;
      expv[39] = 5'h05;
      expv[40] = 5'h10;
      expv[41] = 5'h00;
      expv[42] = 5'h1b;
      expv[43] = 5'h12;
      expv[44] = 5'h18;
      expv[45] = 5'h08;
      expv[46] = 5'h16;
      expv[47] = 5'h06;
      expv[48] = 5'h1f;
      expv[49] = 5'h0f;
      expv[50] = 5'h0f;
      expv[51] = 5'h0f;
      expv[52] = 5'h0f;
      expv[53] = 5'h0f;
      expv[54] = 5'h10;
      expv[55] = 5'h10;
      expv[56] = 5'h11;
      expv[57] = 5'h10;
      expv[58] = 5'h10;
      expv[59] = 5'h10;
      expv[60] = 5'h10;
      expv[61] = 5'h00;
      expv[62] = 5'h10;
      expv[63] = 5'h00;
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
