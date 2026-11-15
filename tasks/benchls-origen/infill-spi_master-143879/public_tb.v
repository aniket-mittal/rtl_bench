// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143879 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .mpu_address(in_vec[17:11]),
    .mpu_wr_data(in_vec[10:3]),
    .mpu_rd_wr_sel(in_vec[2:2]),
    .start(in_vec[1:1]),
    .SPI_DI_a(in_vec[0:0]),
    .busy(out_vec[11:11]),
    .SPI_SS_a(out_vec[10:10]),
    .SPI_CK_a(out_vec[9:9]),
    .SPI_DO_a(out_vec[8:8]),
    .mpu_rd_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h41b5f;
    stim[1] = 19'h7d32c;
    stim[2] = 19'h243f8;
    stim[3] = 19'h1a55a;
    stim[4] = 19'h0828b;
    stim[5] = 19'h08d3f;
    stim[6] = 19'h3ad5c;
    stim[7] = 19'h1ce7d;
    stim[8] = 19'h3e910;
    stim[9] = 19'h3830d;
    stim[10] = 19'h3a29e;
    stim[11] = 19'h31ac8;
    stim[12] = 19'h1533a;
    stim[13] = 19'h16108;
    stim[14] = 19'h3a65b;
    stim[15] = 19'h16a25;
    stim[16] = 19'h28c42;
    stim[17] = 19'h3835e;
    stim[18] = 19'h3b7b3;
    stim[19] = 19'h1ce03;
    stim[20] = 19'h078db;
    stim[21] = 19'h28793;
    stim[22] = 19'h3a50e;
    stim[23] = 19'h1063f;
    stim[24] = 19'h301bc;
    stim[25] = 19'h38244;
    stim[26] = 19'h18ff3;
    stim[27] = 19'h34694;
    stim[28] = 19'h3aeea;
    stim[29] = 19'h1e879;
    stim[30] = 19'h34f6a;
    stim[31] = 19'h09473;
    stim[32] = 19'h0f8cb;
    stim[33] = 19'h00707;
    stim[34] = 19'h1ec85;
    stim[35] = 19'h0998c;
    stim[36] = 19'h23d36;
    stim[37] = 19'h1d300;
    stim[38] = 19'h195a9;
    stim[39] = 19'h2a068;
    stim[40] = 19'h21d2a;
    stim[41] = 19'h29626;
    stim[42] = 19'h37ba0;
    stim[43] = 19'h365de;
    stim[44] = 19'h23b99;
    stim[45] = 19'h3181f;
    stim[46] = 19'h1a7fa;
    stim[47] = 19'h01ebc;
    stim[48] = 19'h3ddb2;
    stim[49] = 19'h1f048;
    stim[50] = 19'h21a40;
    stim[51] = 19'h0cb8c;
    stim[52] = 19'h09f5a;
    stim[53] = 19'h1c4cd;
    stim[54] = 19'h2a51d;
    stim[55] = 19'h3b110;
    stim[56] = 19'h3bb11;
    stim[57] = 19'h1f196;
    stim[58] = 19'h3697c;
    stim[59] = 19'h1ee7c;
    stim[60] = 19'h02ac2;
    stim[61] = 19'h13049;
    stim[62] = 19'h1ee9a;
    stim[63] = 19'h30182;
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
      expv[0] = 12'h400;
      expv[1] = 12'h400;
      expv[2] = 12'h400;
      expv[3] = 12'h400;
      expv[4] = 12'h400;
      expv[5] = 12'h800;
      expv[6] = 12'h800;
      expv[7] = 12'h800;
      expv[8] = 12'h800;
      expv[9] = 12'h900;
      expv[10] = 12'h800;
      expv[11] = 12'h800;
      expv[12] = 12'h800;
      expv[13] = 12'h800;
      expv[14] = 12'h800;
      expv[15] = 12'h800;
      expv[16] = 12'h800;
      expv[17] = 12'h800;
      expv[18] = 12'h800;
      expv[19] = 12'h800;
      expv[20] = 12'h800;
      expv[21] = 12'h800;
      expv[22] = 12'h800;
      expv[23] = 12'h800;
      expv[24] = 12'h800;
      expv[25] = 12'h800;
      expv[26] = 12'h800;
      expv[27] = 12'h800;
      expv[28] = 12'h800;
      expv[29] = 12'h800;
      expv[30] = 12'hc00;
      expv[31] = 12'h400;
      expv[32] = 12'h800;
      expv[33] = 12'h800;
      expv[34] = 12'h800;
      expv[35] = 12'h800;
      expv[36] = 12'h900;
      expv[37] = 12'h800;
      expv[38] = 12'h800;
      expv[39] = 12'h900;
      expv[40] = 12'h800;
      expv[41] = 12'h800;
      expv[42] = 12'h800;
      expv[43] = 12'h800;
      expv[44] = 12'h800;
      expv[45] = 12'h800;
      expv[46] = 12'h800;
      expv[47] = 12'h800;
      expv[48] = 12'h800;
      expv[49] = 12'h800;
      expv[50] = 12'h800;
      expv[51] = 12'h800;
      expv[52] = 12'ha00;
      expv[53] = 12'ha00;
      expv[54] = 12'ha00;
      expv[55] = 12'ha00;
      expv[56] = 12'ha00;
      expv[57] = 12'he00;
      expv[58] = 12'h600;
      expv[59] = 12'ha00;
      expv[60] = 12'hb00;
      expv[61] = 12'hb00;
      expv[62] = 12'hb00;
      expv[63] = 12'ha00;
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
