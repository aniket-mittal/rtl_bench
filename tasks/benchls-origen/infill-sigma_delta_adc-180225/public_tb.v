// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_180225 dut (
    .clk(clk),
    .rst(in_vec[6:6]),
    .divider(in_vec[5:1]),
    .difpin(in_vec[0:0]),
    .refout(out_vec[17:17]),
    .adcval(out_vec[16:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h5c;
    stim[1] = 7'h6b;
    stim[2] = 7'h69;
    stim[3] = 7'h26;
    stim[4] = 7'h05;
    stim[5] = 7'h3a;
    stim[6] = 7'h3b;
    stim[7] = 7'h2c;
    stim[8] = 7'h04;
    stim[9] = 7'h1d;
    stim[10] = 7'h25;
    stim[11] = 7'h22;
    stim[12] = 7'h08;
    stim[13] = 7'h3e;
    stim[14] = 7'h0c;
    stim[15] = 7'h37;
    stim[16] = 7'h02;
    stim[17] = 7'h2e;
    stim[18] = 7'h15;
    stim[19] = 7'h18;
    stim[20] = 7'h21;
    stim[21] = 7'h1c;
    stim[22] = 7'h15;
    stim[23] = 7'h2b;
    stim[24] = 7'h38;
    stim[25] = 7'h3f;
    stim[26] = 7'h1f;
    stim[27] = 7'h0d;
    stim[28] = 7'h22;
    stim[29] = 7'h14;
    stim[30] = 7'h33;
    stim[31] = 7'h3e;
    stim[32] = 7'h38;
    stim[33] = 7'h39;
    stim[34] = 7'h2f;
    stim[35] = 7'h1e;
    stim[36] = 7'h24;
    stim[37] = 7'h06;
    stim[38] = 7'h01;
    stim[39] = 7'h2d;
    stim[40] = 7'h24;
    stim[41] = 7'h07;
    stim[42] = 7'h1b;
    stim[43] = 7'h04;
    stim[44] = 7'h1f;
    stim[45] = 7'h22;
    stim[46] = 7'h3e;
    stim[47] = 7'h13;
    stim[48] = 7'h35;
    stim[49] = 7'h2e;
    stim[50] = 7'h2d;
    stim[51] = 7'h1d;
    stim[52] = 7'h1e;
    stim[53] = 7'h37;
    stim[54] = 7'h05;
    stim[55] = 7'h04;
    stim[56] = 7'h27;
    stim[57] = 7'h09;
    stim[58] = 7'h1d;
    stim[59] = 7'h1b;
    stim[60] = 7'h3d;
    stim[61] = 7'h03;
    stim[62] = 7'h03;
    stim[63] = 7'h06;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
