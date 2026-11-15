// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01385 dut (
    .clk(clk),
    .reset(in_vec[26:26]),
    .tx_byte(in_vec[25:18]),
    .tx_en(in_vec[17:17]),
    .baud_lock(in_vec[16:16]),
    .baud_rate(in_vec[15:0]),
    .tx_busy(out_vec[1:1]),
    .txd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h63a4f0e;
    stim[1] = 27'h58b60a8;
    stim[2] = 27'h2034e14;
    stim[3] = 27'h35f877b;
    stim[4] = 27'h14cfaa6;
    stim[5] = 27'h1f4aada;
    stim[6] = 27'h37f128e;
    stim[7] = 27'h3c3e7b3;
    stim[8] = 27'h1d21e05;
    stim[9] = 27'h32cf1a3;
    stim[10] = 27'h1498d98;
    stim[11] = 27'h24f03c9;
    stim[12] = 27'h1066954;
    stim[13] = 27'h3b9582e;
    stim[14] = 27'h03d8b27;
    stim[15] = 27'h3b6114c;
    stim[16] = 27'h2ff39f3;
    stim[17] = 27'h2c22f06;
    stim[18] = 27'h10beb68;
    stim[19] = 27'h358c423;
    stim[20] = 27'h1c5c376;
    stim[21] = 27'h31d45bd;
    stim[22] = 27'h3fea398;
    stim[23] = 27'h0d3fbfd;
    stim[24] = 27'h17b25d7;
    stim[25] = 27'h1859460;
    stim[26] = 27'h0f75185;
    stim[27] = 27'h175dd9f;
    stim[28] = 27'h1fb4159;
    stim[29] = 27'h2f9701d;
    stim[30] = 27'h3124cf8;
    stim[31] = 27'h3d230f2;
    stim[32] = 27'h032931b;
    stim[33] = 27'h2e6d5f9;
    stim[34] = 27'h289ab25;
    stim[35] = 27'h023d249;
    stim[36] = 27'h220c69a;
    stim[37] = 27'h0615fd5;
    stim[38] = 27'h31fc2f9;
    stim[39] = 27'h1687194;
    stim[40] = 27'h3e852c8;
    stim[41] = 27'h0d5586f;
    stim[42] = 27'h254d3c2;
    stim[43] = 27'h21e306b;
    stim[44] = 27'h1097d06;
    stim[45] = 27'h0c499d9;
    stim[46] = 27'h2dd9b4f;
    stim[47] = 27'h34fdb18;
    stim[48] = 27'h1bfb90f;
    stim[49] = 27'h2949eba;
    stim[50] = 27'h01e647d;
    stim[51] = 27'h01c2dbf;
    stim[52] = 27'h29477f9;
    stim[53] = 27'h172f2eb;
    stim[54] = 27'h06abd47;
    stim[55] = 27'h33e7118;
    stim[56] = 27'h34112cf;
    stim[57] = 27'h052384c;
    stim[58] = 27'h28d4472;
    stim[59] = 27'h334100c;
    stim[60] = 27'h24ae377;
    stim[61] = 27'h3086899;
    stim[62] = 27'h012092e;
    stim[63] = 27'h16dbc07;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
