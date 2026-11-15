// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_222626 dut (
    .clkin(clk),
    .PSCLK(in_vec[3:3]),
    .PSEN(in_vec[2:2]),
    .PSINCDEC(in_vec[1:1]),
    .RST(in_vec[0:0]),
    .clk0(out_vec[2:2]),
    .CLKFB(out_vec[1:1]),
    .CLK2X(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h9;
    stim[2] = 4'hc;
    stim[3] = 4'hc;
    stim[4] = 4'hc;
    stim[5] = 4'ha;
    stim[6] = 4'h2;
    stim[7] = 4'hc;
    stim[8] = 4'hc;
    stim[9] = 4'h6;
    stim[10] = 4'h4;
    stim[11] = 4'h0;
    stim[12] = 4'ha;
    stim[13] = 4'h2;
    stim[14] = 4'h8;
    stim[15] = 4'h6;
    stim[16] = 4'h2;
    stim[17] = 4'h4;
    stim[18] = 4'h2;
    stim[19] = 4'h6;
    stim[20] = 4'hc;
    stim[21] = 4'h8;
    stim[22] = 4'h4;
    stim[23] = 4'h0;
    stim[24] = 4'h6;
    stim[25] = 4'ha;
    stim[26] = 4'hc;
    stim[27] = 4'h6;
    stim[28] = 4'hd;
    stim[29] = 4'h8;
    stim[30] = 4'he;
    stim[31] = 4'h2;
    stim[32] = 4'h4;
    stim[33] = 4'h4;
    stim[34] = 4'he;
    stim[35] = 4'h4;
    stim[36] = 4'ha;
    stim[37] = 4'h2;
    stim[38] = 4'h4;
    stim[39] = 4'h6;
    stim[40] = 4'he;
    stim[41] = 4'hc;
    stim[42] = 4'he;
    stim[43] = 4'h2;
    stim[44] = 4'h4;
    stim[45] = 4'hc;
    stim[46] = 4'h8;
    stim[47] = 4'h8;
    stim[48] = 4'h6;
    stim[49] = 4'h6;
    stim[50] = 4'h0;
    stim[51] = 4'h0;
    stim[52] = 4'h4;
    stim[53] = 4'h8;
    stim[54] = 4'he;
    stim[55] = 4'he;
    stim[56] = 4'h2;
    stim[57] = 4'h0;
    stim[58] = 4'he;
    stim[59] = 4'h0;
    stim[60] = 4'he;
    stim[61] = 4'hc;
    stim[62] = 4'h2;
    stim[63] = 4'ha;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h5;
      expv[4] = 3'h2;
      expv[5] = 3'h5;
      expv[6] = 3'h2;
      expv[7] = 3'h5;
      expv[8] = 3'h2;
      expv[9] = 3'h5;
      expv[10] = 3'h2;
      expv[11] = 3'h5;
      expv[12] = 3'h2;
      expv[13] = 3'h5;
      expv[14] = 3'h2;
      expv[15] = 3'h5;
      expv[16] = 3'h2;
      expv[17] = 3'h5;
      expv[18] = 3'h2;
      expv[19] = 3'h5;
      expv[20] = 3'h2;
      expv[21] = 3'h5;
      expv[22] = 3'h2;
      expv[23] = 3'h5;
      expv[24] = 3'h2;
      expv[25] = 3'h5;
      expv[26] = 3'h2;
      expv[27] = 3'h5;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h5;
      expv[31] = 3'h2;
      expv[32] = 3'h5;
      expv[33] = 3'h2;
      expv[34] = 3'h5;
      expv[35] = 3'h2;
      expv[36] = 3'h5;
      expv[37] = 3'h2;
      expv[38] = 3'h5;
      expv[39] = 3'h2;
      expv[40] = 3'h5;
      expv[41] = 3'h2;
      expv[42] = 3'h5;
      expv[43] = 3'h2;
      expv[44] = 3'h5;
      expv[45] = 3'h2;
      expv[46] = 3'h5;
      expv[47] = 3'h2;
      expv[48] = 3'h5;
      expv[49] = 3'h2;
      expv[50] = 3'h5;
      expv[51] = 3'h2;
      expv[52] = 3'h5;
      expv[53] = 3'h2;
      expv[54] = 3'h5;
      expv[55] = 3'h2;
      expv[56] = 3'h5;
      expv[57] = 3'h2;
      expv[58] = 3'h5;
      expv[59] = 3'h2;
      expv[60] = 3'h5;
      expv[61] = 3'h2;
      expv[62] = 3'h5;
      expv[63] = 3'h2;
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
