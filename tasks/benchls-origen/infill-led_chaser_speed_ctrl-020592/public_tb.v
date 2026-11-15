// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020592 dut (
    .clk(clk),
    .i_sw(in_vec[4:1]),
    .i_reset(in_vec[0:0]),
    .o_led(out_vec[11:8]),
    .o_led_b(out_vec[7:4]),
    .o_led_g(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h09;
    stim[1] = 5'h15;
    stim[2] = 5'h04;
    stim[3] = 5'h0c;
    stim[4] = 5'h18;
    stim[5] = 5'h0a;
    stim[6] = 5'h12;
    stim[7] = 5'h14;
    stim[8] = 5'h00;
    stim[9] = 5'h06;
    stim[10] = 5'h1e;
    stim[11] = 5'h16;
    stim[12] = 5'h18;
    stim[13] = 5'h0c;
    stim[14] = 5'h1c;
    stim[15] = 5'h1a;
    stim[16] = 5'h0c;
    stim[17] = 5'h06;
    stim[18] = 5'h08;
    stim[19] = 5'h12;
    stim[20] = 5'h08;
    stim[21] = 5'h04;
    stim[22] = 5'h1c;
    stim[23] = 5'h08;
    stim[24] = 5'h06;
    stim[25] = 5'h02;
    stim[26] = 5'h03;
    stim[27] = 5'h0c;
    stim[28] = 5'h1e;
    stim[29] = 5'h12;
    stim[30] = 5'h1a;
    stim[31] = 5'h0e;
    stim[32] = 5'h18;
    stim[33] = 5'h04;
    stim[34] = 5'h1a;
    stim[35] = 5'h16;
    stim[36] = 5'h1a;
    stim[37] = 5'h0c;
    stim[38] = 5'h1e;
    stim[39] = 5'h0a;
    stim[40] = 5'h16;
    stim[41] = 5'h02;
    stim[42] = 5'h1c;
    stim[43] = 5'h00;
    stim[44] = 5'h00;
    stim[45] = 5'h08;
    stim[46] = 5'h04;
    stim[47] = 5'h10;
    stim[48] = 5'h08;
    stim[49] = 5'h00;
    stim[50] = 5'h0a;
    stim[51] = 5'h16;
    stim[52] = 5'h06;
    stim[53] = 5'h1c;
    stim[54] = 5'h0e;
    stim[55] = 5'h16;
    stim[56] = 5'h1a;
    stim[57] = 5'h00;
    stim[58] = 5'h18;
    stim[59] = 5'h12;
    stim[60] = 5'h02;
    stim[61] = 5'h00;
    stim[62] = 5'h0e;
    stim[63] = 5'h08;
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
      expv[0] = 12'h110;
      expv[1] = 12'h101;
      expv[2] = 12'h111;
      expv[3] = 12'h110;
      expv[4] = 12'h101;
      expv[5] = 12'h110;
      expv[6] = 12'h101;
      expv[7] = 12'h101;
      expv[8] = 12'h110;
      expv[9] = 12'h110;
      expv[10] = 12'h101;
      expv[11] = 12'h101;
      expv[12] = 12'h101;
      expv[13] = 12'h110;
      expv[14] = 12'h101;
      expv[15] = 12'h101;
      expv[16] = 12'h110;
      expv[17] = 12'h110;
      expv[18] = 12'h110;
      expv[19] = 12'h101;
      expv[20] = 12'h110;
      expv[21] = 12'h110;
      expv[22] = 12'h101;
      expv[23] = 12'h110;
      expv[24] = 12'h110;
      expv[25] = 12'h110;
      expv[26] = 12'h111;
      expv[27] = 12'h111;
      expv[28] = 12'h101;
      expv[29] = 12'h101;
      expv[30] = 12'h101;
      expv[31] = 12'h110;
      expv[32] = 12'h101;
      expv[33] = 12'h110;
      expv[34] = 12'h101;
      expv[35] = 12'h101;
      expv[36] = 12'h101;
      expv[37] = 12'h110;
      expv[38] = 12'h101;
      expv[39] = 12'h110;
      expv[40] = 12'h101;
      expv[41] = 12'h110;
      expv[42] = 12'h101;
      expv[43] = 12'h110;
      expv[44] = 12'h111;
      expv[45] = 12'h110;
      expv[46] = 12'h110;
      expv[47] = 12'h101;
      expv[48] = 12'h110;
      expv[49] = 12'h110;
      expv[50] = 12'h110;
      expv[51] = 12'h101;
      expv[52] = 12'h110;
      expv[53] = 12'h101;
      expv[54] = 12'h110;
      expv[55] = 12'h101;
      expv[56] = 12'h101;
      expv[57] = 12'h110;
      expv[58] = 12'h101;
      expv[59] = 12'h101;
      expv[60] = 12'h110;
      expv[61] = 12'h110;
      expv[62] = 12'h110;
      expv[63] = 12'h110;
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
