// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01047 dut (
    .in1(in_vec[97:66]),
    .in2(in_vec[65:34]),
    .in3(in_vec[33:2]),
    .choose(in_vec[1:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h26fa359e17706ab7fe3b61041;
    stim[1] = 98'h0b766d5f04eb7ffc1c43946bf;
    stim[2] = 98'h33fe21833b5003e7a60039b3d;
    stim[3] = 98'h14cf367e811d045b67ce0f067;
    stim[4] = 98'h0dff29164a903bed32cac0cd8;
    stim[5] = 98'h273f754df83034cc41dc28556;
    stim[6] = 98'h132858f76658fd1c3aba064d1;
    stim[7] = 98'h3c990fc4c9a6dca7c93e85d10;
    stim[8] = 98'h0597c09d09ab8bc04abe6a319;
    stim[9] = 98'h2c3ba44232ccdaf4204eff2a2;
    stim[10] = 98'h2686c4ff4d67301bb0828bed3;
    stim[11] = 98'h084c47e21f45d1d531fc8d475;
    stim[12] = 98'h14ce53b0ed7d6bc7dcdf6c074;
    stim[13] = 98'h380039878c5d476c4a68e1495;
    stim[14] = 98'h153ca26e18d182c618a275f26;
    stim[15] = 98'h2af4808164c59ee12e073024f;
    stim[16] = 98'h1cc36ca49df0160337d6c1399;
    stim[17] = 98'h124d7418528bbbf4b62b62e8b;
    stim[18] = 98'h232f661119d47f155cbf870af;
    stim[19] = 98'h25da1b827534dde962c567c2a;
    stim[20] = 98'h1fbb6ba3bc56d7266397f11de;
    stim[21] = 98'h0351cec0a5d779cdbacdd87b3;
    stim[22] = 98'h352aebdf1d6a49eec5030b046;
    stim[23] = 98'h004a4c7f85fedab8d497645f9;
    stim[24] = 98'h13b74cdef11b324805fa9ee28;
    stim[25] = 98'h160060b340cc5f238fcaba6eb;
    stim[26] = 98'h3b3c6480f84b8ca46a92eafc7;
    stim[27] = 98'h36120a12d73903c327334ced3;
    stim[28] = 98'h21a200e15e6573944ca7fec85;
    stim[29] = 98'h267f70f0d3ba55d629b0608c3;
    stim[30] = 98'h2771cf97628200986f75e160b;
    stim[31] = 98'h0ef131bc0790556319166a525;
    stim[32] = 98'h2edd84465028bf85a467f13e9;
    stim[33] = 98'h05365401d8359179ded362d13;
    stim[34] = 98'h0a06b26147c90bbabb400f9c8;
    stim[35] = 98'h298c52b169a202f7679f23e93;
    stim[36] = 98'h05eebb86fec6544e6b15130c0;
    stim[37] = 98'h2c6905334c01a03f7561ac873;
    stim[38] = 98'h355e0c15e3629349b8d8fa7e4;
    stim[39] = 98'h08d3cb62f52669398fa783953;
    stim[40] = 98'h192afa5c0200c256ee7179d38;
    stim[41] = 98'h35a849bde0a04b2f9f815ae2b;
    stim[42] = 98'h0e57626949809c7a8a6a3f5ee;
    stim[43] = 98'h140e7d14d793c01082d11f1f4;
    stim[44] = 98'h3d74af83592a2a3be54f92167;
    stim[45] = 98'h100ebb8c065b29e9013286a16;
    stim[46] = 98'h39e33cb85c6f77a90bffa8fed;
    stim[47] = 98'h284ccbd80d9e685e0cbc5313c;
    stim[48] = 98'h18e8c3424915f6f1ba8b92861;
    stim[49] = 98'h103c490e0da076d86b98f2ede;
    stim[50] = 98'h3404c0d2ff7983fe5a3ec6a77;
    stim[51] = 98'h1ab8277cc4f007ceb168a0d2d;
    stim[52] = 98'h2b3ee95e4d919a5cd67988e3c;
    stim[53] = 98'h19b5334698e5df1a05181e4b0;
    stim[54] = 98'h340a028357ce0c33ce20f1dde;
    stim[55] = 98'h3575e83a0833afcc719aac04f;
    stim[56] = 98'h028550570191655e1a6d20346;
    stim[57] = 98'h03ddccc47a33f00714c32ddb0;
    stim[58] = 98'h18b40012a478ea1adfc38954f;
    stim[59] = 98'h2e05cfa9a08f9c1ee7411a7fc;
    stim[60] = 98'h1f84e727a830759d3466bc2b1;
    stim[61] = 98'h31372c7b68194fbee60d16392;
    stim[62] = 98'h00f1f326593fa15916b5bceb7;
    stim[63] = 98'h2af4a073b7926844d84256e37;
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
      expv[0] = 32'h5dc1aadf;
      expv[1] = 32'h00000000;
      expv[2] = 32'hed400f9e;
      expv[3] = 32'h00000000;
      expv[4] = 32'h37fca459;
      expv[5] = 32'h0770a155;
      expv[6] = 32'h9963f470;
      expv[7] = 32'hf2643f13;
      expv[8] = 32'h26ae2f01;
      expv[9] = 32'h813bfca8;
      expv[10] = 32'h00000000;
      expv[11] = 32'h7d174754;
      expv[12] = 32'h53394ec3;
      expv[13] = 32'h31751db1;
      expv[14] = 32'h6289d7c9;
      expv[15] = 32'h00000000;
      expv[16] = 32'h77c0580c;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h8b159f0a;
      expv[20] = 32'h8e5fc477;
      expv[21] = 32'h00000000;
      expv[22] = 32'h140c2c11;
      expv[23] = 32'h17fb6ae3;
      expv[24] = 32'h4edd337b;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h7995ce51;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h1e41558c;
      expv[32] = 32'h40a2fe16;
      expv[33] = 32'h00000000;
      expv[34] = 32'h281ac985;
      expv[35] = 32'h00000000;
      expv[36] = 32'h17baee1b;
      expv[37] = 32'h00000000;
      expv[38] = 32'hd5783057;
      expv[39] = 32'h00000000;
      expv[40] = 32'h64abe970;
      expv[41] = 32'h00000000;
      expv[42] = 32'h29a8fd7b;
      expv[43] = 32'h5039f453;
      expv[44] = 32'h00000000;
      expv[45] = 32'h04ca1a85;
      expv[46] = 32'h71bddea4;
      expv[47] = 32'ha1332f60;
      expv[48] = 32'h2457dbc6;
      expv[49] = 32'hae63cbb7;
      expv[50] = 32'h00000000;
      expv[51] = 32'h13c01f3a;
      expv[52] = 32'hacfba579;
      expv[53] = 32'h66d4cd1a;
      expv[54] = 32'h3883c777;
      expv[55] = 32'h00000000;
      expv[56] = 32'h69b480d1;
      expv[57] = 32'h0f773311;
      expv[58] = 32'h00000000;
      expv[59] = 32'hb8173ea6;
      expv[60] = 32'ha0c1d674;
      expv[61] = 32'h983458e4;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
