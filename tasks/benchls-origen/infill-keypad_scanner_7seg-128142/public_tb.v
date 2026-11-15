// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128142 dut (
    .ClockIn(clk),
    .Rows(in_vec[5:2]),
    .Start(in_vec[1:1]),
    .Reset(in_vec[0:0]),
    .Columns(out_vec[17:14]),
    .Locked(out_vec[13:13]),
    .Found(out_vec[12:12]),
    .Display(out_vec[11:4]),
    .Transistors(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h2b;
    stim[1] = 6'h1f;
    stim[2] = 6'h32;
    stim[3] = 6'h3c;
    stim[4] = 6'h0a;
    stim[5] = 6'h24;
    stim[6] = 6'h02;
    stim[7] = 6'h08;
    stim[8] = 6'h3e;
    stim[9] = 6'h0a;
    stim[10] = 6'h28;
    stim[11] = 6'h36;
    stim[12] = 6'h04;
    stim[13] = 6'h34;
    stim[14] = 6'h0e;
    stim[15] = 6'h02;
    stim[16] = 6'h20;
    stim[17] = 6'h2a;
    stim[18] = 6'h1a;
    stim[19] = 6'h14;
    stim[20] = 6'h12;
    stim[21] = 6'h26;
    stim[22] = 6'h04;
    stim[23] = 6'h1e;
    stim[24] = 6'h1e;
    stim[25] = 6'h16;
    stim[26] = 6'h32;
    stim[27] = 6'h16;
    stim[28] = 6'h16;
    stim[29] = 6'h24;
    stim[30] = 6'h32;
    stim[31] = 6'h3a;
    stim[32] = 6'h0c;
    stim[33] = 6'h26;
    stim[34] = 6'h12;
    stim[35] = 6'h1e;
    stim[36] = 6'h2a;
    stim[37] = 6'h16;
    stim[38] = 6'h32;
    stim[39] = 6'h26;
    stim[40] = 6'h08;
    stim[41] = 6'h3c;
    stim[42] = 6'h2c;
    stim[43] = 6'h3c;
    stim[44] = 6'h1e;
    stim[45] = 6'h3c;
    stim[46] = 6'h3a;
    stim[47] = 6'h34;
    stim[48] = 6'h1a;
    stim[49] = 6'h20;
    stim[50] = 6'h36;
    stim[51] = 6'h3a;
    stim[52] = 6'h36;
    stim[53] = 6'h20;
    stim[54] = 6'h10;
    stim[55] = 6'h32;
    stim[56] = 6'h24;
    stim[57] = 6'h0a;
    stim[58] = 6'h02;
    stim[59] = 6'h0e;
    stim[60] = 6'h3c;
    stim[61] = 6'h34;
    stim[62] = 6'h14;
    stim[63] = 6'h1a;
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
      expv[0] = 18'h3cfff;
      expv[1] = 18'h3cfff;
      expv[2] = 18'h3cfff;
      expv[3] = 18'h38fff;
      expv[4] = 18'h34fff;
      expv[5] = 18'h34fff;
      expv[6] = 18'h34fff;
      expv[7] = 18'h34fff;
      expv[8] = 18'h34fff;
      expv[9] = 18'h34fff;
      expv[10] = 18'h34fff;
      expv[11] = 18'h34fff;
      expv[12] = 18'h34fff;
      expv[13] = 18'h34fff;
      expv[14] = 18'h34fff;
      expv[15] = 18'h34fff;
      expv[16] = 18'h34fff;
      expv[17] = 18'h34fff;
      expv[18] = 18'h34fff;
      expv[19] = 18'h34fff;
      expv[20] = 18'h34fff;
      expv[21] = 18'h34fff;
      expv[22] = 18'h34fff;
      expv[23] = 18'h34fff;
      expv[24] = 18'h34fff;
      expv[25] = 18'h34fff;
      expv[26] = 18'h34fff;
      expv[27] = 18'h34fff;
      expv[28] = 18'h34fff;
      expv[29] = 18'h34fff;
      expv[30] = 18'h34fff;
      expv[31] = 18'h34fff;
      expv[32] = 18'h34fff;
      expv[33] = 18'h34fff;
      expv[34] = 18'h34fff;
      expv[35] = 18'h34fff;
      expv[36] = 18'h34fff;
      expv[37] = 18'h34fff;
      expv[38] = 18'h34fff;
      expv[39] = 18'h34fff;
      expv[40] = 18'h34fff;
      expv[41] = 18'h34fff;
      expv[42] = 18'h34fff;
      expv[43] = 18'h34fff;
      expv[44] = 18'h34fff;
      expv[45] = 18'h34fff;
      expv[46] = 18'h34fff;
      expv[47] = 18'h34fff;
      expv[48] = 18'h34fff;
      expv[49] = 18'h34fff;
      expv[50] = 18'h34fff;
      expv[51] = 18'h34fff;
      expv[52] = 18'h34fff;
      expv[53] = 18'h34fff;
      expv[54] = 18'h34fff;
      expv[55] = 18'h34fff;
      expv[56] = 18'h34fff;
      expv[57] = 18'h34fff;
      expv[58] = 18'h34fff;
      expv[59] = 18'h34fff;
      expv[60] = 18'h34fff;
      expv[61] = 18'h34fff;
      expv[62] = 18'h34fff;
      expv[63] = 18'h34fff;
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
