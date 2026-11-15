// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161603 dut (
    .clk(clk),
    .rstn(in_vec[10:10]),
    .io_in_data(in_vec[9:2]),
    .io_in_vld(in_vec[1:1]),
    .io_out_rdy(in_vec[0:0]),
    .io_in_rdy(out_vec[14:14]),
    .io_out_data(out_vec[13:6]),
    .io_out_vld(out_vec[5:5]),
    .io_err(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2f5;
    stim[1] = 11'h09a;
    stim[2] = 11'h0ee;
    stim[3] = 11'h6e7;
    stim[4] = 11'h6b8;
    stim[5] = 11'h738;
    stim[6] = 11'h623;
    stim[7] = 11'h733;
    stim[8] = 11'h405;
    stim[9] = 11'h679;
    stim[10] = 11'h6a3;
    stim[11] = 11'h7a1;
    stim[12] = 11'h4d6;
    stim[13] = 11'h548;
    stim[14] = 11'h2ce;
    stim[15] = 11'h768;
    stim[16] = 11'h528;
    stim[17] = 11'h7c6;
    stim[18] = 11'h76e;
    stim[19] = 11'h6e0;
    stim[20] = 11'h4ac;
    stim[21] = 11'h7a1;
    stim[22] = 11'h440;
    stim[23] = 11'h596;
    stim[24] = 11'h4a5;
    stim[25] = 11'h640;
    stim[26] = 11'h7df;
    stim[27] = 11'h698;
    stim[28] = 11'h7a3;
    stim[29] = 11'h5c4;
    stim[30] = 11'h6fa;
    stim[31] = 11'h767;
    stim[32] = 11'h789;
    stim[33] = 11'h630;
    stim[34] = 11'h58d;
    stim[35] = 11'h571;
    stim[36] = 11'h718;
    stim[37] = 11'h7c6;
    stim[38] = 11'h016;
    stim[39] = 11'h5bb;
    stim[40] = 11'h6fe;
    stim[41] = 11'h55b;
    stim[42] = 11'h70e;
    stim[43] = 11'h69f;
    stim[44] = 11'h7f2;
    stim[45] = 11'h770;
    stim[46] = 11'h7f0;
    stim[47] = 11'h75b;
    stim[48] = 11'h51e;
    stim[49] = 11'h73c;
    stim[50] = 11'h6f0;
    stim[51] = 11'h5a1;
    stim[52] = 11'h4cc;
    stim[53] = 11'h487;
    stim[54] = 11'h790;
    stim[55] = 11'h428;
    stim[56] = 11'h749;
    stim[57] = 11'h531;
    stim[58] = 11'h58c;
    stim[59] = 11'h5fd;
    stim[60] = 11'h57f;
    stim[61] = 11'h350;
    stim[62] = 11'h530;
    stim[63] = 11'h544;
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
      expv[0] = 15'hxxx0;
      expv[1] = 15'hxxx0;
      expv[2] = 15'hxxx0;
      expv[3] = 15'hxxx0;
      expv[4] = 15'hxxx0;
      expv[5] = 15'hxxx0;
      expv[6] = 15'hxxx0;
      expv[7] = 15'h6220;
      expv[8] = 15'h6200;
      expv[9] = 15'h6200;
      expv[10] = 15'h6200;
      expv[11] = 15'h6a20;
      expv[12] = 15'h6a00;
      expv[13] = 15'h4d60;
      expv[14] = 15'h0d40;
      expv[15] = 15'h0d40;
      expv[16] = 15'h4d40;
      expv[17] = 15'h4d40;
      expv[18] = 15'h7c60;
      expv[19] = 15'h7c60;
      expv[20] = 15'h7c60;
      expv[21] = 15'h7c60;
      expv[22] = 15'h7c40;
      expv[23] = 15'h7c40;
      expv[24] = 15'h5960;
      expv[25] = 15'h5940;
      expv[26] = 15'h5940;
      expv[27] = 15'h7de0;
      expv[28] = 15'h7de0;
      expv[29] = 15'h7dc0;
      expv[30] = 15'h7dc0;
      expv[31] = 15'h6fa0;
      expv[32] = 15'h6f80;
      expv[33] = 15'h6f80;
      expv[34] = 15'h6f80;
      expv[35] = 15'h6f80;
      expv[36] = 15'h6f80;
      expv[37] = 15'h6f80;
      expv[38] = 15'h3c40;
      expv[39] = 15'h3c40;
      expv[40] = 15'h7c40;
      expv[41] = 15'h6fe0;
      expv[42] = 15'h6fc0;
      expv[43] = 15'h70e0;
      expv[44] = 15'h70c0;
      expv[45] = 15'h7f20;
      expv[46] = 15'h7f20;
      expv[47] = 15'h7f20;
      expv[48] = 15'h7f00;
      expv[49] = 15'h51e0;
      expv[50] = 15'h51e0;
      expv[51] = 15'h51e0;
      expv[52] = 15'h51c0;
      expv[53] = 15'h51c0;
      expv[54] = 15'h4860;
      expv[55] = 15'h4860;
      expv[56] = 15'h4860;
      expv[57] = 15'h4840;
      expv[58] = 15'h4840;
      expv[59] = 15'h4840;
      expv[60] = 15'h4840;
      expv[61] = 15'h17c0;
      expv[62] = 15'h17c0;
      expv[63] = 15'h57c0;
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
