// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_114964 dut (
    .frame_clk(clk),
    .Reset(in_vec[8:8]),
    .keycode(in_vec[7:0]),
    .BallX(out_vec[51:42]),
    .BallY(out_vec[41:32]),
    .BallS(out_vec[31:22]),
    .BallWidth(out_vec[21:12]),
    .BallHeight(out_vec[11:2]),
    .gameover(out_vec[1:1]),
    .gamewin(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h165;
    stim[1] = 9'h12b;
    stim[2] = 9'h057;
    stim[3] = 9'h03a;
    stim[4] = 9'h0d6;
    stim[5] = 9'h065;
    stim[6] = 9'h09f;
    stim[7] = 9'h065;
    stim[8] = 9'h03c;
    stim[9] = 9'h093;
    stim[10] = 9'h0f1;
    stim[11] = 9'h0cc;
    stim[12] = 9'h0da;
    stim[13] = 9'h06a;
    stim[14] = 9'h05c;
    stim[15] = 9'h0f3;
    stim[16] = 9'h0a1;
    stim[17] = 9'h07b;
    stim[18] = 9'h0a7;
    stim[19] = 9'h001;
    stim[20] = 9'h034;
    stim[21] = 9'h045;
    stim[22] = 9'h054;
    stim[23] = 9'h076;
    stim[24] = 9'h05a;
    stim[25] = 9'h05a;
    stim[26] = 9'h085;
    stim[27] = 9'h042;
    stim[28] = 9'h0ef;
    stim[29] = 9'h0d3;
    stim[30] = 9'h0c6;
    stim[31] = 9'h0f7;
    stim[32] = 9'h01a;
    stim[33] = 9'h0e7;
    stim[34] = 9'h056;
    stim[35] = 9'h0b7;
    stim[36] = 9'h0b5;
    stim[37] = 9'h0a4;
    stim[38] = 9'h0c6;
    stim[39] = 9'h098;
    stim[40] = 9'h03a;
    stim[41] = 9'h05e;
    stim[42] = 9'h06f;
    stim[43] = 9'h035;
    stim[44] = 9'h0d1;
    stim[45] = 9'h041;
    stim[46] = 9'h029;
    stim[47] = 9'h0f2;
    stim[48] = 9'h0ee;
    stim[49] = 9'h07e;
    stim[50] = 9'h0d0;
    stim[51] = 9'h034;
    stim[52] = 9'h0d7;
    stim[53] = 9'h06a;
    stim[54] = 9'h0cf;
    stim[55] = 9'h0b1;
    stim[56] = 9'h058;
    stim[57] = 9'h0d4;
    stim[58] = 9'h088;
    stim[59] = 9'h02b;
    stim[60] = 9'h046;
    stim[61] = 9'h036;
    stim[62] = 9'h082;
    stim[63] = 9'h08a;
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
      expv[0] = 52'h500f00100802x;
      expv[1] = 52'h500f00100802x;
      expv[2] = 52'h500f00100802x;
      expv[3] = 52'h500f00100802x;
      expv[4] = 52'h500f10100802x;
      expv[5] = 52'h500f20100802x;
      expv[6] = 52'h500f30100802x;
      expv[7] = 52'h500f40100802x;
      expv[8] = 52'h500f50100802x;
      expv[9] = 52'h500f60100802x;
      expv[10] = 52'h500f70100802x;
      expv[11] = 52'h500f80100802x;
      expv[12] = 52'h500f90100802x;
      expv[13] = 52'h500fa0100802x;
      expv[14] = 52'h500fb0100802x;
      expv[15] = 52'h500fc0100802x;
      expv[16] = 52'h500fd0100802x;
      expv[17] = 52'h500fe0100802x;
      expv[18] = 52'h500ff0100802x;
      expv[19] = 52'h501000100802x;
      expv[20] = 52'h501010100802x;
      expv[21] = 52'h501020100802x;
      expv[22] = 52'h501030100802x;
      expv[23] = 52'h501040100802x;
      expv[24] = 52'h501050100802x;
      expv[25] = 52'h501060100802x;
      expv[26] = 52'h501070100802x;
      expv[27] = 52'h501080100802x;
      expv[28] = 52'h501090100802x;
      expv[29] = 52'h5010a0100802x;
      expv[30] = 52'h5010b0100802x;
      expv[31] = 52'h5010c0100802x;
      expv[32] = 52'h5010d0100802x;
      expv[33] = 52'h5010e0100802x;
      expv[34] = 52'h5050d0100802x;
      expv[35] = 52'h5090e0100802x;
      expv[36] = 52'h50d0f0100802x;
      expv[37] = 52'h511100100802x;
      expv[38] = 52'h515110100802x;
      expv[39] = 52'h519120100802x;
      expv[40] = 52'h51d130100802x;
      expv[41] = 52'h521140100802x;
      expv[42] = 52'h525150100802x;
      expv[43] = 52'h529160100802x;
      expv[44] = 52'h52d170100802x;
      expv[45] = 52'h531180100802x;
      expv[46] = 52'h535190100802x;
      expv[47] = 52'h5391a0100802x;
      expv[48] = 52'h53d1b0100802x;
      expv[49] = 52'h5411c0100802x;
      expv[50] = 52'h5451d0100802x;
      expv[51] = 52'h5491e0100802x;
      expv[52] = 52'h54d1f0100802x;
      expv[53] = 52'h551200100802x;
      expv[54] = 52'h555210100802x;
      expv[55] = 52'h559220100802x;
      expv[56] = 52'h55d230100802x;
      expv[57] = 52'h561240100802x;
      expv[58] = 52'h565250100802x;
      expv[59] = 52'h569260100802x;
      expv[60] = 52'h56d270100802x;
      expv[61] = 52'h571280100802x;
      expv[62] = 52'h575290100802x;
      expv[63] = 52'h5792a0100802x;
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
