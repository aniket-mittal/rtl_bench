// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06953 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .mosi(in_vec[36:36]),
    .ss(in_vec[35:35]),
    .sck(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .data_in_rq(in_vec[1:1]),
    .data_out_ack(in_vec[0:0]),
    .miso(out_vec[36:36]),
    .data_in_rdy(out_vec[35:35]),
    .data_in_ack(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .data_out_rdy(out_vec[1:1]),
    .spi_led(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2d3608683e;
    stim[1] = 38'h3680259a09;
    stim[2] = 38'h0bd06e69c8;
    stim[3] = 38'h0f10e9aad6;
    stim[4] = 38'h0ca4a8ac0b;
    stim[5] = 38'h170aba7d48;
    stim[6] = 38'h1b40a98466;
    stim[7] = 38'h0f1c35b39a;
    stim[8] = 38'h154aef28d7;
    stim[9] = 38'h015d258237;
    stim[10] = 38'h168878bcdb;
    stim[11] = 38'h16e61066a5;
    stim[12] = 38'h020c3db5bf;
    stim[13] = 38'h010b0e902f;
    stim[14] = 38'h113c29e1fe;
    stim[15] = 38'h192af8c8ed;
    stim[16] = 38'h18a7778e7c;
    stim[17] = 38'h08c1033a4e;
    stim[18] = 38'h0dade7bb55;
    stim[19] = 38'h1d7cec6e49;
    stim[20] = 38'h1f91945091;
    stim[21] = 38'h08be5384fd;
    stim[22] = 38'h16bcd4b55f;
    stim[23] = 38'h1e83313f73;
    stim[24] = 38'h03c7e2a18e;
    stim[25] = 38'h197d2ef533;
    stim[26] = 38'h12149cabc4;
    stim[27] = 38'h0dbc84eead;
    stim[28] = 38'h009b50d083;
    stim[29] = 38'h266b3fe48c;
    stim[30] = 38'h03b410c4c0;
    stim[31] = 38'h1b317a62be;
    stim[32] = 38'h01dc5d30b9;
    stim[33] = 38'h03745b3719;
    stim[34] = 38'h0fe356cfe1;
    stim[35] = 38'h03fa1835b0;
    stim[36] = 38'h121f8a4766;
    stim[37] = 38'h00290a0ca3;
    stim[38] = 38'h04e27b8b91;
    stim[39] = 38'h0d116de0bf;
    stim[40] = 38'h0faa3f1b30;
    stim[41] = 38'h0ef4ace081;
    stim[42] = 38'h1e29a2be7b;
    stim[43] = 38'h0a1347a64a;
    stim[44] = 38'h0630655b80;
    stim[45] = 38'h1e0faf522f;
    stim[46] = 38'h188fc704c9;
    stim[47] = 38'h1523abf663;
    stim[48] = 38'h1ead20df17;
    stim[49] = 38'h07378ee538;
    stim[50] = 38'h0f7ca99ab2;
    stim[51] = 38'h0f1820d188;
    stim[52] = 38'h162a4c3ff2;
    stim[53] = 38'h1b36718e02;
    stim[54] = 38'h16fd2a910b;
    stim[55] = 38'h1c86660a85;
    stim[56] = 38'h04de0079f8;
    stim[57] = 38'h347aa31ab4;
    stim[58] = 38'h0843b21095;
    stim[59] = 38'h1895436806;
    stim[60] = 38'h0db528fe15;
    stim[61] = 38'h17d32b4bf0;
    stim[62] = 38'h19aa0f1d26;
    stim[63] = 38'h1889f6525d;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxxx;
      expv[2] = 37'hxxxxxxxxxx;
      expv[3] = 37'hx80000000x;
      expv[4] = 37'hx80000000x;
      expv[5] = 37'hx80000000x;
      expv[6] = 37'hx80000000x;
      expv[7] = 37'hx80000000x;
      expv[8] = 37'hx80000000x;
      expv[9] = 37'hx80000000x;
      expv[10] = 37'hx80000000x;
      expv[11] = 37'hx80000000x;
      expv[12] = 37'hx80000000x;
      expv[13] = 37'hx80000000x;
      expv[14] = 37'hx80000000x;
      expv[15] = 37'hx80000000x;
      expv[16] = 37'hx80000000x;
      expv[17] = 37'hx80000000x;
      expv[18] = 37'hx80000000x;
      expv[19] = 37'hx80000000x;
      expv[20] = 37'hx80000000x;
      expv[21] = 37'hx80000000x;
      expv[22] = 37'hx80000000x;
      expv[23] = 37'hx80000000x;
      expv[24] = 37'hx80000000x;
      expv[25] = 37'hx80000000x;
      expv[26] = 37'hx80000000x;
      expv[27] = 37'hx80000000x;
      expv[28] = 37'hx80000000x;
      expv[29] = 37'hx80000000x;
      expv[30] = 37'h1800000001;
      expv[31] = 37'h1800000001;
      expv[32] = 37'h1800000001;
      expv[33] = 37'h1800000001;
      expv[34] = 37'h1800000001;
      expv[35] = 37'h1800000001;
      expv[36] = 37'h1800000001;
      expv[37] = 37'h1800000001;
      expv[38] = 37'h1800000001;
      expv[39] = 37'h1800000001;
      expv[40] = 37'h1800000001;
      expv[41] = 37'h1800000001;
      expv[42] = 37'h1800000001;
      expv[43] = 37'h1800000001;
      expv[44] = 37'h1800000001;
      expv[45] = 37'h1800000001;
      expv[46] = 37'h1800000001;
      expv[47] = 37'h1800000001;
      expv[48] = 37'h1800000001;
      expv[49] = 37'h1800000001;
      expv[50] = 37'h1800000001;
      expv[51] = 37'h1800000001;
      expv[52] = 37'h1800000001;
      expv[53] = 37'h1800000001;
      expv[54] = 37'h1800000001;
      expv[55] = 37'h1800000001;
      expv[56] = 37'h1800000001;
      expv[57] = 37'h1800000001;
      expv[58] = 37'h0800000001;
      expv[59] = 37'h0800000001;
      expv[60] = 37'h0800000001;
      expv[61] = 37'h0800000001;
      expv[62] = 37'h0800000001;
      expv[63] = 37'h0800000001;
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
