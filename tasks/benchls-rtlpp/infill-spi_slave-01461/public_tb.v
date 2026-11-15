// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01461 dut (
    .sck(clk),
    .rstb(in_vec[11:11]),
    .tdata(in_vec[10:3]),
    .mlb(in_vec[2:2]),
    .ss(in_vec[1:1]),
    .sdin(in_vec[0:0]),
    .tdata_re(out_vec[10:10]),
    .sdout(out_vec[9:9]),
    .done(out_vec[8:8]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf07;
    stim[1] = 12'hab2;
    stim[2] = 12'h22f;
    stim[3] = 12'h4d3;
    stim[4] = 12'h170;
    stim[5] = 12'h307;
    stim[6] = 12'h7c3;
    stim[7] = 12'h5a7;
    stim[8] = 12'h5c5;
    stim[9] = 12'h137;
    stim[10] = 12'h4e0;
    stim[11] = 12'h7d6;
    stim[12] = 12'h052;
    stim[13] = 12'h05b;
    stim[14] = 12'h37e;
    stim[15] = 12'hc16;
    stim[16] = 12'h1c9;
    stim[17] = 12'h77b;
    stim[18] = 12'h1ce;
    stim[19] = 12'h6af;
    stim[20] = 12'h375;
    stim[21] = 12'h2bb;
    stim[22] = 12'h1aa;
    stim[23] = 12'h307;
    stim[24] = 12'h375;
    stim[25] = 12'h4c2;
    stim[26] = 12'h7bb;
    stim[27] = 12'h6ce;
    stim[28] = 12'h180;
    stim[29] = 12'h3d8;
    stim[30] = 12'h790;
    stim[31] = 12'h62c;
    stim[32] = 12'h551;
    stim[33] = 12'h50a;
    stim[34] = 12'h41e;
    stim[35] = 12'h56d;
    stim[36] = 12'h0d1;
    stim[37] = 12'h189;
    stim[38] = 12'h60c;
    stim[39] = 12'h015;
    stim[40] = 12'h625;
    stim[41] = 12'h586;
    stim[42] = 12'h6ab;
    stim[43] = 12'h430;
    stim[44] = 12'h789;
    stim[45] = 12'h03a;
    stim[46] = 12'h5f8;
    stim[47] = 12'h044;
    stim[48] = 12'h7a4;
    stim[49] = 12'h071;
    stim[50] = 12'h444;
    stim[51] = 12'h565;
    stim[52] = 12'h6a1;
    stim[53] = 12'h5b8;
    stim[54] = 12'h1a2;
    stim[55] = 12'h064;
    stim[56] = 12'h572;
    stim[57] = 12'h6e8;
    stim[58] = 12'h38f;
    stim[59] = 12'h5c9;
    stim[60] = 12'h45d;
    stim[61] = 12'h091;
    stim[62] = 12'h30a;
    stim[63] = 12'h5c7;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hx00;
      expv[4] = 11'h200;
      expv[5] = 11'hx00;
      expv[6] = 11'hx00;
      expv[7] = 11'hx00;
      expv[8] = 11'h200;
      expv[9] = 11'hx00;
      expv[10] = 11'h200;
      expv[11] = 11'hx00;
      expv[12] = 11'hx00;
      expv[13] = 11'hx00;
      expv[14] = 11'hx00;
      expv[15] = 11'hx00;
      expv[16] = 11'h200;
      expv[17] = 11'hx00;
      expv[18] = 11'hx00;
      expv[19] = 11'hx00;
      expv[20] = 11'h200;
      expv[21] = 11'hx00;
      expv[22] = 11'hx00;
      expv[23] = 11'hx00;
      expv[24] = 11'h200;
      expv[25] = 11'hx00;
      expv[26] = 11'hx00;
      expv[27] = 11'hx00;
      expv[28] = 11'h200;
      expv[29] = 11'h200;
      expv[30] = 11'h200;
      expv[31] = 11'h200;
      expv[32] = 11'h200;
      expv[33] = 11'hx00;
      expv[34] = 11'hx00;
      expv[35] = 11'h200;
      expv[36] = 11'h200;
      expv[37] = 11'h200;
      expv[38] = 11'h200;
      expv[39] = 11'h200;
      expv[40] = 11'h200;
      expv[41] = 11'hx00;
      expv[42] = 11'hx00;
      expv[43] = 11'h200;
      expv[44] = 11'h200;
      expv[45] = 11'hx00;
      expv[46] = 11'h200;
      expv[47] = 11'h200;
      expv[48] = 11'h200;
      expv[49] = 11'h200;
      expv[50] = 11'h200;
      expv[51] = 11'h200;
      expv[52] = 11'h200;
      expv[53] = 11'h200;
      expv[54] = 11'hx00;
      expv[55] = 11'h200;
      expv[56] = 11'hx00;
      expv[57] = 11'h200;
      expv[58] = 11'hx00;
      expv[59] = 11'h200;
      expv[60] = 11'h200;
      expv[61] = 11'h200;
      expv[62] = 11'hx00;
      expv[63] = 11'hx00;
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
