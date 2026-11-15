// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05869 dut (
    .clk(clk),
    .resetq(in_vec[11:11]),
    .rx(in_vec[10:10]),
    .rd(in_vec[9:9]),
    .wr(in_vec[8:8]),
    .tx_data(in_vec[7:0]),
    .tx(out_vec[10:10]),
    .valid(out_vec[9:9]),
    .busy(out_vec[8:8]),
    .rx_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb81;
    stim[1] = 12'h9d7;
    stim[2] = 12'h7d5;
    stim[3] = 12'h44c;
    stim[4] = 12'h698;
    stim[5] = 12'h201;
    stim[6] = 12'h48f;
    stim[7] = 12'h62d;
    stim[8] = 12'h33d;
    stim[9] = 12'h4e7;
    stim[10] = 12'h6bd;
    stim[11] = 12'h7b0;
    stim[12] = 12'h5e6;
    stim[13] = 12'h30c;
    stim[14] = 12'h679;
    stim[15] = 12'h0ee;
    stim[16] = 12'h574;
    stim[17] = 12'h3e7;
    stim[18] = 12'h761;
    stim[19] = 12'h4de;
    stim[20] = 12'h608;
    stim[21] = 12'h7dc;
    stim[22] = 12'h200;
    stim[23] = 12'h70c;
    stim[24] = 12'h3cf;
    stim[25] = 12'h086;
    stim[26] = 12'h7f8;
    stim[27] = 12'hef9;
    stim[28] = 12'h63a;
    stim[29] = 12'h3ae;
    stim[30] = 12'h45d;
    stim[31] = 12'h514;
    stim[32] = 12'h4c4;
    stim[33] = 12'h2c1;
    stim[34] = 12'h356;
    stim[35] = 12'h5ae;
    stim[36] = 12'h45b;
    stim[37] = 12'h067;
    stim[38] = 12'h351;
    stim[39] = 12'h491;
    stim[40] = 12'h378;
    stim[41] = 12'h698;
    stim[42] = 12'h19e;
    stim[43] = 12'h12b;
    stim[44] = 12'h3ce;
    stim[45] = 12'h387;
    stim[46] = 12'h174;
    stim[47] = 12'h3a2;
    stim[48] = 12'h703;
    stim[49] = 12'h6eb;
    stim[50] = 12'h727;
    stim[51] = 12'h790;
    stim[52] = 12'h752;
    stim[53] = 12'h63f;
    stim[54] = 12'h63c;
    stim[55] = 12'h334;
    stim[56] = 12'h028;
    stim[57] = 12'h109;
    stim[58] = 12'h2ba;
    stim[59] = 12'h643;
    stim[60] = 12'h5c0;
    stim[61] = 12'h14c;
    stim[62] = 12'h1b8;
    stim[63] = 12'h4d2;
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
      expv[0] = 11'h4xx;
      expv[1] = 11'h1xx;
      expv[2] = 11'h1xx;
      expv[3] = 11'h0xx;
      expv[4] = 11'h0xx;
      expv[5] = 11'h0xx;
      expv[6] = 11'h0xx;
      expv[7] = 11'h0xx;
      expv[8] = 11'h0xx;
      expv[9] = 11'h0xx;
      expv[10] = 11'h0xx;
      expv[11] = 11'h0xx;
      expv[12] = 11'h0xx;
      expv[13] = 11'h0xx;
      expv[14] = 11'h0xx;
      expv[15] = 11'h0xx;
      expv[16] = 11'h0xx;
      expv[17] = 11'h0xx;
      expv[18] = 11'h0xx;
      expv[19] = 11'h0xx;
      expv[20] = 11'h0xx;
      expv[21] = 11'h0xx;
      expv[22] = 11'h0xx;
      expv[23] = 11'h0xx;
      expv[24] = 11'h0xx;
      expv[25] = 11'h0xx;
      expv[26] = 11'h0xx;
      expv[27] = 11'h0xx;
      expv[28] = 11'h0xx;
      expv[29] = 11'h0xx;
      expv[30] = 11'h0xx;
      expv[31] = 11'h0xx;
      expv[32] = 11'h0xx;
      expv[33] = 11'h0xx;
      expv[34] = 11'h0xx;
      expv[35] = 11'h0xx;
      expv[36] = 11'h0xx;
      expv[37] = 11'h0xx;
      expv[38] = 11'h0xx;
      expv[39] = 11'h0xx;
      expv[40] = 11'h0xx;
      expv[41] = 11'h0xx;
      expv[42] = 11'h0xx;
      expv[43] = 11'h0xx;
      expv[44] = 11'h0xx;
      expv[45] = 11'h0xx;
      expv[46] = 11'h0xx;
      expv[47] = 11'h0xx;
      expv[48] = 11'h0xx;
      expv[49] = 11'h0xx;
      expv[50] = 11'h0xx;
      expv[51] = 11'h0xx;
      expv[52] = 11'h0xx;
      expv[53] = 11'h0xx;
      expv[54] = 11'h0xx;
      expv[55] = 11'h0xx;
      expv[56] = 11'h0xx;
      expv[57] = 11'h0xx;
      expv[58] = 11'h0xx;
      expv[59] = 11'h0xx;
      expv[60] = 11'h0xx;
      expv[61] = 11'h0xx;
      expv[62] = 11'h0xx;
      expv[63] = 11'h0xx;
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
