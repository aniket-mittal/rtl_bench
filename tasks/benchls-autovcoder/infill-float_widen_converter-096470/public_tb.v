// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096470 dut (
    .in(in_vec[32:0]),
    .out(out_vec[69:5]),
    .exceptionFlags(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0d7a42cfb;
    stim[1] = 33'h1ea13bd42;
    stim[2] = 33'h0891cda31;
    stim[3] = 33'h0bbfde8fa;
    stim[4] = 33'h044e43635;
    stim[5] = 33'h104454d62;
    stim[6] = 33'h16ac47d66;
    stim[7] = 33'h01b2fee3e;
    stim[8] = 33'h1424a1a82;
    stim[9] = 33'h0accd0f39;
    stim[10] = 33'h1b23dddf3;
    stim[11] = 33'h0e7fe8a6a;
    stim[12] = 33'h119aadeef;
    stim[13] = 33'h0893c5889;
    stim[14] = 33'h049b7b726;
    stim[15] = 33'h0b68d3fcc;
    stim[16] = 33'h10395b114;
    stim[17] = 33'h0d0accfa4;
    stim[18] = 33'h113319d60;
    stim[19] = 33'h1b21afdf6;
    stim[20] = 33'h154c8862e;
    stim[21] = 33'h19a5ddcd4;
    stim[22] = 33'h12c64e04d;
    stim[23] = 33'h11ae4274d;
    stim[24] = 33'h091547d67;
    stim[25] = 33'h0a1c3febe;
    stim[26] = 33'h05810bc31;
    stim[27] = 33'h00e519ef0;
    stim[28] = 33'h02d62a964;
    stim[29] = 33'h14c26c444;
    stim[30] = 33'h171f5ffab;
    stim[31] = 33'h1fc57b62e;
    stim[32] = 33'h123402650;
    stim[33] = 33'h045c32f10;
    stim[34] = 33'h06f1c0871;
    stim[35] = 33'h07bc60dbe;
    stim[36] = 33'h15832e9f3;
    stim[37] = 33'h0c67ff4eb;
    stim[38] = 33'h16eac7930;
    stim[39] = 33'h0b231147b;
    stim[40] = 33'h1e64f9243;
    stim[41] = 33'h095f2ec49;
    stim[42] = 33'h0d5aa5ea8;
    stim[43] = 33'h1e7677d04;
    stim[44] = 33'h1af171f02;
    stim[45] = 33'h1a9561ee6;
    stim[46] = 33'h18564f81f;
    stim[47] = 33'h18472eb2c;
    stim[48] = 33'h077baa29c;
    stim[49] = 33'h019486c9e;
    stim[50] = 33'h1770909e8;
    stim[51] = 33'h15c1fdce6;
    stim[52] = 33'h0e1d02bf8;
    stim[53] = 33'h1ab1a2904;
    stim[54] = 33'h0b407d112;
    stim[55] = 33'h0906f2fa1;
    stim[56] = 33'h0e3a6aa41;
    stim[57] = 33'h0a434a739;
    stim[58] = 33'h065b0e4dd;
    stim[59] = 33'h0f91b24a0;
    stim[60] = 33'h08fa673e6;
    stim[61] = 33'h02ae4a380;
    stim[62] = 33'h02653b40f;
    stim[63] = 33'h06b81dadb;
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
      expv[0] = 70'h180090b3ec00000000;
      expv[1] = 70'h3c014ef50800000010;
      expv[2] = 70'h10247368c400000000;
      expv[3] = 70'h10eff7a3e800000000;
      expv[4] = 70'h0f1390d8d400000000;
      expv[5] = 70'h200115358800000000;
      expv[6] = 70'h2fab11f59800000000;
      expv[7] = 70'h0000bfb8f800000000;
      expv[8] = 70'h2f09286a0800000000;
      expv[9] = 70'h10b3343ce400000000;
      expv[10] = 70'h30c8f777cc00000000;
      expv[11] = 70'h1c01fa29a800000000;
      expv[12] = 70'h2000ab7bbc00000000;
      expv[13] = 70'h1024f1622400000000;
      expv[14] = 70'h0f26dedc9800000000;
      expv[15] = 70'h10da34ff3000000000;
      expv[16] = 70'h200056c45000000000;
      expv[17] = 70'h1800b33e9000000000;
      expv[18] = 70'h2000c6758000000000;
      expv[19] = 70'h30c86bf7d800000000;
      expv[20] = 70'h2f532218b800000000;
      expv[21] = 70'h306977735000000000;
      expv[22] = 70'h2eb193813400000000;
      expv[23] = 70'h2001909d3400000000;
      expv[24] = 70'h104551f59c00000000;
      expv[25] = 70'h10870ffaf800000000;
      expv[26] = 70'h0f6042f0c400000000;
      expv[27] = 70'h0001467bc000000000;
      expv[28] = 70'h0eb58aa59000000000;
      expv[29] = 70'h2f309b111000000000;
      expv[30] = 70'h2fc7d7feac00000000;
      expv[31] = 70'h3c015ed8b800000000;
      expv[32] = 70'h2e8d00994000000000;
      expv[33] = 70'h0f170cbc4000000000;
      expv[34] = 70'h0fbc7021c400000000;
      expv[35] = 70'h0fef1836f800000000;
      expv[36] = 70'h2f60cba7cc00000000;
      expv[37] = 70'h1801ffd3ac00000000;
      expv[38] = 70'h2fbab1e4c000000000;
      expv[39] = 70'h10c8c451ec00000000;
      expv[40] = 70'h3c013e490c00000000;
      expv[41] = 70'h1057cbb12400000000;
      expv[42] = 70'h1800a97aa000000000;
      expv[43] = 70'h3c019df41000000000;
      expv[44] = 70'h30bc5c7c0800000000;
      expv[45] = 70'h30a5587b9800000000;
      expv[46] = 70'h301593e07c00000000;
      expv[47] = 70'h3011cbacb000000000;
      expv[48] = 70'h0fdeea8a7000000000;
      expv[49] = 70'h000121b27800000000;
      expv[50] = 70'h2fdc2427a000000000;
      expv[51] = 70'h2f707f739800000000;
      expv[52] = 70'h1c0140afe000000000;
      expv[53] = 70'h30ac68a41000000000;
      expv[54] = 70'h10d01f444800000000;
      expv[55] = 70'h1041bcbe8400000000;
      expv[56] = 70'h1c019aa90400000010;
      expv[57] = 70'h1090d29ce400000000;
      expv[58] = 70'h0f96c3937400000000;
      expv[59] = 70'h1c016c928000000010;
      expv[60] = 70'h103e99cf9800000000;
      expv[61] = 70'h0eab928e0000000000;
      expv[62] = 70'h0e994ed03c00000000;
      expv[63] = 70'h0fae076b6c00000000;
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
