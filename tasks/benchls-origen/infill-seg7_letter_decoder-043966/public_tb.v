// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043966 dut (
    .enter(in_vec[5:1]),
    .letter(in_vec[0:0]),
    .display(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h18;
    stim[1] = 6'h01;
    stim[2] = 6'h10;
    stim[3] = 6'h3b;
    stim[4] = 6'h05;
    stim[5] = 6'h09;
    stim[6] = 6'h15;
    stim[7] = 6'h3d;
    stim[8] = 6'h00;
    stim[9] = 6'h26;
    stim[10] = 6'h34;
    stim[11] = 6'h04;
    stim[12] = 6'h3a;
    stim[13] = 6'h1b;
    stim[14] = 6'h15;
    stim[15] = 6'h1d;
    stim[16] = 6'h35;
    stim[17] = 6'h18;
    stim[18] = 6'h1d;
    stim[19] = 6'h31;
    stim[20] = 6'h34;
    stim[21] = 6'h35;
    stim[22] = 6'h28;
    stim[23] = 6'h38;
    stim[24] = 6'h3f;
    stim[25] = 6'h1a;
    stim[26] = 6'h1d;
    stim[27] = 6'h35;
    stim[28] = 6'h29;
    stim[29] = 6'h18;
    stim[30] = 6'h10;
    stim[31] = 6'h36;
    stim[32] = 6'h0d;
    stim[33] = 6'h05;
    stim[34] = 6'h3a;
    stim[35] = 6'h02;
    stim[36] = 6'h0b;
    stim[37] = 6'h19;
    stim[38] = 6'h05;
    stim[39] = 6'h0f;
    stim[40] = 6'h25;
    stim[41] = 6'h13;
    stim[42] = 6'h14;
    stim[43] = 6'h1e;
    stim[44] = 6'h37;
    stim[45] = 6'h02;
    stim[46] = 6'h32;
    stim[47] = 6'h05;
    stim[48] = 6'h07;
    stim[49] = 6'h0d;
    stim[50] = 6'h25;
    stim[51] = 6'h15;
    stim[52] = 6'h2d;
    stim[53] = 6'h20;
    stim[54] = 6'h19;
    stim[55] = 6'h3c;
    stim[56] = 6'h07;
    stim[57] = 6'h36;
    stim[58] = 6'h33;
    stim[59] = 6'h01;
    stim[60] = 6'h24;
    stim[61] = 6'h1e;
    stim[62] = 6'h16;
    stim[63] = 6'h19;
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
      expv[0] = 7'h7e;
      expv[1] = 7'h77;
      expv[2] = 7'h7e;
      expv[3] = 7'h44;
      expv[4] = 7'h5b;
      expv[5] = 7'h3e;
      expv[6] = 7'h7e;
      expv[7] = 7'h48;
      expv[8] = 7'h7e;
      expv[9] = 7'h7e;
      expv[10] = 7'h7e;
      expv[11] = 7'h7e;
      expv[12] = 7'h7e;
      expv[13] = 7'h5e;
      expv[14] = 7'h7e;
      expv[15] = 7'h79;
      expv[16] = 7'h5b;
      expv[17] = 7'h7e;
      expv[18] = 7'h79;
      expv[19] = 7'h7b;
      expv[20] = 7'h7e;
      expv[21] = 7'h7e;
      expv[22] = 7'h7e;
      expv[23] = 7'h7e;
      expv[24] = 7'h60;
      expv[25] = 7'h7e;
      expv[26] = 7'h79;
      expv[27] = 7'h5b;
      expv[28] = 7'h5e;
      expv[29] = 7'h7e;
      expv[30] = 7'h7e;
      expv[31] = 7'h7e;
      expv[32] = 7'h71;
      expv[33] = 7'h5b;
      expv[34] = 7'h7e;
      expv[35] = 7'h7e;
      expv[36] = 7'h79;
      expv[37] = 7'h51;
      expv[38] = 7'h5b;
      expv[39] = 7'h1f;
      expv[40] = 7'h79;
      expv[41] = 7'h7b;
      expv[42] = 7'h7e;
      expv[43] = 7'h7e;
      expv[44] = 7'h4f;
      expv[45] = 7'h7e;
      expv[46] = 7'h7e;
      expv[47] = 7'h5b;
      expv[48] = 7'h4f;
      expv[49] = 7'h71;
      expv[50] = 7'h79;
      expv[51] = 7'h7e;
      expv[52] = 7'h6d;
      expv[53] = 7'h7e;
      expv[54] = 7'h51;
      expv[55] = 7'h7e;
      expv[56] = 7'h4f;
      expv[57] = 7'h7e;
      expv[58] = 7'h6e;
      expv[59] = 7'h77;
      expv[60] = 7'h7e;
      expv[61] = 7'h7e;
      expv[62] = 7'h7e;
      expv[63] = 7'h51;
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
