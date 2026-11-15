// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024334 dut (
    .forever_coreclk(clk),
    .pad_core_rst_b(in_vec[4:4]),
    .pad_cpu_rst_b(in_vec[3:3]),
    .pad_yy_mbist_mode(in_vec[2:2]),
    .pad_yy_scan_mode(in_vec[1:1]),
    .pad_yy_scan_rst_b(in_vec[0:0]),
    .fpu_rst_b(out_vec[5:5]),
    .had_rst_b(out_vec[4:4]),
    .idu_rst_b(out_vec[3:3]),
    .ifu_rst_b(out_vec[2:2]),
    .lsu_rst_b(out_vec[1:1]),
    .mmu_rst_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h01;
    stim[1] = 5'h16;
    stim[2] = 5'h1b;
    stim[3] = 5'h09;
    stim[4] = 5'h1f;
    stim[5] = 5'h08;
    stim[6] = 5'h1a;
    stim[7] = 5'h19;
    stim[8] = 5'h0c;
    stim[9] = 5'h1f;
    stim[10] = 5'h1b;
    stim[11] = 5'h18;
    stim[12] = 5'h18;
    stim[13] = 5'h1b;
    stim[14] = 5'h19;
    stim[15] = 5'h09;
    stim[16] = 5'h1b;
    stim[17] = 5'h19;
    stim[18] = 5'h18;
    stim[19] = 5'h1d;
    stim[20] = 5'h09;
    stim[21] = 5'h0b;
    stim[22] = 5'h1c;
    stim[23] = 5'h08;
    stim[24] = 5'h0f;
    stim[25] = 5'h0c;
    stim[26] = 5'h1b;
    stim[27] = 5'h1b;
    stim[28] = 5'h1b;
    stim[29] = 5'h19;
    stim[30] = 5'h18;
    stim[31] = 5'h0d;
    stim[32] = 5'h08;
    stim[33] = 5'h18;
    stim[34] = 5'h0f;
    stim[35] = 5'h1e;
    stim[36] = 5'h1a;
    stim[37] = 5'h1c;
    stim[38] = 5'h1f;
    stim[39] = 5'h0c;
    stim[40] = 5'h1b;
    stim[41] = 5'h1f;
    stim[42] = 5'h0d;
    stim[43] = 5'h19;
    stim[44] = 5'h1d;
    stim[45] = 5'h0a;
    stim[46] = 5'h18;
    stim[47] = 5'h19;
    stim[48] = 5'h1f;
    stim[49] = 5'h0f;
    stim[50] = 5'h0d;
    stim[51] = 5'h1c;
    stim[52] = 5'h1f;
    stim[53] = 5'h0c;
    stim[54] = 5'h1b;
    stim[55] = 5'h1b;
    stim[56] = 5'h09;
    stim[57] = 5'h0b;
    stim[58] = 5'h1e;
    stim[59] = 5'h0f;
    stim[60] = 5'h18;
    stim[61] = 5'h1f;
    stim[62] = 5'h0f;
    stim[63] = 5'h1a;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h3f;
      expv[3] = 6'h00;
      expv[4] = 6'h3f;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h3f;
      expv[10] = 6'h3f;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h3f;
      expv[14] = 6'h3f;
      expv[15] = 6'h00;
      expv[16] = 6'h3f;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h3f;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h3f;
      expv[25] = 6'h00;
      expv[26] = 6'h3f;
      expv[27] = 6'h3f;
      expv[28] = 6'h3f;
      expv[29] = 6'h3f;
      expv[30] = 6'h3f;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h3f;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h3f;
      expv[39] = 6'h00;
      expv[40] = 6'h3f;
      expv[41] = 6'h3f;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h3f;
      expv[49] = 6'h3f;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h3f;
      expv[53] = 6'h00;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h00;
      expv[57] = 6'h3f;
      expv[58] = 6'h00;
      expv[59] = 6'h3f;
      expv[60] = 6'h00;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h00;
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
