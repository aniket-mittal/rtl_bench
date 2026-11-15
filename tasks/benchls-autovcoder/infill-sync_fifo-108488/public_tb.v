// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_108488 dut (
    .clk(clk),
    .rst_n(in_vec[4:4]),
    .sclr(in_vec[3:3]),
    .rdreq(in_vec[2:2]),
    .wrreq(in_vec[1:1]),
    .data(in_vec[0:0]),
    .empty(out_vec[3:3]),
    .full(out_vec[2:2]),
    .q(out_vec[1:1]),
    .usedw(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0a;
    stim[1] = 5'h0d;
    stim[2] = 5'h15;
    stim[3] = 5'h1e;
    stim[4] = 5'h13;
    stim[5] = 5'h1e;
    stim[6] = 5'h10;
    stim[7] = 5'h16;
    stim[8] = 5'h1c;
    stim[9] = 5'h11;
    stim[10] = 5'h11;
    stim[11] = 5'h19;
    stim[12] = 5'h1c;
    stim[13] = 5'h11;
    stim[14] = 5'h1b;
    stim[15] = 5'h17;
    stim[16] = 5'h19;
    stim[17] = 5'h1f;
    stim[18] = 5'h18;
    stim[19] = 5'h17;
    stim[20] = 5'h15;
    stim[21] = 5'h11;
    stim[22] = 5'h04;
    stim[23] = 5'h1b;
    stim[24] = 5'h12;
    stim[25] = 5'h1a;
    stim[26] = 5'h1f;
    stim[27] = 5'h13;
    stim[28] = 5'h1d;
    stim[29] = 5'h1c;
    stim[30] = 5'h12;
    stim[31] = 5'h1e;
    stim[32] = 5'h1d;
    stim[33] = 5'h1b;
    stim[34] = 5'h1c;
    stim[35] = 5'h18;
    stim[36] = 5'h10;
    stim[37] = 5'h10;
    stim[38] = 5'h16;
    stim[39] = 5'h13;
    stim[40] = 5'h1b;
    stim[41] = 5'h15;
    stim[42] = 5'h14;
    stim[43] = 5'h13;
    stim[44] = 5'h14;
    stim[45] = 5'h14;
    stim[46] = 5'h1f;
    stim[47] = 5'h1d;
    stim[48] = 5'h15;
    stim[49] = 5'h14;
    stim[50] = 5'h1c;
    stim[51] = 5'h1d;
    stim[52] = 5'h1c;
    stim[53] = 5'h1d;
    stim[54] = 5'h10;
    stim[55] = 5'h11;
    stim[56] = 5'h1a;
    stim[57] = 5'h1e;
    stim[58] = 5'h19;
    stim[59] = 5'h1a;
    stim[60] = 5'h1a;
    stim[61] = 5'h18;
    stim[62] = 5'h15;
    stim[63] = 5'h1b;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'h8;
      expv[5] = 4'h3;
      expv[6] = 4'ha;
      expv[7] = 4'ha;
      expv[8] = 4'h1;
      expv[9] = 4'h8;
      expv[10] = 4'h8;
      expv[11] = 4'h8;
      expv[12] = 4'h8;
      expv[13] = 4'h8;
      expv[14] = 4'h8;
      expv[15] = 4'ha;
      expv[16] = 4'h3;
      expv[17] = 4'ha;
      expv[18] = 4'ha;
      expv[19] = 4'ha;
      expv[20] = 4'h3;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'ha;
      expv[24] = 4'ha;
      expv[25] = 4'h1;
      expv[26] = 4'h8;
      expv[27] = 4'ha;
      expv[28] = 4'h3;
      expv[29] = 4'ha;
      expv[30] = 4'ha;
      expv[31] = 4'h1;
      expv[32] = 4'h8;
      expv[33] = 4'h8;
      expv[34] = 4'ha;
      expv[35] = 4'ha;
      expv[36] = 4'ha;
      expv[37] = 4'ha;
      expv[38] = 4'ha;
      expv[39] = 4'h1;
      expv[40] = 4'h4;
      expv[41] = 4'h8;
      expv[42] = 4'h8;
      expv[43] = 4'h8;
      expv[44] = 4'h3;
      expv[45] = 4'ha;
      expv[46] = 4'ha;
      expv[47] = 4'ha;
      expv[48] = 4'ha;
      expv[49] = 4'ha;
      expv[50] = 4'ha;
      expv[51] = 4'ha;
      expv[52] = 4'ha;
      expv[53] = 4'ha;
      expv[54] = 4'ha;
      expv[55] = 4'ha;
      expv[56] = 4'ha;
      expv[57] = 4'h8;
      expv[58] = 4'h8;
      expv[59] = 4'h8;
      expv[60] = 4'h8;
      expv[61] = 4'h8;
      expv[62] = 4'h8;
      expv[63] = 4'h8;
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
