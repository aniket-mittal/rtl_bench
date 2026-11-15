// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01007 dut (
    .clk_in(clk),
    .rst_in(in_vec[20:20]),
    .mute_in(in_vec[19:16]),
    .pulse0_in(in_vec[15:12]),
    .pulse1_in(in_vec[11:8]),
    .triangle_in(in_vec[7:4]),
    .noise_in(in_vec[3:0]),
    .audio_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h032215;
    stim[1] = 21'h0bd490;
    stim[2] = 21'h155451;
    stim[3] = 21'h1332fc;
    stim[4] = 21'h1f7648;
    stim[5] = 21'h174a05;
    stim[6] = 21'h1fff7b;
    stim[7] = 21'h1e8d0f;
    stim[8] = 21'h14c497;
    stim[9] = 21'h139794;
    stim[10] = 21'h108b3d;
    stim[11] = 21'h13a6ce;
    stim[12] = 21'h1fc378;
    stim[13] = 21'h115d66;
    stim[14] = 21'h16cc39;
    stim[15] = 21'h1dfa91;
    stim[16] = 21'h14ffad;
    stim[17] = 21'h19f64e;
    stim[18] = 21'h108321;
    stim[19] = 21'h1f87d0;
    stim[20] = 21'h19e812;
    stim[21] = 21'h1b6e4d;
    stim[22] = 21'h1a0ddc;
    stim[23] = 21'h1b7909;
    stim[24] = 21'h19cd7d;
    stim[25] = 21'h11dc63;
    stim[26] = 21'h181138;
    stim[27] = 21'h1b6782;
    stim[28] = 21'h1cb67f;
    stim[29] = 21'h10159c;
    stim[30] = 21'h1c5282;
    stim[31] = 21'h16506f;
    stim[32] = 21'h112f4b;
    stim[33] = 21'h146829;
    stim[34] = 21'h13905a;
    stim[35] = 21'h12bdad;
    stim[36] = 21'h1d8315;
    stim[37] = 21'h1e51e3;
    stim[38] = 21'h1ec21f;
    stim[39] = 21'h13be34;
    stim[40] = 21'h17598f;
    stim[41] = 21'h19e0fc;
    stim[42] = 21'h1f05e9;
    stim[43] = 21'h156f27;
    stim[44] = 21'h177510;
    stim[45] = 21'h1a0cd0;
    stim[46] = 21'h1d0b73;
    stim[47] = 21'h1f39f1;
    stim[48] = 21'h18ad94;
    stim[49] = 21'h15a279;
    stim[50] = 21'h17b6c8;
    stim[51] = 21'h1c2d0d;
    stim[52] = 21'h118adc;
    stim[53] = 21'h1c36bc;
    stim[54] = 21'h15657e;
    stim[55] = 21'h11d9b6;
    stim[56] = 21'h078779;
    stim[57] = 21'h0efbeb;
    stim[58] = 21'h1df61a;
    stim[59] = 21'h170a88;
    stim[60] = 21'h1aa239;
    stim[61] = 21'h193645;
    stim[62] = 21'h1cc3c9;
    stim[63] = 21'h176ef7;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
