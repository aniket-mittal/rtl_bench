// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022151 dut (
    .clk(clk),
    .mc(in_vec[52:28]),
    .mp(in_vec[27:3]),
    .reset(in_vec[2:2]),
    .mult_term(in_vec[1:1]),
    .start(in_vec[0:0]),
    .prod(out_vec[48:1]),
    .mult_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1dee342e60b1e4;
    stim[1] = 53'h1f4b8ab264168d;
    stim[2] = 53'h012faf61188c2b;
    stim[3] = 53'h13ba475c1438a3;
    stim[4] = 53'h048be364fca2e3;
    stim[5] = 53'h0f4e226cc74c60;
    stim[6] = 53'h1d85fd8f9382a8;
    stim[7] = 53'h1441c3890e32f2;
    stim[8] = 53'h01566199890182;
    stim[9] = 53'h0cbb8914535810;
    stim[10] = 53'h1bdbeada883f6b;
    stim[11] = 53'h12d8b50274e811;
    stim[12] = 53'h07926140d7de43;
    stim[13] = 53'h0e43b35837aa1a;
    stim[14] = 53'h17d4fc598e9a31;
    stim[15] = 53'h01fd534b3c1c98;
    stim[16] = 53'h1eb71d79dc3298;
    stim[17] = 53'h0b487fb1bd1a99;
    stim[18] = 53'h02835947a93713;
    stim[19] = 53'h057c3bb8c6c088;
    stim[20] = 53'h03f1f44a43e1a2;
    stim[21] = 53'h106fbbdbbdb923;
    stim[22] = 53'h0b453783852568;
    stim[23] = 53'h1c742b3979c5c0;
    stim[24] = 53'h1aa3e58cc1847b;
    stim[25] = 53'h105669f1a19699;
    stim[26] = 53'h1642ca846e4e6a;
    stim[27] = 53'h0e006081423f4a;
    stim[28] = 53'h054021c6872803;
    stim[29] = 53'h1caa05bbdcf699;
    stim[30] = 53'h09685b6ce5aefa;
    stim[31] = 53'h06b95058c4ed13;
    stim[32] = 53'h0255d6394dee2b;
    stim[33] = 53'h0ca3365124d820;
    stim[34] = 53'h1833464ada1141;
    stim[35] = 53'h1222e84615c680;
    stim[36] = 53'h09dd71c9f01448;
    stim[37] = 53'h04f87f2862f951;
    stim[38] = 53'h08bd773de85301;
    stim[39] = 53'h1e0ad328ffd313;
    stim[40] = 53'h05ff5a3a47ac29;
    stim[41] = 53'h0ebd1fa16da252;
    stim[42] = 53'h095a81185aaf61;
    stim[43] = 53'h1c23c96106ebaa;
    stim[44] = 53'h1fcab2ddc4d38a;
    stim[45] = 53'h152c46cad760ca;
    stim[46] = 53'h02ce46b8a7865a;
    stim[47] = 53'h08637ee46283c0;
    stim[48] = 53'h0b102fb2a73bab;
    stim[49] = 53'h0776259217bd58;
    stim[50] = 53'h00f7fa6b117043;
    stim[51] = 53'h1df14c722a49eb;
    stim[52] = 53'h17f0a6e712510b;
    stim[53] = 53'h02ed5c93e2d881;
    stim[54] = 53'h0c8078f522861b;
    stim[55] = 53'h148d98b40b7ce1;
    stim[56] = 53'h1bce74b391e6bb;
    stim[57] = 53'h079a0a857fc292;
    stim[58] = 53'h1e04951e928a59;
    stim[59] = 53'h117b5202ebf851;
    stim[60] = 53'h186b6c770583d1;
    stim[61] = 53'h1ebbfe177d3161;
    stim[62] = 53'h104cf84ccd9680;
    stim[63] = 53'h1769746b03af91;
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
      expv[0] = 49'h0000000000000;
      expv[1] = 49'h0000000000000;
      expv[2] = 49'h0000000000000;
      expv[3] = 49'h000000046230a;
      expv[4] = 49'h0000003050e28;
      expv[5] = 49'h00000013f28b8;
      expv[6] = 49'h00000009f945c;
      expv[7] = 49'h00000004fca2e;
      expv[8] = 49'h00000004fca2e;
      expv[9] = 49'h00000004fca2e;
      expv[10] = 49'h00000004fca2e;
      expv[11] = 49'h0000002a20fda;
      expv[12] = 49'h00000009d3a04;
      expv[13] = 49'h000000035f790;
      expv[14] = 49'h000000035f790;
      expv[15] = 49'h000000263a68c;
      expv[16] = 49'h000000131d346;
      expv[17] = 49'h000000098e9a2;
      expv[18] = 49'h00000006f46a6;
      expv[19] = 49'h0000001ea4dc4;
      expv[20] = 49'h0000000f526e2;
      expv[21] = 49'h0000000f526e2;
      expv[22] = 49'h0000002ef6e48;
      expv[23] = 49'h000000177b724;
      expv[24] = 49'h0000000bbdb92;
      expv[25] = 49'h000000330611e;
      expv[26] = 49'h00000006865a6;
      expv[27] = 49'h00000006865a6;
      expv[28] = 49'h00000006865a6;
      expv[29] = 49'h0000001a1ca00;
      expv[30] = 49'h0000002f73da6;
      expv[31] = 49'h0000002f73da6;
      expv[32] = 49'h0000002313b44;
      expv[33] = 49'h0000002537b8a;
      expv[34] = 49'h000000129bdc4;
      expv[35] = 49'h0000002b68450;
      expv[36] = 49'h00000015b4228;
      expv[37] = 49'h0000000ada114;
      expv[38] = 49'h000000218be54;
      expv[39] = 49'h00000037a14c0;
      expv[40] = 49'h00000023ff4c4;
      expv[41] = 49'h000000291eb0a;
      expv[42] = 49'h000000291eb0a;
      expv[43] = 49'h000000216abd8;
      expv[44] = 49'h000000216abd8;
      expv[45] = 49'h000000216abd8;
      expv[46] = 49'h000000216abd8;
      expv[47] = 49'h000000216abd8;
      expv[48] = 49'h000000216abd8;
      expv[49] = 49'h0000000a9ceea;
      expv[50] = 49'h000000054e774;
      expv[51] = 49'h0000002c45c10;
      expv[52] = 49'h00000008a927a;
      expv[53] = 49'h0000001c49442;
      expv[54] = 49'h0000000f8b620;
      expv[55] = 49'h000000148a186;
      expv[56] = 49'h000000102df38;
      expv[57] = 49'h0000000e479ae;
      expv[58] = 49'h0000000e479ae;
      expv[59] = 49'h0000003a4a296;
      expv[60] = 49'h0000000bafe14;
      expv[61] = 49'h0000001c160f4;
      expv[62] = 49'h0000001df4c58;
      expv[63] = 49'h0000000efa62c;
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
