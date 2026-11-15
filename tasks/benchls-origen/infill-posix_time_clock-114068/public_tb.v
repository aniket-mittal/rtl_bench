// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_114068 dut (
    .clk_i(clk),
    .rst_i(in_vec[33:33]),
    .user_posix_time_i(in_vec[32:1]),
    .user_posix_time_en_i(in_vec[0:0]),
    .posix_time_o(out_vec[33:2]),
    .new_posix_time_o(out_vec[1:1]),
    .last_tact_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h205ae729d;
    stim[1] = 34'h276cddb9e;
    stim[2] = 34'h2e31e20ca;
    stim[3] = 34'h2f375e4aa;
    stim[4] = 34'h12451fae0;
    stim[5] = 34'h1bbf5f0fc;
    stim[6] = 34'h03b59bbc8;
    stim[7] = 34'h0f9dded0c;
    stim[8] = 34'h1e47d3eab;
    stim[9] = 34'h1417fa5f2;
    stim[10] = 34'h14061aedf;
    stim[11] = 34'h1b4a8b35c;
    stim[12] = 34'h06406cbd3;
    stim[13] = 34'h1711ef963;
    stim[14] = 34'h119d2ffb4;
    stim[15] = 34'h1df553b7f;
    stim[16] = 34'h140bb113c;
    stim[17] = 34'h30b7bb60e;
    stim[18] = 34'h1f78c575b;
    stim[19] = 34'h0401cff98;
    stim[20] = 34'h0285669e0;
    stim[21] = 34'h0fa4d2833;
    stim[22] = 34'h051d18766;
    stim[23] = 34'h049de286c;
    stim[24] = 34'h057d2a9a5;
    stim[25] = 34'h09020c470;
    stim[26] = 34'h10b7fef7f;
    stim[27] = 34'h1149a27e5;
    stim[28] = 34'h03b9c3d78;
    stim[29] = 34'h02fadae21;
    stim[30] = 34'h0f4b432a6;
    stim[31] = 34'h1dd8b56b6;
    stim[32] = 34'h12ca402bf;
    stim[33] = 34'h0d8c6450a;
    stim[34] = 34'h10cbed62f;
    stim[35] = 34'h1c783f2aa;
    stim[36] = 34'h049a7156a;
    stim[37] = 34'h0a326d810;
    stim[38] = 34'h0df770045;
    stim[39] = 34'h0d8d6862e;
    stim[40] = 34'h1772b48af;
    stim[41] = 34'h11810031f;
    stim[42] = 34'h052ef1f92;
    stim[43] = 34'h15754ce54;
    stim[44] = 34'h08d71a6fa;
    stim[45] = 34'h0ef511557;
    stim[46] = 34'h0f45d86ea;
    stim[47] = 34'h1f81c03fe;
    stim[48] = 34'h0ce49acfc;
    stim[49] = 34'h0099bf988;
    stim[50] = 34'h1b98a72d8;
    stim[51] = 34'h0ab008a94;
    stim[52] = 34'h15671467b;
    stim[53] = 34'h0cfb6b250;
    stim[54] = 34'h0eeee56c2;
    stim[55] = 34'h177ac4589;
    stim[56] = 34'h10e2c9810;
    stim[57] = 34'h1ac291017;
    stim[58] = 34'h0ca51b765;
    stim[59] = 34'h03996106c;
    stim[60] = 34'h1fccfef45;
    stim[61] = 34'h036b349db;
    stim[62] = 34'h1b2a49395;
    stim[63] = 34'h18d8cdf29;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000002;
      expv[10] = 34'h3c8fb2614;
      expv[11] = 34'h3c8fb2616;
      expv[12] = 34'h280c4067c;
      expv[13] = 34'h280c4067e;
      expv[14] = 34'h0c80e4064;
      expv[15] = 34'h0c80e4064;
      expv[16] = 34'h0c80e4066;
      expv[17] = 34'h3beab1fbc;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000002;
      expv[20] = 34'h3ef195774;
      expv[21] = 34'h3ef195774;
      expv[22] = 34'h3ef195776;
      expv[23] = 34'h1f49af924;
      expv[24] = 34'h1f49af924;
      expv[25] = 34'h1f49af926;
      expv[26] = 34'h0afa5fc08;
      expv[27] = 34'h0afa5fc0a;
      expv[28] = 34'h2170087bc;
      expv[29] = 34'h2170087bc;
      expv[30] = 34'h2170087be;
      expv[31] = 34'h05f5c0500;
      expv[32] = 34'h05f5c0500;
      expv[33] = 34'h05f5c0502;
      expv[34] = 34'h25948ae3c;
      expv[35] = 34'h25948ae3e;
      expv[36] = 34'h2197e551c;
      expv[37] = 34'h2197e551c;
      expv[38] = 34'h2197e551c;
      expv[39] = 34'h2197e551e;
      expv[40] = 34'h1beeea948;
      expv[41] = 34'h1beeea94a;
      expv[42] = 34'h2ee573a1c;
      expv[43] = 34'h2ee573a1c;
      expv[44] = 34'h2ee573a1c;
      expv[45] = 34'h2ee573a1c;
      expv[46] = 34'h2ee573a1e;
      expv[47] = 34'h1dea2d36c;
      expv[48] = 34'h1dea2d36c;
      expv[49] = 34'h1dea2d36c;
      expv[50] = 34'h1dea2d36c;
      expv[51] = 34'h1dea2d36c;
      expv[52] = 34'h1dea2d36c;
      expv[53] = 34'h1dea2d36e;
      expv[54] = 34'h2ace335b4;
      expv[55] = 34'h2ace335b4;
      expv[56] = 34'h2ace335b6;
      expv[57] = 34'h2ef5933d0;
      expv[58] = 34'h2ef5933d2;
      expv[59] = 34'h35852c8ec;
      expv[60] = 34'h35852c8ec;
      expv[61] = 34'h35852c8ee;
      expv[62] = 34'h3f9a08748;
      expv[63] = 34'h3f9a08748;
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
