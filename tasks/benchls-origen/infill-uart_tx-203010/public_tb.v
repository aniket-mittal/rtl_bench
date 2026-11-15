// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203010 dut (
    .Clk(clk),
    .Rst_n(in_vec[12:12]),
    .data_byte(in_vec[11:4]),
    .send_en(in_vec[3:3]),
    .baud_set(in_vec[2:0]),
    .Rs232_Tx(out_vec[3:3]),
    .Tx_Done(out_vec[2:2]),
    .uart_state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h047b;
    stim[1] = 13'h0ab3;
    stim[2] = 13'h165c;
    stim[3] = 13'h1b4a;
    stim[4] = 13'h1603;
    stim[5] = 13'h1d79;
    stim[6] = 13'h170e;
    stim[7] = 13'h129e;
    stim[8] = 13'h13fc;
    stim[9] = 13'h1c46;
    stim[10] = 13'h1495;
    stim[11] = 13'h1b98;
    stim[12] = 13'h184d;
    stim[13] = 13'h1326;
    stim[14] = 13'h1e0a;
    stim[15] = 13'h1ed3;
    stim[16] = 13'h180f;
    stim[17] = 13'h1fb5;
    stim[18] = 13'h1ffb;
    stim[19] = 13'h1964;
    stim[20] = 13'h19d3;
    stim[21] = 13'h1b1d;
    stim[22] = 13'h11d2;
    stim[23] = 13'h1035;
    stim[24] = 13'h1d07;
    stim[25] = 13'h13bf;
    stim[26] = 13'h131d;
    stim[27] = 13'h10d4;
    stim[28] = 13'h19af;
    stim[29] = 13'h1979;
    stim[30] = 13'h1b10;
    stim[31] = 13'h1a72;
    stim[32] = 13'h178f;
    stim[33] = 13'h15cf;
    stim[34] = 13'h11c5;
    stim[35] = 13'h16fc;
    stim[36] = 13'h1eff;
    stim[37] = 13'h1cb3;
    stim[38] = 13'h1a99;
    stim[39] = 13'h1533;
    stim[40] = 13'h1a39;
    stim[41] = 13'h1e60;
    stim[42] = 13'h16bc;
    stim[43] = 13'h1315;
    stim[44] = 13'h1403;
    stim[45] = 13'h1fe1;
    stim[46] = 13'h1f3d;
    stim[47] = 13'h1f99;
    stim[48] = 13'h1048;
    stim[49] = 13'h1a8b;
    stim[50] = 13'h104e;
    stim[51] = 13'h13ec;
    stim[52] = 13'h1549;
    stim[53] = 13'h17a2;
    stim[54] = 13'h16e7;
    stim[55] = 13'h178e;
    stim[56] = 13'h1f26;
    stim[57] = 13'h1b40;
    stim[58] = 13'h143e;
    stim[59] = 13'h1123;
    stim[60] = 13'h149b;
    stim[61] = 13'h143d;
    stim[62] = 13'h1578;
    stim[63] = 13'h14e9;
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
      expv[0] = 4'h9;
      expv[1] = 4'ha;
      expv[2] = 4'h9;
      expv[3] = 4'h9;
      expv[4] = 4'ha;
      expv[5] = 4'h9;
      expv[6] = 4'h9;
      expv[7] = 4'h9;
      expv[8] = 4'h9;
      expv[9] = 4'ha;
      expv[10] = 4'ha;
      expv[11] = 4'h9;
      expv[12] = 4'h9;
      expv[13] = 4'ha;
      expv[14] = 4'h9;
      expv[15] = 4'ha;
      expv[16] = 4'h9;
      expv[17] = 4'ha;
      expv[18] = 4'h9;
      expv[19] = 4'ha;
      expv[20] = 4'ha;
      expv[21] = 4'h9;
      expv[22] = 4'ha;
      expv[23] = 4'ha;
      expv[24] = 4'h2;
      expv[25] = 4'h1;
      expv[26] = 4'h1;
      expv[27] = 4'h2;
      expv[28] = 4'h1;
      expv[29] = 4'h1;
      expv[30] = 4'h2;
      expv[31] = 4'h2;
      expv[32] = 4'h1;
      expv[33] = 4'h1;
      expv[34] = 4'h2;
      expv[35] = 4'h1;
      expv[36] = 4'h1;
      expv[37] = 4'h2;
      expv[38] = 4'h1;
      expv[39] = 4'h2;
      expv[40] = 4'h1;
      expv[41] = 4'h2;
      expv[42] = 4'h1;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'h2;
      expv[46] = 4'h1;
      expv[47] = 4'h1;
      expv[48] = 4'h1;
      expv[49] = 4'h1;
      expv[50] = 4'h1;
      expv[51] = 4'h1;
      expv[52] = 4'h1;
      expv[53] = 4'h2;
      expv[54] = 4'h2;
      expv[55] = 4'h1;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'h1;
      expv[59] = 4'h2;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
