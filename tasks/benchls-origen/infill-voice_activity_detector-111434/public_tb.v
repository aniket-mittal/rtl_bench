// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111434 dut (
    .clock_i(clk),
    .enable_i(in_vec[16:16]),
    .Data_i(in_vec[15:0]),
    .done_o(out_vec[3:3]),
    .pwm_audio_o(out_vec[2:2]),
    .pwm_sdaudio_o(out_vec[1:1]),
    .voice_indicator(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0beb9;
    stim[1] = 17'h0e07e;
    stim[2] = 17'h117e9;
    stim[3] = 17'h1c675;
    stim[4] = 17'h1f728;
    stim[5] = 17'h07903;
    stim[6] = 17'h0a842;
    stim[7] = 17'h0fc58;
    stim[8] = 17'h1441d;
    stim[9] = 17'h1eb43;
    stim[10] = 17'h1d7c6;
    stim[11] = 17'h03e92;
    stim[12] = 17'h09974;
    stim[13] = 17'h1c129;
    stim[14] = 17'h148f4;
    stim[15] = 17'h011b4;
    stim[16] = 17'h0d60d;
    stim[17] = 17'h00b88;
    stim[18] = 17'h0bded;
    stim[19] = 17'h0ea29;
    stim[20] = 17'h051ac;
    stim[21] = 17'h1b882;
    stim[22] = 17'h14113;
    stim[23] = 17'h15d32;
    stim[24] = 17'h0379e;
    stim[25] = 17'h04757;
    stim[26] = 17'h1e708;
    stim[27] = 17'h1b0ac;
    stim[28] = 17'h0e6a2;
    stim[29] = 17'h1ea4d;
    stim[30] = 17'h1f8d3;
    stim[31] = 17'h1f647;
    stim[32] = 17'h05252;
    stim[33] = 17'h19145;
    stim[34] = 17'h1919d;
    stim[35] = 17'h01184;
    stim[36] = 17'h0ef05;
    stim[37] = 17'h134d5;
    stim[38] = 17'h149a6;
    stim[39] = 17'h0be76;
    stim[40] = 17'h12068;
    stim[41] = 17'h14fe1;
    stim[42] = 17'h0a8ea;
    stim[43] = 17'h00bfb;
    stim[44] = 17'h1cd72;
    stim[45] = 17'h10d26;
    stim[46] = 17'h00d5a;
    stim[47] = 17'h02b5e;
    stim[48] = 17'h0fe44;
    stim[49] = 17'h09f89;
    stim[50] = 17'h16b20;
    stim[51] = 17'h0b103;
    stim[52] = 17'h0f585;
    stim[53] = 17'h1eeb5;
    stim[54] = 17'h01f51;
    stim[55] = 17'h1c23a;
    stim[56] = 17'h10300;
    stim[57] = 17'h0384f;
    stim[58] = 17'h0c983;
    stim[59] = 17'h029ce;
    stim[60] = 17'h0df5b;
    stim[61] = 17'h1f810;
    stim[62] = 17'h189c0;
    stim[63] = 17'h13085;
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
      expv[0] = 4'hx;
      expv[1] = 4'h2;
      expv[2] = 4'h2;
      expv[3] = 4'h2;
      expv[4] = 4'h2;
      expv[5] = 4'h2;
      expv[6] = 4'h2;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'h2;
      expv[10] = 4'h2;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'h2;
      expv[14] = 4'h2;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'h2;
      expv[18] = 4'h2;
      expv[19] = 4'h2;
      expv[20] = 4'h2;
      expv[21] = 4'h2;
      expv[22] = 4'h2;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h2;
      expv[27] = 4'h2;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h2;
      expv[39] = 4'h2;
      expv[40] = 4'h2;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'h2;
      expv[46] = 4'h2;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'h2;
      expv[54] = 4'h2;
      expv[55] = 4'h2;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'h2;
      expv[59] = 4'h2;
      expv[60] = 4'h2;
      expv[61] = 4'h2;
      expv[62] = 4'h2;
      expv[63] = 4'h2;
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
