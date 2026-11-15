// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_096668 dut (
    .CLOCK_50(clk),
    .reset(in_vec[24:24]),
    .period(in_vec[23:0]),
    .newClock(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h170e252;
    stim[1] = 25'h1c77da2;
    stim[2] = 25'h0739e24;
    stim[3] = 25'h0bf4f19;
    stim[4] = 25'h04686d5;
    stim[5] = 25'h0a043b6;
    stim[6] = 25'h0c12c81;
    stim[7] = 25'h084ad3c;
    stim[8] = 25'h0172160;
    stim[9] = 25'h0b96b0d;
    stim[10] = 25'h188fdf5;
    stim[11] = 25'h03eb635;
    stim[12] = 25'h0144e97;
    stim[13] = 25'h05375ff;
    stim[14] = 25'h05ac901;
    stim[15] = 25'h0928359;
    stim[16] = 25'h09f8343;
    stim[17] = 25'h089d4d0;
    stim[18] = 25'h007aa9b;
    stim[19] = 25'h0425a67;
    stim[20] = 25'h097d026;
    stim[21] = 25'h0cc341f;
    stim[22] = 25'h0b1105c;
    stim[23] = 25'h016a3a4;
    stim[24] = 25'h0131097;
    stim[25] = 25'h03864fa;
    stim[26] = 25'h0fc4fb4;
    stim[27] = 25'h0a26045;
    stim[28] = 25'h02046d5;
    stim[29] = 25'h00e18ae;
    stim[30] = 25'h0d59af4;
    stim[31] = 25'h0a1e45c;
    stim[32] = 25'h0b42715;
    stim[33] = 25'h057932b;
    stim[34] = 25'h01b3361;
    stim[35] = 25'h07239d1;
    stim[36] = 25'h056b7bf;
    stim[37] = 25'h01d83e4;
    stim[38] = 25'h0f3826e;
    stim[39] = 25'h08a9b7d;
    stim[40] = 25'h04ddfe0;
    stim[41] = 25'h0f40691;
    stim[42] = 25'h09b1767;
    stim[43] = 25'h0be91cd;
    stim[44] = 25'h0ae03b6;
    stim[45] = 25'h052ae88;
    stim[46] = 25'h00d9c50;
    stim[47] = 25'h03f685c;
    stim[48] = 25'h05f676a;
    stim[49] = 25'h04b87b8;
    stim[50] = 25'h00f0248;
    stim[51] = 25'h098a1fc;
    stim[52] = 25'h0f68ad6;
    stim[53] = 25'h0f6aa88;
    stim[54] = 25'h0062b34;
    stim[55] = 25'h0c3538f;
    stim[56] = 25'h0d5bb9d;
    stim[57] = 25'h0d01722;
    stim[58] = 25'h034cb06;
    stim[59] = 25'h017f562;
    stim[60] = 25'h03f3125;
    stim[61] = 25'h0d44f16;
    stim[62] = 25'h01ac360;
    stim[63] = 25'h0e14c02;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
