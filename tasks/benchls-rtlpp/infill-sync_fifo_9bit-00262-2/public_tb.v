// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00262 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .din(in_vec[10:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[11:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'ha3f;
    stim[1] = 12'hbbc;
    stim[2] = 12'h01b;
    stim[3] = 12'h013;
    stim[4] = 12'h603;
    stim[5] = 12'h10f;
    stim[6] = 12'h218;
    stim[7] = 12'h4ce;
    stim[8] = 12'h59f;
    stim[9] = 12'h03b;
    stim[10] = 12'h278;
    stim[11] = 12'h5fe;
    stim[12] = 12'h1a2;
    stim[13] = 12'h355;
    stim[14] = 12'h10e;
    stim[15] = 12'h3f6;
    stim[16] = 12'h162;
    stim[17] = 12'h284;
    stim[18] = 12'h5e5;
    stim[19] = 12'h482;
    stim[20] = 12'h588;
    stim[21] = 12'h7e4;
    stim[22] = 12'h7bc;
    stim[23] = 12'h455;
    stim[24] = 12'h0e9;
    stim[25] = 12'h71f;
    stim[26] = 12'h030;
    stim[27] = 12'h711;
    stim[28] = 12'h6b9;
    stim[29] = 12'h0ad;
    stim[30] = 12'h645;
    stim[31] = 12'h18f;
    stim[32] = 12'h638;
    stim[33] = 12'h385;
    stim[34] = 12'h5aa;
    stim[35] = 12'h6dd;
    stim[36] = 12'h050;
    stim[37] = 12'h0a1;
    stim[38] = 12'h2e7;
    stim[39] = 12'h57a;
    stim[40] = 12'h350;
    stim[41] = 12'h0e6;
    stim[42] = 12'h27c;
    stim[43] = 12'h308;
    stim[44] = 12'hea0;
    stim[45] = 12'h2d6;
    stim[46] = 12'h7cf;
    stim[47] = 12'h0b4;
    stim[48] = 12'h751;
    stim[49] = 12'h219;
    stim[50] = 12'h681;
    stim[51] = 12'h206;
    stim[52] = 12'h36d;
    stim[53] = 12'h646;
    stim[54] = 12'h73f;
    stim[55] = 12'hb34;
    stim[56] = 12'h670;
    stim[57] = 12'h199;
    stim[58] = 12'h43b;
    stim[59] = 12'h3dc;
    stim[60] = 12'h5f8;
    stim[61] = 12'h1d5;
    stim[62] = 12'h11e;
    stim[63] = 12'h15e;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'h47a;
      expv[4] = 12'h47a;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'h999;
      expv[11] = 12'h999;
      expv[12] = 12'h999;
      expv[13] = 12'h999;
      expv[14] = 12'h071;
      expv[15] = 12'h071;
      expv[16] = 12'h071;
      expv[17] = 12'h071;
      expv[18] = 12'h071;
      expv[19] = 12'hbf9;
      expv[20] = 12'hbf9;
      expv[21] = 12'hbf9;
      expv[22] = 12'hbf9;
      expv[23] = 12'hbf9;
      expv[24] = 12'h341;
      expv[25] = 12'h341;
      expv[26] = 12'h219;
      expv[27] = 12'h219;
      expv[28] = 12'h2c1;
      expv[29] = 12'h2c1;
      expv[30] = 12'h902;
      expv[31] = 12'he3a;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'h031;
      expv[48] = 12'h031;
      expv[49] = 12'hf9a;
      expv[50] = 12'hf9a;
      expv[51] = 12'hc02;
      expv[52] = 12'hc01;
      expv[53] = 12'h99a;
      expv[54] = 12'h999;
      expv[55] = 12'hb3a;
      expv[56] = 12'hb3a;
      expv[57] = 12'hb3a;
      expv[58] = 12'h5aa;
      expv[59] = 12'h5aa;
      expv[60] = 12'h5aa;
      expv[61] = 12'h5aa;
      expv[62] = 12'h40a;
      expv[63] = 12'h409;
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
