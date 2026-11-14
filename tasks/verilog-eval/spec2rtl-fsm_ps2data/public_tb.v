// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .in(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .out_bytes(out_vec[24:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0c3;
    stim[1] = 9'h119;
    stim[2] = 9'h150;
    stim[3] = 9'h00e;
    stim[4] = 9'h08f;
    stim[5] = 9'h1f0;
    stim[6] = 9'h0dc;
    stim[7] = 9'h184;
    stim[8] = 9'h020;
    stim[9] = 9'h164;
    stim[10] = 9'h00a;
    stim[11] = 9'h0b2;
    stim[12] = 9'h07e;
    stim[13] = 9'h0c6;
    stim[14] = 9'h102;
    stim[15] = 9'h144;
    stim[16] = 9'h1ac;
    stim[17] = 9'h1ba;
    stim[18] = 9'h098;
    stim[19] = 9'h150;
    stim[20] = 9'h116;
    stim[21] = 9'h14e;
    stim[22] = 9'h08a;
    stim[23] = 9'h1a2;
    stim[24] = 9'h186;
    stim[25] = 9'h1ce;
    stim[26] = 9'h0c6;
    stim[27] = 9'h0a2;
    stim[28] = 9'h106;
    stim[29] = 9'h1aa;
    stim[30] = 9'h01e;
    stim[31] = 9'h046;
    stim[32] = 9'h14c;
    stim[33] = 9'h146;
    stim[34] = 9'h152;
    stim[35] = 9'h0f8;
    stim[36] = 9'h0a6;
    stim[37] = 9'h032;
    stim[38] = 9'h0a0;
    stim[39] = 9'h004;
    stim[40] = 9'h1ba;
    stim[41] = 9'h044;
    stim[42] = 9'h10c;
    stim[43] = 9'h060;
    stim[44] = 9'h122;
    stim[45] = 9'h018;
    stim[46] = 9'h1b6;
    stim[47] = 9'h16c;
    stim[48] = 9'h1e8;
    stim[49] = 9'h13c;
    stim[50] = 9'h05a;
    stim[51] = 9'h048;
    stim[52] = 9'h108;
    stim[53] = 9'h06a;
    stim[54] = 9'h03a;
    stim[55] = 9'h0b2;
    stim[56] = 9'h1ee;
    stim[57] = 9'h13c;
    stim[58] = 9'h1e0;
    stim[59] = 9'h180;
    stim[60] = 9'h140;
    stim[61] = 9'h0b6;
    stim[62] = 9'h00a;
    stim[63] = 9'h190;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'hxxxxxxx;
      expv[2] = 25'hxxxxxxx;
      expv[3] = 25'hxxxxxxx;
      expv[4] = 25'hxxxxxxx;
      expv[5] = 25'hxxxxxxx;
      expv[6] = 25'hxxxxxxx;
      expv[7] = 25'hxxxxxxx;
      expv[8] = 25'h1f0dd85;
      expv[9] = 25'hxxxxxxx;
      expv[10] = 25'hxxxxxxx;
      expv[11] = 25'hxxxxxxx;
      expv[12] = 25'hxxxxxxx;
      expv[13] = 25'hxxxxxxx;
      expv[14] = 25'h0b27ec7;
      expv[15] = 25'hxxxxxxx;
      expv[16] = 25'hxxxxxxx;
      expv[17] = 25'hxxxxxxx;
      expv[18] = 25'hxxxxxxx;
      expv[19] = 25'hxxxxxxx;
      expv[20] = 25'h1ba9951;
      expv[21] = 25'hxxxxxxx;
      expv[22] = 25'hxxxxxxx;
      expv[23] = 25'h1174e8b;
      expv[24] = 25'hxxxxxxx;
      expv[25] = 25'hxxxxxxx;
      expv[26] = 25'hxxxxxxx;
      expv[27] = 25'hxxxxxxx;
      expv[28] = 25'hxxxxxxx;
      expv[29] = 25'hxxxxxxx;
      expv[30] = 25'hxxxxxxx;
      expv[31] = 25'hxxxxxxx;
      expv[32] = 25'hxxxxxxx;
      expv[33] = 25'h01e474d;
      expv[34] = 25'hxxxxxxx;
      expv[35] = 25'hxxxxxxx;
      expv[36] = 25'hxxxxxxx;
      expv[37] = 25'h152f8a7;
      expv[38] = 25'hxxxxxxx;
      expv[39] = 25'hxxxxxxx;
      expv[40] = 25'h032a005;
      expv[41] = 25'hxxxxxxx;
      expv[42] = 25'hxxxxxxx;
      expv[43] = 25'h1ba450d;
      expv[44] = 25'hxxxxxxx;
      expv[45] = 25'hxxxxxxx;
      expv[46] = 25'hxxxxxxx;
      expv[47] = 25'hxxxxxxx;
      expv[48] = 25'h019b76d;
      expv[49] = 25'hxxxxxxx;
      expv[50] = 25'hxxxxxxx;
      expv[51] = 25'hxxxxxxx;
      expv[52] = 25'h13c5a49;
      expv[53] = 25'hxxxxxxx;
      expv[54] = 25'hxxxxxxx;
      expv[55] = 25'hxxxxxxx;
      expv[56] = 25'hxxxxxxx;
      expv[57] = 25'h03ab3ef;
      expv[58] = 25'hxxxxxxx;
      expv[59] = 25'hxxxxxxx;
      expv[60] = 25'h13de181;
      expv[61] = 25'hxxxxxxx;
      expv[62] = 25'hxxxxxxx;
      expv[63] = 25'hxxxxxxx;
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
