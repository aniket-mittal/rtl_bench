// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08050 dut (
    .clk(clk),
    .d(in_vec[31:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb6ad037a;
    stim[1] = 32'h95198a3a;
    stim[2] = 32'h1f35a46b;
    stim[3] = 32'h2c2af0c4;
    stim[4] = 32'ha47295d4;
    stim[5] = 32'h870576d4;
    stim[6] = 32'hc830afdb;
    stim[7] = 32'h47c2d842;
    stim[8] = 32'h1c5ad0df;
    stim[9] = 32'hd95b93d5;
    stim[10] = 32'hedcb4d86;
    stim[11] = 32'hab9ef798;
    stim[12] = 32'h9377cbf8;
    stim[13] = 32'he5e6e66e;
    stim[14] = 32'he09b8a77;
    stim[15] = 32'hcad8283f;
    stim[16] = 32'h7a36e9a0;
    stim[17] = 32'hc146dc6d;
    stim[18] = 32'h25f867c1;
    stim[19] = 32'hca2c1270;
    stim[20] = 32'h7c7ee80d;
    stim[21] = 32'h21207452;
    stim[22] = 32'he4ce95db;
    stim[23] = 32'h4d306e7e;
    stim[24] = 32'h9baeb3fc;
    stim[25] = 32'h4804edf4;
    stim[26] = 32'he04a34d0;
    stim[27] = 32'hab98560a;
    stim[28] = 32'hf4206baf;
    stim[29] = 32'h17220296;
    stim[30] = 32'h15d3e0b2;
    stim[31] = 32'h3f8492ea;
    stim[32] = 32'h2755dfc6;
    stim[33] = 32'h032fe0b6;
    stim[34] = 32'h9470420b;
    stim[35] = 32'ha6ae439e;
    stim[36] = 32'h2860a78c;
    stim[37] = 32'h002535a3;
    stim[38] = 32'h348b4a42;
    stim[39] = 32'ha21594f7;
    stim[40] = 32'h4adeda9d;
    stim[41] = 32'hf33e1182;
    stim[42] = 32'hfc0037fc;
    stim[43] = 32'hf1431dd0;
    stim[44] = 32'ha1b9ebde;
    stim[45] = 32'h02a5f114;
    stim[46] = 32'h74d03463;
    stim[47] = 32'he147e187;
    stim[48] = 32'h13cab8fd;
    stim[49] = 32'hb263284f;
    stim[50] = 32'h0ab70dcc;
    stim[51] = 32'hbccd9568;
    stim[52] = 32'hbfa13cc6;
    stim[53] = 32'h68cae02d;
    stim[54] = 32'h43af048f;
    stim[55] = 32'h6be8702e;
    stim[56] = 32'he577d3ee;
    stim[57] = 32'h36c3571f;
    stim[58] = 32'h85726dd0;
    stim[59] = 32'h3b01b629;
    stim[60] = 32'haa5366e4;
    stim[61] = 32'hee043936;
    stim[62] = 32'hc025fa5a;
    stim[63] = 32'h92608f48;
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
      expv[0] = 32'hb6ad037a;
      expv[1] = 32'h95198a3a;
      expv[2] = 32'h1f35a46b;
      expv[3] = 32'h2c2af0c4;
      expv[4] = 32'ha47295d4;
      expv[5] = 32'h870576d4;
      expv[6] = 32'hc830afdb;
      expv[7] = 32'h47c2d842;
      expv[8] = 32'h1c5ad0df;
      expv[9] = 32'hd95b93d5;
      expv[10] = 32'hedcb4d86;
      expv[11] = 32'hab9ef798;
      expv[12] = 32'h9377cbf8;
      expv[13] = 32'he5e6e66e;
      expv[14] = 32'he09b8a77;
      expv[15] = 32'hcad8283f;
      expv[16] = 32'h7a36e9a0;
      expv[17] = 32'hc146dc6d;
      expv[18] = 32'h25f867c1;
      expv[19] = 32'hca2c1270;
      expv[20] = 32'h7c7ee80d;
      expv[21] = 32'h21207452;
      expv[22] = 32'he4ce95db;
      expv[23] = 32'h4d306e7e;
      expv[24] = 32'h9baeb3fc;
      expv[25] = 32'h4804edf4;
      expv[26] = 32'he04a34d0;
      expv[27] = 32'hab98560a;
      expv[28] = 32'hf4206baf;
      expv[29] = 32'h17220296;
      expv[30] = 32'h15d3e0b2;
      expv[31] = 32'h3f8492ea;
      expv[32] = 32'h2755dfc6;
      expv[33] = 32'h032fe0b6;
      expv[34] = 32'h9470420b;
      expv[35] = 32'ha6ae439e;
      expv[36] = 32'h2860a78c;
      expv[37] = 32'h002535a3;
      expv[38] = 32'h348b4a42;
      expv[39] = 32'ha21594f7;
      expv[40] = 32'h4adeda9d;
      expv[41] = 32'hf33e1182;
      expv[42] = 32'hfc0037fc;
      expv[43] = 32'hf1431dd0;
      expv[44] = 32'ha1b9ebde;
      expv[45] = 32'h02a5f114;
      expv[46] = 32'h74d03463;
      expv[47] = 32'he147e187;
      expv[48] = 32'h13cab8fd;
      expv[49] = 32'hb263284f;
      expv[50] = 32'h0ab70dcc;
      expv[51] = 32'hbccd9568;
      expv[52] = 32'hbfa13cc6;
      expv[53] = 32'h68cae02d;
      expv[54] = 32'h43af048f;
      expv[55] = 32'h6be8702e;
      expv[56] = 32'he577d3ee;
      expv[57] = 32'h36c3571f;
      expv[58] = 32'h85726dd0;
      expv[59] = 32'h3b01b629;
      expv[60] = 32'haa5366e4;
      expv[61] = 32'hee043936;
      expv[62] = 32'hc025fa5a;
      expv[63] = 32'h92608f48;
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
