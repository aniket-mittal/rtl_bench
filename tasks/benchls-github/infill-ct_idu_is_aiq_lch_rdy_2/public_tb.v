// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_idu_is_aiq_lch_rdy_2 dut (
    .y_clk(clk),
    .cpurst_b(in_vec[12:12]),
    .vld(in_vec[11:11]),
    .x_create_dp_en(in_vec[10:10]),
    .x_create_entry(in_vec[9:8]),
    .x_create_lch_rdy(in_vec[7:6]),
    .y_create0_dp_en(in_vec[5:5]),
    .y_create0_src_match(in_vec[4:3]),
    .y_create1_dp_en(in_vec[2:2]),
    .y_create1_src_match(in_vec[1:0]),
    .x_read_lch_rdy(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0625;
    stim[1] = 13'h0ea5;
    stim[2] = 13'h1331;
    stim[3] = 13'h19be;
    stim[4] = 13'h16a7;
    stim[5] = 13'h1db5;
    stim[6] = 13'h1fe5;
    stim[7] = 13'h1b59;
    stim[8] = 13'h1c64;
    stim[9] = 13'h1e5c;
    stim[10] = 13'h1b0f;
    stim[11] = 13'h1d5c;
    stim[12] = 13'h1488;
    stim[13] = 13'h1c62;
    stim[14] = 13'h1d06;
    stim[15] = 13'h19b5;
    stim[16] = 13'h1f27;
    stim[17] = 13'h13ff;
    stim[18] = 13'h1e9a;
    stim[19] = 13'h1941;
    stim[20] = 13'h13c1;
    stim[21] = 13'h10a8;
    stim[22] = 13'h1ba1;
    stim[23] = 13'h183c;
    stim[24] = 13'h10fc;
    stim[25] = 13'h1dc7;
    stim[26] = 13'h138a;
    stim[27] = 13'h1a34;
    stim[28] = 13'h1b89;
    stim[29] = 13'h10b4;
    stim[30] = 13'h1544;
    stim[31] = 13'h1a08;
    stim[32] = 13'h1389;
    stim[33] = 13'h1ea1;
    stim[34] = 13'h113a;
    stim[35] = 13'h17a5;
    stim[36] = 13'h1ed9;
    stim[37] = 13'h10ac;
    stim[38] = 13'h13df;
    stim[39] = 13'h1c2c;
    stim[40] = 13'h13e0;
    stim[41] = 13'h19f2;
    stim[42] = 13'h1bbc;
    stim[43] = 13'h14ad;
    stim[44] = 13'h17bc;
    stim[45] = 13'h1de4;
    stim[46] = 13'h1a92;
    stim[47] = 13'h1fab;
    stim[48] = 13'h12b4;
    stim[49] = 13'h1e59;
    stim[50] = 13'h1657;
    stim[51] = 13'h1aaa;
    stim[52] = 13'h1c65;
    stim[53] = 13'h1b4e;
    stim[54] = 13'h1f3d;
    stim[55] = 13'h13e7;
    stim[56] = 13'h118e;
    stim[57] = 13'h124d;
    stim[58] = 13'h11f2;
    stim[59] = 13'h164a;
    stim[60] = 13'h191d;
    stim[61] = 13'h1f1a;
    stim[62] = 13'h1f16;
    stim[63] = 13'h108d;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h2;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h0;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h1;
      expv[13] = 2'h2;
      expv[14] = 2'h1;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h3;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h3;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h3;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h3;
      expv[47] = 2'h1;
      expv[48] = 2'h0;
      expv[49] = 2'h2;
      expv[50] = 2'h3;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h2;
      expv[63] = 2'h0;
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
