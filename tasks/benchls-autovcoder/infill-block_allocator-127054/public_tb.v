// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_127054 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .req_size(in_vec[9:6]),
    .req_alloc(in_vec[5:5]),
    .req_free(in_vec[4:4]),
    .block_id(in_vec[3:0]),
    .success(out_vec[4:4]),
    .allocated_block(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h659;
    stim[1] = 11'h6fc;
    stim[2] = 11'h01c;
    stim[3] = 11'h3db;
    stim[4] = 11'h1e4;
    stim[5] = 11'h2a4;
    stim[6] = 11'h09b;
    stim[7] = 11'h0a3;
    stim[8] = 11'h01c;
    stim[9] = 11'h2e1;
    stim[10] = 11'h71f;
    stim[11] = 11'h12a;
    stim[12] = 11'h0bf;
    stim[13] = 11'h215;
    stim[14] = 11'h0a7;
    stim[15] = 11'h1c7;
    stim[16] = 11'h24a;
    stim[17] = 11'h22f;
    stim[18] = 11'h1e7;
    stim[19] = 11'h358;
    stim[20] = 11'h3da;
    stim[21] = 11'h15c;
    stim[22] = 11'h1fd;
    stim[23] = 11'h166;
    stim[24] = 11'h3c5;
    stim[25] = 11'h337;
    stim[26] = 11'h3be;
    stim[27] = 11'h294;
    stim[28] = 11'h2b0;
    stim[29] = 11'h3d3;
    stim[30] = 11'h262;
    stim[31] = 11'h3b7;
    stim[32] = 11'h2cf;
    stim[33] = 11'h302;
    stim[34] = 11'h2d0;
    stim[35] = 11'h040;
    stim[36] = 11'h2fe;
    stim[37] = 11'h3fd;
    stim[38] = 11'h03c;
    stim[39] = 11'h280;
    stim[40] = 11'h39a;
    stim[41] = 11'h194;
    stim[42] = 11'h509;
    stim[43] = 11'h33c;
    stim[44] = 11'h132;
    stim[45] = 11'h1c9;
    stim[46] = 11'h1de;
    stim[47] = 11'h3b7;
    stim[48] = 11'h0b8;
    stim[49] = 11'h226;
    stim[50] = 11'h172;
    stim[51] = 11'h4f6;
    stim[52] = 11'h15d;
    stim[53] = 11'h3fd;
    stim[54] = 11'h315;
    stim[55] = 11'h2a1;
    stim[56] = 11'h363;
    stim[57] = 11'h334;
    stim[58] = 11'h360;
    stim[59] = 11'h3ad;
    stim[60] = 11'h022;
    stim[61] = 11'h19f;
    stim[62] = 11'h3eb;
    stim[63] = 11'h0e8;
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
      expv[0] = 5'h0x;
      expv[1] = 5'h0x;
      expv[2] = 5'h0x;
      expv[3] = 5'h0x;
      expv[4] = 5'h0x;
      expv[5] = 5'h10;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h17;
      expv[9] = 5'h07;
      expv[10] = 5'h07;
      expv[11] = 5'h07;
      expv[12] = 5'h10;
      expv[13] = 5'h14;
      expv[14] = 5'h04;
      expv[15] = 5'h16;
      expv[16] = 5'h16;
      expv[17] = 5'h16;
      expv[18] = 5'h18;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h16;
      expv[24] = 5'h06;
      expv[25] = 5'h06;
      expv[26] = 5'h06;
      expv[27] = 5'h06;
      expv[28] = 5'h16;
      expv[29] = 5'h06;
      expv[30] = 5'h06;
      expv[31] = 5'h06;
      expv[32] = 5'h06;
      expv[33] = 5'h06;
      expv[34] = 5'h06;
      expv[35] = 5'h16;
      expv[36] = 5'h16;
      expv[37] = 5'h06;
      expv[38] = 5'h06;
      expv[39] = 5'h06;
      expv[40] = 5'h06;
      expv[41] = 5'h06;
      expv[42] = 5'h06;
      expv[43] = 5'h06;
      expv[44] = 5'h10;
      expv[45] = 5'h1c;
      expv[46] = 5'h1c;
      expv[47] = 5'h0c;
      expv[48] = 5'h10;
      expv[49] = 5'h1e;
      expv[50] = 5'h10;
      expv[51] = 5'h08;
      expv[52] = 5'h08;
      expv[53] = 5'h08;
      expv[54] = 5'h10;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
