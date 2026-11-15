// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125478 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .sub(in_vec[0:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h03d15d975557c4f4f;
    stim[1] = 65'h12f0473752de0e402;
    stim[2] = 65'h14d2c3294ee723001;
    stim[3] = 65'h0971a7c73bf117bd9;
    stim[4] = 65'h15a23633d3dbffc5e;
    stim[5] = 65'h11c98f1b166317614;
    stim[6] = 65'h1739959bfb62e7802;
    stim[7] = 65'h124aee147f3f59d7c;
    stim[8] = 65'h1b324fc89d89f0728;
    stim[9] = 65'h1f92a7a04d4332df6;
    stim[10] = 65'h0e49131a70fd777ec;
    stim[11] = 65'h0e9262391353e0ffd;
    stim[12] = 65'h0f652d1cbe187a013;
    stim[13] = 65'h0a133b26173aaabb0;
    stim[14] = 65'h07a313526dc127f09;
    stim[15] = 65'h140876d2649fbdfbd;
    stim[16] = 65'h05c20c08999552b80;
    stim[17] = 65'h0cbffb83aec047e1d;
    stim[18] = 65'h12d2f5e3f431ff45b;
    stim[19] = 65'h1d7ce40a2809fe8ab;
    stim[20] = 65'h151c00be129c3873e;
    stim[21] = 65'h1597d0f242f02c0e9;
    stim[22] = 65'h0d8dd915c79183867;
    stim[23] = 65'h12f9bcb51f95cf772;
    stim[24] = 65'h010eb215ed0b95510;
    stim[25] = 65'h011da7e039a93b25e;
    stim[26] = 65'h118d82fc6e225e588;
    stim[27] = 65'h0504d5a75d97d41b1;
    stim[28] = 65'h1d67ce3da7120a6d6;
    stim[29] = 65'h19d656b0e61246a78;
    stim[30] = 65'h019c9df95c0287458;
    stim[31] = 65'h089eea9a1317dde3c;
    stim[32] = 65'h1aab1864244f3c53c;
    stim[33] = 65'h11a2ede242045a3b5;
    stim[34] = 65'h1832b4e7a3511175c;
    stim[35] = 65'h1c5d96abf36ede6a2;
    stim[36] = 65'h0605d628ca766f768;
    stim[37] = 65'h15691029242434387;
    stim[38] = 65'h00e321da59f2c3f2e;
    stim[39] = 65'h177d2cca70696a9c8;
    stim[40] = 65'h09537c939dbb3af44;
    stim[41] = 65'h003c1f99dad425fb8;
    stim[42] = 65'h13195d06343711a61;
    stim[43] = 65'h0d5b0f263c9246ea4;
    stim[44] = 65'h0ccabd1a64f204c89;
    stim[45] = 65'h0fedde05808cbee1b;
    stim[46] = 65'h1acbcf8d48c206d63;
    stim[47] = 65'h1b10c1b7488ecf419;
    stim[48] = 65'h0b19982532fa42941;
    stim[49] = 65'h01370dd5e55d1b5f4;
    stim[50] = 65'h019bc3adc4012e000;
    stim[51] = 65'h087b26437581c9f15;
    stim[52] = 65'h1aafac6d0d279c74c;
    stim[53] = 65'h09e2fd93e6c509a38;
    stim[54] = 65'h050fadbb71e24f1dd;
    stim[55] = 65'h05ab4c9481196683b;
    stim[56] = 65'h02afe0a4b0c216124;
    stim[57] = 65'h1d1adff89d814a7a6;
    stim[58] = 65'h1387ceaab543ca88c;
    stim[59] = 65'h06b9a10c3cc7a3db7;
    stim[60] = 65'h1daaaa7daefdb894f;
    stim[61] = 65'h196240f9e91dd4286;
    stim[62] = 65'h09df79087b6f844ef;
    stim[63] = 65'h045c3dee3ce2c2b2a;
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
      expv[0] = 32'h8c333aec;
      expv[1] = 32'h2e72abbb;
      expv[2] = 32'hd0a2feb5;
      expv[3] = 32'h93fb7fb2;
      expv[4] = 32'h4bf1afcd;
      expv[5] = 32'h416533e2;
      expv[6] = 32'h94e3e8e0;
      expv[7] = 32'h8c523f61;
      expv[8] = 32'hc5e201d8;
      expv[9] = 32'h66aed3fd;
      expv[10] = 32'hfa3454c9;
      expv[11] = 32'h260bf635;
      expv[12] = 32'h759a6723;
      expv[13] = 32'h0a6f2f08;
      expv[14] = 32'h30f0a4f0;
      expv[15] = 32'h84ba394a;
      expv[16] = 32'hfabaf604;
      expv[17] = 32'h100262f0;
      expv[18] = 32'h0af84b0d;
      expv[19] = 32'h5468d403;
      expv[20] = 32'h3dc1c98f;
      expv[21] = 32'h6ac2d8e1;
      expv[22] = 32'hd01d5384;
      expv[23] = 32'h947c6161;
      expv[24] = 32'h70d23b37;
      expv[25] = 32'hd6371830;
      expv[26] = 32'hfd7f0aa7;
      expv[27] = 32'hc497f39d;
      expv[28] = 32'h23cec558;
      expv[29] = 32'hff44eac3;
      expv[30] = 32'hecf929f6;
      expv[31] = 32'hddb643ee;
      expv[32] = 32'hf7d2a5bf;
      expv[33] = 32'h830b62c7;
      expv[34] = 32'hdc1e32eb;
      expv[35] = 32'h7e63a8b0;
      expv[36] = 32'h83e22cfa;
      expv[37] = 32'h75d92079;
      expv[38] = 32'hd6af2e69;
      expv[39] = 32'h3f34bb37;
      expv[40] = 32'h3875bc3e;
      expv[41] = 32'hd8822caa;
      expv[42] = 32'h08eda4fe;
      expv[43] = 32'h4f6ab083;
      expv[44] = 32'hc13a3d70;
      expv[45] = 32'h84f706e0;
      expv[46] = 32'h6fb1ba46;
      expv[47] = 32'h6bf06c51;
      expv[48] = 32'h3f055376;
      expv[49] = 32'h34a149a9;
      expv[50] = 32'h2ce78d6e;
      expv[51] = 32'h68351d6e;
      expv[52] = 32'h3eba470e;
      expv[53] = 32'h854039bb;
      expv[54] = 32'h66950b12;
      expv[55] = 32'hdb70cf78;
      expv[56] = 32'h9b8fb5b7;
      expv[57] = 32'hd4e15397;
      expv[58] = 32'h465cc99b;
      expv[59] = 32'hb0701679;
      expv[60] = 32'h8a9870b9;
      expv[61] = 32'h1400a912;
      expv[62] = 32'h8c805a33;
      expv[63] = 32'h09f80506;
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
