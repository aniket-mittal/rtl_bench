// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00894 dut (
    .InPut_9(in_vec[11:3]),
    .S_2(in_vec[2:2]),
    .S_4(in_vec[1:1]),
    .S_8(in_vec[0:0]),
    .OutPut_15(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'haf1;
    stim[1] = 12'hfd7;
    stim[2] = 12'hdaa;
    stim[3] = 12'ha06;
    stim[4] = 12'h921;
    stim[5] = 12'h511;
    stim[6] = 12'ha4e;
    stim[7] = 12'hbbd;
    stim[8] = 12'hd01;
    stim[9] = 12'h753;
    stim[10] = 12'hbc3;
    stim[11] = 12'h4fa;
    stim[12] = 12'h04c;
    stim[13] = 12'he4b;
    stim[14] = 12'h03c;
    stim[15] = 12'h261;
    stim[16] = 12'h1e1;
    stim[17] = 12'h4ef;
    stim[18] = 12'hb02;
    stim[19] = 12'ha9a;
    stim[20] = 12'h60c;
    stim[21] = 12'h50b;
    stim[22] = 12'h6b1;
    stim[23] = 12'h900;
    stim[24] = 12'h5c3;
    stim[25] = 12'h3c3;
    stim[26] = 12'h6fa;
    stim[27] = 12'h18a;
    stim[28] = 12'hd46;
    stim[29] = 12'h3ab;
    stim[30] = 12'h85f;
    stim[31] = 12'h967;
    stim[32] = 12'h7f6;
    stim[33] = 12'h00c;
    stim[34] = 12'hfaa;
    stim[35] = 12'h1b6;
    stim[36] = 12'h005;
    stim[37] = 12'h130;
    stim[38] = 12'haaa;
    stim[39] = 12'hace;
    stim[40] = 12'hbbf;
    stim[41] = 12'h1b0;
    stim[42] = 12'hefe;
    stim[43] = 12'h280;
    stim[44] = 12'h937;
    stim[45] = 12'hb90;
    stim[46] = 12'hfe2;
    stim[47] = 12'hb76;
    stim[48] = 12'he28;
    stim[49] = 12'h141;
    stim[50] = 12'hd26;
    stim[51] = 12'h028;
    stim[52] = 12'hc52;
    stim[53] = 12'h153;
    stim[54] = 12'h102;
    stim[55] = 12'h54c;
    stim[56] = 12'hfee;
    stim[57] = 12'h8cc;
    stim[58] = 12'h007;
    stim[59] = 12'hb74;
    stim[60] = 12'hac1;
    stim[61] = 12'hf09;
    stim[62] = 12'h8d1;
    stim[63] = 12'h15e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'hfebc;
      expv[1] = 16'hfffa;
      expv[2] = 16'hfb5b;
      expv[3] = 16'hfa00;
      expv[4] = 16'hfe48;
      expv[5] = 16'h0144;
      expv[6] = 16'hfa49;
      expv[7] = 16'hff77;
      expv[8] = 16'hff40;
      expv[9] = 16'h01d4;
      expv[10] = 16'hfef0;
      expv[11] = 16'h09fb;
      expv[12] = 16'h0049;
      expv[13] = 16'hff93;
      expv[14] = 16'h003b;
      expv[15] = 16'h0098;
      expv[16] = 16'h0078;
      expv[17] = 16'h009d;
      expv[18] = 16'hf600;
      expv[19] = 16'hf53b;
      expv[20] = 16'h0609;
      expv[21] = 16'h0143;
      expv[22] = 16'h01ac;
      expv[23] = 16'hf200;
      expv[24] = 16'h0170;
      expv[25] = 16'h00f0;
      expv[26] = 16'h0dfb;
      expv[27] = 16'h031b;
      expv[28] = 16'hfd40;
      expv[29] = 16'h00eb;
      expv[30] = 16'hff0b;
      expv[31] = 16'hff2c;
      expv[32] = 16'h07f2;
      expv[33] = 16'h0009;
      expv[34] = 16'hff5b;
      expv[35] = 16'h01b2;
      expv[36] = 16'h0000;
      expv[37] = 16'h0260;
      expv[38] = 16'hf55b;
      expv[39] = 16'hfac9;
      expv[40] = 16'hff77;
      expv[41] = 16'h0360;
      expv[42] = 16'hfefb;
      expv[43] = 16'h0500;
      expv[44] = 16'hff26;
      expv[45] = 16'hf720;
      expv[46] = 16'hffc0;
      expv[47] = 16'hfb72;
      expv[48] = 16'hfc5b;
      expv[49] = 16'h0050;
      expv[50] = 16'hfd20;
      expv[51] = 16'h005b;
      expv[52] = 16'hf8a0;
      expv[53] = 16'h0054;
      expv[54] = 16'h0200;
      expv[55] = 16'h0549;
      expv[56] = 16'hffe9;
      expv[57] = 16'hf8c9;
      expv[58] = 16'h0000;
      expv[59] = 16'hfb72;
      expv[60] = 16'hfeb0;
      expv[61] = 16'hffc3;
      expv[62] = 16'hfe34;
      expv[63] = 16'h015b;
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
