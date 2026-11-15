// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061868 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h4844925d12f2d7;
    stim[1] = 55'h7bb5e990121fae;
    stim[2] = 55'h6a3079971c7acd;
    stim[3] = 55'h1e453686e13e6f;
    stim[4] = 55'h4f8e79bc45a344;
    stim[5] = 55'h618ddcee79205e;
    stim[6] = 55'h757804b6e9d6e4;
    stim[7] = 55'h699b742e6da964;
    stim[8] = 55'h587163bd9af9a2;
    stim[9] = 55'h050108da7c6bc7;
    stim[10] = 55'h232d135acabea8;
    stim[11] = 55'h6b973441a2e581;
    stim[12] = 55'h4abf6b02ff6de2;
    stim[13] = 55'h3d799f522cb0df;
    stim[14] = 55'h4879f967b90136;
    stim[15] = 55'h17188d39d38126;
    stim[16] = 55'h7630bcbef48ddf;
    stim[17] = 55'h394689ffe7cf2d;
    stim[18] = 55'h665524eb76e701;
    stim[19] = 55'h474e823191131d;
    stim[20] = 55'h40ea8eee0128d8;
    stim[21] = 55'h5ce2818ef8c6e7;
    stim[22] = 55'h67b24eea687cd8;
    stim[23] = 55'h0309d1f2f99495;
    stim[24] = 55'h05cfa81d41f20d;
    stim[25] = 55'h78e3aca2178b56;
    stim[26] = 55'h5b83c5feac72f6;
    stim[27] = 55'h12511ff6790f34;
    stim[28] = 55'h01e4c5f61dd1ed;
    stim[29] = 55'h7f917f909a72f2;
    stim[30] = 55'h0f15d6bc671a28;
    stim[31] = 55'h68c80a19ef187b;
    stim[32] = 55'h336e5739f851dc;
    stim[33] = 55'h1d5039800b8b67;
    stim[34] = 55'h5720f60e9689ca;
    stim[35] = 55'h4a057ba44e9ae1;
    stim[36] = 55'h3b7628ce85c97a;
    stim[37] = 55'h0fbbf343c689ec;
    stim[38] = 55'h42a2e66ed2d84e;
    stim[39] = 55'h3dc34c5fc04843;
    stim[40] = 55'h4776df537fcb45;
    stim[41] = 55'h49a99c64c88ad0;
    stim[42] = 55'h76c0216317bd4f;
    stim[43] = 55'h69eea67c89ddf7;
    stim[44] = 55'h079487c11cf892;
    stim[45] = 55'h60802b776c4c7e;
    stim[46] = 55'h19256d57170df9;
    stim[47] = 55'h0f3922f7c96861;
    stim[48] = 55'h679ca694b38656;
    stim[49] = 55'h1098b108992560;
    stim[50] = 55'h6752abc08b962c;
    stim[51] = 55'h49506b98a4b63e;
    stim[52] = 55'h40cb84ebd7c947;
    stim[53] = 55'h55c6d7247f66be;
    stim[54] = 55'h63d06ef0e7f247;
    stim[55] = 55'h38cdc71dd08c3b;
    stim[56] = 55'h0c767af0c8d71a;
    stim[57] = 55'h4b1199eb7fec9d;
    stim[58] = 55'h33b216b3081931;
    stim[59] = 55'h02d1f872e31191;
    stim[60] = 55'h06379b332f35cb;
    stim[61] = 55'h6102e68f21254d;
    stim[62] = 55'h53f953dde0d797;
    stim[63] = 55'h54bbdce7258143;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h4844925d12f2d7;
      expv[2] = 55'h7bb5e990121fae;
      expv[3] = 55'h6a3079971c7acd;
      expv[4] = 55'h1e453686e13e6f;
      expv[5] = 55'h4f8e79bc45a344;
      expv[6] = 55'h618ddcee79205e;
      expv[7] = 55'h757804b6e9d6e4;
      expv[8] = 55'h699b742e6da964;
      expv[9] = 55'h587163bd9af9a2;
      expv[10] = 55'h050108da7c6bc7;
      expv[11] = 55'h232d135acabea8;
      expv[12] = 55'h6b973441a2e581;
      expv[13] = 55'h4abf6b02ff6de2;
      expv[14] = 55'h3d799f522cb0df;
      expv[15] = 55'h4879f967b90136;
      expv[16] = 55'h17188d39d38126;
      expv[17] = 55'h7630bcbef48ddf;
      expv[18] = 55'h394689ffe7cf2d;
      expv[19] = 55'h665524eb76e701;
      expv[20] = 55'h474e823191131d;
      expv[21] = 55'h40ea8eee0128d8;
      expv[22] = 55'h5ce2818ef8c6e7;
      expv[23] = 55'h67b24eea687cd8;
      expv[24] = 55'h0309d1f2f99495;
      expv[25] = 55'h05cfa81d41f20d;
      expv[26] = 55'h78e3aca2178b56;
      expv[27] = 55'h5b83c5feac72f6;
      expv[28] = 55'h12511ff6790f34;
      expv[29] = 55'h01e4c5f61dd1ed;
      expv[30] = 55'h7f917f909a72f2;
      expv[31] = 55'h0f15d6bc671a28;
      expv[32] = 55'h68c80a19ef187b;
      expv[33] = 55'h336e5739f851dc;
      expv[34] = 55'h1d5039800b8b67;
      expv[35] = 55'h5720f60e9689ca;
      expv[36] = 55'h4a057ba44e9ae1;
      expv[37] = 55'h3b7628ce85c97a;
      expv[38] = 55'h0fbbf343c689ec;
      expv[39] = 55'h42a2e66ed2d84e;
      expv[40] = 55'h3dc34c5fc04843;
      expv[41] = 55'h4776df537fcb45;
      expv[42] = 55'h49a99c64c88ad0;
      expv[43] = 55'h76c0216317bd4f;
      expv[44] = 55'h69eea67c89ddf7;
      expv[45] = 55'h079487c11cf892;
      expv[46] = 55'h60802b776c4c7e;
      expv[47] = 55'h19256d57170df9;
      expv[48] = 55'h0f3922f7c96861;
      expv[49] = 55'h679ca694b38656;
      expv[50] = 55'h1098b108992560;
      expv[51] = 55'h6752abc08b962c;
      expv[52] = 55'h49506b98a4b63e;
      expv[53] = 55'h40cb84ebd7c947;
      expv[54] = 55'h55c6d7247f66be;
      expv[55] = 55'h63d06ef0e7f247;
      expv[56] = 55'h38cdc71dd08c3b;
      expv[57] = 55'h0c767af0c8d71a;
      expv[58] = 55'h4b1199eb7fec9d;
      expv[59] = 55'h33b216b3081931;
      expv[60] = 55'h02d1f872e31191;
      expv[61] = 55'h06379b332f35cb;
      expv[62] = 55'h6102e68f21254d;
      expv[63] = 55'h53f953dde0d797;
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
