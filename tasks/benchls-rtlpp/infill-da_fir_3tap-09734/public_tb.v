// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09734 dut (
    .clk(clk),
    .reset(in_vec[12:12]),
    .x0_in(in_vec[11:8]),
    .x1_in(in_vec[7:4]),
    .x2_in(in_vec[3:0]),
    .lut(out_vec[10:7]),
    .y(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h105b;
    stim[1] = 13'h1f33;
    stim[2] = 13'h09c5;
    stim[3] = 13'h10b7;
    stim[4] = 13'h096d;
    stim[5] = 13'h06e5;
    stim[6] = 13'h0454;
    stim[7] = 13'h0943;
    stim[8] = 13'h0391;
    stim[9] = 13'h0bc9;
    stim[10] = 13'h00ae;
    stim[11] = 13'h0cfd;
    stim[12] = 13'h0f13;
    stim[13] = 13'h0709;
    stim[14] = 13'h0641;
    stim[15] = 13'h023c;
    stim[16] = 13'h0103;
    stim[17] = 13'h0174;
    stim[18] = 13'h0cf5;
    stim[19] = 13'h0f50;
    stim[20] = 13'h0824;
    stim[21] = 13'h0270;
    stim[22] = 13'h0049;
    stim[23] = 13'h0a72;
    stim[24] = 13'h0542;
    stim[25] = 13'h0965;
    stim[26] = 13'h0c54;
    stim[27] = 13'h0510;
    stim[28] = 13'h00e8;
    stim[29] = 13'h0806;
    stim[30] = 13'h0561;
    stim[31] = 13'h0ba8;
    stim[32] = 13'h0e29;
    stim[33] = 13'h01a1;
    stim[34] = 13'h066c;
    stim[35] = 13'h0ac6;
    stim[36] = 13'h1283;
    stim[37] = 13'h0c71;
    stim[38] = 13'h039a;
    stim[39] = 13'h0fbd;
    stim[40] = 13'h03d0;
    stim[41] = 13'h0ed6;
    stim[42] = 13'h0325;
    stim[43] = 13'h0192;
    stim[44] = 13'h0d0d;
    stim[45] = 13'h0d7c;
    stim[46] = 13'h0751;
    stim[47] = 13'h08c7;
    stim[48] = 13'h0881;
    stim[49] = 13'h0c94;
    stim[50] = 13'h0d1d;
    stim[51] = 13'h0854;
    stim[52] = 13'h09a7;
    stim[53] = 13'h0587;
    stim[54] = 13'h00a5;
    stim[55] = 13'h0b0f;
    stim[56] = 13'h06c7;
    stim[57] = 13'h09a3;
    stim[58] = 13'h0ec1;
    stim[59] = 13'h0b47;
    stim[60] = 13'h052a;
    stim[61] = 13'h048a;
    stim[62] = 13'h0472;
    stim[63] = 13'h0835;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h280;
      expv[6] = 11'h100;
      expv[7] = 11'h300;
      expv[8] = 11'h280;
      expv[9] = 11'h280;
      expv[10] = 11'h2f9;
      expv[11] = 11'h079;
      expv[12] = 11'h379;
      expv[13] = 11'h279;
      expv[14] = 11'h379;
      expv[15] = 11'h379;
      expv[16] = 11'h36c;
      expv[17] = 11'h2ec;
      expv[18] = 11'h26c;
      expv[19] = 11'h06c;
      expv[20] = 11'h06c;
      expv[21] = 11'h06c;
      expv[22] = 11'h00d;
      expv[23] = 11'h20d;
      expv[24] = 11'h00d;
      expv[25] = 11'h10d;
      expv[26] = 11'h20d;
      expv[27] = 11'h20d;
      expv[28] = 11'h26c;
      expv[29] = 11'h06c;
      expv[30] = 11'h16c;
      expv[31] = 11'h16c;
      expv[32] = 11'h36c;
      expv[33] = 11'h36c;
      expv[34] = 11'h35c;
      expv[35] = 11'h05c;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h300;
      expv[39] = 11'h100;
      expv[40] = 11'h180;
      expv[41] = 11'h080;
      expv[42] = 11'h080;
      expv[43] = 11'h08e;
      expv[44] = 11'h18e;
      expv[45] = 11'h20e;
      expv[46] = 11'h00e;
      expv[47] = 11'h10e;
      expv[48] = 11'h10e;
      expv[49] = 11'h17b;
      expv[50] = 11'h17b;
      expv[51] = 11'h07b;
      expv[52] = 11'h2fb;
      expv[53] = 11'h1fb;
      expv[54] = 11'h1fb;
      expv[55] = 11'h1fe;
      expv[56] = 11'h2fe;
      expv[57] = 11'h2fe;
      expv[58] = 11'h27e;
      expv[59] = 11'h2fe;
      expv[60] = 11'h2fe;
      expv[61] = 11'h2f7;
      expv[62] = 11'h077;
      expv[63] = 11'h277;
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
