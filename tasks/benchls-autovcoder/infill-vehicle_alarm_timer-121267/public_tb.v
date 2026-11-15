// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121267 dut (
    .clock(clk),
    .reset(in_vec[9:9]),
    .parameter_selector(in_vec[8:7]),
    .time_value(in_vec[6:3]),
    .reprogram(in_vec[2:2]),
    .interval(in_vec[1:0]),
    .value(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2fd;
    stim[1] = 10'h219;
    stim[2] = 10'h137;
    stim[3] = 10'h0f3;
    stim[4] = 10'h0b8;
    stim[5] = 10'h0ee;
    stim[6] = 10'h17b;
    stim[7] = 10'h002;
    stim[8] = 10'h1cf;
    stim[9] = 10'h0b4;
    stim[10] = 10'h1fe;
    stim[11] = 10'h16f;
    stim[12] = 10'h0a8;
    stim[13] = 10'h050;
    stim[14] = 10'h171;
    stim[15] = 10'h0db;
    stim[16] = 10'h06d;
    stim[17] = 10'h1b6;
    stim[18] = 10'h1ca;
    stim[19] = 10'h050;
    stim[20] = 10'h1d0;
    stim[21] = 10'h0ad;
    stim[22] = 10'h19e;
    stim[23] = 10'h018;
    stim[24] = 10'h1ac;
    stim[25] = 10'h1e1;
    stim[26] = 10'h088;
    stim[27] = 10'h149;
    stim[28] = 10'h11a;
    stim[29] = 10'h0cb;
    stim[30] = 10'h0e0;
    stim[31] = 10'h1ea;
    stim[32] = 10'h060;
    stim[33] = 10'h1de;
    stim[34] = 10'h09a;
    stim[35] = 10'h00e;
    stim[36] = 10'h09d;
    stim[37] = 10'h12e;
    stim[38] = 10'h1d6;
    stim[39] = 10'h0e2;
    stim[40] = 10'h0aa;
    stim[41] = 10'h0c2;
    stim[42] = 10'h11c;
    stim[43] = 10'h1c3;
    stim[44] = 10'h0f7;
    stim[45] = 10'h1f3;
    stim[46] = 10'h0f5;
    stim[47] = 10'h1df;
    stim[48] = 10'h13e;
    stim[49] = 10'h09f;
    stim[50] = 10'h361;
    stim[51] = 10'h0ce;
    stim[52] = 10'h141;
    stim[53] = 10'h03c;
    stim[54] = 10'h154;
    stim[55] = 10'h1a1;
    stim[56] = 10'h13e;
    stim[57] = 10'h0eb;
    stim[58] = 10'h175;
    stim[59] = 10'h09a;
    stim[60] = 10'h041;
    stim[61] = 10'h19c;
    stim[62] = 10'h0a5;
    stim[63] = 10'h1d3;
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
      expv[0] = 4'hx;
      expv[1] = 4'h6;
      expv[2] = 4'h6;
      expv[3] = 4'ha;
      expv[4] = 4'h6;
      expv[5] = 4'h6;
      expv[6] = 4'ha;
      expv[7] = 4'h6;
      expv[8] = 4'h6;
      expv[9] = 4'h6;
      expv[10] = 4'h6;
      expv[11] = 4'h6;
      expv[12] = 4'h6;
      expv[13] = 4'h6;
      expv[14] = 4'h6;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hd;
      expv[19] = 4'hd;
      expv[20] = 4'hd;
      expv[21] = 4'hd;
      expv[22] = 4'hd;
      expv[23] = 4'hd;
      expv[24] = 4'hd;
      expv[25] = 4'h5;
      expv[26] = 4'hd;
      expv[27] = 4'h5;
      expv[28] = 4'hd;
      expv[29] = 4'h5;
      expv[30] = 4'hd;
      expv[31] = 4'hd;
      expv[32] = 4'hd;
      expv[33] = 4'hd;
      expv[34] = 4'hd;
      expv[35] = 4'hd;
      expv[36] = 4'hd;
      expv[37] = 4'hd;
      expv[38] = 4'hd;
      expv[39] = 4'h5;
      expv[40] = 4'h5;
      expv[41] = 4'h5;
      expv[42] = 4'h5;
      expv[43] = 4'ha;
      expv[44] = 4'ha;
      expv[45] = 4'ha;
      expv[46] = 4'ha;
      expv[47] = 4'ha;
      expv[48] = 4'ha;
      expv[49] = 4'ha;
      expv[50] = 4'h1;
      expv[51] = 4'h6;
      expv[52] = 4'h9;
      expv[53] = 4'h9;
      expv[54] = 4'h9;
      expv[55] = 4'h9;
      expv[56] = 4'h9;
      expv[57] = 4'ha;
      expv[58] = 4'ha;
      expv[59] = 4'he;
      expv[60] = 4'h9;
      expv[61] = 4'h9;
      expv[62] = 4'h9;
      expv[63] = 4'h3;
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
