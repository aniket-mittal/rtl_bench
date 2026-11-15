// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130619 dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .wb_adr_i(in_vec[43:36]),
    .wb_dat_i(in_vec[35:20]),
    .wb_we_i(in_vec[19:19]),
    .wb_stb_i(in_vec[18:18]),
    .wb_cyc_i(in_vec[17:17]),
    .drp_rdy(in_vec[16:16]),
    .drp_di(in_vec[15:0]),
    .wb_dat_o(out_vec[42:27]),
    .wb_ack_o(out_vec[26:26]),
    .drp_addr(out_vec[25:18]),
    .drp_do(out_vec[17:2]),
    .drp_en(out_vec[1:1]),
    .drp_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1ccb22eee077;
    stim[1] = 45'h1bd409247a06;
    stim[2] = 45'h033402c0f19f;
    stim[3] = 45'h0570063f8946;
    stim[4] = 45'h0b813218f678;
    stim[5] = 45'h0ad43eb8e624;
    stim[6] = 45'h0caf1bf8b702;
    stim[7] = 45'h03d36c41bb9b;
    stim[8] = 45'h0f0a6cfbe5ff;
    stim[9] = 45'h05a7a8e1286d;
    stim[10] = 45'h0e8cf1707f6c;
    stim[11] = 45'h013aab21ce45;
    stim[12] = 45'h01cbc2761744;
    stim[13] = 45'h0a5686e390b0;
    stim[14] = 45'h0ca90a876289;
    stim[15] = 45'h04c98fb64d0e;
    stim[16] = 45'h06cbe2b158db;
    stim[17] = 45'h006252ecf342;
    stim[18] = 45'h027003132df2;
    stim[19] = 45'h06d1be1e5b47;
    stim[20] = 45'h0e720dfbd181;
    stim[21] = 45'h0fa561ed4575;
    stim[22] = 45'h0aa1e8142c61;
    stim[23] = 45'h0f63b3a8bd2d;
    stim[24] = 45'h0ca330e114e8;
    stim[25] = 45'h01aae13f6439;
    stim[26] = 45'h0f08d3cb0c83;
    stim[27] = 45'h05d7dcc7f943;
    stim[28] = 45'h02e311c4c28d;
    stim[29] = 45'h0ff3070ec69f;
    stim[30] = 45'h0705f142f17b;
    stim[31] = 45'h023fc5abe289;
    stim[32] = 45'h0b90d0c97700;
    stim[33] = 45'h0a9ebe4d6dbb;
    stim[34] = 45'h0686fd695a94;
    stim[35] = 45'h1c65c8b159d4;
    stim[36] = 45'h052ae5c9f40e;
    stim[37] = 45'h08e103a918c0;
    stim[38] = 45'h0a6e0872ab28;
    stim[39] = 45'h034abe02598e;
    stim[40] = 45'h0d604b1a5c94;
    stim[41] = 45'h022aa72c83d0;
    stim[42] = 45'h07d02caaea93;
    stim[43] = 45'h09353e2c0a9f;
    stim[44] = 45'h014ae0ee44aa;
    stim[45] = 45'h075005089d83;
    stim[46] = 45'h052dfc7d931d;
    stim[47] = 45'h02fe27a5a348;
    stim[48] = 45'h011b7b0a8f48;
    stim[49] = 45'h0b9220bdee14;
    stim[50] = 45'h041af5a10d8d;
    stim[51] = 45'h064f3327c471;
    stim[52] = 45'h08c6be1dc0e4;
    stim[53] = 45'h0751e5239f52;
    stim[54] = 45'h0276c39b8c74;
    stim[55] = 45'h06bfd8f416d1;
    stim[56] = 45'h0a5e54aaf79c;
    stim[57] = 45'h0308a0850370;
    stim[58] = 45'h01468c181d08;
    stim[59] = 45'h03659905a896;
    stim[60] = 45'h0e327d178d70;
    stim[61] = 45'h09b884198a3d;
    stim[62] = 45'h0b1526599af2;
    stim[63] = 45'h05ab3d245d4f;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'hxxxxxxxxxxx;
      expv[2] = 43'hxxxxxxxxxxx;
      expv[3] = 43'hxxxxxxxxxxx;
      expv[4] = 43'hxxxxxxxxxxx;
      expv[5] = 43'hxxxxxe04c84;
      expv[6] = 43'hxxxxxb50fac;
      expv[7] = 43'hxxxxx2bc6fc;
      expv[8] = 43'hxxxxxf7c6fe;
      expv[9] = 43'h72fffc29b3c;
      expv[10] = 43'h72ffbc29b3c;
      expv[11] = 43'h72ffbc29b3c;
      expv[12] = 43'h72ffbc29b3c;
      expv[13] = 43'h72ffbc29b3c;
      expv[14] = 43'h72ffa969b3e;
      expv[15] = 43'h3144f2a9b3c;
      expv[16] = 43'h268772a9b3c;
      expv[17] = 43'h2c6df2a9b3c;
      expv[18] = 43'h2c6db2a9b3c;
      expv[19] = 43'h2c6db2a9b3c;
      expv[20] = 43'h2c6db2a9b3c;
      expv[21] = 43'h2c6db9c837f;
      expv[22] = 43'h22bafe95878;
      expv[23] = 43'h22babe95878;
      expv[24] = 43'h22babe95878;
      expv[25] = 43'h22babe95878;
      expv[26] = 43'h22babe95878;
      expv[27] = 43'h22babc234f3;
      expv[28] = 43'h7ca1d7634f0;
      expv[29] = 43'h6146d7634f0;
      expv[30] = 43'h614697634f0;
      expv[31] = 43'h61469c234f0;
      expv[32] = 43'h614688ff16b;
      expv[33] = 43'h3b806e43430;
      expv[34] = 43'h3b802e43430;
      expv[35] = 43'h3b802e43430;
      expv[36] = 43'h3b802e43430;
      expv[37] = 43'h3b802e43430;
      expv[38] = 43'h3b802e43430;
      expv[39] = 43'h3b802e43430;
      expv[40] = 43'h3b802e43430;
      expv[41] = 43'h3b802e43430;
      expv[42] = 43'h3b802e43430;
      expv[43] = 43'h3b802e43430;
      expv[44] = 43'h3b802e43430;
      expv[45] = 43'h3b802e43430;
      expv[46] = 43'h3b801d40140;
      expv[47] = 43'h3b8014b7f1f;
      expv[48] = 43'h51a44bf7f1c;
      expv[49] = 43'h51a40bf7f1c;
      expv[50] = 43'h51a40bf7f1c;
      expv[51] = 43'h51a40bf7f1c;
      expv[52] = 43'h51a40bf7f1c;
      expv[53] = 43'h51a4231af87;
      expv[54] = 43'h4fa95d5af84;
      expv[55] = 43'h4fa91d5af84;
      expv[56] = 43'h4fa91d5af84;
      expv[57] = 43'h4fa91d5af84;
      expv[58] = 43'h4fa91d5af84;
      expv[59] = 43'h4fa91d5af84;
      expv[60] = 43'h4fa91d5af84;
      expv[61] = 43'h4fa91d5af84;
      expv[62] = 43'h4fa926e2107;
      expv[63] = 43'h4d796c54994;
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
