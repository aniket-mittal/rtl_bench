// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086067 dut (
    .clk_20Hz(clk),
    .btnU(in_vec[4:4]),
    .btnD(in_vec[3:3]),
    .btnC(in_vec[2:2]),
    .btnL(in_vec[1:1]),
    .btnR(in_vec[0:0]),
    .my_grid_r(out_vec[35:32]),
    .my_grid_g(out_vec[31:28]),
    .my_grid_b(out_vec[27:24]),
    .my_bg_r(out_vec[23:20]),
    .my_bg_g(out_vec[19:16]),
    .my_bg_b(out_vec[15:12]),
    .my_wave_r(out_vec[11:8]),
    .my_wave_g(out_vec[7:4]),
    .my_wave_b(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h10;
    stim[1] = 5'h1b;
    stim[2] = 5'h18;
    stim[3] = 5'h07;
    stim[4] = 5'h0f;
    stim[5] = 5'h15;
    stim[6] = 5'h0e;
    stim[7] = 5'h03;
    stim[8] = 5'h16;
    stim[9] = 5'h1a;
    stim[10] = 5'h0a;
    stim[11] = 5'h02;
    stim[12] = 5'h0a;
    stim[13] = 5'h1b;
    stim[14] = 5'h1a;
    stim[15] = 5'h12;
    stim[16] = 5'h0f;
    stim[17] = 5'h14;
    stim[18] = 5'h13;
    stim[19] = 5'h04;
    stim[20] = 5'h13;
    stim[21] = 5'h0c;
    stim[22] = 5'h18;
    stim[23] = 5'h00;
    stim[24] = 5'h05;
    stim[25] = 5'h1b;
    stim[26] = 5'h1e;
    stim[27] = 5'h0b;
    stim[28] = 5'h15;
    stim[29] = 5'h10;
    stim[30] = 5'h0f;
    stim[31] = 5'h06;
    stim[32] = 5'h01;
    stim[33] = 5'h0b;
    stim[34] = 5'h10;
    stim[35] = 5'h1b;
    stim[36] = 5'h07;
    stim[37] = 5'h02;
    stim[38] = 5'h1f;
    stim[39] = 5'h14;
    stim[40] = 5'h00;
    stim[41] = 5'h04;
    stim[42] = 5'h09;
    stim[43] = 5'h1b;
    stim[44] = 5'h12;
    stim[45] = 5'h15;
    stim[46] = 5'h0e;
    stim[47] = 5'h0f;
    stim[48] = 5'h0a;
    stim[49] = 5'h15;
    stim[50] = 5'h17;
    stim[51] = 5'h05;
    stim[52] = 5'h1a;
    stim[53] = 5'h01;
    stim[54] = 5'h18;
    stim[55] = 5'h01;
    stim[56] = 5'h0e;
    stim[57] = 5'h13;
    stim[58] = 5'h11;
    stim[59] = 5'h01;
    stim[60] = 5'h09;
    stim[61] = 5'h0b;
    stim[62] = 5'h02;
    stim[63] = 5'h07;
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
      expv[0] = 36'h88800000f;
      expv[1] = 36'h9ab00000f;
      expv[2] = 36'h88800000f;
      expv[3] = 36'h88800000f;
      expv[4] = 36'h888edc233;
      expv[5] = 36'h765edc233;
      expv[6] = 36'h888edc233;
      expv[7] = 36'h765edc233;
      expv[8] = 36'h765edc233;
      expv[9] = 36'h888000467;
      expv[10] = 36'h88800000f;
      expv[11] = 36'h76500000f;
      expv[12] = 36'h76500000f;
      expv[13] = 36'h64200000f;
      expv[14] = 36'h888edc00f;
      expv[15] = 36'h88800000f;
      expv[16] = 36'h9ab00000f;
      expv[17] = 36'h88800000f;
      expv[18] = 36'h9ab00000f;
      expv[19] = 36'haceedc00f;
      expv[20] = 36'haceedc00f;
      expv[21] = 36'hbe1edc00f;
      expv[22] = 36'haceedc00f;
      expv[23] = 36'h88800000f;
      expv[24] = 36'h88800000f;
      expv[25] = 36'h88800000f;
      expv[26] = 36'h88800000f;
      expv[27] = 36'h88800000f;
      expv[28] = 36'h76500000f;
      expv[29] = 36'h888edc233;
      expv[30] = 36'h9abedc233;
      expv[31] = 36'h888edc233;
      expv[32] = 36'h888edc233;
      expv[33] = 36'h888edc233;
      expv[34] = 36'h765ca8233;
      expv[35] = 36'h888ca8233;
      expv[36] = 36'h88800000f;
      expv[37] = 36'h88800000f;
      expv[38] = 36'h88800000f;
      expv[39] = 36'h888edc233;
      expv[40] = 36'h9abedc233;
      expv[41] = 36'h9abedc233;
      expv[42] = 36'h9abedc233;
      expv[43] = 36'h888edc233;
      expv[44] = 36'h888ca800f;
      expv[45] = 36'h9abca800f;
      expv[46] = 36'haceca800f;
      expv[47] = 36'h9abca800f;
      expv[48] = 36'h888ca800f;
      expv[49] = 36'h765edc00f;
      expv[50] = 36'h888edc00f;
      expv[51] = 36'h9abedc00f;
      expv[52] = 36'h9abedc00f;
      expv[53] = 36'h88800000f;
      expv[54] = 36'h888edc00f;
      expv[55] = 36'h88800000f;
      expv[56] = 36'h88800000f;
      expv[57] = 36'h76500000f;
      expv[58] = 36'h88800000f;
      expv[59] = 36'h9abedc00f;
      expv[60] = 36'h9abedc00f;
      expv[61] = 36'h888edc00f;
      expv[62] = 36'h765edc00f;
      expv[63] = 36'h765edc00f;
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
