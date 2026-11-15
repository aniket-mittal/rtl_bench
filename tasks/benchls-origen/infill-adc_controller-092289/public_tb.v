// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092289 dut (
    .clk8m(clk),
    .rst_n(in_vec[9:9]),
    .EOC(in_vec[8:8]),
    .DATA(in_vec[7:0]),
    .START(out_vec[10:10]),
    .OE(out_vec[9:9]),
    .DATA_R(out_vec[8:1]),
    .clk500K(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0c7;
    stim[1] = 10'h078;
    stim[2] = 10'h25f;
    stim[3] = 10'h2f1;
    stim[4] = 10'h3df;
    stim[5] = 10'h281;
    stim[6] = 10'h38a;
    stim[7] = 10'h37b;
    stim[8] = 10'h27a;
    stim[9] = 10'h3d9;
    stim[10] = 10'h3b6;
    stim[11] = 10'h2f1;
    stim[12] = 10'h296;
    stim[13] = 10'h315;
    stim[14] = 10'h249;
    stim[15] = 10'h285;
    stim[16] = 10'h293;
    stim[17] = 10'h2ac;
    stim[18] = 10'h2c3;
    stim[19] = 10'h2a0;
    stim[20] = 10'h384;
    stim[21] = 10'h3ad;
    stim[22] = 10'h3fc;
    stim[23] = 10'h362;
    stim[24] = 10'h28c;
    stim[25] = 10'h374;
    stim[26] = 10'h2d6;
    stim[27] = 10'h3ee;
    stim[28] = 10'h2b9;
    stim[29] = 10'h2c8;
    stim[30] = 10'h277;
    stim[31] = 10'h28c;
    stim[32] = 10'h3e9;
    stim[33] = 10'h3e4;
    stim[34] = 10'h29b;
    stim[35] = 10'h211;
    stim[36] = 10'h10b;
    stim[37] = 10'h38d;
    stim[38] = 10'h383;
    stim[39] = 10'h21a;
    stim[40] = 10'h39d;
    stim[41] = 10'h30b;
    stim[42] = 10'h3d7;
    stim[43] = 10'h23d;
    stim[44] = 10'h32b;
    stim[45] = 10'h2b1;
    stim[46] = 10'h364;
    stim[47] = 10'h35d;
    stim[48] = 10'h2c9;
    stim[49] = 10'h341;
    stim[50] = 10'h213;
    stim[51] = 10'h374;
    stim[52] = 10'h34c;
    stim[53] = 10'h36d;
    stim[54] = 10'h3a5;
    stim[55] = 10'h291;
    stim[56] = 10'h30f;
    stim[57] = 10'h38a;
    stim[58] = 10'h248;
    stim[59] = 10'h20a;
    stim[60] = 10'h337;
    stim[61] = 10'h3c8;
    stim[62] = 10'h365;
    stim[63] = 10'h3d3;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h001;
      expv[11] = 11'h001;
      expv[12] = 11'h001;
      expv[13] = 11'h001;
      expv[14] = 11'h001;
      expv[15] = 11'h001;
      expv[16] = 11'h001;
      expv[17] = 11'h001;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h401;
      expv[27] = 11'h401;
      expv[28] = 11'h401;
      expv[29] = 11'h401;
      expv[30] = 11'h401;
      expv[31] = 11'h401;
      expv[32] = 11'h401;
      expv[33] = 11'h401;
      expv[34] = 11'h400;
      expv[35] = 11'h400;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h001;
      expv[46] = 11'h001;
      expv[47] = 11'h001;
      expv[48] = 11'h001;
      expv[49] = 11'h001;
      expv[50] = 11'h001;
      expv[51] = 11'h001;
      expv[52] = 11'h001;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h401;
      expv[62] = 11'h401;
      expv[63] = 11'h401;
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
