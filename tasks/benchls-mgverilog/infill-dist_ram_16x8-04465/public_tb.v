// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04465 dut (
    .WCLK(clk),
    .A(in_vec[16:13]),
    .D(in_vec[12:5]),
    .DPRA(in_vec[4:1]),
    .WE(in_vec[0:0]),
    .DPO(out_vec[15:8]),
    .SPO(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h16f07;
    stim[1] = 17'h0f725;
    stim[2] = 17'h0ed19;
    stim[3] = 17'h17bf7;
    stim[4] = 17'h1b340;
    stim[5] = 17'h174a4;
    stim[6] = 17'h058fd;
    stim[7] = 17'h16a42;
    stim[8] = 17'h0ce5d;
    stim[9] = 17'h14728;
    stim[10] = 17'h0a78f;
    stim[11] = 17'h0ff9e;
    stim[12] = 17'h09fa5;
    stim[13] = 17'h040ce;
    stim[14] = 17'h1748b;
    stim[15] = 17'h1ec09;
    stim[16] = 17'h08367;
    stim[17] = 17'h0be92;
    stim[18] = 17'h0024a;
    stim[19] = 17'h1933c;
    stim[20] = 17'h18f41;
    stim[21] = 17'h02bea;
    stim[22] = 17'h1c689;
    stim[23] = 17'h03fa6;
    stim[24] = 17'h0ed6b;
    stim[25] = 17'h0d87a;
    stim[26] = 17'h141c5;
    stim[27] = 17'h0ea16;
    stim[28] = 17'h1683a;
    stim[29] = 17'h107c7;
    stim[30] = 17'h1f9b4;
    stim[31] = 17'h16e20;
    stim[32] = 17'h0fa59;
    stim[33] = 17'h16e6f;
    stim[34] = 17'h1ba4a;
    stim[35] = 17'h1321b;
    stim[36] = 17'h1edb3;
    stim[37] = 17'h17621;
    stim[38] = 17'h09fec;
    stim[39] = 17'h11575;
    stim[40] = 17'h1b401;
    stim[41] = 17'h1f92f;
    stim[42] = 17'h14069;
    stim[43] = 17'h1726b;
    stim[44] = 17'h0fba2;
    stim[45] = 17'h032cf;
    stim[46] = 17'h1020d;
    stim[47] = 17'h07126;
    stim[48] = 17'h15b9e;
    stim[49] = 17'h0c315;
    stim[50] = 17'h19774;
    stim[51] = 17'h0dc6e;
    stim[52] = 17'h1f0cb;
    stim[53] = 17'h11cbb;
    stim[54] = 17'h004d7;
    stim[55] = 17'h1d1c5;
    stim[56] = 17'h1e7dd;
    stim[57] = 17'h178b3;
    stim[58] = 17'h1eb36;
    stim[59] = 17'h140a6;
    stim[60] = 17'h15dfb;
    stim[61] = 17'h0dafc;
    stim[62] = 17'h0f8b3;
    stim[63] = 17'h0c899;
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
      expv[2] = 16'hxxb9;
      expv[3] = 16'h7878;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxdf;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxdf;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'h68xx;
      expv[11] = 16'hxx68;
      expv[12] = 16'hc7xx;
      expv[13] = 16'h68c7;
      expv[14] = 16'h3cdf;
      expv[15] = 16'hfdxx;
      expv[16] = 16'hxxfd;
      expv[17] = 16'hxx3c;
      expv[18] = 16'h3cxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'h3cxx;
      expv[22] = 16'h1bxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'h3c68;
      expv[25] = 16'hxx72;
      expv[26] = 16'hc7xx;
      expv[27] = 16'ha46b;
      expv[28] = 16'hxxa4;
      expv[29] = 16'hxxxx;
      expv[30] = 16'h0e60;
      expv[31] = 16'hxxa4;
      expv[32] = 16'h7a6b;
      expv[33] = 16'hd2a4;
      expv[34] = 16'h3cxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'h9060;
      expv[37] = 16'hxx73;
      expv[38] = 16'h721b;
      expv[39] = 16'h0e3e;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hd26d;
      expv[42] = 16'h1b0e;
      expv[43] = 16'h3cb1;
      expv[44] = 16'hxxd2;
      expv[45] = 16'hd2xx;
      expv[46] = 16'h72ab;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hc903;
      expv[49] = 16'h0372;
      expv[50] = 16'h037a;
      expv[51] = 16'hd218;
      expv[52] = 16'h3cc9;
      expv[53] = 16'ha010;
      expv[54] = 16'h93xx;
      expv[55] = 16'hc734;
      expv[56] = 16'h8e86;
      expv[57] = 16'h9093;
      expv[58] = 16'hc53e;
      expv[59] = 16'hxx03;
      expv[60] = 16'ha003;
      expv[61] = 16'h8e18;
      expv[62] = 16'h90d2;
      expv[63] = 16'h7a18;
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
