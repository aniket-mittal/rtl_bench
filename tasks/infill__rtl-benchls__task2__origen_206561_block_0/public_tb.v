// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_206561 dut (
    .clk(clk),
    .rst(in_vec[0:0]),
    .K(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h1;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h1;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 32'he49b69c1;
      expv[1] = 32'he49b69c1;
      expv[2] = 32'he49b69c1;
      expv[3] = 32'hefbe4786;
      expv[4] = 32'h0fc19dc6;
      expv[5] = 32'h240ca1cc;
      expv[6] = 32'h2de92c6f;
      expv[7] = 32'h4a7484aa;
      expv[8] = 32'h5cb0a9dc;
      expv[9] = 32'h76f988da;
      expv[10] = 32'h983e5152;
      expv[11] = 32'ha831c66d;
      expv[12] = 32'hb00327c8;
      expv[13] = 32'hbf597fc7;
      expv[14] = 32'hc6e00bf3;
      expv[15] = 32'hd5a79147;
      expv[16] = 32'h06ca6351;
      expv[17] = 32'h14292967;
      expv[18] = 32'h27b70a85;
      expv[19] = 32'h2e1b2138;
      expv[20] = 32'h4d2c6dfc;
      expv[21] = 32'h53380d13;
      expv[22] = 32'h650a7354;
      expv[23] = 32'h766a0abb;
      expv[24] = 32'h81c2c92e;
      expv[25] = 32'h92722c85;
      expv[26] = 32'he49b69c1;
      expv[27] = 32'hefbe4786;
      expv[28] = 32'h0fc19dc6;
      expv[29] = 32'h240ca1cc;
      expv[30] = 32'h2de92c6f;
      expv[31] = 32'h4a7484aa;
      expv[32] = 32'h5cb0a9dc;
      expv[33] = 32'h76f988da;
      expv[34] = 32'h983e5152;
      expv[35] = 32'ha831c66d;
      expv[36] = 32'hb00327c8;
      expv[37] = 32'hbf597fc7;
      expv[38] = 32'hc6e00bf3;
      expv[39] = 32'hd5a79147;
      expv[40] = 32'h06ca6351;
      expv[41] = 32'h14292967;
      expv[42] = 32'h27b70a85;
      expv[43] = 32'h2e1b2138;
      expv[44] = 32'h4d2c6dfc;
      expv[45] = 32'h53380d13;
      expv[46] = 32'h650a7354;
      expv[47] = 32'he49b69c1;
      expv[48] = 32'hefbe4786;
      expv[49] = 32'h0fc19dc6;
      expv[50] = 32'h240ca1cc;
      expv[51] = 32'h2de92c6f;
      expv[52] = 32'h4a7484aa;
      expv[53] = 32'h5cb0a9dc;
      expv[54] = 32'h76f988da;
      expv[55] = 32'h983e5152;
      expv[56] = 32'ha831c66d;
      expv[57] = 32'hb00327c8;
      expv[58] = 32'hbf597fc7;
      expv[59] = 32'hc6e00bf3;
      expv[60] = 32'hd5a79147;
      expv[61] = 32'h06ca6351;
      expv[62] = 32'h14292967;
      expv[63] = 32'h27b70a85;
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
