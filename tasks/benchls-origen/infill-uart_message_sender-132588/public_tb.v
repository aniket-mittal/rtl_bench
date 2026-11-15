// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132588 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .tx_busy(in_vec[9:9]),
    .rx_data(in_vec[8:1]),
    .new_rx_data(in_vec[0:0]),
    .tx_data(out_vec[8:1]),
    .new_tx_data(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5e1;
    stim[1] = 11'h63e;
    stim[2] = 11'h188;
    stim[3] = 11'h383;
    stim[4] = 11'h3a4;
    stim[5] = 11'h3f8;
    stim[6] = 11'h2ac;
    stim[7] = 11'h10f;
    stim[8] = 11'h29d;
    stim[9] = 11'h1f7;
    stim[10] = 11'h1f4;
    stim[11] = 11'h0dd;
    stim[12] = 11'h2f2;
    stim[13] = 11'h23e;
    stim[14] = 11'h0e5;
    stim[15] = 11'h075;
    stim[16] = 11'h158;
    stim[17] = 11'h389;
    stim[18] = 11'h182;
    stim[19] = 11'h00d;
    stim[20] = 11'h14a;
    stim[21] = 11'h066;
    stim[22] = 11'h098;
    stim[23] = 11'h1bf;
    stim[24] = 11'h1b2;
    stim[25] = 11'h16c;
    stim[26] = 11'h1c7;
    stim[27] = 11'h0a2;
    stim[28] = 11'h0c3;
    stim[29] = 11'h2a4;
    stim[30] = 11'h3e0;
    stim[31] = 11'h3d9;
    stim[32] = 11'h00a;
    stim[33] = 11'h148;
    stim[34] = 11'h2df;
    stim[35] = 11'h1bb;
    stim[36] = 11'h3d4;
    stim[37] = 11'h000;
    stim[38] = 11'h074;
    stim[39] = 11'h2b8;
    stim[40] = 11'h373;
    stim[41] = 11'h22e;
    stim[42] = 11'h23c;
    stim[43] = 11'h2b9;
    stim[44] = 11'h041;
    stim[45] = 11'h280;
    stim[46] = 11'h066;
    stim[47] = 11'h137;
    stim[48] = 11'h0b4;
    stim[49] = 11'h1c1;
    stim[50] = 11'h022;
    stim[51] = 11'h013;
    stim[52] = 11'h10e;
    stim[53] = 11'h1c6;
    stim[54] = 11'h3da;
    stim[55] = 11'h0fc;
    stim[56] = 11'h1a6;
    stim[57] = 11'h2cd;
    stim[58] = 11'h2de;
    stim[59] = 11'h3a0;
    stim[60] = 11'h38a;
    stim[61] = 11'h1cb;
    stim[62] = 11'h2b0;
    stim[63] = 11'h041;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'hxxx;
      expv[15] = 9'hxxx;
      expv[16] = 9'hxxx;
      expv[17] = 9'hxxx;
      expv[18] = 9'hxxx;
      expv[19] = 9'hxxx;
      expv[20] = 9'hxxx;
      expv[21] = 9'hxxx;
      expv[22] = 9'hxxx;
      expv[23] = 9'hxxx;
      expv[24] = 9'hxxx;
      expv[25] = 9'hxxx;
      expv[26] = 9'hxxx;
      expv[27] = 9'hxxx;
      expv[28] = 9'hxxx;
      expv[29] = 9'hxxx;
      expv[30] = 9'hxxx;
      expv[31] = 9'hxxx;
      expv[32] = 9'hxxx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'hxxx;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxxx;
      expv[42] = 9'hxxx;
      expv[43] = 9'hxxx;
      expv[44] = 9'hxxx;
      expv[45] = 9'hxxx;
      expv[46] = 9'hxxx;
      expv[47] = 9'hxxx;
      expv[48] = 9'hxxx;
      expv[49] = 9'hxxx;
      expv[50] = 9'hxxx;
      expv[51] = 9'hxxx;
      expv[52] = 9'hxxx;
      expv[53] = 9'hxxx;
      expv[54] = 9'hxxx;
      expv[55] = 9'hxxx;
      expv[56] = 9'hxxx;
      expv[57] = 9'hxxx;
      expv[58] = 9'hxxx;
      expv[59] = 9'hxxx;
      expv[60] = 9'hxxx;
      expv[61] = 9'hxxx;
      expv[62] = 9'hxxx;
      expv[63] = 9'hxxx;
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
