// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021971 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .zxuno_addr(in_vec[18:11]),
    .zxuno_regrd(in_vec[10:10]),
    .zxuno_regwr(in_vec[9:9]),
    .din(in_vec[8:1]),
    .raster_int_in_progress(in_vec[0:0]),
    .dout(out_vec[19:12]),
    .oe_n(out_vec[11:11]),
    .rasterint_enable(out_vec[10:10]),
    .vretraceint_disable(out_vec[9:9]),
    .raster_line(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h51563;
    stim[1] = 20'h43f8b;
    stim[2] = 20'hb8611;
    stim[3] = 20'hfa6ae;
    stim[4] = 20'hd1db9;
    stim[5] = 20'hf7d97;
    stim[6] = 20'h8b948;
    stim[7] = 20'he4a6b;
    stim[8] = 20'hdfeb5;
    stim[9] = 20'h895f2;
    stim[10] = 20'hd92d4;
    stim[11] = 20'hd50a3;
    stim[12] = 20'hc6dda;
    stim[13] = 20'he71e6;
    stim[14] = 20'hb5328;
    stim[15] = 20'hc5e31;
    stim[16] = 20'hc9720;
    stim[17] = 20'hed966;
    stim[18] = 20'he1da0;
    stim[19] = 20'hdfaac;
    stim[20] = 20'hbf8db;
    stim[21] = 20'hddd56;
    stim[22] = 20'he2ac5;
    stim[23] = 20'h966ba;
    stim[24] = 20'hf0909;
    stim[25] = 20'h91f88;
    stim[26] = 20'hf7bb0;
    stim[27] = 20'hf0a45;
    stim[28] = 20'h8a19a;
    stim[29] = 20'h86995;
    stim[30] = 20'ha4edd;
    stim[31] = 20'he188f;
    stim[32] = 20'hacdb0;
    stim[33] = 20'h808a4;
    stim[34] = 20'h902a7;
    stim[35] = 20'hb1fe5;
    stim[36] = 20'he8c0f;
    stim[37] = 20'h8e203;
    stim[38] = 20'h9c7a9;
    stim[39] = 20'h9c5a9;
    stim[40] = 20'h9deb8;
    stim[41] = 20'h01822;
    stim[42] = 20'haf935;
    stim[43] = 20'he7476;
    stim[44] = 20'h8c0f3;
    stim[45] = 20'hd9b72;
    stim[46] = 20'hf216c;
    stim[47] = 20'h9c74e;
    stim[48] = 20'hc73d5;
    stim[49] = 20'h9f19f;
    stim[50] = 20'h85777;
    stim[51] = 20'hf37ea;
    stim[52] = 20'heb356;
    stim[53] = 20'h8769b;
    stim[54] = 20'h85c28;
    stim[55] = 20'hae956;
    stim[56] = 20'h87eb6;
    stim[57] = 20'hf516d;
    stim[58] = 20'h91e31;
    stim[59] = 20'hdc9a3;
    stim[60] = 20'hec737;
    stim[61] = 20'hc3417;
    stim[62] = 20'ha77e6;
    stim[63] = 20'hdf848;
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
      expv[0] = 20'hff9ff;
      expv[1] = 20'hff9ff;
      expv[2] = 20'hff9ff;
      expv[3] = 20'hff9ff;
      expv[4] = 20'hff9ff;
      expv[5] = 20'hff9ff;
      expv[6] = 20'hff9ff;
      expv[7] = 20'hff9ff;
      expv[8] = 20'hff9ff;
      expv[9] = 20'hff9ff;
      expv[10] = 20'hff9ff;
      expv[11] = 20'hff9ff;
      expv[12] = 20'hff9ff;
      expv[13] = 20'hff9ff;
      expv[14] = 20'hff9ff;
      expv[15] = 20'hff9ff;
      expv[16] = 20'hff9ff;
      expv[17] = 20'hff9ff;
      expv[18] = 20'hff9ff;
      expv[19] = 20'hff9ff;
      expv[20] = 20'hff9ff;
      expv[21] = 20'hff9ff;
      expv[22] = 20'hff9ff;
      expv[23] = 20'hff9ff;
      expv[24] = 20'hff9ff;
      expv[25] = 20'hff9ff;
      expv[26] = 20'hff9ff;
      expv[27] = 20'hff9ff;
      expv[28] = 20'hff9ff;
      expv[29] = 20'hff9ff;
      expv[30] = 20'hff9ff;
      expv[31] = 20'hff9ff;
      expv[32] = 20'hff9ff;
      expv[33] = 20'hff9ff;
      expv[34] = 20'hff9ff;
      expv[35] = 20'hff9ff;
      expv[36] = 20'hff9ff;
      expv[37] = 20'hff9ff;
      expv[38] = 20'hff9ff;
      expv[39] = 20'hff9ff;
      expv[40] = 20'hff9ff;
      expv[41] = 20'hff9ff;
      expv[42] = 20'hff9ff;
      expv[43] = 20'hff9ff;
      expv[44] = 20'hff9ff;
      expv[45] = 20'hff9ff;
      expv[46] = 20'hff9ff;
      expv[47] = 20'hff9ff;
      expv[48] = 20'hff9ff;
      expv[49] = 20'hff9ff;
      expv[50] = 20'hff9ff;
      expv[51] = 20'hff9ff;
      expv[52] = 20'hff9ff;
      expv[53] = 20'hff9ff;
      expv[54] = 20'hff9ff;
      expv[55] = 20'hff9ff;
      expv[56] = 20'hff9ff;
      expv[57] = 20'hff9ff;
      expv[58] = 20'hff9ff;
      expv[59] = 20'hff9ff;
      expv[60] = 20'hff9ff;
      expv[61] = 20'hff9ff;
      expv[62] = 20'hff9ff;
      expv[63] = 20'hff9ff;
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
