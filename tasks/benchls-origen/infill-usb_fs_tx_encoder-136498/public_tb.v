// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136498 dut (
    .clk(clk),
    .rst0_async(in_vec[13:13]),
    .rst0_sync(in_vec[12:12]),
    .usb_interpack(in_vec[11:11]),
    .encfifo_wr(in_vec[10:10]),
    .encfifo_wdata(in_vec[9:2]),
    .remote_wakeup(in_vec[1:1]),
    .speed(in_vec[0:0]),
    .dtx_plus(out_vec[3:3]),
    .dtx_minus(out_vec[2:2]),
    .dtx_oe(out_vec[1:1]),
    .encfifo_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h396d;
    stim[1] = 14'h39b9;
    stim[2] = 14'h25f3;
    stim[3] = 14'h010a;
    stim[4] = 14'h00cb;
    stim[5] = 14'h2fda;
    stim[6] = 14'h017f;
    stim[7] = 14'h034a;
    stim[8] = 14'h2161;
    stim[9] = 14'h027b;
    stim[10] = 14'h2450;
    stim[11] = 14'h0b48;
    stim[12] = 14'h0f99;
    stim[13] = 14'h2bc8;
    stim[14] = 14'h2c8c;
    stim[15] = 14'h2f48;
    stim[16] = 14'h21a5;
    stim[17] = 14'h03ee;
    stim[18] = 14'h2616;
    stim[19] = 14'h0624;
    stim[20] = 14'h1296;
    stim[21] = 14'h2f31;
    stim[22] = 14'h2adb;
    stim[23] = 14'h21e1;
    stim[24] = 14'h22fa;
    stim[25] = 14'h0411;
    stim[26] = 14'h0a57;
    stim[27] = 14'h21af;
    stim[28] = 14'h2382;
    stim[29] = 14'h2285;
    stim[30] = 14'h247b;
    stim[31] = 14'h38cf;
    stim[32] = 14'h027a;
    stim[33] = 14'h207b;
    stim[34] = 14'h0a94;
    stim[35] = 14'h2513;
    stim[36] = 14'h2760;
    stim[37] = 14'h0daf;
    stim[38] = 14'h19d2;
    stim[39] = 14'h0209;
    stim[40] = 14'h096b;
    stim[41] = 14'h0d5c;
    stim[42] = 14'h2005;
    stim[43] = 14'h2059;
    stim[44] = 14'h28dd;
    stim[45] = 14'h024e;
    stim[46] = 14'h0bc6;
    stim[47] = 14'h0a5a;
    stim[48] = 14'h236d;
    stim[49] = 14'h0360;
    stim[50] = 14'h0bdc;
    stim[51] = 14'h0a0e;
    stim[52] = 14'h0a75;
    stim[53] = 14'h28d1;
    stim[54] = 14'h0ad0;
    stim[55] = 14'h0c89;
    stim[56] = 14'h0197;
    stim[57] = 14'h044a;
    stim[58] = 14'h03ac;
    stim[59] = 14'h0a95;
    stim[60] = 14'h0cd4;
    stim[61] = 14'h051c;
    stim[62] = 14'h0b6f;
    stim[63] = 14'h2b69;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
