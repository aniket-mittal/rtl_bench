// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004808 dut (
    .clock(clk),
    .reset(in_vec[27:27]),
    .req_next(in_vec[26:26]),
    .ack_failed(in_vec[25:25]),
    .dev_address_s(in_vec[24:16]),
    .reg_address_s(in_vec[15:8]),
    .data_s(in_vec[7:0]),
    .send_next_state(out_vec[10:8]),
    .send_byte_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hb50fde8;
    stim[1] = 28'hc184884;
    stim[2] = 28'h2f0c71c;
    stim[3] = 28'h6d9e3da;
    stim[4] = 28'h4b0d634;
    stim[5] = 28'h10f863d;
    stim[6] = 28'h356fa67;
    stim[7] = 28'h5aed793;
    stim[8] = 28'h75987c3;
    stim[9] = 28'h6ebdf57;
    stim[10] = 28'h6876624;
    stim[11] = 28'h6f06d98;
    stim[12] = 28'h6104ce0;
    stim[13] = 28'h51adb75;
    stim[14] = 28'h1e0c6bc;
    stim[15] = 28'h68a3460;
    stim[16] = 28'h0ccd5cc;
    stim[17] = 28'h5dd6dc6;
    stim[18] = 28'h1764955;
    stim[19] = 28'h38b1fc0;
    stim[20] = 28'h232dcad;
    stim[21] = 28'h181b11b;
    stim[22] = 28'h1f50a35;
    stim[23] = 28'h27d33d1;
    stim[24] = 28'h208fef0;
    stim[25] = 28'h45eefce;
    stim[26] = 28'h19d32ac;
    stim[27] = 28'h52684d8;
    stim[28] = 28'h39afa50;
    stim[29] = 28'h53550f1;
    stim[30] = 28'h2defcb8;
    stim[31] = 28'h784d4b4;
    stim[32] = 28'h2253ef8;
    stim[33] = 28'h6188df7;
    stim[34] = 28'h453af5b;
    stim[35] = 28'h5faf59f;
    stim[36] = 28'h6255a70;
    stim[37] = 28'h072169b;
    stim[38] = 28'h4c54098;
    stim[39] = 28'h79a4367;
    stim[40] = 28'h300655b;
    stim[41] = 28'h520eb5e;
    stim[42] = 28'h067e13c;
    stim[43] = 28'h6414427;
    stim[44] = 28'h25f17e2;
    stim[45] = 28'h5521558;
    stim[46] = 28'h7eeb183;
    stim[47] = 28'h75238e8;
    stim[48] = 28'h0ed7be6;
    stim[49] = 28'h2c327c9;
    stim[50] = 28'h563d3d5;
    stim[51] = 28'h298fd43;
    stim[52] = 28'h770154b;
    stim[53] = 28'h060ea60;
    stim[54] = 28'h7677320;
    stim[55] = 28'h1e8ffb4;
    stim[56] = 28'h1f8df3c;
    stim[57] = 28'h283a04d;
    stim[58] = 28'h307a8b1;
    stim[59] = 28'h2ecb727;
    stim[60] = 28'h52de6b6;
    stim[61] = 28'h7efbfc1;
    stim[62] = 28'h5f4d367;
    stim[63] = 28'h6e8d7c9;
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
      expv[0] = 11'h100;
      expv[1] = 11'h100;
      expv[2] = 11'h100;
      expv[3] = 11'h100;
      expv[4] = 11'h100;
      expv[5] = 11'h20e;
      expv[6] = 11'h256;
      expv[7] = 11'h2ae;
      expv[8] = 11'h387;
      expv[9] = 11'h100;
      expv[10] = 11'h100;
      expv[11] = 11'h100;
      expv[12] = 11'h100;
      expv[13] = 11'h100;
      expv[14] = 11'h2e0;
      expv[15] = 11'h28a;
      expv[16] = 11'h100;
      expv[17] = 11'h100;
      expv[18] = 11'h276;
      expv[19] = 11'h28a;
      expv[20] = 11'h232;
      expv[21] = 11'h280;
      expv[22] = 11'h2f4;
      expv[23] = 11'h27c;
      expv[24] = 11'h208;
      expv[25] = 11'h25e;
      expv[26] = 11'h332;
      expv[27] = 11'h384;
      expv[28] = 11'h450;
      expv[29] = 11'h500;
      expv[30] = 11'h6df;
      expv[31] = 11'h685;
      expv[32] = 11'h100;
      expv[33] = 11'h100;
      expv[34] = 11'h100;
      expv[35] = 11'h2fa;
      expv[36] = 11'h35a;
      expv[37] = 11'h100;
      expv[38] = 11'h100;
      expv[39] = 11'h29a;
      expv[40] = 11'h100;
      expv[41] = 11'h100;
      expv[42] = 11'h266;
      expv[43] = 11'h240;
      expv[44] = 11'h100;
      expv[45] = 11'h100;
      expv[46] = 11'h2ee;
      expv[47] = 11'h100;
      expv[48] = 11'h100;
      expv[49] = 11'h100;
      expv[50] = 11'h100;
      expv[51] = 11'h298;
      expv[52] = 11'h270;
      expv[53] = 11'h100;
      expv[54] = 11'h100;
      expv[55] = 11'h100;
      expv[56] = 11'h100;
      expv[57] = 11'h100;
      expv[58] = 11'h100;
      expv[59] = 11'h100;
      expv[60] = 11'h100;
      expv[61] = 11'h2ee;
      expv[62] = 11'h100;
      expv[63] = 11'h2e8;
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
