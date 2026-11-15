// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00443 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9d631;
    stim[1] = 20'hd6b65;
    stim[2] = 20'hd0546;
    stim[3] = 20'h165f8;
    stim[4] = 20'h7b882;
    stim[5] = 20'h03768;
    stim[6] = 20'hb3cd2;
    stim[7] = 20'hc55ae;
    stim[8] = 20'h3c4f4;
    stim[9] = 20'ha894a;
    stim[10] = 20'h280bc;
    stim[11] = 20'hb1f90;
    stim[12] = 20'ha7e0e;
    stim[13] = 20'he31b6;
    stim[14] = 20'h958b6;
    stim[15] = 20'h1a192;
    stim[16] = 20'h3560a;
    stim[17] = 20'h0ca06;
    stim[18] = 20'hf75e6;
    stim[19] = 20'he2084;
    stim[20] = 20'hdc3ea;
    stim[21] = 20'h67238;
    stim[22] = 20'h0e756;
    stim[23] = 20'hd2650;
    stim[24] = 20'h24764;
    stim[25] = 20'hc5502;
    stim[26] = 20'h786f8;
    stim[27] = 20'ha8276;
    stim[28] = 20'h86cb8;
    stim[29] = 20'hfea5c;
    stim[30] = 20'he4c26;
    stim[31] = 20'hac23e;
    stim[32] = 20'h4f71e;
    stim[33] = 20'h0968a;
    stim[34] = 20'hba96c;
    stim[35] = 20'h75b34;
    stim[36] = 20'h9c586;
    stim[37] = 20'h31915;
    stim[38] = 20'h32bde;
    stim[39] = 20'h5d58a;
    stim[40] = 20'h678ce;
    stim[41] = 20'h82e14;
    stim[42] = 20'h77310;
    stim[43] = 20'h62890;
    stim[44] = 20'hec398;
    stim[45] = 20'h1f0d6;
    stim[46] = 20'hc3d6e;
    stim[47] = 20'hc7416;
    stim[48] = 20'h0a0d2;
    stim[49] = 20'hbfe5e;
    stim[50] = 20'h4f030;
    stim[51] = 20'he24f2;
    stim[52] = 20'h53102;
    stim[53] = 20'h79702;
    stim[54] = 20'h5adfa;
    stim[55] = 20'heaf02;
    stim[56] = 20'h29500;
    stim[57] = 20'h3724c;
    stim[58] = 20'h9d180;
    stim[59] = 20'hf3b52;
    stim[60] = 20'h4e1b4;
    stim[61] = 20'h58ac2;
    stim[62] = 20'h15bfa;
    stim[63] = 20'h7ec1a;
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
      expv[0] = 16'hffff;
      expv[1] = 16'hffff;
      expv[2] = 16'hffff;
      expv[3] = 16'hffff;
      expv[4] = 16'hffff;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'hffff;
      expv[9] = 16'hffff;
      expv[10] = 16'h763b;
      expv[11] = 16'hffff;
      expv[12] = 16'hffff;
      expv[13] = 16'hffff;
      expv[14] = 16'hffff;
      expv[15] = 16'hffff;
      expv[16] = 16'h0000;
      expv[17] = 16'hbd7b;
      expv[18] = 16'hffff;
      expv[19] = 16'hffff;
      expv[20] = 16'hffff;
      expv[21] = 16'h977d;
      expv[22] = 16'h977d;
      expv[23] = 16'hffff;
      expv[24] = 16'hffff;
      expv[25] = 16'hffff;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'hffff;
      expv[29] = 16'hffff;
      expv[30] = 16'hffff;
      expv[31] = 16'hffff;
      expv[32] = 16'hffff;
      expv[33] = 16'hffff;
      expv[34] = 16'h4bf4;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'hffff;
      expv[38] = 16'hffff;
      expv[39] = 16'hffff;
      expv[40] = 16'he8ea;
      expv[41] = 16'hffff;
      expv[42] = 16'hffff;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'h0000;
      expv[50] = 16'hffff;
      expv[51] = 16'hffff;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h73c5;
      expv[56] = 16'hccc7;
      expv[57] = 16'hccc7;
      expv[58] = 16'hffff;
      expv[59] = 16'hffff;
      expv[60] = 16'h0000;
      expv[61] = 16'hffff;
      expv[62] = 16'h0000;
      expv[63] = 16'h4463;
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
