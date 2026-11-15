// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09831 dut (
    .clk(clk),
    .reset_n(in_vec[2:2]),
    .enable(in_vec[1:1]),
    .entropy_ack(in_vec[0:0]),
    .raw_entropy(out_vec[97:66]),
    .stats(out_vec[65:34]),
    .enabled(out_vec[33:33]),
    .entropy_syn(out_vec[32:32]),
    .entropy_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h1;
    stim[1] = 3'h2;
    stim[2] = 3'h4;
    stim[3] = 3'h7;
    stim[4] = 3'h7;
    stim[5] = 3'h5;
    stim[6] = 3'h7;
    stim[7] = 3'h2;
    stim[8] = 3'h5;
    stim[9] = 3'h6;
    stim[10] = 3'h5;
    stim[11] = 3'h4;
    stim[12] = 3'h7;
    stim[13] = 3'h7;
    stim[14] = 3'h5;
    stim[15] = 3'h7;
    stim[16] = 3'h6;
    stim[17] = 3'h4;
    stim[18] = 3'h4;
    stim[19] = 3'h7;
    stim[20] = 3'h5;
    stim[21] = 3'h7;
    stim[22] = 3'h7;
    stim[23] = 3'h7;
    stim[24] = 3'h6;
    stim[25] = 3'h4;
    stim[26] = 3'h4;
    stim[27] = 3'h5;
    stim[28] = 3'h4;
    stim[29] = 3'h0;
    stim[30] = 3'h5;
    stim[31] = 3'h6;
    stim[32] = 3'h5;
    stim[33] = 3'h5;
    stim[34] = 3'h5;
    stim[35] = 3'h4;
    stim[36] = 3'h6;
    stim[37] = 3'h5;
    stim[38] = 3'h7;
    stim[39] = 3'h5;
    stim[40] = 3'h6;
    stim[41] = 3'h6;
    stim[42] = 3'h4;
    stim[43] = 3'h6;
    stim[44] = 3'h6;
    stim[45] = 3'h4;
    stim[46] = 3'h6;
    stim[47] = 3'h7;
    stim[48] = 3'h6;
    stim[49] = 3'h7;
    stim[50] = 3'h5;
    stim[51] = 3'h4;
    stim[52] = 3'h6;
    stim[53] = 3'h7;
    stim[54] = 3'h6;
    stim[55] = 3'h5;
    stim[56] = 3'h6;
    stim[57] = 3'h6;
    stim[58] = 3'h4;
    stim[59] = 3'h6;
    stim[60] = 3'h7;
    stim[61] = 3'h7;
    stim[62] = 3'h6;
    stim[63] = 3'h4;
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
      expv[0] = 98'h0000000000000000000000000;
      expv[1] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[2] = 98'h0000000000000000000000000;
      expv[3] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[4] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[5] = 98'h0000000000000000000000000;
      expv[6] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[7] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[8] = 98'h0000000000000000000000000;
      expv[9] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[10] = 98'h0000000000000000000000000;
      expv[11] = 98'h0000000000000000000000000;
      expv[12] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[13] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[14] = 98'h0000000000000000000000000;
      expv[15] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[16] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[17] = 98'h0000000000000000000000000;
      expv[18] = 98'h0000000000000000000000000;
      expv[19] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[20] = 98'h0000000000000000000000000;
      expv[21] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[22] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[23] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[24] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[25] = 98'h0000000000000000000000000;
      expv[26] = 98'h0000000000000000000000000;
      expv[27] = 98'h0000000000000000000000000;
      expv[28] = 98'h0000000000000000000000000;
      expv[29] = 98'h0000000000000000000000000;
      expv[30] = 98'h0000000000000000000000000;
      expv[31] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[32] = 98'h0000000000000000000000000;
      expv[33] = 98'h0000000000000000000000000;
      expv[34] = 98'h0000000000000000000000000;
      expv[35] = 98'h0000000000000000000000000;
      expv[36] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[37] = 98'h0000000000000000000000000;
      expv[38] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[39] = 98'h0000000000000000000000000;
      expv[40] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[41] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[42] = 98'h0000000000000000000000000;
      expv[43] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[44] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[45] = 98'h0000000000000000000000000;
      expv[46] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[47] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[48] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[49] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[50] = 98'h0000000000000000000000000;
      expv[51] = 98'h0000000000000000000000000;
      expv[52] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[53] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[54] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[55] = 98'h0000000000000000000000000;
      expv[56] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[57] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[58] = 98'h0000000000000000000000000;
      expv[59] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[60] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[61] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[62] = 98'h003fc03fffc03fc03f1e2d3c4;
      expv[63] = 98'h0000000000000000000000000;
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
