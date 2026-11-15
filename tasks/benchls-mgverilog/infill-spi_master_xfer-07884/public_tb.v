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
    stim[0] = 11'h6b9;
    stim[1] = 11'h711;
    stim[2] = 11'h15b;
    stim[3] = 11'h054;
    stim[4] = 11'h39a;
    stim[5] = 11'h347;
    stim[6] = 11'h21a;
    stim[7] = 11'h1d1;
    stim[8] = 11'h34b;
    stim[9] = 11'h1bd;
    stim[10] = 11'h04c;
    stim[11] = 11'h3d5;
    stim[12] = 11'h17b;
    stim[13] = 11'h0d3;
    stim[14] = 11'h183;
    stim[15] = 11'h18b;
    stim[16] = 11'h390;
    stim[17] = 11'h08d;
    stim[18] = 11'h370;
    stim[19] = 11'h3a0;
    stim[20] = 11'h13c;
    stim[21] = 11'h0d3;
    stim[22] = 11'h2ad;
    stim[23] = 11'h139;
    stim[24] = 11'h09a;
    stim[25] = 11'h2e6;
    stim[26] = 11'h030;
    stim[27] = 11'h03b;
    stim[28] = 11'h125;
    stim[29] = 11'h13c;
    stim[30] = 11'h306;
    stim[31] = 11'h2d9;
    stim[32] = 11'h28c;
    stim[33] = 11'h39e;
    stim[34] = 11'h101;
    stim[35] = 11'h3b9;
    stim[36] = 11'h3ed;
    stim[37] = 11'h080;
    stim[38] = 11'h3be;
    stim[39] = 11'h2b3;
    stim[40] = 11'h353;
    stim[41] = 11'h168;
    stim[42] = 11'h047;
    stim[43] = 11'h190;
    stim[44] = 11'h1b3;
    stim[45] = 11'h3cb;
    stim[46] = 11'h2c8;
    stim[47] = 11'h32d;
    stim[48] = 11'h2fb;
    stim[49] = 11'h369;
    stim[50] = 11'h1c1;
    stim[51] = 11'h03b;
    stim[52] = 11'h279;
    stim[53] = 11'h20b;
    stim[54] = 11'h0f5;
    stim[55] = 11'h100;
    stim[56] = 11'h76b;
    stim[57] = 11'h39d;
    stim[58] = 11'h1c9;
    stim[59] = 11'h060;
    stim[60] = 11'h603;
    stim[61] = 11'h2cb;
    stim[62] = 11'h0da;
    stim[63] = 11'h222;
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
      expv[0] = 13'h0800;
      expv[1] = 13'h0800;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0800;
      expv[5] = 13'h0e6b;
      expv[6] = 13'h0e6b;
      expv[7] = 13'h0e6b;
      expv[8] = 13'h0e6b;
      expv[9] = 13'h0e6b;
      expv[10] = 13'h0e6b;
      expv[11] = 13'h0e6b;
      expv[12] = 13'h0e6b;
      expv[13] = 13'h0e6b;
      expv[14] = 13'h0e6b;
      expv[15] = 13'h0e6b;
      expv[16] = 13'h0e6b;
      expv[17] = 13'h0e6b;
      expv[18] = 13'h0e6b;
      expv[19] = 13'h0e6b;
      expv[20] = 13'h0e6b;
      expv[21] = 13'h0e6b;
      expv[22] = 13'h0e6b;
      expv[23] = 13'h0e6b;
      expv[24] = 13'h0e6b;
      expv[25] = 13'h0e6b;
      expv[26] = 13'h0e6b;
      expv[27] = 13'h0e6b;
      expv[28] = 13'h0e6b;
      expv[29] = 13'h0e6b;
      expv[30] = 13'h0e6b;
      expv[31] = 13'h0e6b;
      expv[32] = 13'h0e6b;
      expv[33] = 13'h0e6b;
      expv[34] = 13'h0e6b;
      expv[35] = 13'h0e6b;
      expv[36] = 13'h0e6b;
      expv[37] = 13'h0e6b;
      expv[38] = 13'h0e6f;
      expv[39] = 13'h0e6f;
      expv[40] = 13'h0e6f;
      expv[41] = 13'h0e6f;
      expv[42] = 13'h0e6f;
      expv[43] = 13'h0e6f;
      expv[44] = 13'h0e6f;
      expv[45] = 13'h0e6f;
      expv[46] = 13'h0e6f;
      expv[47] = 13'h0e6f;
      expv[48] = 13'h0e6f;
      expv[49] = 13'h0e6f;
      expv[50] = 13'h0e6f;
      expv[51] = 13'h0e6f;
      expv[52] = 13'h0e6f;
      expv[53] = 13'h0e6f;
      expv[54] = 13'h0e6f;
      expv[55] = 13'h0e6f;
      expv[56] = 13'h0800;
      expv[57] = 13'h0800;
      expv[58] = 13'h0e73;
      expv[59] = 13'h0e73;
      expv[60] = 13'h0800;
      expv[61] = 13'h0800;
      expv[62] = 13'h0b2a;
      expv[63] = 13'h0b2a;
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
