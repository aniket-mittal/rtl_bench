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
    stim[0] = 12'ha65;
    stim[1] = 12'h823;
    stim[2] = 12'h700;
    stim[3] = 12'h47e;
    stim[4] = 12'hdfe;
    stim[5] = 12'hce4;
    stim[6] = 12'h60a;
    stim[7] = 12'ha58;
    stim[8] = 12'ha2a;
    stim[9] = 12'h52c;
    stim[10] = 12'h24e;
    stim[11] = 12'hbc3;
    stim[12] = 12'hd42;
    stim[13] = 12'h30a;
    stim[14] = 12'hfd2;
    stim[15] = 12'h77a;
    stim[16] = 12'ha64;
    stim[17] = 12'heac;
    stim[18] = 12'hb32;
    stim[19] = 12'hbe2;
    stim[20] = 12'h0a6;
    stim[21] = 12'hc94;
    stim[22] = 12'h44c;
    stim[23] = 12'hb3e;
    stim[24] = 12'hb2a;
    stim[25] = 12'hde4;
    stim[26] = 12'h642;
    stim[27] = 12'h1fe;
    stim[28] = 12'h5ae;
    stim[29] = 12'h7ae;
    stim[30] = 12'h37e;
    stim[31] = 12'hbf8;
    stim[32] = 12'hece;
    stim[33] = 12'h9e2;
    stim[34] = 12'hf88;
    stim[35] = 12'h5d2;
    stim[36] = 12'h9c8;
    stim[37] = 12'h586;
    stim[38] = 12'h8a8;
    stim[39] = 12'hd34;
    stim[40] = 12'h73e;
    stim[41] = 12'h526;
    stim[42] = 12'h84a;
    stim[43] = 12'h000;
    stim[44] = 12'h458;
    stim[45] = 12'hdca;
    stim[46] = 12'h8c4;
    stim[47] = 12'h650;
    stim[48] = 12'hd5e;
    stim[49] = 12'h8b4;
    stim[50] = 12'heb2;
    stim[51] = 12'h59c;
    stim[52] = 12'hc3a;
    stim[53] = 12'h7e6;
    stim[54] = 12'h822;
    stim[55] = 12'h9c8;
    stim[56] = 12'hc56;
    stim[57] = 12'h116;
    stim[58] = 12'h418;
    stim[59] = 12'h298;
    stim[60] = 12'h226;
    stim[61] = 12'hdbc;
    stim[62] = 12'hb12;
    stim[63] = 12'h3d2;
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
      expv[3] = 6'h3c;
      expv[4] = 6'h31;
      expv[5] = 6'h17;
      expv[6] = 6'h17;
      expv[7] = 6'h18;
      expv[8] = 6'h18;
      expv[9] = 6'h19;
      expv[10] = 6'h19;
      expv[11] = 6'h20;
      expv[12] = 6'h20;
      expv[13] = 6'h15;
      expv[14] = 6'h16;
      expv[15] = 6'h17;
      expv[16] = 6'h18;
      expv[17] = 6'h18;
      expv[18] = 6'h18;
      expv[19] = 6'h19;
      expv[20] = 6'h1a;
      expv[21] = 6'h1b;
      expv[22] = 6'h1b;
      expv[23] = 6'h1b;
      expv[24] = 6'h1c;
      expv[25] = 6'h1d;
      expv[26] = 6'h1d;
      expv[27] = 6'h3d;
      expv[28] = 6'h27;
      expv[29] = 6'h36;
      expv[30] = 6'h3e;
      expv[31] = 6'h2d;
      expv[32] = 6'h0f;
      expv[33] = 6'h10;
      expv[34] = 6'h11;
      expv[35] = 6'h11;
      expv[36] = 6'h12;
      expv[37] = 6'h12;
      expv[38] = 6'h13;
      expv[39] = 6'h13;
      expv[40] = 6'h13;
      expv[41] = 6'h14;
      expv[42] = 6'h15;
      expv[43] = 6'h16;
      expv[44] = 6'h36;
      expv[45] = 6'h31;
      expv[46] = 6'h17;
      expv[47] = 6'h17;
      expv[48] = 6'h17;
      expv[49] = 6'h18;
      expv[50] = 6'h18;
      expv[51] = 6'h19;
      expv[52] = 6'h19;
      expv[53] = 6'h1a;
      expv[54] = 6'h1b;
      expv[55] = 6'h1c;
      expv[56] = 6'h1c;
      expv[57] = 6'h1d;
      expv[58] = 6'h1e;
      expv[59] = 6'h1e;
      expv[60] = 6'h1e;
      expv[61] = 6'h1f;
      expv[62] = 6'h1f;
      expv[63] = 6'h00;
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
