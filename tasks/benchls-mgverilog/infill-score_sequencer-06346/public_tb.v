// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06346 dut (
    .Clock(clk),
    .Start(in_vec[11:11]),
    .StartAddress(in_vec[10:6]),
    .KeyOutput(in_vec[5:2]),
    .EndofNote(in_vec[1:1]),
    .Reset(in_vec[0:0]),
    .EndofScore(out_vec[5:5]),
    .CurrentAddress(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hdd7;
    stim[1] = 12'h01b;
    stim[2] = 12'h114;
    stim[3] = 12'h246;
    stim[4] = 12'hd32;
    stim[5] = 12'hf38;
    stim[6] = 12'h624;
    stim[7] = 12'hc74;
    stim[8] = 12'h3f0;
    stim[9] = 12'h630;
    stim[10] = 12'haea;
    stim[11] = 12'h912;
    stim[12] = 12'hb16;
    stim[13] = 12'he9e;
    stim[14] = 12'h098;
    stim[15] = 12'h320;
    stim[16] = 12'hdc5;
    stim[17] = 12'h95a;
    stim[18] = 12'hd6c;
    stim[19] = 12'h8b4;
    stim[20] = 12'hdf4;
    stim[21] = 12'h526;
    stim[22] = 12'heb8;
    stim[23] = 12'h77e;
    stim[24] = 12'hae6;
    stim[25] = 12'h99e;
    stim[26] = 12'h904;
    stim[27] = 12'ha2c;
    stim[28] = 12'h4f8;
    stim[29] = 12'h296;
    stim[30] = 12'ha0c;
    stim[31] = 12'hd54;
    stim[32] = 12'h5e6;
    stim[33] = 12'hb88;
    stim[34] = 12'h064;
    stim[35] = 12'h8ae;
    stim[36] = 12'h63c;
    stim[37] = 12'h104;
    stim[38] = 12'h4ec;
    stim[39] = 12'h91a;
    stim[40] = 12'ha2e;
    stim[41] = 12'ha08;
    stim[42] = 12'h5ae;
    stim[43] = 12'ha4e;
    stim[44] = 12'h22a;
    stim[45] = 12'h684;
    stim[46] = 12'h1aa;
    stim[47] = 12'hde0;
    stim[48] = 12'h2e6;
    stim[49] = 12'hfcc;
    stim[50] = 12'h102;
    stim[51] = 12'h734;
    stim[52] = 12'h692;
    stim[53] = 12'hefc;
    stim[54] = 12'haaa;
    stim[55] = 12'hcb1;
    stim[56] = 12'h1de;
    stim[57] = 12'hcde;
    stim[58] = 12'hea6;
    stim[59] = 12'h5a8;
    stim[60] = 12'h5f2;
    stim[61] = 12'h2c6;
    stim[62] = 12'h7c2;
    stim[63] = 12'had9;
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
      expv[0] = 6'h20;
      expv[1] = 6'h20;
      expv[2] = 6'h20;
      expv[3] = 6'h24;
      expv[4] = 6'h29;
      expv[5] = 6'h14;
      expv[6] = 6'h14;
      expv[7] = 6'h14;
      expv[8] = 6'h14;
      expv[9] = 6'h14;
      expv[10] = 6'h14;
      expv[11] = 6'h15;
      expv[12] = 6'h16;
      expv[13] = 6'h17;
      expv[14] = 6'h18;
      expv[15] = 6'h18;
      expv[16] = 6'h20;
      expv[17] = 6'h20;
      expv[18] = 6'h05;
      expv[19] = 6'h05;
      expv[20] = 6'h05;
      expv[21] = 6'h05;
      expv[22] = 6'h06;
      expv[23] = 6'h06;
      expv[24] = 6'h07;
      expv[25] = 6'h08;
      expv[26] = 6'h09;
      expv[27] = 6'h09;
      expv[28] = 6'h09;
      expv[29] = 6'h09;
      expv[30] = 6'h0a;
      expv[31] = 6'h0a;
      expv[32] = 6'h0a;
      expv[33] = 6'h0b;
      expv[34] = 6'h0b;
      expv[35] = 6'h0b;
      expv[36] = 6'h0c;
      expv[37] = 6'h0c;
      expv[38] = 6'h0c;
      expv[39] = 6'h0c;
      expv[40] = 6'h0d;
      expv[41] = 6'h0e;
      expv[42] = 6'h0e;
      expv[43] = 6'h0f;
      expv[44] = 6'h10;
      expv[45] = 6'h11;
      expv[46] = 6'h11;
      expv[47] = 6'h12;
      expv[48] = 6'h12;
      expv[49] = 6'h13;
      expv[50] = 6'h13;
      expv[51] = 6'h33;
      expv[52] = 6'h3c;
      expv[53] = 6'h3a;
      expv[54] = 6'h1b;
      expv[55] = 6'h20;
      expv[56] = 6'h20;
      expv[57] = 6'h27;
      expv[58] = 6'h13;
      expv[59] = 6'h14;
      expv[60] = 6'h14;
      expv[61] = 6'h15;
      expv[62] = 6'h16;
      expv[63] = 6'h20;
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
