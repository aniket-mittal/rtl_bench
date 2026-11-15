// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axis_pipeline_fifo dut (
    .clk(clk),
    .rst(in_vec[29:29]),
    .s_axis_tdata(in_vec[28:21]),
    .s_axis_tkeep(in_vec[20:20]),
    .s_axis_tvalid(in_vec[19:19]),
    .s_axis_tlast(in_vec[18:18]),
    .s_axis_tid(in_vec[17:10]),
    .s_axis_tdest(in_vec[9:2]),
    .s_axis_tuser(in_vec[1:1]),
    .m_axis_tready(in_vec[0:0]),
    .s_axis_tready(out_vec[28:28]),
    .m_axis_tdata(out_vec[27:20]),
    .m_axis_tkeep(out_vec[19:19]),
    .m_axis_tvalid(out_vec[18:18]),
    .m_axis_tlast(out_vec[17:17]),
    .m_axis_tid(out_vec[16:9]),
    .m_axis_tdest(out_vec[8:1]),
    .m_axis_tuser(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h2df6e788;
    stim[1] = 30'h353d8006;
    stim[2] = 30'h10df8bc1;
    stim[3] = 30'h161b4c4e;
    stim[4] = 30'h39f45a83;
    stim[5] = 30'h0fa16d7c;
    stim[6] = 30'h16cd161f;
    stim[7] = 30'h1759df0b;
    stim[8] = 30'h19109853;
    stim[9] = 30'h02faab3c;
    stim[10] = 30'h15ddb4a1;
    stim[11] = 30'h16faede9;
    stim[12] = 30'h048a6af8;
    stim[13] = 30'h0cecd007;
    stim[14] = 30'h1a13c8f4;
    stim[15] = 30'h0ac436bd;
    stim[16] = 30'h1c6d614a;
    stim[17] = 30'h1f8f74b2;
    stim[18] = 30'h10c50987;
    stim[19] = 30'h1b60bf07;
    stim[20] = 30'h17bc5a79;
    stim[21] = 30'h0263af9a;
    stim[22] = 30'h174aad92;
    stim[23] = 30'h050b9a11;
    stim[24] = 30'h1046c7ea;
    stim[25] = 30'h14614831;
    stim[26] = 30'h10d28d50;
    stim[27] = 30'h07925bab;
    stim[28] = 30'h00b428c6;
    stim[29] = 30'h1c2610e1;
    stim[30] = 30'h1e1cb86c;
    stim[31] = 30'h14c0bc12;
    stim[32] = 30'h18940e99;
    stim[33] = 30'h0ddbd5d2;
    stim[34] = 30'h174fbc37;
    stim[35] = 30'h1d8f313c;
    stim[36] = 30'h1c5adc50;
    stim[37] = 30'h1af864de;
    stim[38] = 30'h16bda217;
    stim[39] = 30'h1ac0849d;
    stim[40] = 30'h18cd0787;
    stim[41] = 30'h02d7b314;
    stim[42] = 30'h136f8c52;
    stim[43] = 30'h0d5e8228;
    stim[44] = 30'h006b89b6;
    stim[45] = 30'h0d95ecbe;
    stim[46] = 30'h0ae04c1b;
    stim[47] = 30'h180efede;
    stim[48] = 30'h1188403a;
    stim[49] = 30'h0c444154;
    stim[50] = 30'h0b89ca5e;
    stim[51] = 30'h0f11af3c;
    stim[52] = 30'h0b1dfd65;
    stim[53] = 30'h0e418518;
    stim[54] = 30'h1b96f6b3;
    stim[55] = 30'h075d3cb9;
    stim[56] = 30'h0ebfdc12;
    stim[57] = 30'h14404a55;
    stim[58] = 30'h025f3f45;
    stim[59] = 30'h042744b7;
    stim[60] = 30'h0cf4fc1b;
    stim[61] = 30'h0e03166b;
    stim[62] = 30'h031b6d9d;
    stim[63] = 30'h01d21b77;
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
      expv[0] = 29'h00080000;
      expv[1] = 29'h00080000;
      expv[2] = 29'h00080000;
      expv[3] = 29'h00080000;
      expv[4] = 29'h10080000;
      expv[5] = 29'h00080000;
      expv[6] = 29'h00080000;
      expv[7] = 29'h10080000;
      expv[8] = 29'h10080000;
      expv[9] = 29'h10080000;
      expv[10] = 29'h10080000;
      expv[11] = 29'h1bac0001;
      expv[12] = 29'h1ba80001;
      expv[13] = 29'h117c0000;
      expv[14] = 29'h1aee0000;
      expv[15] = 29'h1aee0000;
      expv[16] = 29'h1b7c0000;
      expv[17] = 29'h1b7c0000;
      expv[18] = 29'h1b7c0000;
      expv[19] = 29'h124c0000;
      expv[20] = 29'h167e0001;
      expv[21] = 29'h1e3e0001;
      expv[22] = 29'h1e3e0001;
      expv[23] = 29'h1e3e0001;
      expv[24] = 29'h1fce0001;
      expv[25] = 29'h1fce0001;
      expv[26] = 29'h1bde0000;
      expv[27] = 29'h1bde0000;
      expv[28] = 29'h1bac0001;
      expv[29] = 29'h1bac0001;
      expv[30] = 29'h128c0000;
      expv[31] = 29'h128c0000;
      expv[32] = 29'h128c0000;
      expv[33] = 29'h12880000;
      expv[34] = 29'h1f0e0000;
      expv[35] = 29'h1f0a0000;
      expv[36] = 29'h1f0a0000;
      expv[37] = 29'h16ec0001;
      expv[38] = 29'h16ec0001;
      expv[39] = 29'h1bae0001;
      expv[40] = 29'h1ece0000;
      expv[41] = 29'h1e2c0000;
      expv[42] = 29'h1e2c0000;
      expv[43] = 29'h1e2c0000;
      expv[44] = 29'h1e2c0000;
      expv[45] = 29'h1e2c0000;
      expv[46] = 29'h1e2c0000;
      expv[47] = 29'h1d7c0001;
      expv[48] = 29'h1d7c0001;
      expv[49] = 29'h1d7c0001;
      expv[50] = 29'h1d7c0001;
      expv[51] = 29'h1d7c0001;
      expv[52] = 29'h1d7c0001;
      expv[53] = 29'h1b5e0001;
      expv[54] = 29'h1b5e0001;
      expv[55] = 29'h1c6e0001;
      expv[56] = 29'h19be0001;
      expv[57] = 29'h19be0001;
      expv[58] = 29'h16ae0000;
      expv[59] = 29'h103c0001;
      expv[60] = 29'h1c0e0001;
      expv[61] = 29'h18cc0001;
      expv[62] = 29'h15cc0001;
      expv[63] = 29'h158e0000;
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
