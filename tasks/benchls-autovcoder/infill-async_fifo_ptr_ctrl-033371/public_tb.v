// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_033371 dut (
    .wclk(clk),
    .wrst_n(in_vec[4:4]),
    .wen(in_vec[3:3]),
    .rclk(in_vec[2:2]),
    .rrst_n(in_vec[1:1]),
    .ren(in_vec[0:0]),
    .wfull(out_vec[13:13]),
    .walmost_full(out_vec[12:12]),
    .mem_wen(out_vec[11:11]),
    .mem_waddr(out_vec[10:7]),
    .rempty(out_vec[6:6]),
    .ralmost_empty(out_vec[5:5]),
    .mem_ren(out_vec[4:4]),
    .mem_raddr(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h04;
    stim[1] = 5'h0b;
    stim[2] = 5'h1f;
    stim[3] = 5'h18;
    stim[4] = 5'h1c;
    stim[5] = 5'h1d;
    stim[6] = 5'h14;
    stim[7] = 5'h14;
    stim[8] = 5'h1d;
    stim[9] = 5'h13;
    stim[10] = 5'h1f;
    stim[11] = 5'h1f;
    stim[12] = 5'h17;
    stim[13] = 5'h12;
    stim[14] = 5'h1a;
    stim[15] = 5'h16;
    stim[16] = 5'h17;
    stim[17] = 5'h11;
    stim[18] = 5'h11;
    stim[19] = 5'h1b;
    stim[20] = 5'h1e;
    stim[21] = 5'h18;
    stim[22] = 5'h15;
    stim[23] = 5'h1b;
    stim[24] = 5'h1e;
    stim[25] = 5'h1d;
    stim[26] = 5'h16;
    stim[27] = 5'h0a;
    stim[28] = 5'h1c;
    stim[29] = 5'h1d;
    stim[30] = 5'h11;
    stim[31] = 5'h10;
    stim[32] = 5'h1c;
    stim[33] = 5'h14;
    stim[34] = 5'h1c;
    stim[35] = 5'h19;
    stim[36] = 5'h16;
    stim[37] = 5'h00;
    stim[38] = 5'h19;
    stim[39] = 5'h1d;
    stim[40] = 5'h11;
    stim[41] = 5'h1b;
    stim[42] = 5'h17;
    stim[43] = 5'h1d;
    stim[44] = 5'h1e;
    stim[45] = 5'h19;
    stim[46] = 5'h13;
    stim[47] = 5'h12;
    stim[48] = 5'h11;
    stim[49] = 5'h12;
    stim[50] = 5'h15;
    stim[51] = 5'h14;
    stim[52] = 5'h17;
    stim[53] = 5'h11;
    stim[54] = 5'h10;
    stim[55] = 5'h10;
    stim[56] = 5'h1d;
    stim[57] = 5'h12;
    stim[58] = 5'h1b;
    stim[59] = 5'h11;
    stim[60] = 5'h15;
    stim[61] = 5'h13;
    stim[62] = 5'h13;
    stim[63] = 5'h12;
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
      expv[0] = 14'h0060;
      expv[1] = 14'h0870;
      expv[2] = 14'h0870;
      expv[3] = 14'h08e0;
      expv[4] = 14'h1960;
      expv[5] = 14'h19f0;
      expv[6] = 14'h1260;
      expv[7] = 14'h1260;
      expv[8] = 14'h1a70;
      expv[9] = 14'h12f0;
      expv[10] = 14'h1af0;
      expv[11] = 14'h1b70;
      expv[12] = 14'h13f0;
      expv[13] = 14'h13e0;
      expv[14] = 14'h1be0;
      expv[15] = 14'h3400;
      expv[16] = 14'h3410;
      expv[17] = 14'h3470;
      expv[18] = 14'h3470;
      expv[19] = 14'h3470;
      expv[20] = 14'h3460;
      expv[21] = 14'h3460;
      expv[22] = 14'h3470;
      expv[23] = 14'h3470;
      expv[24] = 14'h3460;
      expv[25] = 14'h3470;
      expv[26] = 14'h3460;
      expv[27] = 14'h0860;
      expv[28] = 14'h0860;
      expv[29] = 14'h08f0;
      expv[30] = 14'h1170;
      expv[31] = 14'h1160;
      expv[32] = 14'h1960;
      expv[33] = 14'h11e0;
      expv[34] = 14'h19e0;
      expv[35] = 14'h1a70;
      expv[36] = 14'h12e0;
      expv[37] = 14'h0060;
      expv[38] = 14'h0870;
      expv[39] = 14'h08f0;
      expv[40] = 14'h1170;
      expv[41] = 14'h1970;
      expv[42] = 14'h11f0;
      expv[43] = 14'h19f0;
      expv[44] = 14'h1a60;
      expv[45] = 14'h1af0;
      expv[46] = 14'h1370;
      expv[47] = 14'h1360;
      expv[48] = 14'h1370;
      expv[49] = 14'h1360;
      expv[50] = 14'h1370;
      expv[51] = 14'h1360;
      expv[52] = 14'h1370;
      expv[53] = 14'h1370;
      expv[54] = 14'h1360;
      expv[55] = 14'h1360;
      expv[56] = 14'h1b70;
      expv[57] = 14'h13e0;
      expv[58] = 14'h1bf0;
      expv[59] = 14'h3470;
      expv[60] = 14'h3470;
      expv[61] = 14'h3470;
      expv[62] = 14'h3470;
      expv[63] = 14'h3460;
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
