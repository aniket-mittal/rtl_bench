// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006937 dut (
    .clk(clk),
    .rst(in_vec[85:85]),
    .din(in_vec[84:37]),
    .empty(in_vec[36:36]),
    .almost_empty(in_vec[35:35]),
    .full(in_vec[34:34]),
    .total(in_vec[33:2]),
    .ready(in_vec[1:1]),
    .finish_ack(in_vec[0:0]),
    .rd_en(out_vec[51:51]),
    .wr_en(out_vec[50:50]),
    .dout(out_vec[49:2]),
    .ack(out_vec[1:1]),
    .finish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h24568b1f835d001183d31f;
    stim[1] = 86'h23493ed43bdbba6f6a4688;
    stim[2] = 86'h10413437d7b2bcf48c99c2;
    stim[3] = 86'h08b6d51080a33dc1391a00;
    stim[4] = 86'h159cfebad2b2ab26160231;
    stim[5] = 86'h1bd0959fd8e3f9206e8a97;
    stim[6] = 86'h12951ec4370891a5d5d6e4;
    stim[7] = 86'h1ba99e51d1aab73bfd9c73;
    stim[8] = 86'h068e484959f32a96da3a9e;
    stim[9] = 86'h0404e2d63f9e72f04fb6f7;
    stim[10] = 86'h1eeca1f8e38bf49843d1a9;
    stim[11] = 86'h12242121a481ee8873bd73;
    stim[12] = 86'h1a00d9d883f4139b389e69;
    stim[13] = 86'h11e86f479b89c83b193b86;
    stim[14] = 86'h010c44441e976c48f5768a;
    stim[15] = 86'h10878d9c7be30d52f97910;
    stim[16] = 86'h0d18d53008110145dac4ce;
    stim[17] = 86'h107e70631fc45c5b410c6b;
    stim[18] = 86'h12fe30afb60621b3bff065;
    stim[19] = 86'h02ccb87e31d8dcea1c2215;
    stim[20] = 86'h0963ec636b0c7281cb763c;
    stim[21] = 86'h0b7b697abd62af7dfa79e4;
    stim[22] = 86'h0bfe4457a06c2786a706d7;
    stim[23] = 86'h06cfa4035e6ae60de7266e;
    stim[24] = 86'h03249b262e7cfbbd964fcf;
    stim[25] = 86'h0374afeef00b3762a10af7;
    stim[26] = 86'h0598e2f668aceb32afe390;
    stim[27] = 86'h025091a07f7c58fc21b810;
    stim[28] = 86'h04a7a3110d777d0e908879;
    stim[29] = 86'h1b86c1a05bf590d08d0bdc;
    stim[30] = 86'h020adca3ea35154e887e16;
    stim[31] = 86'h1443f4631c7eb60053912a;
    stim[32] = 86'h18ecb38623d008c4701eea;
    stim[33] = 86'h095b4a0dc49ceeb0463714;
    stim[34] = 86'h0cad427b14097939ed1e3d;
    stim[35] = 86'h0803e96757fc9d6fa354c1;
    stim[36] = 86'h0993885f263d584f2585ab;
    stim[37] = 86'h186b140b97c8b58b52ec77;
    stim[38] = 86'h13d178c8a9f805dd81618a;
    stim[39] = 86'h0a0dc47b57b9130c601ddf;
    stim[40] = 86'h1d7a9e6d500f69e3cab460;
    stim[41] = 86'h0246ec277856e513d45617;
    stim[42] = 86'h04a6dc3cf93819a21cfc9c;
    stim[43] = 86'h1689936918e25afe634667;
    stim[44] = 86'h1f4ccd4d76a8ac23980603;
    stim[45] = 86'h0da2024dc6e1d484268e4e;
    stim[46] = 86'h0296bbab2120047ed7b0f9;
    stim[47] = 86'h16dc866c44cc4b30b55b86;
    stim[48] = 86'h127bbc0da120246c9a272a;
    stim[49] = 86'h07cba460096611315e5e7c;
    stim[50] = 86'h00c7f600e5307d687aea78;
    stim[51] = 86'h1a698e33f275e6e281e251;
    stim[52] = 86'h089eb1a0a79a1a13aef6be;
    stim[53] = 86'h07af407b5ee5a29ecc2483;
    stim[54] = 86'h1fa48c63951f3a6683ed1f;
    stim[55] = 86'h113a4225cd6414de48aa6f;
    stim[56] = 86'h0f67fed4561399ae57e0be;
    stim[57] = 86'h02de779ea9d379b472c63d;
    stim[58] = 86'h10d641cab2b1901f4b7e10;
    stim[59] = 86'h0bec2afcd2deab76d7dcc4;
    stim[60] = 86'h0653e6681b4cbd688744a9;
    stim[61] = 86'h10d81e59702f076eab80bf;
    stim[62] = 86'h024a99d62a85b01ff91f43;
    stim[63] = 86'h19b66344d0c43edc6f64be;
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
      expv[0] = 52'h08ad163f06ba2;
      expv[1] = 52'h06927da877b74;
      expv[2] = 52'h2082686faf656;
      expv[3] = 52'h116daa2101464;
      expv[4] = 52'heb39fd75a5654;
      expv[5] = 52'h37a12b3fb1c7c;
      expv[6] = 52'h252a3d886e110;
      expv[7] = 52'h37533ca3a3554;
      expv[8] = 52'hcd1c9092b3e64;
      expv[9] = 52'h0809c5ac7f3cc;
      expv[10] = 52'h3dd943f1c717c;
      expv[11] = 52'h244842434903c;
      expv[12] = 52'h3401b3b107e80;
      expv[13] = 52'he3d0de8f37138;
      expv[14] = 52'h021888883d2ec;
      expv[15] = 52'h210f1b38f7c60;
      expv[16] = 52'hda31aa6010220;
      expv[17] = 52'h20fce0c63f888;
      expv[18] = 52'he5fc615f6c0c4;
      expv[19] = 52'h059970fc63b18;
      expv[20] = 52'h12c7d8c6d618c;
      expv[21] = 52'h16f6d2f57ac54;
      expv[22] = 52'h17fc88af40d84;
      expv[23] = 52'h0d9f4806bcd5c;
      expv[24] = 52'h0649364c5cf9c;
      expv[25] = 52'h06e95fdde0164;
      expv[26] = 52'hcb31c5ecd159c;
      expv[27] = 52'h04a12340fef88;
      expv[28] = 52'h094f46221aeec;
      expv[29] = 52'h370d8340b7eb0;
      expv[30] = 52'h0415b947d46a0;
      expv[31] = 52'h2887e8c638fd4;
      expv[32] = 52'hf1d9670c47a00;
      expv[33] = 52'h12b6941b8939c;
      expv[34] = 52'h195a84f62812c;
      expv[35] = 52'h1007d2ceaff90;
      expv[36] = 52'h132710be4c7a8;
      expv[37] = 52'h30d628172f914;
      expv[38] = 52'h27a2f19153f00;
      expv[39] = 52'h141b88f6af720;
      expv[40] = 52'hfaf53cdaa01ec;
      expv[41] = 52'h048dd84ef0adc;
      expv[42] = 52'h094db879f2700;
      expv[43] = 52'h2d1326d231c48;
      expv[44] = 52'h3e999a9aed514;
      expv[45] = 52'h1b44049b8dc38;
      expv[46] = 52'h052d775642400;
      expv[47] = 52'hedb90cd889988;
      expv[48] = 52'h24f7781b42404;
      expv[49] = 52'h0f9748c012cc0;
      expv[50] = 52'h018fec01ca60c;
      expv[51] = 52'h34d31c67e4ebc;
      expv[52] = 52'h113d63414f340;
      expv[53] = 52'hcf5e80f6bdcb4;
      expv[54] = 52'h3f4918c72a3e4;
      expv[55] = 52'h2274844b9ac80;
      expv[56] = 52'h1ecffda8ac270;
      expv[57] = 52'h05bcef3d53a6c;
      expv[58] = 52'h21ac839565630;
      expv[59] = 52'hd7d855f9a5bd4;
      expv[60] = 52'h0ca7ccd036994;
      expv[61] = 52'h21b03cb2e05e0;
      expv[62] = 52'h049533ac550b4;
      expv[63] = 52'h336cc689a1884;
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
