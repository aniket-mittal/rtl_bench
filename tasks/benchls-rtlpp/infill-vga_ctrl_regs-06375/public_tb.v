// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06375 dut (
    .Clock(clk),
    .Reset_L(in_vec[21:21]),
    .CPU_Enable(in_vec[20:20]),
    .Address(in_vec[19:8]),
    .Data(in_vec[7:0]),
    .ocrx(out_vec[34:27]),
    .ocry(out_vec[26:19]),
    .octl(out_vec[18:11]),
    .WEA(out_vec[10:10]),
    .WEB(out_vec[9:9]),
    .VGABLANKING_L(out_vec[8:8]),
    .dataB(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h20c82e;
    stim[1] = 22'h287aca;
    stim[2] = 22'h05b97d;
    stim[3] = 22'h169795;
    stim[4] = 22'h0e0660;
    stim[5] = 22'h0be1d5;
    stim[6] = 22'h0d8e30;
    stim[7] = 22'h1894b2;
    stim[8] = 22'h1a1b39;
    stim[9] = 22'h127e1f;
    stim[10] = 22'h156bb6;
    stim[11] = 22'h0e565e;
    stim[12] = 22'h04fde7;
    stim[13] = 22'h070bf4;
    stim[14] = 22'h1460b1;
    stim[15] = 22'h0b3237;
    stim[16] = 22'h080d65;
    stim[17] = 22'h12f0dc;
    stim[18] = 22'h05772f;
    stim[19] = 22'h0792b0;
    stim[20] = 22'h1f7d56;
    stim[21] = 22'h19cc7c;
    stim[22] = 22'h1e35df;
    stim[23] = 22'h0c598d;
    stim[24] = 22'h0b2226;
    stim[25] = 22'h0c3cd6;
    stim[26] = 22'h1e69af;
    stim[27] = 22'h19de15;
    stim[28] = 22'h14c0cd;
    stim[29] = 22'h266ea8;
    stim[30] = 22'h198db0;
    stim[31] = 22'h09109a;
    stim[32] = 22'h19c8cc;
    stim[33] = 22'h0cb566;
    stim[34] = 22'h1744f5;
    stim[35] = 22'h0cc415;
    stim[36] = 22'h126149;
    stim[37] = 22'h003aa0;
    stim[38] = 22'h0f7908;
    stim[39] = 22'h0db376;
    stim[40] = 22'h040f5a;
    stim[41] = 22'h0eaa3c;
    stim[42] = 22'h1daf9c;
    stim[43] = 22'h07753b;
    stim[44] = 22'h124653;
    stim[45] = 22'h14c6dc;
    stim[46] = 22'h18ba0e;
    stim[47] = 22'h0c8d90;
    stim[48] = 22'h1f4e1e;
    stim[49] = 22'h1b3d48;
    stim[50] = 22'h040617;
    stim[51] = 22'h0d4b54;
    stim[52] = 22'h111e7a;
    stim[53] = 22'h083309;
    stim[54] = 22'h01ed46;
    stim[55] = 22'h1dafa9;
    stim[56] = 22'h05aebe;
    stim[57] = 22'h011e80;
    stim[58] = 22'h0036ea;
    stim[59] = 22'h11fc58;
    stim[60] = 22'h1ee6e6;
    stim[61] = 22'h004ba1;
    stim[62] = 22'h1712f2;
    stim[63] = 22'h0039cb;
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
      expv[1] = 35'h140a7a900;
      expv[2] = 35'h140a7a900;
      expv[3] = 35'h140a7a900;
      expv[4] = 35'h140a7a900;
      expv[5] = 35'h140a7a900;
      expv[6] = 35'h140a7a900;
      expv[7] = 35'h140a7a900;
      expv[8] = 35'h140a7a900;
      expv[9] = 35'h140a7a900;
      expv[10] = 35'h140a7a900;
      expv[11] = 35'h140a7a900;
      expv[12] = 35'h140a7a900;
      expv[13] = 35'h140a7a900;
      expv[14] = 35'h140a7a900;
      expv[15] = 35'h140a7a900;
      expv[16] = 35'h140a7a900;
      expv[17] = 35'h140a7a900;
      expv[18] = 35'h140a7a900;
      expv[19] = 35'h140a7a900;
      expv[20] = 35'h140a7a900;
      expv[21] = 35'h140a7a900;
      expv[22] = 35'h140a7a900;
      expv[23] = 35'h140a7a900;
      expv[24] = 35'h140a7a900;
      expv[25] = 35'h140a7a900;
      expv[26] = 35'h140a7a900;
      expv[27] = 35'h140a7a900;
      expv[28] = 35'h140a7a900;
      expv[29] = 35'h140a7a900;
      expv[30] = 35'h140a7a900;
      expv[31] = 35'h140a7a900;
      expv[32] = 35'h140a7a900;
      expv[33] = 35'h140a7a900;
      expv[34] = 35'h140a7a900;
      expv[35] = 35'h140a7a900;
      expv[36] = 35'h140a7a900;
      expv[37] = 35'h140a7a900;
      expv[38] = 35'h140a7a900;
      expv[39] = 35'h140a7a900;
      expv[40] = 35'h140a7a900;
      expv[41] = 35'h140a7a900;
      expv[42] = 35'h140a7a900;
      expv[43] = 35'h140a7a900;
      expv[44] = 35'h140a7a900;
      expv[45] = 35'h140a7a900;
      expv[46] = 35'h140a7a900;
      expv[47] = 35'h140a7a900;
      expv[48] = 35'h140a7a900;
      expv[49] = 35'h140a7a900;
      expv[50] = 35'h140a7a900;
      expv[51] = 35'h140a7a900;
      expv[52] = 35'h140a7a900;
      expv[53] = 35'h140a7a900;
      expv[54] = 35'h140a7a900;
      expv[55] = 35'h140a7a900;
      expv[56] = 35'h140a7a900;
      expv[57] = 35'h140a7a900;
      expv[58] = 35'h140a7a900;
      expv[59] = 35'h140a7a900;
      expv[60] = 35'h140a7a900;
      expv[61] = 35'h140a7a900;
      expv[62] = 35'h140a7a900;
      expv[63] = 35'h140a7a900;
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
