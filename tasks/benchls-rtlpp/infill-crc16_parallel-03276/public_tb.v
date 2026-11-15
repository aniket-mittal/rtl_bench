// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03276 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[47:16]),
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
    stim[0] = 20'h3e7fb;
    stim[1] = 20'hcc253;
    stim[2] = 20'h6d426;
    stim[3] = 20'ha7a58;
    stim[4] = 20'hf9ecc;
    stim[5] = 20'heb58c;
    stim[6] = 20'h1a892;
    stim[7] = 20'hb1d84;
    stim[8] = 20'ha6898;
    stim[9] = 20'h130ae;
    stim[10] = 20'h68ee6;
    stim[11] = 20'h83292;
    stim[12] = 20'hf6100;
    stim[13] = 20'he49fe;
    stim[14] = 20'h74336;
    stim[15] = 20'hf7e0c;
    stim[16] = 20'h5cd24;
    stim[17] = 20'h97c58;
    stim[18] = 20'h6a084;
    stim[19] = 20'h31e8c;
    stim[20] = 20'h1a766;
    stim[21] = 20'h2610a;
    stim[22] = 20'h44fe2;
    stim[23] = 20'hd233e;
    stim[24] = 20'hdb7ae;
    stim[25] = 20'h1315c;
    stim[26] = 20'h6b660;
    stim[27] = 20'h288b8;
    stim[28] = 20'ha48ee;
    stim[29] = 20'h80960;
    stim[30] = 20'h30606;
    stim[31] = 20'h7e212;
    stim[32] = 20'hae3b6;
    stim[33] = 20'hef328;
    stim[34] = 20'hb91e2;
    stim[35] = 20'ha5d04;
    stim[36] = 20'hba064;
    stim[37] = 20'h7234e;
    stim[38] = 20'hdc7ec;
    stim[39] = 20'ha21e6;
    stim[40] = 20'hf1d6c;
    stim[41] = 20'h59720;
    stim[42] = 20'hede04;
    stim[43] = 20'hf568c;
    stim[44] = 20'hafd46;
    stim[45] = 20'h793c2;
    stim[46] = 20'h5ac1e;
    stim[47] = 20'ha4f24;
    stim[48] = 20'haf966;
    stim[49] = 20'hf69d6;
    stim[50] = 20'hf657c;
    stim[51] = 20'hdf140;
    stim[52] = 20'h67b54;
    stim[53] = 20'h36d28;
    stim[54] = 20'hf4f6c;
    stim[55] = 20'h4b5cd;
    stim[56] = 20'h6f5b0;
    stim[57] = 20'h594e0;
    stim[58] = 20'h5f40e;
    stim[59] = 20'h78d70;
    stim[60] = 20'h1685e;
    stim[61] = 20'he4ac6;
    stim[62] = 20'h97830;
    stim[63] = 20'h9d2b2;
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
      expv[0] = 48'hffffffffffff;
      expv[1] = 48'hffffffffffff;
      expv[2] = 48'hffffffffffff;
      expv[3] = 48'hffffffffffff;
      expv[4] = 48'hffffffffffff;
      expv[5] = 48'hffffffffffff;
      expv[6] = 48'hffffffffffff;
      expv[7] = 48'hffffffff0000;
      expv[8] = 48'hffffffffffff;
      expv[9] = 48'hffffffffffff;
      expv[10] = 48'hffffffffffff;
      expv[11] = 48'hffffffffffff;
      expv[12] = 48'hffffffff0000;
      expv[13] = 48'hffffffff0000;
      expv[14] = 48'hffffffffffff;
      expv[15] = 48'hffffffffffff;
      expv[16] = 48'hffffffffffff;
      expv[17] = 48'hffffffffffff;
      expv[18] = 48'hffffffffffff;
      expv[19] = 48'hffffffffffff;
      expv[20] = 48'hffffffffffff;
      expv[21] = 48'hffffffffffff;
      expv[22] = 48'h355e97648553;
      expv[23] = 48'h9764ffffd916;
      expv[24] = 48'hffffffffffff;
      expv[25] = 48'hffffffffffff;
      expv[26] = 48'hffffffffffff;
      expv[27] = 48'hffffffffffff;
      expv[28] = 48'hffffffffffff;
      expv[29] = 48'hffffffffffff;
      expv[30] = 48'hffffffffffff;
      expv[31] = 48'hffffffffffff;
      expv[32] = 48'hffffffff0000;
      expv[33] = 48'hffffffffffff;
      expv[34] = 48'hffffffffffff;
      expv[35] = 48'hffffffff0000;
      expv[36] = 48'hffffffffffff;
      expv[37] = 48'hffffffffffff;
      expv[38] = 48'hffffffffffff;
      expv[39] = 48'hffffffffffff;
      expv[40] = 48'hffffffffffff;
      expv[41] = 48'hffffffffffff;
      expv[42] = 48'hffffffffffff;
      expv[43] = 48'hffffffffffff;
      expv[44] = 48'hffffffffffff;
      expv[45] = 48'hffffffffffff;
      expv[46] = 48'hffffffff0000;
      expv[47] = 48'hffffffffffff;
      expv[48] = 48'hffffffffffff;
      expv[49] = 48'hffffffffffff;
      expv[50] = 48'hffffffffffff;
      expv[51] = 48'hffffffffffff;
      expv[52] = 48'hffffffffffff;
      expv[53] = 48'hffffffffffff;
      expv[54] = 48'hffffffffffff;
      expv[55] = 48'hffffffffffff;
      expv[56] = 48'hffffffffffff;
      expv[57] = 48'hffffffffffff;
      expv[58] = 48'hffffffffffff;
      expv[59] = 48'hffffffffffff;
      expv[60] = 48'hffffffffffff;
      expv[61] = 48'hffffffffffff;
      expv[62] = 48'hffffffffffff;
      expv[63] = 48'hffffffffffff;
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
