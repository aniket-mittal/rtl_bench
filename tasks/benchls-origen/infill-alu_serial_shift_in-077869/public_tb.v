// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077869 dut (
    .clock(clk),
    .opcode(in_vec[8:6]),
    .data(in_vec[5:2]),
    .GO(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .result(out_vec[9:6]),
    .cout(out_vec[5:5]),
    .borrow(out_vec[4:4]),
    .LED(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h183;
    stim[1] = 9'h06b;
    stim[2] = 9'h1bc;
    stim[3] = 9'h00c;
    stim[4] = 9'h1a4;
    stim[5] = 9'h136;
    stim[6] = 9'h072;
    stim[7] = 9'h0e8;
    stim[8] = 9'h0ee;
    stim[9] = 9'h130;
    stim[10] = 9'h0fa;
    stim[11] = 9'h126;
    stim[12] = 9'h086;
    stim[13] = 9'h0ce;
    stim[14] = 9'h0a6;
    stim[15] = 9'h150;
    stim[16] = 9'h11e;
    stim[17] = 9'h19e;
    stim[18] = 9'h09b;
    stim[19] = 9'h0e4;
    stim[20] = 9'h08e;
    stim[21] = 9'h066;
    stim[22] = 9'h028;
    stim[23] = 9'h008;
    stim[24] = 9'h0e8;
    stim[25] = 9'h1e2;
    stim[26] = 9'h0b4;
    stim[27] = 9'h158;
    stim[28] = 9'h0bc;
    stim[29] = 9'h0f4;
    stim[30] = 9'h180;
    stim[31] = 9'h1e2;
    stim[32] = 9'h1de;
    stim[33] = 9'h0b6;
    stim[34] = 9'h1aa;
    stim[35] = 9'h15c;
    stim[36] = 9'h1c4;
    stim[37] = 9'h0da;
    stim[38] = 9'h00a;
    stim[39] = 9'h110;
    stim[40] = 9'h0e2;
    stim[41] = 9'h1e2;
    stim[42] = 9'h05e;
    stim[43] = 9'h18e;
    stim[44] = 9'h0c8;
    stim[45] = 9'h15c;
    stim[46] = 9'h1c4;
    stim[47] = 9'h12a;
    stim[48] = 9'h06c;
    stim[49] = 9'h02c;
    stim[50] = 9'h184;
    stim[51] = 9'h1e2;
    stim[52] = 9'h074;
    stim[53] = 9'h096;
    stim[54] = 9'h022;
    stim[55] = 9'h1a8;
    stim[56] = 9'h06a;
    stim[57] = 9'h156;
    stim[58] = 9'h0f8;
    stim[59] = 9'h1c2;
    stim[60] = 9'h14c;
    stim[61] = 9'h0da;
    stim[62] = 9'h084;
    stim[63] = 9'h02e;
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
      expv[0] = 10'h001;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h001;
      expv[4] = 10'h001;
      expv[5] = 10'h001;
      expv[6] = 10'h0d2;
      expv[7] = 10'h084;
      expv[8] = 10'h088;
      expv[9] = 10'h308;
      expv[10] = 10'h081;
      expv[11] = 10'h302;
      expv[12] = 10'h184;
      expv[13] = 10'h048;
      expv[14] = 10'h188;
      expv[15] = 10'h3c8;
      expv[16] = 10'h201;
      expv[17] = 10'h382;
      expv[18] = 10'h3c1;
      expv[19] = 10'h3c1;
      expv[20] = 10'h3c1;
      expv[21] = 10'h352;
      expv[22] = 10'h304;
      expv[23] = 10'h308;
      expv[24] = 10'h301;
      expv[25] = 10'h141;
      expv[26] = 10'h182;
      expv[27] = 10'h344;
      expv[28] = 10'h088;
      expv[29] = 10'h1c1;
      expv[30] = 10'h141;
      expv[31] = 10'h281;
      expv[32] = 10'h282;
      expv[33] = 10'h204;
      expv[34] = 10'h3c8;
      expv[35] = 10'h3c8;
      expv[36] = 10'h001;
      expv[37] = 10'h1c1;
      expv[38] = 10'h342;
      expv[39] = 10'h084;
      expv[40] = 10'h248;
      expv[41] = 10'h2c8;
      expv[42] = 10'h318;
      expv[43] = 10'h108;
      expv[44] = 10'h248;
      expv[45] = 10'h181;
      expv[46] = 10'h2c1;
      expv[47] = 10'h081;
      expv[48] = 10'h212;
      expv[49] = 10'h164;
      expv[50] = 10'h048;
      expv[51] = 10'h381;
      expv[52] = 10'h0c2;
      expv[53] = 10'h084;
      expv[54] = 10'h168;
      expv[55] = 10'h148;
      expv[56] = 10'h141;
      expv[57] = 10'h3c2;
      expv[58] = 10'h144;
      expv[59] = 10'h008;
      expv[60] = 10'h3c8;
      expv[61] = 10'h141;
      expv[62] = 10'h282;
      expv[63] = 10'h1c4;
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
