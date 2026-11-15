// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03602 dut (
    .clock(clk),
    .in(in_vec[8:1]),
    .enable_l(in_vec[0:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h121;
    stim[1] = 9'h193;
    stim[2] = 9'h114;
    stim[3] = 9'h17f;
    stim[4] = 9'h140;
    stim[5] = 9'h1c3;
    stim[6] = 9'h0cf;
    stim[7] = 9'h173;
    stim[8] = 9'h108;
    stim[9] = 9'h02c;
    stim[10] = 9'h034;
    stim[11] = 9'h1d3;
    stim[12] = 9'h16e;
    stim[13] = 9'h090;
    stim[14] = 9'h0bf;
    stim[15] = 9'h0f9;
    stim[16] = 9'h1ae;
    stim[17] = 9'h12d;
    stim[18] = 9'h040;
    stim[19] = 9'h046;
    stim[20] = 9'h11b;
    stim[21] = 9'h00a;
    stim[22] = 9'h0ae;
    stim[23] = 9'h0e7;
    stim[24] = 9'h0b1;
    stim[25] = 9'h1ff;
    stim[26] = 9'h193;
    stim[27] = 9'h0bc;
    stim[28] = 9'h0ca;
    stim[29] = 9'h0ce;
    stim[30] = 9'h012;
    stim[31] = 9'h0b4;
    stim[32] = 9'h132;
    stim[33] = 9'h17c;
    stim[34] = 9'h112;
    stim[35] = 9'h14c;
    stim[36] = 9'h123;
    stim[37] = 9'h01f;
    stim[38] = 9'h1e9;
    stim[39] = 9'h1b7;
    stim[40] = 9'h010;
    stim[41] = 9'h124;
    stim[42] = 9'h1f5;
    stim[43] = 9'h019;
    stim[44] = 9'h094;
    stim[45] = 9'h1c8;
    stim[46] = 9'h149;
    stim[47] = 9'h009;
    stim[48] = 9'h1a3;
    stim[49] = 9'h105;
    stim[50] = 9'h186;
    stim[51] = 9'h18e;
    stim[52] = 9'h0db;
    stim[53] = 9'h042;
    stim[54] = 9'h162;
    stim[55] = 9'h15c;
    stim[56] = 9'h0af;
    stim[57] = 9'h191;
    stim[58] = 9'h02e;
    stim[59] = 9'h137;
    stim[60] = 9'h068;
    stim[61] = 9'h11a;
    stim[62] = 9'h0fb;
    stim[63] = 9'h0fe;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'h8a;
      expv[4] = 8'h8a;
      expv[5] = 8'ha0;
      expv[6] = 8'ha0;
      expv[7] = 8'ha0;
      expv[8] = 8'ha0;
      expv[9] = 8'h84;
      expv[10] = 8'h16;
      expv[11] = 8'h1a;
      expv[12] = 8'h1a;
      expv[13] = 8'hb7;
      expv[14] = 8'h48;
      expv[15] = 8'h48;
      expv[16] = 8'h48;
      expv[17] = 8'hd7;
      expv[18] = 8'hd7;
      expv[19] = 8'h20;
      expv[20] = 8'h23;
      expv[21] = 8'h23;
      expv[22] = 8'h05;
      expv[23] = 8'h57;
      expv[24] = 8'h57;
      expv[25] = 8'h57;
      expv[26] = 8'h57;
      expv[27] = 8'h57;
      expv[28] = 8'h5e;
      expv[29] = 8'h65;
      expv[30] = 8'h67;
      expv[31] = 8'h09;
      expv[32] = 8'h5a;
      expv[33] = 8'h99;
      expv[34] = 8'hbe;
      expv[35] = 8'h89;
      expv[36] = 8'ha6;
      expv[37] = 8'ha6;
      expv[38] = 8'ha6;
      expv[39] = 8'ha6;
      expv[40] = 8'ha6;
      expv[41] = 8'h08;
      expv[42] = 8'h92;
      expv[43] = 8'h92;
      expv[44] = 8'h92;
      expv[45] = 8'h4a;
      expv[46] = 8'he4;
      expv[47] = 8'he4;
      expv[48] = 8'he4;
      expv[49] = 8'he4;
      expv[50] = 8'he4;
      expv[51] = 8'hc3;
      expv[52] = 8'hc7;
      expv[53] = 8'hc7;
      expv[54] = 8'h21;
      expv[55] = 8'hb1;
      expv[56] = 8'hae;
      expv[57] = 8'hae;
      expv[58] = 8'hae;
      expv[59] = 8'h17;
      expv[60] = 8'h17;
      expv[61] = 8'h34;
      expv[62] = 8'h8d;
      expv[63] = 8'h8d;
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
