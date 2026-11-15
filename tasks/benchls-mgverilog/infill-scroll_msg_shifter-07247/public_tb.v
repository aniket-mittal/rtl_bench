// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07247 dut (
    .clk(clk),
    .clr(in_vec[20:20]),
    .scroll_datain_QU(in_vec[19:0]),
    .scroll_dataout_QU(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h17c382;
    stim[1] = 21'h1dcc28;
    stim[2] = 21'h0a3a50;
    stim[3] = 21'h04bc4f;
    stim[4] = 21'h06f6c5;
    stim[5] = 21'h09fec8;
    stim[6] = 21'h0470c3;
    stim[7] = 21'h03be2a;
    stim[8] = 21'h05fb95;
    stim[9] = 21'h0aa0ab;
    stim[10] = 21'h0bc7f0;
    stim[11] = 21'h07f251;
    stim[12] = 21'h0ff70e;
    stim[13] = 21'h0f1fce;
    stim[14] = 21'h0168bc;
    stim[15] = 21'h05dee9;
    stim[16] = 21'h0faf70;
    stim[17] = 21'h01f70b;
    stim[18] = 21'h0d2fd9;
    stim[19] = 21'h0a5ce8;
    stim[20] = 21'h0e2602;
    stim[21] = 21'h0c107c;
    stim[22] = 21'h0a040e;
    stim[23] = 21'h0357b4;
    stim[24] = 21'h016c93;
    stim[25] = 21'h008ce1;
    stim[26] = 21'h00d9be;
    stim[27] = 21'h0a02b2;
    stim[28] = 21'h0c0737;
    stim[29] = 21'h032e76;
    stim[30] = 21'h03fec9;
    stim[31] = 21'h0c7d7d;
    stim[32] = 21'h07d452;
    stim[33] = 21'h04f798;
    stim[34] = 21'h04547a;
    stim[35] = 21'h06c290;
    stim[36] = 21'h0bb202;
    stim[37] = 21'h0fbb52;
    stim[38] = 21'h181dfa;
    stim[39] = 21'h03ae97;
    stim[40] = 21'h0b9763;
    stim[41] = 21'h09feae;
    stim[42] = 21'h0819b8;
    stim[43] = 21'h07bcc4;
    stim[44] = 21'h0936b0;
    stim[45] = 21'h08a392;
    stim[46] = 21'h06e348;
    stim[47] = 21'h082b3b;
    stim[48] = 21'h0b0b66;
    stim[49] = 21'h002c37;
    stim[50] = 21'h0db7da;
    stim[51] = 21'h0e0d39;
    stim[52] = 21'h07e689;
    stim[53] = 21'h0cc967;
    stim[54] = 21'h038064;
    stim[55] = 21'h097640;
    stim[56] = 21'h0642de;
    stim[57] = 21'h0b4768;
    stim[58] = 21'h02d08f;
    stim[59] = 21'h0f5668;
    stim[60] = 21'h027661;
    stim[61] = 21'h002542;
    stim[62] = 21'h08b877;
    stim[63] = 21'h0e6208;
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
      expv[0] = 16'hc382;
      expv[1] = 16'hc382;
      expv[2] = 16'hc382;
      expv[3] = 16'hc382;
      expv[4] = 16'hc382;
      expv[5] = 16'hc382;
      expv[6] = 16'hc382;
      expv[7] = 16'hc382;
      expv[8] = 16'hc382;
      expv[9] = 16'hc382;
      expv[10] = 16'hc382;
      expv[11] = 16'hc382;
      expv[12] = 16'hc382;
      expv[13] = 16'hc382;
      expv[14] = 16'hc382;
      expv[15] = 16'hc382;
      expv[16] = 16'hc382;
      expv[17] = 16'hc382;
      expv[18] = 16'hc382;
      expv[19] = 16'hc382;
      expv[20] = 16'hc382;
      expv[21] = 16'hc382;
      expv[22] = 16'hc382;
      expv[23] = 16'hc382;
      expv[24] = 16'hc382;
      expv[25] = 16'hc382;
      expv[26] = 16'hc382;
      expv[27] = 16'hc382;
      expv[28] = 16'hc382;
      expv[29] = 16'hc382;
      expv[30] = 16'hc382;
      expv[31] = 16'hc382;
      expv[32] = 16'hc382;
      expv[33] = 16'hc382;
      expv[34] = 16'hc382;
      expv[35] = 16'hc382;
      expv[36] = 16'hc382;
      expv[37] = 16'hc382;
      expv[38] = 16'h1dfa;
      expv[39] = 16'h1dfa;
      expv[40] = 16'h1dfa;
      expv[41] = 16'h1dfa;
      expv[42] = 16'h1dfa;
      expv[43] = 16'h1dfa;
      expv[44] = 16'h1dfa;
      expv[45] = 16'h1dfa;
      expv[46] = 16'h1dfa;
      expv[47] = 16'h1dfa;
      expv[48] = 16'h1dfa;
      expv[49] = 16'h1dfa;
      expv[50] = 16'h1dfa;
      expv[51] = 16'h1dfa;
      expv[52] = 16'h1dfa;
      expv[53] = 16'h1dfa;
      expv[54] = 16'h1dfa;
      expv[55] = 16'h1dfa;
      expv[56] = 16'h1dfa;
      expv[57] = 16'h1dfa;
      expv[58] = 16'h1dfa;
      expv[59] = 16'h1dfa;
      expv[60] = 16'h1dfa;
      expv[61] = 16'h1dfa;
      expv[62] = 16'h1dfa;
      expv[63] = 16'h1dfa;
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
