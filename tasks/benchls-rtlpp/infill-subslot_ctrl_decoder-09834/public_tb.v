// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09834 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .rx_byte_start(in_vec[10:10]),
    .rx_byte_stop(in_vec[9:9]),
    .rx_byte_rdy(in_vec[8:8]),
    .rx_byte_d(in_vec[7:0]),
    .subslot_ctrl(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc30;
    stim[1] = 12'hd4f;
    stim[2] = 12'h458;
    stim[3] = 12'h5de;
    stim[4] = 12'h285;
    stim[5] = 12'h074;
    stim[6] = 12'h2c5;
    stim[7] = 12'h7d8;
    stim[8] = 12'h577;
    stim[9] = 12'h15c;
    stim[10] = 12'h592;
    stim[11] = 12'h1fd;
    stim[12] = 12'h140;
    stim[13] = 12'h4ee;
    stim[14] = 12'h5ad;
    stim[15] = 12'h132;
    stim[16] = 12'h1ff;
    stim[17] = 12'h452;
    stim[18] = 12'h2d2;
    stim[19] = 12'h31a;
    stim[20] = 12'h55f;
    stim[21] = 12'h220;
    stim[22] = 12'h5f0;
    stim[23] = 12'h1f4;
    stim[24] = 12'h25f;
    stim[25] = 12'h42b;
    stim[26] = 12'ha23;
    stim[27] = 12'h796;
    stim[28] = 12'h70b;
    stim[29] = 12'h638;
    stim[30] = 12'h6a7;
    stim[31] = 12'h097;
    stim[32] = 12'h57e;
    stim[33] = 12'h78b;
    stim[34] = 12'h396;
    stim[35] = 12'h4fa;
    stim[36] = 12'ha27;
    stim[37] = 12'h41c;
    stim[38] = 12'h6b9;
    stim[39] = 12'h35a;
    stim[40] = 12'h3cf;
    stim[41] = 12'h314;
    stim[42] = 12'h185;
    stim[43] = 12'h3c2;
    stim[44] = 12'h6d1;
    stim[45] = 12'h4f6;
    stim[46] = 12'h37e;
    stim[47] = 12'h78c;
    stim[48] = 12'h482;
    stim[49] = 12'h038;
    stim[50] = 12'h675;
    stim[51] = 12'h74d;
    stim[52] = 12'h14a;
    stim[53] = 12'h0e0;
    stim[54] = 12'h497;
    stim[55] = 12'h610;
    stim[56] = 12'h699;
    stim[57] = 12'h79f;
    stim[58] = 12'h382;
    stim[59] = 12'h08b;
    stim[60] = 12'h78c;
    stim[61] = 12'h0a5;
    stim[62] = 12'h47e;
    stim[63] = 12'h51d;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h0xx;
      expv[2] = 9'h0xx;
      expv[3] = 9'h0xx;
      expv[4] = 9'h0xx;
      expv[5] = 9'h0xx;
      expv[6] = 9'h0xx;
      expv[7] = 9'h0xx;
      expv[8] = 9'h0xx;
      expv[9] = 9'h0xx;
      expv[10] = 9'h0xx;
      expv[11] = 9'h0xx;
      expv[12] = 9'h0xx;
      expv[13] = 9'h0xx;
      expv[14] = 9'h0xx;
      expv[15] = 9'h0xx;
      expv[16] = 9'h0xx;
      expv[17] = 9'h0xx;
      expv[18] = 9'h0xx;
      expv[19] = 9'h0xx;
      expv[20] = 9'h0xx;
      expv[21] = 9'h0xx;
      expv[22] = 9'h0xx;
      expv[23] = 9'h0xx;
      expv[24] = 9'h0xx;
      expv[25] = 9'h0xx;
      expv[26] = 9'h0xx;
      expv[27] = 9'h0xx;
      expv[28] = 9'h0xx;
      expv[29] = 9'h0xx;
      expv[30] = 9'h0xx;
      expv[31] = 9'h0xx;
      expv[32] = 9'h0xx;
      expv[33] = 9'h0xx;
      expv[34] = 9'h0xx;
      expv[35] = 9'h0xx;
      expv[36] = 9'h0xx;
      expv[37] = 9'h0xx;
      expv[38] = 9'h0xx;
      expv[39] = 9'h0xx;
      expv[40] = 9'h0xx;
      expv[41] = 9'h0xx;
      expv[42] = 9'h0xx;
      expv[43] = 9'h0xx;
      expv[44] = 9'h0xx;
      expv[45] = 9'h0xx;
      expv[46] = 9'h0xx;
      expv[47] = 9'h0xx;
      expv[48] = 9'h0xx;
      expv[49] = 9'h0xx;
      expv[50] = 9'h0xx;
      expv[51] = 9'h0xx;
      expv[52] = 9'h0xx;
      expv[53] = 9'h0xx;
      expv[54] = 9'h0xx;
      expv[55] = 9'h0xx;
      expv[56] = 9'h0xx;
      expv[57] = 9'h0xx;
      expv[58] = 9'h0xx;
      expv[59] = 9'h0xx;
      expv[60] = 9'h0xx;
      expv[61] = 9'h0xx;
      expv[62] = 9'h0xx;
      expv[63] = 9'h0xx;
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
