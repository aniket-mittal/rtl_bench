// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195321 dut (
    .clk(clk),
    .gdin(in_vec[11:2]),
    .rst_n(in_vec[1:1]),
    .PRBSEN(in_vec[0:0]),
    .gdflag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbd4;
    stim[1] = 12'h571;
    stim[2] = 12'haba;
    stim[3] = 12'h16d;
    stim[4] = 12'h503;
    stim[5] = 12'h133;
    stim[6] = 12'h6b3;
    stim[7] = 12'h4fa;
    stim[8] = 12'hcb7;
    stim[9] = 12'h526;
    stim[10] = 12'ha1a;
    stim[11] = 12'hfe6;
    stim[12] = 12'h48a;
    stim[13] = 12'h6bb;
    stim[14] = 12'h287;
    stim[15] = 12'h6eb;
    stim[16] = 12'h9ee;
    stim[17] = 12'h98a;
    stim[18] = 12'h566;
    stim[19] = 12'hf4f;
    stim[20] = 12'h317;
    stim[21] = 12'h18f;
    stim[22] = 12'h4b6;
    stim[23] = 12'ha1f;
    stim[24] = 12'h4aa;
    stim[25] = 12'hcd6;
    stim[26] = 12'h717;
    stim[27] = 12'h82e;
    stim[28] = 12'heff;
    stim[29] = 12'h122;
    stim[30] = 12'h1be;
    stim[31] = 12'h99b;
    stim[32] = 12'h6eb;
    stim[33] = 12'ha67;
    stim[34] = 12'h7fe;
    stim[35] = 12'h77f;
    stim[36] = 12'he27;
    stim[37] = 12'he53;
    stim[38] = 12'h732;
    stim[39] = 12'h947;
    stim[40] = 12'h497;
    stim[41] = 12'h88e;
    stim[42] = 12'h6e7;
    stim[43] = 12'h64f;
    stim[44] = 12'h05f;
    stim[45] = 12'h24b;
    stim[46] = 12'ha1b;
    stim[47] = 12'h4df;
    stim[48] = 12'he37;
    stim[49] = 12'h15e;
    stim[50] = 12'h4c3;
    stim[51] = 12'h72b;
    stim[52] = 12'h57e;
    stim[53] = 12'h12e;
    stim[54] = 12'h1da;
    stim[55] = 12'h22a;
    stim[56] = 12'h276;
    stim[57] = 12'hd97;
    stim[58] = 12'h7fe;
    stim[59] = 12'h6fe;
    stim[60] = 12'h19a;
    stim[61] = 12'h157;
    stim[62] = 12'h90b;
    stim[63] = 12'h3ba;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
