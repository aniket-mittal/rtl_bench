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

  rtlpp_01624 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .rx_in_d(in_vec[9:6]),
    .rx_in_rdy(in_vec[5:5]),
    .pi_mosi_d(in_vec[4:1]),
    .pi_mosi_rdy(in_vec[0:0]),
    .rx_out_d(out_vec[19:12]),
    .rx_out_rdy(out_vec[11:11]),
    .rx_loc_d(out_vec[10:3]),
    .rx_loc_rdy(out_vec[2:2]),
    .rx_loc_start(out_vec[1:1]),
    .rx_loc_stop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6a2;
    stim[1] = 11'h78d;
    stim[2] = 11'h3c6;
    stim[3] = 11'h25a;
    stim[4] = 11'h03c;
    stim[5] = 11'h061;
    stim[6] = 11'h3cd;
    stim[7] = 11'h08b;
    stim[8] = 11'h05b;
    stim[9] = 11'h308;
    stim[10] = 11'h3a1;
    stim[11] = 11'h0e0;
    stim[12] = 11'h075;
    stim[13] = 11'h2de;
    stim[14] = 11'h181;
    stim[15] = 11'h320;
    stim[16] = 11'h34a;
    stim[17] = 11'h15c;
    stim[18] = 11'h3c7;
    stim[19] = 11'h1ee;
    stim[20] = 11'h3f2;
    stim[21] = 11'h390;
    stim[22] = 11'h313;
    stim[23] = 11'h2bf;
    stim[24] = 11'h01f;
    stim[25] = 11'h388;
    stim[26] = 11'h2e0;
    stim[27] = 11'h353;
    stim[28] = 11'h3df;
    stim[29] = 11'h3e2;
    stim[30] = 11'h094;
    stim[31] = 11'h081;
    stim[32] = 11'h043;
    stim[33] = 11'h038;
    stim[34] = 11'h113;
    stim[35] = 11'h1f4;
    stim[36] = 11'h1e8;
    stim[37] = 11'h2fe;
    stim[38] = 11'h145;
    stim[39] = 11'h2fd;
    stim[40] = 11'h148;
    stim[41] = 11'h2e6;
    stim[42] = 11'h1a0;
    stim[43] = 11'h0db;
    stim[44] = 11'h233;
    stim[45] = 11'h37b;
    stim[46] = 11'h152;
    stim[47] = 11'h1e8;
    stim[48] = 11'h260;
    stim[49] = 11'h274;
    stim[50] = 11'h0d7;
    stim[51] = 11'h25c;
    stim[52] = 11'h270;
    stim[53] = 11'h2dc;
    stim[54] = 11'h3e9;
    stim[55] = 11'h2e4;
    stim[56] = 11'h38c;
    stim[57] = 11'h1f2;
    stim[58] = 11'h0e0;
    stim[59] = 11'h394;
    stim[60] = 11'h00a;
    stim[61] = 11'h339;
    stim[62] = 11'h06d;
    stim[63] = 11'h136;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hxxxxx;
      expv[3] = 20'hxxxxx;
      expv[4] = 20'hxxxxx;
      expv[5] = 20'hxxxxx;
      expv[6] = 20'hxxxxx;
      expv[7] = 20'h00806;
      expv[8] = 20'h05ff4;
      expv[9] = 20'h057f0;
      expv[10] = 20'h5daec;
      expv[11] = 20'h5d2e8;
      expv[12] = 20'h5d2e8;
      expv[13] = 20'h0381c;
      expv[14] = 20'h03018;
      expv[15] = 20'h3a9d4;
      expv[16] = 20'h3a1d0;
      expv[17] = 20'h3a1d0;
      expv[18] = 20'h0c864;
      expv[19] = 20'h0c060;
      expv[20] = 20'h0c060;
      expv[21] = 20'h0c060;
      expv[22] = 20'h7fbfd;
      expv[23] = 20'h7f3f8;
      expv[24] = 20'h7f3f8;
      expv[25] = 20'h7f3f8;
      expv[26] = 20'h7f3f8;
      expv[27] = 20'h7f3f8;
      expv[28] = 20'h7f3f8;
      expv[29] = 20'h7f3f8;
      expv[30] = 20'h7f3f8;
      expv[31] = 20'h7f3f8;
      expv[32] = 20'h7f3f8;
      expv[33] = 20'h7f3f8;
      expv[34] = 20'h0180e;
      expv[35] = 20'h0fff4;
      expv[36] = 20'h0f7f0;
      expv[37] = 20'h97cbc;
      expv[38] = 20'h974b8;
      expv[39] = 20'h7bbdc;
      expv[40] = 20'h7b3d8;
      expv[41] = 20'h2e974;
      expv[42] = 20'h2e170;
      expv[43] = 20'h2e170;
      expv[44] = 20'hb6db4;
      expv[45] = 20'hb65b0;
      expv[46] = 20'hd9ecc;
      expv[47] = 20'hd96c8;
      expv[48] = 20'h9dcec;
      expv[49] = 20'h9d4e8;
      expv[50] = 20'h9d4e8;
      expv[51] = 20'h99ccc;
      expv[52] = 20'h994c8;
      expv[53] = 20'h9bcdc;
      expv[54] = 20'h9b4d8;
      expv[55] = 20'h9b4d8;
      expv[56] = 20'h9b4d8;
      expv[57] = 20'h4ba5c;
      expv[58] = 20'h4b258;
      expv[59] = 20'h4b258;
      expv[60] = 20'h73b9c;
      expv[61] = 20'h73398;
      expv[62] = 20'h73398;
      expv[63] = 20'h73398;
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
