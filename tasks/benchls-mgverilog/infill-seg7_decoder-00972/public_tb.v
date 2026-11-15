// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00972 dut (
    .digit(in_vec[3:0]),
    .real_segments(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h4;
    stim[1] = 4'h8;
    stim[2] = 4'h7;
    stim[3] = 4'h9;
    stim[4] = 4'h1;
    stim[5] = 4'hb;
    stim[6] = 4'h6;
    stim[7] = 4'h3;
    stim[8] = 4'h4;
    stim[9] = 4'h9;
    stim[10] = 4'hb;
    stim[11] = 4'hc;
    stim[12] = 4'h2;
    stim[13] = 4'hd;
    stim[14] = 4'h2;
    stim[15] = 4'h6;
    stim[16] = 4'h0;
    stim[17] = 4'h9;
    stim[18] = 4'hc;
    stim[19] = 4'h0;
    stim[20] = 4'h6;
    stim[21] = 4'hb;
    stim[22] = 4'he;
    stim[23] = 4'h9;
    stim[24] = 4'h7;
    stim[25] = 4'h5;
    stim[26] = 4'h0;
    stim[27] = 4'hf;
    stim[28] = 4'hc;
    stim[29] = 4'he;
    stim[30] = 4'ha;
    stim[31] = 4'he;
    stim[32] = 4'h2;
    stim[33] = 4'he;
    stim[34] = 4'h6;
    stim[35] = 4'h3;
    stim[36] = 4'hf;
    stim[37] = 4'h5;
    stim[38] = 4'h6;
    stim[39] = 4'hf;
    stim[40] = 4'h0;
    stim[41] = 4'h1;
    stim[42] = 4'h6;
    stim[43] = 4'h3;
    stim[44] = 4'h6;
    stim[45] = 4'hf;
    stim[46] = 4'hd;
    stim[47] = 4'h5;
    stim[48] = 4'h4;
    stim[49] = 4'h8;
    stim[50] = 4'hd;
    stim[51] = 4'hc;
    stim[52] = 4'h3;
    stim[53] = 4'hc;
    stim[54] = 4'hb;
    stim[55] = 4'hf;
    stim[56] = 4'hc;
    stim[57] = 4'h7;
    stim[58] = 4'h1;
    stim[59] = 4'h0;
    stim[60] = 4'h1;
    stim[61] = 4'h5;
    stim[62] = 4'h4;
    stim[63] = 4'h2;
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
      expv[0] = 8'h99;
      expv[1] = 8'h01;
      expv[2] = 8'h1f;
      expv[3] = 8'h09;
      expv[4] = 8'h9f;
      expv[5] = 8'hc1;
      expv[6] = 8'h41;
      expv[7] = 8'h0d;
      expv[8] = 8'h99;
      expv[9] = 8'h09;
      expv[10] = 8'hc1;
      expv[11] = 8'h63;
      expv[12] = 8'h25;
      expv[13] = 8'h85;
      expv[14] = 8'h25;
      expv[15] = 8'h41;
      expv[16] = 8'h03;
      expv[17] = 8'h09;
      expv[18] = 8'h63;
      expv[19] = 8'h03;
      expv[20] = 8'h41;
      expv[21] = 8'hc1;
      expv[22] = 8'h61;
      expv[23] = 8'h09;
      expv[24] = 8'h1f;
      expv[25] = 8'h49;
      expv[26] = 8'h03;
      expv[27] = 8'h71;
      expv[28] = 8'h63;
      expv[29] = 8'h61;
      expv[30] = 8'h11;
      expv[31] = 8'h61;
      expv[32] = 8'h25;
      expv[33] = 8'h61;
      expv[34] = 8'h41;
      expv[35] = 8'h0d;
      expv[36] = 8'h71;
      expv[37] = 8'h49;
      expv[38] = 8'h41;
      expv[39] = 8'h71;
      expv[40] = 8'h03;
      expv[41] = 8'h9f;
      expv[42] = 8'h41;
      expv[43] = 8'h0d;
      expv[44] = 8'h41;
      expv[45] = 8'h71;
      expv[46] = 8'h85;
      expv[47] = 8'h49;
      expv[48] = 8'h99;
      expv[49] = 8'h01;
      expv[50] = 8'h85;
      expv[51] = 8'h63;
      expv[52] = 8'h0d;
      expv[53] = 8'h63;
      expv[54] = 8'hc1;
      expv[55] = 8'h71;
      expv[56] = 8'h63;
      expv[57] = 8'h1f;
      expv[58] = 8'h9f;
      expv[59] = 8'h03;
      expv[60] = 8'h9f;
      expv[61] = 8'h49;
      expv[62] = 8'h99;
      expv[63] = 8'h25;
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
