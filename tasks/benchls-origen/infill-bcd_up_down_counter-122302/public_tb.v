// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122302 dut (
    .clk(clk),
    .up_down_n(in_vec[4:4]),
    .cntr_en(in_vec[3:3]),
    .reset_n(in_vec[2:2]),
    .carry_in(in_vec[1:1]),
    .sub_in(in_vec[0:0]),
    .carry_out(out_vec[5:5]),
    .sub_out(out_vec[4:4]),
    .bcd(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1b;
    stim[1] = 5'h1a;
    stim[2] = 5'h0e;
    stim[3] = 5'h14;
    stim[4] = 5'h17;
    stim[5] = 5'h06;
    stim[6] = 5'h1d;
    stim[7] = 5'h05;
    stim[8] = 5'h15;
    stim[9] = 5'h1c;
    stim[10] = 5'h17;
    stim[11] = 5'h0a;
    stim[12] = 5'h0d;
    stim[13] = 5'h17;
    stim[14] = 5'h04;
    stim[15] = 5'h0d;
    stim[16] = 5'h1d;
    stim[17] = 5'h05;
    stim[18] = 5'h0f;
    stim[19] = 5'h07;
    stim[20] = 5'h07;
    stim[21] = 5'h0c;
    stim[22] = 5'h0f;
    stim[23] = 5'h0e;
    stim[24] = 5'h05;
    stim[25] = 5'h1e;
    stim[26] = 5'h05;
    stim[27] = 5'h06;
    stim[28] = 5'h0d;
    stim[29] = 5'h17;
    stim[30] = 5'h15;
    stim[31] = 5'h05;
    stim[32] = 5'h19;
    stim[33] = 5'h0d;
    stim[34] = 5'h0e;
    stim[35] = 5'h07;
    stim[36] = 5'h04;
    stim[37] = 5'h04;
    stim[38] = 5'h17;
    stim[39] = 5'h0f;
    stim[40] = 5'h1e;
    stim[41] = 5'h0c;
    stim[42] = 5'h05;
    stim[43] = 5'h14;
    stim[44] = 5'h05;
    stim[45] = 5'h0e;
    stim[46] = 5'h19;
    stim[47] = 5'h1e;
    stim[48] = 5'h15;
    stim[49] = 5'h1d;
    stim[50] = 5'h0f;
    stim[51] = 5'h07;
    stim[52] = 5'h0d;
    stim[53] = 5'h05;
    stim[54] = 5'h15;
    stim[55] = 5'h1d;
    stim[56] = 5'h04;
    stim[57] = 5'h15;
    stim[58] = 5'h0f;
    stim[59] = 5'h0e;
    stim[60] = 5'h1f;
    stim[61] = 5'h1e;
    stim[62] = 5'h0c;
    stim[63] = 5'h1d;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h19;
      expv[14] = 6'h09;
      expv[15] = 6'h09;
      expv[16] = 6'h08;
      expv[17] = 6'h08;
      expv[18] = 6'h08;
      expv[19] = 6'h07;
      expv[20] = 6'h07;
      expv[21] = 6'h07;
      expv[22] = 6'h07;
      expv[23] = 6'h06;
      expv[24] = 6'h06;
      expv[25] = 6'h06;
      expv[26] = 6'h07;
      expv[27] = 6'h07;
      expv[28] = 6'h07;
      expv[29] = 6'h06;
      expv[30] = 6'h06;
      expv[31] = 6'h06;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h19;
      expv[35] = 6'h09;
      expv[36] = 6'h09;
      expv[37] = 6'h09;
      expv[38] = 6'h09;
      expv[39] = 6'h09;
      expv[40] = 6'h08;
      expv[41] = 6'h09;
      expv[42] = 6'h09;
      expv[43] = 6'h09;
      expv[44] = 6'h09;
      expv[45] = 6'h09;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h01;
      expv[49] = 6'h01;
      expv[50] = 6'h01;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h19;
      expv[54] = 6'h09;
      expv[55] = 6'h09;
      expv[56] = 6'h09;
      expv[57] = 6'h09;
      expv[58] = 6'h09;
      expv[59] = 6'h08;
      expv[60] = 6'h08;
      expv[61] = 6'h09;
      expv[62] = 6'h20;
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
