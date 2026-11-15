// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03632 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .enable(in_vec[9:9]),
    .init(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .crc_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h630;
    stim[1] = 11'h654;
    stim[2] = 11'h285;
    stim[3] = 11'h070;
    stim[4] = 11'h3c6;
    stim[5] = 11'h224;
    stim[6] = 11'h3f4;
    stim[7] = 11'h0b8;
    stim[8] = 11'h2ad;
    stim[9] = 11'h0da;
    stim[10] = 11'h336;
    stim[11] = 11'h2d7;
    stim[12] = 11'h266;
    stim[13] = 11'h120;
    stim[14] = 11'h39b;
    stim[15] = 11'h1d4;
    stim[16] = 11'h1f8;
    stim[17] = 11'h1aa;
    stim[18] = 11'h095;
    stim[19] = 11'h0e4;
    stim[20] = 11'h0b4;
    stim[21] = 11'h2a4;
    stim[22] = 11'h398;
    stim[23] = 11'h225;
    stim[24] = 11'h0c3;
    stim[25] = 11'h1a8;
    stim[26] = 11'h30e;
    stim[27] = 11'h283;
    stim[28] = 11'h1d2;
    stim[29] = 11'h29a;
    stim[30] = 11'h25b;
    stim[31] = 11'h099;
    stim[32] = 11'h0fd;
    stim[33] = 11'h2cf;
    stim[34] = 11'h114;
    stim[35] = 11'h07c;
    stim[36] = 11'h0a3;
    stim[37] = 11'h048;
    stim[38] = 11'h3f7;
    stim[39] = 11'h1b8;
    stim[40] = 11'h3c5;
    stim[41] = 11'h088;
    stim[42] = 11'h0e1;
    stim[43] = 11'h3f1;
    stim[44] = 11'h322;
    stim[45] = 11'h0a5;
    stim[46] = 11'h0a1;
    stim[47] = 11'h187;
    stim[48] = 11'h3c6;
    stim[49] = 11'h0fc;
    stim[50] = 11'h184;
    stim[51] = 11'h228;
    stim[52] = 11'h1d5;
    stim[53] = 11'h239;
    stim[54] = 11'h2b9;
    stim[55] = 11'h159;
    stim[56] = 11'h378;
    stim[57] = 11'h15f;
    stim[58] = 11'h3e1;
    stim[59] = 11'h165;
    stim[60] = 11'h1cd;
    stim[61] = 11'h1bd;
    stim[62] = 11'h28e;
    stim[63] = 11'h14e;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hffff;
      expv[2] = 16'hffff;
      expv[3] = 16'hx03a;
      expv[4] = 16'hx03a;
      expv[5] = 16'hffff;
      expv[6] = 16'hx49a;
      expv[7] = 16'hffff;
      expv[8] = 16'hffff;
      expv[9] = 16'hx512;
      expv[10] = 16'hx512;
      expv[11] = 16'hffff;
      expv[12] = 16'hxa28;
      expv[13] = 16'hx065;
      expv[14] = 16'hx065;
      expv[15] = 16'hffff;
      expv[16] = 16'hffff;
      expv[17] = 16'hffff;
      expv[18] = 16'hffff;
      expv[19] = 16'hffff;
      expv[20] = 16'hffff;
      expv[21] = 16'hffff;
      expv[22] = 16'hx43b;
      expv[23] = 16'hffff;
      expv[24] = 16'hx4bb;
      expv[25] = 16'hx4bb;
      expv[26] = 16'hx4bb;
      expv[27] = 16'hffff;
      expv[28] = 16'hx0fc;
      expv[29] = 16'hx0fc;
      expv[30] = 16'hxe14;
      expv[31] = 16'hx3db;
      expv[32] = 16'hx3db;
      expv[33] = 16'hx3db;
      expv[34] = 16'hx593;
      expv[35] = 16'hx593;
      expv[36] = 16'hx593;
      expv[37] = 16'hx593;
      expv[38] = 16'hx593;
      expv[39] = 16'hffff;
      expv[40] = 16'hffff;
      expv[41] = 16'hffff;
      expv[42] = 16'hffff;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'hffff;
      expv[50] = 16'hffff;
      expv[51] = 16'hffff;
      expv[52] = 16'hx516;
      expv[53] = 16'hx516;
      expv[54] = 16'hxb68;
      expv[55] = 16'hx9ef;
      expv[56] = 16'hx9ef;
      expv[57] = 16'hffff;
      expv[58] = 16'hffff;
      expv[59] = 16'hffff;
      expv[60] = 16'hffff;
      expv[61] = 16'hffff;
      expv[62] = 16'hffff;
      expv[63] = 16'hx151;
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
