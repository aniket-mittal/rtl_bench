// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029037 dut (
    .clk(clk),
    .addr(in_vec[4:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1d;
    stim[1] = 5'h0a;
    stim[2] = 5'h08;
    stim[3] = 5'h05;
    stim[4] = 5'h07;
    stim[5] = 5'h07;
    stim[6] = 5'h1d;
    stim[7] = 5'h01;
    stim[8] = 5'h1f;
    stim[9] = 5'h1d;
    stim[10] = 5'h01;
    stim[11] = 5'h00;
    stim[12] = 5'h0e;
    stim[13] = 5'h02;
    stim[14] = 5'h15;
    stim[15] = 5'h02;
    stim[16] = 5'h12;
    stim[17] = 5'h1d;
    stim[18] = 5'h13;
    stim[19] = 5'h05;
    stim[20] = 5'h03;
    stim[21] = 5'h1e;
    stim[22] = 5'h10;
    stim[23] = 5'h11;
    stim[24] = 5'h1e;
    stim[25] = 5'h01;
    stim[26] = 5'h0c;
    stim[27] = 5'h0e;
    stim[28] = 5'h0e;
    stim[29] = 5'h1b;
    stim[30] = 5'h0c;
    stim[31] = 5'h1a;
    stim[32] = 5'h13;
    stim[33] = 5'h03;
    stim[34] = 5'h0c;
    stim[35] = 5'h14;
    stim[36] = 5'h0d;
    stim[37] = 5'h16;
    stim[38] = 5'h04;
    stim[39] = 5'h11;
    stim[40] = 5'h17;
    stim[41] = 5'h02;
    stim[42] = 5'h03;
    stim[43] = 5'h17;
    stim[44] = 5'h0e;
    stim[45] = 5'h00;
    stim[46] = 5'h05;
    stim[47] = 5'h1c;
    stim[48] = 5'h06;
    stim[49] = 5'h12;
    stim[50] = 5'h04;
    stim[51] = 5'h05;
    stim[52] = 5'h1a;
    stim[53] = 5'h04;
    stim[54] = 5'h07;
    stim[55] = 5'h0d;
    stim[56] = 5'h14;
    stim[57] = 5'h07;
    stim[58] = 5'h1f;
    stim[59] = 5'h11;
    stim[60] = 5'h11;
    stim[61] = 5'h07;
    stim[62] = 5'h00;
    stim[63] = 5'h10;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hc2c1;
      expv[4] = 16'h238e;
      expv[5] = 16'h2d41;
      expv[6] = 16'h3871;
      expv[7] = 16'h3179;
      expv[8] = 16'h3179;
      expv[9] = 16'hc2c1;
      expv[10] = 16'h3fb1;
      expv[11] = 16'hc04f;
      expv[12] = 16'hc2c1;
      expv[13] = 16'h3fb1;
      expv[14] = 16'h4000;
      expv[15] = 16'h0c7c;
      expv[16] = 16'h3ec5;
      expv[17] = 16'he1d5;
      expv[18] = 16'h3ec5;
      expv[19] = 16'hf384;
      expv[20] = 16'hc2c1;
      expv[21] = 16'hed6c;
      expv[22] = 16'h3871;
      expv[23] = 16'h3d3f;
      expv[24] = 16'hc13b;
      expv[25] = 16'h0000;
      expv[26] = 16'hf9ba;
      expv[27] = 16'hc13b;
      expv[28] = 16'h3fb1;
      expv[29] = 16'h187e;
      expv[30] = 16'h0c7c;
      expv[31] = 16'h0c7c;
      expv[32] = 16'hc78f;
      expv[33] = 16'h187e;
      expv[34] = 16'hcac9;
      expv[35] = 16'hed6c;
      expv[36] = 16'h3d3f;
      expv[37] = 16'h187e;
      expv[38] = 16'he782;
      expv[39] = 16'h1294;
      expv[40] = 16'hdc72;
      expv[41] = 16'h3b21;
      expv[42] = 16'hf9ba;
      expv[43] = 16'hd766;
      expv[44] = 16'h3ec5;
      expv[45] = 16'h3d3f;
      expv[46] = 16'hd766;
      expv[47] = 16'h0c7c;
      expv[48] = 16'h4000;
      expv[49] = 16'h3871;
      expv[50] = 16'hc4df;
      expv[51] = 16'h3537;
      expv[52] = 16'hf384;
      expv[53] = 16'h3b21;
      expv[54] = 16'h3871;
      expv[55] = 16'hcac9;
      expv[56] = 16'h3b21;
      expv[57] = 16'h3179;
      expv[58] = 16'h1294;
      expv[59] = 16'he782;
      expv[60] = 16'h3179;
      expv[61] = 16'hc04f;
      expv[62] = 16'hf9ba;
      expv[63] = 16'hf9ba;
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
