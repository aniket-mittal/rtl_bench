// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023689 dut (
    .emif_usr_clk(clk),
    .rst(in_vec[3:3]),
    .bt1(in_vec[2:2]),
    .bt2(in_vec[1:1]),
    .amm_ready(in_vec[0:0]),
    .amm_rd(out_vec[33:33]),
    .amm_wr(out_vec[32:32]),
    .amm_addr(out_vec[31:7]),
    .amm_burstcnt(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h8;
    stim[2] = 4'h7;
    stim[3] = 4'h7;
    stim[4] = 4'h3;
    stim[5] = 4'h7;
    stim[6] = 4'h4;
    stim[7] = 4'h2;
    stim[8] = 4'h5;
    stim[9] = 4'h7;
    stim[10] = 4'h2;
    stim[11] = 4'h1;
    stim[12] = 4'h3;
    stim[13] = 4'h3;
    stim[14] = 4'h5;
    stim[15] = 4'h6;
    stim[16] = 4'h2;
    stim[17] = 4'h6;
    stim[18] = 4'h7;
    stim[19] = 4'h0;
    stim[20] = 4'h2;
    stim[21] = 4'hd;
    stim[22] = 4'h5;
    stim[23] = 4'h1;
    stim[24] = 4'h7;
    stim[25] = 4'h0;
    stim[26] = 4'h6;
    stim[27] = 4'h7;
    stim[28] = 4'h6;
    stim[29] = 4'h6;
    stim[30] = 4'h5;
    stim[31] = 4'h2;
    stim[32] = 4'h5;
    stim[33] = 4'h2;
    stim[34] = 4'h3;
    stim[35] = 4'hb;
    stim[36] = 4'h6;
    stim[37] = 4'h3;
    stim[38] = 4'h3;
    stim[39] = 4'h2;
    stim[40] = 4'h3;
    stim[41] = 4'h4;
    stim[42] = 4'h0;
    stim[43] = 4'h4;
    stim[44] = 4'h7;
    stim[45] = 4'h7;
    stim[46] = 4'h2;
    stim[47] = 4'h1;
    stim[48] = 4'h3;
    stim[49] = 4'h6;
    stim[50] = 4'h4;
    stim[51] = 4'h6;
    stim[52] = 4'h0;
    stim[53] = 4'h6;
    stim[54] = 4'h4;
    stim[55] = 4'h5;
    stim[56] = 4'h6;
    stim[57] = 4'h7;
    stim[58] = 4'h5;
    stim[59] = 4'h3;
    stim[60] = 4'h3;
    stim[61] = 4'h7;
    stim[62] = 4'h0;
    stim[63] = 4'h7;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h1012f1e06;
      expv[4] = 34'h0xxxxxxxx;
      expv[5] = 34'h0xxxxxxxx;
      expv[6] = 34'h0xxxxxxxx;
      expv[7] = 34'h0xxxxxxxx;
      expv[8] = 34'h0xxxxxxxx;
      expv[9] = 34'h0xxxxxxxx;
      expv[10] = 34'h1012f2106;
      expv[11] = 34'h1xxxxxxxx;
      expv[12] = 34'h0xxxxxxxx;
      expv[13] = 34'h2012f1e06;
      expv[14] = 34'h0xxxxxxxx;
      expv[15] = 34'h0xxxxxxxx;
      expv[16] = 34'h0xxxxxxxx;
      expv[17] = 34'h2012f2106;
      expv[18] = 34'h2xxxxxxxx;
      expv[19] = 34'h2xxxxxxxx;
      expv[20] = 34'h0xxxxxxxx;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h1012f1e06;
      expv[24] = 34'h0xxxxxxxx;
      expv[25] = 34'h1012f1e06;
      expv[26] = 34'h0xxxxxxxx;
      expv[27] = 34'h1012f1e06;
      expv[28] = 34'h0xxxxxxxx;
      expv[29] = 34'h0xxxxxxxx;
      expv[30] = 34'h0xxxxxxxx;
      expv[31] = 34'h0xxxxxxxx;
      expv[32] = 34'h0xxxxxxxx;
      expv[33] = 34'h0xxxxxxxx;
      expv[34] = 34'h0xxxxxxxx;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h1012f1e06;
      expv[38] = 34'h1xxxxxxxx;
      expv[39] = 34'h1xxxxxxxx;
      expv[40] = 34'h1xxxxxxxx;
      expv[41] = 34'h3012f2106;
      expv[42] = 34'h2xxxxxxxx;
      expv[43] = 34'h0xxxxxxxx;
      expv[44] = 34'h1012f1e06;
      expv[45] = 34'h0xxxxxxxx;
      expv[46] = 34'h0xxxxxxxx;
      expv[47] = 34'h0xxxxxxxx;
      expv[48] = 34'h0xxxxxxxx;
      expv[49] = 34'h2012f1e06;
      expv[50] = 34'h2xxxxxxxx;
      expv[51] = 34'h2xxxxxxxx;
      expv[52] = 34'h2xxxxxxxx;
      expv[53] = 34'h0xxxxxxxx;
      expv[54] = 34'h1012f1e06;
      expv[55] = 34'h0xxxxxxxx;
      expv[56] = 34'h0xxxxxxxx;
      expv[57] = 34'h0xxxxxxxx;
      expv[58] = 34'h0xxxxxxxx;
      expv[59] = 34'h0xxxxxxxx;
      expv[60] = 34'h0xxxxxxxx;
      expv[61] = 34'h0xxxxxxxx;
      expv[62] = 34'h0xxxxxxxx;
      expv[63] = 34'h0xxxxxxxx;
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
