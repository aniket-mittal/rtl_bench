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

  autovcoder_071626 dut (
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
    stim[0] = 12'h951;
    stim[1] = 12'hfe7;
    stim[2] = 12'h244;
    stim[3] = 12'h4dd;
    stim[4] = 12'h49c;
    stim[5] = 12'h44f;
    stim[6] = 12'h49a;
    stim[7] = 12'h240;
    stim[8] = 12'h35b;
    stim[9] = 12'h2a7;
    stim[10] = 12'h648;
    stim[11] = 12'h0a0;
    stim[12] = 12'h5d8;
    stim[13] = 12'h1f4;
    stim[14] = 12'h75e;
    stim[15] = 12'h6e4;
    stim[16] = 12'h68b;
    stim[17] = 12'h60a;
    stim[18] = 12'h784;
    stim[19] = 12'h3ff;
    stim[20] = 12'h74b;
    stim[21] = 12'h580;
    stim[22] = 12'h1d9;
    stim[23] = 12'h4eb;
    stim[24] = 12'h15d;
    stim[25] = 12'h432;
    stim[26] = 12'h346;
    stim[27] = 12'h4b0;
    stim[28] = 12'h670;
    stim[29] = 12'h345;
    stim[30] = 12'h7ab;
    stim[31] = 12'h190;
    stim[32] = 12'h1a4;
    stim[33] = 12'h627;
    stim[34] = 12'h4e7;
    stim[35] = 12'h257;
    stim[36] = 12'h57b;
    stim[37] = 12'h9bd;
    stim[38] = 12'h540;
    stim[39] = 12'h68d;
    stim[40] = 12'h59d;
    stim[41] = 12'h35f;
    stim[42] = 12'h1aa;
    stim[43] = 12'h395;
    stim[44] = 12'h291;
    stim[45] = 12'h3c3;
    stim[46] = 12'h643;
    stim[47] = 12'h4cb;
    stim[48] = 12'h5d1;
    stim[49] = 12'h616;
    stim[50] = 12'h1a4;
    stim[51] = 12'h55b;
    stim[52] = 12'h66d;
    stim[53] = 12'h246;
    stim[54] = 12'h6d5;
    stim[55] = 12'h56a;
    stim[56] = 12'h04b;
    stim[57] = 12'h10c;
    stim[58] = 12'h48b;
    stim[59] = 12'h032;
    stim[60] = 12'h7c8;
    stim[61] = 12'h2d1;
    stim[62] = 12'h5d4;
    stim[63] = 12'h4b9;
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
      expv[3] = 10'h100;
      expv[4] = 10'h1e7;
      expv[5] = 10'h1e7;
      expv[6] = 10'h1e7;
      expv[7] = 10'h1e7;
      expv[8] = 10'h1e7;
      expv[9] = 10'h1e7;
      expv[10] = 10'h1e7;
      expv[11] = 10'h1e7;
      expv[12] = 10'h1e7;
      expv[13] = 10'h1e7;
      expv[14] = 10'h1e7;
      expv[15] = 10'h3d8;
      expv[16] = 10'h35e;
      expv[17] = 10'h15e;
      expv[18] = 10'h15e;
      expv[19] = 10'h15e;
      expv[20] = 10'h15e;
      expv[21] = 10'h384;
      expv[22] = 10'h384;
      expv[23] = 10'h384;
      expv[24] = 10'h384;
      expv[25] = 10'h384;
      expv[26] = 10'h384;
      expv[27] = 10'h384;
      expv[28] = 10'h384;
      expv[29] = 10'h34b;
      expv[30] = 10'h34b;
      expv[31] = 10'h380;
      expv[32] = 10'h380;
      expv[33] = 10'h380;
      expv[34] = 10'h3ab;
      expv[35] = 10'h3ab;
      expv[36] = 10'h3ab;
      expv[37] = 10'h3ab;
      expv[38] = 10'h100;
      expv[39] = 10'h17b;
      expv[40] = 10'h340;
      expv[41] = 10'h340;
      expv[42] = 10'h340;
      expv[43] = 10'h340;
      expv[44] = 10'h340;
      expv[45] = 10'h340;
      expv[46] = 10'h340;
      expv[47] = 10'h39d;
      expv[48] = 10'h39d;
      expv[49] = 10'h39d;
      expv[50] = 10'h3d1;
      expv[51] = 10'h3d1;
      expv[52] = 10'h3d1;
      expv[53] = 10'h35b;
      expv[54] = 10'h35b;
      expv[55] = 10'h15b;
      expv[56] = 10'h15b;
      expv[57] = 10'h15b;
      expv[58] = 10'h15b;
      expv[59] = 10'h36a;
      expv[60] = 10'h36a;
      expv[61] = 10'h16a;
      expv[62] = 10'h16a;
      expv[63] = 10'h3c8;
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
