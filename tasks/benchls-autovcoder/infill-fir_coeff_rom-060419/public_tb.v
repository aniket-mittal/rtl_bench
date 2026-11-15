// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_060419 dut (
    .addr(in_vec[4:0]),
    .data(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1d;
    stim[1] = 5'h0b;
    stim[2] = 5'h14;
    stim[3] = 5'h0d;
    stim[4] = 5'h05;
    stim[5] = 5'h1c;
    stim[6] = 5'h05;
    stim[7] = 5'h07;
    stim[8] = 5'h08;
    stim[9] = 5'h03;
    stim[10] = 5'h0a;
    stim[11] = 5'h19;
    stim[12] = 5'h0f;
    stim[13] = 5'h10;
    stim[14] = 5'h13;
    stim[15] = 5'h1d;
    stim[16] = 5'h13;
    stim[17] = 5'h1f;
    stim[18] = 5'h0e;
    stim[19] = 5'h03;
    stim[20] = 5'h16;
    stim[21] = 5'h17;
    stim[22] = 5'h02;
    stim[23] = 5'h01;
    stim[24] = 5'h01;
    stim[25] = 5'h06;
    stim[26] = 5'h0a;
    stim[27] = 5'h19;
    stim[28] = 5'h0f;
    stim[29] = 5'h18;
    stim[30] = 5'h13;
    stim[31] = 5'h00;
    stim[32] = 5'h04;
    stim[33] = 5'h10;
    stim[34] = 5'h04;
    stim[35] = 5'h0f;
    stim[36] = 5'h11;
    stim[37] = 5'h0a;
    stim[38] = 5'h1c;
    stim[39] = 5'h00;
    stim[40] = 5'h1d;
    stim[41] = 5'h11;
    stim[42] = 5'h05;
    stim[43] = 5'h03;
    stim[44] = 5'h15;
    stim[45] = 5'h13;
    stim[46] = 5'h1b;
    stim[47] = 5'h11;
    stim[48] = 5'h1b;
    stim[49] = 5'h17;
    stim[50] = 5'h10;
    stim[51] = 5'h01;
    stim[52] = 5'h14;
    stim[53] = 5'h02;
    stim[54] = 5'h10;
    stim[55] = 5'h1d;
    stim[56] = 5'h1b;
    stim[57] = 5'h1b;
    stim[58] = 5'h11;
    stim[59] = 5'h00;
    stim[60] = 5'h12;
    stim[61] = 5'h0f;
    stim[62] = 5'h14;
    stim[63] = 5'h11;
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
      expv[0] = 18'h13c10;
      expv[1] = 18'h0f320;
      expv[2] = 18'h0aa30;
      expv[3] = 18'h10b70;
      expv[4] = 18'h0aa30;
      expv[5] = 18'h10b70;
      expv[6] = 18'h0aa30;
      expv[7] = 18'h10b70;
      expv[8] = 18'h06140;
      expv[9] = 18'h091e0;
      expv[10] = 18'h0c280;
      expv[11] = 18'h0c280;
      expv[12] = 18'h16cb0;
      expv[13] = 18'h030a0;
      expv[14] = 18'h0c280;
      expv[15] = 18'h13c10;
      expv[16] = 18'h0c280;
      expv[17] = 18'h19d50;
      expv[18] = 18'h13c10;
      expv[19] = 18'h091e0;
      expv[20] = 18'h10b70;
      expv[21] = 18'h13c10;
      expv[22] = 18'h06140;
      expv[23] = 18'h030a0;
      expv[24] = 18'h030a0;
      expv[25] = 18'h0dad0;
      expv[26] = 18'h0c280;
      expv[27] = 18'h0c280;
      expv[28] = 18'h16cb0;
      expv[29] = 18'h091e0;
      expv[30] = 18'h0c280;
      expv[31] = 18'h00000;
      expv[32] = 18'h07990;
      expv[33] = 18'h030a0;
      expv[34] = 18'h07990;
      expv[35] = 18'h16cb0;
      expv[36] = 18'h06140;
      expv[37] = 18'h0c280;
      expv[38] = 18'h10b70;
      expv[39] = 18'h00000;
      expv[40] = 18'h13c10;
      expv[41] = 18'h06140;
      expv[42] = 18'h0aa30;
      expv[43] = 18'h091e0;
      expv[44] = 18'h0dad0;
      expv[45] = 18'h0c280;
      expv[46] = 18'h123c0;
      expv[47] = 18'h06140;
      expv[48] = 18'h123c0;
      expv[49] = 18'h13c10;
      expv[50] = 18'h030a0;
      expv[51] = 18'h030a0;
      expv[52] = 18'h0aa30;
      expv[53] = 18'h06140;
      expv[54] = 18'h030a0;
      expv[55] = 18'h13c10;
      expv[56] = 18'h123c0;
      expv[57] = 18'h123c0;
      expv[58] = 18'h06140;
      expv[59] = 18'h00000;
      expv[60] = 18'h091e0;
      expv[61] = 18'h16cb0;
      expv[62] = 18'h0aa30;
      expv[63] = 18'h06140;
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
