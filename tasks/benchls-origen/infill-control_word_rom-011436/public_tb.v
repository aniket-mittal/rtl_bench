// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011436 dut (
    .Opcode(in_vec[5:0]),
    .CU_entry(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h09;
    stim[1] = 6'h06;
    stim[2] = 6'h18;
    stim[3] = 6'h05;
    stim[4] = 6'h09;
    stim[5] = 6'h3a;
    stim[6] = 6'h2f;
    stim[7] = 6'h23;
    stim[8] = 6'h3a;
    stim[9] = 6'h21;
    stim[10] = 6'h15;
    stim[11] = 6'h2e;
    stim[12] = 6'h1b;
    stim[13] = 6'h05;
    stim[14] = 6'h1b;
    stim[15] = 6'h0f;
    stim[16] = 6'h37;
    stim[17] = 6'h0b;
    stim[18] = 6'h30;
    stim[19] = 6'h21;
    stim[20] = 6'h19;
    stim[21] = 6'h36;
    stim[22] = 6'h0c;
    stim[23] = 6'h24;
    stim[24] = 6'h32;
    stim[25] = 6'h22;
    stim[26] = 6'h2f;
    stim[27] = 6'h34;
    stim[28] = 6'h3f;
    stim[29] = 6'h0d;
    stim[30] = 6'h3b;
    stim[31] = 6'h3a;
    stim[32] = 6'h3b;
    stim[33] = 6'h34;
    stim[34] = 6'h39;
    stim[35] = 6'h1d;
    stim[36] = 6'h0b;
    stim[37] = 6'h34;
    stim[38] = 6'h2a;
    stim[39] = 6'h32;
    stim[40] = 6'h0a;
    stim[41] = 6'h1f;
    stim[42] = 6'h39;
    stim[43] = 6'h1f;
    stim[44] = 6'h2b;
    stim[45] = 6'h22;
    stim[46] = 6'h0d;
    stim[47] = 6'h07;
    stim[48] = 6'h29;
    stim[49] = 6'h34;
    stim[50] = 6'h17;
    stim[51] = 6'h08;
    stim[52] = 6'h0f;
    stim[53] = 6'h30;
    stim[54] = 6'h22;
    stim[55] = 6'h2d;
    stim[56] = 6'h27;
    stim[57] = 6'h3b;
    stim[58] = 6'h0f;
    stim[59] = 6'h0e;
    stim[60] = 6'h37;
    stim[61] = 6'h19;
    stim[62] = 6'h0b;
    stim[63] = 6'h2b;
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
      expv[0] = 16'h0409;
      expv[1] = 16'h0406;
      expv[2] = 16'h0570;
      expv[3] = 16'h0405;
      expv[4] = 16'h0409;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0570;
      expv[8] = 16'h0000;
      expv[9] = 16'h0570;
      expv[10] = 16'h0550;
      expv[11] = 16'h0000;
      expv[12] = 16'h0570;
      expv[13] = 16'h0405;
      expv[14] = 16'h0570;
      expv[15] = 16'h040f;
      expv[16] = 16'h0000;
      expv[17] = 16'h040b;
      expv[18] = 16'h0000;
      expv[19] = 16'h0570;
      expv[20] = 16'h0570;
      expv[21] = 16'h0000;
      expv[22] = 16'h040c;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0570;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h040d;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0570;
      expv[36] = 16'h040b;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h040a;
      expv[41] = 16'h0570;
      expv[42] = 16'h0000;
      expv[43] = 16'h0570;
      expv[44] = 16'h0000;
      expv[45] = 16'h0570;
      expv[46] = 16'h040d;
      expv[47] = 16'h0407;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0570;
      expv[51] = 16'h0408;
      expv[52] = 16'h040f;
      expv[53] = 16'h0000;
      expv[54] = 16'h0570;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h040f;
      expv[59] = 16'h040e;
      expv[60] = 16'h0000;
      expv[61] = 16'h0570;
      expv[62] = 16'h040b;
      expv[63] = 16'h0000;
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
