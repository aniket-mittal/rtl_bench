// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03823 dut (
    .wclk(clk),
    .wdata(in_vec[27:12]),
    .wen(in_vec[11:11]),
    .waddr(in_vec[10:6]),
    .raddr(in_vec[5:1]),
    .rclk(in_vec[0:0]),
    .rdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hf59224b;
    stim[1] = 28'h2ef91b6;
    stim[2] = 28'hc5d3871;
    stim[3] = 28'h1cbf386;
    stim[4] = 28'ha19ec70;
    stim[5] = 28'hcbe1fb9;
    stim[6] = 28'h3468cbf;
    stim[7] = 28'h1bf23b2;
    stim[8] = 28'h19f668e;
    stim[9] = 28'hef2458e;
    stim[10] = 28'h85fa9fa;
    stim[11] = 28'hcc461c4;
    stim[12] = 28'h1e5a7ab;
    stim[13] = 28'hc1edbfd;
    stim[14] = 28'h125988d;
    stim[15] = 28'hdbaff86;
    stim[16] = 28'h7a5d400;
    stim[17] = 28'hab53440;
    stim[18] = 28'h086fc9e;
    stim[19] = 28'h18cd813;
    stim[20] = 28'hef6532b;
    stim[21] = 28'h5c6ff6b;
    stim[22] = 28'h49e8123;
    stim[23] = 28'he2d2c91;
    stim[24] = 28'h04f5dd2;
    stim[25] = 28'hbbb7cfc;
    stim[26] = 28'h560fb40;
    stim[27] = 28'h6f30a46;
    stim[28] = 28'h9677920;
    stim[29] = 28'hc016942;
    stim[30] = 28'hc235f66;
    stim[31] = 28'h5c53bb9;
    stim[32] = 28'h4a3936d;
    stim[33] = 28'hd0fc412;
    stim[34] = 28'h863630e;
    stim[35] = 28'h0fb9670;
    stim[36] = 28'had08766;
    stim[37] = 28'h092d751;
    stim[38] = 28'he2789a4;
    stim[39] = 28'h51128df;
    stim[40] = 28'h9a34678;
    stim[41] = 28'hc261931;
    stim[42] = 28'h876582e;
    stim[43] = 28'h2035980;
    stim[44] = 28'h55dc9b7;
    stim[45] = 28'h3db4616;
    stim[46] = 28'hea01c22;
    stim[47] = 28'h9c0a11e;
    stim[48] = 28'h1e92b44;
    stim[49] = 28'h8591b2f;
    stim[50] = 28'h25a1906;
    stim[51] = 28'ha15c646;
    stim[52] = 28'h5b15cc3;
    stim[53] = 28'h43cf0d4;
    stim[54] = 28'hafc989f;
    stim[55] = 28'hcdbf50c;
    stim[56] = 28'he3f0faf;
    stim[57] = 28'h44680b3;
    stim[58] = 28'h2bf9253;
    stim[59] = 28'h2905f80;
    stim[60] = 28'h35c9dcb;
    stim[61] = 28'h3e8e82b;
    stim[62] = 28'h036c57c;
    stim[63] = 28'hf0b41dc;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'h6f30;
      expv[29] = 16'h6f30;
      expv[30] = 16'h6f30;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hc1ed;
      expv[40] = 16'hc1ed;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'h04f5;
      expv[50] = 16'h04f5;
      expv[51] = 16'h04f5;
      expv[52] = 16'hc5d3;
      expv[53] = 16'hc5d3;
      expv[54] = 16'hc1ed;
      expv[55] = 16'hc1ed;
      expv[56] = 16'h04f5;
      expv[57] = 16'h04f5;
      expv[58] = 16'h04f5;
      expv[59] = 16'h04f5;
      expv[60] = 16'hc016;
      expv[61] = 16'hc016;
      expv[62] = 16'hc016;
      expv[63] = 16'hc016;
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
