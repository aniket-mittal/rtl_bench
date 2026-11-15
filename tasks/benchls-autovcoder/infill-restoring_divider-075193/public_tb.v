// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075193 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dvsr(in_vec[15:8]),
    .dvnd(in_vec[7:0]),
    .ready(out_vec[17:17]),
    .done_tick(out_vec[16:16]),
    .quo(out_vec[15:8]),
    .rmd(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2f170;
    stim[1] = 18'h31cee;
    stim[2] = 18'h0ed51;
    stim[3] = 18'h1804b;
    stim[4] = 18'h16baa;
    stim[5] = 18'h1c0cd;
    stim[6] = 18'h0d620;
    stim[7] = 18'h1f40e;
    stim[8] = 18'h0a340;
    stim[9] = 18'h19ff0;
    stim[10] = 18'h15474;
    stim[11] = 18'h13ff6;
    stim[12] = 18'h0078a;
    stim[13] = 18'h14061;
    stim[14] = 18'h0483c;
    stim[15] = 18'h0301e;
    stim[16] = 18'h1f514;
    stim[17] = 18'h0a806;
    stim[18] = 18'h0baed;
    stim[19] = 18'h1e361;
    stim[20] = 18'h08309;
    stim[21] = 18'h17a46;
    stim[22] = 18'h02733;
    stim[23] = 18'h1a039;
    stim[24] = 18'h055c4;
    stim[25] = 18'h1db17;
    stim[26] = 18'h0e3e1;
    stim[27] = 18'h0c5d9;
    stim[28] = 18'h1dd32;
    stim[29] = 18'h1bbed;
    stim[30] = 18'h02d8a;
    stim[31] = 18'h1ffe4;
    stim[32] = 18'h1b04a;
    stim[33] = 18'h0ceae;
    stim[34] = 18'h1b072;
    stim[35] = 18'h1973a;
    stim[36] = 18'h150bf;
    stim[37] = 18'h12140;
    stim[38] = 18'h1edb2;
    stim[39] = 18'h1a964;
    stim[40] = 18'h06f32;
    stim[41] = 18'h1d06b;
    stim[42] = 18'h0240f;
    stim[43] = 18'h0e990;
    stim[44] = 18'h19eab;
    stim[45] = 18'h065f7;
    stim[46] = 18'h0f2e2;
    stim[47] = 18'h13b00;
    stim[48] = 18'h0bdb0;
    stim[49] = 18'h1d2a3;
    stim[50] = 18'h1c7c8;
    stim[51] = 18'h15d76;
    stim[52] = 18'h10ec7;
    stim[53] = 18'h10b90;
    stim[54] = 18'h1e9d7;
    stim[55] = 18'h1efa3;
    stim[56] = 18'h0d3be;
    stim[57] = 18'h03740;
    stim[58] = 18'h023c5;
    stim[59] = 18'h1613b;
    stim[60] = 18'h122be;
    stim[61] = 18'h17e1e;
    stim[62] = 18'h0803a;
    stim[63] = 18'h1854e;
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
      expv[0] = 18'h20000;
      expv[1] = 18'h20000;
      expv[2] = 18'h20000;
      expv[3] = 18'h20000;
      expv[4] = 18'h04b00;
      expv[5] = 18'h09600;
      expv[6] = 18'h02c01;
      expv[7] = 18'h05802;
      expv[8] = 18'h1b002;
      expv[9] = 18'h2b002;
      expv[10] = 18'h0f000;
      expv[11] = 18'h0e001;
      expv[12] = 18'h0c003;
      expv[13] = 18'h08007;
      expv[14] = 18'h10007;
      expv[15] = 18'h20007;
      expv[16] = 18'h20007;
      expv[17] = 18'h01400;
      expv[18] = 18'h02800;
      expv[19] = 18'h05000;
      expv[20] = 18'h0a000;
      expv[21] = 18'h14000;
      expv[22] = 18'h24000;
      expv[23] = 18'h24000;
      expv[24] = 18'h03900;
      expv[25] = 18'h07200;
      expv[26] = 18'h0e400;
      expv[27] = 18'h0c801;
      expv[28] = 18'h19001;
      expv[29] = 18'h29001;
      expv[30] = 18'h0ed00;
      expv[31] = 18'h0da01;
      expv[32] = 18'h0b403;
      expv[33] = 18'h06807;
      expv[34] = 18'h1d007;
      expv[35] = 18'h2d007;
      expv[36] = 18'h03a00;
      expv[37] = 18'h07400;
      expv[38] = 18'h0e800;
      expv[39] = 18'h0d001;
      expv[40] = 18'h1a001;
      expv[41] = 18'h2a001;
      expv[42] = 18'h06b00;
      expv[43] = 18'h0d600;
      expv[44] = 18'h0ac01;
      expv[45] = 18'h05803;
      expv[46] = 18'h1b003;
      expv[47] = 18'h2b003;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h10000;
      expv[53] = 18'h20000;
      expv[54] = 18'h09000;
      expv[55] = 18'h02001;
      expv[56] = 18'h04002;
      expv[57] = 18'h08004;
      expv[58] = 18'h10004;
      expv[59] = 18'h20004;
      expv[60] = 18'h03b00;
      expv[61] = 18'h07600;
      expv[62] = 18'h0ec00;
      expv[63] = 18'h0d801;
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
