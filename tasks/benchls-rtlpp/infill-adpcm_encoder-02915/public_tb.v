// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02915 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[63:60]),
    .p_out(out_vec[59:44]),
    .p_underflow(out_vec[43:43]),
    .p_overflow(out_vec[42:42]),
    .i_out(out_vec[41:34]),
    .i_underflow(out_vec[33:33]),
    .i_overflow(out_vec[32:32]),
    .err(out_vec[31:16]),
    .sz_out(out_vec[15:1]),
    .s_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1d3b4;
    stim[1] = 17'h14899;
    stim[2] = 17'h16df9;
    stim[3] = 17'h0d868;
    stim[4] = 17'h05b79;
    stim[5] = 17'h0197e;
    stim[6] = 17'h0fd46;
    stim[7] = 17'h04977;
    stim[8] = 17'h19e73;
    stim[9] = 17'h04b39;
    stim[10] = 17'h0144f;
    stim[11] = 17'h06194;
    stim[12] = 17'h054e5;
    stim[13] = 17'h0fac5;
    stim[14] = 17'h04460;
    stim[15] = 17'h02dd8;
    stim[16] = 17'h0f81b;
    stim[17] = 17'h0f60a;
    stim[18] = 17'h002b7;
    stim[19] = 17'h07ffb;
    stim[20] = 17'h00d93;
    stim[21] = 17'h0f7e1;
    stim[22] = 17'h034d9;
    stim[23] = 17'h0679e;
    stim[24] = 17'h021f8;
    stim[25] = 17'h005da;
    stim[26] = 17'h0e872;
    stim[27] = 17'h0eb34;
    stim[28] = 17'h0c7af;
    stim[29] = 17'h02b80;
    stim[30] = 17'h00be3;
    stim[31] = 17'h02db6;
    stim[32] = 17'h081c7;
    stim[33] = 17'h08448;
    stim[34] = 17'h0456a;
    stim[35] = 17'h121e5;
    stim[36] = 17'h020dc;
    stim[37] = 17'h09c08;
    stim[38] = 17'h08796;
    stim[39] = 17'h0b115;
    stim[40] = 17'h05df1;
    stim[41] = 17'h00572;
    stim[42] = 17'h057ca;
    stim[43] = 17'h0aa98;
    stim[44] = 17'h0e626;
    stim[45] = 17'h067ad;
    stim[46] = 17'h072ec;
    stim[47] = 17'h02ca9;
    stim[48] = 17'h03e26;
    stim[49] = 17'h0fee2;
    stim[50] = 17'h075e3;
    stim[51] = 17'h0eea0;
    stim[52] = 17'h02586;
    stim[53] = 17'h0e621;
    stim[54] = 17'h0749e;
    stim[55] = 17'h07e1f;
    stim[56] = 17'h0cec8;
    stim[57] = 17'h00fd6;
    stim[58] = 17'h09212;
    stim[59] = 17'h04647;
    stim[60] = 17'h07f0c;
    stim[61] = 17'h01a55;
    stim[62] = 17'h08bf6;
    stim[63] = 17'h0a4a4;
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
      expv[0] = 64'h7000000000000000;
      expv[1] = 64'h7000000000000000;
      expv[2] = 64'h7000000000000000;
      expv[3] = 64'h7000000000000000;
      expv[4] = 64'hf000002000000021;
      expv[5] = 64'h7ffe2040d8860044;
      expv[6] = 64'h700210605b580092;
      expv[7] = 64'hf00a908018d5013b;
      expv[8] = 64'h7000000000000000;
      expv[9] = 64'h7000000000000000;
      expv[10] = 64'h7000002000000020;
      expv[11] = 64'h7001e0404b1b0044;
      expv[12] = 64'h7005d06013f20092;
      expv[13] = 64'h700e508060af013a;
      expv[14] = 64'hf020a0a052db02a3;
      expv[15] = 64'h7ff930c0fb3205a8;
      expv[16] = 64'h704e00e03f800c20;
      expv[17] = 64'hf103e1001d9a19ff;
      expv[18] = 64'h8f7e2120003937b9;
      expv[19] = 64'h2f46711c01a332a8;
      expv[20] = 64'h7043b118fe7c2e0c;
      expv[21] = 64'ha2f65138509662b7;
      expv[22] = 64'ha108d134fd0659bf;
      expv[23] = 64'h6f483130035e5194;
      expv[24] = 64'h236cb148fe0e9088;
      expv[25] = 64'hc63f514403a98365;
      expv[26] = 64'h91a0d14c07eb9efd;
      expv[27] = 64'h9fc3f148099b9089;
      expv[28] = 64'h0e126144074c8364;
      expv[29] = 64'hae95c14001d87773;
      expv[30] = 64'h7c40913c03a66c96;
      expv[31] = 64'h929d415c01ace8c5;
      expv[32] = 64'h1fe301580db3d39c;
      expv[33] = 64'he25dc55507dac05f;
      expv[34] = 64'hf7fff56101c8ffff;
      expv[35] = 64'h7000000000000000;
      expv[36] = 64'h7000000000000000;
      expv[37] = 64'h7000002000000020;
      expv[38] = 64'hf001e04020be0045;
      expv[39] = 64'hfffdf0609c290093;
      expv[40] = 64'hfff57080883f013b;
      expv[41] = 64'h7fe320a0b2e302a2;
      expv[42] = 64'h600a90c05d4805a8;
      expv[43] = 64'h705410d800310a04;
      expv[44] = 64'hf0ea40f84926157b;
      expv[45] = 64'hbfa83118b0152e0d;
      expv[46] = 64'h7e65f114ffc729dc;
      expv[47] = 64'h70d9c1345a1159be;
      expv[48] = 64'ha61bc1541130c05f;
      expv[49] = 64'h125a01500709aee2;
      expv[50] = 64'hb466a14cf7bc9efd;
      expv[51] = 64'h600dd148fe059088;
      expv[52] = 64'hc764b561ff98ffff;
      expv[53] = 64'ha7fff1606ea1ffff;
      expv[54] = 64'ha300115cf585e8c5;
      expv[55] = 64'h5e744959feddd39c;
      expv[56] = 64'h78000961f49efffe;
      expv[57] = 64'h28000160fe1ffffe;
      expv[58] = 64'h2cffe15cfecae8c4;
      expv[59] = 64'hd18bb559f71bd39d;
      expv[60] = 64'h97fff1601213ffff;
      expv[61] = 64'h1500115cf646e8c4;
      expv[62] = 64'hb7ba51580367d39d;
      expv[63] = 64'he1f12555fb43c05f;
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
