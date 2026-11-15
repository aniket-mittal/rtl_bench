// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_105546 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .display_request(in_vec[3:3]),
    .display_done(in_vec[2:2]),
    .sdcard_request(in_vec[1:1]),
    .sdcard_done(in_vec[0:0]),
    .SCK(out_vec[6:6]),
    .DISPLAY_CS(out_vec[5:5]),
    .SDCARD_CS(out_vec[4:4]),
    .RS_DC(out_vec[3:3]),
    .DATA(out_vec[2:2]),
    .display_acknowledge(out_vec[1:1]),
    .sdcard_acknowledge(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h18;
    stim[1] = 5'h1c;
    stim[2] = 5'h1b;
    stim[3] = 5'h02;
    stim[4] = 5'h02;
    stim[5] = 5'h0e;
    stim[6] = 5'h06;
    stim[7] = 5'h00;
    stim[8] = 5'h07;
    stim[9] = 5'h05;
    stim[10] = 5'h03;
    stim[11] = 5'h09;
    stim[12] = 5'h00;
    stim[13] = 5'h07;
    stim[14] = 5'h04;
    stim[15] = 5'h0f;
    stim[16] = 5'h0b;
    stim[17] = 5'h00;
    stim[18] = 5'h01;
    stim[19] = 5'h0a;
    stim[20] = 5'h09;
    stim[21] = 5'h0e;
    stim[22] = 5'h00;
    stim[23] = 5'h0e;
    stim[24] = 5'h0d;
    stim[25] = 5'h0b;
    stim[26] = 5'h09;
    stim[27] = 5'h06;
    stim[28] = 5'h03;
    stim[29] = 5'h06;
    stim[30] = 5'h05;
    stim[31] = 5'h0f;
    stim[32] = 5'h03;
    stim[33] = 5'h0c;
    stim[34] = 5'h04;
    stim[35] = 5'h0e;
    stim[36] = 5'h01;
    stim[37] = 5'h0d;
    stim[38] = 5'h0a;
    stim[39] = 5'h0d;
    stim[40] = 5'h00;
    stim[41] = 5'h03;
    stim[42] = 5'h03;
    stim[43] = 5'h0c;
    stim[44] = 5'h02;
    stim[45] = 5'h03;
    stim[46] = 5'h09;
    stim[47] = 5'h01;
    stim[48] = 5'h03;
    stim[49] = 5'h0b;
    stim[50] = 5'h08;
    stim[51] = 5'h10;
    stim[52] = 5'h0a;
    stim[53] = 5'h0a;
    stim[54] = 5'h02;
    stim[55] = 5'h07;
    stim[56] = 5'h09;
    stim[57] = 5'h06;
    stim[58] = 5'h08;
    stim[59] = 5'h02;
    stim[60] = 5'h06;
    stim[61] = 5'h0c;
    stim[62] = 5'h05;
    stim[63] = 5'h0e;
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
      expv[0] = 7'h30;
      expv[1] = 7'h30;
      expv[2] = 7'h30;
      expv[3] = 7'h30;
      expv[4] = 7'h30;
      expv[5] = 7'h2d;
      expv[6] = 7'h30;
      expv[7] = 7'h30;
      expv[8] = 7'h2d;
      expv[9] = 7'h30;
      expv[10] = 7'h30;
      expv[11] = 7'h30;
      expv[12] = 7'h1e;
      expv[13] = 7'h1e;
      expv[14] = 7'h30;
      expv[15] = 7'h30;
      expv[16] = 7'h30;
      expv[17] = 7'h1e;
      expv[18] = 7'h1e;
      expv[19] = 7'h30;
      expv[20] = 7'h30;
      expv[21] = 7'h1e;
      expv[22] = 7'h30;
      expv[23] = 7'h30;
      expv[24] = 7'h30;
      expv[25] = 7'h1e;
      expv[26] = 7'h30;
      expv[27] = 7'h30;
      expv[28] = 7'h2d;
      expv[29] = 7'h30;
      expv[30] = 7'h30;
      expv[31] = 7'h2d;
      expv[32] = 7'h30;
      expv[33] = 7'h30;
      expv[34] = 7'h1e;
      expv[35] = 7'h30;
      expv[36] = 7'h30;
      expv[37] = 7'h2d;
      expv[38] = 7'h30;
      expv[39] = 7'h30;
      expv[40] = 7'h1e;
      expv[41] = 7'h1e;
      expv[42] = 7'h30;
      expv[43] = 7'h30;
      expv[44] = 7'h1e;
      expv[45] = 7'h1e;
      expv[46] = 7'h30;
      expv[47] = 7'h30;
      expv[48] = 7'h2d;
      expv[49] = 7'h30;
      expv[50] = 7'h30;
      expv[51] = 7'h30;
      expv[52] = 7'h30;
      expv[53] = 7'h30;
      expv[54] = 7'h2d;
      expv[55] = 7'h2d;
      expv[56] = 7'h30;
      expv[57] = 7'h30;
      expv[58] = 7'h2d;
      expv[59] = 7'h2d;
      expv[60] = 7'h2d;
      expv[61] = 7'h30;
      expv[62] = 7'h30;
      expv[63] = 7'h2d;
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
