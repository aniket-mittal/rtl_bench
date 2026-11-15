// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05006 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .rd(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .data_out(out_vec[12:5]),
    .fifo_full(out_vec[4:4]),
    .fifo_empty(out_vec[3:3]),
    .fifo_threshold(out_vec[2:2]),
    .fifo_overflow(out_vec[1:1]),
    .fifo_underflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h147;
    stim[1] = 11'h128;
    stim[2] = 11'h5c6;
    stim[3] = 11'h6ff;
    stim[4] = 11'h410;
    stim[5] = 11'h40c;
    stim[6] = 11'h423;
    stim[7] = 11'h4ef;
    stim[8] = 11'h62f;
    stim[9] = 11'h2ab;
    stim[10] = 11'h5de;
    stim[11] = 11'h558;
    stim[12] = 11'h56d;
    stim[13] = 11'h4f6;
    stim[14] = 11'h68f;
    stim[15] = 11'h5d9;
    stim[16] = 11'h605;
    stim[17] = 11'h48b;
    stim[18] = 11'h546;
    stim[19] = 11'h6ad;
    stim[20] = 11'h5f7;
    stim[21] = 11'h5ef;
    stim[22] = 11'h6c5;
    stim[23] = 11'h55a;
    stim[24] = 11'h48d;
    stim[25] = 11'h4de;
    stim[26] = 11'h763;
    stim[27] = 11'h433;
    stim[28] = 11'h6e8;
    stim[29] = 11'h393;
    stim[30] = 11'h72d;
    stim[31] = 11'h4f2;
    stim[32] = 11'h4b5;
    stim[33] = 11'h67a;
    stim[34] = 11'h405;
    stim[35] = 11'h77f;
    stim[36] = 11'h63a;
    stim[37] = 11'h420;
    stim[38] = 11'h627;
    stim[39] = 11'h685;
    stim[40] = 11'h4ac;
    stim[41] = 11'h504;
    stim[42] = 11'h585;
    stim[43] = 11'h4d6;
    stim[44] = 11'h286;
    stim[45] = 11'h4dc;
    stim[46] = 11'h5b1;
    stim[47] = 11'h735;
    stim[48] = 11'h502;
    stim[49] = 11'h701;
    stim[50] = 11'h595;
    stim[51] = 11'h740;
    stim[52] = 11'h5a2;
    stim[53] = 11'h6cb;
    stim[54] = 11'h563;
    stim[55] = 11'h785;
    stim[56] = 11'h7dd;
    stim[57] = 11'h45d;
    stim[58] = 11'h5f8;
    stim[59] = 11'h6b9;
    stim[60] = 11'h432;
    stim[61] = 11'h5c7;
    stim[62] = 11'h5dd;
    stim[63] = 11'h6ad;
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
      expv[0] = 13'hxxx8;
      expv[1] = 13'hxxx8;
      expv[2] = 13'hxxx8;
      expv[3] = 13'hxxx9;
      expv[4] = 13'h1fe0;
      expv[5] = 13'h1fe0;
      expv[6] = 13'h1fe0;
      expv[7] = 13'h1fe0;
      expv[8] = 13'h1fe0;
      expv[9] = 13'h1fe8;
      expv[10] = 13'h1568;
      expv[11] = 13'h1569;
      expv[12] = 13'h1569;
      expv[13] = 13'h1569;
      expv[14] = 13'h1569;
      expv[15] = 13'h11e0;
      expv[16] = 13'h05e8;
      expv[17] = 13'h00a0;
      expv[18] = 13'h00a0;
      expv[19] = 13'hxxx8;
      expv[20] = 13'h15a0;
      expv[21] = 13'hxxx8;
      expv[22] = 13'hxxx9;
      expv[23] = 13'h18a0;
      expv[24] = 13'hxxx8;
      expv[25] = 13'hxxx8;
      expv[26] = 13'hxxx8;
      expv[27] = 13'h0c60;
      expv[28] = 13'h0c60;
      expv[29] = 13'h11e8;
      expv[30] = 13'h1268;
      expv[31] = 13'h05a0;
      expv[32] = 13'h05a0;
      expv[33] = 13'h05a0;
      expv[34] = 13'h05a0;
      expv[35] = 13'h05a0;
      expv[36] = 13'h0f40;
      expv[37] = 13'h0f40;
      expv[38] = 13'h0f40;
      expv[39] = 13'h0f40;
      expv[40] = 13'h0f40;
      expv[41] = 13'h0f40;
      expv[42] = 13'h0fe0;
      expv[43] = 13'h0740;
      expv[44] = 13'h05a8;
      expv[45] = 13'h10c8;
      expv[46] = 13'h10c8;
      expv[47] = 13'h10c9;
      expv[48] = 13'h06a0;
      expv[49] = 13'h0f48;
      expv[50] = 13'h0020;
      expv[51] = 13'h0fe8;
      expv[52] = 13'h0800;
      expv[53] = 13'h0748;
      expv[54] = 13'h1960;
      expv[55] = 13'h04e8;
      expv[56] = 13'h10a0;
      expv[57] = 13'h1ba0;
      expv[58] = 13'h1ba0;
      expv[59] = 13'hxxx8;
      expv[60] = 13'h1720;
      expv[61] = 13'h1720;
      expv[62] = 13'hxxx8;
      expv[63] = 13'hxxx9;
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
