// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 141;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142515 dut (
    .clk(clk),
    .rst(in_vec[140:140]),
    .addrbase(in_vec[139:108]),
    .addrofs(in_vec[107:76]),
    .lsu_op(in_vec[75:72]),
    .lsu_datain(in_vec[71:40]),
    .du_stall(in_vec[39:39]),
    .dcpu_dat_i(in_vec[38:7]),
    .dcpu_ack_i(in_vec[6:6]),
    .dcpu_rty_i(in_vec[5:5]),
    .dcpu_err_i(in_vec[4:4]),
    .dcpu_tag_i(in_vec[3:0]),
    .except_align(out_vec[111:111]),
    .except_dtlbmiss(out_vec[110:110]),
    .except_dmmufault(out_vec[109:109]),
    .except_dbuserr(out_vec[108:108]),
    .lsu_dataout(out_vec[107:76]),
    .lsu_stall(out_vec[75:75]),
    .lsu_unstall(out_vec[74:74]),
    .dcpu_adr_o(out_vec[73:42]),
    .dcpu_cycstb_o(out_vec[41:41]),
    .dcpu_we_o(out_vec[40:40]),
    .dcpu_sel_o(out_vec[39:36]),
    .dcpu_tag_o(out_vec[35:32]),
    .dcpu_dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 141'h15b93611aa9a218726a30c14d40cbba91b00;
    stim[1] = 141'h1c855d59763718db7d4c408428b6ca7ab4fa;
    stim[2] = 141'h10f08459012dabb941968ebd0e654f57663d;
    stim[3] = 141'h067d200c13bc2cc965bf314542cf5acb673b;
    stim[4] = 141'h0316e86881ff4ff6a50efd7b98304f5084f3;
    stim[5] = 141'h053541e1157ae61e6a69c0419bf4443d00c4;
    stim[6] = 141'h0e890ab7ad94f1ed56d7ac5720eaadc57c30;
    stim[7] = 141'h0b9d63898781c4388b07bfdf6a566a3def60;
    stim[8] = 141'h0c61e7010c85b80ff8e7a61815bbd49343c4;
    stim[9] = 141'h0449411c3de0b0a95a9dccb7d9da7df3b1d3;
    stim[10] = 141'h05b3ea718d3ed5accd7b3f80f9ab08dd83e1;
    stim[11] = 141'h10e791f5bf261491cb9becca97ed50decb2a;
    stim[12] = 141'h0ca2e914fdc704661e2c5fe1969f4ceff2dd;
    stim[13] = 141'h0bd2f435a990bf2d40288b1df4a49eb66732;
    stim[14] = 141'h04ca3a0614a98c41c560e3cd2c7b02102a6f;
    stim[15] = 141'h058bd91d2c6f16a2b8f43a9abce289c3d816;
    stim[16] = 141'h0bcf345f0d6971574ddaa1faf941438c03f8;
    stim[17] = 141'h0adde20cbf7feff077c50047c6718a3fc23d;
    stim[18] = 141'h060eeb1a021049e973c8ba8a2f829358f6c5;
    stim[19] = 141'h0bf40bc258517c75ceed9a51f0d7b8320323;
    stim[20] = 141'h08f2778d1e953e3a3458b20bfa10b0edf453;
    stim[21] = 141'h0450f1483c409641fa4193a899f579ed27f5;
    stim[22] = 141'h128a0073fcfb024471c663b1b3f2c40e564a;
    stim[23] = 141'h02e41ca9428475f50a9af213b86606b1000f;
    stim[24] = 141'h0479c812f0d253dbc0a459a3dda8368b5ed6;
    stim[25] = 141'h0d516b330bcd39c9526d22d0891f4b66db54;
    stim[26] = 141'h0ffc1e12d231ce9160b2abef4db6c52c580d;
    stim[27] = 141'h0986ace0936bc8e8a2546b709a941749d631;
    stim[28] = 141'h03287b318a9cfd0d2800df8edce16c086df9;
    stim[29] = 141'h03b160da15eca1d447b56ed25b7317d487ae;
    stim[30] = 141'h0499d320ab866cae2822e8abb3a98ae4ccad;
    stim[31] = 141'h0236bf4f158a1d789dc3e2193c031d471216;
    stim[32] = 141'h09f2e3159e7eaaa1939a23a00ca03246088f;
    stim[33] = 141'h0b2248c37752161cdcf543f05f05a146b5f1;
    stim[34] = 141'h02528b210596520f9ebafa1768abfa3d97df;
    stim[35] = 141'h0d3250aaf092f722e67fba7dd81d2ff23fc9;
    stim[36] = 141'h086c9ae87b33dbd9bb2b940dc2d9e753bfc6;
    stim[37] = 141'h0343329141015eb7216292337f43517ef310;
    stim[38] = 141'h0980ebe2ee6b0a163ffb1ce8169ab03cf91d;
    stim[39] = 141'h0c6f6f8717c2a832f10452677a6d7b6b0524;
    stim[40] = 141'h06a0d4db61c5252fab316564c448f1c3cc4b;
    stim[41] = 141'h0b72038e88c798d796daa7d9fc611c661662;
    stim[42] = 141'h0eb4ea479470f219a52161f005aa4ebb5715;
    stim[43] = 141'h054da6d4bac7591998ec75ceb1996786f37f;
    stim[44] = 141'h009083f44d7966d53ad0cca535a40dd74b7b;
    stim[45] = 141'h0330c01d6137c5e2ecb22330da6b555fc488;
    stim[46] = 141'h0917d37cc572c343ad9aa25b64e4d5f57791;
    stim[47] = 141'h1ca358f26b1a06bed340d2210664fc9b7ba4;
    stim[48] = 141'h06bb32ed83982779bda471797c0d298a5919;
    stim[49] = 141'h008c2f8f2e98ec82ae0839923073fe45d3bb;
    stim[50] = 141'h0e73eb05e3ab00cd680bb78a14ddfb9b6b5b;
    stim[51] = 141'h0535a645bf1e580e8b766d5266d067cba908;
    stim[52] = 141'h0619983f47d7bb9aa224ab9780d6df6857df;
    stim[53] = 141'h051a590bc6c99a46e97a7951a0c71e1334a8;
    stim[54] = 141'h0bfa8489eab77603c1b5b69bd6fc56686c87;
    stim[55] = 141'h09ab21a028b5034f173de244b6d733b2570e;
    stim[56] = 141'h043b88612a905754f952390e045ca515f4a6;
    stim[57] = 141'h06b794c1e6123ef61f03a6b69cd13c8031b5;
    stim[58] = 141'h0e0e9c49598b7db64a996a3942dc8f15e8b1;
    stim[59] = 141'h0bfb8c04ec4262360883927eee5c770966ab;
    stim[60] = 141'h0d5438f4a09d0403de6f01c6c5d1b5b18c07;
    stim[61] = 141'h047dddae5f61c15ee6395cca7c959bb4ce56;
    stim[62] = 141'h0f55bc840a29633d02d1bcf44dda46371312;
    stim[63] = 141'h010878755a5acc83757e66dde8a8d25c9f08;
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
      expv[0] = 112'h0xxxxxxxx014d5e630f6a30c14d4;
      expv[1] = 112'h1xxxxxxxx0af1d8d38fd4c408428;
      expv[2] = 112'h1xxxxxxxx0878c049131968ebd0e;
      expv[3] = 112'h1xxxxxxxx28e53355cf5bf314542;
      expv[4] = 112'h1xxxxxxxx1458e17c8f50efd7b98;
      expv[5] = 112'h0xxxxxxxxaac09ffdefa69c0419b;
      expv[6] = 112'h900000000b077f293cf6d7ac5720;
      expv[7] = 112'h0000000008c7c9f082fb07bfdf6a;
      expv[8] = 112'h877a92687e39e7c43cf8e7a61815;
      expv[9] = 112'h177a9268708a7c7160fa9dccb7d9;
      expv[10] = 112'h077a926870bcb00790fd7b3f80f9;
      expv[11] = 112'h077a9268700369a1dcfb9becca97;
      expv[12] = 112'h177a9268729a7b5ec0fe2c5fe196;
      expv[13] = 112'h177a92687158ecd8b940288b1df4;
      expv[14] = 112'h077a9268725cf191f4f560e3cd2c;
      expv[15] = 112'h977a9268787ebbeff6f8f43a9abc;
      expv[16] = 112'h100000000e4e296d90fddaa1faf9;
      expv[17] = 112'h100000000297747f48f7c50047c6;
      expv[18] = 112'h000000000a07cd40dff3c8ba8a2f;
      expv[19] = 112'h000000000911620e04feed9a51f0;
      expv[20] = 112'h1000000009e1ed71d2f458b20bfa;
      expv[21] = 112'h100000000c2461e288fa4193a899;
      expv[22] = 112'h0000000003e140ae19c1c663b1b3;
      expv[23] = 112'h00000000015a24a790fa9af213b8;
      expv[24] = 112'h10000000095306fbaf80a459a3dd;
      expv[25] = 112'h900000000e47a93f15f26d22d089;
      expv[26] = 112'h00000000008b7b290d80b2abef4d;
      expv[27] = 112'h90000000033c9d724df2546b709a;
      expv[28] = 112'h9000000003715e0fa8f800df8edc;
      expv[29] = 112'h80000000026780ab94f7b56ed25b;
      expv[30] = 112'h0000000008080ff3b2f822e8abb3;
      expv[31] = 112'h1000000009f03731e8fdc3e2193c;
      expv[32] = 112'h000000000a1c636dc9f39a23a00c;
      expv[33] = 112'h100000000c9d17b810fcf543f05f;
      expv[34] = 112'h1000000001fa374c24febafa1768;
      expv[35] = 112'h80000000037151f374f67fba7dd8;
      expv[36] = 112'h0000000008e81db08afb2b940dc2;
      expv[37] = 112'h100000000911245219c16292337f;
      expv[38] = 112'h1000000009fafd7e44fffb1ce816;
      expv[39] = 112'h00000000090c85ee81310452677a;
      expv[40] = 112'h000000000a197e82c2fb316564c4;
      expv[41] = 112'h80000cc2cd0e671984f6daa7d9fc;
      expv[42] = 112'h10000cc2c0c977184cf52161f005;
      expv[43] = 112'h10000cc2c0053ffb90f8ec75ceb1;
      expv[44] = 112'h10000cc2c3827ab25cfad0cca535;
      expv[45] = 112'h00000cc2c11a218010fcb22330da;
      expv[46] = 112'h10000cc2cba2a5b01afd9aa25b64;
      expv[47] = 112'h00000cc2c1ef57ec4df340d22106;
      expv[48] = 112'h10000cc2c294d699ccfda471797c;
      expv[49] = 112'h10000cc2cbc9470472fe08399230;
      expv[50] = 112'h1bbf736d6c87baf4d0f80bb78a14;
      expv[51] = 112'h0bbf736d6114ff950cfb766d5266;
      expv[52] = 112'h9bbf736d637c54f679f224ab9780;
      expv[53] = 112'h8bbf736d62f8fcd4a8f97a7951a0;
      expv[54] = 112'h0bbf736d61ac7ea369c1b5b69bd6;
      expv[55] = 112'h8bbf736d6098093bccf73de244b6;
      expv[56] = 112'h8bbf736d63b2f7ed84f952390e04;
      expv[57] = 112'h1bbf736d6b3274edfeff03a6b69c;
      expv[58] = 112'h1bbf736d69e6867fe4fa996a3942;
      expv[59] = 112'h8bbf736d6a0f7b8ebaf883927eee;
      expv[60] = 112'h0bbf736d6b7c4f3e1cfe6f01c6c5;
      expv[61] = 112'h90000699ccf7e7c34cf6395cca7c;
      expv[62] = 112'h10000699c25fc7f041f2d1bcf44d;
      expv[63] = 112'h00000699c2d8d13e30f57e66dde8;
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
