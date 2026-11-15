// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072451 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
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
    stim[0] = 12'heeb;
    stim[1] = 12'hdd8;
    stim[2] = 12'h54d;
    stim[3] = 12'h430;
    stim[4] = 12'h0be;
    stim[5] = 12'h2b0;
    stim[6] = 12'h3d4;
    stim[7] = 12'h610;
    stim[8] = 12'h183;
    stim[9] = 12'h17b;
    stim[10] = 12'h192;
    stim[11] = 12'h4fd;
    stim[12] = 12'h438;
    stim[13] = 12'h30a;
    stim[14] = 12'h9ef;
    stim[15] = 12'h204;
    stim[16] = 12'h3f2;
    stim[17] = 12'h086;
    stim[18] = 12'h51d;
    stim[19] = 12'h09d;
    stim[20] = 12'h3dc;
    stim[21] = 12'h651;
    stim[22] = 12'h4ea;
    stim[23] = 12'h2b0;
    stim[24] = 12'h490;
    stim[25] = 12'h3b9;
    stim[26] = 12'h587;
    stim[27] = 12'h0e2;
    stim[28] = 12'h3d1;
    stim[29] = 12'h0af;
    stim[30] = 12'h29f;
    stim[31] = 12'h027;
    stim[32] = 12'h5cd;
    stim[33] = 12'h733;
    stim[34] = 12'h337;
    stim[35] = 12'h7fe;
    stim[36] = 12'h23d;
    stim[37] = 12'h253;
    stim[38] = 12'h49b;
    stim[39] = 12'h2a4;
    stim[40] = 12'h7c3;
    stim[41] = 12'hbb8;
    stim[42] = 12'h155;
    stim[43] = 12'h183;
    stim[44] = 12'h3c0;
    stim[45] = 12'h2f6;
    stim[46] = 12'h1ce;
    stim[47] = 12'hb7c;
    stim[48] = 12'h1b5;
    stim[49] = 12'h52e;
    stim[50] = 12'h57b;
    stim[51] = 12'h178;
    stim[52] = 12'h5bd;
    stim[53] = 12'h258;
    stim[54] = 12'h679;
    stim[55] = 12'h1ae;
    stim[56] = 12'h7a6;
    stim[57] = 12'h4ce;
    stim[58] = 12'h251;
    stim[59] = 12'h2ec;
    stim[60] = 12'h03f;
    stim[61] = 12'h476;
    stim[62] = 12'h116;
    stim[63] = 12'h3a1;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1d8;
      expv[4] = 10'h34d;
      expv[5] = 10'h34d;
      expv[6] = 10'h34d;
      expv[7] = 10'h34d;
      expv[8] = 10'h14d;
      expv[9] = 10'h14d;
      expv[10] = 10'h14d;
      expv[11] = 10'h14d;
      expv[12] = 10'h14d;
      expv[13] = 10'h14d;
      expv[14] = 10'h14d;
      expv[15] = 10'h100;
      expv[16] = 10'h100;
      expv[17] = 10'h100;
      expv[18] = 10'h100;
      expv[19] = 10'h14d;
      expv[20] = 10'h14d;
      expv[21] = 10'h14d;
      expv[22] = 10'h31d;
      expv[23] = 10'h31d;
      expv[24] = 10'h31d;
      expv[25] = 10'h31d;
      expv[26] = 10'h31d;
      expv[27] = 10'h31d;
      expv[28] = 10'h31d;
      expv[29] = 10'h31d;
      expv[30] = 10'h31d;
      expv[31] = 10'h31d;
      expv[32] = 10'h31d;
      expv[33] = 10'h31d;
      expv[34] = 10'h387;
      expv[35] = 10'h387;
      expv[36] = 10'h3cd;
      expv[37] = 10'h3cd;
      expv[38] = 10'h3cd;
      expv[39] = 10'h3cd;
      expv[40] = 10'h3cd;
      expv[41] = 10'h333;
      expv[42] = 10'h100;
      expv[43] = 10'h100;
      expv[44] = 10'h100;
      expv[45] = 10'h100;
      expv[46] = 10'h100;
      expv[47] = 10'h100;
      expv[48] = 10'h100;
      expv[49] = 10'h100;
      expv[50] = 10'h1c3;
      expv[51] = 10'h32e;
      expv[52] = 10'h32e;
      expv[53] = 10'h32e;
      expv[54] = 10'h32e;
      expv[55] = 10'h37b;
      expv[56] = 10'h37b;
      expv[57] = 10'h3bd;
      expv[58] = 10'h3bd;
      expv[59] = 10'h3bd;
      expv[60] = 10'h3bd;
      expv[61] = 10'h3bd;
      expv[62] = 10'h3bd;
      expv[63] = 10'h3bd;
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
