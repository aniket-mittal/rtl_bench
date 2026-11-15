// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_125901 dut (
    .clk(clk),
    .plaintext(in_vec[32:17]),
    .key(in_vec[16:1]),
    .reset(in_vec[0:0]),
    .ciphertext(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0506dade7;
    stim[1] = 33'h1e46228ab;
    stim[2] = 33'h09472c8b2;
    stim[3] = 33'h1f702a792;
    stim[4] = 33'h03ee29bd6;
    stim[5] = 33'h0d994a5f2;
    stim[6] = 33'h0d0ba48f8;
    stim[7] = 33'h10b97b0b0;
    stim[8] = 33'h130e9ac98;
    stim[9] = 33'h1b84a8d58;
    stim[10] = 33'h072470bfc;
    stim[11] = 33'h0c6b1cbbc;
    stim[12] = 33'h1220bb192;
    stim[13] = 33'h1eae7a97b;
    stim[14] = 33'h0af811abc;
    stim[15] = 33'h176d86500;
    stim[16] = 33'h0333ae91a;
    stim[17] = 33'h07a69d8c2;
    stim[18] = 33'h05e9ac678;
    stim[19] = 33'h0acb27b7c;
    stim[20] = 33'h1327b36c8;
    stim[21] = 33'h0d6b71d96;
    stim[22] = 33'h1114dd246;
    stim[23] = 33'h042a270c6;
    stim[24] = 33'h12abced72;
    stim[25] = 33'h0961899ce;
    stim[26] = 33'h00eda691e;
    stim[27] = 33'h051eb7b9c;
    stim[28] = 33'h00ccdc832;
    stim[29] = 33'h0f11bab62;
    stim[30] = 33'h094bf8404;
    stim[31] = 33'h0e1ac79f4;
    stim[32] = 33'h104d9b726;
    stim[33] = 33'h19e8e0be2;
    stim[34] = 33'h01fce8e88;
    stim[35] = 33'h1c8d15802;
    stim[36] = 33'h1cfde11be;
    stim[37] = 33'h1c40f102e;
    stim[38] = 33'h06dba3126;
    stim[39] = 33'h190528bda;
    stim[40] = 33'h182fd842c;
    stim[41] = 33'h03cf1efac;
    stim[42] = 33'h153a6e04c;
    stim[43] = 33'h1af49ed0e;
    stim[44] = 33'h03b78f9c4;
    stim[45] = 33'h1c066deb0;
    stim[46] = 33'h0d3aedf76;
    stim[47] = 33'h042dae64e;
    stim[48] = 33'h0cd83a40c;
    stim[49] = 33'h0bf08b6d0;
    stim[50] = 33'h1be14ee8e;
    stim[51] = 33'h1bc651b0c;
    stim[52] = 33'h125d9a276;
    stim[53] = 33'h1a4cf1250;
    stim[54] = 33'h0a4232a0c;
    stim[55] = 33'h02a6227e8;
    stim[56] = 33'h0b4978d42;
    stim[57] = 33'h03e277dbc;
    stim[58] = 33'h1e2aea5ea;
    stim[59] = 33'h08b0b23fc;
    stim[60] = 33'h08477b084;
    stim[61] = 33'h139756b54;
    stim[62] = 33'h1dde1b948;
    stim[63] = 33'h1282ad91a;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h4927;
      expv[4] = 16'hdd89;
      expv[5] = 16'h515f;
      expv[6] = 16'h2cf1;
      expv[7] = 16'h4ae3;
      expv[8] = 16'hf470;
      expv[9] = 16'h824f;
      expv[10] = 16'hca1d;
      expv[11] = 16'h708d;
      expv[12] = 16'h19e2;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h1d58;
      expv[16] = 16'h93ed;
      expv[17] = 16'h562b;
      expv[18] = 16'h129f;
      expv[19] = 16'h53f1;
      expv[20] = 16'h497a;
      expv[21] = 16'hd22f;
      expv[22] = 16'h79e3;
      expv[23] = 16'ha605;
      expv[24] = 16'h50c2;
      expv[25] = 16'hb27a;
      expv[26] = 16'h1b21;
      expv[27] = 16'h5374;
      expv[28] = 16'h46c7;
      expv[29] = 16'h2354;
      expv[30] = 16'h4ea9;
      expv[31] = 16'h6b63;
      expv[32] = 16'h2eca;
      expv[33] = 16'h8364;
      expv[34] = 16'hfb51;
      expv[35] = 16'h7755;
      expv[36] = 16'h88f4;
      expv[37] = 16'hfff4;
      expv[38] = 16'heb80;
      expv[39] = 16'h47fa;
      expv[40] = 16'hc825;
      expv[41] = 16'hba66;
      expv[42] = 16'h017f;
      expv[43] = 16'hf4c3;
      expv[44] = 16'h9f1c;
      expv[45] = 16'h163f;
      expv[46] = 16'he886;
      expv[47] = 16'h7ec3;
      expv[48] = 16'h52e4;
      expv[49] = 16'h4dd0;
      expv[50] = 16'h1f19;
      expv[51] = 16'hb939;
      expv[52] = 16'ha91f;
      expv[53] = 16'h876c;
      expv[54] = 16'heb4c;
      expv[55] = 16'h490a;
      expv[56] = 16'h501e;
      expv[57] = 16'h6969;
      expv[58] = 16'h711b;
      expv[59] = 16'hfaca;
      expv[60] = 16'h5e10;
      expv[61] = 16'h6926;
      expv[62] = 16'ha43f;
      expv[63] = 16'h8dd7;
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
