// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_up_ilas_mem dut (
    .up_clk(clk),
    .up_rreq(in_vec[39:39]),
    .up_raddr(in_vec[38:37]),
    .core_clk(in_vec[36:36]),
    .core_reset(in_vec[35:35]),
    .core_ilas_config_valid(in_vec[34:34]),
    .core_ilas_config_addr(in_vec[33:32]),
    .core_ilas_config_data(in_vec[31:0]),
    .up_rdata(out_vec[32:1]),
    .up_ilas_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h9c573dc7c1;
    stim[1] = 40'h5f755db523;
    stim[2] = 40'h151d48352a;
    stim[3] = 40'hc2f18de560;
    stim[4] = 40'h35d51658a4;
    stim[5] = 40'hd7403e1fee;
    stim[6] = 40'h66f0c76a65;
    stim[7] = 40'h502e5ce6ee;
    stim[8] = 40'hc3ed2dc976;
    stim[9] = 40'h224b97cbcb;
    stim[10] = 40'h92c6528b4d;
    stim[11] = 40'ha0fbad33bc;
    stim[12] = 40'hec49db3b5d;
    stim[13] = 40'h02c23ac557;
    stim[14] = 40'ha58fba5a95;
    stim[15] = 40'h9121d8ddf7;
    stim[16] = 40'hf33c39ed3f;
    stim[17] = 40'h33e2bd3d3a;
    stim[18] = 40'h435ce22d8f;
    stim[19] = 40'h500165a942;
    stim[20] = 40'h539155c506;
    stim[21] = 40'he35701a954;
    stim[22] = 40'h372eb3776f;
    stim[23] = 40'h6210934d28;
    stim[24] = 40'h27d6f80455;
    stim[25] = 40'h401af5ee02;
    stim[26] = 40'h73da94b30b;
    stim[27] = 40'ha4be428da0;
    stim[28] = 40'h02889d38bf;
    stim[29] = 40'h9815e7af70;
    stim[30] = 40'ha136227a4f;
    stim[31] = 40'hf76169a354;
    stim[32] = 40'h131745d220;
    stim[33] = 40'h11ecc647e3;
    stim[34] = 40'hb285a6f564;
    stim[35] = 40'h60e1c99291;
    stim[36] = 40'h84cd9ab234;
    stim[37] = 40'he285bd8421;
    stim[38] = 40'h0761ce25d3;
    stim[39] = 40'hb03255f3a8;
    stim[40] = 40'h0faa766e18;
    stim[41] = 40'h301a14d88f;
    stim[42] = 40'h07441fcea9;
    stim[43] = 40'hf3f65414c3;
    stim[44] = 40'hf220ab12e0;
    stim[45] = 40'h6548d3d46b;
    stim[46] = 40'h26f05648d8;
    stim[47] = 40'h15b9f14d34;
    stim[48] = 40'h0350b8a6e5;
    stim[49] = 40'ha2e79effae;
    stim[50] = 40'hc523d5c34c;
    stim[51] = 40'h62756b4d74;
    stim[52] = 40'h706b2903fd;
    stim[53] = 40'h46877a6ed2;
    stim[54] = 40'he217b51221;
    stim[55] = 40'hd5adfce675;
    stim[56] = 40'h67bb7817ed;
    stim[57] = 40'h3446174597;
    stim[58] = 40'h6655edc40d;
    stim[59] = 40'h9768a4f2e7;
    stim[60] = 40'h85fe4d5666;
    stim[61] = 40'hf091f47d8c;
    stim[62] = 40'hd51da998e8;
    stim[63] = 40'h92cae7122a;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h0ae7b8f82;
      expv[2] = 33'h0ae7b8f82;
      expv[3] = 33'h0ae7b8f82;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'hxxxxxxxxx;
      expv[6] = 33'hxxxxxxxxx;
      expv[7] = 33'hxxxxxxxxx;
      expv[8] = 33'hxxxxxxxxx;
      expv[9] = 33'hxxxxxxxxx;
      expv[10] = 33'hxxxxxxxxx;
      expv[11] = 33'h0ae7b8f82;
      expv[12] = 33'h1aa2cb148;
      expv[13] = 33'hxxxxxxxxx;
      expv[14] = 33'hxxxxxxxxx;
      expv[15] = 33'h1aa2cb148;
      expv[16] = 33'h0ae7b8f82;
      expv[17] = 33'hxxxxxxxxx;
      expv[18] = 33'hxxxxxxxxx;
      expv[19] = 33'hxxxxxxxxx;
      expv[20] = 33'hxxxxxxxxx;
      expv[21] = 33'hxxxxxxxxx;
      expv[22] = 33'hxxxxxxxxx;
      expv[23] = 33'hxxxxxxxxx;
      expv[24] = 33'hxxxxxxxxx;
      expv[25] = 33'hxxxxxxxxx;
      expv[26] = 33'hxxxxxxxxx;
      expv[27] = 33'hxxxxxxxxx;
      expv[28] = 33'h1aa2cb149;
      expv[29] = 33'h1aa2cb149;
      expv[30] = 33'h0ae7b8f83;
      expv[31] = 33'h1aa2cb148;
      expv[32] = 33'h0c2d346a8;
      expv[33] = 33'h0c2d346a9;
      expv[34] = 33'h0c2d346a9;
      expv[35] = 33'h1aa2cb149;
      expv[36] = 33'h1aa2cb149;
      expv[37] = 33'h0ae7b8f83;
      expv[38] = 33'h0c2d346a9;
      expv[39] = 33'h0c2d346a9;
      expv[40] = 33'h1aa2cb149;
      expv[41] = 33'h1aa2cb149;
      expv[42] = 33'h1aa2cb149;
      expv[43] = 33'h1aa2cb149;
      expv[44] = 33'h0c2d346a9;
      expv[45] = 33'h0c2d346a9;
      expv[46] = 33'h0c2d346a9;
      expv[47] = 33'h0c2d346a9;
      expv[48] = 33'h0c2d346a9;
      expv[49] = 33'h0c2d346a9;
      expv[50] = 33'h173e29a69;
      expv[51] = 33'hxxxxxxxxx;
      expv[52] = 33'hxxxxxxxxx;
      expv[53] = 33'hxxxxxxxxx;
      expv[54] = 33'hxxxxxxxxx;
      expv[55] = 33'h0c2d346a9;
      expv[56] = 33'hxxxxxxxxx;
      expv[57] = 33'hxxxxxxxxx;
      expv[58] = 33'hxxxxxxxxx;
      expv[59] = 33'hxxxxxxxxx;
      expv[60] = 33'h08c2e8b2f;
      expv[61] = 33'h08c2e8b2f;
      expv[62] = 33'h0d149e5cf;
      expv[63] = 33'hxxxxxxxxx;
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
