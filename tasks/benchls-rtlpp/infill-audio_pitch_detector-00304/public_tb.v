// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00304 dut (
    .clk(clk),
    .MISO(in_vec[4:4]),
    .aud_in_sel(in_vec[3:3]),
    .aud_out_sel(in_vec[2:2]),
    .pitch_enable(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .AUD_SD(out_vec[105:105]),
    .PWM(out_vec[104:104]),
    .led(out_vec[103:92]),
    .monitor_audio_in(out_vec[91:80]),
    .monitor_audio_out(out_vec[79:68]),
    .monitor_fft_out(out_vec[67:36]),
    .monitor_fft_vld(out_vec[35:35]),
    .monitor_pitch_out(out_vec[34:3]),
    .monitor_pitch_vld(out_vec[2:2]),
    .sck(out_vec[1:1]),
    .ss(out_vec[0:0])
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
    stim[1] = 5'h07;
    stim[2] = 5'h06;
    stim[3] = 5'h04;
    stim[4] = 5'h06;
    stim[5] = 5'h1a;
    stim[6] = 5'h1e;
    stim[7] = 5'h08;
    stim[8] = 5'h18;
    stim[9] = 5'h06;
    stim[10] = 5'h16;
    stim[11] = 5'h14;
    stim[12] = 5'h0c;
    stim[13] = 5'h0a;
    stim[14] = 5'h1e;
    stim[15] = 5'h18;
    stim[16] = 5'h0a;
    stim[17] = 5'h1e;
    stim[18] = 5'h10;
    stim[19] = 5'h08;
    stim[20] = 5'h0a;
    stim[21] = 5'h06;
    stim[22] = 5'h1a;
    stim[23] = 5'h02;
    stim[24] = 5'h00;
    stim[25] = 5'h0e;
    stim[26] = 5'h04;
    stim[27] = 5'h0e;
    stim[28] = 5'h08;
    stim[29] = 5'h0a;
    stim[30] = 5'h06;
    stim[31] = 5'h0e;
    stim[32] = 5'h0e;
    stim[33] = 5'h04;
    stim[34] = 5'h10;
    stim[35] = 5'h0a;
    stim[36] = 5'h0e;
    stim[37] = 5'h0e;
    stim[38] = 5'h04;
    stim[39] = 5'h02;
    stim[40] = 5'h16;
    stim[41] = 5'h14;
    stim[42] = 5'h0a;
    stim[43] = 5'h0a;
    stim[44] = 5'h12;
    stim[45] = 5'h0c;
    stim[46] = 5'h1e;
    stim[47] = 5'h0e;
    stim[48] = 5'h08;
    stim[49] = 5'h02;
    stim[50] = 5'h08;
    stim[51] = 5'h14;
    stim[52] = 5'h14;
    stim[53] = 5'h10;
    stim[54] = 5'h04;
    stim[55] = 5'h06;
    stim[56] = 5'h16;
    stim[57] = 5'h1e;
    stim[58] = 5'h1a;
    stim[59] = 5'h0e;
    stim[60] = 5'h1f;
    stim[61] = 5'h1e;
    stim[62] = 5'h1e;
    stim[63] = 5'h06;
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
      expv[0] = 106'hx000000xxx00000000000000000;
      expv[1] = 106'h0000000xxx00000000000000000;
      expv[2] = 106'h0000000xxx00000000000000000;
      expv[3] = 106'h0000000xxx00000000000000000;
      expv[4] = 106'h0000000xxx00000000000000000;
      expv[5] = 106'h0000000xxx00000000000000000;
      expv[6] = 106'h0000000xxx00000000000000000;
      expv[7] = 106'h0000000xxx00000000000000000;
      expv[8] = 106'h0000000xxx00000000000000000;
      expv[9] = 106'h0000000xxx00000000000000000;
      expv[10] = 106'h0000000xxx00000000000000000;
      expv[11] = 106'h0000000xxx00000000000000000;
      expv[12] = 106'h0000000xxx00000000000000000;
      expv[13] = 106'h0000000xxx00000000000000000;
      expv[14] = 106'h0000000xxx00000000000000000;
      expv[15] = 106'h0000000xxx00000000000000000;
      expv[16] = 106'h0000000xxx00000000000000000;
      expv[17] = 106'h0000000xxx00000000000000000;
      expv[18] = 106'h0000000xxx00000000000000000;
      expv[19] = 106'h0000000xxx00000000000000000;
      expv[20] = 106'h0000000xxx00000000000000000;
      expv[21] = 106'h0000000xxx00000000000000000;
      expv[22] = 106'h0000000xxx00000000000000000;
      expv[23] = 106'h0000000xxx00000000000000000;
      expv[24] = 106'h0000000xxx00000000000000000;
      expv[25] = 106'h0000000xxx00000000000000000;
      expv[26] = 106'h0000000xxx00000000000000000;
      expv[27] = 106'h0000000xxx00000000000000000;
      expv[28] = 106'h0000000xxx00000000000000000;
      expv[29] = 106'h0000000xxx00000000000000000;
      expv[30] = 106'h0000000xxx00000000000000000;
      expv[31] = 106'h0000000xxx00000000000000000;
      expv[32] = 106'h0000000xxx00000000000000000;
      expv[33] = 106'h0000000xxx00000000000000000;
      expv[34] = 106'h0000000xxx00000000000000000;
      expv[35] = 106'h0000000xxx00000000000000000;
      expv[36] = 106'h0000000xxx00000000000000000;
      expv[37] = 106'h0000000xxx00000000000000000;
      expv[38] = 106'h0000000xxx00000000000000000;
      expv[39] = 106'h0000000xxx00000000000000000;
      expv[40] = 106'h0000000xxx00000000000000000;
      expv[41] = 106'h0000000xxx00000000000000000;
      expv[42] = 106'h0000000xxx00000000000000000;
      expv[43] = 106'h0000000xxx00000000000000000;
      expv[44] = 106'h0000000xxx00000000000000000;
      expv[45] = 106'h0000000xxx00000000000000000;
      expv[46] = 106'h0000000xxx00000000000000000;
      expv[47] = 106'h0000000xxx00000000000000000;
      expv[48] = 106'h0000000xxx00000000000000000;
      expv[49] = 106'h0000000xxx00000000000000000;
      expv[50] = 106'h0000000xxx00000000000000000;
      expv[51] = 106'h0000000xxx00000000000000000;
      expv[52] = 106'h0000000xxx00000000000000000;
      expv[53] = 106'h0000000xxx00000000000000000;
      expv[54] = 106'h0000000xxx00000000000000000;
      expv[55] = 106'h0000000xxx00000000000000000;
      expv[56] = 106'h0000000xxx00000000000000000;
      expv[57] = 106'h0000000xxx00000000000000000;
      expv[58] = 106'h0000000xxx00000000000000000;
      expv[59] = 106'h0000000xxx00000000000000000;
      expv[60] = 106'h0000000xxx00000000000000000;
      expv[61] = 106'h0000000xxx00000000000000000;
      expv[62] = 106'h0000000xxx00000000000000000;
      expv[63] = 106'h0000000xxx00000000000000000;
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
