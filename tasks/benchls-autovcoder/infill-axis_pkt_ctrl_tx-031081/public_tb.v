// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031081 dut (
    .m_axis_txc_aclk(clk),
    .m_axis_txd_tvalid(in_vec[57:57]),
    .m_axis_txd_tlast(in_vec[56:56]),
    .m_axis_txd_tready(in_vec[55:55]),
    .tx_pkt_byte_cnt(in_vec[54:43]),
    .tx_pkt_byte_cnt_vld(in_vec[42:42]),
    .s_axis_rxs_aclk(in_vec[41:41]),
    .s_axis_rxs_aresetn(in_vec[40:40]),
    .s_axis_rxs_tdata(in_vec[39:8]),
    .s_axis_rxs_tkeep(in_vec[7:4]),
    .s_axis_rxs_tlast(in_vec[3:3]),
    .s_axis_rxs_tvalid(in_vec[2:2]),
    .m_axis_txc_aresetn(in_vec[1:1]),
    .m_axis_txc_tready(in_vec[0:0]),
    .s_axis_rxs_tready(out_vec[38:38]),
    .m_axis_txc_tvalid(out_vec[37:37]),
    .m_axis_txc_tdata(out_vec[36:5]),
    .m_axis_txc_tkeep(out_vec[4:1]),
    .m_axis_txc_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h33da0e3ec1d49c0;
    stim[1] = 58'h022a422c06c016b;
    stim[2] = 58'h32673a98867c5db;
    stim[3] = 58'h0f89197c79b0e34;
    stim[4] = 58'h33be54618434925;
    stim[5] = 58'h2429d1d4cda614c;
    stim[6] = 58'h02f7bbd463de562;
    stim[7] = 58'h1577ba21b14a9ca;
    stim[8] = 58'h0bdb1f056230134;
    stim[9] = 58'h2666547d53d5ce3;
    stim[10] = 58'h0e07f433c78a605;
    stim[11] = 58'h35a4154d6f7a5b5;
    stim[12] = 58'h32f777c20e9968f;
    stim[13] = 58'h23851c133b7d975;
    stim[14] = 58'h1aefd4c958d4805;
    stim[15] = 58'h076ff2d867431c1;
    stim[16] = 58'h29a536d2fd38fd6;
    stim[17] = 58'h3f04505ea4bc701;
    stim[18] = 58'h1ea3d6d8bb3bd14;
    stim[19] = 58'h0cd15f0f60d8968;
    stim[20] = 58'h23887616ad92cdd;
    stim[21] = 58'h35243d92bf2db2c;
    stim[22] = 58'h39db32d35b7c51c;
    stim[23] = 58'h3bf11cdfb7dc577;
    stim[24] = 58'h168759b7c6c9a2d;
    stim[25] = 58'h0d3475c078bc056;
    stim[26] = 58'h3ff53b007cf3f18;
    stim[27] = 58'h096c18a85d31ee7;
    stim[28] = 58'h26b19f69aae7481;
    stim[29] = 58'h05e8f8ab4190e1c;
    stim[30] = 58'h3767d555bf62134;
    stim[31] = 58'h3b14994967f9837;
    stim[32] = 58'h09d97205b218f72;
    stim[33] = 58'h3738f8c11c3c9d1;
    stim[34] = 58'h278f7292a7c855b;
    stim[35] = 58'h0ea918f0826e7b4;
    stim[36] = 58'h02887f99bf2c02e;
    stim[37] = 58'h11ca7765887d528;
    stim[38] = 58'h040b5ecf244831b;
    stim[39] = 58'h194b73847759811;
    stim[40] = 58'h03ecb73f7f61b5c;
    stim[41] = 58'h0c88bd182c6f5fb;
    stim[42] = 58'h1863f2f5225c340;
    stim[43] = 58'h11773e964b4e280;
    stim[44] = 58'h3c0111f055b0caf;
    stim[45] = 58'h30b85182e071a51;
    stim[46] = 58'h2f335e52cbf1420;
    stim[47] = 58'h0532d7982119b18;
    stim[48] = 58'h00b43849a5a5fc8;
    stim[49] = 58'h29d7f1428ea8df0;
    stim[50] = 58'h15da189d2f97e7a;
    stim[51] = 58'h351ada0ef5790d6;
    stim[52] = 58'h08e2db533aaa15f;
    stim[53] = 58'h0461bbf7487d6db;
    stim[54] = 58'h2e619bfe273851b;
    stim[55] = 58'h19a8f3323df7e1b;
    stim[56] = 58'h0ed0f6bd1f07bba;
    stim[57] = 58'h3e369eabe43cf20;
    stim[58] = 58'h0937d04814007f0;
    stim[59] = 58'h081a51b9017e5c3;
    stim[60] = 58'h104e92ae030a257;
    stim[61] = 58'h32a3df12ee0d535;
    stim[62] = 58'h3fe0562cf9d345d;
    stim[63] = 58'h208b3ffaec4c2d8;
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
      expv[0] = 39'hxxxxxxxxxx;
      expv[1] = 39'h5ffffffffe;
      expv[2] = 39'h4a000xxxxe;
      expv[3] = 39'h6a000xxxxe;
      expv[4] = 39'h5ffffffffe;
      expv[5] = 39'h5ffffffffe;
      expv[6] = 39'h5ffffffffe;
      expv[7] = 39'h4a000xxxxe;
      expv[8] = 39'h4a000xxxxe;
      expv[9] = 39'h5ffffffffe;
      expv[10] = 39'h6a000xxxxe;
      expv[11] = 39'h5ffffffffe;
      expv[12] = 39'h5ffffffffe;
      expv[13] = 39'h6a000xxxxe;
      expv[14] = 39'h5ffffffffe;
      expv[15] = 39'h5ffffffffe;
      expv[16] = 39'h5ffffffffe;
      expv[17] = 39'h6a000xxxxe;
      expv[18] = 39'h5ffffffffe;
      expv[19] = 39'h5ffffffffe;
      expv[20] = 39'h5ffffffffe;
      expv[21] = 39'h5ffffffffe;
      expv[22] = 39'h5ffffffffe;
      expv[23] = 39'h5ffffffffe;
      expv[24] = 39'h6a000xxxxe;
      expv[25] = 39'h5ffffffffe;
      expv[26] = 39'h4a000xxxxe;
      expv[27] = 39'h5ffffffffe;
      expv[28] = 39'h4a000xxxxe;
      expv[29] = 39'h5ffffffffe;
      expv[30] = 39'h5ffffffffe;
      expv[31] = 39'h5ffffffffe;
      expv[32] = 39'h6a000xxxxe;
      expv[33] = 39'h6a000xxxxe;
      expv[34] = 39'h5ffffffffe;
      expv[35] = 39'h6a000xxxxe;
      expv[36] = 39'h5ffffffffe;
      expv[37] = 39'h4a000xxxxe;
      expv[38] = 39'h5ffffffffe;
      expv[39] = 39'h4a000xxxxe;
      expv[40] = 39'h5ffffffffe;
      expv[41] = 39'h5ffffffffe;
      expv[42] = 39'h4a000xxxxe;
      expv[43] = 39'h5ffffffffe;
      expv[44] = 39'h5ffffffffe;
      expv[45] = 39'h6a000xxxxe;
      expv[46] = 39'h5ffffffffe;
      expv[47] = 39'h5ffffffffe;
      expv[48] = 39'h5ffffffffe;
      expv[49] = 39'h5ffffffffe;
      expv[50] = 39'h5ffffffffe;
      expv[51] = 39'h4a000xxxxe;
      expv[52] = 39'h6a000xxxxe;
      expv[53] = 39'h6a000xxxxe;
      expv[54] = 39'h6a000xxxxe;
      expv[55] = 39'h6a000xxxxe;
      expv[56] = 39'h6a000xxxxe;
      expv[57] = 39'h6a000xxxxe;
      expv[58] = 39'h5ffffffffe;
      expv[59] = 39'h5ffffffffe;
      expv[60] = 39'h4a000xxxxe;
      expv[61] = 39'h4a000xxxxe;
      expv[62] = 39'h5ffffffffe;
      expv[63] = 39'h5ffffffffe;
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
