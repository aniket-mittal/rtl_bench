// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11651 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .gps_pps(in_vec[3:3]),
    .up_clk(in_vec[2:2]),
    .up_rstn(in_vec[1:1]),
    .up_irq_mask(in_vec[0:0]),
    .up_pps_rcounter(out_vec[33:2]),
    .up_pps_status(out_vec[1:1]),
    .up_irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h12;
    stim[1] = 5'h19;
    stim[2] = 5'h0b;
    stim[3] = 5'h00;
    stim[4] = 5'h02;
    stim[5] = 5'h09;
    stim[6] = 5'h06;
    stim[7] = 5'h05;
    stim[8] = 5'h0a;
    stim[9] = 5'h04;
    stim[10] = 5'h04;
    stim[11] = 5'h0b;
    stim[12] = 5'h0a;
    stim[13] = 5'h01;
    stim[14] = 5'h02;
    stim[15] = 5'h0c;
    stim[16] = 5'h06;
    stim[17] = 5'h02;
    stim[18] = 5'h0d;
    stim[19] = 5'h0c;
    stim[20] = 5'h0e;
    stim[21] = 5'h0f;
    stim[22] = 5'h09;
    stim[23] = 5'h01;
    stim[24] = 5'h05;
    stim[25] = 5'h03;
    stim[26] = 5'h0c;
    stim[27] = 5'h05;
    stim[28] = 5'h07;
    stim[29] = 5'h0d;
    stim[30] = 5'h02;
    stim[31] = 5'h06;
    stim[32] = 5'h0e;
    stim[33] = 5'h03;
    stim[34] = 5'h0c;
    stim[35] = 5'h0f;
    stim[36] = 5'h03;
    stim[37] = 5'h08;
    stim[38] = 5'h0e;
    stim[39] = 5'h08;
    stim[40] = 5'h08;
    stim[41] = 5'h08;
    stim[42] = 5'h08;
    stim[43] = 5'h04;
    stim[44] = 5'h0f;
    stim[45] = 5'h0b;
    stim[46] = 5'h05;
    stim[47] = 5'h04;
    stim[48] = 5'h05;
    stim[49] = 5'h0c;
    stim[50] = 5'h06;
    stim[51] = 5'h0e;
    stim[52] = 5'h06;
    stim[53] = 5'h0d;
    stim[54] = 5'h00;
    stim[55] = 5'h06;
    stim[56] = 5'h0c;
    stim[57] = 5'h0a;
    stim[58] = 5'h06;
    stim[59] = 5'h0f;
    stim[60] = 5'h02;
    stim[61] = 5'h05;
    stim[62] = 5'h09;
    stim[63] = 5'h07;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'h000000002;
      expv[10] = 34'h000000002;
      expv[11] = 34'h000000002;
      expv[12] = 34'h000000002;
      expv[13] = 34'h000000002;
      expv[14] = 34'h000000002;
      expv[15] = 34'h000000002;
      expv[16] = 34'h000000002;
      expv[17] = 34'h000000002;
      expv[18] = 34'h000000002;
      expv[19] = 34'h000000002;
      expv[20] = 34'h000000002;
      expv[21] = 34'h000000002;
      expv[22] = 34'h000000002;
      expv[23] = 34'h000000002;
      expv[24] = 34'h000000002;
      expv[25] = 34'h000000002;
      expv[26] = 34'h000000002;
      expv[27] = 34'h000000002;
      expv[28] = 34'h000000002;
      expv[29] = 34'h000000002;
      expv[30] = 34'h000000002;
      expv[31] = 34'h000000002;
      expv[32] = 34'h000000002;
      expv[33] = 34'h000000002;
      expv[34] = 34'h000000002;
      expv[35] = 34'h000000002;
      expv[36] = 34'h000000002;
      expv[37] = 34'h000000002;
      expv[38] = 34'h000000002;
      expv[39] = 34'h000000002;
      expv[40] = 34'h000000002;
      expv[41] = 34'h000000002;
      expv[42] = 34'h000000002;
      expv[43] = 34'h000000002;
      expv[44] = 34'h000000002;
      expv[45] = 34'h000000002;
      expv[46] = 34'h000000002;
      expv[47] = 34'h000000002;
      expv[48] = 34'h000000002;
      expv[49] = 34'h000000002;
      expv[50] = 34'h000000002;
      expv[51] = 34'h000000002;
      expv[52] = 34'h000000002;
      expv[53] = 34'h000000002;
      expv[54] = 34'h000000002;
      expv[55] = 34'h000000002;
      expv[56] = 34'h000000002;
      expv[57] = 34'h000000002;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000002;
      expv[62] = 34'h000000002;
      expv[63] = 34'h000000002;
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
