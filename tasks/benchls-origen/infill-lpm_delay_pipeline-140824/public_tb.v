// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140824 dut (
    .clock(clk),
    .d(in_vec[8:1]),
    .aclr(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1f1;
    stim[1] = 9'h085;
    stim[2] = 9'h0e2;
    stim[3] = 9'h1ac;
    stim[4] = 9'h1be;
    stim[5] = 9'h0ae;
    stim[6] = 9'h162;
    stim[7] = 9'h0e0;
    stim[8] = 9'h060;
    stim[9] = 9'h038;
    stim[10] = 9'h0e4;
    stim[11] = 9'h0aa;
    stim[12] = 9'h0c0;
    stim[13] = 9'h19a;
    stim[14] = 9'h02c;
    stim[15] = 9'h082;
    stim[16] = 9'h014;
    stim[17] = 9'h004;
    stim[18] = 9'h184;
    stim[19] = 9'h118;
    stim[20] = 9'h052;
    stim[21] = 9'h14e;
    stim[22] = 9'h032;
    stim[23] = 9'h07a;
    stim[24] = 9'h1c0;
    stim[25] = 9'h19a;
    stim[26] = 9'h052;
    stim[27] = 9'h150;
    stim[28] = 9'h01a;
    stim[29] = 9'h1de;
    stim[30] = 9'h0b3;
    stim[31] = 9'h01a;
    stim[32] = 9'h0b6;
    stim[33] = 9'h13c;
    stim[34] = 9'h0a4;
    stim[35] = 9'h0f8;
    stim[36] = 9'h1c2;
    stim[37] = 9'h014;
    stim[38] = 9'h130;
    stim[39] = 9'h082;
    stim[40] = 9'h1c0;
    stim[41] = 9'h0f8;
    stim[42] = 9'h140;
    stim[43] = 9'h03d;
    stim[44] = 9'h1fc;
    stim[45] = 9'h1da;
    stim[46] = 9'h19e;
    stim[47] = 9'h086;
    stim[48] = 9'h17e;
    stim[49] = 9'h012;
    stim[50] = 9'h07c;
    stim[51] = 9'h032;
    stim[52] = 9'h148;
    stim[53] = 9'h104;
    stim[54] = 9'h040;
    stim[55] = 9'h166;
    stim[56] = 9'h1a4;
    stim[57] = 9'h12c;
    stim[58] = 9'h1a4;
    stim[59] = 9'h1f0;
    stim[60] = 9'h10a;
    stim[61] = 9'h1d4;
    stim[62] = 9'h0e6;
    stim[63] = 9'h166;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h71;
      expv[8] = 8'hd6;
      expv[9] = 8'hdf;
      expv[10] = 8'h57;
      expv[11] = 8'hb1;
      expv[12] = 8'h70;
      expv[13] = 8'h30;
      expv[14] = 8'h1c;
      expv[15] = 8'h72;
      expv[16] = 8'h55;
      expv[17] = 8'h60;
      expv[18] = 8'hcd;
      expv[19] = 8'h16;
      expv[20] = 8'h41;
      expv[21] = 8'h0a;
      expv[22] = 8'h02;
      expv[23] = 8'hc2;
      expv[24] = 8'h8c;
      expv[25] = 8'h29;
      expv[26] = 8'ha7;
      expv[27] = 8'h19;
      expv[28] = 8'h3d;
      expv[29] = 8'he0;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h0d;
      expv[37] = 8'h5b;
      expv[38] = 8'h9e;
      expv[39] = 8'h52;
      expv[40] = 8'h7c;
      expv[41] = 8'he1;
      expv[42] = 8'h0a;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'hfe;
      expv[50] = 8'hed;
      expv[51] = 8'hcf;
      expv[52] = 8'h43;
      expv[53] = 8'hbf;
      expv[54] = 8'h09;
      expv[55] = 8'h3e;
      expv[56] = 8'h19;
      expv[57] = 8'ha4;
      expv[58] = 8'h82;
      expv[59] = 8'h20;
      expv[60] = 8'hb3;
      expv[61] = 8'hd2;
      expv[62] = 8'h96;
      expv[63] = 8'hd2;
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
