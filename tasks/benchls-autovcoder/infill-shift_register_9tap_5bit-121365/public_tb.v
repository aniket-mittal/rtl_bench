// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121365 dut (
    .clk(clk),
    .data(in_vec[9:5]),
    .ce(in_vec[4:4]),
    .a(in_vec[3:0]),
    .q(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2e4;
    stim[1] = 10'h2dc;
    stim[2] = 10'h20d;
    stim[3] = 10'h1ec;
    stim[4] = 10'h199;
    stim[5] = 10'h004;
    stim[6] = 10'h1ae;
    stim[7] = 10'h0d4;
    stim[8] = 10'h278;
    stim[9] = 10'h1f6;
    stim[10] = 10'h149;
    stim[11] = 10'h3e9;
    stim[12] = 10'h2e7;
    stim[13] = 10'h358;
    stim[14] = 10'h30a;
    stim[15] = 10'h2f1;
    stim[16] = 10'h07c;
    stim[17] = 10'h24e;
    stim[18] = 10'h240;
    stim[19] = 10'h216;
    stim[20] = 10'h2c8;
    stim[21] = 10'h02a;
    stim[22] = 10'h13c;
    stim[23] = 10'h12f;
    stim[24] = 10'h052;
    stim[25] = 10'h35f;
    stim[26] = 10'h182;
    stim[27] = 10'h1c2;
    stim[28] = 10'h2f3;
    stim[29] = 10'h159;
    stim[30] = 10'h145;
    stim[31] = 10'h382;
    stim[32] = 10'h1a7;
    stim[33] = 10'h01a;
    stim[34] = 10'h098;
    stim[35] = 10'h255;
    stim[36] = 10'h349;
    stim[37] = 10'h0d3;
    stim[38] = 10'h395;
    stim[39] = 10'h06e;
    stim[40] = 10'h3d0;
    stim[41] = 10'h09e;
    stim[42] = 10'h362;
    stim[43] = 10'h3d2;
    stim[44] = 10'h367;
    stim[45] = 10'h0ed;
    stim[46] = 10'h34b;
    stim[47] = 10'h05f;
    stim[48] = 10'h298;
    stim[49] = 10'h035;
    stim[50] = 10'h22d;
    stim[51] = 10'h175;
    stim[52] = 10'h09e;
    stim[53] = 10'h0ca;
    stim[54] = 10'h2c0;
    stim[55] = 10'h3f4;
    stim[56] = 10'h3e2;
    stim[57] = 10'h232;
    stim[58] = 10'h37a;
    stim[59] = 10'h0e4;
    stim[60] = 10'h0c0;
    stim[61] = 10'h25e;
    stim[62] = 10'h0f7;
    stim[63] = 10'h14d;
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
      expv[0] = 5'hxx;
      expv[1] = 5'hxx;
      expv[2] = 5'hxx;
      expv[3] = 5'hxx;
      expv[4] = 5'hxx;
      expv[5] = 5'hxx;
      expv[6] = 5'hxx;
      expv[7] = 5'hxx;
      expv[8] = 5'hxx;
      expv[9] = 5'hxx;
      expv[10] = 5'hxx;
      expv[11] = 5'hxx;
      expv[12] = 5'hxx;
      expv[13] = 5'hxx;
      expv[14] = 5'hxx;
      expv[15] = 5'h0f;
      expv[16] = 5'hxx;
      expv[17] = 5'hxx;
      expv[18] = 5'h03;
      expv[19] = 5'h0c;
      expv[20] = 5'h16;
      expv[21] = 5'h16;
      expv[22] = 5'h16;
      expv[23] = 5'h0c;
      expv[24] = 5'h03;
      expv[25] = 5'h06;
      expv[26] = 5'h09;
      expv[27] = 5'h09;
      expv[28] = 5'h10;
      expv[29] = 5'h0f;
      expv[30] = 5'h10;
      expv[31] = 5'h1a;
      expv[32] = 5'h17;
      expv[33] = 5'h1a;
      expv[34] = 5'h17;
      expv[35] = 5'h02;
      expv[36] = 5'h10;
      expv[37] = 5'h0a;
      expv[38] = 5'h17;
      expv[39] = 5'h02;
      expv[40] = 5'h1c;
      expv[41] = 5'h1a;
      expv[42] = 5'h1c;
      expv[43] = 5'h1c;
      expv[44] = 5'h00;
      expv[45] = 5'h0a;
      expv[46] = 5'h0a;
      expv[47] = 5'h0a;
      expv[48] = 5'h00;
      expv[49] = 5'h1c;
      expv[50] = 5'h12;
      expv[51] = 5'h1e;
      expv[52] = 5'h06;
      expv[53] = 5'h1c;
      expv[54] = 5'h04;
      expv[55] = 5'h02;
      expv[56] = 5'h0b;
      expv[57] = 5'h0b;
      expv[58] = 5'h04;
      expv[59] = 5'h0b;
      expv[60] = 5'h1b;
      expv[61] = 5'h1e;
      expv[62] = 5'h14;
      expv[63] = 5'h14;
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
