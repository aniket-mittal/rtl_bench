// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07816 dut (
    .clk(clk),
    .clk7_en(in_vec[41:41]),
    .audio_dmal(in_vec[40:37]),
    .audio_dmas(in_vec[36:33]),
    .hpos(in_vec[32:24]),
    .reg_address_in(in_vec[23:16]),
    .data_in(in_vec[15:0]),
    .dma(out_vec[28:28]),
    .reg_address_out(out_vec[27:20]),
    .address_out(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h35304cac60e;
    stim[1] = 42'h04ad465eeab;
    stim[2] = 42'h24de3e20d65;
    stim[3] = 42'h034506efafb;
    stim[4] = 42'h0ed0bdebf6b;
    stim[5] = 42'h2dfe508b320;
    stim[6] = 42'h2186a7ea9c5;
    stim[7] = 42'h3bec252bf9d;
    stim[8] = 42'h23458fbb89b;
    stim[9] = 42'h2f5b206c112;
    stim[10] = 42'h243869865af;
    stim[11] = 42'h301b38b2060;
    stim[12] = 42'h393fb8faa74;
    stim[13] = 42'h33599496bff;
    stim[14] = 42'h129ab981908;
    stim[15] = 42'h2873e3998e9;
    stim[16] = 42'h33470fcfc46;
    stim[17] = 42'h1b238031425;
    stim[18] = 42'h2c432256db3;
    stim[19] = 42'h14fd76dfca5;
    stim[20] = 42'h00d598a78a9;
    stim[21] = 42'h1b185a5697a;
    stim[22] = 42'h284c6ca9f52;
    stim[23] = 42'h0fd1fd88288;
    stim[24] = 42'h31bd54cc3b1;
    stim[25] = 42'h315a960e29f;
    stim[26] = 42'h1be3ae0a87f;
    stim[27] = 42'h3b119a16ee2;
    stim[28] = 42'h067b354555b;
    stim[29] = 42'h1dcbea62e17;
    stim[30] = 42'h09b0337642e;
    stim[31] = 42'h2336d5b274a;
    stim[32] = 42'h05dc19035c1;
    stim[33] = 42'h31efd292956;
    stim[34] = 42'h1b737bfeb10;
    stim[35] = 42'h01ca3452368;
    stim[36] = 42'h2c306a1497a;
    stim[37] = 42'h1b5930b0dfd;
    stim[38] = 42'h3cbdeb91eb5;
    stim[39] = 42'h0ecba3acf66;
    stim[40] = 42'h2a35df0b7ef;
    stim[41] = 42'h28b47f76d37;
    stim[42] = 42'h2e2539e9d07;
    stim[43] = 42'h1afdd8195ff;
    stim[44] = 42'h1d28dd6b32c;
    stim[45] = 42'h268fa89bfcf;
    stim[46] = 42'h33ee8957830;
    stim[47] = 42'h13f63d28ba9;
    stim[48] = 42'h27f0de8a576;
    stim[49] = 42'h344f6f1a6c2;
    stim[50] = 42'h1902b3296ba;
    stim[51] = 42'h1347de91ea1;
    stim[52] = 42'h11cd60679d6;
    stim[53] = 42'h15bf8fee89f;
    stim[54] = 42'h18c516f0e2c;
    stim[55] = 42'h0684c2674dc;
    stim[56] = 42'h0b4438226cd;
    stim[57] = 42'h0d6636b17c7;
    stim[58] = 42'h10247936ba2;
    stim[59] = 42'h38c06de8bfe;
    stim[60] = 42'h1fa57875254;
    stim[61] = 42'h13b0e3a67e1;
    stim[62] = 42'h017fd3cd42a;
    stim[63] = 42'h0cdd6114b78;
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
      expv[0] = 29'h055xxxxx;
      expv[1] = 29'h055xxxxx;
      expv[2] = 29'h06dxxxxx;
      expv[3] = 29'h06dxxxxx;
      expv[4] = 29'h05dxxxxx;
      expv[5] = 29'h055xxxxx;
      expv[6] = 29'h05dxxxxx;
      expv[7] = 29'h06dxxxxx;
      expv[8] = 29'h05dxxxxx;
      expv[9] = 29'h06dxxxxx;
      expv[10] = 29'h055xxxxx;
      expv[11] = 29'h06dxxxxx;
      expv[12] = 29'h05dxxxxx;
      expv[13] = 29'h05dxxxxx;
      expv[14] = 29'h05dxxxxx;
      expv[15] = 29'h065xxxxx;
      expv[16] = 29'h06dxxxxx;
      expv[17] = 29'h05dxxxxx;
      expv[18] = 29'h06dxxxxx;
      expv[19] = 29'h055xxxxx;
      expv[20] = 29'h05dxxxxx;
      expv[21] = 29'h055xxxxx;
      expv[22] = 29'h055xxxxx;
      expv[23] = 29'h065xxxxx;
      expv[24] = 29'h055xxxxx;
      expv[25] = 29'h05dxxxxx;
      expv[26] = 29'h05dxxxxx;
      expv[27] = 29'h05dxxxxx;
      expv[28] = 29'h06dxxxxx;
      expv[29] = 29'h065xxxxx;
      expv[30] = 29'h06dxxxxx;
      expv[31] = 29'h065xxxxx;
      expv[32] = 29'h06dxxxxx;
      expv[33] = 29'h065xxxxx;
      expv[34] = 29'h055xxxxx;
      expv[35] = 29'h06dxxxxx;
      expv[36] = 29'h055xxxxx;
      expv[37] = 29'h06dxxxxx;
      expv[38] = 29'h065xxxxx;
      expv[39] = 29'h05dxxxxx;
      expv[40] = 29'h065xxxxx;
      expv[41] = 29'h055xxxxx;
      expv[42] = 29'h06dxxxxx;
      expv[43] = 29'h065xxxxx;
      expv[44] = 29'h065xxxxx;
      expv[45] = 29'h05dxxxxx;
      expv[46] = 29'h05dxxxxx;
      expv[47] = 29'h06dxxxxx;
      expv[48] = 29'h065xxxxx;
      expv[49] = 29'h055xxxxx;
      expv[50] = 29'h05dxxxxx;
      expv[51] = 29'h065xxxxx;
      expv[52] = 29'h055xxxxx;
      expv[53] = 29'h05dxxxxx;
      expv[54] = 29'h06dxxxxx;
      expv[55] = 29'h065xxxxx;
      expv[56] = 29'h06dxxxxx;
      expv[57] = 29'h06dxxxxx;
      expv[58] = 29'h055xxxxx;
      expv[59] = 29'h055xxxxx;
      expv[60] = 29'h055xxxxx;
      expv[61] = 29'h065xxxxx;
      expv[62] = 29'h065xxxxx;
      expv[63] = 29'h055xxxxx;
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
