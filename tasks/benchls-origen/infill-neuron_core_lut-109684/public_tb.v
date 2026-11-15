// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109684 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .core_w_en(in_vec[7:7]),
    .core_r_en(in_vec[6:6]),
    .core_w_addr(in_vec[5:4]),
    .core_r_addr(in_vec[3:2]),
    .core_d_in(in_vec[1:0]),
    .core_grp_offset(out_vec[2:1]),
    .grp_r_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1c3;
    stim[1] = 9'h156;
    stim[2] = 9'h067;
    stim[3] = 9'h0bd;
    stim[4] = 9'h0e1;
    stim[5] = 9'h04f;
    stim[6] = 9'h024;
    stim[7] = 9'h0c7;
    stim[8] = 9'h0fd;
    stim[9] = 9'h0e0;
    stim[10] = 9'h015;
    stim[11] = 9'h08a;
    stim[12] = 9'h08d;
    stim[13] = 9'h0fe;
    stim[14] = 9'h06a;
    stim[15] = 9'h02c;
    stim[16] = 9'h048;
    stim[17] = 9'h0f9;
    stim[18] = 9'h0af;
    stim[19] = 9'h0ce;
    stim[20] = 9'h0e5;
    stim[21] = 9'h0bf;
    stim[22] = 9'h0e5;
    stim[23] = 9'h099;
    stim[24] = 9'h006;
    stim[25] = 9'h0e2;
    stim[26] = 9'h049;
    stim[27] = 9'h193;
    stim[28] = 9'h03e;
    stim[29] = 9'h0f9;
    stim[30] = 9'h028;
    stim[31] = 9'h051;
    stim[32] = 9'h038;
    stim[33] = 9'h08b;
    stim[34] = 9'h0c6;
    stim[35] = 9'h009;
    stim[36] = 9'h01d;
    stim[37] = 9'h096;
    stim[38] = 9'h076;
    stim[39] = 9'h04e;
    stim[40] = 9'h032;
    stim[41] = 9'h020;
    stim[42] = 9'h037;
    stim[43] = 9'h0c2;
    stim[44] = 9'h094;
    stim[45] = 9'h0e8;
    stim[46] = 9'h0a4;
    stim[47] = 9'h053;
    stim[48] = 9'h0d5;
    stim[49] = 9'h088;
    stim[50] = 9'h0ad;
    stim[51] = 9'h0c1;
    stim[52] = 9'h069;
    stim[53] = 9'h0c5;
    stim[54] = 9'h09c;
    stim[55] = 9'h0d0;
    stim[56] = 9'h010;
    stim[57] = 9'h034;
    stim[58] = 9'h001;
    stim[59] = 9'h0c0;
    stim[60] = 9'h052;
    stim[61] = 9'h049;
    stim[62] = 9'h07b;
    stim[63] = 9'h08f;
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
      expv[3] = 3'h1;
      expv[4] = 3'h0;
      expv[5] = 3'h3;
      expv[6] = 3'h3;
      expv[7] = 3'h2;
      expv[8] = 3'h1;
      expv[9] = 3'h3;
      expv[10] = 3'h7;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h6;
      expv[14] = 3'h3;
      expv[15] = 3'h1;
      expv[16] = 3'h0;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h0;
      expv[20] = 3'h3;
      expv[21] = 3'h1;
      expv[22] = 3'h0;
      expv[23] = 3'h1;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h5;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h5;
      expv[31] = 3'h4;
      expv[32] = 3'h5;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h3;
      expv[36] = 3'h2;
      expv[37] = 3'h2;
      expv[38] = 3'h2;
      expv[39] = 3'h5;
      expv[40] = 3'h3;
      expv[41] = 3'h2;
      expv[42] = 3'h2;
      expv[43] = 3'h2;
      expv[44] = 3'h5;
      expv[45] = 3'h4;
      expv[46] = 3'h5;
      expv[47] = 3'h4;
      expv[48] = 3'h5;
      expv[49] = 3'h1;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h1;
      expv[53] = 3'h3;
      expv[54] = 3'h3;
      expv[55] = 3'h2;
      expv[56] = 3'h3;
      expv[57] = 3'h2;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h3;
      expv[61] = 3'h1;
      expv[62] = 3'h3;
      expv[63] = 3'h3;
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
