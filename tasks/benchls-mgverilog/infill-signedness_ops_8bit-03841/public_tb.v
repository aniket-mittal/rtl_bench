// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 304;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03841 dut (
    .sel(in_vec[22:22]),
    .a(in_vec[21:14]),
    .b(in_vec[13:6]),
    .c(in_vec[5:0]),
    .mux_uu(out_vec[303:288]),
    .mux_us(out_vec[287:272]),
    .mux_su(out_vec[271:256]),
    .mux_ss(out_vec[255:240]),
    .eql_uu(out_vec[239:239]),
    .eql_us(out_vec[238:238]),
    .eql_su(out_vec[237:237]),
    .eql_ss(out_vec[236:236]),
    .neq_uu(out_vec[235:235]),
    .neq_us(out_vec[234:234]),
    .neq_su(out_vec[233:233]),
    .neq_ss(out_vec[232:232]),
    .sgn_u(out_vec[231:216]),
    .sgn_s(out_vec[215:200]),
    .add_uu(out_vec[199:184]),
    .add_us(out_vec[183:168]),
    .add_su(out_vec[167:152]),
    .add_ss(out_vec[151:136]),
    .sub_uu(out_vec[135:120]),
    .sub_us(out_vec[119:104]),
    .sub_su(out_vec[103:88]),
    .sub_ss(out_vec[87:72]),
    .mul_uu(out_vec[71:56]),
    .mul_us(out_vec[55:40]),
    .mul_su(out_vec[39:24]),
    .mul_ss(out_vec[23:8]),
    .ltn_uu(out_vec[7:7]),
    .ltn_us(out_vec[6:6]),
    .ltn_su(out_vec[5:5]),
    .ltn_ss(out_vec[4:4]),
    .leq_uu(out_vec[3:3]),
    .leq_us(out_vec[2:2]),
    .leq_su(out_vec[1:1]),
    .leq_ss(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h604853;
    stim[1] = 23'h4c92a1;
    stim[2] = 23'h266d1b;
    stim[3] = 23'h3427a5;
    stim[4] = 23'h10228b;
    stim[5] = 23'h422cd7;
    stim[6] = 23'h63e20d;
    stim[7] = 23'h5a3fc6;
    stim[8] = 23'h0c5ac4;
    stim[9] = 23'h37e36f;
    stim[10] = 23'h153699;
    stim[11] = 23'h2b18cf;
    stim[12] = 23'h391f69;
    stim[13] = 23'h797417;
    stim[14] = 23'h67ff9c;
    stim[15] = 23'h531849;
    stim[16] = 23'h02c840;
    stim[17] = 23'h00662d;
    stim[18] = 23'h275b95;
    stim[19] = 23'h2ae6ab;
    stim[20] = 23'h00b975;
    stim[21] = 23'h2e7b79;
    stim[22] = 23'h15a9e4;
    stim[23] = 23'h746676;
    stim[24] = 23'h460d30;
    stim[25] = 23'h214346;
    stim[26] = 23'h304bb2;
    stim[27] = 23'h12f0f1;
    stim[28] = 23'h0d5253;
    stim[29] = 23'h5cd91d;
    stim[30] = 23'h2d3e69;
    stim[31] = 23'h73b4c6;
    stim[32] = 23'h471a71;
    stim[33] = 23'h6b2e88;
    stim[34] = 23'h0967b7;
    stim[35] = 23'h66c6ed;
    stim[36] = 23'h3f77de;
    stim[37] = 23'h22a08b;
    stim[38] = 23'h34df75;
    stim[39] = 23'h6d1fa3;
    stim[40] = 23'h2de45f;
    stim[41] = 23'h2ad2b0;
    stim[42] = 23'h395e7a;
    stim[43] = 23'h77d0cc;
    stim[44] = 23'h4d5537;
    stim[45] = 23'h0af68a;
    stim[46] = 23'h203c4d;
    stim[47] = 23'h16179d;
    stim[48] = 23'h01a459;
    stim[49] = 23'h5e1376;
    stim[50] = 23'h45e9fa;
    stim[51] = 23'h2bc141;
    stim[52] = 23'h74a3e6;
    stim[53] = 23'h44b057;
    stim[54] = 23'h4dc4f6;
    stim[55] = 23'h4bf839;
    stim[56] = 23'h2fd7f8;
    stim[57] = 23'h7e2305;
    stim[58] = 23'h3ae16c;
    stim[59] = 23'h7c2c8c;
    stim[60] = 23'h0e8328;
    stim[61] = 23'h571c99;
    stim[62] = 23'h13ae63;
    stim[63] = 23'h2c4ac6;
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
      expv[0] = 304'h008100810081ff810fffecffec009400940094ff94006e006e006eff6e099309930993f69311;
      expv[1] = 304'h00320032003200320fffde001e00530053005300130011001100110051067206720672f9f200;
      expv[2] = 304'h00b400b400b4ffb40fffe4ffe400b400b400b4ffb4007e007e007eff7e102310231023f52311;
      expv[3] = 304'h009e009e009eff9e0fffda001a00f500f500f5ffb500ab00ab00abffeb1e101e101e10051011;
      expv[4] = 304'h008a008a008aff8a0ffff4fff4004b004b004b004b003500350035003502c002c002c002c000;
      expv[5] = 304'h00080008000800080fffe8ffe8001f001f001f001ffff1fff1fff1fff100b800b800b800b8ff;
      expv[6] = 304'h008f008f008fff8f0ffff2fff2009c009c009cff9c008200820082ff82074307430743fa4311;
      expv[7] = 304'h00680068006800680ffff9fff9006e006e006e006e0062006200620062027002700270027000;
      expv[8] = 304'h006b006b006b006b0ffffbfffb0035003500350035002d002d002d002d00c400c400c400c400;
      expv[9] = 304'h008d008d008dff8d0fffd00010010e010e010effce00b000b000b0fff028f128f128f1023111;
      expv[10] = 304'h00da00da00daffda0fffe6ffe6006d006d006d006d003b003b003b003b083408340834083400;
      expv[11] = 304'h00630063006300630ffff0fff000bb00bb00bbffbb009d009d009dff9d0a140a140a14fb1411;
      expv[12] = 304'h007d007d007d007d0fffd60016010d010d010dffcd00bb00bb00bbfffb248424842484028411;
      expv[13] = 304'h00e500e500e5ffe50fffe8ffe800fc00fc00fcfffc00ce00ce00ceffce149314931493fd9311;
      expv[14] = 304'h009f009f009fff9f0fffe3ffe300bb00bb00bbffbb008300830083ff83116411641164f56411;
      expv[15] = 304'h004c004c004c004c0ffff6fff60055005500550055004300430043004302ac02ac02ac02ac00;
      expv[16] = 304'h00210021002100210fffffffff000b000b000b000b000b000b000b000b000000000000000000;
      expv[17] = 304'h009800980098ff980fffd20012002e002e002effeeffd4ffd4ffd40014002d002d002dffedee;
      expv[18] = 304'h006e006e006e006e0fffeaffea00b200b200b2ffb2008800880088ff880ce10ce10ce1f7e111;
      expv[19] = 304'h009a009a009aff9a0fffd4001400d600d600d6ff96008000800080ffc01cb91cb91cb906f911;
      expv[20] = 304'h00e500e500e5ffe50fffca000a003700370037fff7ffcdffcdffcd000d006a006a006affeaee;
      expv[21] = 304'h00ed00ed00edffed0fffc6000600f200f200f2ffb2008000800080ffc029312931293101f111;
      expv[22] = 304'h00a700a700a7ffa70fffdb001b007a007a007a003a00320032003200720c180c180c18f69800;
      expv[23] = 304'h00d100d100d1ffd10fffc90009010701070107ffc7009b009b009bffdb2c162c162c1601d611;
      expv[24] = 304'h00180018001800180fffcf000f0048004800480008ffe8ffe8ffe80028048004800480fe80ee;
      expv[25] = 304'h000d000d000d000d0ffff9fff9008b008b008bff8b007f007f007fff7f031e031e031efd1e11;
      expv[26] = 304'h002e002e002e002e0fffcd000d00f300f300f3ffb3008f008f008fffcf25b225b225b2037211;
      expv[27] = 304'h00c300c300c3ffc30fffce000e007c007c007c003c001a001a001a005a0e5b0e5b0e5bfb9b00;
      expv[28] = 304'h00490049004900490fffecffec0048004800480048002200220022002203ef03ef03ef03ef00;
      expv[29] = 304'h00730073007300730fffe2ffe2009000900090009000560056005600560d070d070d070d0700;
      expv[30] = 304'h00f900f900f9fff90fffd6001600dd00dd00ddff9d008b008b008bffcb1cd41cd41cd406d411;
      expv[31] = 304'h00ce00ce00ceffce0ffff9fff900d400d400d4ffd400c800c800c8ffc804d404d404d4fed411;
      expv[32] = 304'h001c001c001c001c0fffce000e004d004d004d000dffebffebffeb002b055c055c055cfe5cee;
      expv[33] = 304'h00ac00ac00acffac0ffff7fff700b400b400b4ffb400a400a400a4ffa4056005600560fd6011;
      expv[34] = 304'h009e009e009eff9e0fffc80008005c005c005c001cffeeffeeffee002e07f307f307f3feb3ee;
      expv[35] = 304'h009b009b009bff9b0fffd2001200c800c800c8ff88006e006e006effae1b3f1b3f1b3f077f11;
      expv[36] = 304'h00df00df00dfffdf0fffe1ffe1011b011b011b001b00df00df00dfffdf1da61da61da6ffa611;
      expv[37] = 304'h008200820082ff820ffff4fff4009500950095ff95007f007f007fff7f05ee05ee05eefaee11;
      expv[38] = 304'h007d007d007d007d0fffca000a010801080108ffc8009e009e009effde2baf2baf2baf01ef11;
      expv[39] = 304'h00b400b400b4ffb40fffdc001c00d700d700d7ff97009100910091ffd1189c189c189c089c11;
      expv[40] = 304'h009100910091ff910fffe0ffe000d600d600d6ffd6009800980098ff98162916291629f72911;
      expv[41] = 304'h004a004a004a004a0fffcf000f00db00db00dbff9b007b007b007bffbb201020102010055011;
      expv[42] = 304'h00790079007900790fffc50005011f011f011fffdf00ab00ab00abffeb33e233e233e200a211;
      expv[43] = 304'h00df00df00dfffdf0ffff3fff300eb00eb00ebffeb00d300d300d3ffd30a740a740a74fe7411;
      expv[44] = 304'h00350035003500350fffc80008006c006c006c002cfffefffefffe003e0b630b630b63fe23ee;
      expv[45] = 304'h00da00da00daffda0ffff5fff50035003500350035002100210021002101ae01ae01ae01ae00;
      expv[46] = 304'h00f100f100f1fff10ffff2fff2008d008d008dff8d007300730073ff73068006800680f98011;
      expv[47] = 304'h005e005e005e005e0fffe2ffe20075007500750075003b003b003b003b09f809f809f809f800;
      expv[48] = 304'h009100910091ff910fffe6ffe6001f001f001f001fffedffedffedffed0096009600960096ff;
      expv[49] = 304'h00780078007800780fffc9000900ae00ae00ae006e0042004200420082195019501950fb5000;
      expv[50] = 304'h00170017001700170fffc500050051005100510011ffddffddffdd001d053605360536ff76ee;
      expv[51] = 304'h00050005000500050ffffefffe00b000b000b0ffb000ae00ae00aeffae00af00af00afffaf11;
      expv[52] = 304'h00d200d200d2ffd20fffd9001900f800f800f8ffb800ac00ac00acffec1f2c1f2c1f2c04ac11;
      expv[53] = 304'h00120012001200120fffe8ffe80029002900290029fffbfffbfffbfffb019e019e019e019eff;
      expv[54] = 304'h00370037003700370fffc90009006d006d006d002d00010001000100410b9a0b9a0b9afdda00;
      expv[55] = 304'h002f002f002f002f0fffc600060068006800680028fff6fff6fff600360a770a770a77feb7ee;
      expv[56] = 304'h005f005f005f005f0fffc7000700f700f700f7ffb7008700870087ffc729c829c829c8020811;
      expv[57] = 304'h00f800f800f8fff80ffffafffa00fd00fd00fdfffd00f300f300f3fff304d804d804d8ffd811;
      expv[58] = 304'h008500850085ff850fffd30013011701170117ffd700bf00bf00bfffff28642864286401a411;
      expv[59] = 304'h00f000f000f0fff00ffff3fff300fc00fc00fcfffc00e400e400e4ffe40b400b400b40ff4011;
      expv[60] = 304'h000c000c000c000c0fffd7001700620062006200220012001200120052091009100910fa9000;
      expv[61] = 304'h005c005c005c005c0fffe6ffe60075007500750075004300430043004308fc08fc08fc08fc00;
      expv[62] = 304'h00b900b900b9ffb90fffdc001c0071007100710031002b002b002b006b0aaa0aaa0aaaf72a00;
      expv[63] = 304'h002b002b002b002b0ffff9fff900b700b700b7ffb700ab00ab00abffab042604260426fe2611;
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
