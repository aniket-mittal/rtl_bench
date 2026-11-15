// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 158;
  localparam OW = 157;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_038531 dut (
    .clk(clk),
    .reset(in_vec[157:157]),
    .bitsCtr(in_vec[156:148]),
    .newpc(in_vec[147:116]),
    .read1(in_vec[115:84]),
    .read2(in_vec[83:52]),
    .extensor(in_vec[51:20]),
    .instr_2(in_vec[19:15]),
    .instr_1(in_vec[14:10]),
    .rs(in_vec[9:5]),
    .rt(in_vec[4:0]),
    .saidaBitsCtr(out_vec[156:148]),
    .saidaNewPC(out_vec[147:116]),
    .saidaRead1(out_vec[115:84]),
    .saidaRead2(out_vec[83:52]),
    .saidaExtensor(out_vec[51:20]),
    .saidaInst_2(out_vec[19:15]),
    .saidaInst_1(out_vec[14:10]),
    .rsout(out_vec[9:5]),
    .rtout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 158'h29657ffbcdfaaf5490e39712e79bb1d4bd5a254a;
    stim[1] = 158'h216e0c7b8ed099cd41708eaff2efc0a64d8293b1;
    stim[2] = 158'h3bda7ca1a32bac38d4bfcc024c1bd3a473dd8e04;
    stim[3] = 158'h146fdd1fad7d72b23e162281ad5bcc02f5b99c5e;
    stim[4] = 158'h17c58181ad54a601a8cf31ad5e265010135077c2;
    stim[5] = 158'h020d571d61bea426fb928c0882ba803a8466f917;
    stim[6] = 158'h186f74353cb395836a2f6d2920fedcfda48cee7f;
    stim[7] = 158'h0f6839a54fb50f7b8e1863959499a78fccb1bee1;
    stim[8] = 158'h1ff9507eff58e4d06850e7a7025cfdde6919a241;
    stim[9] = 158'h0d5f645af5975ad46e681c608259d539d2b11b1d;
    stim[10] = 158'h162ef00ecf9ab5c24a30af75833ad8f82abac393;
    stim[11] = 158'h19ebbb45eda481840546801bd672278b50309514;
    stim[12] = 158'h1b0c3eeecaed994b6ea09aa02cdb63c7db244015;
    stim[13] = 158'h1833908c003aef4e3b24f0ec87701598b761ec76;
    stim[14] = 158'h189e5bc72d212d057b172cf5ace6d8b2e8c01035;
    stim[15] = 158'h02f994257c29a2238183c68881b2759aa3b18559;
    stim[16] = 158'h0800271fe8cf14ae7358400e08e28cdb38f5d2ee;
    stim[17] = 158'h03ade2d8f45360ee14b5c14c421f7280bb8edb90;
    stim[18] = 158'h0d03cc410a7b314f81bc71e04bf694ecbc47ed88;
    stim[19] = 158'h11da978cfa1fbe7e538bac64fe7a80e85ec7e46a;
    stim[20] = 158'h0885588be6caa0bedf0310a18efa70ee73b3b0fb;
    stim[21] = 158'h0c2f8d1de71862ac6f7a62d64fc8aca431eec720;
    stim[22] = 158'h180c9b80a96a3be14edfe55ac1c1c941b14982fc;
    stim[23] = 158'h12d8647748d7a38322742a7008d2911d0bddecbd;
    stim[24] = 158'h1cbe950bfb8d6f1dfea535bc3cb00457e253eee6;
    stim[25] = 158'h199120c0506aab0377f4fb3cd1cf872ebf8120bb;
    stim[26] = 158'h144c37872fad221b6bd617f1865c74d5d132800d;
    stim[27] = 158'h1ee28a4c9054703ed90a5bc0c89ee8f07975f88f;
    stim[28] = 158'h097bb518382da15bef0d72a2e24784b5bd21590a;
    stim[29] = 158'h024f1428269075291fb5d1ae4c48afad7d70dd81;
    stim[30] = 158'h1c48d2e37c125923324e1886e0ad398dd03ee15d;
    stim[31] = 158'h1dbab515bb5277005b022adc21a5271812d78fa6;
    stim[32] = 158'h1b9e7ae25b5ea1e0fe21222133d4bf779e9033c1;
    stim[33] = 158'h0c38b9db60f234fde2f8d6aca3cde3c921ba0ba0;
    stim[34] = 158'h0d2c7d7bd47cbb456d1d8cd2408e3fc1ca6d8c3c;
    stim[35] = 158'h0e564ae4cb1eac04d0b8ef167ff1b53626b517b9;
    stim[36] = 158'h0d8a324d8ca3be1da3cb21672c2e8399034e159a;
    stim[37] = 158'h1d60439320e7e9266c48d0ac6fb5ca8912ac2bc5;
    stim[38] = 158'h0a73723ccdb479b51bf8eb7e1dcae9716fb530da;
    stim[39] = 158'h182713cdc5226e0aa789b3a0aa57b14afcf3e30b;
    stim[40] = 158'h1d677fd13350833f1e35d270c6eaae8b61a66a3b;
    stim[41] = 158'h0e44b7f9d41937dd68ebc31c339fb952442d6664;
    stim[42] = 158'h19a9040e19a0488282cd39e325333e3953610264;
    stim[43] = 158'h1f02e5be0211a1b83e0d47e298a230fcd89785f1;
    stim[44] = 158'h0d4784703088b3f945e39327e443bb167a7a6f32;
    stim[45] = 158'h1cc7ad13beea6d6b43cad1f1fbcf73f5c30a83f5;
    stim[46] = 158'h00e4f440ef99315d80d8bbc20432b63768531ad3;
    stim[47] = 158'h124761d38e3b993a08b755ecc192915cba9f8222;
    stim[48] = 158'h1b9d0cbd5b9e51e4e506ed1a0a0abc66857fefa9;
    stim[49] = 158'h0038461396836050205d9f999c23fe6f418810f4;
    stim[50] = 158'h03ed7031f624ad685252d638e1c2087033c8009f;
    stim[51] = 158'h15279197bd92696558d6e180d7664c26eb68fc6e;
    stim[52] = 158'h06caede57ba4700d77fb32e74eb987e41d03f355;
    stim[53] = 158'h106e1f881f61d2717de016124cb9d5f22e93fad8;
    stim[54] = 158'h16a181e56ef44878f2618313cd3565ddc582e79d;
    stim[55] = 158'h1ee3436b722b5ad6b09d1c2d9f2b7626c7f7105d;
    stim[56] = 158'h11573e8800ed2a2a88ebd9ebcddd1ae62583edf6;
    stim[57] = 158'h17d64a981be0911c43e69ca0c590c10d7ad8a947;
    stim[58] = 158'h1989bc5eb05adb2eb95dbeba320b4e2f3739c748;
    stim[59] = 158'h0473561412794ca6302d13e95029365049b2dd00;
    stim[60] = 158'h0fcac5af3612e94d517dcdb2ca5faf600679164f;
    stim[61] = 158'h0a697007c34081b5045cfb8bb12bef9a2973c938;
    stim[62] = 158'h1ce5d214b7fe47a15f7746e617592e44f6a99c3b;
    stim[63] = 158'h15f8c01b3e5795a9dec26043718a691d9f419a79;
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
      expv[0] = 157'h0000000000000000000000000000000000000000;
      expv[1] = 157'h0000000000000000000000000000000000000000;
      expv[2] = 157'h0000000000000000000000000000000000000000;
      expv[3] = 157'h0000000000000000000000000000000000000000;
      expv[4] = 157'h146fdd1fad7d72b23e162281ad5bcc02f5b99c5e;
      expv[5] = 157'h17c58181ad54a601a8cf31ad5e265010135077c2;
      expv[6] = 157'h020d571d61bea426fb928c0882ba803a8466f917;
      expv[7] = 157'h186f74353cb395836a2f6d2920fedcfda48cee7f;
      expv[8] = 157'h0f6839a54fb50f7b8e1863959499a78fccb1bee1;
      expv[9] = 157'h1ff9507eff58e4d06850e7a7025cfdde6919a241;
      expv[10] = 157'h0d5f645af5975ad46e681c608259d539d2b11b1d;
      expv[11] = 157'h162ef00ecf9ab5c24a30af75833ad8f82abac393;
      expv[12] = 157'h19ebbb45eda481840546801bd672278b50309514;
      expv[13] = 157'h1b0c3eeecaed994b6ea09aa02cdb63c7db244015;
      expv[14] = 157'h1833908c003aef4e3b24f0ec87701598b761ec76;
      expv[15] = 157'h189e5bc72d212d057b172cf5ace6d8b2e8c01035;
      expv[16] = 157'h02f994257c29a2238183c68881b2759aa3b18559;
      expv[17] = 157'h0800271fe8cf14ae7358400e08e28cdb38f5d2ee;
      expv[18] = 157'h03ade2d8f45360ee14b5c14c421f7280bb8edb90;
      expv[19] = 157'h0d03cc410a7b314f81bc71e04bf694ecbc47ed88;
      expv[20] = 157'h11da978cfa1fbe7e538bac64fe7a80e85ec7e46a;
      expv[21] = 157'h0885588be6caa0bedf0310a18efa70ee73b3b0fb;
      expv[22] = 157'h0c2f8d1de71862ac6f7a62d64fc8aca431eec720;
      expv[23] = 157'h180c9b80a96a3be14edfe55ac1c1c941b14982fc;
      expv[24] = 157'h12d8647748d7a38322742a7008d2911d0bddecbd;
      expv[25] = 157'h1cbe950bfb8d6f1dfea535bc3cb00457e253eee6;
      expv[26] = 157'h199120c0506aab0377f4fb3cd1cf872ebf8120bb;
      expv[27] = 157'h144c37872fad221b6bd617f1865c74d5d132800d;
      expv[28] = 157'h1ee28a4c9054703ed90a5bc0c89ee8f07975f88f;
      expv[29] = 157'h097bb518382da15bef0d72a2e24784b5bd21590a;
      expv[30] = 157'h024f1428269075291fb5d1ae4c48afad7d70dd81;
      expv[31] = 157'h1c48d2e37c125923324e1886e0ad398dd03ee15d;
      expv[32] = 157'h1dbab515bb5277005b022adc21a5271812d78fa6;
      expv[33] = 157'h1b9e7ae25b5ea1e0fe21222133d4bf779e9033c1;
      expv[34] = 157'h0c38b9db60f234fde2f8d6aca3cde3c921ba0ba0;
      expv[35] = 157'h0d2c7d7bd47cbb456d1d8cd2408e3fc1ca6d8c3c;
      expv[36] = 157'h0e564ae4cb1eac04d0b8ef167ff1b53626b517b9;
      expv[37] = 157'h0d8a324d8ca3be1da3cb21672c2e8399034e159a;
      expv[38] = 157'h1d60439320e7e9266c48d0ac6fb5ca8912ac2bc5;
      expv[39] = 157'h0a73723ccdb479b51bf8eb7e1dcae9716fb530da;
      expv[40] = 157'h182713cdc5226e0aa789b3a0aa57b14afcf3e30b;
      expv[41] = 157'h1d677fd13350833f1e35d270c6eaae8b61a66a3b;
      expv[42] = 157'h0e44b7f9d41937dd68ebc31c339fb952442d6664;
      expv[43] = 157'h19a9040e19a0488282cd39e325333e3953610264;
      expv[44] = 157'h1f02e5be0211a1b83e0d47e298a230fcd89785f1;
      expv[45] = 157'h0d4784703088b3f945e39327e443bb167a7a6f32;
      expv[46] = 157'h1cc7ad13beea6d6b43cad1f1fbcf73f5c30a83f5;
      expv[47] = 157'h00e4f440ef99315d80d8bbc20432b63768531ad3;
      expv[48] = 157'h124761d38e3b993a08b755ecc192915cba9f8222;
      expv[49] = 157'h1b9d0cbd5b9e51e4e506ed1a0a0abc66857fefa9;
      expv[50] = 157'h0038461396836050205d9f999c23fe6f418810f4;
      expv[51] = 157'h03ed7031f624ad685252d638e1c2087033c8009f;
      expv[52] = 157'h15279197bd92696558d6e180d7664c26eb68fc6e;
      expv[53] = 157'h06caede57ba4700d77fb32e74eb987e41d03f355;
      expv[54] = 157'h106e1f881f61d2717de016124cb9d5f22e93fad8;
      expv[55] = 157'h16a181e56ef44878f2618313cd3565ddc582e79d;
      expv[56] = 157'h1ee3436b722b5ad6b09d1c2d9f2b7626c7f7105d;
      expv[57] = 157'h11573e8800ed2a2a88ebd9ebcddd1ae62583edf6;
      expv[58] = 157'h17d64a981be0911c43e69ca0c590c10d7ad8a947;
      expv[59] = 157'h1989bc5eb05adb2eb95dbeba320b4e2f3739c748;
      expv[60] = 157'h0473561412794ca6302d13e95029365049b2dd00;
      expv[61] = 157'h0fcac5af3612e94d517dcdb2ca5faf600679164f;
      expv[62] = 157'h0a697007c34081b5045cfb8bb12bef9a2973c938;
      expv[63] = 157'h1ce5d214b7fe47a15f7746e617592e44f6a99c3b;
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
