// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018698 dut (
    .clk_75m(clk),
    .host_rst(in_vec[70:70]),
    .cs2phy_data(in_vec[69:38]),
    .link_up(in_vec[37:37]),
    .fsm2phy_k(in_vec[36:36]),
    .rxdata_fis(in_vec[35:4]),
    .rxcharisk(in_vec[3:0]),
    .phy2cs_data(out_vec[65:34]),
    .phy2cs_k(out_vec[33:33]),
    .txdata_fis(out_vec[32:1]),
    .tx_charisk_fis(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h4fe2a0a85fe44dacc8;
    stim[1] = 71'h6dd70f4566651ecdbc;
    stim[2] = 71'h33b08510a6f3c7a0d4;
    stim[3] = 71'h319e7277a2e0ff127d;
    stim[4] = 71'h143d77343f7c418e49;
    stim[5] = 71'h14293947c608e429ff;
    stim[6] = 71'h34c885f0b37d3ba22c;
    stim[7] = 71'h3da2ec1f12dc9548cf;
    stim[8] = 71'h057904002b0f16c51b;
    stim[9] = 71'h145d5905bd07a35f85;
    stim[10] = 71'h61f8aba9cefd828f7e;
    stim[11] = 71'h353844f2cdf629be14;
    stim[12] = 71'h311e48dac591611e1a;
    stim[13] = 71'h39106d665632d10da6;
    stim[14] = 71'h27edf305b66303ca84;
    stim[15] = 71'h30e6d42b817640f82f;
    stim[16] = 71'h0a83f3bbe68167885b;
    stim[17] = 71'h01d1c8d1bb07b5f5f4;
    stim[18] = 71'h2192d15cd04fc95984;
    stim[19] = 71'h07bcc3e162c45bfae1;
    stim[20] = 71'h16f55df979db823925;
    stim[21] = 71'h21ae947736ba76546a;
    stim[22] = 71'h0861e08101cdfa739c;
    stim[23] = 71'h3e0a2eba1675effd41;
    stim[24] = 71'h07b10583ec113b843c;
    stim[25] = 71'h5a9f499c72bcf1c82f;
    stim[26] = 71'h0555f4be96b6b54cb8;
    stim[27] = 71'h3f170a1d7ff81cbd1c;
    stim[28] = 71'h372ff2bfbfd96f2fe7;
    stim[29] = 71'h2566cfd81f52ba0bf9;
    stim[30] = 71'h18db50128fcc9439d5;
    stim[31] = 71'h09080f5a20e7773b13;
    stim[32] = 71'h35a12bd7c9756cd075;
    stim[33] = 71'h1a4c3c7c0a0e9f7ec6;
    stim[34] = 71'h1037af6d8d4c29a90a;
    stim[35] = 71'h126c5deff7234b002b;
    stim[36] = 71'h0e05ea8023fd69fa9d;
    stim[37] = 71'h01a26020c627f5d764;
    stim[38] = 71'h3f7c95758d941f59ac;
    stim[39] = 71'h1a02e87ce40b170c6d;
    stim[40] = 71'h068ae01af839277c67;
    stim[41] = 71'h044f25626c142f7024;
    stim[42] = 71'h1f444c338cc518a1d8;
    stim[43] = 71'h3aab906269e7394199;
    stim[44] = 71'h0061397a1731d24735;
    stim[45] = 71'h0310f71b778b55c878;
    stim[46] = 71'h2f734cdcb0c1196a3e;
    stim[47] = 71'h069dc824de0f48198a;
    stim[48] = 71'h35882f3135a3010fe7;
    stim[49] = 71'h1f1296b3c01c5ccb82;
    stim[50] = 71'h205488379bce4beb9e;
    stim[51] = 71'h323238606db1348a52;
    stim[52] = 71'h0b0a94f6a4063c4753;
    stim[53] = 71'h1e00691f573ac9ef35;
    stim[54] = 71'h22d751f8a593cce681;
    stim[55] = 71'h33fdb6cadf8180bf4b;
    stim[56] = 71'h002020b8b60a593515;
    stim[57] = 71'h272e7595a30e7882a8;
    stim[58] = 71'h25de8b51a2d1f102dd;
    stim[59] = 71'h15eb6f9a191bc9d26f;
    stim[60] = 71'h1c6ab98a81df2a197e;
    stim[61] = 71'h374f9da8d7c8359ad6;
    stim[62] = 71'h249727474c82747297;
    stim[63] = 71'h2e7c9bc5167c47150b;
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
      expv[0] = 66'h2d6d655f07f150543;
      expv[1] = 66'h2d6d655f16eb87a2a;
      expv[2] = 66'h2d6d655f19d842884;
      expv[3] = 66'h1e836d6d78cf393bc;
      expv[4] = 66'h3c49de836a1ebb9a1;
      expv[5] = 66'h06393c49ea149ca3e;
      expv[6] = 66'h2d6d655f3a6442f85;
      expv[7] = 66'h2d6d655f3ed1760f9;
      expv[8] = 66'h2d6d655f22bc82000;
      expv[9] = 66'h2d6d655f2a2eac82d;
      expv[10] = 66'h2d6d655f10fc55d4e;
      expv[11] = 66'h2d6d655f1a9c22796;
      expv[12] = 66'h2d6d655f388f246d6;
      expv[13] = 66'h2d6d655f3c8836b33;
      expv[14] = 66'h2d6d655f33f6f982d;
      expv[15] = 66'h0f2a2d6d78736a15c;
      expv[16] = 66'h2d6d655f2541f9dde;
      expv[17] = 66'h2d6d655f20e8e468d;
      expv[18] = 66'h17d7ed6d70c968ae7;
      expv[19] = 66'h2d6d655f23de61f0a;
      expv[20] = 66'h0b116febab7aaefcb;
      expv[21] = 66'h276e08e4b0d74a3b9;
      expv[22] = 66'h1ae9d951a430f0408;
      expv[23] = 66'h2d6d655f3f05175d1;
      expv[24] = 66'h2d6d655f23d882c1e;
      expv[25] = 66'h2d6d655f0d4fa4ce3;
      expv[26] = 66'h2d6d655f02aafa5f5;
      expv[27] = 66'h2d6d655f3f8b850eb;
      expv[28] = 66'h2d6d655f3b97f95fd;
      expv[29] = 66'h2d6d655f32b367ec1;
      expv[30] = 66'h2d6d655f2c6da8094;
      expv[31] = 66'h2d6d655f248407ad0;
      expv[32] = 66'h2d6d655f3ad095ebe;
      expv[33] = 66'h2d6d655f2d261e3e0;
      expv[34] = 66'h2d6d655f281bd7b6c;
      expv[35] = 66'h2d6d655f29362ef7f;
      expv[36] = 66'h2d6d655f2702f5400;
      expv[37] = 66'h2d6d655f20d130106;
      expv[38] = 66'h2d6d655f3fbe4abac;
      expv[39] = 66'h2d6d655f2d01743e6;
      expv[40] = 66'h2d6d655f2345700d7;
      expv[41] = 66'h2d6d655f222792b12;
      expv[42] = 66'h3dc0ad6d6fa22619c;
      expv[43] = 66'h2d6d655f3d55c8312;
      expv[44] = 66'h2d6d655f20309cbd1;
      expv[45] = 66'h2d6d655f21887b8db;
      expv[46] = 66'h21ed6d6577b9a66e5;
      expv[47] = 66'h28e1ed6d634ee4127;
      expv[48] = 66'h2d6d655f3ac417989;
      expv[49] = 66'h2d6d655f2f894b59e;
      expv[50] = 66'h2d6d655f302a441bd;
      expv[51] = 66'h2d6d655f39191c302;
      expv[52] = 66'h04d2296d65854a7b4;
      expv[53] = 66'h18f11d44ef00348fb;
      expv[54] = 66'h2d6d655f316ba8fc4;
      expv[55] = 66'h164f339a39fedb657;
      expv[56] = 66'h2d6d655f2010105c5;
      expv[57] = 66'h2d6d655f33973acac;
      expv[58] = 66'h0aad6d6572ef45a8c;
      expv[59] = 66'h0b4aad6d6af5b7cd1;
      expv[60] = 66'h2d6d655f2e355cc54;
      expv[61] = 66'h2d6d655f3ba7ced47;
      expv[62] = 66'h2d6d655f324b93a3a;
      expv[63] = 66'h2d6d655f373e4de29;
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
