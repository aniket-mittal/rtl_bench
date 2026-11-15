// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02285 dut (
    .clk(clk),
    .addr(in_vec[7:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h5d;
    stim[1] = 8'h33;
    stim[2] = 8'h8e;
    stim[3] = 8'h56;
    stim[4] = 8'h50;
    stim[5] = 8'h7b;
    stim[6] = 8'hbe;
    stim[7] = 8'hee;
    stim[8] = 8'h35;
    stim[9] = 8'h4e;
    stim[10] = 8'h87;
    stim[11] = 8'hf1;
    stim[12] = 8'hb6;
    stim[13] = 8'h8d;
    stim[14] = 8'h10;
    stim[15] = 8'hf9;
    stim[16] = 8'heb;
    stim[17] = 8'h6a;
    stim[18] = 8'hc0;
    stim[19] = 8'hab;
    stim[20] = 8'hd1;
    stim[21] = 8'hc2;
    stim[22] = 8'h68;
    stim[23] = 8'h79;
    stim[24] = 8'h0d;
    stim[25] = 8'he3;
    stim[26] = 8'h0d;
    stim[27] = 8'hb3;
    stim[28] = 8'hbf;
    stim[29] = 8'hb6;
    stim[30] = 8'hc9;
    stim[31] = 8'hc8;
    stim[32] = 8'hbc;
    stim[33] = 8'h3c;
    stim[34] = 8'h98;
    stim[35] = 8'h84;
    stim[36] = 8'h79;
    stim[37] = 8'h90;
    stim[38] = 8'hf1;
    stim[39] = 8'h47;
    stim[40] = 8'h8a;
    stim[41] = 8'heb;
    stim[42] = 8'h68;
    stim[43] = 8'h28;
    stim[44] = 8'hec;
    stim[45] = 8'ha4;
    stim[46] = 8'hf2;
    stim[47] = 8'h13;
    stim[48] = 8'he3;
    stim[49] = 8'h77;
    stim[50] = 8'h2f;
    stim[51] = 8'hda;
    stim[52] = 8'hc8;
    stim[53] = 8'h78;
    stim[54] = 8'h95;
    stim[55] = 8'hc9;
    stim[56] = 8'h8d;
    stim[57] = 8'he5;
    stim[58] = 8'h90;
    stim[59] = 8'h65;
    stim[60] = 8'h60;
    stim[61] = 8'hca;
    stim[62] = 8'h7f;
    stim[63] = 8'h79;
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
      expv[1] = 16'hffff;
      expv[2] = 16'h85a3;
      expv[3] = 16'hffff;
      expv[4] = 16'hffff;
      expv[5] = 16'hffff;
      expv[6] = 16'hffff;
      expv[7] = 16'hffff;
      expv[8] = 16'hffff;
      expv[9] = 16'h87c4;
      expv[10] = 16'hffff;
      expv[11] = 16'hffff;
      expv[12] = 16'hffff;
      expv[13] = 16'hffff;
      expv[14] = 16'hffff;
      expv[15] = 16'h589e;
      expv[16] = 16'hffff;
      expv[17] = 16'hffff;
      expv[18] = 16'hffff;
      expv[19] = 16'hffff;
      expv[20] = 16'hffff;
      expv[21] = 16'hffff;
      expv[22] = 16'hffff;
      expv[23] = 16'hffff;
      expv[24] = 16'hffff;
      expv[25] = 16'h523d;
      expv[26] = 16'hffff;
      expv[27] = 16'h523d;
      expv[28] = 16'hffff;
      expv[29] = 16'hffff;
      expv[30] = 16'hffff;
      expv[31] = 16'hffff;
      expv[32] = 16'hffff;
      expv[33] = 16'hffff;
      expv[34] = 16'h1418;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'hffff;
      expv[38] = 16'hffff;
      expv[39] = 16'hffff;
      expv[40] = 16'ha8f0;
      expv[41] = 16'hffff;
      expv[42] = 16'hffff;
      expv[43] = 16'hffff;
      expv[44] = 16'h7a20;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'h1802;
      expv[49] = 16'hffff;
      expv[50] = 16'hffff;
      expv[51] = 16'h8180;
      expv[52] = 16'hffff;
      expv[53] = 16'hffff;
      expv[54] = 16'hffff;
      expv[55] = 16'hffff;
      expv[56] = 16'hffff;
      expv[57] = 16'hffff;
      expv[58] = 16'hffff;
      expv[59] = 16'hffff;
      expv[60] = 16'hffff;
      expv[61] = 16'hffff;
      expv[62] = 16'hffff;
      expv[63] = 16'hffff;
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
