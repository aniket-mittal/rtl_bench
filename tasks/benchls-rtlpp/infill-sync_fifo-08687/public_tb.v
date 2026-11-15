// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08687 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h535;
    stim[1] = 11'h7bd;
    stim[2] = 11'h5bc;
    stim[3] = 11'h648;
    stim[4] = 11'h67e;
    stim[5] = 11'h49e;
    stim[6] = 11'h4ea;
    stim[7] = 11'h54a;
    stim[8] = 11'h7a0;
    stim[9] = 11'h282;
    stim[10] = 11'h2a2;
    stim[11] = 11'h11c;
    stim[12] = 11'h428;
    stim[13] = 11'h00c;
    stim[14] = 11'h1ca;
    stim[15] = 11'h1b6;
    stim[16] = 11'h566;
    stim[17] = 11'h3f2;
    stim[18] = 11'h620;
    stim[19] = 11'h270;
    stim[20] = 11'h7a0;
    stim[21] = 11'h688;
    stim[22] = 11'h2e0;
    stim[23] = 11'h36a;
    stim[24] = 11'h574;
    stim[25] = 11'h570;
    stim[26] = 11'h72a;
    stim[27] = 11'h034;
    stim[28] = 11'h60a;
    stim[29] = 11'h41e;
    stim[30] = 11'h7ba;
    stim[31] = 11'h5ee;
    stim[32] = 11'h040;
    stim[33] = 11'h08c;
    stim[34] = 11'h256;
    stim[35] = 11'h702;
    stim[36] = 11'h6a8;
    stim[37] = 11'h19a;
    stim[38] = 11'h736;
    stim[39] = 11'h634;
    stim[40] = 11'h400;
    stim[41] = 11'h5a6;
    stim[42] = 11'h184;
    stim[43] = 11'h6da;
    stim[44] = 11'h52a;
    stim[45] = 11'h040;
    stim[46] = 11'h3a2;
    stim[47] = 11'h51c;
    stim[48] = 11'h098;
    stim[49] = 11'h29e;
    stim[50] = 11'h240;
    stim[51] = 11'h01a;
    stim[52] = 11'h582;
    stim[53] = 11'h6be;
    stim[54] = 11'h696;
    stim[55] = 11'h564;
    stim[56] = 11'h3a8;
    stim[57] = 11'h404;
    stim[58] = 11'h4be;
    stim[59] = 11'h78a;
    stim[60] = 11'h272;
    stim[61] = 11'h772;
    stim[62] = 11'h476;
    stim[63] = 11'h2f6;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h2dc;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'h004;
      expv[16] = 10'h004;
      expv[17] = 10'h004;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'h0c0;
      expv[45] = 10'h2de;
      expv[46] = 10'h2de;
      expv[47] = 10'h2de;
      expv[48] = 10'h2dc;
      expv[49] = 10'h2dc;
      expv[50] = 10'h2dc;
      expv[51] = 10'h2dc;
      expv[52] = 10'h08e;
      expv[53] = 10'h08e;
      expv[54] = 10'h08e;
      expv[55] = 10'h08e;
      expv[56] = 10'h08c;
      expv[57] = 10'h08c;
      expv[58] = 10'h08c;
      expv[59] = 10'h08c;
      expv[60] = 10'h200;
      expv[61] = 10'h2ba;
      expv[62] = 10'h2ba;
      expv[63] = 10'h2ba;
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
