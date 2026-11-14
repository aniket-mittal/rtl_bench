// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h7d61;
    stim[1] = 16'h31ee;
    stim[2] = 16'h5ae6;
    stim[3] = 16'h0731;
    stim[4] = 16'hda37;
    stim[5] = 16'h9b39;
    stim[6] = 16'h73c5;
    stim[7] = 16'ha9e6;
    stim[8] = 16'h4029;
    stim[9] = 16'h94b8;
    stim[10] = 16'h4585;
    stim[11] = 16'h9c20;
    stim[12] = 16'h028c;
    stim[13] = 16'hc614;
    stim[14] = 16'h4a90;
    stim[15] = 16'hd69c;
    stim[16] = 16'hb109;
    stim[17] = 16'h6e7a;
    stim[18] = 16'habd8;
    stim[19] = 16'h79a7;
    stim[20] = 16'h4ccf;
    stim[21] = 16'hdbe5;
    stim[22] = 16'h0ee3;
    stim[23] = 16'h37c8;
    stim[24] = 16'h9fca;
    stim[25] = 16'h7ee1;
    stim[26] = 16'hebdb;
    stim[27] = 16'h06e9;
    stim[28] = 16'h02c9;
    stim[29] = 16'hc1fb;
    stim[30] = 16'h8a66;
    stim[31] = 16'hd70f;
    stim[32] = 16'h3772;
    stim[33] = 16'had81;
    stim[34] = 16'hb1bb;
    stim[35] = 16'h474f;
    stim[36] = 16'haac9;
    stim[37] = 16'h5f17;
    stim[38] = 16'h4682;
    stim[39] = 16'h68e5;
    stim[40] = 16'he5fd;
    stim[41] = 16'he3d3;
    stim[42] = 16'h3dda;
    stim[43] = 16'hcdd2;
    stim[44] = 16'hced0;
    stim[45] = 16'hec28;
    stim[46] = 16'had3d;
    stim[47] = 16'hff67;
    stim[48] = 16'h1845;
    stim[49] = 16'h64ba;
    stim[50] = 16'h2dec;
    stim[51] = 16'h6490;
    stim[52] = 16'hc812;
    stim[53] = 16'h446c;
    stim[54] = 16'hc357;
    stim[55] = 16'h66ad;
    stim[56] = 16'ha330;
    stim[57] = 16'h9c68;
    stim[58] = 16'hc4b1;
    stim[59] = 16'ha2a8;
    stim[60] = 16'had7f;
    stim[61] = 16'h8db1;
    stim[62] = 16'h16d4;
    stim[63] = 16'h24f6;
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
      expv[0] = 16'h829e;
      expv[1] = 16'hce11;
      expv[2] = 16'ha519;
      expv[3] = 16'hf8ce;
      expv[4] = 16'h25c8;
      expv[5] = 16'h64c6;
      expv[6] = 16'h8c3a;
      expv[7] = 16'h5619;
      expv[8] = 16'hbfd6;
      expv[9] = 16'h6b47;
      expv[10] = 16'hba7a;
      expv[11] = 16'h63df;
      expv[12] = 16'hfd73;
      expv[13] = 16'h39eb;
      expv[14] = 16'hb56f;
      expv[15] = 16'h2963;
      expv[16] = 16'h4ef6;
      expv[17] = 16'h9185;
      expv[18] = 16'h5427;
      expv[19] = 16'h8658;
      expv[20] = 16'hb330;
      expv[21] = 16'h241a;
      expv[22] = 16'hf11c;
      expv[23] = 16'hc837;
      expv[24] = 16'h6035;
      expv[25] = 16'h811e;
      expv[26] = 16'h1424;
      expv[27] = 16'hf916;
      expv[28] = 16'hfd36;
      expv[29] = 16'h3e04;
      expv[30] = 16'h7599;
      expv[31] = 16'h28f0;
      expv[32] = 16'hc88d;
      expv[33] = 16'h527e;
      expv[34] = 16'h4e44;
      expv[35] = 16'hb8b0;
      expv[36] = 16'h5536;
      expv[37] = 16'ha0e8;
      expv[38] = 16'hb97d;
      expv[39] = 16'h971a;
      expv[40] = 16'h1a02;
      expv[41] = 16'h1c2c;
      expv[42] = 16'hc225;
      expv[43] = 16'h322d;
      expv[44] = 16'h312f;
      expv[45] = 16'h13d7;
      expv[46] = 16'h52c2;
      expv[47] = 16'h0098;
      expv[48] = 16'he7ba;
      expv[49] = 16'h9b45;
      expv[50] = 16'hd213;
      expv[51] = 16'h9b6f;
      expv[52] = 16'h37ed;
      expv[53] = 16'hbb93;
      expv[54] = 16'h3ca8;
      expv[55] = 16'h9952;
      expv[56] = 16'h5ccf;
      expv[57] = 16'h6397;
      expv[58] = 16'h3b4e;
      expv[59] = 16'h5d57;
      expv[60] = 16'h5280;
      expv[61] = 16'h724e;
      expv[62] = 16'he92b;
      expv[63] = 16'hdb09;
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
