// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04020 dut (
    .avs_s1_clk(clk),
    .avs_s1_address(in_vec[68:67]),
    .avs_s1_read(in_vec[66:66]),
    .avs_s1_writedata(in_vec[65:34]),
    .avs_s1_write(in_vec[33:33]),
    .avs_s1_reset(in_vec[32:32]),
    .avs_s1_export_readdata(in_vec[31:0]),
    .avs_s1_readdata(out_vec[69:38]),
    .avs_s1_export_clk(out_vec[37:37]),
    .avs_s1_export_address(out_vec[36:35]),
    .avs_s1_export_read(out_vec[34:34]),
    .avs_s1_export_writedata(out_vec[33:2]),
    .avs_s1_export_write(out_vec[1:1]),
    .avs_s1_export_reset(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h0e296010c3b5de4448;
    stim[1] = 69'h1a552184e31eb00c8a;
    stim[2] = 69'h1fba6c6decb1db1868;
    stim[3] = 69'h1a04d1cb36c9e319d0;
    stim[4] = 69'h013469bc04caaab7d3;
    stim[5] = 69'h0cf51fffd87205bd5a;
    stim[6] = 69'h0e1f9c05925deefb16;
    stim[7] = 69'h0e21e226dc33a37aa8;
    stim[8] = 69'h169049f86288ad67c4;
    stim[9] = 69'h008eb56d34770ae9ca;
    stim[10] = 69'h156d97d82c4440079c;
    stim[11] = 69'h0492d6fe4806d8b570;
    stim[12] = 69'h0acb61c9ee6cc6ad11;
    stim[13] = 69'h1aca29d85a03341861;
    stim[14] = 69'h1d4e701b4c551d59d1;
    stim[15] = 69'h12e0e6735a8ec1e63c;
    stim[16] = 69'h04d494689ae7e95a14;
    stim[17] = 69'h1a119fc978aaab96aa;
    stim[18] = 69'h1747989790c90ed135;
    stim[19] = 69'h1ef4208f72d79dd475;
    stim[20] = 69'h0277e24f1275ef65ab;
    stim[21] = 69'h1b319af1dc03cf0b7c;
    stim[22] = 69'h1b3aa8e33ec14c5a39;
    stim[23] = 69'h1d19741fa886c9b6ec;
    stim[24] = 69'h1786e5d720e3537d7d;
    stim[25] = 69'h118c9af6d0067da890;
    stim[26] = 69'h12d2a1f222d66b7869;
    stim[27] = 69'h0486d9b7f668a447fd;
    stim[28] = 69'h0d3cbe7ab4cc541735;
    stim[29] = 69'h052490016a9a86ce72;
    stim[30] = 69'h1929f1033a04258f23;
    stim[31] = 69'h1a8ea64c4a4b5be398;
    stim[32] = 69'h01b5e5441e25b725f3;
    stim[33] = 69'h073bbae03a21d9b933;
    stim[34] = 69'h07a3c42696322e87f4;
    stim[35] = 69'h0a5adf916ad4a47a47;
    stim[36] = 69'h03b5f507debd2a6014;
    stim[37] = 69'h1610eede721dce7516;
    stim[38] = 69'h0f8ee5502873d2cdef;
    stim[39] = 69'h06b9f63722dbf12292;
    stim[40] = 69'h14811eb6f6dcc95c23;
    stim[41] = 69'h0f7273251fd2618e53;
    stim[42] = 69'h050166820ad618a975;
    stim[43] = 69'h0cea5d9e74a7b13890;
    stim[44] = 69'h1e1df06c8885aa9e7f;
    stim[45] = 69'h03ce8be0cea5df6526;
    stim[46] = 69'h1bc78834041db2c64c;
    stim[47] = 69'h0c1e755ac4f1ef3fcf;
    stim[48] = 69'h085610870ed739387d;
    stim[49] = 69'h1da0f5a5a8f0b8afec;
    stim[50] = 69'h1f42a20e066b2b92e7;
    stim[51] = 69'h1c9c0210ec9a65b56a;
    stim[52] = 69'h026425c19aaa9b6ebd;
    stim[53] = 69'h0d92ca5b66d5c6cdf7;
    stim[54] = 69'h1a196063de97e0175b;
    stim[55] = 69'h028ff226b79ed5a83b;
    stim[56] = 69'h0bdc2860d651d5bc8d;
    stim[57] = 69'h0b760bfa5e22023dad;
    stim[58] = 69'h04d881127c64af81da;
    stim[59] = 69'h06dc4d98941e8d30d3;
    stim[60] = 69'h064fd2ced27c03cbe9;
    stim[61] = 69'h13c0cbf29610694168;
    stim[62] = 69'h1e53c04e4c6fd2bbf7;
    stim[63] = 69'h0086702ed281839b92;
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
      expv[0] = 70'h2d7791120e296010c3;
      expv[1] = 70'h07ac03229a552184e3;
      expv[2] = 70'h2c76c61a1fba6c6dec;
      expv[3] = 70'h3278c6741a04d1cb36;
      expv[4] = 70'h32aaadf4c13469bc04;
      expv[5] = 70'h1c816f568cf51fffd8;
      expv[6] = 70'h177bbec58e1f9c0592;
      expv[7] = 70'h0ce8deaa0e21e226dc;
      expv[8] = 70'h222b59f1169049f862;
      expv[9] = 70'h1dc2ba72808eb56d34;
      expv[10] = 70'h111001e7156d97d82c;
      expv[11] = 70'h01b62d5c0492d6fe48;
      expv[12] = 70'h1b31ab444acb61c9ee;
      expv[13] = 70'h00cd06185aca29d85a;
      expv[14] = 70'h154756745d4e701b4c;
      expv[15] = 70'h23b0798f12e0e6735a;
      expv[16] = 70'h39fa568504d494689a;
      expv[17] = 70'h2aaae5aa9a119fc978;
      expv[18] = 70'h3243b44d5747989790;
      expv[19] = 70'h35e7751d5ef4208f72;
      expv[20] = 70'h1d7bd96ac277e24f12;
      expv[21] = 70'h00f3c2df1b319af1dc;
      expv[22] = 70'h3053168e5b3aa8e33e;
      expv[23] = 70'h21b26dbb1d19741fa8;
      expv[24] = 70'h38d4df5f5786e5d720;
      expv[25] = 70'h019f6a24118c9af6d0;
      expv[26] = 70'h359ade1a52d2a1f222;
      expv[27] = 70'h1a2911ff4486d9b7f6;
      expv[28] = 70'h331505cd4d3cbe7ab4;
      expv[29] = 70'h26a1b39c852490016a;
      expv[30] = 70'h010963c8d929f1033a;
      expv[31] = 70'h12d6f8e61a8ea64c4a;
      expv[32] = 70'h096dc97cc1b5e5441e;
      expv[33] = 70'h08766e4cc73bbae03a;
      expv[34] = 70'h0c8ba1fd07a3c42696;
      expv[35] = 70'h35291e91ca5adf916a;
      expv[36] = 70'h2f4a980503b5f507de;
      expv[37] = 70'h07739d459610eede72;
      expv[38] = 70'h1cf4b37bcf8ee55028;
      expv[39] = 70'h36fc48a486b9f63722;
      expv[40] = 70'h37325708d4811eb6f6;
      expv[41] = 70'h34986394cf7273251f;
      expv[42] = 70'h35862a5d450166820a;
      expv[43] = 70'h29ec4e240cea5d9e74;
      expv[44] = 70'h216aa79fde1df06c88;
      expv[45] = 70'h2977d94983ce8be0ce;
      expv[46] = 70'h076cb1931bc7883404;
      expv[47] = 70'h3c7bcff3cc1e755ac4;
      expv[48] = 70'h35ce4e1f485610870e;
      expv[49] = 70'h3c2e2bfb1da0f5a5a8;
      expv[50] = 70'h1acae4b9df42a20e06;
      expv[51] = 70'h26996d5a9c9c0210ec;
      expv[52] = 70'h2aa6dbaf426425c19a;
      expv[53] = 70'h3571b37dcd92ca5b66;
      expv[54] = 70'h25f805d6da196063de;
      expv[55] = 70'h27b56a0ec28ff226b7;
      expv[56] = 70'h14756f234bdc2860d6;
      expv[57] = 70'h08808f6b4b760bfa5e;
      expv[58] = 70'h192be07684d881127c;
      expv[59] = 70'h07a34c34c6dc4d9894;
      expv[60] = 70'h1f00f2fa464fd2ced2;
      expv[61] = 70'h041a505a13c0cbf296;
      expv[62] = 70'h1bf4aefdde53c04e4c;
      expv[63] = 70'h2060e6e48086702ed2;
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
