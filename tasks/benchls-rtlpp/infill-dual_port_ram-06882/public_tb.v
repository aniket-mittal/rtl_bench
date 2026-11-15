// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06882 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h09d05;
    stim[1] = 17'h1ae3e;
    stim[2] = 17'h15a3a;
    stim[3] = 17'h01909;
    stim[4] = 17'h040cc;
    stim[5] = 17'h149b1;
    stim[6] = 17'h0c661;
    stim[7] = 17'h1abc4;
    stim[8] = 17'h0a7c9;
    stim[9] = 17'h014b9;
    stim[10] = 17'h093a4;
    stim[11] = 17'h16a4e;
    stim[12] = 17'h196f0;
    stim[13] = 17'h1f72f;
    stim[14] = 17'h11674;
    stim[15] = 17'h00eee;
    stim[16] = 17'h1c8cb;
    stim[17] = 17'h16ecb;
    stim[18] = 17'h0bdfb;
    stim[19] = 17'h11f51;
    stim[20] = 17'h102ac;
    stim[21] = 17'h0e61f;
    stim[22] = 17'h1bbb0;
    stim[23] = 17'h1e8ab;
    stim[24] = 17'h0d010;
    stim[25] = 17'h0d874;
    stim[26] = 17'h118f5;
    stim[27] = 17'h0dbef;
    stim[28] = 17'h187fd;
    stim[29] = 17'h0a65f;
    stim[30] = 17'h10375;
    stim[31] = 17'h09436;
    stim[32] = 17'h1fc9e;
    stim[33] = 17'h195be;
    stim[34] = 17'h0cd53;
    stim[35] = 17'h1b2f1;
    stim[36] = 17'h1ccd6;
    stim[37] = 17'h0a2d1;
    stim[38] = 17'h0f880;
    stim[39] = 17'h00c73;
    stim[40] = 17'h18b34;
    stim[41] = 17'h14c3c;
    stim[42] = 17'h10f36;
    stim[43] = 17'h19891;
    stim[44] = 17'h0ac2e;
    stim[45] = 17'h06cc6;
    stim[46] = 17'h0311e;
    stim[47] = 17'h15f4d;
    stim[48] = 17'h0b715;
    stim[49] = 17'h1adc8;
    stim[50] = 17'h150d3;
    stim[51] = 17'h1c493;
    stim[52] = 17'h07559;
    stim[53] = 17'h12c7e;
    stim[54] = 17'h05fa0;
    stim[55] = 17'h06b27;
    stim[56] = 17'h1e33c;
    stim[57] = 17'h1bf4b;
    stim[58] = 17'h1de20;
    stim[59] = 17'h0ad28;
    stim[60] = 17'h071c8;
    stim[61] = 17'h0ee85;
    stim[62] = 17'h01a31;
    stim[63] = 17'h11e1a;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'h3e;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hb1;
      expv[11] = 8'hxx;
      expv[12] = 8'hc4;
      expv[13] = 8'h4e;
      expv[14] = 8'hxx;
      expv[15] = 8'h4e;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'h2f;
      expv[21] = 8'hxx;
      expv[22] = 8'hcb;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hac;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hb0;
      expv[29] = 8'hxx;
      expv[30] = 8'hcb;
      expv[31] = 8'hxx;
      expv[32] = 8'hb1;
      expv[33] = 8'hcb;
      expv[34] = 8'h3a;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hcb;
      expv[38] = 8'hxx;
      expv[39] = 8'hfd;
      expv[40] = 8'hd6;
      expv[41] = 8'hf1;
      expv[42] = 8'hd6;
      expv[43] = 8'h9e;
      expv[44] = 8'h34;
      expv[45] = 8'hd6;
      expv[46] = 8'hd6;
      expv[47] = 8'hf5;
      expv[48] = 8'h9e;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'h36;
      expv[52] = 8'h3c;
      expv[53] = 8'hd3;
      expv[54] = 8'h93;
      expv[55] = 8'h9e;
      expv[56] = 8'hf1;
      expv[57] = 8'hxx;
      expv[58] = 8'h9e;
      expv[59] = 8'h3c;
      expv[60] = 8'h20;
      expv[61] = 8'hf5;
      expv[62] = 8'h3c;
      expv[63] = 8'hc8;
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
