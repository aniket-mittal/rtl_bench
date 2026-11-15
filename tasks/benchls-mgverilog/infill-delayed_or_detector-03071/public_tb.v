// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03071 dut (
    .clk(clk),
    .in(in_vec[31:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha474c405;
    stim[1] = 32'h19b31fa5;
    stim[2] = 32'h22d249f3;
    stim[3] = 32'h62e26e75;
    stim[4] = 32'h975830ef;
    stim[5] = 32'h81036d7a;
    stim[6] = 32'h43af5676;
    stim[7] = 32'hb7e4a266;
    stim[8] = 32'h03215ce3;
    stim[9] = 32'h9a9a52e9;
    stim[10] = 32'h92e33363;
    stim[11] = 32'h1c1f7b45;
    stim[12] = 32'h90eeee4b;
    stim[13] = 32'h984f676a;
    stim[14] = 32'hb7fec873;
    stim[15] = 32'h970f2b02;
    stim[16] = 32'h50a378c0;
    stim[17] = 32'h5110b630;
    stim[18] = 32'h4f3caecb;
    stim[19] = 32'h5b85300b;
    stim[20] = 32'h556babcd;
    stim[21] = 32'h486112ff;
    stim[22] = 32'hbc05d045;
    stim[23] = 32'hb463716f;
    stim[24] = 32'h29a225ed;
    stim[25] = 32'h979045e9;
    stim[26] = 32'hd87deaed;
    stim[27] = 32'hbdc0abcc;
    stim[28] = 32'h4b3a9c6d;
    stim[29] = 32'h826192a8;
    stim[30] = 32'hfb615d22;
    stim[31] = 32'h9acde595;
    stim[32] = 32'h7ddb008d;
    stim[33] = 32'h7f846ee0;
    stim[34] = 32'hc0baf9a7;
    stim[35] = 32'h97d8365e;
    stim[36] = 32'hf24a5723;
    stim[37] = 32'h14e7afa6;
    stim[38] = 32'hdeffe75d;
    stim[39] = 32'h876554b5;
    stim[40] = 32'h30405222;
    stim[41] = 32'hf8ac3f8e;
    stim[42] = 32'h24b3312e;
    stim[43] = 32'hecf5f3b2;
    stim[44] = 32'ha5cf3573;
    stim[45] = 32'hc0f8fe03;
    stim[46] = 32'hc9c87b0f;
    stim[47] = 32'hb01c93ca;
    stim[48] = 32'he61bdc9b;
    stim[49] = 32'h783b326b;
    stim[50] = 32'hcc072799;
    stim[51] = 32'hae588221;
    stim[52] = 32'h83480383;
    stim[53] = 32'hd08ac4af;
    stim[54] = 32'he545e81a;
    stim[55] = 32'h4f6f0e1b;
    stim[56] = 32'h2bb7828d;
    stim[57] = 32'hf486ba19;
    stim[58] = 32'h54c6d7f9;
    stim[59] = 32'hf0f4e030;
    stim[60] = 32'hfb88f4fb;
    stim[61] = 32'hf8473111;
    stim[62] = 32'he6b8e9b6;
    stim[63] = 32'h38dd650b;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
