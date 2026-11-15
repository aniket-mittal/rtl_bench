// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_221074 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .uart_rxd(in_vec[10:10]),
    .rx_ack(in_vec[9:9]),
    .tx_data(in_vec[8:1]),
    .tx_wr(in_vec[0:0]),
    .uart_txd(out_vec[12:12]),
    .rx_data(out_vec[11:4]),
    .rx_avail(out_vec[3:3]),
    .rx_error(out_vec[2:2]),
    .rx_busy(out_vec[1:1]),
    .tx_busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9f6;
    stim[1] = 12'hef5;
    stim[2] = 12'h435;
    stim[3] = 12'h418;
    stim[4] = 12'h41d;
    stim[5] = 12'h30c;
    stim[6] = 12'h077;
    stim[7] = 12'h63d;
    stim[8] = 12'h6d6;
    stim[9] = 12'h13b;
    stim[10] = 12'h3b0;
    stim[11] = 12'h6d0;
    stim[12] = 12'h383;
    stim[13] = 12'h01d;
    stim[14] = 12'h5e2;
    stim[15] = 12'h3c3;
    stim[16] = 12'hfda;
    stim[17] = 12'h68a;
    stim[18] = 12'h1f7;
    stim[19] = 12'h16d;
    stim[20] = 12'h11e;
    stim[21] = 12'h234;
    stim[22] = 12'h462;
    stim[23] = 12'h705;
    stim[24] = 12'h06c;
    stim[25] = 12'h27b;
    stim[26] = 12'h40d;
    stim[27] = 12'h266;
    stim[28] = 12'h13c;
    stim[29] = 12'h041;
    stim[30] = 12'h2c8;
    stim[31] = 12'h266;
    stim[32] = 12'h5bf;
    stim[33] = 12'h48c;
    stim[34] = 12'h1c2;
    stim[35] = 12'h383;
    stim[36] = 12'h5fe;
    stim[37] = 12'h21f;
    stim[38] = 12'h5a6;
    stim[39] = 12'h632;
    stim[40] = 12'h738;
    stim[41] = 12'h1d6;
    stim[42] = 12'h008;
    stim[43] = 12'h410;
    stim[44] = 12'h3a3;
    stim[45] = 12'h74b;
    stim[46] = 12'h0dc;
    stim[47] = 12'h670;
    stim[48] = 12'h0e1;
    stim[49] = 12'h659;
    stim[50] = 12'h60d;
    stim[51] = 12'h49c;
    stim[52] = 12'h77b;
    stim[53] = 12'h4ab;
    stim[54] = 12'h6fb;
    stim[55] = 12'h3a5;
    stim[56] = 12'h454;
    stim[57] = 12'h50c;
    stim[58] = 12'h35b;
    stim[59] = 12'h769;
    stim[60] = 12'h139;
    stim[61] = 12'h137;
    stim[62] = 12'h1a9;
    stim[63] = 12'h6c3;
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
      expv[0] = 13'h1xx0;
      expv[1] = 13'h1xx0;
      expv[2] = 13'h1xx0;
      expv[3] = 13'h1xx1;
      expv[4] = 13'h1xx1;
      expv[5] = 13'h1xx1;
      expv[6] = 13'h1xx1;
      expv[7] = 13'h1xx1;
      expv[8] = 13'h1xx1;
      expv[9] = 13'h1xx1;
      expv[10] = 13'h1xx1;
      expv[11] = 13'h1xx1;
      expv[12] = 13'h1xx1;
      expv[13] = 13'h1xx1;
      expv[14] = 13'h1xx1;
      expv[15] = 13'h1xx1;
      expv[16] = 13'h1xx0;
      expv[17] = 13'h1xx0;
      expv[18] = 13'h1xx0;
      expv[19] = 13'h1xx1;
      expv[20] = 13'h1xx1;
      expv[21] = 13'h1xx1;
      expv[22] = 13'h1xx1;
      expv[23] = 13'h1xx1;
      expv[24] = 13'h1xx1;
      expv[25] = 13'h1xx1;
      expv[26] = 13'h1xx1;
      expv[27] = 13'h1xx1;
      expv[28] = 13'h1xx1;
      expv[29] = 13'h1xx1;
      expv[30] = 13'h1xx1;
      expv[31] = 13'h1xx1;
      expv[32] = 13'h1xx1;
      expv[33] = 13'h1xx1;
      expv[34] = 13'h1xx1;
      expv[35] = 13'h1xx1;
      expv[36] = 13'h1xx1;
      expv[37] = 13'h1xx1;
      expv[38] = 13'h1xx1;
      expv[39] = 13'h1xx1;
      expv[40] = 13'h1xx1;
      expv[41] = 13'h1xx1;
      expv[42] = 13'h1xx1;
      expv[43] = 13'h1xx1;
      expv[44] = 13'h1xx1;
      expv[45] = 13'h1xx1;
      expv[46] = 13'h1xx1;
      expv[47] = 13'h1xx1;
      expv[48] = 13'h1xx1;
      expv[49] = 13'h1xx1;
      expv[50] = 13'h1xx1;
      expv[51] = 13'h1xx1;
      expv[52] = 13'h1xx1;
      expv[53] = 13'h1xx1;
      expv[54] = 13'h1xx1;
      expv[55] = 13'h1xx1;
      expv[56] = 13'h1xx1;
      expv[57] = 13'h1xx1;
      expv[58] = 13'h1xx1;
      expv[59] = 13'h1xx1;
      expv[60] = 13'h1xx1;
      expv[61] = 13'h1xx1;
      expv[62] = 13'h1xx1;
      expv[63] = 13'h1xx1;
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
