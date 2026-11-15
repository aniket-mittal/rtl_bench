// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10399 dut (
    .x(in_vec[5:3]),
    .g1(in_vec[2:2]),
    .g2a_n(in_vec[1:1]),
    .g2b_n(in_vec[0:0]),
    .y(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h27;
    stim[1] = 6'h1d;
    stim[2] = 6'h35;
    stim[3] = 6'h38;
    stim[4] = 6'h1d;
    stim[5] = 6'h34;
    stim[6] = 6'h37;
    stim[7] = 6'h2c;
    stim[8] = 6'h2f;
    stim[9] = 6'h3d;
    stim[10] = 6'h07;
    stim[11] = 6'h13;
    stim[12] = 6'h3b;
    stim[13] = 6'h1a;
    stim[14] = 6'h2f;
    stim[15] = 6'h1c;
    stim[16] = 6'h03;
    stim[17] = 6'h1e;
    stim[18] = 6'h0c;
    stim[19] = 6'h06;
    stim[20] = 6'h3f;
    stim[21] = 6'h27;
    stim[22] = 6'h32;
    stim[23] = 6'h26;
    stim[24] = 6'h12;
    stim[25] = 6'h39;
    stim[26] = 6'h17;
    stim[27] = 6'h32;
    stim[28] = 6'h0c;
    stim[29] = 6'h33;
    stim[30] = 6'h3a;
    stim[31] = 6'h3f;
    stim[32] = 6'h0b;
    stim[33] = 6'h07;
    stim[34] = 6'h36;
    stim[35] = 6'h27;
    stim[36] = 6'h38;
    stim[37] = 6'h17;
    stim[38] = 6'h30;
    stim[39] = 6'h39;
    stim[40] = 6'h09;
    stim[41] = 6'h1e;
    stim[42] = 6'h18;
    stim[43] = 6'h02;
    stim[44] = 6'h21;
    stim[45] = 6'h2a;
    stim[46] = 6'h2d;
    stim[47] = 6'h16;
    stim[48] = 6'h09;
    stim[49] = 6'h28;
    stim[50] = 6'h21;
    stim[51] = 6'h2a;
    stim[52] = 6'h05;
    stim[53] = 6'h04;
    stim[54] = 6'h04;
    stim[55] = 6'h06;
    stim[56] = 6'h0c;
    stim[57] = 6'h04;
    stim[58] = 6'h29;
    stim[59] = 6'h0d;
    stim[60] = 6'h0f;
    stim[61] = 6'h37;
    stim[62] = 6'h28;
    stim[63] = 6'h10;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'hff;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hff;
      expv[5] = 8'hbf;
      expv[6] = 8'hff;
      expv[7] = 8'hdf;
      expv[8] = 8'hff;
      expv[9] = 8'hff;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hf7;
      expv[16] = 8'hff;
      expv[17] = 8'hff;
      expv[18] = 8'hfd;
      expv[19] = 8'hff;
      expv[20] = 8'hff;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hff;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hff;
      expv[28] = 8'hfd;
      expv[29] = 8'hff;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hff;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hfe;
      expv[54] = 8'hfe;
      expv[55] = 8'hff;
      expv[56] = 8'hfd;
      expv[57] = 8'hfe;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
