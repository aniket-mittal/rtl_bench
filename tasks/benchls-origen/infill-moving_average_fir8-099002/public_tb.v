// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099002 dut (
    .clk(clk),
    .enable(in_vec[24:24]),
    .Din(in_vec[23:0]),
    .Dout(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h027e0b8;
    stim[1] = 25'h0db7bfd;
    stim[2] = 25'h1657513;
    stim[3] = 25'h1b29d7a;
    stim[4] = 25'h11f8494;
    stim[5] = 25'h0c81364;
    stim[6] = 25'h0917197;
    stim[7] = 25'h019b9ec;
    stim[8] = 25'h1c94e79;
    stim[9] = 25'h02a8507;
    stim[10] = 25'h03e5296;
    stim[11] = 25'h0ae24fa;
    stim[12] = 25'h0d6c7ad;
    stim[13] = 25'h032ce64;
    stim[14] = 25'h16197d7;
    stim[15] = 25'h116cd3c;
    stim[16] = 25'h0f4347f;
    stim[17] = 25'h0eb8929;
    stim[18] = 25'h02ccd9e;
    stim[19] = 25'h029b4be;
    stim[20] = 25'h02833a2;
    stim[21] = 25'h12bef65;
    stim[22] = 25'h0691004;
    stim[23] = 25'h00879b6;
    stim[24] = 25'h0e45422;
    stim[25] = 25'h185ee50;
    stim[26] = 25'h0bd9d0a;
    stim[27] = 25'h1eaf52f;
    stim[28] = 25'h1203211;
    stim[29] = 25'h0b9b36e;
    stim[30] = 25'h0c82de0;
    stim[31] = 25'h1dc4821;
    stim[32] = 25'h1131ecc;
    stim[33] = 25'h16b5e83;
    stim[34] = 25'h1559074;
    stim[35] = 25'h02cff08;
    stim[36] = 25'h0153e23;
    stim[37] = 25'h1a3ca5f;
    stim[38] = 25'h0d7ef56;
    stim[39] = 25'h1eb9509;
    stim[40] = 25'h0368c49;
    stim[41] = 25'h0ac7e0b;
    stim[42] = 25'h138f872;
    stim[43] = 25'h155ea0a;
    stim[44] = 25'h1584ba0;
    stim[45] = 25'h059aad3;
    stim[46] = 25'h1fa71d8;
    stim[47] = 25'h09521fe;
    stim[48] = 25'h1539626;
    stim[49] = 25'h190b08d;
    stim[50] = 25'h0992a53;
    stim[51] = 25'h1eb9df4;
    stim[52] = 25'h1fedf1f;
    stim[53] = 25'h09b52eb;
    stim[54] = 25'h0ed1b97;
    stim[55] = 25'h0894513;
    stim[56] = 25'h1aee437;
    stim[57] = 25'h14d8574;
    stim[58] = 25'h1c6f4cd;
    stim[59] = 25'h1358662;
    stim[60] = 25'h1443449;
    stim[61] = 25'h0a16ea4;
    stim[62] = 25'h0979605;
    stim[63] = 25'h0691e0e;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'hxxxxxx;
      expv[5] = 24'hxxxxxx;
      expv[6] = 24'hxxxxxx;
      expv[7] = 24'hxxxxxx;
      expv[8] = 24'hxxxxxx;
      expv[9] = 24'hxxxxxx;
      expv[10] = 24'hxxxxxx;
      expv[11] = 24'hxxxxxx;
      expv[12] = 24'hxxxxxx;
      expv[13] = 24'hxxxxxx;
      expv[14] = 24'hxxxxxx;
      expv[15] = 24'hxxxxxx;
      expv[16] = 24'hxxxxxx;
      expv[17] = 24'hxxxxxx;
      expv[18] = 24'hxxxxxx;
      expv[19] = 24'hxxxxxx;
      expv[20] = 24'hxxxxxx;
      expv[21] = 24'hxxxxxx;
      expv[22] = 24'hxxxxxx;
      expv[23] = 24'hxxxxxx;
      expv[24] = 24'hxxxxxx;
      expv[25] = 24'hxxxxxx;
      expv[26] = 24'h05650c;
      expv[27] = 24'h05650c;
      expv[28] = 24'hf6150f;
      expv[29] = 24'h03c7a2;
      expv[30] = 24'h03c7a2;
      expv[31] = 24'h03c7a2;
      expv[32] = 24'hfb6014;
      expv[33] = 24'h049a1e;
      expv[34] = 24'h05d2f4;
      expv[35] = 24'h0dab5b;
      expv[36] = 24'h0dab5b;
      expv[37] = 24'h0dab5b;
      expv[38] = 24'hfca6ba;
      expv[39] = 24'hfca6ba;
      expv[40] = 24'h095b91;
      expv[41] = 24'h095b91;
      expv[42] = 24'h095b91;
      expv[43] = 24'hf31bf9;
      expv[44] = 24'hf9d2f9;
      expv[45] = 24'h095368;
      expv[46] = 24'h095368;
      expv[47] = 24'h063dca;
      expv[48] = 24'h063dca;
      expv[49] = 24'h0344be;
      expv[50] = 24'h0aa8c1;
      expv[51] = 24'h0aa8c1;
      expv[52] = 24'hf3a334;
      expv[53] = 24'hf60c77;
      expv[54] = 24'hf60c77;
      expv[55] = 24'hf60c77;
      expv[56] = 24'hf60c77;
      expv[57] = 24'h04c9ef;
      expv[58] = 24'h03bd5d;
      expv[59] = 24'hf19282;
      expv[60] = 24'hf8f514;
      expv[61] = 24'hf708d8;
      expv[62] = 24'hf708d8;
      expv[63] = 24'hf708d8;
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
