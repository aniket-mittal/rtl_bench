// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_113001 dut (
    .clk(clk),
    .freq(in_vec[12:3]),
    .reset(in_vec[2:2]),
    .enable(in_vec[1:1]),
    .acquire(in_vec[0:0]),
    .waveform(out_vec[16:1]),
    .waveform_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h01ad;
    stim[1] = 13'h1f17;
    stim[2] = 13'h01e8;
    stim[3] = 13'h0b79;
    stim[4] = 13'h07b2;
    stim[5] = 13'h0968;
    stim[6] = 13'h0a40;
    stim[7] = 13'h1482;
    stim[8] = 13'h0833;
    stim[9] = 13'h050a;
    stim[10] = 13'h1881;
    stim[11] = 13'h1783;
    stim[12] = 13'h02a1;
    stim[13] = 13'h0ac3;
    stim[14] = 13'h06c3;
    stim[15] = 13'h1d01;
    stim[16] = 13'h1f20;
    stim[17] = 13'h0fa2;
    stim[18] = 13'h16ba;
    stim[19] = 13'h010b;
    stim[20] = 13'h0551;
    stim[21] = 13'h1be3;
    stim[22] = 13'h0349;
    stim[23] = 13'h1eba;
    stim[24] = 13'h1429;
    stim[25] = 13'h0163;
    stim[26] = 13'h1f22;
    stim[27] = 13'h1460;
    stim[28] = 13'h118a;
    stim[29] = 13'h0100;
    stim[30] = 13'h0388;
    stim[31] = 13'h0182;
    stim[32] = 13'h1fd0;
    stim[33] = 13'h170b;
    stim[34] = 13'h07a8;
    stim[35] = 13'h10f3;
    stim[36] = 13'h098b;
    stim[37] = 13'h0a82;
    stim[38] = 13'h126b;
    stim[39] = 13'h0fc2;
    stim[40] = 13'h1b78;
    stim[41] = 13'h0540;
    stim[42] = 13'h1d0a;
    stim[43] = 13'h1793;
    stim[44] = 13'h033b;
    stim[45] = 13'h0c8e;
    stim[46] = 13'h0f48;
    stim[47] = 13'h0ba9;
    stim[48] = 13'h182a;
    stim[49] = 13'h16aa;
    stim[50] = 13'h0f6b;
    stim[51] = 13'h099b;
    stim[52] = 13'h1589;
    stim[53] = 13'h160a;
    stim[54] = 13'h1638;
    stim[55] = 13'h0132;
    stim[56] = 13'h17c1;
    stim[57] = 13'h1d28;
    stim[58] = 13'h11d9;
    stim[59] = 13'h0998;
    stim[60] = 13'h0e0a;
    stim[61] = 13'h1f93;
    stim[62] = 13'h1630;
    stim[63] = 13'h1c3b;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00001;
      expv[54] = 17'h00001;
      expv[55] = 17'h00001;
      expv[56] = 17'h00001;
      expv[57] = 17'h00001;
      expv[58] = 17'h00001;
      expv[59] = 17'h00001;
      expv[60] = 17'h00001;
      expv[61] = 17'h00001;
      expv[62] = 17'h00001;
      expv[63] = 17'h00001;
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
