// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161526 dut (
    .clk(clk),
    .rst(in_vec[21:21]),
    .period_flag(in_vec[20:20]),
    .signI(in_vec[19:19]),
    .vc_level(in_vec[18:16]),
    .vc1(in_vec[15:8]),
    .vc2(in_vec[7:0]),
    .Fo(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h30d88a;
    stim[1] = 22'h2acf69;
    stim[2] = 22'h1df7ad;
    stim[3] = 22'h0e3264;
    stim[4] = 22'h035091;
    stim[5] = 22'h0ffd8e;
    stim[6] = 22'h010a0d;
    stim[7] = 22'h1436c8;
    stim[8] = 22'h08c57c;
    stim[9] = 22'h1ea5f0;
    stim[10] = 22'h067514;
    stim[11] = 22'h14cb30;
    stim[12] = 22'h1e2eec;
    stim[13] = 22'h158582;
    stim[14] = 22'h1e950d;
    stim[15] = 22'h127e7e;
    stim[16] = 22'h189889;
    stim[17] = 22'h104e67;
    stim[18] = 22'h16afe5;
    stim[19] = 22'h0c6b62;
    stim[20] = 22'h0ddc16;
    stim[21] = 22'h1e603c;
    stim[22] = 22'h1556c3;
    stim[23] = 22'h13c110;
    stim[24] = 22'h1a679b;
    stim[25] = 22'h054a13;
    stim[26] = 22'h1a51ee;
    stim[27] = 22'h058a01;
    stim[28] = 22'h0632ed;
    stim[29] = 22'h0a6661;
    stim[30] = 22'h1b1602;
    stim[31] = 22'h0151df;
    stim[32] = 22'h1fbf46;
    stim[33] = 22'h058c56;
    stim[34] = 22'h11d641;
    stim[35] = 22'h1dc3e0;
    stim[36] = 22'h06c9ae;
    stim[37] = 22'h0f1122;
    stim[38] = 22'h08f8f6;
    stim[39] = 22'h0615ce;
    stim[40] = 22'h105495;
    stim[41] = 22'h18061b;
    stim[42] = 22'h150491;
    stim[43] = 22'h043c1f;
    stim[44] = 22'h2d7777;
    stim[45] = 22'h0e88d3;
    stim[46] = 22'h023047;
    stim[47] = 22'h1c24e5;
    stim[48] = 22'h0ed499;
    stim[49] = 22'h15b399;
    stim[50] = 22'h0958d5;
    stim[51] = 22'h0415d2;
    stim[52] = 22'h063e92;
    stim[53] = 22'h1f89ce;
    stim[54] = 22'h146dd8;
    stim[55] = 22'h1b88db;
    stim[56] = 22'h1dce70;
    stim[57] = 22'h19edf8;
    stim[58] = 22'h0a28a8;
    stim[59] = 22'h166597;
    stim[60] = 22'h094915;
    stim[61] = 22'h2d9608;
    stim[62] = 22'h08491d;
    stim[63] = 22'h19f31a;
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
      expv[0] = 4'hx;
      expv[1] = 4'ha;
      expv[2] = 4'ha;
      expv[3] = 4'ha;
      expv[4] = 4'ha;
      expv[5] = 4'ha;
      expv[6] = 4'ha;
      expv[7] = 4'ha;
      expv[8] = 4'ha;
      expv[9] = 4'ha;
      expv[10] = 4'ha;
      expv[11] = 4'ha;
      expv[12] = 4'ha;
      expv[13] = 4'ha;
      expv[14] = 4'ha;
      expv[15] = 4'ha;
      expv[16] = 4'h0;
      expv[17] = 4'h5;
      expv[18] = 4'h5;
      expv[19] = 4'h5;
      expv[20] = 4'h5;
      expv[21] = 4'h5;
      expv[22] = 4'h5;
      expv[23] = 4'h5;
      expv[24] = 4'hb;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h1;
      expv[36] = 4'h1;
      expv[37] = 4'h1;
      expv[38] = 4'h1;
      expv[39] = 4'h1;
      expv[40] = 4'h1;
      expv[41] = 4'h5;
      expv[42] = 4'h5;
      expv[43] = 4'h5;
      expv[44] = 4'h5;
      expv[45] = 4'h5;
      expv[46] = 4'h5;
      expv[47] = 4'h5;
      expv[48] = 4'ha;
      expv[49] = 4'ha;
      expv[50] = 4'ha;
      expv[51] = 4'ha;
      expv[52] = 4'ha;
      expv[53] = 4'ha;
      expv[54] = 4'ha;
      expv[55] = 4'ha;
      expv[56] = 4'h8;
      expv[57] = 4'h8;
      expv[58] = 4'hd;
      expv[59] = 4'hd;
      expv[60] = 4'hd;
      expv[61] = 4'hd;
      expv[62] = 4'hd;
      expv[63] = 4'hd;
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
