// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03892 dut (
    .clk(clk),
    .rst(in_vec[23:23]),
    .AD(in_vec[22:19]),
    .DI(in_vec[18:11]),
    .rw(in_vec[10:10]),
    .cs(in_vec[9:9]),
    .clk_in(in_vec[8:8]),
    .switches(in_vec[7:4]),
    .keys(in_vec[3:0]),
    .DO(out_vec[38:31]),
    .irq(out_vec[30:30]),
    .leds(out_vec[29:22]),
    .led7hi(out_vec[21:14]),
    .led7lo(out_vec[13:6]),
    .rgb1(out_vec[5:3]),
    .rgb2(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h99133f;
    stim[1] = 24'hcc4881;
    stim[2] = 24'h40f23b;
    stim[3] = 24'h2e8403;
    stim[4] = 24'h36f921;
    stim[5] = 24'h240068;
    stim[6] = 24'h028a82;
    stim[7] = 24'h378fde;
    stim[8] = 24'h6eb159;
    stim[9] = 24'h386ab1;
    stim[10] = 24'h5b3d32;
    stim[11] = 24'h4dc65d;
    stim[12] = 24'h03af85;
    stim[13] = 24'h06e1dd;
    stim[14] = 24'h522ddd;
    stim[15] = 24'h5720be;
    stim[16] = 24'h5f3661;
    stim[17] = 24'h67d33c;
    stim[18] = 24'h334e4e;
    stim[19] = 24'h747f88;
    stim[20] = 24'h3c720b;
    stim[21] = 24'h3d5f2d;
    stim[22] = 24'h0bcaa7;
    stim[23] = 24'h200b49;
    stim[24] = 24'h31a4cd;
    stim[25] = 24'h587e38;
    stim[26] = 24'h47f3f6;
    stim[27] = 24'h0f77a7;
    stim[28] = 24'hd5db09;
    stim[29] = 24'h4b84b0;
    stim[30] = 24'h62e383;
    stim[31] = 24'h7d17df;
    stim[32] = 24'h1bef70;
    stim[33] = 24'h3ecb8f;
    stim[34] = 24'h7488ba;
    stim[35] = 24'h16fb52;
    stim[36] = 24'h7c1c6f;
    stim[37] = 24'h500c6c;
    stim[38] = 24'h2f72d7;
    stim[39] = 24'h71c6cb;
    stim[40] = 24'h089eb9;
    stim[41] = 24'h678f90;
    stim[42] = 24'h0d6760;
    stim[43] = 24'h2a40ea;
    stim[44] = 24'h015696;
    stim[45] = 24'h71192d;
    stim[46] = 24'h440323;
    stim[47] = 24'h4fd9c4;
    stim[48] = 24'h5f7ca0;
    stim[49] = 24'h6ae034;
    stim[50] = 24'h5f85e0;
    stim[51] = 24'h43f980;
    stim[52] = 24'h01ddb8;
    stim[53] = 24'h09db73;
    stim[54] = 24'h663447;
    stim[55] = 24'h1b7beb;
    stim[56] = 24'h47f445;
    stim[57] = 24'h56461a;
    stim[58] = 24'h2730a8;
    stim[59] = 24'h5df402;
    stim[60] = 24'h505c5f;
    stim[61] = 24'h513bcd;
    stim[62] = 24'h1bb985;
    stim[63] = 24'h2eaf90;
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
      expv[0] = 39'hxxxxxxxxxx;
      expv[1] = 39'hxxxfc0003f;
      expv[2] = 39'hxxxfc0003f;
      expv[3] = 39'hxxxfc0003f;
      expv[4] = 39'hxxxfc0003f;
      expv[5] = 39'hxxxfc0003f;
      expv[6] = 39'hxxxfc0003f;
      expv[7] = 39'hxxxb80003f;
      expv[8] = 39'hxxxb80003f;
      expv[9] = 39'hxxxb80003f;
      expv[10] = 39'hxxxb80003f;
      expv[11] = 39'hxxxb80003f;
      expv[12] = 39'h002b80003f;
      expv[13] = 39'h28ab80003f;
      expv[14] = 39'h28ab80003f;
      expv[15] = 39'h28ab80003f;
      expv[16] = 39'h28ab80003f;
      expv[17] = 39'h002b80003f;
      expv[18] = 39'h002b80003f;
      expv[19] = 39'h002b80003f;
      expv[20] = 39'h002b80003f;
      expv[21] = 39'h002b80003f;
      expv[22] = 39'h002b80003f;
      expv[23] = 39'h002b9e403f;
      expv[24] = 39'h002b9e403f;
      expv[25] = 39'h002b9e403f;
      expv[26] = 39'h002b9e403f;
      expv[27] = 39'h002b9e403f;
      expv[28] = 39'h3cab9e403f;
      expv[29] = 39'h3cbfc0003f;
      expv[30] = 39'h3cbfc0003f;
      expv[31] = 39'h3cbfc0003f;
      expv[32] = 39'h3cbfc0003f;
      expv[33] = 39'h043fc0003f;
      expv[34] = 39'h043fc0003f;
      expv[35] = 39'h043fc0003f;
      expv[36] = 39'h043fc037ff;
      expv[37] = 39'h043fc037ff;
      expv[38] = 39'h043fc037ff;
      expv[39] = 39'h043fc037ff;
      expv[40] = 39'h043fc037ff;
      expv[41] = 39'h003fc037ff;
      expv[42] = 39'h003fc037ff;
      expv[43] = 39'h003fc037ff;
      expv[44] = 39'h003fc037ff;
      expv[45] = 39'h003fc037ff;
      expv[46] = 39'h003fc037ff;
      expv[47] = 39'h003fc037ff;
      expv[48] = 39'h003fc037ff;
      expv[49] = 39'h003fc037ff;
      expv[50] = 39'h003fc037ff;
      expv[51] = 39'h003fc037ff;
      expv[52] = 39'h003fc037ff;
      expv[53] = 39'h003fc037ff;
      expv[54] = 39'h003fcef7ff;
      expv[55] = 39'h003fcef7ff;
      expv[56] = 39'h003fcef7c8;
      expv[57] = 39'h003fcef7c8;
      expv[58] = 39'h003fcef7c8;
      expv[59] = 39'h003fcef7c8;
      expv[60] = 39'h003fcef7c8;
      expv[61] = 39'h003fcef7c8;
      expv[62] = 39'h003fcef7c8;
      expv[63] = 39'h003fcef7c8;
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
