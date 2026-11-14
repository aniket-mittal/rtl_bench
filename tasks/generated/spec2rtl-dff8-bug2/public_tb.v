// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
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
    .d(in_vec[7:0]),
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
    stim[0] = 8'h47;
    stim[1] = 8'h30;
    stim[2] = 8'h2f;
    stim[3] = 8'h70;
    stim[4] = 8'h37;
    stim[5] = 8'ha9;
    stim[6] = 8'h3b;
    stim[7] = 8'hd0;
    stim[8] = 8'ha7;
    stim[9] = 8'h26;
    stim[10] = 8'h41;
    stim[11] = 8'ha9;
    stim[12] = 8'h06;
    stim[13] = 8'hdb;
    stim[14] = 8'hea;
    stim[15] = 8'h0e;
    stim[16] = 8'h13;
    stim[17] = 8'h6d;
    stim[18] = 8'hd0;
    stim[19] = 8'h80;
    stim[20] = 8'h86;
    stim[21] = 8'hf9;
    stim[22] = 8'ha6;
    stim[23] = 8'hb3;
    stim[24] = 8'hed;
    stim[25] = 8'h2e;
    stim[26] = 8'h3c;
    stim[27] = 8'h2b;
    stim[28] = 8'hb6;
    stim[29] = 8'hc6;
    stim[30] = 8'h38;
    stim[31] = 8'h48;
    stim[32] = 8'hb0;
    stim[33] = 8'ha3;
    stim[34] = 8'h2f;
    stim[35] = 8'h10;
    stim[36] = 8'hd0;
    stim[37] = 8'h98;
    stim[38] = 8'h1d;
    stim[39] = 8'hc7;
    stim[40] = 8'hcc;
    stim[41] = 8'hd8;
    stim[42] = 8'hf9;
    stim[43] = 8'hc7;
    stim[44] = 8'hfa;
    stim[45] = 8'h3b;
    stim[46] = 8'h24;
    stim[47] = 8'h8e;
    stim[48] = 8'hba;
    stim[49] = 8'h1e;
    stim[50] = 8'hee;
    stim[51] = 8'h9a;
    stim[52] = 8'h2d;
    stim[53] = 8'hc2;
    stim[54] = 8'h32;
    stim[55] = 8'h8d;
    stim[56] = 8'ha9;
    stim[57] = 8'he4;
    stim[58] = 8'hd3;
    stim[59] = 8'hb7;
    stim[60] = 8'h20;
    stim[61] = 8'h33;
    stim[62] = 8'h17;
    stim[63] = 8'hb8;
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
      expv[0] = 8'hff;
      expv[1] = 8'h47;
      expv[2] = 8'h30;
      expv[3] = 8'h2f;
      expv[4] = 8'h70;
      expv[5] = 8'h37;
      expv[6] = 8'ha9;
      expv[7] = 8'h3b;
      expv[8] = 8'hd0;
      expv[9] = 8'ha7;
      expv[10] = 8'h26;
      expv[11] = 8'h41;
      expv[12] = 8'ha9;
      expv[13] = 8'h06;
      expv[14] = 8'hdb;
      expv[15] = 8'hea;
      expv[16] = 8'h0e;
      expv[17] = 8'h13;
      expv[18] = 8'h6d;
      expv[19] = 8'hd0;
      expv[20] = 8'h80;
      expv[21] = 8'h86;
      expv[22] = 8'hf9;
      expv[23] = 8'ha6;
      expv[24] = 8'hb3;
      expv[25] = 8'hed;
      expv[26] = 8'h2e;
      expv[27] = 8'h3c;
      expv[28] = 8'h2b;
      expv[29] = 8'hb6;
      expv[30] = 8'hc6;
      expv[31] = 8'h38;
      expv[32] = 8'h48;
      expv[33] = 8'hb0;
      expv[34] = 8'ha3;
      expv[35] = 8'h2f;
      expv[36] = 8'h10;
      expv[37] = 8'hd0;
      expv[38] = 8'h98;
      expv[39] = 8'h1d;
      expv[40] = 8'hc7;
      expv[41] = 8'hcc;
      expv[42] = 8'hd8;
      expv[43] = 8'hf9;
      expv[44] = 8'hc7;
      expv[45] = 8'hfa;
      expv[46] = 8'h3b;
      expv[47] = 8'h24;
      expv[48] = 8'h8e;
      expv[49] = 8'hba;
      expv[50] = 8'h1e;
      expv[51] = 8'hee;
      expv[52] = 8'h9a;
      expv[53] = 8'h2d;
      expv[54] = 8'hc2;
      expv[55] = 8'h32;
      expv[56] = 8'h8d;
      expv[57] = 8'ha9;
      expv[58] = 8'he4;
      expv[59] = 8'hd3;
      expv[60] = 8'hb7;
      expv[61] = 8'h20;
      expv[62] = 8'h33;
      expv[63] = 8'h17;
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
