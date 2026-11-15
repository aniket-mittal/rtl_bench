// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107024 dut (
    .clk_100mhz(clk),
    .rst(in_vec[12:12]),
    .data_in(in_vec[11:0]),
    .sample_trigger(out_vec[12:12]),
    .data_out(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h15aa;
    stim[1] = 13'h1b6e;
    stim[2] = 13'h0cf4;
    stim[3] = 13'h0dd0;
    stim[4] = 13'h0cc6;
    stim[5] = 13'h0c15;
    stim[6] = 13'h0d3a;
    stim[7] = 13'h03cc;
    stim[8] = 13'h0832;
    stim[9] = 13'h0a0f;
    stim[10] = 13'h002c;
    stim[11] = 13'h06d0;
    stim[12] = 13'h064a;
    stim[13] = 13'h0b9c;
    stim[14] = 13'h0a26;
    stim[15] = 13'h01a1;
    stim[16] = 13'h0297;
    stim[17] = 13'h0791;
    stim[18] = 13'h03a7;
    stim[19] = 13'h0d94;
    stim[20] = 13'h0e7d;
    stim[21] = 13'h0063;
    stim[22] = 13'h01e4;
    stim[23] = 13'h069d;
    stim[24] = 13'h02cc;
    stim[25] = 13'h03c9;
    stim[26] = 13'h08e1;
    stim[27] = 13'h0e5f;
    stim[28] = 13'h0cd4;
    stim[29] = 13'h0eaf;
    stim[30] = 13'h07e3;
    stim[31] = 13'h0cf8;
    stim[32] = 13'h01fd;
    stim[33] = 13'h0c6c;
    stim[34] = 13'h0b8a;
    stim[35] = 13'h04d9;
    stim[36] = 13'h03cc;
    stim[37] = 13'h09e6;
    stim[38] = 13'h0a83;
    stim[39] = 13'h0219;
    stim[40] = 13'h0572;
    stim[41] = 13'h0c6e;
    stim[42] = 13'h017b;
    stim[43] = 13'h0785;
    stim[44] = 13'h0371;
    stim[45] = 13'h09f4;
    stim[46] = 13'h0cee;
    stim[47] = 13'h073d;
    stim[48] = 13'h0a26;
    stim[49] = 13'h0e50;
    stim[50] = 13'h0995;
    stim[51] = 13'h006e;
    stim[52] = 13'h0d4d;
    stim[53] = 13'h0f08;
    stim[54] = 13'h0a88;
    stim[55] = 13'h0554;
    stim[56] = 13'h00f4;
    stim[57] = 13'h0690;
    stim[58] = 13'h0ac6;
    stim[59] = 13'h02ff;
    stim[60] = 13'h0963;
    stim[61] = 13'h0738;
    stim[62] = 13'h0ff6;
    stim[63] = 13'h00ed;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
