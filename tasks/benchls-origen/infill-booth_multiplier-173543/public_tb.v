// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_173543 dut (
    .clk(clk),
    .Unsigned(in_vec[65:65]),
    .mult_begin(in_vec[64:64]),
    .mult_op1(in_vec[63:32]),
    .mult_op2(in_vec[31:0]),
    .product(out_vec[64:1]),
    .mult_end(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h102535edbe25895dc;
    stim[1] = 66'h00faf84383d1229ea;
    stim[2] = 66'h2bd2d2ed34984e8ec;
    stim[3] = 66'h103298bd0643d4f19;
    stim[4] = 66'h2fef46d49c3bc1641;
    stim[5] = 66'h1ee20a88e3dd4aa57;
    stim[6] = 66'h36ca0e43cea7c1985;
    stim[7] = 66'h25ded03608f5bb9b5;
    stim[8] = 66'h2bc11acd9c430a4ee;
    stim[9] = 66'h2235289a53cfca1ea;
    stim[10] = 66'h0569eecf95d0a26c6;
    stim[11] = 66'h3b44895fdfb816c4f;
    stim[12] = 66'h3fa54f032753e5ce7;
    stim[13] = 66'h0fbea104ed712f935;
    stim[14] = 66'h0081648e6f4a28feb;
    stim[15] = 66'h28517e2ea265594d5;
    stim[16] = 66'h2ea6e75945a874af8;
    stim[17] = 66'h2920c4b673efaf989;
    stim[18] = 66'h2954e55d85c5df27f;
    stim[19] = 66'h340be773754648cf9;
    stim[20] = 66'h1c2f3109f592a733c;
    stim[21] = 66'h3e5a076f842b483d8;
    stim[22] = 66'h13d9f8b6eb5c1a716;
    stim[23] = 66'h38f420fdae2ff36a3;
    stim[24] = 66'h12dc332a53aa3b122;
    stim[25] = 66'h329554f793da842d8;
    stim[26] = 66'h37f1ec112132d5889;
    stim[27] = 66'h1960f6b2bf2a54a34;
    stim[28] = 66'h1ea35e133f1ae9eed;
    stim[29] = 66'h37c8e7628992d3482;
    stim[30] = 66'h3931602e7438ad14a;
    stim[31] = 66'h3234d2c5fbafec01b;
    stim[32] = 66'h32dd74909f89f482d;
    stim[33] = 66'h04dea759f13879424;
    stim[34] = 66'h3fd46fdf4dd92cd2c;
    stim[35] = 66'h3f59200ae48a70a74;
    stim[36] = 66'h1cae87b690c4c5abb;
    stim[37] = 66'h26ee3b921b9739718;
    stim[38] = 66'h07db1936874a2b245;
    stim[39] = 66'h266cc265609937cb3;
    stim[40] = 66'h2efea24b41dec00fc;
    stim[41] = 66'h159822a7185399fbb;
    stim[42] = 66'h1967f2edc5b14bfee;
    stim[43] = 66'h3c1fec94376c43fb3;
    stim[44] = 66'h389567ebbcd7ba945;
    stim[45] = 66'h236e567e80e0304ca;
    stim[46] = 66'h2d52017fc4aee4bf1;
    stim[47] = 66'h251d9c03c444a873b;
    stim[48] = 66'h392306402b4094743;
    stim[49] = 66'h1a2463879062df7e6;
    stim[50] = 66'h07ba8968b979b3039;
    stim[51] = 66'h15ee5df378cde65a9;
    stim[52] = 66'h272fa0077533421e8;
    stim[53] = 66'h3cce0a2ed5ae0dd5c;
    stim[54] = 66'h082129622e5bf2afc;
    stim[55] = 66'h091516f631cdfd0e9;
    stim[56] = 66'h2f73f23196bc9593d;
    stim[57] = 66'h18310cb7e56bea006;
    stim[58] = 66'h38094adfa360dd55f;
    stim[59] = 66'h240ae893c024f0c3f;
    stim[60] = 66'h369a99c8e7109c3c9;
    stim[61] = 66'h233e1190f381748bb;
    stim[62] = 66'h1fd34fa1114808d23;
    stim[63] = 66'h14407d343d69164bc;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000001;
      expv[3] = 65'h00000000000000001;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'hxxxxxxxxxxxxxxxxx;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'hxxxxxxxxxxxxxxxxx;
      expv[9] = 65'hxxxxxxxxxxxxxxxxx;
      expv[10] = 65'hxxxxxxxxxxxxxxxxx;
      expv[11] = 65'hxxxxxxxxxxxxxxxxx;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h0000000000000000a;
      expv[15] = 65'h00000000000000010;
      expv[16] = 65'h000000001a244aff8;
      expv[17] = 65'h000000002e6ce0fc8;
      expv[18] = 65'h000000002e6ce0fcc;
      expv[19] = 65'h000000003f8f38f0c;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h000000000469a58be;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h1fffffffffffffff2;
      expv[39] = 65'h1fffffffe29b7fd3a;
      expv[40] = 65'h1fffffffc7d27f7ca;
      expv[41] = 65'h1fffffffb2407ecea;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000183fd9286;
      expv[47] = 65'h0000000028bf8b792;
      expv[48] = 65'h0000000029bef01aa;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h1fffffffedb9f37fc;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h1ffffffff448c70f2;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000004;
      expv[56] = 65'h0000000017b977ce0;
      expv[57] = 65'h0000000017b977ce6;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000006;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000101295bf4;
      expv[63] = 65'h00000000000000000;
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
