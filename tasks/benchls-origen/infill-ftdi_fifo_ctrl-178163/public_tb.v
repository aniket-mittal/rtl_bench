// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178163 dut (
    .clk(clk),
    .fifo_usedw(in_vec[12:3]),
    .fifo_empty(in_vec[2:2]),
    .fifo_full(in_vec[1:1]),
    .ftdi_rx_rdy(in_vec[0:0]),
    .fifo_tx_rdy(out_vec[2:2]),
    .fifo_rdreq(out_vec[1:1]),
    .fifo_rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1ed4;
    stim[1] = 13'h1311;
    stim[2] = 13'h01ba;
    stim[3] = 13'h0a50;
    stim[4] = 13'h16e8;
    stim[5] = 13'h15ca;
    stim[6] = 13'h1802;
    stim[7] = 13'h0250;
    stim[8] = 13'h0e4f;
    stim[9] = 13'h1e1c;
    stim[10] = 13'h11e5;
    stim[11] = 13'h0b0a;
    stim[12] = 13'h1984;
    stim[13] = 13'h0894;
    stim[14] = 13'h1ca7;
    stim[15] = 13'h00a7;
    stim[16] = 13'h1052;
    stim[17] = 13'h0fef;
    stim[18] = 13'h0c61;
    stim[19] = 13'h1bba;
    stim[20] = 13'h16f9;
    stim[21] = 13'h167d;
    stim[22] = 13'h175e;
    stim[23] = 13'h0c9b;
    stim[24] = 13'h0bf4;
    stim[25] = 13'h090c;
    stim[26] = 13'h0422;
    stim[27] = 13'h1d0f;
    stim[28] = 13'h0b66;
    stim[29] = 13'h145e;
    stim[30] = 13'h1abf;
    stim[31] = 13'h0c7d;
    stim[32] = 13'h08ec;
    stim[33] = 13'h0eff;
    stim[34] = 13'h0dbf;
    stim[35] = 13'h0861;
    stim[36] = 13'h0138;
    stim[37] = 13'h1943;
    stim[38] = 13'h1485;
    stim[39] = 13'h199a;
    stim[40] = 13'h1083;
    stim[41] = 13'h047f;
    stim[42] = 13'h1fe0;
    stim[43] = 13'h0a09;
    stim[44] = 13'h0b87;
    stim[45] = 13'h0c7b;
    stim[46] = 13'h0352;
    stim[47] = 13'h0d0e;
    stim[48] = 13'h137c;
    stim[49] = 13'h134d;
    stim[50] = 13'h0ab8;
    stim[51] = 13'h1392;
    stim[52] = 13'h0ae4;
    stim[53] = 13'h120c;
    stim[54] = 13'h0bc2;
    stim[55] = 13'h0c6f;
    stim[56] = 13'h192e;
    stim[57] = 13'h030f;
    stim[58] = 13'h0be0;
    stim[59] = 13'h1cb8;
    stim[60] = 13'h0a7c;
    stim[61] = 13'h1f2b;
    stim[62] = 13'h0a2b;
    stim[63] = 13'h17c7;
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
      expv[0] = 3'hx;
      expv[1] = 3'h0;
      expv[2] = 3'h1;
      expv[3] = 3'h5;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h5;
      expv[7] = 3'h5;
      expv[8] = 3'h1;
      expv[9] = 3'h4;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h5;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h4;
      expv[16] = 3'h6;
      expv[17] = 3'h5;
      expv[18] = 3'h6;
      expv[19] = 3'h3;
      expv[20] = 3'h5;
      expv[21] = 3'h3;
      expv[22] = 3'h0;
      expv[23] = 3'h4;
      expv[24] = 3'h7;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h5;
      expv[28] = 3'h6;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h6;
      expv[32] = 3'h2;
      expv[33] = 3'h0;
      expv[34] = 3'h4;
      expv[35] = 3'h6;
      expv[36] = 3'h3;
      expv[37] = 3'h1;
      expv[38] = 3'h5;
      expv[39] = 3'h2;
      expv[40] = 3'h5;
      expv[41] = 3'h7;
      expv[42] = 3'h6;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h4;
      expv[46] = 3'h7;
      expv[47] = 3'h5;
      expv[48] = 3'h4;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h1;
      expv[52] = 3'h5;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h5;
      expv[56] = 3'h6;
      expv[57] = 3'h4;
      expv[58] = 3'h6;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h0;
      expv[62] = 3'h5;
      expv[63] = 3'h7;
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
