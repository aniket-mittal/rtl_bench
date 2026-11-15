// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_173172 dut (
    .clock(clk),
    .a(in_vec[9:6]),
    .b(in_vec[5:2]),
    ._reset(in_vec[1:1]),
    ._dav(in_vec[0:0]),
    .p(out_vec[6:1]),
    .rfd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1ca;
    stim[1] = 10'h2ff;
    stim[2] = 10'h323;
    stim[3] = 10'h219;
    stim[4] = 10'h24d;
    stim[5] = 10'h2a8;
    stim[6] = 10'h364;
    stim[7] = 10'h349;
    stim[8] = 10'h3b9;
    stim[9] = 10'h1c8;
    stim[10] = 10'h158;
    stim[11] = 10'h28d;
    stim[12] = 10'h2b4;
    stim[13] = 10'h04c;
    stim[14] = 10'h084;
    stim[15] = 10'h1a4;
    stim[16] = 10'h25d;
    stim[17] = 10'h310;
    stim[18] = 10'h018;
    stim[19] = 10'h041;
    stim[20] = 10'h001;
    stim[21] = 10'h394;
    stim[22] = 10'h194;
    stim[23] = 10'h008;
    stim[24] = 10'h13c;
    stim[25] = 10'h0b0;
    stim[26] = 10'h2ac;
    stim[27] = 10'h150;
    stim[28] = 10'h13d;
    stim[29] = 10'h089;
    stim[30] = 10'h319;
    stim[31] = 10'h2b4;
    stim[32] = 10'h335;
    stim[33] = 10'h3e3;
    stim[34] = 10'h0e8;
    stim[35] = 10'h324;
    stim[36] = 10'h315;
    stim[37] = 10'h365;
    stim[38] = 10'h00c;
    stim[39] = 10'h08d;
    stim[40] = 10'h194;
    stim[41] = 10'h161;
    stim[42] = 10'h399;
    stim[43] = 10'h15d;
    stim[44] = 10'h0dd;
    stim[45] = 10'h3b5;
    stim[46] = 10'h348;
    stim[47] = 10'h13c;
    stim[48] = 10'h360;
    stim[49] = 10'h105;
    stim[50] = 10'h300;
    stim[51] = 10'h0ed;
    stim[52] = 10'h15c;
    stim[53] = 10'h354;
    stim[54] = 10'h17d;
    stim[55] = 10'h3ad;
    stim[56] = 10'h350;
    stim[57] = 10'h37d;
    stim[58] = 10'h19c;
    stim[59] = 10'h0c1;
    stim[60] = 10'h018;
    stim[61] = 10'h284;
    stim[62] = 10'h0d1;
    stim[63] = 10'h190;
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
      expv[0] = 7'h01;
      expv[1] = 7'h01;
      expv[2] = 7'h01;
      expv[3] = 7'h01;
      expv[4] = 7'h01;
      expv[5] = 7'h01;
      expv[6] = 7'h01;
      expv[7] = 7'h01;
      expv[8] = 7'h01;
      expv[9] = 7'h01;
      expv[10] = 7'h01;
      expv[11] = 7'h01;
      expv[12] = 7'h01;
      expv[13] = 7'h01;
      expv[14] = 7'h01;
      expv[15] = 7'h01;
      expv[16] = 7'h01;
      expv[17] = 7'h01;
      expv[18] = 7'h01;
      expv[19] = 7'h01;
      expv[20] = 7'h01;
      expv[21] = 7'h01;
      expv[22] = 7'h01;
      expv[23] = 7'h01;
      expv[24] = 7'h01;
      expv[25] = 7'h01;
      expv[26] = 7'h01;
      expv[27] = 7'h01;
      expv[28] = 7'h01;
      expv[29] = 7'h01;
      expv[30] = 7'h01;
      expv[31] = 7'h01;
      expv[32] = 7'h01;
      expv[33] = 7'h01;
      expv[34] = 7'h01;
      expv[35] = 7'h01;
      expv[36] = 7'h01;
      expv[37] = 7'h01;
      expv[38] = 7'h01;
      expv[39] = 7'h01;
      expv[40] = 7'h01;
      expv[41] = 7'h01;
      expv[42] = 7'h01;
      expv[43] = 7'h01;
      expv[44] = 7'h01;
      expv[45] = 7'h01;
      expv[46] = 7'h01;
      expv[47] = 7'h01;
      expv[48] = 7'h01;
      expv[49] = 7'h01;
      expv[50] = 7'h01;
      expv[51] = 7'h01;
      expv[52] = 7'h01;
      expv[53] = 7'h01;
      expv[54] = 7'h01;
      expv[55] = 7'h01;
      expv[56] = 7'h01;
      expv[57] = 7'h01;
      expv[58] = 7'h01;
      expv[59] = 7'h01;
      expv[60] = 7'h01;
      expv[61] = 7'h01;
      expv[62] = 7'h01;
      expv[63] = 7'h01;
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
