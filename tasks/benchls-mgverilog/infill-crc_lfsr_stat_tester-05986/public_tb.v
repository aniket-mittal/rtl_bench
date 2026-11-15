// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 81;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05986 dut (
    .tx_clk_i(clk),
    .tx_rstn_i(in_vec[21:21]),
    .tx_rdy_i(in_vec[20:20]),
    .rx_clk_i(in_vec[19:19]),
    .rx_rstn_i(in_vec[18:18]),
    .rx_dv_i(in_vec[17:17]),
    .rx_dat_i(in_vec[16:1]),
    .stat_clr_i(in_vec[0:0]),
    .tx_dv_o(out_vec[80:80]),
    .tx_dat_o(out_vec[79:64]),
    .stat_err_o(out_vec[63:32]),
    .stat_dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h291895;
    stim[1] = 22'h2e8c4c;
    stim[2] = 22'h0ac8c1;
    stim[3] = 22'h1a6f59;
    stim[4] = 22'h16ddfb;
    stim[5] = 22'h1e86e4;
    stim[6] = 22'h0cbd6f;
    stim[7] = 22'h1b3b11;
    stim[8] = 22'h018d43;
    stim[9] = 22'h0074b2;
    stim[10] = 22'h10c8ad;
    stim[11] = 22'h05e264;
    stim[12] = 22'h1c95ef;
    stim[13] = 22'h0448c7;
    stim[14] = 22'h07dd77;
    stim[15] = 22'h13a5e6;
    stim[16] = 22'h1970e3;
    stim[17] = 22'h059f68;
    stim[18] = 22'h1da98f;
    stim[19] = 22'h011bd5;
    stim[20] = 22'h23dee8;
    stim[21] = 22'h102a34;
    stim[22] = 22'h052d32;
    stim[23] = 22'h050a42;
    stim[24] = 22'h14c334;
    stim[25] = 22'h063c57;
    stim[26] = 22'h08ac5b;
    stim[27] = 22'h0a23af;
    stim[28] = 22'h11a896;
    stim[29] = 22'h1b35bf;
    stim[30] = 22'h1e49ef;
    stim[31] = 22'h0988e9;
    stim[32] = 22'h009044;
    stim[33] = 22'h1993d8;
    stim[34] = 22'h0074f8;
    stim[35] = 22'h182633;
    stim[36] = 22'h0d41cc;
    stim[37] = 22'h16b11e;
    stim[38] = 22'h16aaa0;
    stim[39] = 22'h16007f;
    stim[40] = 22'h1c2df0;
    stim[41] = 22'h0f694b;
    stim[42] = 22'h148236;
    stim[43] = 22'h0a6977;
    stim[44] = 22'h1e0a02;
    stim[45] = 22'h0e346a;
    stim[46] = 22'h0ebfd1;
    stim[47] = 22'h1f2b45;
    stim[48] = 22'h0db35c;
    stim[49] = 22'h084a34;
    stim[50] = 22'h1bbba7;
    stim[51] = 22'h02a477;
    stim[52] = 22'h0e6df5;
    stim[53] = 22'h05d346;
    stim[54] = 22'h1c8876;
    stim[55] = 22'h118c20;
    stim[56] = 22'h04cf7f;
    stim[57] = 22'h022184;
    stim[58] = 22'h0a8518;
    stim[59] = 22'h127574;
    stim[60] = 22'h13e375;
    stim[61] = 22'h177fa4;
    stim[62] = 22'h05c774;
    stim[63] = 22'h15f33c;
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
      expv[0] = 81'h0xxxx0000000000000000;
      expv[1] = 81'h0xxxx0000000000000000;
      expv[2] = 81'h0xxxx0000000000000000;
      expv[3] = 81'h000000000000000000000;
      expv[4] = 81'h000000000000000000000;
      expv[5] = 81'h000000000000000000000;
      expv[6] = 81'h000000000000000000000;
      expv[7] = 81'h000000000000000000000;
      expv[8] = 81'h000000000000000000000;
      expv[9] = 81'h000000000000000000000;
      expv[10] = 81'h000000000000000000000;
      expv[11] = 81'h000000000000000000000;
      expv[12] = 81'h000000000000100000000;
      expv[13] = 81'h000000000000100000000;
      expv[14] = 81'h000000000000100000000;
      expv[15] = 81'h000000000000100000000;
      expv[16] = 81'h000000000000000000000;
      expv[17] = 81'h000000000000000000000;
      expv[18] = 81'h000000000000000000000;
      expv[19] = 81'h000000000000000000000;
      expv[20] = 81'h000000000000000000000;
      expv[21] = 81'h001010000000000000000;
      expv[22] = 81'h000000000000000000000;
      expv[23] = 81'h000000000000000000000;
      expv[24] = 81'h000000000000000000000;
      expv[25] = 81'h000000000000000000000;
      expv[26] = 81'h000000000000000000000;
      expv[27] = 81'h000000000000000000000;
      expv[28] = 81'h000000000000000000000;
      expv[29] = 81'h000000000000000000000;
      expv[30] = 81'h000000000000000000000;
      expv[31] = 81'h000000000000000000000;
      expv[32] = 81'h000000000000000000000;
      expv[33] = 81'h000000000000000000000;
      expv[34] = 81'h000000000000000000000;
      expv[35] = 81'h000000000000000000000;
      expv[36] = 81'h000000000000000000000;
      expv[37] = 81'h000000000000000000000;
      expv[38] = 81'h000000000000000000000;
      expv[39] = 81'h000000000000000000000;
      expv[40] = 81'h000000000000000000000;
      expv[41] = 81'h000000000000000000000;
      expv[42] = 81'h000000000000000000000;
      expv[43] = 81'h000000000000000000000;
      expv[44] = 81'h000000000000000000000;
      expv[45] = 81'h000000000000000000000;
      expv[46] = 81'h000000000000000000000;
      expv[47] = 81'h000000000000000000000;
      expv[48] = 81'h000000000000000000000;
      expv[49] = 81'h000000000000000000000;
      expv[50] = 81'h000000000000000000000;
      expv[51] = 81'h000000000000000000000;
      expv[52] = 81'h000000000000000000000;
      expv[53] = 81'h000000000000000000000;
      expv[54] = 81'h000000000000100000000;
      expv[55] = 81'h000000000000100000000;
      expv[56] = 81'h000000000000100000000;
      expv[57] = 81'h000000000000100000000;
      expv[58] = 81'h000000000000000000000;
      expv[59] = 81'h000000000000000000000;
      expv[60] = 81'h000000000000000000000;
      expv[61] = 81'h000000000000000000000;
      expv[62] = 81'h000000000000000000000;
      expv[63] = 81'h000000000000000000000;
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
