// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143491 dut (
    .clk_x4(clk),
    .rst_x(in_vec[10:10]),
    .i_rx(in_vec[9:9]),
    .i_data(in_vec[8:1]),
    .i_valid(in_vec[0:0]),
    .o_tx(out_vec[10:10]),
    .o_data(out_vec[9:2]),
    .o_tx_error(out_vec[1:1]),
    .o_rx_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h64b;
    stim[1] = 11'h5ac;
    stim[2] = 11'h06a;
    stim[3] = 11'h087;
    stim[4] = 11'h38e;
    stim[5] = 11'h086;
    stim[6] = 11'h1ff;
    stim[7] = 11'h0f6;
    stim[8] = 11'h3fa;
    stim[9] = 11'h107;
    stim[10] = 11'h18e;
    stim[11] = 11'h262;
    stim[12] = 11'h336;
    stim[13] = 11'h218;
    stim[14] = 11'h626;
    stim[15] = 11'h073;
    stim[16] = 11'h186;
    stim[17] = 11'h183;
    stim[18] = 11'h0f9;
    stim[19] = 11'h2dc;
    stim[20] = 11'h1b6;
    stim[21] = 11'h276;
    stim[22] = 11'h16c;
    stim[23] = 11'h2b5;
    stim[24] = 11'h24a;
    stim[25] = 11'h2bd;
    stim[26] = 11'h0fb;
    stim[27] = 11'h358;
    stim[28] = 11'h159;
    stim[29] = 11'h180;
    stim[30] = 11'h034;
    stim[31] = 11'h285;
    stim[32] = 11'h011;
    stim[33] = 11'h2f1;
    stim[34] = 11'h306;
    stim[35] = 11'h030;
    stim[36] = 11'h3c7;
    stim[37] = 11'h37e;
    stim[38] = 11'h047;
    stim[39] = 11'h141;
    stim[40] = 11'h1a7;
    stim[41] = 11'h05a;
    stim[42] = 11'h3fd;
    stim[43] = 11'h23e;
    stim[44] = 11'h0e1;
    stim[45] = 11'h147;
    stim[46] = 11'h274;
    stim[47] = 11'h145;
    stim[48] = 11'h637;
    stim[49] = 11'h122;
    stim[50] = 11'h12d;
    stim[51] = 11'h2bc;
    stim[52] = 11'h23d;
    stim[53] = 11'h247;
    stim[54] = 11'h02a;
    stim[55] = 11'h3c5;
    stim[56] = 11'h207;
    stim[57] = 11'h081;
    stim[58] = 11'h1ec;
    stim[59] = 11'h337;
    stim[60] = 11'h2c9;
    stim[61] = 11'h398;
    stim[62] = 11'h2e2;
    stim[63] = 11'h029;
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
      expv[0] = 11'h400;
      expv[1] = 11'h000;
      expv[2] = 11'h400;
      expv[3] = 11'h400;
      expv[4] = 11'h400;
      expv[5] = 11'h400;
      expv[6] = 11'h400;
      expv[7] = 11'h400;
      expv[8] = 11'h400;
      expv[9] = 11'h400;
      expv[10] = 11'h400;
      expv[11] = 11'h400;
      expv[12] = 11'h400;
      expv[13] = 11'h400;
      expv[14] = 11'h400;
      expv[15] = 11'h400;
      expv[16] = 11'h400;
      expv[17] = 11'h400;
      expv[18] = 11'h400;
      expv[19] = 11'h400;
      expv[20] = 11'h400;
      expv[21] = 11'h400;
      expv[22] = 11'h400;
      expv[23] = 11'h400;
      expv[24] = 11'h400;
      expv[25] = 11'h400;
      expv[26] = 11'h400;
      expv[27] = 11'h400;
      expv[28] = 11'h400;
      expv[29] = 11'h400;
      expv[30] = 11'h400;
      expv[31] = 11'h400;
      expv[32] = 11'h400;
      expv[33] = 11'h400;
      expv[34] = 11'h400;
      expv[35] = 11'h400;
      expv[36] = 11'h400;
      expv[37] = 11'h400;
      expv[38] = 11'h400;
      expv[39] = 11'h400;
      expv[40] = 11'h400;
      expv[41] = 11'h400;
      expv[42] = 11'h400;
      expv[43] = 11'h400;
      expv[44] = 11'h400;
      expv[45] = 11'h400;
      expv[46] = 11'h400;
      expv[47] = 11'h400;
      expv[48] = 11'h400;
      expv[49] = 11'h400;
      expv[50] = 11'h400;
      expv[51] = 11'h400;
      expv[52] = 11'h400;
      expv[53] = 11'h400;
      expv[54] = 11'h400;
      expv[55] = 11'h400;
      expv[56] = 11'h400;
      expv[57] = 11'h400;
      expv[58] = 11'h400;
      expv[59] = 11'h400;
      expv[60] = 11'h400;
      expv[61] = 11'h400;
      expv[62] = 11'h400;
      expv[63] = 11'h400;
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
