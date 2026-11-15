// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_127288 dut (
    .clk(clk),
    .rst_n(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0dfc2;
    stim[1] = 17'h03b98;
    stim[2] = 17'h15b5d;
    stim[3] = 17'h18953;
    stim[4] = 17'h10bc6;
    stim[5] = 17'h1d9d5;
    stim[6] = 17'h104bf;
    stim[7] = 17'h12f1c;
    stim[8] = 17'h19c77;
    stim[9] = 17'h172b7;
    stim[10] = 17'h1506b;
    stim[11] = 17'h13a47;
    stim[12] = 17'h10760;
    stim[13] = 17'h1b079;
    stim[14] = 17'h19109;
    stim[15] = 17'h194a9;
    stim[16] = 17'h1728e;
    stim[17] = 17'h1d57e;
    stim[18] = 17'h1ef00;
    stim[19] = 17'h1a6d8;
    stim[20] = 17'h1a2de;
    stim[21] = 17'h1559b;
    stim[22] = 17'h1e8d0;
    stim[23] = 17'h18746;
    stim[24] = 17'h17f24;
    stim[25] = 17'h1e7a1;
    stim[26] = 17'h15e48;
    stim[27] = 17'h1bc99;
    stim[28] = 17'h1ba8a;
    stim[29] = 17'h133fa;
    stim[30] = 17'h14418;
    stim[31] = 17'h17957;
    stim[32] = 17'h15efa;
    stim[33] = 17'h1df83;
    stim[34] = 17'h13320;
    stim[35] = 17'h15e11;
    stim[36] = 17'h12800;
    stim[37] = 17'h17147;
    stim[38] = 17'h1b7a7;
    stim[39] = 17'h102a0;
    stim[40] = 17'h1269d;
    stim[41] = 17'h1844b;
    stim[42] = 17'h1d39b;
    stim[43] = 17'h1a2bd;
    stim[44] = 17'h186bf;
    stim[45] = 17'h1110c;
    stim[46] = 17'h1b49d;
    stim[47] = 17'h15c71;
    stim[48] = 17'h1750a;
    stim[49] = 17'h1512f;
    stim[50] = 17'h18a30;
    stim[51] = 17'h1ce55;
    stim[52] = 17'h1fc0c;
    stim[53] = 17'h17a2a;
    stim[54] = 17'h107f7;
    stim[55] = 17'h1660a;
    stim[56] = 17'h1e47c;
    stim[57] = 17'h1cfdb;
    stim[58] = 17'h17a63;
    stim[59] = 17'h1bc76;
    stim[60] = 17'h1227f;
    stim[61] = 17'h19a55;
    stim[62] = 17'h19fad;
    stim[63] = 17'h1c50a;
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
      expv[3] = 16'h0000;
      expv[4] = 16'h5b5d;
      expv[5] = 16'h400d;
      expv[6] = 16'h79c9;
      expv[7] = 16'h316e;
      expv[8] = 16'h5660;
      expv[9] = 16'h339c;
      expv[10] = 16'hcfd9;
      expv[11] = 16'h02ef;
      expv[12] = 16'h0260;
      expv[13] = 16'he1da;
      expv[14] = 16'h1032;
      expv[15] = 16'h4671;
      expv[16] = 16'hcfeb;
      expv[17] = 16'h36a6;
      expv[18] = 16'h71c9;
      expv[19] = 16'h0334;
      expv[20] = 16'h035b;
      expv[21] = 16'h2186;
      expv[22] = 16'h15e9;
      expv[23] = 16'h19a5;
      expv[24] = 16'h90d1;
      expv[25] = 16'h4c51;
      expv[26] = 16'h719d;
      expv[27] = 16'h3364;
      expv[28] = 16'h5e57;
      expv[29] = 16'h6c3b;
      expv[30] = 16'h7ee7;
      expv[31] = 16'h82f5;
      expv[32] = 16'h27a1;
      expv[33] = 16'hf15c;
      expv[34] = 16'hc94b;
      expv[35] = 16'hea8b;
      expv[36] = 16'hb68f;
      expv[37] = 16'ha902;
      expv[38] = 16'h0da9;
      expv[39] = 16'h7143;
      expv[40] = 16'he212;
      expv[41] = 16'hd3c9;
      expv[42] = 16'h930d;
      expv[43] = 16'h22b6;
      expv[44] = 16'h15a2;
      expv[45] = 16'hf7fb;
      expv[46] = 16'hed8b;
      expv[47] = 16'ha0e1;
      expv[48] = 16'h1928;
      expv[49] = 16'hf046;
      expv[50] = 16'hccd8;
      expv[51] = 16'h62d3;
      expv[52] = 16'h5120;
      expv[53] = 16'h0306;
      expv[54] = 16'h102c;
      expv[55] = 16'h3eb0;
      expv[56] = 16'h7d0f;
      expv[57] = 16'h5e0c;
      expv[58] = 16'h7283;
      expv[59] = 16'hf5bb;
      expv[60] = 16'h2c9a;
      expv[61] = 16'h747d;
      expv[62] = 16'hd0fd;
      expv[63] = 16'ha03a;
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
