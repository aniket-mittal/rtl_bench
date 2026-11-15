// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_159032 dut (
    .clk(clk),
    .rst_n(in_vec[2:2]),
    .RX(in_vec[1:1]),
    .clr_rx_rdy(in_vec[0:0]),
    .rx_data(out_vec[8:1]),
    .rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h3;
    stim[1] = 3'h3;
    stim[2] = 3'h6;
    stim[3] = 3'h5;
    stim[4] = 3'h7;
    stim[5] = 3'h7;
    stim[6] = 3'h7;
    stim[7] = 3'h4;
    stim[8] = 3'h5;
    stim[9] = 3'h7;
    stim[10] = 3'h6;
    stim[11] = 3'h6;
    stim[12] = 3'h5;
    stim[13] = 3'h7;
    stim[14] = 3'h5;
    stim[15] = 3'h4;
    stim[16] = 3'h7;
    stim[17] = 3'h6;
    stim[18] = 3'h4;
    stim[19] = 3'h6;
    stim[20] = 3'h5;
    stim[21] = 3'h4;
    stim[22] = 3'h4;
    stim[23] = 3'h5;
    stim[24] = 3'h6;
    stim[25] = 3'h4;
    stim[26] = 3'h4;
    stim[27] = 3'h7;
    stim[28] = 3'h5;
    stim[29] = 3'h6;
    stim[30] = 3'h6;
    stim[31] = 3'h7;
    stim[32] = 3'h5;
    stim[33] = 3'h7;
    stim[34] = 3'h7;
    stim[35] = 3'h4;
    stim[36] = 3'h4;
    stim[37] = 3'h7;
    stim[38] = 3'h7;
    stim[39] = 3'h4;
    stim[40] = 3'h4;
    stim[41] = 3'h4;
    stim[42] = 3'h6;
    stim[43] = 3'h4;
    stim[44] = 3'h6;
    stim[45] = 3'h4;
    stim[46] = 3'h4;
    stim[47] = 3'h6;
    stim[48] = 3'h7;
    stim[49] = 3'h3;
    stim[50] = 3'h5;
    stim[51] = 3'h5;
    stim[52] = 3'h5;
    stim[53] = 3'h4;
    stim[54] = 3'h6;
    stim[55] = 3'h6;
    stim[56] = 3'h4;
    stim[57] = 3'h4;
    stim[58] = 3'h7;
    stim[59] = 3'h4;
    stim[60] = 3'h6;
    stim[61] = 3'h7;
    stim[62] = 3'h6;
    stim[63] = 3'h5;
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
      expv[0] = 9'h1fe;
      expv[1] = 9'h1fe;
      expv[2] = 9'h1fe;
      expv[3] = 9'h1fe;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h1fe;
      expv[8] = 9'h1fe;
      expv[9] = 9'h1fe;
      expv[10] = 9'h1fe;
      expv[11] = 9'h1fe;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1fe;
      expv[14] = 9'h1fe;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1fe;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1fe;
      expv[22] = 9'h1fe;
      expv[23] = 9'h1fe;
      expv[24] = 9'h1fe;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1fe;
      expv[27] = 9'h1fe;
      expv[28] = 9'h1fe;
      expv[29] = 9'h1fe;
      expv[30] = 9'h1fe;
      expv[31] = 9'h1fe;
      expv[32] = 9'h1fe;
      expv[33] = 9'h1fe;
      expv[34] = 9'h1fe;
      expv[35] = 9'h1fe;
      expv[36] = 9'h1fe;
      expv[37] = 9'h1fe;
      expv[38] = 9'h1fe;
      expv[39] = 9'h1fe;
      expv[40] = 9'h1fe;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1fe;
      expv[43] = 9'h1fe;
      expv[44] = 9'h1fe;
      expv[45] = 9'h1fe;
      expv[46] = 9'h1fe;
      expv[47] = 9'h1fe;
      expv[48] = 9'h1fe;
      expv[49] = 9'h1fe;
      expv[50] = 9'h1fe;
      expv[51] = 9'h1fe;
      expv[52] = 9'h1fe;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1fe;
      expv[55] = 9'h1fe;
      expv[56] = 9'h1fe;
      expv[57] = 9'h1fe;
      expv[58] = 9'h1fe;
      expv[59] = 9'h1fe;
      expv[60] = 9'h1fe;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1fe;
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
