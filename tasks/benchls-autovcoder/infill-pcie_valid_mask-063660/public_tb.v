// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063660 dut (
    .valid_pd(in_vec[9:9]),
    .gen(in_vec[8:6]),
    .linkup(in_vec[5:5]),
    .numberOfDetectedLanes(in_vec[4:0]),
    .sel(out_vec[65:65]),
    .valid(out_vec[64:1]),
    .w(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h287;
    stim[1] = 10'h36f;
    stim[2] = 10'h0e1;
    stim[3] = 10'h18e;
    stim[4] = 10'h207;
    stim[5] = 10'h2de;
    stim[6] = 10'h1f5;
    stim[7] = 10'h26e;
    stim[8] = 10'h30a;
    stim[9] = 10'h171;
    stim[10] = 10'h00e;
    stim[11] = 10'h1db;
    stim[12] = 10'h2a6;
    stim[13] = 10'h3c4;
    stim[14] = 10'h115;
    stim[15] = 10'h084;
    stim[16] = 10'h2d1;
    stim[17] = 10'h3a1;
    stim[18] = 10'h379;
    stim[19] = 10'h342;
    stim[20] = 10'h2a0;
    stim[21] = 10'h22a;
    stim[22] = 10'h048;
    stim[23] = 10'h08f;
    stim[24] = 10'h14e;
    stim[25] = 10'h14c;
    stim[26] = 10'h1a2;
    stim[27] = 10'h1dc;
    stim[28] = 10'h350;
    stim[29] = 10'h181;
    stim[30] = 10'h287;
    stim[31] = 10'h07c;
    stim[32] = 10'h368;
    stim[33] = 10'h081;
    stim[34] = 10'h1e9;
    stim[35] = 10'h205;
    stim[36] = 10'h20e;
    stim[37] = 10'h051;
    stim[38] = 10'h3b9;
    stim[39] = 10'h2a6;
    stim[40] = 10'h247;
    stim[41] = 10'h38d;
    stim[42] = 10'h362;
    stim[43] = 10'h0e3;
    stim[44] = 10'h1f1;
    stim[45] = 10'h35f;
    stim[46] = 10'h2aa;
    stim[47] = 10'h113;
    stim[48] = 10'h3c5;
    stim[49] = 10'h3da;
    stim[50] = 10'h0ed;
    stim[51] = 10'h10f;
    stim[52] = 10'h3cd;
    stim[53] = 10'h29b;
    stim[54] = 10'h24e;
    stim[55] = 10'h0db;
    stim[56] = 10'h15a;
    stim[57] = 10'h0c8;
    stim[58] = 10'h3f4;
    stim[59] = 10'h055;
    stim[60] = 10'h190;
    stim[61] = 10'h233;
    stim[62] = 10'h376;
    stim[63] = 10'h22f;
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
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h2000000000001ffff;
      expv[2] = 66'h2000000000000001e;
      expv[3] = 66'h20000000000000000;
      expv[4] = 66'h20000000000000000;
      expv[5] = 66'h20000000000000000;
      expv[6] = 66'h20000000000000000;
      expv[7] = 66'h0000000000001ffff;
      expv[8] = 66'h20000000000000000;
      expv[9] = 66'h2000000000001fffe;
      expv[10] = 66'h20000000000000000;
      expv[11] = 66'h20000000000000000;
      expv[12] = 66'h000000001ffffffff;
      expv[13] = 66'h20000000000000000;
      expv[14] = 66'h20000000000000000;
      expv[15] = 66'h00000000000000000;
      expv[16] = 66'h20000000000000000;
      expv[17] = 66'h20000000000000001;
      expv[18] = 66'h2000000000001ffff;
      expv[19] = 66'h20000000000000000;
      expv[20] = 66'h000000001ffffffff;
      expv[21] = 66'h20000000000000001;
      expv[22] = 66'h00000000000000000;
      expv[23] = 66'h00000000000000000;
      expv[24] = 66'h20000000000000000;
      expv[25] = 66'h20000000000000000;
      expv[26] = 66'h20000000000000000;
      expv[27] = 66'h20000000000000000;
      expv[28] = 66'h20000000000000000;
      expv[29] = 66'h20000000000000000;
      expv[30] = 66'h00000000000000000;
      expv[31] = 66'h0000000000001fffe;
      expv[32] = 66'h200000000000001ff;
      expv[33] = 66'h00000000000000000;
      expv[34] = 66'h20000000000000000;
      expv[35] = 66'h20000000000000000;
      expv[36] = 66'h20000000000000000;
      expv[37] = 66'h00000000000000000;
      expv[38] = 66'h20000000000000001;
      expv[39] = 66'h000000001ffffffff;
      expv[40] = 66'h00000000000000000;
      expv[41] = 66'h20000000000000000;
      expv[42] = 66'h20000000000000007;
      expv[43] = 66'h3fffffffffffffffe;
      expv[44] = 66'h20000000000000000;
      expv[45] = 66'h20000000000000000;
      expv[46] = 66'h000000001ffffffff;
      expv[47] = 66'h20000000000000000;
      expv[48] = 66'h20000000000000000;
      expv[49] = 66'h20000000000000000;
      expv[50] = 66'h3fffffffffffffffe;
      expv[51] = 66'h20000000000000000;
      expv[52] = 66'h20000000000000000;
      expv[53] = 66'h00000000000000000;
      expv[54] = 66'h00000000000000000;
      expv[55] = 66'h20000000000000000;
      expv[56] = 66'h20000000000000000;
      expv[57] = 66'h20000000000000000;
      expv[58] = 66'h20000000000000001;
      expv[59] = 66'h00000000000000000;
      expv[60] = 66'h20000000000000000;
      expv[61] = 66'h20000000000000001;
      expv[62] = 66'h2000000000001ffff;
      expv[63] = 66'h20000000000000001;
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
