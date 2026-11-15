// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09939 dut (
    .clk(clk),
    .load(in_vec[32:32]),
    .din(in_vec[31:0]),
    .sout(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1b207c6b0;
    stim[1] = 33'h103db321b;
    stim[2] = 33'h09709de7c;
    stim[3] = 33'h1f35c77ea;
    stim[4] = 33'h07fe3c1ce;
    stim[5] = 33'h1e659da87;
    stim[6] = 33'h01a0596e6;
    stim[7] = 33'h03065ffe9;
    stim[8] = 33'h0787133a7;
    stim[9] = 33'h140d7fd38;
    stim[10] = 33'h096973c78;
    stim[11] = 33'h0d160a8e4;
    stim[12] = 33'h07f946b69;
    stim[13] = 33'h016b84818;
    stim[14] = 33'h06361ee75;
    stim[15] = 33'h147b78fad;
    stim[16] = 33'h1d58fa9a1;
    stim[17] = 33'h1bddb56dd;
    stim[18] = 33'h16e83646f;
    stim[19] = 33'h171037bce;
    stim[20] = 33'h092d239fd;
    stim[21] = 33'h032848aa7;
    stim[22] = 33'h0fa4a80b0;
    stim[23] = 33'h196d18307;
    stim[24] = 33'h073481cd0;
    stim[25] = 33'h0ef0ab002;
    stim[26] = 33'h1290e6181;
    stim[27] = 33'h165d7d6c6;
    stim[28] = 33'h01e2e1166;
    stim[29] = 33'h1320a651a;
    stim[30] = 33'h098c3b9fe;
    stim[31] = 33'h06394bf97;
    stim[32] = 33'h1f8d52b7a;
    stim[33] = 33'h049b8532e;
    stim[34] = 33'h14ad83494;
    stim[35] = 33'h0b934dadb;
    stim[36] = 33'h1e5e87f75;
    stim[37] = 33'h0022f75a5;
    stim[38] = 33'h0f8f3158d;
    stim[39] = 33'h184a88cfa;
    stim[40] = 33'h18bb8b48d;
    stim[41] = 33'h176e749b9;
    stim[42] = 33'h01e8a33bc;
    stim[43] = 33'h1ada3d6e2;
    stim[44] = 33'h051b1d6eb;
    stim[45] = 33'h1643a215e;
    stim[46] = 33'h051af746e;
    stim[47] = 33'h1fe75e86a;
    stim[48] = 33'h192f46e5d;
    stim[49] = 33'h1922b47b1;
    stim[50] = 33'h01fb66248;
    stim[51] = 33'h1ba7b12ba;
    stim[52] = 33'h1a4f828e4;
    stim[53] = 33'h0974f172d;
    stim[54] = 33'h1d19e6e4d;
    stim[55] = 33'h029a2aca9;
    stim[56] = 33'h03be0c669;
    stim[57] = 33'h137880f62;
    stim[58] = 33'h041ecfbfb;
    stim[59] = 33'h10ae0e16d;
    stim[60] = 33'h13073714d;
    stim[61] = 33'h01f7677dc;
    stim[62] = 33'h03b96bd1a;
    stim[63] = 33'h023733820;
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
      expv[0] = 2'hx;
      expv[1] = 2'h2;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h2;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h2;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h0;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h0;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h2;
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
