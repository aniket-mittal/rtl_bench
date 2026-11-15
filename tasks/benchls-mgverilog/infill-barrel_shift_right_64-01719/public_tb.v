// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01719 dut (
    .A(in_vec[65:2]),
    .factor(in_vec[1:0]),
    .B(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h160ddd49143dc0be5;
    stim[1] = 66'h0810ef803f3e865c4;
    stim[2] = 66'h0719bcffdb0e9bccd;
    stim[3] = 66'h39127ebeebafe9376;
    stim[4] = 66'h198d9d3d1b783a864;
    stim[5] = 66'h248a157fc49f09471;
    stim[6] = 66'h12fb36649e172c0bd;
    stim[7] = 66'h28cb5300345dfc9d8;
    stim[8] = 66'h034a0fbfc946602fe;
    stim[9] = 66'h38dbe9b26af35b108;
    stim[10] = 66'h2ac73b850efc92221;
    stim[11] = 66'h1bfe6bbd1daea7609;
    stim[12] = 66'h0e34189df6f091414;
    stim[13] = 66'h17c7a5f3bee1a3da0;
    stim[14] = 66'h3c5635be31bfa8a84;
    stim[15] = 66'h1eb061e4dbe3c2b6b;
    stim[16] = 66'h25cbeadced71ae290;
    stim[17] = 66'h076ef63f746691427;
    stim[18] = 66'h1d0fd580b9136fc73;
    stim[19] = 66'h2176c8aa549004a64;
    stim[20] = 66'h2bcc48a1945f0fa76;
    stim[21] = 66'h0bdad55764c5654ee;
    stim[22] = 66'h2e0f089dc5327f25a;
    stim[23] = 66'h26a52053ccaa6352e;
    stim[24] = 66'h006a0e9a3f267ba65;
    stim[25] = 66'h347bc534895bfa887;
    stim[26] = 66'h0082e30e9e9d85588;
    stim[27] = 66'h11f225a53d5ec5674;
    stim[28] = 66'h03d0d94a7156faa37;
    stim[29] = 66'h22aaaa445f1680b62;
    stim[30] = 66'h38f648eea5248bb2c;
    stim[31] = 66'h07aa76863349e5682;
    stim[32] = 66'h1dc8824924e5af372;
    stim[33] = 66'h3c16cd6d194efcda7;
    stim[34] = 66'h15f68df38c92b8ba3;
    stim[35] = 66'h2a72d5397e4baf57e;
    stim[36] = 66'h1deca4424e1c0d731;
    stim[37] = 66'h1fec20169076b5fc0;
    stim[38] = 66'h0b755e96e6d87da0a;
    stim[39] = 66'h3af067044463c3ced;
    stim[40] = 66'h27fa16d94e30f220a;
    stim[41] = 66'h20138aae316636be5;
    stim[42] = 66'h2fdd0067fca9b7020;
    stim[43] = 66'h2c2374108661716ce;
    stim[44] = 66'h3525cd73d8f09c305;
    stim[45] = 66'h300c18bec02a8c364;
    stim[46] = 66'h02738dc1b4f0a8ddf;
    stim[47] = 66'h0d9de67609ef2120e;
    stim[48] = 66'h08148df20ae23115f;
    stim[49] = 66'h0c54f059d04425621;
    stim[50] = 66'h22dec2d8298f89902;
    stim[51] = 66'h149659800e77ae427;
    stim[52] = 66'h3521fc368b3f020f3;
    stim[53] = 66'h0a7036604a48575a9;
    stim[54] = 66'h32a7b4a773dccb64c;
    stim[55] = 66'h0f7c6c0c2db95a025;
    stim[56] = 66'h273a8bfd946dd16c4;
    stim[57] = 66'h2ab7db5913f2d62b7;
    stim[58] = 66'h25bdf33e4a50d86e4;
    stim[59] = 66'h2dfebb20673e429a7;
    stim[60] = 66'h34ab4e023422e6198;
    stim[61] = 66'h17dacd150c0cd76cd;
    stim[62] = 66'h0e1bca38d66fc7db0;
    stim[63] = 66'h02d8ba94eef5cdcda;
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
      expv[0] = 64'h05837752450f702f;
      expv[1] = 64'h2043be00fcfa1971;
      expv[2] = 64'h01c66f3ff6c3a6f3;
      expv[3] = 64'h00e449fafbaebfa4;
      expv[4] = 64'h663674f46de0ea19;
      expv[5] = 64'h0922855ff127c251;
      expv[6] = 64'h04becd992785cb02;
      expv[7] = 64'ha32d4c00d177f276;
      expv[8] = 64'h000d283eff251980;
      expv[9] = 64'he36fa6c9abcd6c42;
      expv[10] = 64'h0ab1cee143bf2488;
      expv[11] = 64'h06ff9aef476ba9d8;
      expv[12] = 64'h38d06277dbc24505;
      expv[13] = 64'h5f1e97cefb868f68;
      expv[14] = 64'hf158d6f8c6fea2a1;
      expv[15] = 64'h0007ac187936f8f0;
      expv[16] = 64'h972fab73b5c6b8a4;
      expv[17] = 64'h0001dbbd8fdd19a4;
      expv[18] = 64'h000743f5602e44db;
      expv[19] = 64'h85db22a952401299;
      expv[20] = 64'h00af312286517c3e;
      expv[21] = 64'h002f6b555d931595;
      expv[22] = 64'h00b83c227714c9fc;
      expv[23] = 64'h009a94814f32a98d;
      expv[24] = 64'h001a83a68fc99ee9;
      expv[25] = 64'h000d1ef14d2256fe;
      expv[26] = 64'h020b8c3a7a761562;
      expv[27] = 64'h47c89694f57b159d;
      expv[28] = 64'h0000f436529c55be;
      expv[29] = 64'h008aaaa9117c5a02;
      expv[30] = 64'he3d923ba94922ecb;
      expv[31] = 64'h001ea9da18cd2795;
      expv[32] = 64'h00772209249396bc;
      expv[33] = 64'h000f05b35b4653bf;
      expv[34] = 64'h00057da37ce324ae;
      expv[35] = 64'h00a9cb54e5f92ebd;
      expv[36] = 64'h077b29109387035c;
      expv[37] = 64'h7fb0805a41dad7f0;
      expv[38] = 64'h002dd57a5b9b61f6;
      expv[39] = 64'h0ebc19c11118f0f3;
      expv[40] = 64'h009fe85b6538c3c8;
      expv[41] = 64'h0804e2ab8c598daf;
      expv[42] = 64'hbf74019ff2a6dc08;
      expv[43] = 64'h00b08dd0421985c5;
      expv[44] = 64'h0d49735cf63c270c;
      expv[45] = 64'hc03062fb00aa30d9;
      expv[46] = 64'h00009ce3706d3c2a;
      expv[47] = 64'h00367799d827bc84;
      expv[48] = 64'h000205237c82b88c;
      expv[49] = 64'h03153c1674110958;
      expv[50] = 64'h008b7b0b60a63e26;
      expv[51] = 64'h0005259660039deb;
      expv[52] = 64'h000d487f0da2cfc0;
      expv[53] = 64'h029c0d98129215d6;
      expv[54] = 64'hca9ed29dcf732d93;
      expv[55] = 64'h03df1b030b6e5680;
      expv[56] = 64'h9cea2ff651b745b1;
      expv[57] = 64'h000aadf6d644fcb5;
      expv[58] = 64'h96f7ccf9294361b9;
      expv[59] = 64'h000b7faec819cf90;
      expv[60] = 64'hd2ad3808d08b9866;
      expv[61] = 64'h05f6b345430335db;
      expv[62] = 64'h386f28e359bf1f6c;
      expv[63] = 64'h000b62ea53bbd737;
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
