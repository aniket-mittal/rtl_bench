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
    .areset(in_vec[0:0]),
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
    stim[0] = 9'h105;
    stim[1] = 9'h165;
    stim[2] = 9'h0ea;
    stim[3] = 9'h162;
    stim[4] = 9'h1b2;
    stim[5] = 9'h19a;
    stim[6] = 9'h09e;
    stim[7] = 9'h1d0;
    stim[8] = 9'h0f6;
    stim[9] = 9'h184;
    stim[10] = 9'h1ac;
    stim[11] = 9'h09e;
    stim[12] = 9'h09c;
    stim[13] = 9'h126;
    stim[14] = 9'h170;
    stim[15] = 9'h18b;
    stim[16] = 9'h196;
    stim[17] = 9'h09c;
    stim[18] = 9'h06a;
    stim[19] = 9'h1a2;
    stim[20] = 9'h084;
    stim[21] = 9'h15a;
    stim[22] = 9'h1fe;
    stim[23] = 9'h02c;
    stim[24] = 9'h0c6;
    stim[25] = 9'h124;
    stim[26] = 9'h034;
    stim[27] = 9'h124;
    stim[28] = 9'h082;
    stim[29] = 9'h044;
    stim[30] = 9'h00e;
    stim[31] = 9'h1f8;
    stim[32] = 9'h0a2;
    stim[33] = 9'h13e;
    stim[34] = 9'h164;
    stim[35] = 9'h10a;
    stim[36] = 9'h148;
    stim[37] = 9'h0bc;
    stim[38] = 9'h090;
    stim[39] = 9'h194;
    stim[40] = 9'h048;
    stim[41] = 9'h10a;
    stim[42] = 9'h18e;
    stim[43] = 9'h0ac;
    stim[44] = 9'h138;
    stim[45] = 9'h144;
    stim[46] = 9'h1d0;
    stim[47] = 9'h0d2;
    stim[48] = 9'h022;
    stim[49] = 9'h110;
    stim[50] = 9'h10a;
    stim[51] = 9'h062;
    stim[52] = 9'h1f4;
    stim[53] = 9'h07e;
    stim[54] = 9'h1a6;
    stim[55] = 9'h17a;
    stim[56] = 9'h004;
    stim[57] = 9'h150;
    stim[58] = 9'h140;
    stim[59] = 9'h1fa;
    stim[60] = 9'h156;
    stim[61] = 9'h0bc;
    stim[62] = 9'h178;
    stim[63] = 9'h18e;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h57;
      expv[4] = 8'h1b;
      expv[5] = 8'h9d;
      expv[6] = 8'hdc;
      expv[7] = 8'hf4;
      expv[8] = 8'h8e;
      expv[9] = 8'hb7;
      expv[10] = 8'h2c;
      expv[11] = 8'h6d;
      expv[12] = 8'hf4;
      expv[13] = 8'he4;
      expv[14] = 8'h39;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'hbc;
      expv[18] = 8'he4;
      expv[19] = 8'h53;
      expv[20] = 8'h1d;
      expv[21] = 8'h24;
      expv[22] = 8'hda;
      expv[23] = 8'hff;
      expv[24] = 8'h61;
      expv[25] = 8'h36;
      expv[26] = 8'h29;
      expv[27] = 8'ha1;
      expv[28] = 8'h29;
      expv[29] = 8'h14;
      expv[30] = 8'h22;
      expv[31] = 8'h70;
      expv[32] = 8'hcf;
      expv[33] = 8'h15;
      expv[34] = 8'hf9;
      expv[35] = 8'h2b;
      expv[36] = 8'h58;
      expv[37] = 8'h4a;
      expv[38] = 8'he5;
      expv[39] = 8'h84;
      expv[40] = 8'hac;
      expv[41] = 8'h42;
      expv[42] = 8'h58;
      expv[43] = 8'h7c;
      expv[44] = 8'h65;
      expv[45] = 8'hc9;
      expv[46] = 8'h2a;
      expv[47] = 8'h8e;
      expv[48] = 8'h96;
      expv[49] = 8'h11;
      expv[50] = 8'h88;
      expv[51] = 8'h58;
      expv[52] = 8'h13;
      expv[53] = 8'haf;
      expv[54] = 8'hf3;
      expv[55] = 8'h3d;
      expv[56] = 8'hdb;
      expv[57] = 8'h20;
      expv[58] = 8'h8a;
      expv[59] = 8'h0a;
      expv[60] = 8'hdf;
      expv[61] = 8'hba;
      expv[62] = 8'he5;
      expv[63] = 8'hcb;
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
