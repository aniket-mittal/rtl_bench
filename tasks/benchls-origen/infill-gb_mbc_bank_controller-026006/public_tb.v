// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026006 dut (
    .gb_write_n(clk),
    .gb_data(in_vec[13:6]),
    .rst_n(in_vec[5:5]),
    .cs_n(in_vec[4:4]),
    .addr_15(in_vec[3:3]),
    .addr_14(in_vec[2:2]),
    .addr_13(in_vec[1:1]),
    .addr_12(in_vec[0:0]),
    .rom_addr(out_vec[13:5]),
    .ram_addr(out_vec[4:1]),
    .ram_cs_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3010;
    stim[1] = 14'h3995;
    stim[2] = 14'h2c21;
    stim[3] = 14'h0de6;
    stim[4] = 14'h103f;
    stim[5] = 14'h10b5;
    stim[6] = 14'h372b;
    stim[7] = 14'h1f22;
    stim[8] = 14'h2279;
    stim[9] = 14'h0daf;
    stim[10] = 14'h347a;
    stim[11] = 14'h2af5;
    stim[12] = 14'h2d7f;
    stim[13] = 14'h1367;
    stim[14] = 14'h102b;
    stim[15] = 14'h1d7e;
    stim[16] = 14'h2026;
    stim[17] = 14'h22b3;
    stim[18] = 14'h1ea9;
    stim[19] = 14'h36ae;
    stim[20] = 14'h15f9;
    stim[21] = 14'h2d78;
    stim[22] = 14'h1ea6;
    stim[23] = 14'h30b6;
    stim[24] = 14'h0037;
    stim[25] = 14'h1a2a;
    stim[26] = 14'h0b26;
    stim[27] = 14'h22e9;
    stim[28] = 14'h3121;
    stim[29] = 14'h3a37;
    stim[30] = 14'h0577;
    stim[31] = 14'h3431;
    stim[32] = 14'h34f3;
    stim[33] = 14'h26eb;
    stim[34] = 14'h383c;
    stim[35] = 14'h1bfd;
    stim[36] = 14'h01fe;
    stim[37] = 14'h3c22;
    stim[38] = 14'h0ef3;
    stim[39] = 14'h24b1;
    stim[40] = 14'h2a32;
    stim[41] = 14'h2fe5;
    stim[42] = 14'h1ea0;
    stim[43] = 14'h243e;
    stim[44] = 14'h067f;
    stim[45] = 14'h35be;
    stim[46] = 14'h2ce0;
    stim[47] = 14'h132f;
    stim[48] = 14'h35a3;
    stim[49] = 14'h07f2;
    stim[50] = 14'h1eab;
    stim[51] = 14'h00f7;
    stim[52] = 14'h2a38;
    stim[53] = 14'h106d;
    stim[54] = 14'h242f;
    stim[55] = 14'h3c21;
    stim[56] = 14'h1e6c;
    stim[57] = 14'h0965;
    stim[58] = 14'h21c8;
    stim[59] = 14'h24a9;
    stim[60] = 14'h2dd6;
    stim[61] = 14'h2fe9;
    stim[62] = 14'h27b6;
    stim[63] = 14'h1336;
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
      expv[0] = 14'h0001;
      expv[1] = 14'h0001;
      expv[2] = 14'h0001;
      expv[3] = 14'h0001;
      expv[4] = 14'h0001;
      expv[5] = 14'h0001;
      expv[6] = 14'h0001;
      expv[7] = 14'h0001;
      expv[8] = 14'h0001;
      expv[9] = 14'h0f81;
      expv[10] = 14'h0001;
      expv[11] = 14'h0f81;
      expv[12] = 14'h0f81;
      expv[13] = 14'h0f81;
      expv[14] = 14'h0001;
      expv[15] = 14'h0f81;
      expv[16] = 14'h0f81;
      expv[17] = 14'h0001;
      expv[18] = 14'h0001;
      expv[19] = 14'h0f81;
      expv[20] = 14'h0001;
      expv[21] = 14'h0001;
      expv[22] = 14'h0f81;
      expv[23] = 14'h0f81;
      expv[24] = 14'h0f81;
      expv[25] = 14'h0001;
      expv[26] = 14'h0f81;
      expv[27] = 14'h0001;
      expv[28] = 14'h0001;
      expv[29] = 14'h0f81;
      expv[30] = 14'h0f81;
      expv[31] = 14'h0001;
      expv[32] = 14'h0001;
      expv[33] = 14'h0001;
      expv[34] = 14'h2f81;
      expv[35] = 14'h2f81;
      expv[36] = 14'h2f81;
      expv[37] = 14'h0001;
      expv[38] = 14'h0001;
      expv[39] = 14'h0001;
      expv[40] = 14'h0001;
      expv[41] = 14'h3501;
      expv[42] = 14'h0001;
      expv[43] = 14'h3500;
      expv[44] = 14'h3500;
      expv[45] = 14'h3500;
      expv[46] = 14'h0000;
      expv[47] = 14'h3501;
      expv[48] = 14'h0001;
      expv[49] = 14'h0001;
      expv[50] = 14'h0001;
      expv[51] = 14'h03e1;
      expv[52] = 14'h0001;
      expv[53] = 14'h03e1;
      expv[54] = 14'h03e1;
      expv[55] = 14'h0001;
      expv[56] = 14'h03e1;
      expv[57] = 14'h03e1;
      expv[58] = 14'h0001;
      expv[59] = 14'h0001;
      expv[60] = 14'h0001;
      expv[61] = 14'h0001;
      expv[62] = 14'h0001;
      expv[63] = 14'h0001;
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
