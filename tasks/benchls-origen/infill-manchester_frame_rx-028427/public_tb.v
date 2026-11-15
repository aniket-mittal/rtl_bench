// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028427 dut (
    .clk48(clk),
    .manchester_data_in(in_vec[0:0]),
    .new_byte_available(out_vec[34:34]),
    .end_of_frame(out_vec[33:33]),
    .rx_led(out_vec[32:32]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h1;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h0;
    stim[17] = 1'h1;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h1;
    stim[24] = 1'h0;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h0;
    stim[28] = 1'h1;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h1;
    stim[32] = 1'h0;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h0;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h0;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h0;
    stim[63] = 1'h1;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h0xxxxxxxx;
      expv[2] = 35'h0xxxxxxxx;
      expv[3] = 35'h0xxxxxxxx;
      expv[4] = 35'h0xxxxxxxx;
      expv[5] = 35'h0xxxxxxxx;
      expv[6] = 35'h0xxxxxxxx;
      expv[7] = 35'h0xxxxxxxx;
      expv[8] = 35'h0xxxxxxxx;
      expv[9] = 35'h0xxxxxxxx;
      expv[10] = 35'h0xxxxxxxx;
      expv[11] = 35'h0xxxxxxxx;
      expv[12] = 35'h0xxxxxxxx;
      expv[13] = 35'h0xxxxxxxx;
      expv[14] = 35'h0xxxxxxxx;
      expv[15] = 35'h0xxxxxxxx;
      expv[16] = 35'h0xxxxxxxx;
      expv[17] = 35'h0xxxxxxxx;
      expv[18] = 35'h0xxxxxxxx;
      expv[19] = 35'h0xxxxxxxx;
      expv[20] = 35'h0xxxxxxxx;
      expv[21] = 35'h0xxxxxxxx;
      expv[22] = 35'h0xxxxxxxx;
      expv[23] = 35'h0xxxxxxxx;
      expv[24] = 35'h0xxxxxxxx;
      expv[25] = 35'h0xxxxxxxx;
      expv[26] = 35'h0xxxxxxxx;
      expv[27] = 35'h0xxxxxxxx;
      expv[28] = 35'h0xxxxxxxx;
      expv[29] = 35'h0xxxxxxxx;
      expv[30] = 35'h0xxxxxxxx;
      expv[31] = 35'h0xxxxxxxx;
      expv[32] = 35'h0xxxxxxxx;
      expv[33] = 35'h0xxxxxxxx;
      expv[34] = 35'h0xxxxxxxx;
      expv[35] = 35'h0xxxxxxxx;
      expv[36] = 35'h0xxxxxxxx;
      expv[37] = 35'h0xxxxxxxx;
      expv[38] = 35'h0xxxxxxxx;
      expv[39] = 35'h0xxxxxxxx;
      expv[40] = 35'h0xxxxxxxx;
      expv[41] = 35'h0xxxxxxxx;
      expv[42] = 35'h0xxxxxxxx;
      expv[43] = 35'h0xxxxxxxx;
      expv[44] = 35'h0xxxxxxxx;
      expv[45] = 35'h0xxxxxxxx;
      expv[46] = 35'h0xxxxxxxx;
      expv[47] = 35'h0xxxxxxxx;
      expv[48] = 35'h0xxxxxxxx;
      expv[49] = 35'h0xxxxxxxx;
      expv[50] = 35'h0xxxxxxxx;
      expv[51] = 35'h0xxxxxxxx;
      expv[52] = 35'h0xxxxxxxx;
      expv[53] = 35'h0xxxxxxxx;
      expv[54] = 35'h0xxxxxxxx;
      expv[55] = 35'h0xxxxxxxx;
      expv[56] = 35'h0xxxxxxxx;
      expv[57] = 35'h0xxxxxxxx;
      expv[58] = 35'h0xxxxxxxx;
      expv[59] = 35'h0xxxxxxxx;
      expv[60] = 35'h0xxxxxxxx;
      expv[61] = 35'h0xxxxxxxx;
      expv[62] = 35'h0xxxxxxxx;
      expv[63] = 35'h0xxxxxxxx;
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
