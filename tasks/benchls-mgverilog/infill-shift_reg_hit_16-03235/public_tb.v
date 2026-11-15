// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03235 dut (
    .clk(clk),
    .addr(in_vec[5:2]),
    .wrenb(in_vec[1:1]),
    .din(in_vec[0:0]),
    .dout(out_vec[1:1]),
    .hit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h06;
    stim[1] = 6'h35;
    stim[2] = 6'h2a;
    stim[3] = 6'h2e;
    stim[4] = 6'h28;
    stim[5] = 6'h2f;
    stim[6] = 6'h28;
    stim[7] = 6'h3d;
    stim[8] = 6'h28;
    stim[9] = 6'h12;
    stim[10] = 6'h23;
    stim[11] = 6'h21;
    stim[12] = 6'h19;
    stim[13] = 6'h0e;
    stim[14] = 6'h1f;
    stim[15] = 6'h00;
    stim[16] = 6'h05;
    stim[17] = 6'h02;
    stim[18] = 6'h07;
    stim[19] = 6'h34;
    stim[20] = 6'h3c;
    stim[21] = 6'h1b;
    stim[22] = 6'h21;
    stim[23] = 6'h39;
    stim[24] = 6'h3f;
    stim[25] = 6'h02;
    stim[26] = 6'h28;
    stim[27] = 6'h39;
    stim[28] = 6'h15;
    stim[29] = 6'h1c;
    stim[30] = 6'h0c;
    stim[31] = 6'h1a;
    stim[32] = 6'h1a;
    stim[33] = 6'h20;
    stim[34] = 6'h16;
    stim[35] = 6'h11;
    stim[36] = 6'h13;
    stim[37] = 6'h24;
    stim[38] = 6'h0c;
    stim[39] = 6'h2b;
    stim[40] = 6'h31;
    stim[41] = 6'h10;
    stim[42] = 6'h19;
    stim[43] = 6'h0d;
    stim[44] = 6'h21;
    stim[45] = 6'h0f;
    stim[46] = 6'h1c;
    stim[47] = 6'h06;
    stim[48] = 6'h2f;
    stim[49] = 6'h24;
    stim[50] = 6'h22;
    stim[51] = 6'h2f;
    stim[52] = 6'h33;
    stim[53] = 6'h18;
    stim[54] = 6'h01;
    stim[55] = 6'h13;
    stim[56] = 6'h29;
    stim[57] = 6'h1f;
    stim[58] = 6'h09;
    stim[59] = 6'h31;
    stim[60] = 6'h3c;
    stim[61] = 6'h17;
    stim[62] = 6'h36;
    stim[63] = 6'h0e;
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
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'hx;
      expv[4] = 2'hx;
      expv[5] = 2'hx;
      expv[6] = 2'hx;
      expv[7] = 2'hx;
      expv[8] = 2'hx;
      expv[9] = 2'hx;
      expv[10] = 2'hx;
      expv[11] = 2'hx;
      expv[12] = 2'hx;
      expv[13] = 2'hx;
      expv[14] = 2'hx;
      expv[15] = 2'hx;
      expv[16] = 2'hx;
      expv[17] = 2'hx;
      expv[18] = 2'hx;
      expv[19] = 2'hx;
      expv[20] = 2'hx;
      expv[21] = 2'hx;
      expv[22] = 2'hx;
      expv[23] = 2'hx;
      expv[24] = 2'hx;
      expv[25] = 2'hx;
      expv[26] = 2'hx;
      expv[27] = 2'hx;
      expv[28] = 2'hx;
      expv[29] = 2'hx;
      expv[30] = 2'hx;
      expv[31] = 2'hx;
      expv[32] = 2'hx;
      expv[33] = 2'hx;
      expv[34] = 2'hx;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h1;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h0;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h0;
      expv[49] = 2'h3;
      expv[50] = 2'h2;
      expv[51] = 2'h1;
      expv[52] = 2'h3;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h2;
      expv[57] = 2'h3;
      expv[58] = 2'h3;
      expv[59] = 2'h2;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h2;
      expv[63] = 2'h1;
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
