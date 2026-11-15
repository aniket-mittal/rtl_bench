// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107790 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .dr(in_vec[1:1]),
    .ir(in_vec[0:0]),
    .rightscoreLeft(out_vec[7:4]),
    .rightscoreRight(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h6;
    stim[1] = 3'h4;
    stim[2] = 3'h3;
    stim[3] = 3'h3;
    stim[4] = 3'h3;
    stim[5] = 3'h1;
    stim[6] = 3'h0;
    stim[7] = 3'h1;
    stim[8] = 3'h1;
    stim[9] = 3'h0;
    stim[10] = 3'h0;
    stim[11] = 3'h1;
    stim[12] = 3'h0;
    stim[13] = 3'h1;
    stim[14] = 3'h1;
    stim[15] = 3'h0;
    stim[16] = 3'h3;
    stim[17] = 3'h3;
    stim[18] = 3'h1;
    stim[19] = 3'h1;
    stim[20] = 3'h0;
    stim[21] = 3'h3;
    stim[22] = 3'h3;
    stim[23] = 3'h1;
    stim[24] = 3'h2;
    stim[25] = 3'h1;
    stim[26] = 3'h0;
    stim[27] = 3'h0;
    stim[28] = 3'h2;
    stim[29] = 3'h2;
    stim[30] = 3'h2;
    stim[31] = 3'h3;
    stim[32] = 3'h0;
    stim[33] = 3'h2;
    stim[34] = 3'h0;
    stim[35] = 3'h2;
    stim[36] = 3'h0;
    stim[37] = 3'h0;
    stim[38] = 3'h0;
    stim[39] = 3'h2;
    stim[40] = 3'h3;
    stim[41] = 3'h3;
    stim[42] = 3'h1;
    stim[43] = 3'h7;
    stim[44] = 3'h1;
    stim[45] = 3'h3;
    stim[46] = 3'h3;
    stim[47] = 3'h1;
    stim[48] = 3'h2;
    stim[49] = 3'h0;
    stim[50] = 3'h2;
    stim[51] = 3'h1;
    stim[52] = 3'h2;
    stim[53] = 3'h0;
    stim[54] = 3'h2;
    stim[55] = 3'h3;
    stim[56] = 3'h3;
    stim[57] = 3'h0;
    stim[58] = 3'h1;
    stim[59] = 3'h0;
    stim[60] = 3'h3;
    stim[61] = 3'h3;
    stim[62] = 3'h0;
    stim[63] = 3'h1;
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
      expv[3] = 8'h00;
      expv[4] = 8'h91;
      expv[5] = 8'h91;
      expv[6] = 8'h91;
      expv[7] = 8'h91;
      expv[8] = 8'h91;
      expv[9] = 8'h92;
      expv[10] = 8'h92;
      expv[11] = 8'h92;
      expv[12] = 8'h92;
      expv[13] = 8'h93;
      expv[14] = 8'h93;
      expv[15] = 8'h94;
      expv[16] = 8'h94;
      expv[17] = 8'h94;
      expv[18] = 8'h95;
      expv[19] = 8'h95;
      expv[20] = 8'h95;
      expv[21] = 8'h95;
      expv[22] = 8'h95;
      expv[23] = 8'h96;
      expv[24] = 8'h96;
      expv[25] = 8'h96;
      expv[26] = 8'h95;
      expv[27] = 8'h96;
      expv[28] = 8'h96;
      expv[29] = 8'h96;
      expv[30] = 8'h95;
      expv[31] = 8'h95;
      expv[32] = 8'h95;
      expv[33] = 8'h96;
      expv[34] = 8'h96;
      expv[35] = 8'h95;
      expv[36] = 8'h95;
      expv[37] = 8'h94;
      expv[38] = 8'h94;
      expv[39] = 8'h94;
      expv[40] = 8'h94;
      expv[41] = 8'h93;
      expv[42] = 8'h94;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h01;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h99;
      expv[51] = 8'h99;
      expv[52] = 8'h98;
      expv[53] = 8'h99;
      expv[54] = 8'h98;
      expv[55] = 8'h98;
      expv[56] = 8'h97;
      expv[57] = 8'h98;
      expv[58] = 8'h98;
      expv[59] = 8'h98;
      expv[60] = 8'h99;
      expv[61] = 8'h99;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
