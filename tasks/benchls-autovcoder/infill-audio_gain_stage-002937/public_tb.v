// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002937 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .ctrl(in_vec[19:16]),
    .z(in_vec[15:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h128c92;
    stim[1] = 21'h184f93;
    stim[2] = 21'h0969d4;
    stim[3] = 21'h0f5cf8;
    stim[4] = 21'h00ae4c;
    stim[5] = 21'h086c17;
    stim[6] = 21'h08f8cf;
    stim[7] = 21'h0d4a57;
    stim[8] = 21'h094f1b;
    stim[9] = 21'h08a4f4;
    stim[10] = 21'h032379;
    stim[11] = 21'h0453e3;
    stim[12] = 21'h018d35;
    stim[13] = 21'h08fe27;
    stim[14] = 21'h08669a;
    stim[15] = 21'h016bd8;
    stim[16] = 21'h0a581f;
    stim[17] = 21'h0988c1;
    stim[18] = 21'h05f2aa;
    stim[19] = 21'h0ef934;
    stim[20] = 21'h06d47f;
    stim[21] = 21'h0887e8;
    stim[22] = 21'h052cb1;
    stim[23] = 21'h0de0be;
    stim[24] = 21'h006f99;
    stim[25] = 21'h0f94c8;
    stim[26] = 21'h0076e3;
    stim[27] = 21'h0c8257;
    stim[28] = 21'h0ff352;
    stim[29] = 21'h0ea07c;
    stim[30] = 21'h0c00fd;
    stim[31] = 21'h00d880;
    stim[32] = 21'h08cb45;
    stim[33] = 21'h0b2285;
    stim[34] = 21'h0417de;
    stim[35] = 21'h023e12;
    stim[36] = 21'h07f481;
    stim[37] = 21'h070f97;
    stim[38] = 21'h0928b2;
    stim[39] = 21'h041b92;
    stim[40] = 21'h01454e;
    stim[41] = 21'h033eb6;
    stim[42] = 21'h0d480c;
    stim[43] = 21'h04e42b;
    stim[44] = 21'h0f5571;
    stim[45] = 21'h0ac1d1;
    stim[46] = 21'h01966e;
    stim[47] = 21'h0e5f1b;
    stim[48] = 21'h0db067;
    stim[49] = 21'h0386b2;
    stim[50] = 21'h0ac6c8;
    stim[51] = 21'h0887e9;
    stim[52] = 21'h06a9c4;
    stim[53] = 21'h08e594;
    stim[54] = 21'h02f6b0;
    stim[55] = 21'h0a2aa2;
    stim[56] = 21'h04dab8;
    stim[57] = 21'h0d1c8a;
    stim[58] = 21'h017e45;
    stim[59] = 21'h03689c;
    stim[60] = 21'h0c7fc7;
    stim[61] = 21'h0b38df;
    stim[62] = 21'h041f32;
    stim[63] = 21'h032264;
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
      expv[0] = 16'hxxxx;
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
      expv[19] = 16'h0036;
      expv[20] = 16'h0036;
      expv[21] = 16'h0036;
      expv[22] = 16'h0036;
      expv[23] = 16'h0400;
      expv[24] = 16'h0400;
      expv[25] = 16'h0400;
      expv[26] = 16'h0400;
      expv[27] = 16'h0400;
      expv[28] = 16'h0400;
      expv[29] = 16'h0400;
      expv[30] = 16'h0400;
      expv[31] = 16'h0400;
      expv[32] = 16'h0400;
      expv[33] = 16'h0400;
      expv[34] = 16'h0400;
      expv[35] = 16'h0400;
      expv[36] = 16'h0400;
      expv[37] = 16'h0400;
      expv[38] = 16'h0400;
      expv[39] = 16'h0400;
      expv[40] = 16'h0400;
      expv[41] = 16'h0400;
      expv[42] = 16'h0400;
      expv[43] = 16'h0400;
      expv[44] = 16'h0400;
      expv[45] = 16'h0400;
      expv[46] = 16'h0400;
      expv[47] = 16'h0400;
      expv[48] = 16'h0400;
      expv[49] = 16'h0400;
      expv[50] = 16'h0400;
      expv[51] = 16'h0400;
      expv[52] = 16'h0400;
      expv[53] = 16'h0400;
      expv[54] = 16'h0400;
      expv[55] = 16'h0400;
      expv[56] = 16'h0400;
      expv[57] = 16'h0400;
      expv[58] = 16'h0400;
      expv[59] = 16'h0400;
      expv[60] = 16'h0400;
      expv[61] = 16'h0400;
      expv[62] = 16'h0400;
      expv[63] = 16'h0400;
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
