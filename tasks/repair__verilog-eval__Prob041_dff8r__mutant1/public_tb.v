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

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1ab;
    stim[1] = 9'h0a7;
    stim[2] = 9'h120;
    stim[3] = 9'h01c;
    stim[4] = 9'h106;
    stim[5] = 9'h0a2;
    stim[6] = 9'h14e;
    stim[7] = 9'h020;
    stim[8] = 9'h014;
    stim[9] = 9'h0c2;
    stim[10] = 9'h164;
    stim[11] = 9'h058;
    stim[12] = 9'h082;
    stim[13] = 9'h064;
    stim[14] = 9'h1c0;
    stim[15] = 9'h134;
    stim[16] = 9'h1f8;
    stim[17] = 9'h1a3;
    stim[18] = 9'h042;
    stim[19] = 9'h156;
    stim[20] = 9'h1b4;
    stim[21] = 9'h14e;
    stim[22] = 9'h0f0;
    stim[23] = 9'h12a;
    stim[24] = 9'h0d4;
    stim[25] = 9'h1e6;
    stim[26] = 9'h0de;
    stim[27] = 9'h0c0;
    stim[28] = 9'h012;
    stim[29] = 9'h1b0;
    stim[30] = 9'h12e;
    stim[31] = 9'h162;
    stim[32] = 9'h098;
    stim[33] = 9'h0f8;
    stim[34] = 9'h1ee;
    stim[35] = 9'h13e;
    stim[36] = 9'h19e;
    stim[37] = 9'h176;
    stim[38] = 9'h076;
    stim[39] = 9'h0a6;
    stim[40] = 9'h06e;
    stim[41] = 9'h17c;
    stim[42] = 9'h18e;
    stim[43] = 9'h12a;
    stim[44] = 9'h1be;
    stim[45] = 9'h0ec;
    stim[46] = 9'h110;
    stim[47] = 9'h166;
    stim[48] = 9'h05e;
    stim[49] = 9'h104;
    stim[50] = 9'h1b2;
    stim[51] = 9'h080;
    stim[52] = 9'h1c2;
    stim[53] = 9'h1a0;
    stim[54] = 9'h0ac;
    stim[55] = 9'h19c;
    stim[56] = 9'h0e4;
    stim[57] = 9'h094;
    stim[58] = 9'h04a;
    stim[59] = 9'h18e;
    stim[60] = 9'h02a;
    stim[61] = 9'h02e;
    stim[62] = 9'h0d0;
    stim[63] = 9'h128;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h09;
      expv[4] = 8'he0;
      expv[5] = 8'h38;
      expv[6] = 8'h15;
      expv[7] = 8'h7a;
      expv[8] = 8'h01;
      expv[9] = 8'ha0;
      expv[10] = 8'h16;
      expv[11] = 8'h2b;
      expv[12] = 8'hc2;
      expv[13] = 8'h14;
      expv[14] = 8'h23;
      expv[15] = 8'h0e;
      expv[16] = 8'ha9;
      expv[17] = 8'hcf;
      expv[18] = 8'h00;
      expv[19] = 8'h12;
      expv[20] = 8'hba;
      expv[21] = 8'had;
      expv[22] = 8'h7a;
      expv[23] = 8'h87;
      expv[24] = 8'h59;
      expv[25] = 8'ha6;
      expv[26] = 8'h3f;
      expv[27] = 8'hf6;
      expv[28] = 8'h06;
      expv[29] = 8'h90;
      expv[30] = 8'h8d;
      expv[31] = 8'h79;
      expv[32] = 8'h1b;
      expv[33] = 8'hc4;
      expv[34] = 8'hc7;
      expv[35] = 8'h7f;
      expv[36] = 8'hf9;
      expv[37] = 8'hfc;
      expv[38] = 8'hbb;
      expv[39] = 8'hb3;
      expv[40] = 8'h35;
      expv[41] = 8'h73;
      expv[42] = 8'heb;
      expv[43] = 8'h7c;
      expv[44] = 8'h59;
      expv[45] = 8'hfd;
      expv[46] = 8'h67;
      expv[47] = 8'h88;
      expv[48] = 8'h3b;
      expv[49] = 8'hf2;
      expv[50] = 8'h28;
      expv[51] = 8'h9d;
      expv[52] = 8'h04;
      expv[53] = 8'h1e;
      expv[54] = 8'h0d;
      expv[55] = 8'h65;
      expv[56] = 8'hec;
      expv[57] = 8'h27;
      expv[58] = 8'ha4;
      expv[59] = 8'h52;
      expv[60] = 8'h7c;
      expv[61] = 8'h51;
      expv[62] = 8'h71;
      expv[63] = 8'h86;
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
