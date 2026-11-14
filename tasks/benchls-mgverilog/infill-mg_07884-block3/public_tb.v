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

  mg_07884 dut (
    .clk_i(clk),
    .rst_i(in_vec[10:10]),
    .start_i(in_vec[9:9]),
    .data_i(in_vec[8:1]),
    .spi_miso_i(in_vec[0:0]),
    .done_o(out_vec[12:12]),
    .busy_o(out_vec[11:11]),
    .data_o(out_vec[10:3]),
    .spi_clk_o(out_vec[2:2]),
    .spi_ss_o(out_vec[1:1]),
    .spi_mosi_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h543;
    stim[1] = 11'h56f;
    stim[2] = 11'h2a3;
    stim[3] = 11'h1c4;
    stim[4] = 11'h2c5;
    stim[5] = 11'h08e;
    stim[6] = 11'h003;
    stim[7] = 11'h1ac;
    stim[8] = 11'h1a1;
    stim[9] = 11'h1d5;
    stim[10] = 11'h2a2;
    stim[11] = 11'h1db;
    stim[12] = 11'h3bf;
    stim[13] = 11'h26f;
    stim[14] = 11'h1f2;
    stim[15] = 11'h28c;
    stim[16] = 11'h1bf;
    stim[17] = 11'h31a;
    stim[18] = 11'h146;
    stim[19] = 11'h381;
    stim[20] = 11'h23e;
    stim[21] = 11'h228;
    stim[22] = 11'h38a;
    stim[23] = 11'h128;
    stim[24] = 11'h362;
    stim[25] = 11'h29b;
    stim[26] = 11'h151;
    stim[27] = 11'h3d2;
    stim[28] = 11'h3b5;
    stim[29] = 11'h12d;
    stim[30] = 11'h0af;
    stim[31] = 11'h0e8;
    stim[32] = 11'h06f;
    stim[33] = 11'h03a;
    stim[34] = 11'h4f2;
    stim[35] = 11'h0a6;
    stim[36] = 11'h3ad;
    stim[37] = 11'h3c1;
    stim[38] = 11'h30c;
    stim[39] = 11'h31a;
    stim[40] = 11'h22b;
    stim[41] = 11'h3b3;
    stim[42] = 11'h188;
    stim[43] = 11'h278;
    stim[44] = 11'h093;
    stim[45] = 11'h209;
    stim[46] = 11'h342;
    stim[47] = 11'h389;
    stim[48] = 11'h073;
    stim[49] = 11'h1ed;
    stim[50] = 11'h0f3;
    stim[51] = 11'h0b7;
    stim[52] = 11'h10a;
    stim[53] = 11'h190;
    stim[54] = 11'h1e0;
    stim[55] = 11'h02d;
    stim[56] = 11'h102;
    stim[57] = 11'h31b;
    stim[58] = 11'h0d3;
    stim[59] = 11'h2cb;
    stim[60] = 11'h31d;
    stim[61] = 11'h2ca;
    stim[62] = 11'h316;
    stim[63] = 11'h21a;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0800;
      expv[3] = 13'h0a8a;
      expv[4] = 13'h0a8a;
      expv[5] = 13'h0a8a;
      expv[6] = 13'h0a8a;
      expv[7] = 13'h0a8a;
      expv[8] = 13'h0a8a;
      expv[9] = 13'h0a8a;
      expv[10] = 13'h0a8a;
      expv[11] = 13'h0a8a;
      expv[12] = 13'h0a8a;
      expv[13] = 13'h0a8a;
      expv[14] = 13'h0a8a;
      expv[15] = 13'h0a8a;
      expv[16] = 13'h0a8a;
      expv[17] = 13'h0a8a;
      expv[18] = 13'h0a8a;
      expv[19] = 13'h0a8a;
      expv[20] = 13'h0a8a;
      expv[21] = 13'h0a8a;
      expv[22] = 13'h0a8a;
      expv[23] = 13'h0a8a;
      expv[24] = 13'h0a8a;
      expv[25] = 13'h0a8a;
      expv[26] = 13'h0a8a;
      expv[27] = 13'h0a8a;
      expv[28] = 13'h0a8a;
      expv[29] = 13'h0a8a;
      expv[30] = 13'h0a8a;
      expv[31] = 13'h0a8a;
      expv[32] = 13'h0a8a;
      expv[33] = 13'h0a8a;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0800;
      expv[37] = 13'h0eb3;
      expv[38] = 13'h0eb3;
      expv[39] = 13'h0eb3;
      expv[40] = 13'h0eb3;
      expv[41] = 13'h0eb3;
      expv[42] = 13'h0eb3;
      expv[43] = 13'h0eb3;
      expv[44] = 13'h0eb3;
      expv[45] = 13'h0eb3;
      expv[46] = 13'h0eb3;
      expv[47] = 13'h0eb3;
      expv[48] = 13'h0eb3;
      expv[49] = 13'h0eb3;
      expv[50] = 13'h0eb3;
      expv[51] = 13'h0eb3;
      expv[52] = 13'h0eb3;
      expv[53] = 13'h0eb3;
      expv[54] = 13'h0eb3;
      expv[55] = 13'h0eb3;
      expv[56] = 13'h0eb3;
      expv[57] = 13'h0eb3;
      expv[58] = 13'h0eb3;
      expv[59] = 13'h0eb3;
      expv[60] = 13'h0eb3;
      expv[61] = 13'h0eb3;
      expv[62] = 13'h0eb3;
      expv[63] = 13'h0eb3;
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
