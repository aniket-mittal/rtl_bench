// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05752 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h118bc5;
    stim[1] = 22'h34e872;
    stim[2] = 22'h0385d4;
    stim[3] = 22'h2ed6e2;
    stim[4] = 22'h3b69ed;
    stim[5] = 22'h0a2c5c;
    stim[6] = 22'h23d902;
    stim[7] = 22'h1b5332;
    stim[8] = 22'h02b6ce;
    stim[9] = 22'h0ad0fa;
    stim[10] = 22'h3f775d;
    stim[11] = 22'h13b240;
    stim[12] = 22'h23ac54;
    stim[13] = 22'h035e6a;
    stim[14] = 22'h0f707b;
    stim[15] = 22'h06e4e3;
    stim[16] = 22'h2ee6f0;
    stim[17] = 22'h13aabc;
    stim[18] = 22'h263d63;
    stim[19] = 22'h32ea44;
    stim[20] = 22'h1bd8a5;
    stim[21] = 22'h0a8e12;
    stim[22] = 22'h227302;
    stim[23] = 22'h3ec536;
    stim[24] = 22'h3e514a;
    stim[25] = 22'h0b41a5;
    stim[26] = 22'h05b5c3;
    stim[27] = 22'h1b5433;
    stim[28] = 22'h1696c0;
    stim[29] = 22'h235e23;
    stim[30] = 22'h0250a5;
    stim[31] = 22'h32a55f;
    stim[32] = 22'h026fae;
    stim[33] = 22'h394b72;
    stim[34] = 22'h1a2401;
    stim[35] = 22'h026411;
    stim[36] = 22'h0b7c8d;
    stim[37] = 22'h07dd51;
    stim[38] = 22'h36b47b;
    stim[39] = 22'h09c0f0;
    stim[40] = 22'h235f94;
    stim[41] = 22'h0bdc4f;
    stim[42] = 22'h16e685;
    stim[43] = 22'h0f8160;
    stim[44] = 22'h2bcb24;
    stim[45] = 22'h2350da;
    stim[46] = 22'h279e9a;
    stim[47] = 22'h1b913e;
    stim[48] = 22'h3bedff;
    stim[49] = 22'h0eb1b5;
    stim[50] = 22'h1fd268;
    stim[51] = 22'h1a571a;
    stim[52] = 22'h17ee84;
    stim[53] = 22'h0b1e8c;
    stim[54] = 22'h3bb608;
    stim[55] = 22'h32e51e;
    stim[56] = 22'h2b757a;
    stim[57] = 22'h0ac52f;
    stim[58] = 22'h27cf0a;
    stim[59] = 22'h17c947;
    stim[60] = 22'h03bfdc;
    stim[61] = 22'h322bb4;
    stim[62] = 22'h3faead;
    stim[63] = 22'h2e7b27;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h0c34f;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h0c34f;
      expv[13] = 17'h0c34f;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h0c34f;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h0e685;
      expv[54] = 17'h00005;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00005;
      expv[59] = 17'h00000;
      expv[60] = 17'h0e685;
      expv[61] = 17'h00002;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
