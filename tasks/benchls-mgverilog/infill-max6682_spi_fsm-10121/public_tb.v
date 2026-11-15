// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10121 dut (
    .Clk_i(clk),
    .Reset_n_i(in_vec[10:10]),
    .SPI_FSM_Start(in_vec[9:9]),
    .SPI_Transmission_i(in_vec[8:8]),
    .SPI_Data_i(in_vec[7:0]),
    .MAX6682CS_n_o(out_vec[19:19]),
    .SPI_Write_o(out_vec[18:18]),
    .SPI_ReadNext_o(out_vec[17:17]),
    .SPI_FSM_Done(out_vec[16:16]),
    .Byte0(out_vec[15:8]),
    .Byte1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h759;
    stim[1] = 11'h7e3;
    stim[2] = 11'h13e;
    stim[3] = 11'h184;
    stim[4] = 11'h1a0;
    stim[5] = 11'h2b5;
    stim[6] = 11'h051;
    stim[7] = 11'h049;
    stim[8] = 11'h18b;
    stim[9] = 11'h3a8;
    stim[10] = 11'h333;
    stim[11] = 11'h004;
    stim[12] = 11'h118;
    stim[13] = 11'h33e;
    stim[14] = 11'h34f;
    stim[15] = 11'h34e;
    stim[16] = 11'h221;
    stim[17] = 11'h0bd;
    stim[18] = 11'h3f2;
    stim[19] = 11'h198;
    stim[20] = 11'h2e1;
    stim[21] = 11'h055;
    stim[22] = 11'h0ae;
    stim[23] = 11'h1c2;
    stim[24] = 11'h0ac;
    stim[25] = 11'h03f;
    stim[26] = 11'h3e7;
    stim[27] = 11'h072;
    stim[28] = 11'h3aa;
    stim[29] = 11'h2c5;
    stim[30] = 11'h1c9;
    stim[31] = 11'h239;
    stim[32] = 11'h332;
    stim[33] = 11'h14c;
    stim[34] = 11'h330;
    stim[35] = 11'h2e7;
    stim[36] = 11'h014;
    stim[37] = 11'h308;
    stim[38] = 11'h706;
    stim[39] = 11'h18d;
    stim[40] = 11'h234;
    stim[41] = 11'h1d9;
    stim[42] = 11'h351;
    stim[43] = 11'h26b;
    stim[44] = 11'h312;
    stim[45] = 11'h1b7;
    stim[46] = 11'h38b;
    stim[47] = 11'h0e3;
    stim[48] = 11'h19a;
    stim[49] = 11'h3b7;
    stim[50] = 11'h14b;
    stim[51] = 11'h21e;
    stim[52] = 11'h28c;
    stim[53] = 11'h1d5;
    stim[54] = 11'h2d4;
    stim[55] = 11'h130;
    stim[56] = 11'h2af;
    stim[57] = 11'h318;
    stim[58] = 11'h1f3;
    stim[59] = 11'h260;
    stim[60] = 11'h3b0;
    stim[61] = 11'h39f;
    stim[62] = 11'h23c;
    stim[63] = 11'h2f7;
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
      expv[0] = 20'h40000;
      expv[1] = 20'h40000;
      expv[2] = 20'h80000;
      expv[3] = 20'h80000;
      expv[4] = 20'h80000;
      expv[5] = 20'h40000;
      expv[6] = 20'h80000;
      expv[7] = 20'h80000;
      expv[8] = 20'h80000;
      expv[9] = 20'h40000;
      expv[10] = 20'h40000;
      expv[11] = 20'h80000;
      expv[12] = 20'h80000;
      expv[13] = 20'h40000;
      expv[14] = 20'h40000;
      expv[15] = 20'h40000;
      expv[16] = 20'h40000;
      expv[17] = 20'h80000;
      expv[18] = 20'h40000;
      expv[19] = 20'h80000;
      expv[20] = 20'h40000;
      expv[21] = 20'h80000;
      expv[22] = 20'h80000;
      expv[23] = 20'h80000;
      expv[24] = 20'h80000;
      expv[25] = 20'h80000;
      expv[26] = 20'h40000;
      expv[27] = 20'h80000;
      expv[28] = 20'h40000;
      expv[29] = 20'h40000;
      expv[30] = 20'h80000;
      expv[31] = 20'h40000;
      expv[32] = 20'h40000;
      expv[33] = 20'h80000;
      expv[34] = 20'h40000;
      expv[35] = 20'h40000;
      expv[36] = 20'h80000;
      expv[37] = 20'h40000;
      expv[38] = 20'h40000;
      expv[39] = 20'h80000;
      expv[40] = 20'h40000;
      expv[41] = 20'h80000;
      expv[42] = 20'h40000;
      expv[43] = 20'h40000;
      expv[44] = 20'h40000;
      expv[45] = 20'h80000;
      expv[46] = 20'h40000;
      expv[47] = 20'h80000;
      expv[48] = 20'h80000;
      expv[49] = 20'h40000;
      expv[50] = 20'h80000;
      expv[51] = 20'h40000;
      expv[52] = 20'h40000;
      expv[53] = 20'h80000;
      expv[54] = 20'h40000;
      expv[55] = 20'h80000;
      expv[56] = 20'h40000;
      expv[57] = 20'h40000;
      expv[58] = 20'h80000;
      expv[59] = 20'h40000;
      expv[60] = 20'h40000;
      expv[61] = 20'h40000;
      expv[62] = 20'h40000;
      expv[63] = 20'h40000;
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
