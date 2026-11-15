// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dprio_mux dut (
    .init_dprio_address(in_vec[60:55]),
    .init_dprio_read(in_vec[54:54]),
    .init_dprio_byteen(in_vec[53:52]),
    .init_dprio_write(in_vec[51:51]),
    .init_dprio_writedata(in_vec[50:35]),
    .init_atpgmode(in_vec[34:34]),
    .init_mdio_dis(in_vec[33:33]),
    .init_scanen(in_vec[32:32]),
    .init_ser_shift_load(in_vec[31:31]),
    .dprio_init_done(in_vec[30:30]),
    .avmm_dprio_address(in_vec[29:24]),
    .avmm_dprio_read(in_vec[23:23]),
    .avmm_dprio_byteen(in_vec[22:21]),
    .avmm_dprio_write(in_vec[20:20]),
    .avmm_dprio_writedata(in_vec[19:4]),
    .avmm_atpgmode(in_vec[3:3]),
    .avmm_mdio_dis(in_vec[2:2]),
    .avmm_scanen(in_vec[1:1]),
    .avmm_ser_shift_load(in_vec[0:0]),
    .dprio_address(out_vec[29:24]),
    .dprio_read(out_vec[23:23]),
    .dprio_byteen(out_vec[22:21]),
    .dprio_write(out_vec[20:20]),
    .dprio_writedata(out_vec[19:4]),
    .atpgmode(out_vec[3:3]),
    .mdio_dis(out_vec[2:2]),
    .scanen(out_vec[1:1]),
    .ser_shift_load(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h06c0d8dce8f6f87c;
    stim[1] = 61'h1a3d611b05fa9ce3;
    stim[2] = 61'h01692ac764ca42d0;
    stim[3] = 61'h0c8e14ca89784e9b;
    stim[4] = 61'h0bff5239e8ce3ba2;
    stim[5] = 61'h13dd789e3cbafc89;
    stim[6] = 61'h03af79550d8ca08c;
    stim[7] = 61'h1e7a6d0b34801378;
    stim[8] = 61'h135feffbb95945ba;
    stim[9] = 61'h03d58e82b0643641;
    stim[10] = 61'h1cfa17f22b6c24d8;
    stim[11] = 61'h0703339392ef3b2d;
    stim[12] = 61'h1b9d09a74b9d5086;
    stim[13] = 61'h062da4cb8c0e0923;
    stim[14] = 61'h15fe6dccc9b2b352;
    stim[15] = 61'h1cd214945438d93a;
    stim[16] = 61'h1e6ef96ef1443b3a;
    stim[17] = 61'h0a2a688908c4aadc;
    stim[18] = 61'h05f9d944f6055455;
    stim[19] = 61'h13ad57bfc55a4dae;
    stim[20] = 61'h0bfd77b56b0c1d35;
    stim[21] = 61'h19e951e4cde9d804;
    stim[22] = 61'h1a283edd8f6e032f;
    stim[23] = 61'h168f547116175d2d;
    stim[24] = 61'h15fd2a6073d54cd8;
    stim[25] = 61'h0a94eef86f84177f;
    stim[26] = 61'h1432d05fa2f331d5;
    stim[27] = 61'h11da95e3c6c0dc7a;
    stim[28] = 61'h02fe008f7269fdca;
    stim[29] = 61'h0cb469e2882dd064;
    stim[30] = 61'h01bf402b62856409;
    stim[31] = 61'h1b4490988e35fff2;
    stim[32] = 61'h139fec683b6ad784;
    stim[33] = 61'h03728f59e7569924;
    stim[34] = 61'h1ad6472c0ad6151b;
    stim[35] = 61'h02c9df3a14f506d6;
    stim[36] = 61'h0f1adeef152e5bcb;
    stim[37] = 61'h0409b1bb28c566ca;
    stim[38] = 61'h19885141e7d06663;
    stim[39] = 61'h0cea9bef763e1ff6;
    stim[40] = 61'h1cc4f44ee05053e4;
    stim[41] = 61'h13cb70278a13ad73;
    stim[42] = 61'h07cd2c9c8bc9bc0c;
    stim[43] = 61'h0806d3bea26c1047;
    stim[44] = 61'h0d8b70f93bbddda3;
    stim[45] = 61'h06836fd7f4800abf;
    stim[46] = 61'h18f25273246fba85;
    stim[47] = 61'h14307d4df3adedd9;
    stim[48] = 61'h030b24e775238aae;
    stim[49] = 61'h0457d4c09d1a7ab8;
    stim[50] = 61'h1a0e0d7c3b2855da;
    stim[51] = 61'h1a20e664f66ada91;
    stim[52] = 61'h0a9c1703a3d1d82a;
    stim[53] = 61'h1c74695687c7476f;
    stim[54] = 61'h148bdbbb62411b7e;
    stim[55] = 61'h13a714524845227a;
    stim[56] = 61'h1923f01995ee60a1;
    stim[57] = 61'h0ffa009a9badd2c3;
    stim[58] = 61'h12c6d0253a37c5a8;
    stim[59] = 61'h0762124746a40f10;
    stim[60] = 61'h1eef112a20d6dd7e;
    stim[61] = 61'h1a9e5948b4b3e5c8;
    stim[62] = 61'h066f24b481169ef7;
    stim[63] = 61'h0fe85538fb4a6adb;
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
      expv[0] = 30'h28f6f879;
      expv[1] = 30'h347ac236;
      expv[2] = 30'h24ca42de;
      expv[3] = 30'h191c2995;
      expv[4] = 30'h28ce3ba3;
      expv[5] = 30'h27baf13c;
      expv[6] = 30'h075ef2aa;
      expv[7] = 30'h3cf4da16;
      expv[8] = 30'h26bfdff7;
      expv[9] = 30'h07ab1d05;
      expv[10] = 30'h39f42fe4;
      expv[11] = 30'h0e066727;
      expv[12] = 30'h0b9d508e;
      expv[13] = 30'h0c5b4997;
      expv[14] = 30'h09b2b359;
      expv[15] = 30'h1438d938;
      expv[16] = 30'h31443b3d;
      expv[17] = 30'h1454d112;
      expv[18] = 30'h36055459;
      expv[19] = 30'h055a4daf;
      expv[20] = 30'h2b0c1d3a;
      expv[21] = 30'h0de9d809;
      expv[22] = 30'h34507dbb;
      expv[23] = 30'h2d1ea8e2;
      expv[24] = 30'h33d54cd0;
      expv[25] = 30'h2f841770;
      expv[26] = 30'h2865a0bf;
      expv[27] = 30'h06c0dc77;
      expv[28] = 30'h3269fdce;
      expv[29] = 30'h1968d3c5;
      expv[30] = 30'h22856406;
      expv[31] = 30'h36892131;
      expv[32] = 30'h273fd8d0;
      expv[33] = 30'h27569923;
      expv[34] = 30'h35ac8e58;
      expv[35] = 30'h0593be74;
      expv[36] = 30'h1e35bdde;
      expv[37] = 30'h08136376;
      expv[38] = 30'h27d06663;
      expv[39] = 30'h363e1ffe;
      expv[40] = 30'h205053ed;
      expv[41] = 30'h2796e04f;
      expv[42] = 30'h0f9a5939;
      expv[43] = 30'h100da77d;
      expv[44] = 30'h1b16e1f2;
      expv[45] = 30'h34800abf;
      expv[46] = 30'h31e4a4e6;
      expv[47] = 30'h33adeddb;
      expv[48] = 30'h35238aae;
      expv[49] = 30'h08afa981;
      expv[50] = 30'h341c1af8;
      expv[51] = 30'h366ada99;
      expv[52] = 30'h15382e07;
      expv[53] = 30'h38e8d2ad;
      expv[54] = 30'h22411b76;
      expv[55] = 30'h08452274;
      expv[56] = 30'h3247e033;
      expv[57] = 30'h1ff40135;
      expv[58] = 30'h258da04a;
      expv[59] = 30'h06a40f1e;
      expv[60] = 30'h3dde2254;
      expv[61] = 30'h353cb291;
      expv[62] = 30'h0cde4969;
      expv[63] = 30'h3b4a6ad1;
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
