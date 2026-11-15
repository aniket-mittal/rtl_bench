// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  remove_parity dut (
    .din(in_vec[49:0]),
    .dout(out_vec[44:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h1f095383238ed;
    stim[1] = 50'h16d0c1cf44243;
    stim[2] = 50'h3333ccf0d1f1d;
    stim[3] = 50'h1eb6e0a31de59;
    stim[4] = 50'h0253afc8ccafd;
    stim[5] = 50'h047f29cc64bf5;
    stim[6] = 50'h31a7c247d0955;
    stim[7] = 50'h1e4881d397644;
    stim[8] = 50'h3aae10b3f9630;
    stim[9] = 50'h24823fa12da30;
    stim[10] = 50'h2653eb66faa3b;
    stim[11] = 50'h166bc72f5747a;
    stim[12] = 50'h29c507f457581;
    stim[13] = 50'h252dbf013e595;
    stim[14] = 50'h23572771fa8e8;
    stim[15] = 50'h0e6cd950556f2;
    stim[16] = 50'h10efcf16c9e0c;
    stim[17] = 50'h035ca9a7796ef;
    stim[18] = 50'h08b66b373c32a;
    stim[19] = 50'h33b2e257d54dd;
    stim[20] = 50'h1342f8603c8dc;
    stim[21] = 50'h10a48bd97354c;
    stim[22] = 50'h2d7cc5c0e6e0c;
    stim[23] = 50'h0e4b0c398efef;
    stim[24] = 50'h1591ae8d5fe5c;
    stim[25] = 50'h0fdec34a969e8;
    stim[26] = 50'h0364c5a4411ff;
    stim[27] = 50'h0ecd62ca7054c;
    stim[28] = 50'h078fb0fbcb71f;
    stim[29] = 50'h21cbf8789dbf1;
    stim[30] = 50'h2bd3bf572b13c;
    stim[31] = 50'h1b7b077d30193;
    stim[32] = 50'h07a3ca69d627a;
    stim[33] = 50'h2f0a13825f417;
    stim[34] = 50'h398209fcaaa36;
    stim[35] = 50'h09e509f93a7e2;
    stim[36] = 50'h3a99a3fe73159;
    stim[37] = 50'h276a19ab57d3f;
    stim[38] = 50'h0764c82eb339b;
    stim[39] = 50'h27bc07cc148a3;
    stim[40] = 50'h18d610441b5f5;
    stim[41] = 50'h23c764837673f;
    stim[42] = 50'h392a6843208f9;
    stim[43] = 50'h27491f1b69547;
    stim[44] = 50'h32288166bad99;
    stim[45] = 50'h2196c7e49cb5d;
    stim[46] = 50'h3e8d4bff76cb4;
    stim[47] = 50'h29112a645e2b4;
    stim[48] = 50'h0d67af165be08;
    stim[49] = 50'h3f1c86d834fde;
    stim[50] = 50'h314d8ae61e04c;
    stim[51] = 50'h05ce2ed4c6829;
    stim[52] = 50'h10efa1eb98b64;
    stim[53] = 50'h2c185d0f40b5f;
    stim[54] = 50'h0abb2d1eda8c4;
    stim[55] = 50'h0d320deb307ee;
    stim[56] = 50'h11a65bedb9158;
    stim[57] = 50'h36395f2c4a1c4;
    stim[58] = 50'h0669e39cd920b;
    stim[59] = 50'h09a2e752222ce;
    stim[60] = 50'h09ec8eb1618be;
    stim[61] = 50'h3956ce2dfd07e;
    stim[62] = 50'h32e7ce592795d;
    stim[63] = 50'h12e778f00c667;
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
      expv[0] = 45'h1f02a60d1ced;
      expv[1] = 45'h16d1873e2043;
      expv[2] = 45'h13379bc28f1d;
      expv[3] = 45'h1ebdc28cee59;
      expv[4] = 45'h02575f2264fd;
      expv[5] = 45'h047e573325f5;
      expv[6] = 45'h11af811e8555;
      expv[7] = 45'h1e41074cba44;
      expv[8] = 45'h1aac22cfca30;
      expv[9] = 45'h04847e856c30;
      expv[10] = 45'h0657d59bd43b;
      expv[11] = 45'h16678cbeba7a;
      expv[12] = 45'h09ca0fd2bb81;
      expv[13] = 45'h052b7c05f395;
      expv[14] = 45'h035e4dc7d4e8;
      expv[15] = 45'h0e69b542aaf2;
      expv[16] = 45'h10ef9c5a4e0c;
      expv[17] = 45'h0359569fcaef;
      expv[18] = 45'h08bcd4dde12a;
      expv[19] = 45'h13b5c15eaadd;
      expv[20] = 45'h1345f181e4dc;
      expv[21] = 45'h10a917679b4c;
      expv[22] = 45'h0d798f03360c;
      expv[23] = 45'h0e4618e477ef;
      expv[24] = 45'h15935a36fe5c;
      expv[25] = 45'h0fdd8528b5e8;
      expv[26] = 45'h03698e9209ff;
      expv[27] = 45'h0ecac32b834c;
      expv[28] = 45'h078f63ee5b1f;
      expv[29] = 45'h01c7f1e0edf1;
      expv[30] = 45'h0bd77d5d593c;
      expv[31] = 45'h1b760df58193;
      expv[32] = 45'h07a791a6b07a;
      expv[33] = 45'h0f04260afa17;
      expv[34] = 45'h198417f15436;
      expv[35] = 45'h09ea17e5d3e2;
      expv[36] = 45'h1a9347fb9959;
      expv[37] = 45'h076436aebf3f;
      expv[38] = 45'h076990b9999b;
      expv[39] = 45'h07b80f30a4a3;
      expv[40] = 45'h18dc2110dbf5;
      expv[41] = 45'h03ceca0fb33f;
      expv[42] = 45'h1924d10d04f9;
      expv[43] = 45'h07423c6f4b47;
      expv[44] = 45'h12210599d799;
      expv[45] = 45'h019d8f90e55d;
      expv[46] = 45'h1e8a97ffb6b4;
      expv[47] = 45'h09125192f0b4;
      expv[48] = 45'h0d6f5c5ade08;
      expv[49] = 45'h1f190b61a7de;
      expv[50] = 45'h114b1398f04c;
      expv[51] = 45'h05cc5b523429;
      expv[52] = 45'h10ef47acc564;
      expv[53] = 45'h0c10bc3e055f;
      expv[54] = 45'h0ab65c7ad4c4;
      expv[55] = 45'h0d341fad83ee;
      expv[56] = 45'h11acb7b5c958;
      expv[57] = 45'h1632bcb251c4;
      expv[58] = 45'h0663c672c80b;
      expv[59] = 45'h09a5cd4910ce;
      expv[60] = 45'h09e91ac70cbe;
      expv[61] = 45'h195d98b7e87e;
      expv[62] = 45'h12ef99653d5d;
      expv[63] = 45'h12eef3c06267;
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
