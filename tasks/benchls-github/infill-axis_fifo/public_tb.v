// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 59;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axis_fifo dut (
    .clk(clk),
    .rst(in_vec[30:30]),
    .s_axis_tdata(in_vec[29:22]),
    .s_axis_tkeep(in_vec[21:21]),
    .s_axis_tvalid(in_vec[20:20]),
    .s_axis_tlast(in_vec[19:19]),
    .s_axis_tid(in_vec[18:11]),
    .s_axis_tdest(in_vec[10:3]),
    .s_axis_tuser(in_vec[2:2]),
    .m_axis_tready(in_vec[1:1]),
    .pause_req(in_vec[0:0]),
    .s_axis_tready(out_vec[58:58]),
    .m_axis_tdata(out_vec[57:50]),
    .m_axis_tkeep(out_vec[49:49]),
    .m_axis_tvalid(out_vec[48:48]),
    .m_axis_tlast(out_vec[47:47]),
    .m_axis_tid(out_vec[46:39]),
    .m_axis_tdest(out_vec[38:31]),
    .m_axis_tuser(out_vec[30:30]),
    .pause_ack(out_vec[29:29]),
    .status_depth(out_vec[28:16]),
    .status_depth_commit(out_vec[15:3]),
    .status_overflow(out_vec[2:2]),
    .status_bad_frame(out_vec[1:1]),
    .status_good_frame(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h7c6cb495;
    stim[1] = 31'h554a1bf8;
    stim[2] = 31'h1bff3b50;
    stim[3] = 31'h3826229e;
    stim[4] = 31'h102983ed;
    stim[5] = 31'h111a88c1;
    stim[6] = 31'h109bf1cd;
    stim[7] = 31'h32ce40cb;
    stim[8] = 31'h3a621a20;
    stim[9] = 31'h18ea99a5;
    stim[10] = 31'h0c4c68ac;
    stim[11] = 31'h367290e7;
    stim[12] = 31'h065ea0eb;
    stim[13] = 31'h01dc3c27;
    stim[14] = 31'h166777f6;
    stim[15] = 31'h3e93800d;
    stim[16] = 31'h1db8d95b;
    stim[17] = 31'h264e4343;
    stim[18] = 31'h25275a8c;
    stim[19] = 31'h06071b8e;
    stim[20] = 31'h26fc225c;
    stim[21] = 31'h06a5c33a;
    stim[22] = 31'h1d47fa40;
    stim[23] = 31'h29f2b546;
    stim[24] = 31'h26f64aab;
    stim[25] = 31'h0c93b3c0;
    stim[26] = 31'h1df1bf62;
    stim[27] = 31'h0a82ac41;
    stim[28] = 31'h3c1ecda0;
    stim[29] = 31'h3b397a0d;
    stim[30] = 31'h077ba6bc;
    stim[31] = 31'h1c5e99eb;
    stim[32] = 31'h0748499c;
    stim[33] = 31'h123cc8f8;
    stim[34] = 31'h09b9807a;
    stim[35] = 31'h12646fa3;
    stim[36] = 31'h22f980ac;
    stim[37] = 31'h07cb9d11;
    stim[38] = 31'h6b58221b;
    stim[39] = 31'h06598c83;
    stim[40] = 31'h25255b21;
    stim[41] = 31'h333f80d3;
    stim[42] = 31'h10044b17;
    stim[43] = 31'h1b7f0717;
    stim[44] = 31'h1887a00e;
    stim[45] = 31'h04572bbd;
    stim[46] = 31'h0520b6e3;
    stim[47] = 31'h001997e3;
    stim[48] = 31'h24ffdd18;
    stim[49] = 31'h397eee91;
    stim[50] = 31'h0a7edfbb;
    stim[51] = 31'h3c66b772;
    stim[52] = 31'h0a9af7df;
    stim[53] = 31'h36086c22;
    stim[54] = 31'h2b04efa9;
    stim[55] = 31'h220b1881;
    stim[56] = 31'h25d86403;
    stim[57] = 31'h1373ee5f;
    stim[58] = 31'h311d7f34;
    stim[59] = 31'h31ad2a22;
    stim[60] = 31'h0e4b2061;
    stim[61] = 31'h099ef243;
    stim[62] = 31'h0d50fb48;
    stim[63] = 31'h3d0afa26;
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
      expv[0] = 59'hxxxx000x0000000;
      expv[1] = 59'hxxxx000x0000000;
      expv[2] = 59'hxxxx000x0000000;
      expv[3] = 59'hxxxx000x0000000;
      expv[4] = 59'hxxxx000x0010008;
      expv[5] = 59'h5bf800000000000;
      expv[6] = 59'h5bf800000000000;
      expv[7] = 59'h5bf800000010008;
      expv[8] = 59'h513800000010008;
      expv[9] = 59'h513800000000000;
      expv[10] = 59'h513800000000000;
      expv[11] = 59'h513800000000000;
      expv[12] = 59'h50b800040000000;
      expv[13] = 59'hxxxx000x0010008;
      expv[14] = 59'h767000040010008;
      expv[15] = 59'h467800000010008;
      expv[16] = 59'h467800000000000;
      expv[17] = 59'h41f800040010008;
      expv[18] = 59'h7eb000040010008;
      expv[19] = 59'h7eb000040000000;
      expv[20] = 59'h5db800000000000;
      expv[21] = 59'h5db800000000000;
      expv[22] = 59'hxxxx000x0010008;
      expv[23] = 59'h66f800040000000;
      expv[24] = 59'hxxxx000x0000000;
      expv[25] = 59'hxxxx000x0010008;
      expv[26] = 59'h69f000040010008;
      expv[27] = 59'h66f000000010008;
      expv[28] = 59'h66f000000010008;
      expv[29] = 59'h66f000000010008;
      expv[30] = 59'h66f000000020010;
      expv[31] = 59'h66f000000030018;
      expv[32] = 59'h4cb000000040020;
      expv[33] = 59'h4cb000000040020;
      expv[34] = 59'h4cb000000040020;
      expv[35] = 59'h5df000000050028;
      expv[36] = 59'h7c3800000050028;
      expv[37] = 59'h7c3800000040020;
      expv[38] = 59'h7c3800000050028;
      expv[39] = 59'h7b2800040050028;
      expv[40] = 59'h476800040000000;
      expv[41] = 59'h5be800000010008;
      expv[42] = 59'h467800000000000;
      expv[43] = 59'h512800000010008;
      expv[44] = 59'h733800000000000;
      expv[45] = 59'h50a800040010008;
      expv[46] = 59'h5b7800040000000;
      expv[47] = 59'h766000040010008;
      expv[48] = 59'h447000040000000;
      expv[49] = 59'h447000040010008;
      expv[50] = 59'h447000040010008;
      expv[51] = 59'h403800000020010;
      expv[52] = 59'h64f800000020010;
      expv[53] = 59'h797800000010008;
      expv[54] = 59'h4a7800000010008;
      expv[55] = 59'h4a7800000000000;
      expv[56] = 59'h4a7800000000000;
      expv[57] = 59'h4ab800040000000;
      expv[58] = 59'h69e000040010008;
      expv[59] = 59'h65f800000010008;
      expv[60] = 59'h537000040010008;
      expv[61] = 59'h537000040000000;
      expv[62] = 59'h713800040000000;
      expv[63] = 59'h713800040010008;
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
