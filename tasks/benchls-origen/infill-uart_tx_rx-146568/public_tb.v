// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146568 dut (
    .i_Clk(clk),
    .i_RX_Serial(in_vec[9:9]),
    .i_TX_Byte(in_vec[8:1]),
    .i_TX_Load(in_vec[0:0]),
    .o_RX_Byte(out_vec[11:4]),
    .o_RX_Done(out_vec[3:3]),
    .o_TX_Active(out_vec[2:2]),
    .o_TX_Done(out_vec[1:1]),
    .o_TX_Serial(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2b5;
    stim[1] = 10'h0a8;
    stim[2] = 10'h24d;
    stim[3] = 10'h307;
    stim[4] = 10'h217;
    stim[5] = 10'h3e1;
    stim[6] = 10'h253;
    stim[7] = 10'h09f;
    stim[8] = 10'h0da;
    stim[9] = 10'h204;
    stim[10] = 10'h38a;
    stim[11] = 10'h3c5;
    stim[12] = 10'h2cf;
    stim[13] = 10'h165;
    stim[14] = 10'h2f0;
    stim[15] = 10'h34e;
    stim[16] = 10'h225;
    stim[17] = 10'h2c6;
    stim[18] = 10'h372;
    stim[19] = 10'h362;
    stim[20] = 10'h2ff;
    stim[21] = 10'h385;
    stim[22] = 10'h1af;
    stim[23] = 10'h02a;
    stim[24] = 10'h306;
    stim[25] = 10'h1e6;
    stim[26] = 10'h0cb;
    stim[27] = 10'h08f;
    stim[28] = 10'h217;
    stim[29] = 10'h0d6;
    stim[30] = 10'h3ce;
    stim[31] = 10'h182;
    stim[32] = 10'h368;
    stim[33] = 10'h196;
    stim[34] = 10'h161;
    stim[35] = 10'h19e;
    stim[36] = 10'h3b4;
    stim[37] = 10'h207;
    stim[38] = 10'h3e4;
    stim[39] = 10'h0eb;
    stim[40] = 10'h0d1;
    stim[41] = 10'h08d;
    stim[42] = 10'h3a0;
    stim[43] = 10'h2d7;
    stim[44] = 10'h099;
    stim[45] = 10'h152;
    stim[46] = 10'h325;
    stim[47] = 10'h05e;
    stim[48] = 10'h1f8;
    stim[49] = 10'h35b;
    stim[50] = 10'h3cd;
    stim[51] = 10'h352;
    stim[52] = 10'h2d5;
    stim[53] = 10'h091;
    stim[54] = 10'h16b;
    stim[55] = 10'h052;
    stim[56] = 10'h3d9;
    stim[57] = 10'h136;
    stim[58] = 10'h2e5;
    stim[59] = 10'h0ef;
    stim[60] = 10'h23c;
    stim[61] = 10'h11b;
    stim[62] = 10'h0ea;
    stim[63] = 10'h0f7;
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
      expv[1] = 12'hxx5;
      expv[2] = 12'hxx4;
      expv[3] = 12'hxx4;
      expv[4] = 12'hxx4;
      expv[5] = 12'hxx4;
      expv[6] = 12'hxx4;
      expv[7] = 12'hxx4;
      expv[8] = 12'hxx4;
      expv[9] = 12'hxx4;
      expv[10] = 12'hxx4;
      expv[11] = 12'hxx4;
      expv[12] = 12'hxx4;
      expv[13] = 12'hxx4;
      expv[14] = 12'hxx4;
      expv[15] = 12'hxx4;
      expv[16] = 12'hxx4;
      expv[17] = 12'hxx4;
      expv[18] = 12'hxx4;
      expv[19] = 12'hxx4;
      expv[20] = 12'hxx4;
      expv[21] = 12'hxx4;
      expv[22] = 12'hxx4;
      expv[23] = 12'hxx4;
      expv[24] = 12'hxx4;
      expv[25] = 12'hxx4;
      expv[26] = 12'hxx4;
      expv[27] = 12'hxx4;
      expv[28] = 12'hxx4;
      expv[29] = 12'hxx4;
      expv[30] = 12'hxx4;
      expv[31] = 12'hxx4;
      expv[32] = 12'hxx4;
      expv[33] = 12'hxx4;
      expv[34] = 12'hxx4;
      expv[35] = 12'hxx4;
      expv[36] = 12'hxx4;
      expv[37] = 12'hxx4;
      expv[38] = 12'hxx4;
      expv[39] = 12'hxx4;
      expv[40] = 12'hxx4;
      expv[41] = 12'hxx4;
      expv[42] = 12'hxx4;
      expv[43] = 12'hxx4;
      expv[44] = 12'hxx4;
      expv[45] = 12'hxx4;
      expv[46] = 12'hxx4;
      expv[47] = 12'hxx4;
      expv[48] = 12'hxx4;
      expv[49] = 12'hxx4;
      expv[50] = 12'hxx4;
      expv[51] = 12'hxx4;
      expv[52] = 12'hxx4;
      expv[53] = 12'hxx4;
      expv[54] = 12'hxx4;
      expv[55] = 12'hxx4;
      expv[56] = 12'hxx4;
      expv[57] = 12'hxx4;
      expv[58] = 12'hxx4;
      expv[59] = 12'hxx4;
      expv[60] = 12'hxx4;
      expv[61] = 12'hxx4;
      expv[62] = 12'hxx4;
      expv[63] = 12'hxx4;
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
