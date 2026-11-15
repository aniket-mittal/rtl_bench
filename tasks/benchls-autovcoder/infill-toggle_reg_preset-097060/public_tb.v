// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097060 dut (
    .Clock(clk),
    .ClockEnable(in_vec[5:5]),
    .D(in_vec[4:4]),
    .Reset(in_vec[3:3]),
    .Tick(in_vec[2:2]),
    .cs(in_vec[1:1]),
    .pre(in_vec[0:0]),
    .Q(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h19;
    stim[1] = 6'h1e;
    stim[2] = 6'h13;
    stim[3] = 6'h32;
    stim[4] = 6'h13;
    stim[5] = 6'h00;
    stim[6] = 6'h04;
    stim[7] = 6'h36;
    stim[8] = 6'h23;
    stim[9] = 6'h05;
    stim[10] = 6'h10;
    stim[11] = 6'h05;
    stim[12] = 6'h33;
    stim[13] = 6'h27;
    stim[14] = 6'h25;
    stim[15] = 6'h07;
    stim[16] = 6'h36;
    stim[17] = 6'h12;
    stim[18] = 6'h06;
    stim[19] = 6'h17;
    stim[20] = 6'h30;
    stim[21] = 6'h34;
    stim[22] = 6'h26;
    stim[23] = 6'h30;
    stim[24] = 6'h05;
    stim[25] = 6'h04;
    stim[26] = 6'h37;
    stim[27] = 6'h14;
    stim[28] = 6'h34;
    stim[29] = 6'h12;
    stim[30] = 6'h16;
    stim[31] = 6'h12;
    stim[32] = 6'h12;
    stim[33] = 6'h03;
    stim[34] = 6'h10;
    stim[35] = 6'h12;
    stim[36] = 6'h15;
    stim[37] = 6'h36;
    stim[38] = 6'h01;
    stim[39] = 6'h37;
    stim[40] = 6'h16;
    stim[41] = 6'h13;
    stim[42] = 6'h27;
    stim[43] = 6'h01;
    stim[44] = 6'h33;
    stim[45] = 6'h12;
    stim[46] = 6'h12;
    stim[47] = 6'h35;
    stim[48] = 6'h36;
    stim[49] = 6'h14;
    stim[50] = 6'h00;
    stim[51] = 6'h10;
    stim[52] = 6'h12;
    stim[53] = 6'h04;
    stim[54] = 6'h0e;
    stim[55] = 6'h21;
    stim[56] = 6'h22;
    stim[57] = 6'h06;
    stim[58] = 6'h00;
    stim[59] = 6'h36;
    stim[60] = 6'h24;
    stim[61] = 6'h15;
    stim[62] = 6'h00;
    stim[63] = 6'h31;
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
      expv[0] = 1'h0;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'hx;
      expv[4] = 1'hx;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'hx;
      expv[8] = 1'hx;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'hx;
      expv[13] = 1'hx;
      expv[14] = 1'h1;
      expv[15] = 1'hx;
      expv[16] = 1'hx;
      expv[17] = 1'hx;
      expv[18] = 1'hx;
      expv[19] = 1'hx;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'hx;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'hx;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'hx;
      expv[30] = 1'hx;
      expv[31] = 1'hx;
      expv[32] = 1'hx;
      expv[33] = 1'hx;
      expv[34] = 1'h1;
      expv[35] = 1'hx;
      expv[36] = 1'h1;
      expv[37] = 1'hx;
      expv[38] = 1'h1;
      expv[39] = 1'hx;
      expv[40] = 1'hx;
      expv[41] = 1'hx;
      expv[42] = 1'hx;
      expv[43] = 1'h1;
      expv[44] = 1'hx;
      expv[45] = 1'hx;
      expv[46] = 1'hx;
      expv[47] = 1'h1;
      expv[48] = 1'hx;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'hx;
      expv[53] = 1'h1;
      expv[54] = 1'hx;
      expv[55] = 1'h1;
      expv[56] = 1'hx;
      expv[57] = 1'hx;
      expv[58] = 1'h1;
      expv[59] = 1'hx;
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
