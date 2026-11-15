// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063789 dut (
    .clk_i(clk),
    .rst_i(in_vec[69:69]),
    .ack_i(in_vec[68:68]),
    .err_i(in_vec[67:67]),
    .write_i(in_vec[66:66]),
    .render_addr_i(in_vec[65:36]),
    .render_sel_i(in_vec[35:32]),
    .render_dat_i(in_vec[31:0]),
    .cyc_o(out_vec[77:77]),
    .stb_o(out_vec[76:76]),
    .cti_o(out_vec[75:73]),
    .bte_o(out_vec[72:71]),
    .we_o(out_vec[70:70]),
    .adr_o(out_vec[69:38]),
    .sel_o(out_vec[37:34]),
    .dat_o(out_vec[33:2]),
    .sint_o(out_vec[1:1]),
    .ack_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3993642cb3f7dae7da;
    stim[1] = 70'h332fe8e0dd68555a9a;
    stim[2] = 70'h110fc71a14e648db79;
    stim[3] = 70'h0aeab69d9444eae425;
    stim[4] = 70'h1fcd355e75f90ac06e;
    stim[5] = 70'h049614ec72ad1b6f4e;
    stim[6] = 70'h1333a92bd64ec9e703;
    stim[7] = 70'h01f0b17d070de191a8;
    stim[8] = 70'h18367c95b6979197c7;
    stim[9] = 70'h094e54a76a161442bf;
    stim[10] = 70'h0f9dbb152e402e6224;
    stim[11] = 70'h1a88b0bdbe5b6867a0;
    stim[12] = 70'h09fa984b15501389d0;
    stim[13] = 70'h183998f5960657e25c;
    stim[14] = 70'h17bbdfe86dbcd716fb;
    stim[15] = 70'h1ae0ef97ba191c9f75;
    stim[16] = 70'h0cb1be428519a5d1ad;
    stim[17] = 70'h123a51911e836ea82c;
    stim[18] = 70'h09f6599689067443cf;
    stim[19] = 70'h09d0f17af2d9ec840b;
    stim[20] = 70'h05f3724cb2a27fcb29;
    stim[21] = 70'h037d3a16c7b0974bf6;
    stim[22] = 70'h07f1be2e11eab04aea;
    stim[23] = 70'h0439305d5503b42960;
    stim[24] = 70'h199c415a31895a5eba;
    stim[25] = 70'h06bfd8427f1e53dbdf;
    stim[26] = 70'h0908ca1502fca33b29;
    stim[27] = 70'h09a84f353ee9ef7430;
    stim[28] = 70'h0ad6456dd978ae2a04;
    stim[29] = 70'h02213aa46316b0872a;
    stim[30] = 70'h04b9fcee85aefdf2b5;
    stim[31] = 70'h0fe8e53afc38eab9db;
    stim[32] = 70'h05fdfd3bc5f6b022cb;
    stim[33] = 70'h023a6365306616331a;
    stim[34] = 70'h1a52b5686cecaefa46;
    stim[35] = 70'h053cd9399051cf81d1;
    stim[36] = 70'h0fa6a5d7d8a551e848;
    stim[37] = 70'h10d0355e98aeccb709;
    stim[38] = 70'h072240b14455448a69;
    stim[39] = 70'h0df6a09a1d14851002;
    stim[40] = 70'h0146bdcb13fbe3d850;
    stim[41] = 70'h3664ad42b288fb3200;
    stim[42] = 70'h0b8739dd3986bd40e4;
    stim[43] = 70'h123cab8ca9b143952c;
    stim[44] = 70'h0aae68e900193040a6;
    stim[45] = 70'h0f259f6d52a04f44b0;
    stim[46] = 70'h10267f482a93ae99f7;
    stim[47] = 70'h1e998d30c17c496158;
    stim[48] = 70'h141ea6659725dfded6;
    stim[49] = 70'h080dada73e58297ee0;
    stim[50] = 70'h1be7eeed4b81fa9aa2;
    stim[51] = 70'h008fe14395b0b5ead3;
    stim[52] = 70'h1fb519c90e10deb9be;
    stim[53] = 70'h181c35ab26b7af2002;
    stim[54] = 70'h1f2a8452f3e0b9cae4;
    stim[55] = 70'h0092e8290cebf3aecb;
    stim[56] = 70'h0cbef47298631cef2b;
    stim[57] = 70'h013e1400634bd3bff8;
    stim[58] = 70'h1bcaf0de7c3b9d5bb9;
    stim[59] = 70'h0e3d5597a7069714f5;
    stim[60] = 70'h22f2307e32cc64a5ff;
    stim[61] = 70'h0a17b7fa57841b6e21;
    stim[62] = 70'h1a71e3fe476cdda68a;
    stim[63] = 70'h19beb52540acf14e4d;
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
      expv[0] = 78'h10593642cb0fdf6b9f6a;
      expv[1] = 78'h1072fe8e0d35a1556a68;
      expv[2] = 78'h1050fc71a11399236de4;
      expv[3] = 78'h106eab69d91113ab9097;
      expv[4] = 78'h107cd355e717e42b01ba;
      expv[5] = 78'h1049614ec70ab46dbd39;
      expv[6] = 78'h30733a92bd193b279c0c;
      expv[7] = 78'h105f0b17d01c378646a1;
      expv[8] = 78'h104367c95b1a5e465f1e;
      expv[9] = 78'h1054e54a762858510aff;
      expv[10] = 78'h1079dbb1523900b98892;
      expv[11] = 78'h30688b0bdb396da19e82;
      expv[12] = 78'h105fa984b115404e2743;
      expv[13] = 78'h1043998f5918195f8972;
      expv[14] = 78'h107bbdfe8636f35c5bed;
      expv[15] = 78'h106e0ef97b2864727dd7;
      expv[16] = 78'h104b1be42814669746b7;
      expv[17] = 78'h3063a519113a0dbaa0b0;
      expv[18] = 78'h105f6599682419d10f3f;
      expv[19] = 78'h105d0f17af0b67b2102e;
      expv[20] = 78'h105f3724cb0a89ff2ca4;
      expv[21] = 78'h3077d3a16c1ec25d2fd8;
      expv[22] = 78'h307f1be2e107aac12ba8;
      expv[23] = 78'h30439305d5140ed0a580;
      expv[24] = 78'h3059c415a30625697aea;
      expv[25] = 78'h106bfd84273c794f6f7d;
      expv[26] = 78'h30508ca1500bf28ceca6;
      expv[27] = 78'h305a84f3533ba7bdd0c2;
      expv[28] = 78'h306d6456dd25e2b8a812;
      expv[29] = 78'h306213aa460c5ac21ca8;
      expv[30] = 78'h304b9fcee816bbf7cad4;
      expv[31] = 78'h307e8e53af30e3aae76e;
      expv[32] = 78'h305fdfd3bc17dac08b2c;
      expv[33] = 78'h3063a63653019858cc68;
      expv[34] = 78'h30652b568633b2bbe91a;
      expv[35] = 78'h1053cd939901473e0745;
      expv[36] = 78'h307a6a5d7d229547a122;
      expv[37] = 78'h304d0355e922bb32dc24;
      expv[38] = 78'h1072240b1411551229a5;
      expv[39] = 78'h305f6a09a1345214400a;
      expv[40] = 78'h30546bdcb10fef8f6140;
      expv[41] = 78'h10664ad42b0a23ecc800;
      expv[42] = 78'h1078739dd3261af50392;
      expv[43] = 78'h1063cab8ca26c50e54b0;
      expv[44] = 78'h106ae68e900064c1029b;
      expv[45] = 78'h107259f6d50a813d12c2;
      expv[46] = 78'h304267f4822a4eba67dc;
      expv[47] = 78'h106998d30c05f1258563;
      expv[48] = 78'h1041ea66591c977f7b59;
      expv[49] = 78'h1040dada733960a5fb83;
      expv[50] = 78'h107e7eeed42e07ea6a8a;
      expv[51] = 78'h1048fe143916c2d7ab4d;
      expv[52] = 78'h107b519c9038437ae6fa;
      expv[53] = 78'h1041c35ab21adebc800b;
      expv[54] = 78'h1072a8452f0f82e72b93;
      expv[55] = 78'h10492e829033afcebb2d;
      expv[56] = 78'h104bef4729218c73bcae;
      expv[57] = 78'h3053e140060d2f4effe0;
      expv[58] = 78'h307caf0de730ee756ee6;
      expv[59] = 78'h1063d5597a1c1a5c53d7;
      expv[60] = 78'h106f2307e30b319297fc;
      expv[61] = 78'h10617b7fa51e106db886;
      expv[62] = 78'h10671e3fe41db3769a2a;
      expv[63] = 78'h105beb525402b3c53937;
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
