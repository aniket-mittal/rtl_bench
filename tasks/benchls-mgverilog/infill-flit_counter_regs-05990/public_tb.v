// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05990 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .clr_max(in_vec[65:65]),
    .clr_inv_ids(in_vec[64:64]),
    .clr_sel_cnt_inv(in_vec[63:63]),
    .clr_sel_cnt(in_vec[62:62]),
    .inc_sel_cnt(in_vec[61:61]),
    .inc_sel_cnt_inv(in_vec[60:60]),
    .en_flit_max_in(in_vec[59:59]),
    .en_for_reg(in_vec[58:58]),
    .en_inv_ids(in_vec[57:57]),
    .inv_ids_in(in_vec[56:53]),
    .dest_sel(in_vec[52:52]),
    .flit_max_in(in_vec[51:48]),
    .head_flit(in_vec[47:32]),
    .addrhi(in_vec[31:16]),
    .addrlo(in_vec[15:0]),
    .flit_out(out_vec[24:9]),
    .cnt_eq_max(out_vec[8:8]),
    .cnt_invs_eq_3(out_vec[7:7]),
    .cnt_eq_0(out_vec[6:6]),
    .inv_ids_reg_out(out_vec[5:2]),
    .sel_cnt_invs_out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h666fb3f7056ffadea;
    stim[1] = 67'h6f1b593c89857ffeb;
    stim[2] = 67'h25c7af8d04c1d67a6;
    stim[3] = 67'h0265c84dfc1b80254;
    stim[4] = 67'h00d36827ed0b2d1ee;
    stim[5] = 67'h2cd0935a06ee077c7;
    stim[6] = 67'h3c5dea6351bdf3537;
    stim[7] = 67'h2043202e914c8a8ee;
    stim[8] = 67'h3116dc4c4825a5524;
    stim[9] = 67'h07862f7cbe7bff3c0;
    stim[10] = 67'h359f86f7f6b1a2e3c;
    stim[11] = 67'h09d1fe27fd10ff356;
    stim[12] = 67'h376af620e3c0a8e0c;
    stim[13] = 67'h37e4906f18b8d7741;
    stim[14] = 67'h25da3d88d255a96ad;
    stim[15] = 67'h29b5b235695b444df;
    stim[16] = 67'h0ccb21ee5b64f07c6;
    stim[17] = 67'h32e2cfefc13fc3bc2;
    stim[18] = 67'h0097aad6c9f0f0d38;
    stim[19] = 67'h388f2df035583afec;
    stim[20] = 67'h2a6e766364b628604;
    stim[21] = 67'h01425370c0013ee56;
    stim[22] = 67'h33274faa014c926e6;
    stim[23] = 67'h30d6884c25abd177c;
    stim[24] = 67'h2e7cdecae3cbc2754;
    stim[25] = 67'h0fb325e1f8c93c8fd;
    stim[26] = 67'h0f9333b782e8780a5;
    stim[27] = 67'h15062ac43930b2f40;
    stim[28] = 67'h0ac82939b59ff3c41;
    stim[29] = 67'h2aecbd9b50d6a69ce;
    stim[30] = 67'h1a5704b4c004affd0;
    stim[31] = 67'h0a0eefd3e355dc845;
    stim[32] = 67'h27d757969471eac9e;
    stim[33] = 67'h29b17c555108b26d8;
    stim[34] = 67'h1666170dfd6cdec93;
    stim[35] = 67'h33d47358f33ac4275;
    stim[36] = 67'h0ab7e2fa17072f270;
    stim[37] = 67'h3c84cf617f8d4c6d6;
    stim[38] = 67'h379291fef7f4ad945;
    stim[39] = 67'h17c2d465ae42470eb;
    stim[40] = 67'h33f3bc826931d2fb4;
    stim[41] = 67'h05edc68abb47ca774;
    stim[42] = 67'h2c09a029c0e4cfd44;
    stim[43] = 67'h0a54e674871b61d6c;
    stim[44] = 67'h0b17521bc5b158495;
    stim[45] = 67'h3e7a3f6ec1a4cecfa;
    stim[46] = 67'h32479fb0f449da556;
    stim[47] = 67'h25173bd9a96364cb6;
    stim[48] = 67'h190240c3fd85df56a;
    stim[49] = 67'h1b6950d7aaf5d053e;
    stim[50] = 67'h189e46dbb465d307a;
    stim[51] = 67'h1d1fcb40f349b1163;
    stim[52] = 67'h243f2e65068e3a91c;
    stim[53] = 67'h287202d38a057ae50;
    stim[54] = 67'h2d5f8d9d65b521fd6;
    stim[55] = 67'h21abd1b035e49c04c;
    stim[56] = 67'h498b49b07b2a230c0;
    stim[57] = 67'h08c6e03abeee08997;
    stim[58] = 67'h1bcae22766bd6baa5;
    stim[59] = 67'h297dade01c0b98486;
    stim[60] = 67'h2954811b6faa43012;
    stim[61] = 67'h321125366d7f4d15c;
    stim[62] = 67'h0a9d9722e57ec353f;
    stim[63] = 67'h2822b076ee46ad048;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'h0000140;
      expv[2] = 25'h0000140;
      expv[3] = 25'h1f1a141;
      expv[4] = 25'h1837009;
      expv[5] = 25'h1a16409;
      expv[6] = 25'h06b4148;
      expv[7] = 25'h14c6b40;
      expv[8] = 25'h005d340;
      expv[9] = 25'h085d341;
      expv[10] = 25'h005d242;
      expv[11] = 25'h005d3c3;
      expv[12] = 25'h044fe40;
      expv[13] = 25'h0c41d41;
      expv[14] = 25'h10de342;
      expv[15] = 25'h1b11bc3;
      expv[16] = 25'h1b11b68;
      expv[17] = 25'h03dca68;
      expv[18] = 25'h027f800;
      expv[19] = 25'h027f800;
      expv[20] = 25'h027f800;
      expv[21] = 25'h10c081c;
      expv[22] = 25'h1dcac1d;
      expv[23] = 25'h06e1802;
      expv[24] = 25'h1098402;
      expv[25] = 25'h1d95d78;
      expv[26] = 25'h1d95c64;
      expv[27] = 25'h0595c64;
      expv[28] = 25'h0d95c41;
      expv[29] = 25'h0b3fe00;
      expv[30] = 25'h0d39c18;
      expv[31] = 25'h0969800;
      expv[32] = 25'h0969800;
      expv[33] = 25'h0f2d341;
      expv[34] = 25'h072d360;
      expv[35] = 25'h061bf40;
      expv[36] = 25'h0675801;
      expv[37] = 25'h084ea2c;
      expv[38] = 25'h06b1f40;
      expv[39] = 25'h0eb1f41;
      expv[40] = 25'h08cb442;
      expv[41] = 25'h1263a83;
      expv[42] = 25'h0d15658;
      expv[43] = 25'h0515758;
      expv[44] = 25'h0e36c18;
      expv[45] = 25'h03ad818;
      expv[46] = 25'h1edd940;
      expv[47] = 25'h0893a00;
      expv[48] = 25'h0f61f41;
      expv[49] = 25'h1f61f40;
      expv[50] = 25'h15eba00;
      expv[51] = 25'h15eba00;
      expv[52] = 25'h01af440;
      expv[53] = 25'h01af57c;
      expv[54] = 25'h05a7164;
      expv[55] = 25'h1b3ad64;
      expv[56] = 25'h1b3ad55;
      expv[57] = 25'h0000140;
      expv[58] = 25'h0075640;
      expv[59] = 25'h0d7ac00;
      expv[60] = 25'h1817238;
      expv[61] = 25'h1f54838;
      expv[62] = 25'h0602400;
      expv[63] = 25'h0236c00;
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
