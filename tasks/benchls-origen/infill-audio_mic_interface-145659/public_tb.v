// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145659 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .d_in(in_vec[23:8]),
    .cs(in_vec[7:7]),
    .wr(in_vec[6:6]),
    .rd(in_vec[5:5]),
    .addr(in_vec[4:1]),
    .micData(in_vec[0:0]),
    .d_out(out_vec[18:3]),
    .ledres(out_vec[2:2]),
    .mclk(out_vec[1:1]),
    .micLRSel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h18e4637;
    stim[1] = 25'h1ab7ee0;
    stim[2] = 25'h0f912bd;
    stim[3] = 25'h0c4693b;
    stim[4] = 25'h0e47512;
    stim[5] = 25'h0a23543;
    stim[6] = 25'h05c81b5;
    stim[7] = 25'h0d37330;
    stim[8] = 25'h00f37cc;
    stim[9] = 25'h0979783;
    stim[10] = 25'h0bf05a0;
    stim[11] = 25'h0958e63;
    stim[12] = 25'h0e0763e;
    stim[13] = 25'h0e35f97;
    stim[14] = 25'h03f0d6f;
    stim[15] = 25'h050979e;
    stim[16] = 25'h0c40b77;
    stim[17] = 25'h01153a2;
    stim[18] = 25'h006aef6;
    stim[19] = 25'h0c2b4a7;
    stim[20] = 25'h095a319;
    stim[21] = 25'h0c09b71;
    stim[22] = 25'h01847da;
    stim[23] = 25'h0276730;
    stim[24] = 25'h0de3bcf;
    stim[25] = 25'h06bee3f;
    stim[26] = 25'h0c83f19;
    stim[27] = 25'h0577d35;
    stim[28] = 25'h06b4433;
    stim[29] = 25'h0615e9c;
    stim[30] = 25'h0010014;
    stim[31] = 25'h1e828cb;
    stim[32] = 25'h0f288f6;
    stim[33] = 25'h0c040de;
    stim[34] = 25'h0f146fd;
    stim[35] = 25'h00e807e;
    stim[36] = 25'h0f86a37;
    stim[37] = 25'h0482e85;
    stim[38] = 25'h04fd9aa;
    stim[39] = 25'h0e63045;
    stim[40] = 25'h0793d71;
    stim[41] = 25'h0cdde2e;
    stim[42] = 25'h08642dd;
    stim[43] = 25'h0b4ab54;
    stim[44] = 25'h025c8b9;
    stim[45] = 25'h0ae5498;
    stim[46] = 25'h0ff00b9;
    stim[47] = 25'h1531fdf;
    stim[48] = 25'h0910af1;
    stim[49] = 25'h07a47c3;
    stim[50] = 25'h05327ed;
    stim[51] = 25'h0f8b13b;
    stim[52] = 25'h042c1a8;
    stim[53] = 25'h0701683;
    stim[54] = 25'h19a5da6;
    stim[55] = 25'h0e5db90;
    stim[56] = 25'h0c4b25a;
    stim[57] = 25'h05c55fd;
    stim[58] = 25'h0af7848;
    stim[59] = 25'h0194994;
    stim[60] = 25'h04af61e;
    stim[61] = 25'h0130d0e;
    stim[62] = 25'h0d5e0f6;
    stim[63] = 25'h00648ef;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00008;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00008;
      expv[40] = 19'h00008;
      expv[41] = 19'h00008;
      expv[42] = 19'h00008;
      expv[43] = 19'h00008;
      expv[44] = 19'h00008;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
