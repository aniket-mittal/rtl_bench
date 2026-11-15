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

  rtlpp_00171 dut (
    .clk_uart_x4(clk),
    .rst(in_vec[10:10]),
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
    stim[0] = 11'h4d2;
    stim[1] = 11'h48f;
    stim[2] = 11'h3f4;
    stim[3] = 11'h03c;
    stim[4] = 11'h172;
    stim[5] = 11'h20a;
    stim[6] = 11'h0df;
    stim[7] = 11'h0e2;
    stim[8] = 11'h236;
    stim[9] = 11'h3cf;
    stim[10] = 11'h39e;
    stim[11] = 11'h37a;
    stim[12] = 11'h2e8;
    stim[13] = 11'h357;
    stim[14] = 11'h30f;
    stim[15] = 11'h178;
    stim[16] = 11'h185;
    stim[17] = 11'h0ba;
    stim[18] = 11'h132;
    stim[19] = 11'h38b;
    stim[20] = 11'h0d3;
    stim[21] = 11'h19e;
    stim[22] = 11'h11d;
    stim[23] = 11'h1e6;
    stim[24] = 11'h144;
    stim[25] = 11'h3e9;
    stim[26] = 11'h339;
    stim[27] = 11'h0d7;
    stim[28] = 11'h249;
    stim[29] = 11'h1c8;
    stim[30] = 11'h160;
    stim[31] = 11'h3f4;
    stim[32] = 11'h15a;
    stim[33] = 11'h212;
    stim[34] = 11'h33e;
    stim[35] = 11'h249;
    stim[36] = 11'h367;
    stim[37] = 11'h29b;
    stim[38] = 11'h00e;
    stim[39] = 11'h2b7;
    stim[40] = 11'h338;
    stim[41] = 11'h3e9;
    stim[42] = 11'h155;
    stim[43] = 11'h184;
    stim[44] = 11'h0c0;
    stim[45] = 11'h065;
    stim[46] = 11'h014;
    stim[47] = 11'h09d;
    stim[48] = 11'h308;
    stim[49] = 11'h12c;
    stim[50] = 11'h3e1;
    stim[51] = 11'h326;
    stim[52] = 11'h0a5;
    stim[53] = 11'h2f9;
    stim[54] = 11'h22a;
    stim[55] = 11'h017;
    stim[56] = 11'h0b2;
    stim[57] = 11'h116;
    stim[58] = 11'h016;
    stim[59] = 11'h153;
    stim[60] = 11'h31a;
    stim[61] = 11'h23d;
    stim[62] = 11'h2a9;
    stim[63] = 11'h016;
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
      expv[3] = 13'h0002;
      expv[4] = 13'h0006;
      expv[5] = 13'h0006;
      expv[6] = 13'h0006;
      expv[7] = 13'h0006;
      expv[8] = 13'h0006;
      expv[9] = 13'h0006;
      expv[10] = 13'h0006;
      expv[11] = 13'h0006;
      expv[12] = 13'h0406;
      expv[13] = 13'h0406;
      expv[14] = 13'h0406;
      expv[15] = 13'h0406;
      expv[16] = 13'h0406;
      expv[17] = 13'h0206;
      expv[18] = 13'h1206;
      expv[19] = 13'h1206;
      expv[20] = 13'h1206;
      expv[21] = 13'h1206;
      expv[22] = 13'h1106;
      expv[23] = 13'h0106;
      expv[24] = 13'h0106;
      expv[25] = 13'h0106;
      expv[26] = 13'h0106;
      expv[27] = 13'h0486;
      expv[28] = 13'h1486;
      expv[29] = 13'h1486;
      expv[30] = 13'h1486;
      expv[31] = 13'h1486;
      expv[32] = 13'h1646;
      expv[33] = 13'h1646;
      expv[34] = 13'h1646;
      expv[35] = 13'h1646;
      expv[36] = 13'h1646;
      expv[37] = 13'h1726;
      expv[38] = 13'h1726;
      expv[39] = 13'h1726;
      expv[40] = 13'h1726;
      expv[41] = 13'h1726;
      expv[42] = 13'h1796;
      expv[43] = 13'h1796;
      expv[44] = 13'h1796;
      expv[45] = 13'h1796;
      expv[46] = 13'h1796;
      expv[47] = 13'h13ce;
      expv[48] = 13'h13ce;
      expv[49] = 13'h13ce;
      expv[50] = 13'h13ce;
      expv[51] = 13'h13ce;
      expv[52] = 13'h15e6;
      expv[53] = 13'h15e6;
      expv[54] = 13'h15e6;
      expv[55] = 13'h15e6;
      expv[56] = 13'h15e6;
      expv[57] = 13'h15e5;
      expv[58] = 13'h05e6;
      expv[59] = 13'h05e6;
      expv[60] = 13'h05e6;
      expv[61] = 13'h05e6;
      expv[62] = 13'h05e6;
      expv[63] = 13'h05e6;
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
