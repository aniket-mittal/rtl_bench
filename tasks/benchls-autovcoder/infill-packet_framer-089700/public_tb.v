// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 85;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089700 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .clear(in_vec[29:29]),
    .frames_per_packet(in_vec[28:21]),
    .data_i(in_vec[20:2]),
    .src_rdy_i(in_vec[1:1]),
    .dst_rdy_i(in_vec[0:0]),
    .dst_rdy_o(out_vec[84:84]),
    .data_o(out_vec[83:65]),
    .src_rdy_o(out_vec[64:64]),
    .debug0(out_vec[63:32]),
    .debug1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h5b96fedd;
    stim[1] = 31'h69cbcb5d;
    stim[2] = 31'h2e8f6a0f;
    stim[3] = 31'h06c31d40;
    stim[4] = 31'h1d2c3411;
    stim[5] = 31'h0e5c0d40;
    stim[6] = 31'h057447b3;
    stim[7] = 31'h1e99624a;
    stim[8] = 31'h34f9444f;
    stim[9] = 31'h3ffddf05;
    stim[10] = 31'h110ed475;
    stim[11] = 31'h0bd6ed7e;
    stim[12] = 31'h07a066a7;
    stim[13] = 31'h00294208;
    stim[14] = 31'h055b482d;
    stim[15] = 31'h08907704;
    stim[16] = 31'h2d9c5b82;
    stim[17] = 31'h320ef5b8;
    stim[18] = 31'h200c9740;
    stim[19] = 31'h348bd6be;
    stim[20] = 31'h640e1add;
    stim[21] = 31'h38923458;
    stim[22] = 31'h1fffae4c;
    stim[23] = 31'h07966f2b;
    stim[24] = 31'h1d4e7cc9;
    stim[25] = 31'h3e2bbf6f;
    stim[26] = 31'h08fab8f2;
    stim[27] = 31'h3e9a7dc6;
    stim[28] = 31'h318030bd;
    stim[29] = 31'h1fbc0b03;
    stim[30] = 31'h208b353b;
    stim[31] = 31'h05da533c;
    stim[32] = 31'h20d95151;
    stim[33] = 31'h208f34f6;
    stim[34] = 31'h169956e9;
    stim[35] = 31'h09884784;
    stim[36] = 31'h293eff45;
    stim[37] = 31'h212b2b53;
    stim[38] = 31'h15f1e5d7;
    stim[39] = 31'h08455335;
    stim[40] = 31'h18715fc7;
    stim[41] = 31'h18a12739;
    stim[42] = 31'h2fa9fbf3;
    stim[43] = 31'h365ac780;
    stim[44] = 31'h0ce83934;
    stim[45] = 31'h07763950;
    stim[46] = 31'h33f8ca45;
    stim[47] = 31'h0806f98b;
    stim[48] = 31'h3ada0144;
    stim[49] = 31'h1c0b938f;
    stim[50] = 31'h2ddc84b1;
    stim[51] = 31'h2dd488fb;
    stim[52] = 31'h3bb8b5de;
    stim[53] = 31'h1c2c6e47;
    stim[54] = 31'h3532a3b0;
    stim[55] = 31'h1d0cb12c;
    stim[56] = 31'h656c65ed;
    stim[57] = 31'h29943b7d;
    stim[58] = 31'h302a5182;
    stim[59] = 31'h17b9e007;
    stim[60] = 31'h20d6fa79;
    stim[61] = 31'h3cc02854;
    stim[62] = 31'h386c02e4;
    stim[63] = 31'h37488ca6;
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
      expv[0] = 85'hxx7f6x00xxxxdcxxxxxxxx;
      expv[1] = 85'h13e5ae0088004exxxxxxxx;
      expv[2] = 85'h13b50700c80074xxxxxxxx;
      expv[3] = 85'h038ea000080036xxxxxxxx;
      expv[4] = 85'h121a08008800e9xxxxxxxx;
      expv[5] = 85'h0206a000080072xxxxxxxx;
      expv[6] = 85'h1223d900c8002bxxxxxxxx;
      expv[7] = 85'h00b125004101f423d80100;
      expv[8] = 85'h10a22700c101a723d80100;
      expv[9] = 85'h12ef82008800ff23d80100;
      expv[10] = 85'h136a3a0088008823d80100;
      expv[11] = 85'h0376bf0048005e23d80100;
      expv[12] = 85'h12335300c8003d23d80100;
      expv[13] = 85'h00a1040001010133520100;
      expv[14] = 85'h11a4160081012a33520100;
      expv[15] = 85'h003b820001014433520100;
      expv[16] = 85'h002dc10041016c33520100;
      expv[17] = 85'h037adc0008009033520100;
      expv[18] = 85'h024ba00008000033520100;
      expv[19] = 85'h03eb5f004800a433520100;
      expv[20] = 85'h130d6e0088002033520100;
      expv[21] = 85'h031a2c000800c433520100;
      expv[22] = 85'h03d726000800ff33520100;
      expv[23] = 85'h13379500c8003c33520100;
      expv[24] = 85'h113e64008101ea37940100;
      expv[25] = 85'h11dfb700c101f137940100;
      expv[26] = 85'h035c790048004737940100;
      expv[27] = 85'h033ee3004800f437940100;
      expv[28] = 85'h12185e0088008c37940100;
      expv[29] = 85'h12058100c800fd37940100;
      expv[30] = 85'h119a9d00c1010405800100;
      expv[31] = 85'h03299e0008002e05800100;
      expv[32] = 85'h12a8a80088000605800100;
      expv[33] = 85'h039a7b0048000405800100;
      expv[34] = 85'h12ab74008800b405800100;
      expv[35] = 85'h0223c20008004c05800100;
      expv[36] = 85'h137fa20088004905800100;
      expv[37] = 85'h1395a900c8000905800100;
      expv[38] = 85'h12f2eb00c800af05800100;
      expv[39] = 85'h10a99a00810142f2ea0100;
      expv[40] = 85'h10afe300c101c3f2ea0100;
      expv[41] = 85'h10939c008101c5f2e900ff;
      expv[42] = 85'h10fdf900c1017df2e900ff;
      expv[43] = 85'h0363c0000800b2f2e900ff;
      expv[44] = 85'h021c9a00080067f2e900ff;
      expv[45] = 85'h031ca80008003bf2e900ff;
      expv[46] = 85'h1265220088009ff2e900ff;
      expv[47] = 85'h137cc500c80040f2e900ff;
      expv[48] = 85'h0100a2000101d67cc40100;
      expv[49] = 85'h13c9c700c800e07cc40100;
      expv[50] = 85'h1042580081016ec9c60100;
      expv[51] = 85'h12447d00c8006ec9c60100;
      expv[52] = 85'h025aef004800ddc9c60100;
      expv[53] = 85'h12372300c800e1c9c60100;
      expv[54] = 85'h0151d8000101a937220100;
      expv[55] = 85'h025896000800e837220100;
      expv[56] = 85'h1232f60088002b37220100;
      expv[57] = 85'h121dbe0088004c37220100;
      expv[58] = 85'h0328c10048008137220100;
      expv[59] = 85'h12f00300c800bd37220100;
      expv[60] = 85'h117d3c00810106f0020100;
      expv[61] = 85'h02142a000800e6f0020100;
      expv[62] = 85'h020172000800c3f0020100;
      expv[63] = 85'h024653004800baf0020100;
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
