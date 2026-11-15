// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03847 dut (
    .clk(clk),
    .din(in_vec[9:1]),
    .rdy(in_vec[0:0]),
    .dout(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h017;
    stim[1] = 10'h0b3;
    stim[2] = 10'h20e;
    stim[3] = 10'h155;
    stim[4] = 10'h071;
    stim[5] = 10'h33e;
    stim[6] = 10'h044;
    stim[7] = 10'h006;
    stim[8] = 10'h3cc;
    stim[9] = 10'h18c;
    stim[10] = 10'h0ec;
    stim[11] = 10'h131;
    stim[12] = 10'h0a0;
    stim[13] = 10'h357;
    stim[14] = 10'h33a;
    stim[15] = 10'h121;
    stim[16] = 10'h03d;
    stim[17] = 10'h0cb;
    stim[18] = 10'h33f;
    stim[19] = 10'h225;
    stim[20] = 10'h383;
    stim[21] = 10'h34c;
    stim[22] = 10'h2e1;
    stim[23] = 10'h0f8;
    stim[24] = 10'h18a;
    stim[25] = 10'h34d;
    stim[26] = 10'h1a4;
    stim[27] = 10'h18a;
    stim[28] = 10'h22a;
    stim[29] = 10'h159;
    stim[30] = 10'h04c;
    stim[31] = 10'h0da;
    stim[32] = 10'h15a;
    stim[33] = 10'h1a1;
    stim[34] = 10'h190;
    stim[35] = 10'h26c;
    stim[36] = 10'h0f7;
    stim[37] = 10'h072;
    stim[38] = 10'h1c8;
    stim[39] = 10'h2a6;
    stim[40] = 10'h1b5;
    stim[41] = 10'h3aa;
    stim[42] = 10'h397;
    stim[43] = 10'h17b;
    stim[44] = 10'h339;
    stim[45] = 10'h21f;
    stim[46] = 10'h067;
    stim[47] = 10'h191;
    stim[48] = 10'h2bd;
    stim[49] = 10'h37c;
    stim[50] = 10'h081;
    stim[51] = 10'h151;
    stim[52] = 10'h15e;
    stim[53] = 10'h2e8;
    stim[54] = 10'h094;
    stim[55] = 10'h31c;
    stim[56] = 10'h00d;
    stim[57] = 10'h237;
    stim[58] = 10'h162;
    stim[59] = 10'h0e0;
    stim[60] = 10'h21d;
    stim[61] = 10'h19c;
    stim[62] = 10'h28d;
    stim[63] = 10'h055;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'h00b;
      expv[5] = 9'h059;
      expv[6] = 9'h059;
      expv[7] = 9'h059;
      expv[8] = 9'h059;
      expv[9] = 9'h059;
      expv[10] = 9'h059;
      expv[11] = 9'h059;
      expv[12] = 9'h0aa;
      expv[13] = 9'h0aa;
      expv[14] = 9'h038;
      expv[15] = 9'h038;
      expv[16] = 9'h098;
      expv[17] = 9'h1ab;
      expv[18] = 9'h090;
      expv[19] = 9'h01e;
      expv[20] = 9'h065;
      expv[21] = 9'h19f;
      expv[22] = 9'h19f;
      expv[23] = 9'h112;
      expv[24] = 9'h112;
      expv[25] = 9'h112;
      expv[26] = 9'h1c1;
      expv[27] = 9'h1c1;
      expv[28] = 9'h1c1;
      expv[29] = 9'h1c1;
      expv[30] = 9'h170;
      expv[31] = 9'h170;
      expv[32] = 9'h170;
      expv[33] = 9'h170;
      expv[34] = 9'h1a6;
      expv[35] = 9'h1a6;
      expv[36] = 9'h1a6;
      expv[37] = 9'h0ac;
      expv[38] = 9'h0ac;
      expv[39] = 9'h0ac;
      expv[40] = 9'h0ac;
      expv[41] = 9'h0d0;
      expv[42] = 9'h0d0;
      expv[43] = 9'h07b;
      expv[44] = 9'h0da;
      expv[45] = 9'h1cb;
      expv[46] = 9'h0bd;
      expv[47] = 9'h19c;
      expv[48] = 9'h10f;
      expv[49] = 9'h033;
      expv[50] = 9'h033;
      expv[51] = 9'h0c8;
      expv[52] = 9'h15e;
      expv[53] = 9'h15e;
      expv[54] = 9'h15e;
      expv[55] = 9'h15e;
      expv[56] = 9'h15e;
      expv[57] = 9'h040;
      expv[58] = 9'h0a8;
      expv[59] = 9'h0a8;
      expv[60] = 9'h0a8;
      expv[61] = 9'h006;
      expv[62] = 9'h006;
      expv[63] = 9'h11b;
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
