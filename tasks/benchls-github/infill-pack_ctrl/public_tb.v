// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pack_ctrl dut (
    .rotate(in_vec[9:8]),
    .prefix_count(in_vec[7:0]),
    .ctrl(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h08f;
    stim[1] = 10'h30c;
    stim[2] = 10'h3ca;
    stim[3] = 10'h24c;
    stim[4] = 10'h215;
    stim[5] = 10'h2bc;
    stim[6] = 10'h3a0;
    stim[7] = 10'h064;
    stim[8] = 10'h322;
    stim[9] = 10'h177;
    stim[10] = 10'h0ee;
    stim[11] = 10'h27a;
    stim[12] = 10'h30f;
    stim[13] = 10'h3cd;
    stim[14] = 10'h1c7;
    stim[15] = 10'h33b;
    stim[16] = 10'h3ed;
    stim[17] = 10'h34a;
    stim[18] = 10'h32a;
    stim[19] = 10'h096;
    stim[20] = 10'h07b;
    stim[21] = 10'h0e9;
    stim[22] = 10'h0c2;
    stim[23] = 10'h0f2;
    stim[24] = 10'h3c0;
    stim[25] = 10'h3bb;
    stim[26] = 10'h3b5;
    stim[27] = 10'h1e1;
    stim[28] = 10'h140;
    stim[29] = 10'h2a0;
    stim[30] = 10'h236;
    stim[31] = 10'h1c6;
    stim[32] = 10'h3cd;
    stim[33] = 10'h1cf;
    stim[34] = 10'h3af;
    stim[35] = 10'h278;
    stim[36] = 10'h3d5;
    stim[37] = 10'h357;
    stim[38] = 10'h3df;
    stim[39] = 10'h0f4;
    stim[40] = 10'h246;
    stim[41] = 10'h1fc;
    stim[42] = 10'h2b1;
    stim[43] = 10'h28b;
    stim[44] = 10'h143;
    stim[45] = 10'h173;
    stim[46] = 10'h3bf;
    stim[47] = 10'h035;
    stim[48] = 10'h2c9;
    stim[49] = 10'h1e0;
    stim[50] = 10'h11d;
    stim[51] = 10'h118;
    stim[52] = 10'h232;
    stim[53] = 10'h2ba;
    stim[54] = 10'h108;
    stim[55] = 10'h09a;
    stim[56] = 10'h303;
    stim[57] = 10'h22e;
    stim[58] = 10'h1f6;
    stim[59] = 10'h3e7;
    stim[60] = 10'h3e4;
    stim[61] = 10'h10e;
    stim[62] = 10'h162;
    stim[63] = 10'h1ee;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h9a;
      expv[1] = 8'h66;
      expv[2] = 8'h96;
      expv[3] = 8'h55;
      expv[4] = 8'h99;
      expv[5] = 8'h96;
      expv[6] = 8'h59;
      expv[7] = 8'h55;
      expv[8] = 8'h59;
      expv[9] = 8'ha5;
      expv[10] = 8'h55;
      expv[11] = 8'h66;
      expv[12] = 8'h66;
      expv[13] = 8'ha6;
      expv[14] = 8'ha9;
      expv[15] = 8'h5a;
      expv[16] = 8'ha9;
      expv[17] = 8'h96;
      expv[18] = 8'h59;
      expv[19] = 8'h96;
      expv[20] = 8'h69;
      expv[21] = 8'h65;
      expv[22] = 8'h6a;
      expv[23] = 8'h69;
      expv[24] = 8'h96;
      expv[25] = 8'h5a;
      expv[26] = 8'h6a;
      expv[27] = 8'h96;
      expv[28] = 8'h99;
      expv[29] = 8'haa;
      expv[30] = 8'h96;
      expv[31] = 8'ha9;
      expv[32] = 8'ha6;
      expv[33] = 8'ha9;
      expv[34] = 8'h69;
      expv[35] = 8'h66;
      expv[36] = 8'ha5;
      expv[37] = 8'ha5;
      expv[38] = 8'ha5;
      expv[39] = 8'h59;
      expv[40] = 8'h55;
      expv[41] = 8'ha5;
      expv[42] = 8'ha6;
      expv[43] = 8'ha5;
      expv[44] = 8'h99;
      expv[45] = 8'h95;
      expv[46] = 8'h6a;
      expv[47] = 8'h99;
      expv[48] = 8'h65;
      expv[49] = 8'h96;
      expv[50] = 8'h6a;
      expv[51] = 8'h5a;
      expv[52] = 8'ha6;
      expv[53] = 8'ha6;
      expv[54] = 8'h59;
      expv[55] = 8'ha6;
      expv[56] = 8'h56;
      expv[57] = 8'h9a;
      expv[58] = 8'ha5;
      expv[59] = 8'ha9;
      expv[60] = 8'ha9;
      expv[61] = 8'h69;
      expv[62] = 8'h96;
      expv[63] = 8'ha6;
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
