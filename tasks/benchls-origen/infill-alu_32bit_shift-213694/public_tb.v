// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213694 dut (
    .in_A(in_vec[68:37]),
    .in_B(in_vec[36:5]),
    .mode(in_vec[4:2]),
    .enable(in_vec[1:1]),
    .carry_in(in_vec[0:0]),
    .carry_out(out_vec[33:33]),
    .out(out_vec[32:1]),
    .zero_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1092bab5f7faa92b8b;
    stim[1] = 69'h0b8486a43535963083;
    stim[2] = 69'h063e52643424ce8adf;
    stim[3] = 69'h0083fd8634cf0069dd;
    stim[4] = 69'h09159777b6c3ec0b4f;
    stim[5] = 69'h069508be494635f4d9;
    stim[6] = 69'h16ca0833bf0092b5e5;
    stim[7] = 69'h01a0c061e93f7184f4;
    stim[8] = 69'h1f323563cb6f41b893;
    stim[9] = 69'h0b9c5263e4076bc1f2;
    stim[10] = 69'h0c8bdf4239cb4087b0;
    stim[11] = 69'h1b3b67e14227730b5e;
    stim[12] = 69'h143ef841812bfd49be;
    stim[13] = 69'h0a429c1a6e4b36fe2b;
    stim[14] = 69'h0ff0df65cd5bbc0d55;
    stim[15] = 69'h04db889a616cdaf027;
    stim[16] = 69'h12cf391a6573418f83;
    stim[17] = 69'h07c051a1cba82286ca;
    stim[18] = 69'h092e2d4eb05f271ca9;
    stim[19] = 69'h1e813f8d073fd5fe92;
    stim[20] = 69'h0cd7c315a7b3b1ec42;
    stim[21] = 69'h137ab6bf2c18aa96ea;
    stim[22] = 69'h16ad7f1f30b3b89cd6;
    stim[23] = 69'h1babf30267618071a4;
    stim[24] = 69'h1ab9c7008fe58934bf;
    stim[25] = 69'h0d717e0bbecca0c31d;
    stim[26] = 69'h1b4e502729af296609;
    stim[27] = 69'h0c826a5d2a415dbcc1;
    stim[28] = 69'h0e917313ac2e79965f;
    stim[29] = 69'h17e9d6e656e6c95ae0;
    stim[30] = 69'h130babaad911752ed0;
    stim[31] = 69'h096d67a0f50869ec18;
    stim[32] = 69'h0988a27d1c8c787367;
    stim[33] = 69'h1bef26b2aebc0b5b6b;
    stim[34] = 69'h0e1a38c9f5e7e1cd67;
    stim[35] = 69'h1956611f601a913cb5;
    stim[36] = 69'h17489e5baef82d4847;
    stim[37] = 69'h14c9fa3a05af957cfd;
    stim[38] = 69'h1a930a8d827bb68b70;
    stim[39] = 69'h0cb3038836bee7c5bb;
    stim[40] = 69'h05f527cb3d222398fe;
    stim[41] = 69'h0968cd17303e191cfc;
    stim[42] = 69'h0c1aaef86a7ba70e26;
    stim[43] = 69'h0c755ef01e33f1ab4d;
    stim[44] = 69'h0cd0d0d98b21f8b39c;
    stim[45] = 69'h170abc5062316e2f3f;
    stim[46] = 69'h0f3570b6ca62db9cc6;
    stim[47] = 69'h15dbbfe67cb46fef91;
    stim[48] = 69'h04df28a06e605d0d70;
    stim[49] = 69'h1da4ae16b948ef5d61;
    stim[50] = 69'h0d6dd396652d88a520;
    stim[51] = 69'h1ddc84338293f7bfbd;
    stim[52] = 69'h18b0b2659b38732d19;
    stim[53] = 69'h171ade595a83da0bfc;
    stim[54] = 69'h1940b1d06e524947fe;
    stim[55] = 69'h03b83834d0bd3569dc;
    stim[56] = 69'h0bfa8513cc351f4e56;
    stim[57] = 69'h1047274b9b1d25a336;
    stim[58] = 69'h16c6b24fa09860e59a;
    stim[59] = 69'h1c545976a4a1230e23;
    stim[60] = 69'h16c69e84bf0f0556a7;
    stim[61] = 69'h03e2c54e1420111df1;
    stim[62] = 69'h12b4ae0cf40d9fd89a;
    stim[63] = 69'h10e5b4eef21ed888cc;
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
      expv[0] = 34'h2768139e6;
      expv[1] = 34'h210486200;
      expv[2] = 34'h1a6320eee;
      expv[3] = 34'h1a6320eee;
      expv[4] = 34'h122b2eef6;
      expv[5] = 34'h122b2eef6;
      expv[6] = 34'h122b2eef6;
      expv[7] = 34'h122b2eef6;
      expv[8] = 34'h1f991ab1e;
      expv[9] = 34'h25ce2931e;
      expv[10] = 34'h25ce2931e;
      expv[11] = 34'h1d62daec8;
      expv[12] = 34'h156af58b2;
      expv[13] = 34'h2409aae44;
      expv[14] = 34'h2409aae44;
      expv[15] = 34'h25ffdafa6;
      expv[16] = 34'h2043010a0;
      expv[17] = 34'h0c6873270;
      expv[18] = 34'h0c6873270;
      expv[19] = 34'h0f409fc68;
      expv[20] = 34'h049381040;
      expv[21] = 34'h1f621c29c;
      expv[22] = 34'h095280e0c;
      expv[23] = 34'h095280e0c;
      expv[24] = 34'h2a9f50352;
      expv[25] = 34'h2a9f50352;
      expv[26] = 34'h2a9f50352;
      expv[27] = 34'h2a9f50352;
      expv[28] = 34'h1abfeca9e;
      expv[29] = 34'h1abfeca9e;
      expv[30] = 34'h1abfeca9e;
      expv[31] = 34'h1abfeca9e;
      expv[32] = 34'h3d8cfa7f6;
      expv[33] = 34'h35532de9c;
      expv[34] = 34'h3ffff9cde;
      expv[35] = 34'h3ffff9cde;
      expv[36] = 34'h3ff8bf5be;
      expv[37] = 34'h3ff8bf5be;
      expv[38] = 34'h3ff8bf5be;
      expv[39] = 34'h15f41bc28;
      expv[40] = 34'h23174b640;
      expv[41] = 34'h23174b640;
      expv[42] = 34'h0e7baffe6;
      expv[43] = 34'h0e7baffe6;
      expv[44] = 34'h0e7baffe6;
      expv[45] = 34'h193c2a7f8;
      expv[46] = 34'h0f77fbbec;
      expv[47] = 34'h0f77fbbec;
      expv[48] = 34'h0f77fbbec;
      expv[49] = 34'h0f77fbbec;
      expv[50] = 34'h0f77fbbec;
      expv[51] = 34'h0f77fbbec;
      expv[52] = 34'h0f77fbbec;
      expv[53] = 34'h0f77fbbec;
      expv[54] = 34'h2792fb184;
      expv[55] = 34'h2792fb184;
      expv[56] = 34'h14057aec2;
      expv[57] = 34'h0fb8d8b46;
      expv[58] = 34'h162e516a2;
      expv[59] = 34'h240001062;
      expv[60] = 34'h3fcf9fd6a;
      expv[61] = 34'h3fcf9fd6a;
      expv[62] = 34'h1ea70e346;
      expv[63] = 34'h1ea70e346;
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
