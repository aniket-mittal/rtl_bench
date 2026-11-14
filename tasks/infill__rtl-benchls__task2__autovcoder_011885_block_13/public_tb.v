// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011885 dut (
    .sysClk(clk),
    .sysRst(in_vec[10:10]),
    .in_data(in_vec[9:2]),
    .in_data_valid(in_vec[1:1]),
    .out_data_ready(in_vec[0:0]),
    .in_data_ready(out_vec[22:22]),
    .out_data(out_vec[21:14]),
    .out_data_valid(out_vec[13:13]),
    .fillLevel(out_vec[12:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h568;
    stim[1] = 11'h523;
    stim[2] = 11'h0dd;
    stim[3] = 11'h046;
    stim[4] = 11'h1fa;
    stim[5] = 11'h37c;
    stim[6] = 11'h00f;
    stim[7] = 11'h3b6;
    stim[8] = 11'h337;
    stim[9] = 11'h12e;
    stim[10] = 11'h1a7;
    stim[11] = 11'h1fc;
    stim[12] = 11'h189;
    stim[13] = 11'h14d;
    stim[14] = 11'h1b0;
    stim[15] = 11'h182;
    stim[16] = 11'h2cf;
    stim[17] = 11'h10b;
    stim[18] = 11'h128;
    stim[19] = 11'h29a;
    stim[20] = 11'h293;
    stim[21] = 11'h22c;
    stim[22] = 11'h34c;
    stim[23] = 11'h082;
    stim[24] = 11'h389;
    stim[25] = 11'h20b;
    stim[26] = 11'h3a2;
    stim[27] = 11'h11f;
    stim[28] = 11'h16a;
    stim[29] = 11'h026;
    stim[30] = 11'h224;
    stim[31] = 11'h2d2;
    stim[32] = 11'h16e;
    stim[33] = 11'h140;
    stim[34] = 11'h0bf;
    stim[35] = 11'h3fd;
    stim[36] = 11'h2ba;
    stim[37] = 11'h0b6;
    stim[38] = 11'h262;
    stim[39] = 11'h0f0;
    stim[40] = 11'h0a1;
    stim[41] = 11'h2ca;
    stim[42] = 11'h0b5;
    stim[43] = 11'h330;
    stim[44] = 11'h189;
    stim[45] = 11'h119;
    stim[46] = 11'h03f;
    stim[47] = 11'h2f0;
    stim[48] = 11'h05d;
    stim[49] = 11'h127;
    stim[50] = 11'h04f;
    stim[51] = 11'h1fe;
    stim[52] = 11'h2a7;
    stim[53] = 11'h2b6;
    stim[54] = 11'h2f6;
    stim[55] = 11'h329;
    stim[56] = 11'h03b;
    stim[57] = 11'h184;
    stim[58] = 11'h230;
    stim[59] = 11'h114;
    stim[60] = 11'h001;
    stim[61] = 11'h103;
    stim[62] = 11'h317;
    stim[63] = 11'h2f9;
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
      expv[0] = 23'hxxx001;
      expv[1] = 23'hxxx001;
      expv[2] = 23'hxxx001;
      expv[3] = 23'hxxx001;
      expv[4] = 23'hxxx004;
      expv[5] = 23'hxxx008;
      expv[6] = 23'hxxx008;
      expv[7] = 23'h444004;
      expv[8] = 23'h444008;
      expv[9] = 23'h44400c;
      expv[10] = 23'h444010;
      expv[11] = 23'h444014;
      expv[12] = 23'h446014;
      expv[13] = 23'h5fa010;
      expv[14] = 23'h40e00c;
      expv[15] = 23'h40e00c;
      expv[16] = 23'h40c010;
      expv[17] = 23'h40c014;
      expv[18] = 23'h40c018;
      expv[19] = 23'h40e018;
      expv[20] = 23'h40c01c;
      expv[21] = 23'h40c020;
      expv[22] = 23'h40e020;
      expv[23] = 23'h40e020;
      expv[24] = 23'h40c024;
      expv[25] = 23'h40e024;
      expv[26] = 23'h7b4020;
      expv[27] = 23'h7b4024;
      expv[28] = 23'h7b4028;
      expv[29] = 23'h7b402c;
      expv[30] = 23'h7b4030;
      expv[31] = 23'h7b6030;
      expv[32] = 23'h7b4034;
      expv[33] = 23'h7b4038;
      expv[34] = 23'h7b6038;
      expv[35] = 23'h734034;
      expv[36] = 23'h736034;
      expv[37] = 23'h734038;
      expv[38] = 23'h73403c;
      expv[39] = 23'h734040;
      expv[40] = 23'h736040;
      expv[41] = 23'h52e03c;
      expv[42] = 23'h52c040;
      expv[43] = 23'h52e040;
      expv[44] = 23'h52e040;
      expv[45] = 23'h5a603c;
      expv[46] = 23'h582038;
      expv[47] = 23'h6cc034;
      expv[48] = 23'h6ce034;
      expv[49] = 23'h50a030;
      expv[50] = 23'h69802c;
      expv[51] = 23'h698030;
      expv[52] = 23'h698034;
      expv[53] = 23'h698038;
      expv[54] = 23'h69803c;
      expv[55] = 23'h698040;
      expv[56] = 23'h69a040;
      expv[57] = 23'h69003c;
      expv[58] = 23'h69203c;
      expv[59] = 23'h69203c;
      expv[60] = 23'h69203c;
      expv[61] = 23'h482038;
      expv[62] = 23'h608034;
      expv[63] = 23'h608038;
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
