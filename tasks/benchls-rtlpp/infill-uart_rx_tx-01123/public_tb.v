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

  rtlpp_01123 dut (
    .clk(clk),
    .rstn(in_vec[10:10]),
    .rx(in_vec[9:9]),
    .transmit(in_vec[8:8]),
    .tx_byte(in_vec[7:0]),
    .tx(out_vec[12:12]),
    .received(out_vec[11:11]),
    .rx_byte(out_vec[10:3]),
    .is_receiving(out_vec[2:2]),
    .is_transmitting(out_vec[1:1]),
    .recv_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h01f;
    stim[1] = 11'h3d5;
    stim[2] = 11'h4e6;
    stim[3] = 11'h6be;
    stim[4] = 11'h54c;
    stim[5] = 11'h61d;
    stim[6] = 11'h780;
    stim[7] = 11'h5b3;
    stim[8] = 11'h500;
    stim[9] = 11'h5a6;
    stim[10] = 11'h41f;
    stim[11] = 11'h56c;
    stim[12] = 11'h7bd;
    stim[13] = 11'h437;
    stim[14] = 11'h644;
    stim[15] = 11'h5be;
    stim[16] = 11'h4ee;
    stim[17] = 11'h475;
    stim[18] = 11'h7fc;
    stim[19] = 11'h60c;
    stim[20] = 11'h4a6;
    stim[21] = 11'h64d;
    stim[22] = 11'h458;
    stim[23] = 11'h642;
    stim[24] = 11'h50f;
    stim[25] = 11'h6f9;
    stim[26] = 11'h6ce;
    stim[27] = 11'h34f;
    stim[28] = 11'h6d1;
    stim[29] = 11'h4a7;
    stim[30] = 11'h5f9;
    stim[31] = 11'h75b;
    stim[32] = 11'h416;
    stim[33] = 11'h7fe;
    stim[34] = 11'h493;
    stim[35] = 11'h460;
    stim[36] = 11'h6d6;
    stim[37] = 11'h5c6;
    stim[38] = 11'h6a5;
    stim[39] = 11'h5ca;
    stim[40] = 11'h5b9;
    stim[41] = 11'h66a;
    stim[42] = 11'h665;
    stim[43] = 11'h5ee;
    stim[44] = 11'h40f;
    stim[45] = 11'h609;
    stim[46] = 11'h669;
    stim[47] = 11'h642;
    stim[48] = 11'h73e;
    stim[49] = 11'h40b;
    stim[50] = 11'h497;
    stim[51] = 11'h431;
    stim[52] = 11'h45b;
    stim[53] = 11'h79a;
    stim[54] = 11'h7a7;
    stim[55] = 11'h6c1;
    stim[56] = 11'h7c8;
    stim[57] = 11'h795;
    stim[58] = 11'h77c;
    stim[59] = 11'h54d;
    stim[60] = 11'h679;
    stim[61] = 11'h71c;
    stim[62] = 11'h44a;
    stim[63] = 11'h4c4;
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
      expv[0] = 13'h1000;
      expv[1] = 13'h1000;
      expv[2] = 13'h1000;
      expv[3] = 13'h1004;
      expv[4] = 13'h1004;
      expv[5] = 13'h0006;
      expv[6] = 13'h0006;
      expv[7] = 13'h0006;
      expv[8] = 13'h0006;
      expv[9] = 13'h0006;
      expv[10] = 13'h0006;
      expv[11] = 13'h0006;
      expv[12] = 13'h0006;
      expv[13] = 13'h0006;
      expv[14] = 13'h0006;
      expv[15] = 13'h0006;
      expv[16] = 13'h0006;
      expv[17] = 13'h0006;
      expv[18] = 13'h0006;
      expv[19] = 13'h0006;
      expv[20] = 13'h0006;
      expv[21] = 13'h0006;
      expv[22] = 13'h0006;
      expv[23] = 13'h0006;
      expv[24] = 13'h0006;
      expv[25] = 13'h0006;
      expv[26] = 13'h0006;
      expv[27] = 13'h1000;
      expv[28] = 13'h1000;
      expv[29] = 13'h1000;
      expv[30] = 13'h1004;
      expv[31] = 13'h0006;
      expv[32] = 13'h0006;
      expv[33] = 13'h0006;
      expv[34] = 13'h0006;
      expv[35] = 13'h0006;
      expv[36] = 13'h0006;
      expv[37] = 13'h0006;
      expv[38] = 13'h0006;
      expv[39] = 13'h0006;
      expv[40] = 13'h0006;
      expv[41] = 13'h0006;
      expv[42] = 13'h0006;
      expv[43] = 13'h0006;
      expv[44] = 13'h0006;
      expv[45] = 13'h0006;
      expv[46] = 13'h0006;
      expv[47] = 13'h0006;
      expv[48] = 13'h0006;
      expv[49] = 13'h0006;
      expv[50] = 13'h0006;
      expv[51] = 13'h0006;
      expv[52] = 13'h0006;
      expv[53] = 13'h0006;
      expv[54] = 13'h0006;
      expv[55] = 13'h0006;
      expv[56] = 13'h0006;
      expv[57] = 13'h0006;
      expv[58] = 13'h0006;
      expv[59] = 13'h0006;
      expv[60] = 13'h0006;
      expv[61] = 13'h0006;
      expv[62] = 13'h0006;
      expv[63] = 13'h0006;
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
