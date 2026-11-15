// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04510 dut (
    .clk(clk),
    .address(in_vec[69:67]),
    .chipselect(in_vec[66:66]),
    .in_port(in_vec[65:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[64:64]),
    .out_port(out_vec[63:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h2abfc9fdfd44083cf6;
    stim[1] = 70'h095c8a381963122792;
    stim[2] = 70'h0f99c424c39b7616b4;
    stim[3] = 70'h0d899649cf6d7cc248;
    stim[4] = 70'h0c65db680b0a268191;
    stim[5] = 70'h3feee70726ffc5f5f5;
    stim[6] = 70'h3958b1e593dafdbe77;
    stim[7] = 70'h3e4a0950462fd0085a;
    stim[8] = 70'h23e7b1c9c63f1ce029;
    stim[9] = 70'h1d928d6cfa4162d1ca;
    stim[10] = 70'h0f710d1c7bfff1c816;
    stim[11] = 70'h302f6397233dd913e7;
    stim[12] = 70'h20f4bdb6fff104285c;
    stim[13] = 70'h33221e232e68c1d763;
    stim[14] = 70'h176aa236cf40323435;
    stim[15] = 70'h12d3ed997b10950ab8;
    stim[16] = 70'h17376b9d3774e629d3;
    stim[17] = 70'h1b7587438bda10b6e8;
    stim[18] = 70'h1edac268c35520a8cc;
    stim[19] = 70'h2a4799188a5a2eb3d6;
    stim[20] = 70'h0e2d2b6f4e3226ec4c;
    stim[21] = 70'h210ae7a8df35c8c715;
    stim[22] = 70'h234da2c39f083a8559;
    stim[23] = 70'h2deb7d10b3d4efe185;
    stim[24] = 70'h3e28ddbdd6d6b98a8b;
    stim[25] = 70'h07840406d60fd27a92;
    stim[26] = 70'h2fa5f98efaff33ed0e;
    stim[27] = 70'h3867c485ce1f1f4acc;
    stim[28] = 70'h301d5fc74bc2889e86;
    stim[29] = 70'h0d3afe186248bdfde5;
    stim[30] = 70'h00c86643ee6d0737de;
    stim[31] = 70'h128f678c6e2546073f;
    stim[32] = 70'h236574a8c74650bda0;
    stim[33] = 70'h256ecb064a6fe5568b;
    stim[34] = 70'h052ce004a36ff04e46;
    stim[35] = 70'h071db86023b995c327;
    stim[36] = 70'h230262677aec6ef137;
    stim[37] = 70'h31e124793f5a168b0a;
    stim[38] = 70'h0620fe8cca8f7b2ea1;
    stim[39] = 70'h0e6b2f3176cd0fce89;
    stim[40] = 70'h2ee15a13f26e7bf998;
    stim[41] = 70'h1773c958134df99a99;
    stim[42] = 70'h391a32abe7e53f20eb;
    stim[43] = 70'h1999171806906e5530;
    stim[44] = 70'h000541139ff9383eaa;
    stim[45] = 70'h38acdb88e73a1a66a2;
    stim[46] = 70'h1a766ebe6ee3ca899d;
    stim[47] = 70'h13fc5cff376f0a228f;
    stim[48] = 70'h111bfb1332833a482d;
    stim[49] = 70'h2d203088222e6880fa;
    stim[50] = 70'h1550a9ef7aaad296b4;
    stim[51] = 70'h3603ef36669cb4d349;
    stim[52] = 70'h11a494ab2611537c69;
    stim[53] = 70'h0c87df1f2bb9af3185;
    stim[54] = 70'h34748705f7c2b4c39d;
    stim[55] = 70'h21172b6c13983d4bb4;
    stim[56] = 70'h237c0aae1e2d19762a;
    stim[57] = 70'h1c24d82f2fa150b1f8;
    stim[58] = 70'h05188d8366f1599c1b;
    stim[59] = 70'h2d9d3c962682ae509c;
    stim[60] = 70'h1fcf53f18f51017480;
    stim[61] = 70'h2e6f45966e83996bb3;
    stim[62] = 70'h3bafb6e5325fdead2d;
    stim[63] = 70'h25c60c9282d7e8926c;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00fd27a92e10101b5;
      expv[27] = 65'h000c0129000000000;
      expv[28] = 65'h000c0129000000000;
      expv[29] = 65'h000c0129000000000;
      expv[30] = 65'h000c0129000000000;
      expv[31] = 65'h000c01290321990fb;
      expv[32] = 65'h000c0129000000000;
      expv[33] = 65'h000c0129000000000;
      expv[34] = 65'h06fe5569b00000000;
      expv[35] = 65'h06fe5569b4b380128;
      expv[36] = 65'h06fe5569bc76e1808;
      expv[37] = 65'h06fe5569b00000000;
      expv[38] = 65'h06fe5569b00000000;
      expv[39] = 65'h08f7b2ea1883fa332;
      expv[40] = 65'h08f7b2ea100000000;
      expv[41] = 65'h08100062100000000;
      expv[42] = 65'h08100062100000000;
      expv[43] = 65'h08100062100000000;
      expv[44] = 65'h08100062100000000;
      expv[45] = 65'h081000621015044e7;
      expv[46] = 65'h08100062100000000;
      expv[47] = 65'h08100062100000000;
      expv[48] = 65'h08100062100000000;
      expv[49] = 65'h08100062100000000;
      expv[50] = 65'h08100060100000000;
      expv[51] = 65'h18100060100000000;
      expv[52] = 65'h18100060100000000;
      expv[53] = 65'h181000601aad296b4;
      expv[54] = 65'h18100060100000000;
      expv[55] = 65'h18100060100000000;
      expv[56] = 65'h18100060100000000;
      expv[57] = 65'h18100060100000000;
      expv[58] = 65'h18100060100000000;
      expv[59] = 65'h1f1599c1b462360d9;
      expv[60] = 65'h171518c0300000000;
      expv[61] = 65'h171518c0300000000;
      expv[62] = 65'h17040840000000000;
      expv[63] = 65'h17040840000000000;
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
