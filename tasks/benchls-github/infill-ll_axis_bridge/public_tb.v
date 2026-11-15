// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ll_axis_bridge dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .ll_data_in(in_vec[11:4]),
    .ll_sof_in_n(in_vec[3:3]),
    .ll_eof_in_n(in_vec[2:2]),
    .ll_src_rdy_in_n(in_vec[1:1]),
    .m_axis_tready(in_vec[0:0]),
    .ll_dst_rdy_out_n(out_vec[10:10]),
    .m_axis_tdata(out_vec[9:2]),
    .m_axis_tvalid(out_vec[1:1]),
    .m_axis_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h14c7;
    stim[1] = 13'h1bd9;
    stim[2] = 13'h0f02;
    stim[3] = 13'h05c8;
    stim[4] = 13'h0afc;
    stim[5] = 13'h0c2e;
    stim[6] = 13'h04dd;
    stim[7] = 13'h0dc3;
    stim[8] = 13'h0b93;
    stim[9] = 13'h02da;
    stim[10] = 13'h0b55;
    stim[11] = 13'h003e;
    stim[12] = 13'h0cf3;
    stim[13] = 13'h04cb;
    stim[14] = 13'h027b;
    stim[15] = 13'h0348;
    stim[16] = 13'h0ce4;
    stim[17] = 13'h0b90;
    stim[18] = 13'h0d36;
    stim[19] = 13'h0bcd;
    stim[20] = 13'h0f13;
    stim[21] = 13'h0cf7;
    stim[22] = 13'h055f;
    stim[23] = 13'h0e82;
    stim[24] = 13'h03e4;
    stim[25] = 13'h0226;
    stim[26] = 13'h0ee4;
    stim[27] = 13'h00ed;
    stim[28] = 13'h0c48;
    stim[29] = 13'h08d7;
    stim[30] = 13'h0103;
    stim[31] = 13'h033c;
    stim[32] = 13'h0c32;
    stim[33] = 13'h0e10;
    stim[34] = 13'h0d21;
    stim[35] = 13'h0f50;
    stim[36] = 13'h0a54;
    stim[37] = 13'h00e3;
    stim[38] = 13'h03bb;
    stim[39] = 13'h1e10;
    stim[40] = 13'h06cd;
    stim[41] = 13'h0876;
    stim[42] = 13'h050f;
    stim[43] = 13'h071a;
    stim[44] = 13'h0200;
    stim[45] = 13'h0375;
    stim[46] = 13'h0d6e;
    stim[47] = 13'h08cb;
    stim[48] = 13'h0599;
    stim[49] = 13'h0c57;
    stim[50] = 13'h04bc;
    stim[51] = 13'h0dc3;
    stim[52] = 13'h0234;
    stim[53] = 13'h02d1;
    stim[54] = 13'h08d6;
    stim[55] = 13'h022d;
    stim[56] = 13'h09ef;
    stim[57] = 13'h0b14;
    stim[58] = 13'h0eea;
    stim[59] = 13'h0a02;
    stim[60] = 13'h0345;
    stim[61] = 13'h0325;
    stim[62] = 13'h0e6d;
    stim[63] = 13'h0357;
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
      expv[0] = 11'h130;
      expv[1] = 11'h2f7;
      expv[2] = 11'h7c1;
      expv[3] = 11'h573;
      expv[4] = 11'h6be;
      expv[5] = 11'h708;
      expv[6] = 11'h136;
      expv[7] = 11'h371;
      expv[8] = 11'h2e5;
      expv[9] = 11'h4b5;
      expv[10] = 11'h2d6;
      expv[11] = 11'h40c;
      expv[12] = 11'h33d;
      expv[13] = 11'h131;
      expv[14] = 11'h09d;
      expv[15] = 11'h4d3;
      expv[16] = 11'h73a;
      expv[17] = 11'h6e7;
      expv[18] = 11'h74c;
      expv[19] = 11'h2f2;
      expv[20] = 11'h3c5;
      expv[21] = 11'h33c;
      expv[22] = 11'h154;
      expv[23] = 11'h7a1;
      expv[24] = 11'h4fa;
      expv[25] = 11'h488;
      expv[26] = 11'h7ba;
      expv[27] = 11'h03a;
      expv[28] = 11'h713;
      expv[29] = 11'h234;
      expv[30] = 11'h041;
      expv[31] = 11'h4ce;
      expv[32] = 11'h70d;
      expv[33] = 11'h787;
      expv[34] = 11'h34b;
      expv[35] = 11'h7d7;
      expv[36] = 11'h696;
      expv[37] = 11'h039;
      expv[38] = 11'h0ed;
      expv[39] = 11'h787;
      expv[40] = 11'h1b2;
      expv[41] = 11'h61c;
      expv[42] = 11'h140;
      expv[43] = 11'h5c5;
      expv[44] = 11'h483;
      expv[45] = 11'h0de;
      expv[46] = 11'h758;
      expv[47] = 11'h231;
      expv[48] = 11'h167;
      expv[49] = 11'h314;
      expv[50] = 11'h52e;
      expv[51] = 11'h371;
      expv[52] = 11'h48e;
      expv[53] = 11'h0b7;
      expv[54] = 11'h634;
      expv[55] = 11'h08a;
      expv[56] = 11'h278;
      expv[57] = 11'h6c6;
      expv[58] = 11'h7b9;
      expv[59] = 11'h681;
      expv[60] = 11'h0d2;
      expv[61] = 11'h0ca;
      expv[62] = 11'h39a;
      expv[63] = 11'h0d4;
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
