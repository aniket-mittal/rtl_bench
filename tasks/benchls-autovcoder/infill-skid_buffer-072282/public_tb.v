// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072282 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4f9;
    stim[1] = 11'h6c8;
    stim[2] = 11'h2db;
    stim[3] = 11'h3d1;
    stim[4] = 11'h25a;
    stim[5] = 11'h233;
    stim[6] = 11'h212;
    stim[7] = 11'h15f;
    stim[8] = 11'h249;
    stim[9] = 11'h2d9;
    stim[10] = 11'h127;
    stim[11] = 11'h27c;
    stim[12] = 11'h370;
    stim[13] = 11'h3ff;
    stim[14] = 11'h1ed;
    stim[15] = 11'h35c;
    stim[16] = 11'h017;
    stim[17] = 11'h0f5;
    stim[18] = 11'h14f;
    stim[19] = 11'h3dd;
    stim[20] = 11'h144;
    stim[21] = 11'h3e7;
    stim[22] = 11'h23f;
    stim[23] = 11'h3b6;
    stim[24] = 11'h122;
    stim[25] = 11'h075;
    stim[26] = 11'h1aa;
    stim[27] = 11'h1e3;
    stim[28] = 11'h3b8;
    stim[29] = 11'h4c3;
    stim[30] = 11'h0b1;
    stim[31] = 11'h027;
    stim[32] = 11'h1a7;
    stim[33] = 11'h2c0;
    stim[34] = 11'h03e;
    stim[35] = 11'h2be;
    stim[36] = 11'h330;
    stim[37] = 11'h05a;
    stim[38] = 11'h027;
    stim[39] = 11'h2e0;
    stim[40] = 11'h195;
    stim[41] = 11'h32c;
    stim[42] = 11'h0d7;
    stim[43] = 11'h153;
    stim[44] = 11'h3fd;
    stim[45] = 11'h102;
    stim[46] = 11'h00d;
    stim[47] = 11'h2c9;
    stim[48] = 11'h099;
    stim[49] = 11'h1bf;
    stim[50] = 11'h272;
    stim[51] = 11'h233;
    stim[52] = 11'h34f;
    stim[53] = 11'h002;
    stim[54] = 11'h1db;
    stim[55] = 11'h02b;
    stim[56] = 11'h2b9;
    stim[57] = 11'h1be;
    stim[58] = 11'h288;
    stim[59] = 11'h3bd;
    stim[60] = 11'h19a;
    stim[61] = 11'h139;
    stim[62] = 11'h2aa;
    stim[63] = 11'h160;
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
      expv[3] = 12'hdb0;
      expv[4] = 12'hdb0;
      expv[5] = 12'hcb5;
      expv[6] = 12'hc65;
      expv[7] = 12'h466;
      expv[8] = 12'hc25;
      expv[9] = 12'hc20;
      expv[10] = 12'hc20;
      expv[11] = 12'ha4d;
      expv[12] = 12'ha4d;
      expv[13] = 12'ha4d;
      expv[14] = 12'hffd;
      expv[15] = 12'hff8;
      expv[16] = 12'hff8;
      expv[17] = 12'h82d;
      expv[18] = 12'h828;
      expv[19] = 12'ha9d;
      expv[20] = 12'ha98;
      expv[21] = 12'ha98;
      expv[22] = 12'hfcd;
      expv[23] = 12'hc7d;
      expv[24] = 12'h47e;
      expv[25] = 12'h47e;
      expv[26] = 12'hf6d;
      expv[27] = 12'h76e;
      expv[28] = 12'hb55;
      expv[29] = 12'hb55;
      expv[30] = 12'h180;
      expv[31] = 12'h980;
      expv[32] = 12'h84d;
      expv[33] = 12'hb4d;
      expv[34] = 12'hb4d;
      expv[35] = 12'h34e;
      expv[36] = 12'h34e;
      expv[37] = 12'h34e;
      expv[38] = 12'h34e;
      expv[39] = 12'h87d;
      expv[40] = 12'h87d;
      expv[41] = 12'h878;
      expv[42] = 12'h878;
      expv[43] = 12'h9ad;
      expv[44] = 12'haa5;
      expv[45] = 12'haa0;
      expv[46] = 12'ha05;
      expv[47] = 12'ha00;
      expv[48] = 12'ha00;
      expv[49] = 12'ha00;
      expv[50] = 12'hb7d;
      expv[51] = 12'h37e;
      expv[52] = 12'hce5;
      expv[53] = 12'he9d;
      expv[54] = 12'h69e;
      expv[55] = 12'h805;
      expv[56] = 12'h855;
      expv[57] = 12'h850;
      expv[58] = 12'hb7d;
      expv[59] = 12'hb7d;
      expv[60] = 12'hb78;
      expv[61] = 12'hb35;
      expv[62] = 12'hb30;
      expv[63] = 12'hd55;
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
