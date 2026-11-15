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

  rtlpp_08787 dut (
    .clk(clk),
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
    stim[0] = 11'h560;
    stim[1] = 11'h656;
    stim[2] = 11'h29f;
    stim[3] = 11'h0e1;
    stim[4] = 11'h04f;
    stim[5] = 11'h29d;
    stim[6] = 11'h0cc;
    stim[7] = 11'h19e;
    stim[8] = 11'h270;
    stim[9] = 11'h2a5;
    stim[10] = 11'h361;
    stim[11] = 11'h03f;
    stim[12] = 11'h187;
    stim[13] = 11'h159;
    stim[14] = 11'h090;
    stim[15] = 11'h21a;
    stim[16] = 11'h088;
    stim[17] = 11'h05c;
    stim[18] = 11'h281;
    stim[19] = 11'h21c;
    stim[20] = 11'h10e;
    stim[21] = 11'h1e8;
    stim[22] = 11'h0dc;
    stim[23] = 11'h155;
    stim[24] = 11'h0a4;
    stim[25] = 11'h026;
    stim[26] = 11'h0de;
    stim[27] = 11'h33f;
    stim[28] = 11'h3c1;
    stim[29] = 11'h05c;
    stim[30] = 11'h338;
    stim[31] = 11'h198;
    stim[32] = 11'h17e;
    stim[33] = 11'h379;
    stim[34] = 11'h30f;
    stim[35] = 11'h3cb;
    stim[36] = 11'h183;
    stim[37] = 11'h3ef;
    stim[38] = 11'h090;
    stim[39] = 11'h35f;
    stim[40] = 11'h11b;
    stim[41] = 11'h2f1;
    stim[42] = 11'h041;
    stim[43] = 11'h2d9;
    stim[44] = 11'h27d;
    stim[45] = 11'h0e4;
    stim[46] = 11'h2cb;
    stim[47] = 11'h0bc;
    stim[48] = 11'h172;
    stim[49] = 11'h30e;
    stim[50] = 11'h23f;
    stim[51] = 11'h080;
    stim[52] = 11'h035;
    stim[53] = 11'h286;
    stim[54] = 11'h21d;
    stim[55] = 11'h13e;
    stim[56] = 11'h270;
    stim[57] = 11'h034;
    stim[58] = 11'h266;
    stim[59] = 11'h3fb;
    stim[60] = 11'h053;
    stim[61] = 11'h2e7;
    stim[62] = 11'h066;
    stim[63] = 11'h27e;
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
      expv[0] = 13'hx000;
      expv[1] = 13'hx000;
      expv[2] = 13'hx000;
      expv[3] = 13'hx000;
      expv[4] = 13'hx000;
      expv[5] = 13'hx004;
      expv[6] = 13'hx004;
      expv[7] = 13'hx004;
      expv[8] = 13'hx006;
      expv[9] = 13'hx006;
      expv[10] = 13'hx006;
      expv[11] = 13'hx006;
      expv[12] = 13'hx006;
      expv[13] = 13'hx006;
      expv[14] = 13'hx006;
      expv[15] = 13'hx006;
      expv[16] = 13'hx006;
      expv[17] = 13'hx006;
      expv[18] = 13'hx006;
      expv[19] = 13'hx006;
      expv[20] = 13'hx006;
      expv[21] = 13'hx006;
      expv[22] = 13'hx006;
      expv[23] = 13'hx006;
      expv[24] = 13'hx006;
      expv[25] = 13'hx006;
      expv[26] = 13'hx006;
      expv[27] = 13'hx006;
      expv[28] = 13'hx006;
      expv[29] = 13'hx006;
      expv[30] = 13'hx006;
      expv[31] = 13'hx006;
      expv[32] = 13'hx006;
      expv[33] = 13'hx006;
      expv[34] = 13'hx006;
      expv[35] = 13'hx006;
      expv[36] = 13'hx006;
      expv[37] = 13'hx006;
      expv[38] = 13'hx006;
      expv[39] = 13'hx006;
      expv[40] = 13'hx006;
      expv[41] = 13'hx006;
      expv[42] = 13'hx006;
      expv[43] = 13'hx006;
      expv[44] = 13'hx006;
      expv[45] = 13'hx006;
      expv[46] = 13'hx006;
      expv[47] = 13'hx006;
      expv[48] = 13'hx006;
      expv[49] = 13'hx006;
      expv[50] = 13'hx006;
      expv[51] = 13'hx006;
      expv[52] = 13'hx006;
      expv[53] = 13'hx006;
      expv[54] = 13'hx006;
      expv[55] = 13'hx006;
      expv[56] = 13'hx006;
      expv[57] = 13'hx006;
      expv[58] = 13'hx006;
      expv[59] = 13'hx006;
      expv[60] = 13'hx006;
      expv[61] = 13'hx006;
      expv[62] = 13'hx006;
      expv[63] = 13'hx006;
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
