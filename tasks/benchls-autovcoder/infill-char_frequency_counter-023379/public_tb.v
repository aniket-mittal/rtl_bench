// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023379 dut (
    .CLK(clk),
    .nRST(in_vec[28:28]),
    .CHARACTER_IN(in_vec[27:0]),
    .FREQUENT_OUT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h16b32e7a;
    stim[1] = 29'h1fcb3137;
    stim[2] = 29'h0beea10b;
    stim[3] = 29'h0af8607e;
    stim[4] = 29'h06ca9833;
    stim[5] = 29'h05c95311;
    stim[6] = 29'h08013fe8;
    stim[7] = 29'h0ce0a450;
    stim[8] = 29'h08b36f5e;
    stim[9] = 29'h0b5816ad;
    stim[10] = 29'h002b1316;
    stim[11] = 29'h048ee59e;
    stim[12] = 29'h086a2ed3;
    stim[13] = 29'h03086aa5;
    stim[14] = 29'h063ce770;
    stim[15] = 29'h0a4d46e8;
    stim[16] = 29'h027886d4;
    stim[17] = 29'h00cbdbc0;
    stim[18] = 29'h0f16072c;
    stim[19] = 29'h0914d521;
    stim[20] = 29'h0c16819d;
    stim[21] = 29'h0ec1e1b4;
    stim[22] = 29'h0ea58c6b;
    stim[23] = 29'h08cb2442;
    stim[24] = 29'h084a3b2d;
    stim[25] = 29'h0505d207;
    stim[26] = 29'h0db64f90;
    stim[27] = 29'h0c850835;
    stim[28] = 29'h0ba73c95;
    stim[29] = 29'h02442c30;
    stim[30] = 29'h0e61f677;
    stim[31] = 29'h08d630b7;
    stim[32] = 29'h08b68408;
    stim[33] = 29'h01e72355;
    stim[34] = 29'h00a7bad9;
    stim[35] = 29'h02ff9876;
    stim[36] = 29'h021c288d;
    stim[37] = 29'h055103c1;
    stim[38] = 29'h053b4de4;
    stim[39] = 29'h0ce8c0f1;
    stim[40] = 29'h03856f96;
    stim[41] = 29'h023eeb61;
    stim[42] = 29'h00bf6698;
    stim[43] = 29'h0bfd0370;
    stim[44] = 29'h051d7a63;
    stim[45] = 29'h08dfed8e;
    stim[46] = 29'h090f79f4;
    stim[47] = 29'h0210915a;
    stim[48] = 29'h051ee1b2;
    stim[49] = 29'h0a997616;
    stim[50] = 29'h0abb8586;
    stim[51] = 29'h0a2674e0;
    stim[52] = 29'h00f8f66f;
    stim[53] = 29'h0fc1e6a2;
    stim[54] = 29'h02aa1b2e;
    stim[55] = 29'h0f3fdc79;
    stim[56] = 29'h099c23ed;
    stim[57] = 29'h099b5fd9;
    stim[58] = 29'h060ca130;
    stim[59] = 29'h035d3836;
    stim[60] = 29'h050771dc;
    stim[61] = 29'h0fbf7d30;
    stim[62] = 29'h0c2e030d;
    stim[63] = 29'h07b36af4;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
