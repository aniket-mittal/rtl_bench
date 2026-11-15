// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134822 dut (
    .VPWR(out_vec[3:3]),
    .VGND(out_vec[2:2]),
    .VPB(out_vec[1:1]),
    .VNB(out_vec[0:0])
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
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 4'hb;
      expv[1] = 4'hb;
      expv[2] = 4'hb;
      expv[3] = 4'hb;
      expv[4] = 4'hb;
      expv[5] = 4'hb;
      expv[6] = 4'hb;
      expv[7] = 4'hb;
      expv[8] = 4'hb;
      expv[9] = 4'hb;
      expv[10] = 4'hb;
      expv[11] = 4'hb;
      expv[12] = 4'hb;
      expv[13] = 4'hb;
      expv[14] = 4'hb;
      expv[15] = 4'hb;
      expv[16] = 4'hb;
      expv[17] = 4'hb;
      expv[18] = 4'hb;
      expv[19] = 4'hb;
      expv[20] = 4'hb;
      expv[21] = 4'hb;
      expv[22] = 4'hb;
      expv[23] = 4'hb;
      expv[24] = 4'hb;
      expv[25] = 4'hb;
      expv[26] = 4'hb;
      expv[27] = 4'hb;
      expv[28] = 4'hb;
      expv[29] = 4'hb;
      expv[30] = 4'hb;
      expv[31] = 4'hb;
      expv[32] = 4'hb;
      expv[33] = 4'hb;
      expv[34] = 4'hb;
      expv[35] = 4'hb;
      expv[36] = 4'hb;
      expv[37] = 4'hb;
      expv[38] = 4'hb;
      expv[39] = 4'hb;
      expv[40] = 4'hb;
      expv[41] = 4'hb;
      expv[42] = 4'hb;
      expv[43] = 4'hb;
      expv[44] = 4'hb;
      expv[45] = 4'hb;
      expv[46] = 4'hb;
      expv[47] = 4'hb;
      expv[48] = 4'hb;
      expv[49] = 4'hb;
      expv[50] = 4'hb;
      expv[51] = 4'hb;
      expv[52] = 4'hb;
      expv[53] = 4'hb;
      expv[54] = 4'hb;
      expv[55] = 4'hb;
      expv[56] = 4'hb;
      expv[57] = 4'hb;
      expv[58] = 4'hb;
      expv[59] = 4'hb;
      expv[60] = 4'hb;
      expv[61] = 4'hb;
      expv[62] = 4'hb;
      expv[63] = 4'hb;
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
