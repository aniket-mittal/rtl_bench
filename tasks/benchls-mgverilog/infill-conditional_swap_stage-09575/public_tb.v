// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09575 dut (
    .clk(clk),
    .itr(in_vec[67:67]),
    .ct(in_vec[66:64]),
    .x0(in_vec[63:32]),
    .x1(in_vec[31:0]),
    .y0(out_vec[63:32]),
    .y1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hfa77aabceb25b74f2;
    stim[1] = 68'h5e7fe640c9eb56e47;
    stim[2] = 68'h8a1fe2b73b256a427;
    stim[3] = 68'h1bf582b59525d9df2;
    stim[4] = 68'h2545a22020a917f84;
    stim[5] = 68'h3c5fe3b24d39ac09c;
    stim[6] = 68'h7a95326fb05a5b284;
    stim[7] = 68'h0a644808aecb57011;
    stim[8] = 68'hd02086edb8f3df503;
    stim[9] = 68'h0b848b36876d0877f;
    stim[10] = 68'hf4a746140556d3586;
    stim[11] = 68'hc54015f76d45217fd;
    stim[12] = 68'hb5a0dac8d1fef1372;
    stim[13] = 68'hcf2853972a11c0ab3;
    stim[14] = 68'h3ad07c16b50e4f7c1;
    stim[15] = 68'h4a67ceeb596ed8093;
    stim[16] = 68'h605c6e6a1b5deb3bd;
    stim[17] = 68'h73ce6980c5bd23e66;
    stim[18] = 68'h63e9dfc4453f077f2;
    stim[19] = 68'hdd20d1d76b89bca98;
    stim[20] = 68'h869b280651a53c78d;
    stim[21] = 68'hdab9014cb5575221f;
    stim[22] = 68'hab813043c32c2b1a3;
    stim[23] = 68'hb87efc89be4b8dc0e;
    stim[24] = 68'hc0ce59fe0c5649e06;
    stim[25] = 68'h3f788fe09e48bec53;
    stim[26] = 68'h61ef02671b93bb20c;
    stim[27] = 68'h347b4c5ab0e2a2548;
    stim[28] = 68'h6eddb8058b13a6f34;
    stim[29] = 68'h2a753ddcc9cc5a59c;
    stim[30] = 68'head259d0e2aea3910;
    stim[31] = 68'h7c69c405fbc437553;
    stim[32] = 68'h3e42215228f54f72e;
    stim[33] = 68'h2379284a75254822c;
    stim[34] = 68'hf691200c4fe2a9b70;
    stim[35] = 68'h35ee3b1f4300d44cf;
    stim[36] = 68'hb233d8c6f33a2204f;
    stim[37] = 68'h4700950766c0a8219;
    stim[38] = 68'hac8a67378f6b9b579;
    stim[39] = 68'h661a8700dd0529d00;
    stim[40] = 68'h82264ccd569577498;
    stim[41] = 68'h93858f9ecd69a1203;
    stim[42] = 68'h00a60c4e6d79f32ce;
    stim[43] = 68'habd68bc3b41eb6e2a;
    stim[44] = 68'hff9b115ca8cd627c8;
    stim[45] = 68'hda936ac814d8fc20d;
    stim[46] = 68'h4eeeda676b4acb2b7;
    stim[47] = 68'hbbdd891374eade7dc;
    stim[48] = 68'hdac7a0b650f5b7946;
    stim[49] = 68'hbda3a30cc0b253668;
    stim[50] = 68'hb609b7e8a9fae93e4;
    stim[51] = 68'h06aadeaf10ab7a20b;
    stim[52] = 68'h01f10a26389693403;
    stim[53] = 68'ha66b742b2534905e5;
    stim[54] = 68'hf7af14c56d8902861;
    stim[55] = 68'h121ce072844f4f597;
    stim[56] = 68'h48e7c1b9cf945aa9c;
    stim[57] = 68'he65450ffc8a4a3805;
    stim[58] = 68'h2a5b39621a78991e4;
    stim[59] = 68'hb8a79eae8b5b4fd2b;
    stim[60] = 68'he2e0f3392b795c676;
    stim[61] = 68'hef9f49bce783d2cce;
    stim[62] = 68'h7d3ce7c76c0f86b5e;
    stim[63] = 68'h9dd93acfbb4fb18f1;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxx6xxxxxxx6xxx;
      expv[4] = 64'ha1fe2b73b256a427;
      expv[5] = 64'hbf582b59525d9df2;
      expv[6] = 64'h0a917f84545a2202;
      expv[7] = 64'hd39ac09cc5fe3b24;
      expv[8] = 64'h05a5b284a95326fb;
      expv[9] = 64'hecb57011a644808a;
      expv[10] = 64'h02086edb8f3df503;
      expv[11] = 64'h76d0877fb848b368;
      expv[12] = 64'h4a746140556d3586;
      expv[13] = 64'hd45217fd54015f76;
      expv[14] = 64'h5a0dac8d1fef1372;
      expv[15] = 64'hf2853972a11c0ab3;
      expv[16] = 64'h50e4f7c1ad07c16b;
      expv[17] = 64'ha67ceeb596ed8093;
      expv[18] = 64'hb5deb3bd05c6e6a1;
      expv[19] = 64'h3ce6980c5bd23e66;
      expv[20] = 64'h3e9dfc4453f077f2;
      expv[21] = 64'hd20d1d76b89bca98;
      expv[22] = 64'h69b280651a53c78d;
      expv[23] = 64'hab9014cb5575221f;
      expv[24] = 64'h32c2b1a3b813043c;
      expv[25] = 64'h87efc89be4b8dc0e;
      expv[26] = 64'hc5649e060ce59fe0;
      expv[27] = 64'he48bec53f788fe09;
      expv[28] = 64'h1ef02671b93bb20c;
      expv[29] = 64'h0e2a254847b4c5ab;
      expv[30] = 64'heddb8058b13a6f34;
      expv[31] = 64'h9cc5a59ca753ddcc;
      expv[32] = 64'had259d0e2aea3910;
      expv[33] = 64'hbc437553c69c405f;
      expv[34] = 64'he42215228f54f72e;
      expv[35] = 64'h379284a75254822c;
      expv[36] = 64'hfe2a9b70691200c4;
      expv[37] = 64'h300d44cf5ee3b1f4;
      expv[38] = 64'h233d8c6f33a2204f;
      expv[39] = 64'h6c0a821970095076;
      expv[40] = 64'hf6b9b579c8a67378;
      expv[41] = 64'h61a8700dd0529d00;
      expv[42] = 64'h695774982264ccd5;
      expv[43] = 64'h3858f9ecd69a1203;
      expv[44] = 64'hd79f32ce0a60c4e6;
      expv[45] = 64'h41eb6e2abd68bc3b;
      expv[46] = 64'h8cd627c8f9b115ca;
      expv[47] = 64'h4d8fc20da936ac81;
      expv[48] = 64'heeeda676b4acb2b7;
      expv[49] = 64'hbdd891374eade7dc;
      expv[50] = 64'hac7a0b650f5b7946;
      expv[51] = 64'h0b253668da3a30cc;
      expv[52] = 64'h609b7e8a9fae93e4;
      expv[53] = 64'h0ab7a20b6aadeaf1;
      expv[54] = 64'h896934031f10a263;
      expv[55] = 64'h534905e566b742b2;
      expv[56] = 64'hd89028617af14c56;
      expv[57] = 64'h44f4f59721ce0728;
      expv[58] = 64'h8e7c1b9cf945aa9c;
      expv[59] = 64'h8a4a380565450ffc;
      expv[60] = 64'ha5b39621a78991e4;
      expv[61] = 64'h8a79eae8b5b4fd2b;
      expv[62] = 64'hb795c6762e0f3392;
      expv[63] = 64'h783d2ccef9f49bce;
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
