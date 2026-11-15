// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 181;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09097 dut (
    .clk(clk),
    .ir_we(in_vec[32:32]),
    .instr(in_vec[31:0]),
    .opcode(out_vec[180:175]),
    .reg1(out_vec[174:170]),
    .reg2(out_vec[169:165]),
    .reg3(out_vec[164:160]),
    .sx16(out_vec[159:128]),
    .zx16(out_vec[127:96]),
    .hi16(out_vec[95:64]),
    .sx16s2(out_vec[63:32]),
    .sx26s2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1c919c9d2;
    stim[1] = 33'h193239fcb;
    stim[2] = 33'h0e5e8e1f1;
    stim[3] = 33'h0c73962d8;
    stim[4] = 33'h027775c8a;
    stim[5] = 33'h198225d47;
    stim[6] = 33'h186f6368e;
    stim[7] = 33'h07e7d5f29;
    stim[8] = 33'h0958b00b4;
    stim[9] = 33'h136cdf224;
    stim[10] = 33'h0273a80d5;
    stim[11] = 33'h0ffeefd4a;
    stim[12] = 33'h00d590db7;
    stim[13] = 33'h19f846ea6;
    stim[14] = 33'h172aa55b4;
    stim[15] = 33'h0baabbcfb;
    stim[16] = 33'h1dd4d48ff;
    stim[17] = 33'h1b1bbd081;
    stim[18] = 33'h1c73bcd63;
    stim[19] = 33'h06f371731;
    stim[20] = 33'h1bdf63f77;
    stim[21] = 33'h0a07ac394;
    stim[22] = 33'h173838ba8;
    stim[23] = 33'h0f13d160a;
    stim[24] = 33'h1a25c5b4a;
    stim[25] = 33'h02befdc7b;
    stim[26] = 33'h1718afd1e;
    stim[27] = 33'h07ab17d30;
    stim[28] = 33'h09b490d22;
    stim[29] = 33'h181a27a28;
    stim[30] = 33'h13a89de87;
    stim[31] = 33'h09e7b8c8e;
    stim[32] = 33'h0ef611d87;
    stim[33] = 33'h1e290aa96;
    stim[34] = 33'h1718813b6;
    stim[35] = 33'h083f5c435;
    stim[36] = 33'h1a1b964e9;
    stim[37] = 33'h1100d53a0;
    stim[38] = 33'h1a080a812;
    stim[39] = 33'h0b62ddb8d;
    stim[40] = 33'h07751ce63;
    stim[41] = 33'h0f661a4ab;
    stim[42] = 33'h0b40e0aa1;
    stim[43] = 33'h1e1cfda22;
    stim[44] = 33'h03323a8ae;
    stim[45] = 33'h124ee71c9;
    stim[46] = 33'h1255afb0a;
    stim[47] = 33'h0153ebba7;
    stim[48] = 33'h0d3b92b89;
    stim[49] = 33'h10953213f;
    stim[50] = 33'h026b8a916;
    stim[51] = 33'h0bc2f7537;
    stim[52] = 33'h1c8b4453e;
    stim[53] = 33'h1bff01ed4;
    stim[54] = 33'h1b3300b51;
    stim[55] = 33'h04d1cdb6c;
    stim[56] = 33'h01f26e992;
    stim[57] = 33'h1cb3e1fee;
    stim[58] = 33'h0c64f8460;
    stim[59] = 33'h0942d98e3;
    stim[60] = 33'h10c421fe3;
    stim[61] = 33'h1174b977e;
    stim[62] = 33'h079809524;
    stim[63] = 33'h1d25d6764;
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
      expv[0] = 181'hxxxxxxxxxxxxxx0000xxxxxxxx0000xxxxxxxxxxxxxxxx;
      expv[1] = 181'h192339ffffc9d20000c9d2c9d20000ffff274804672748;
      expv[2] = 181'h126473ffff9fcb00009fcb9fcb0000fffe7f2cfc8e7f2c;
      expv[3] = 181'h126473ffff9fcb00009fcb9fcb0000fffe7f2cfc8e7f2c;
      expv[4] = 181'h126473ffff9fcb00009fcb9fcb0000fffe7f2cfc8e7f2c;
      expv[5] = 181'h126473ffff9fcb00009fcb9fcb0000fffe7f2cfc8e7f2c;
      expv[6] = 181'h13044b00005d4700005d475d4700000001751c0089751c;
      expv[7] = 181'h10dec60000368e0000368e368e00000000da38fbd8da38;
      expv[8] = 181'h10dec60000368e0000368e368e00000000da38fbd8da38;
      expv[9] = 181'h10dec60000368e0000368e368e00000000da38fbd8da38;
      expv[10] = 181'h06d9befffff2240000f224f2240000ffffc890fb37c890;
      expv[11] = 181'h06d9befffff2240000f224f2240000ffffc890fb37c890;
      expv[12] = 181'h06d9befffff2240000f224f2240000ffffc890fb37c890;
      expv[13] = 181'h06d9befffff2240000f224f2240000ffffc890fb37c890;
      expv[14] = 181'h13f08d00006ea600006ea66ea600000001ba98fe11ba98;
      expv[15] = 181'h0e554a000055b4000055b455b40000000156d0faa956d0;
      expv[16] = 181'h0e554a000055b4000055b455b40000000156d0faa956d0;
      expv[17] = 181'h1ba9a9000048ff000048ff48ff0000000123fc053523fc;
      expv[18] = 181'h16377affffd0810000d081d0810000ffff420406ef4204;
      expv[19] = 181'h18e779ffffcd630000cd63cd630000ffff358cfcef358c;
      expv[20] = 181'h18e779ffffcd630000cd63cd630000ffff358cfcef358c;
      expv[21] = 181'h17bec700003f7700003f773f7700000000fddc07d8fddc;
      expv[22] = 181'h17bec700003f7700003f773f7700000000fddc07d8fddc;
      expv[23] = 181'h0e7071ffff8ba800008ba88ba80000fffe2ea0fe0e2ea0;
      expv[24] = 181'h0e7071ffff8ba800008ba88ba80000fffe2ea0fe0e2ea0;
      expv[25] = 181'h144b8b00005b4a00005b4a5b4a000000016d28f9716d28;
      expv[26] = 181'h144b8b00005b4a00005b4a5b4a000000016d28f9716d28;
      expv[27] = 181'h0e315ffffffd1e0000fd1efd1e0000fffff478062bf478;
      expv[28] = 181'h0e315ffffffd1e0000fd1efd1e0000fffff478062bf478;
      expv[29] = 181'h0e315ffffffd1e0000fd1efd1e0000fffff478062bf478;
      expv[30] = 181'h10344f00007a2800007a287a2800000001e8a00689e8a0;
      expv[31] = 181'h07513bffffde870000de87de870000ffff7a1cfa277a1c;
      expv[32] = 181'h07513bffffde870000de87de870000ffff7a1cfa277a1c;
      expv[33] = 181'h07513bffffde870000de87de870000ffff7a1cfa277a1c;
      expv[34] = 181'h1c5215ffffaa960000aa96aa960000fffeaa58fa42aa58;
      expv[35] = 181'h0e3102000013b6000013b613b6000000004ed806204ed8;
      expv[36] = 181'h0e3102000013b6000013b613b6000000004ed806204ed8;
      expv[37] = 181'h14372c000064e9000064e964e90000000193a406e593a4;
      expv[38] = 181'h0201aa000053a0000053a053a0000000014e8000354e80;
      expv[39] = 181'h141015ffffa8120000a812a8120000fffea0480202a048;
      expv[40] = 181'h141015ffffa8120000a812a8120000fffea0480202a048;
      expv[41] = 181'h141015ffffa8120000a812a8120000fffea0480202a048;
      expv[42] = 181'h141015ffffa8120000a812a8120000fffea0480202a048;
      expv[43] = 181'h141015ffffa8120000a812a8120000fffea0480202a048;
      expv[44] = 181'h1c39fbffffda220000da22da220000ffff6888073f6888;
      expv[45] = 181'h1c39fbffffda220000da22da220000ffff6888073f6888;
      expv[46] = 181'h049dce000071c9000071c971c900000001c72403b9c724;
      expv[47] = 181'h04ab5ffffffb0a0000fb0afb0a0000ffffec28056bec28;
      expv[48] = 181'h04ab5ffffffb0a0000fb0afb0a0000ffffec28056bec28;
      expv[49] = 181'h04ab5ffffffb0a0000fb0afb0a0000ffffec28056bec28;
      expv[50] = 181'h012a640000213f0000213f213f0000000084fc054c84fc;
      expv[51] = 181'h012a640000213f0000213f213f0000000084fc054c84fc;
      expv[52] = 181'h012a640000213f0000213f213f0000000084fc054c84fc;
      expv[53] = 181'h1916880000453e0000453e453e0000000114f802d114f8;
      expv[54] = 181'h17fe0300001ed400001ed41ed4000000007b50ffc07b50;
      expv[55] = 181'h16660100000b5100000b510b51000000002d44fcc02d44;
      expv[56] = 181'h16660100000b5100000b510b51000000002d44fcc02d44;
      expv[57] = 181'h16660100000b5100000b510b51000000002d44fcc02d44;
      expv[58] = 181'h1967c300001fee00001fee1fee000000007fb8fcf87fb8;
      expv[59] = 181'h1967c300001fee00001fee1fee000000007fb8fcf87fb8;
      expv[60] = 181'h1967c300001fee00001fee1fee000000007fb8fcf87fb8;
      expv[61] = 181'h01884300001fe300001fe31fe3000000007f8c01087f8c;
      expv[62] = 181'h02e972ffff977e0000977e977e0000fffe5df8fd2e5df8;
      expv[63] = 181'h02e972ffff977e0000977e977e0000fffe5df8fd2e5df8;
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
