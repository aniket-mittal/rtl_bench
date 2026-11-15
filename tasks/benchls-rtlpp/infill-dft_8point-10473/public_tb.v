// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10473 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .y_real(out_vec[21:11]),
    .y_imag(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1c3;
    stim[1] = 9'h13a;
    stim[2] = 9'h03f;
    stim[3] = 9'h080;
    stim[4] = 9'h086;
    stim[5] = 9'h024;
    stim[6] = 9'h025;
    stim[7] = 9'h034;
    stim[8] = 9'h0a4;
    stim[9] = 9'h0b6;
    stim[10] = 9'h044;
    stim[11] = 9'h0e0;
    stim[12] = 9'h040;
    stim[13] = 9'h025;
    stim[14] = 9'h0ec;
    stim[15] = 9'h0f0;
    stim[16] = 9'h061;
    stim[17] = 9'h0aa;
    stim[18] = 9'h00c;
    stim[19] = 9'h0ae;
    stim[20] = 9'h011;
    stim[21] = 9'h024;
    stim[22] = 9'h053;
    stim[23] = 9'h085;
    stim[24] = 9'h0d3;
    stim[25] = 9'h07a;
    stim[26] = 9'h0df;
    stim[27] = 9'h032;
    stim[28] = 9'h011;
    stim[29] = 9'h056;
    stim[30] = 9'h063;
    stim[31] = 9'h0b4;
    stim[32] = 9'h03a;
    stim[33] = 9'h010;
    stim[34] = 9'h079;
    stim[35] = 9'h0b8;
    stim[36] = 9'h056;
    stim[37] = 9'h0b8;
    stim[38] = 9'h0f3;
    stim[39] = 9'h040;
    stim[40] = 9'h098;
    stim[41] = 9'h08b;
    stim[42] = 9'h0f3;
    stim[43] = 9'h071;
    stim[44] = 9'h01e;
    stim[45] = 9'h051;
    stim[46] = 9'h061;
    stim[47] = 9'h0bc;
    stim[48] = 9'h091;
    stim[49] = 9'h0aa;
    stim[50] = 9'h09a;
    stim[51] = 9'h07a;
    stim[52] = 9'h017;
    stim[53] = 9'h09f;
    stim[54] = 9'h013;
    stim[55] = 9'h0f9;
    stim[56] = 9'h0d1;
    stim[57] = 9'h06e;
    stim[58] = 9'h0cb;
    stim[59] = 9'h038;
    stim[60] = 9'h06d;
    stim[61] = 9'h077;
    stim[62] = 9'h06d;
    stim[63] = 9'h013;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000000;
      expv[12] = 22'h037f70;
      expv[13] = 22'h034fe9;
      expv[14] = 22'h05b8a4;
      expv[15] = 22'h3c6835;
      expv[16] = 22'h046f68;
      expv[17] = 22'h052f9c;
      expv[18] = 22'h3e0f7e;
      expv[19] = 22'h3b3000;
      expv[20] = 22'h000000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h026890;
      expv[30] = 22'h34aff6;
      expv[31] = 22'h008765;
      expv[32] = 22'h011fcd;
      expv[33] = 22'h3a8777;
      expv[34] = 22'h3de008;
      expv[35] = 22'h37b7bd;
      expv[36] = 22'h004000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h08908c;
      expv[47] = 22'h0257e0;
      expv[48] = 22'h006771;
      expv[49] = 22'h066e9d;
      expv[50] = 22'h057f50;
      expv[51] = 22'h3b8ff8;
      expv[52] = 22'h01b0d3;
      expv[53] = 22'h3ab800;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h3df76c;
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
