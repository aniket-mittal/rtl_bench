// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167265 dut (
    .sel(in_vec[14:12]),
    .out_ack_reset_0(in_vec[11:11]),
    .out_ack_reset_1(in_vec[10:10]),
    .out_ack_reset_2(in_vec[9:9]),
    .out_ack_reset_3(in_vec[8:8]),
    .out_ack_reset_4(in_vec[7:7]),
    .out_ack_reset_5(in_vec[6:6]),
    .packet_drop_signal_0(in_vec[5:5]),
    .packet_drop_signal_1(in_vec[4:4]),
    .packet_drop_signal_2(in_vec[3:3]),
    .packet_drop_signal_3(in_vec[2:2]),
    .packet_drop_signal_4(in_vec[1:1]),
    .packet_drop_signal_5(in_vec[0:0]),
    .out_ack_reset_out(out_vec[1:1]),
    .packet_drop_signal_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h49d9;
    stim[1] = 15'h0b27;
    stim[2] = 15'h72fd;
    stim[3] = 15'h158a;
    stim[4] = 15'h5f2c;
    stim[5] = 15'h5616;
    stim[6] = 15'h670b;
    stim[7] = 15'h751c;
    stim[8] = 15'h03f0;
    stim[9] = 15'h7408;
    stim[10] = 15'h263c;
    stim[11] = 15'h225c;
    stim[12] = 15'h37eb;
    stim[13] = 15'h330c;
    stim[14] = 15'h175e;
    stim[15] = 15'h52b3;
    stim[16] = 15'h0a5f;
    stim[17] = 15'h52df;
    stim[18] = 15'h61fe;
    stim[19] = 15'h5664;
    stim[20] = 15'h60de;
    stim[21] = 15'h46e9;
    stim[22] = 15'h5160;
    stim[23] = 15'h4650;
    stim[24] = 15'h2709;
    stim[25] = 15'h3303;
    stim[26] = 15'h1033;
    stim[27] = 15'h055d;
    stim[28] = 15'h7082;
    stim[29] = 15'h3678;
    stim[30] = 15'h255b;
    stim[31] = 15'h67e7;
    stim[32] = 15'h5468;
    stim[33] = 15'h1424;
    stim[34] = 15'h1697;
    stim[35] = 15'h5355;
    stim[36] = 15'h5316;
    stim[37] = 15'h70ce;
    stim[38] = 15'h738b;
    stim[39] = 15'h04e5;
    stim[40] = 15'h37f5;
    stim[41] = 15'h1701;
    stim[42] = 15'h0039;
    stim[43] = 15'h440d;
    stim[44] = 15'h709e;
    stim[45] = 15'h1739;
    stim[46] = 15'h41fe;
    stim[47] = 15'h1512;
    stim[48] = 15'h337c;
    stim[49] = 15'h4714;
    stim[50] = 15'h1719;
    stim[51] = 15'h53e2;
    stim[52] = 15'h61b0;
    stim[53] = 15'h4296;
    stim[54] = 15'h1607;
    stim[55] = 15'h4454;
    stim[56] = 15'h53d7;
    stim[57] = 15'h46ec;
    stim[58] = 15'h2743;
    stim[59] = 15'h438b;
    stim[60] = 15'h0442;
    stim[61] = 15'h62b2;
    stim[62] = 15'h4023;
    stim[63] = 15'h13ee;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 2'h2;
      expv[1] = 2'h3;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h2;
      expv[13] = 2'h3;
      expv[14] = 2'h3;
      expv[15] = 2'h1;
      expv[16] = 2'h2;
      expv[17] = 2'h3;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h3;
      expv[25] = 2'h2;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h1;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h3;
      expv[41] = 2'h2;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h0;
      expv[50] = 2'h3;
      expv[51] = 2'h2;
      expv[52] = 2'h0;
      expv[53] = 2'h3;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h3;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h3;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h0;
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
