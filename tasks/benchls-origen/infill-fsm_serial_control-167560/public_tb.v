// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167560 dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B0_next(out_vec[12:12]),
    .B1_next(out_vec[11:11]),
    .B2_next(out_vec[10:10]),
    .B3_next(out_vec[9:9]),
    .S_next(out_vec[8:8]),
    .S1_next(out_vec[7:7]),
    .C_next(out_vec[6:6]),
    .W_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0c88;
    stim[1] = 13'h1e00;
    stim[2] = 13'h0ea6;
    stim[3] = 13'h1ad4;
    stim[4] = 13'h16a9;
    stim[5] = 13'h020d;
    stim[6] = 13'h0bc8;
    stim[7] = 13'h080d;
    stim[8] = 13'h1a2f;
    stim[9] = 13'h1ca3;
    stim[10] = 13'h0224;
    stim[11] = 13'h0de1;
    stim[12] = 13'h0aad;
    stim[13] = 13'h148d;
    stim[14] = 13'h1206;
    stim[15] = 13'h1030;
    stim[16] = 13'h19c8;
    stim[17] = 13'h0de8;
    stim[18] = 13'h19f2;
    stim[19] = 13'h0187;
    stim[20] = 13'h08e9;
    stim[21] = 13'h0cca;
    stim[22] = 13'h0d6e;
    stim[23] = 13'h1007;
    stim[24] = 13'h106e;
    stim[25] = 13'h084d;
    stim[26] = 13'h0d9b;
    stim[27] = 13'h0873;
    stim[28] = 13'h039d;
    stim[29] = 13'h1017;
    stim[30] = 13'h014f;
    stim[31] = 13'h1c52;
    stim[32] = 13'h13e0;
    stim[33] = 13'h1274;
    stim[34] = 13'h1e6a;
    stim[35] = 13'h1e46;
    stim[36] = 13'h1e7c;
    stim[37] = 13'h0ce6;
    stim[38] = 13'h1c1c;
    stim[39] = 13'h12d3;
    stim[40] = 13'h1ab9;
    stim[41] = 13'h0f31;
    stim[42] = 13'h09e6;
    stim[43] = 13'h1307;
    stim[44] = 13'h1bd9;
    stim[45] = 13'h171d;
    stim[46] = 13'h1f7f;
    stim[47] = 13'h1f48;
    stim[48] = 13'h1252;
    stim[49] = 13'h0448;
    stim[50] = 13'h1655;
    stim[51] = 13'h0930;
    stim[52] = 13'h1b3e;
    stim[53] = 13'h1350;
    stim[54] = 13'h106a;
    stim[55] = 13'h034e;
    stim[56] = 13'h06cf;
    stim[57] = 13'h121d;
    stim[58] = 13'h1a55;
    stim[59] = 13'h10a6;
    stim[60] = 13'h0dde;
    stim[61] = 13'h1935;
    stim[62] = 13'h1337;
    stim[63] = 13'h04cb;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0100;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
