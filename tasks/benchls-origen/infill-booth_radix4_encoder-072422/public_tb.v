// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072422 dut (
    .A(in_vec[56:3]),
    .code(in_vec[2:0]),
    .product(out_vec[56:3]),
    .sn(out_vec[2:2]),
    .h(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h0743c184430aef1;
    stim[1] = 57'h110bc79c7ec99f2;
    stim[2] = 57'h1f899865b90eaf4;
    stim[3] = 57'h0bb8f5f30018a4b;
    stim[4] = 57'h0f64dd057c74167;
    stim[5] = 57'h0de81221aee1038;
    stim[6] = 57'h1d355377294d33f;
    stim[7] = 57'h175a6d8656c0132;
    stim[8] = 57'h1b868279a076513;
    stim[9] = 57'h139dd2143da0eac;
    stim[10] = 57'h0c910562ffd39af;
    stim[11] = 57'h1ef48506a7f65dd;
    stim[12] = 57'h0402b07618cdb4a;
    stim[13] = 57'h0ecc2ac0401466e;
    stim[14] = 57'h05f6adbd01578c2;
    stim[15] = 57'h0e80abc8f1c7522;
    stim[16] = 57'h1c4bbd2a3841a73;
    stim[17] = 57'h18b74694e4354d7;
    stim[18] = 57'h1a1e85857a52979;
    stim[19] = 57'h0924924a7bf0c15;
    stim[20] = 57'h14d959516258890;
    stim[21] = 57'h1c7ad1e333a03a7;
    stim[22] = 57'h191c972e76d17fd;
    stim[23] = 57'h08bba65374366d5;
    stim[24] = 57'h1ddfae077056f98;
    stim[25] = 57'h05f0250c1c4320c;
    stim[26] = 57'h1fcc62cdba5eb18;
    stim[27] = 57'h1dafb7ebe9bdb38;
    stim[28] = 57'h0e758e93acd5a0d;
    stim[29] = 57'h0b750abf8dfb584;
    stim[30] = 57'h0fb35b65cd840c3;
    stim[31] = 57'h154fc63a26c47bd;
    stim[32] = 57'h0405835715aaf89;
    stim[33] = 57'h07dbf26f64d91fb;
    stim[34] = 57'h05271727b707487;
    stim[35] = 57'h0e625e8e2958303;
    stim[36] = 57'h1e0ed8715d72537;
    stim[37] = 57'h1c473b6d2ef9c5d;
    stim[38] = 57'h1ee1a587f012572;
    stim[39] = 57'h06610318c68ccee;
    stim[40] = 57'h1dfa1e9d9badd35;
    stim[41] = 57'h156cb0ddbc86f1f;
    stim[42] = 57'h14110a8cffb33ed;
    stim[43] = 57'h03dd4863b481ceb;
    stim[44] = 57'h0aae8ecf62b90a0;
    stim[45] = 57'h0a8c22153c3b631;
    stim[46] = 57'h0bc7f7f13aff04f;
    stim[47] = 57'h0a7ca6543f5973d;
    stim[48] = 57'h18d9d0cb3646064;
    stim[49] = 57'h0527f05f44aa818;
    stim[50] = 57'h1ecb9f8cbc73465;
    stim[51] = 57'h1f1af82b7ddc7dd;
    stim[52] = 57'h1cafc455ca60d3a;
    stim[53] = 57'h0accde5c87361c5;
    stim[54] = 57'h0f5866fb61c0fc6;
    stim[55] = 57'h0ad939291f32671;
    stim[56] = 57'h076a1b84d546b93;
    stim[57] = 57'h0ff541bdd8fdd67;
    stim[58] = 57'h08dcb1aafdb7202;
    stim[59] = 57'h01763d5efb23cd8;
    stim[60] = 57'h0ce1c37adff54a4;
    stim[61] = 57'h054dfefc39dea3a;
    stim[62] = 57'h0dd621af8fbf96e;
    stim[63] = 57'h13859b83b6c0e51;
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
      expv[0] = 57'h0743c184430aef1;
      expv[1] = 57'h110bc79c7ec99f1;
      expv[2] = 57'h00eccf348de2a26;
      expv[3] = 57'h1771ebe60031492;
      expv[4] = 57'h000000000000000;
      expv[5] = 57'h000000000000000;
      expv[6] = 57'h000000000000000;
      expv[7] = 57'h175a6d8656c0131;
      expv[8] = 57'h170d04f340eca22;
      expv[9] = 57'h18c45bd784be2b6;
      expv[10] = 57'h000000000000000;
      expv[11] = 57'h010b7af95809a2d;
      expv[12] = 57'h0402b07618cdb49;
      expv[13] = 57'h1133d53fbfeb99d;
      expv[14] = 57'h05f6adbd01578c1;
      expv[15] = 57'h0e80abc8f1c7521;
      expv[16] = 57'h18977a5470834e2;
      expv[17] = 57'h000000000000000;
      expv[18] = 57'h1a1e85857a52979;
      expv[19] = 57'h16db6db5840f3f5;
      expv[20] = 57'h000000000000000;
      expv[21] = 57'h000000000000000;
      expv[22] = 57'h06e368d1892e80d;
      expv[23] = 57'h174459ac8bc9935;
      expv[24] = 57'h000000000000000;
      expv[25] = 57'h141fb5e7c779bf6;
      expv[26] = 57'h000000000000000;
      expv[27] = 57'h000000000000000;
      expv[28] = 57'h118a716c532a5fd;
      expv[29] = 57'h0915ea80e409506;
      expv[30] = 57'h1f66b6cb9b08182;
      expv[31] = 57'h0ab039c5d93b84d;
      expv[32] = 57'h0405835715aaf89;
      expv[33] = 57'h0fb7e4dec9b23f2;
      expv[34] = 57'h000000000000000;
      expv[35] = 57'h1cc4bd1c52b0602;
      expv[36] = 57'h000000000000000;
      expv[37] = 57'h03b8c492d1063ad;
      expv[38] = 57'h1ee1a587f012571;
      expv[39] = 57'h199efce7397331d;
      expv[40] = 57'h0205e16264522d5;
      expv[41] = 57'h000000000000000;
      expv[42] = 57'h0beef573004cc1d;
      expv[43] = 57'h07ba90c769039d2;
      expv[44] = 57'h000000000000000;
      expv[45] = 57'h0a8c22153c3b631;
      expv[46] = 57'h000000000000000;
      expv[47] = 57'h158359abc0a68cd;
      expv[48] = 57'h0e4c5e699373f46;
      expv[49] = 57'h000000000000000;
      expv[50] = 57'h01346073438cba5;
      expv[51] = 57'h00e507d4822382d;
      expv[52] = 57'h1cafc455ca60d39;
      expv[53] = 57'h153321a378c9e45;
      expv[54] = 57'h10a799049e3f045;
      expv[55] = 57'h0ad939291f32671;
      expv[56] = 57'h0ed43709aa8d722;
      expv[57] = 57'h000000000000000;
      expv[58] = 57'h08dcb1aafdb7201;
      expv[59] = 57'h000000000000000;
      expv[60] = 57'h063c790a40156c6;
      expv[61] = 57'h054dfefc39dea39;
      expv[62] = 57'h1229de50704069d;
      expv[63] = 57'h13859b83b6c0e51;
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
