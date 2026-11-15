// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11342 dut (
    .clk(clk),
    .rst(in_vec[39:39]),
    .cmd_phy_addr(in_vec[38:34]),
    .cmd_reg_addr(in_vec[33:29]),
    .cmd_data(in_vec[28:13]),
    .cmd_opcode(in_vec[12:11]),
    .cmd_valid(in_vec[10:10]),
    .data_out_ready(in_vec[9:9]),
    .mdio_i(in_vec[8:8]),
    .prescale(in_vec[7:0]),
    .cmd_ready(out_vec[21:21]),
    .data_out(out_vec[20:5]),
    .data_out_valid(out_vec[4:4]),
    .mdc_o(out_vec[3:3]),
    .mdio_o(out_vec[2:2]),
    .mdio_t(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'ha940569363;
    stim[1] = 40'h99b4589a4b;
    stim[2] = 40'h1a93324728;
    stim[3] = 40'h2e8e51daed;
    stim[4] = 40'h5c4bd0f102;
    stim[5] = 40'h593d624010;
    stim[6] = 40'h6e6cf558dd;
    stim[7] = 40'h1b057aa9af;
    stim[8] = 40'h420464ea7b;
    stim[9] = 40'h6c511cbf15;
    stim[10] = 40'h1296041c38;
    stim[11] = 40'h4ec5186dae;
    stim[12] = 40'h54d0949e89;
    stim[13] = 40'h176504e050;
    stim[14] = 40'h46f867b501;
    stim[15] = 40'h5c50562fdf;
    stim[16] = 40'h1ddf561f1d;
    stim[17] = 40'h1e3cb73047;
    stim[18] = 40'h0adc7028e4;
    stim[19] = 40'h798e4d9eee;
    stim[20] = 40'h0e9cabe441;
    stim[21] = 40'h16753be20c;
    stim[22] = 40'h47d17ffa16;
    stim[23] = 40'h648bddd179;
    stim[24] = 40'h2609b27c02;
    stim[25] = 40'h185650d651;
    stim[26] = 40'h5bbeef3a97;
    stim[27] = 40'h47da7f8957;
    stim[28] = 40'h5a4f9d3316;
    stim[29] = 40'h69b0e2e2ec;
    stim[30] = 40'h5c3941529f;
    stim[31] = 40'h4e728d78f1;
    stim[32] = 40'h15d360b6c6;
    stim[33] = 40'h691004d356;
    stim[34] = 40'h6da156d248;
    stim[35] = 40'h52a0300cab;
    stim[36] = 40'h14aa539b46;
    stim[37] = 40'h53a7792332;
    stim[38] = 40'h52e46bf67e;
    stim[39] = 40'h70079e89f8;
    stim[40] = 40'h256d1155c1;
    stim[41] = 40'h4ca09ed104;
    stim[42] = 40'h7d5064b083;
    stim[43] = 40'he751cd3842;
    stim[44] = 40'hc833027c9b;
    stim[45] = 40'h29c4273b13;
    stim[46] = 40'h00e5ac9863;
    stim[47] = 40'h4d4f689842;
    stim[48] = 40'h305d1f7de4;
    stim[49] = 40'h2f17479808;
    stim[50] = 40'h19dc280f96;
    stim[51] = 40'h3185d24f63;
    stim[52] = 40'h3b042afd27;
    stim[53] = 40'h5f0c14bf4b;
    stim[54] = 40'h049727b278;
    stim[55] = 40'h0e0259fc7e;
    stim[56] = 40'hb2abc7f773;
    stim[57] = 40'h7be5f913d5;
    stim[58] = 40'h7e0ae3c2e2;
    stim[59] = 40'h652c131c38;
    stim[60] = 40'h42d652ddf2;
    stim[61] = 40'h4994b2d07b;
    stim[62] = 40'h7756e2a8af;
    stim[63] = 40'h10833385cd;
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
      expv[0] = 22'h000002;
      expv[1] = 22'h000002;
      expv[2] = 22'h000002;
      expv[3] = 22'h200002;
      expv[4] = 22'h200002;
      expv[5] = 22'h200002;
      expv[6] = 22'h200002;
      expv[7] = 22'h200002;
      expv[8] = 22'h200002;
      expv[9] = 22'h200002;
      expv[10] = 22'h000005;
      expv[11] = 22'h000005;
      expv[12] = 22'h000005;
      expv[13] = 22'h000005;
      expv[14] = 22'h000005;
      expv[15] = 22'h000005;
      expv[16] = 22'h000005;
      expv[17] = 22'h000005;
      expv[18] = 22'h000005;
      expv[19] = 22'h000005;
      expv[20] = 22'h000005;
      expv[21] = 22'h000005;
      expv[22] = 22'h000005;
      expv[23] = 22'h000005;
      expv[24] = 22'h000005;
      expv[25] = 22'h000005;
      expv[26] = 22'h000005;
      expv[27] = 22'h000005;
      expv[28] = 22'h000005;
      expv[29] = 22'h000005;
      expv[30] = 22'h000005;
      expv[31] = 22'h000005;
      expv[32] = 22'h00000d;
      expv[33] = 22'h00000d;
      expv[34] = 22'h00000d;
      expv[35] = 22'h00000d;
      expv[36] = 22'h00000d;
      expv[37] = 22'h00000d;
      expv[38] = 22'h00000d;
      expv[39] = 22'h00000d;
      expv[40] = 22'h00000d;
      expv[41] = 22'h00000d;
      expv[42] = 22'h00000d;
      expv[43] = 22'h00000d;
      expv[44] = 22'h000002;
      expv[45] = 22'h000002;
      expv[46] = 22'h200002;
      expv[47] = 22'h200002;
      expv[48] = 22'h200002;
      expv[49] = 22'h000005;
      expv[50] = 22'h000005;
      expv[51] = 22'h000005;
      expv[52] = 22'h000005;
      expv[53] = 22'h000005;
      expv[54] = 22'h000005;
      expv[55] = 22'h000005;
      expv[56] = 22'h000005;
      expv[57] = 22'h000002;
      expv[58] = 22'h200002;
      expv[59] = 22'h200002;
      expv[60] = 22'h000005;
      expv[61] = 22'h000005;
      expv[62] = 22'h000005;
      expv[63] = 22'h000005;
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
