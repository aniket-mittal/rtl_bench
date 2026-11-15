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

  autovcoder_071801 dut (
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
    stim[0] = 12'h8be;
    stim[1] = 12'h870;
    stim[2] = 12'h6ca;
    stim[3] = 12'h624;
    stim[4] = 12'h5b3;
    stim[5] = 12'h42e;
    stim[6] = 12'h241;
    stim[7] = 12'h04a;
    stim[8] = 12'h5f4;
    stim[9] = 12'h28a;
    stim[10] = 12'h55d;
    stim[11] = 12'h23f;
    stim[12] = 12'h6bb;
    stim[13] = 12'h79d;
    stim[14] = 12'h473;
    stim[15] = 12'h282;
    stim[16] = 12'h087;
    stim[17] = 12'h7ea;
    stim[18] = 12'h195;
    stim[19] = 12'h381;
    stim[20] = 12'h06e;
    stim[21] = 12'h39c;
    stim[22] = 12'h0a3;
    stim[23] = 12'h383;
    stim[24] = 12'h03f;
    stim[25] = 12'h490;
    stim[26] = 12'h33c;
    stim[27] = 12'h517;
    stim[28] = 12'h32a;
    stim[29] = 12'h1a3;
    stim[30] = 12'h37d;
    stim[31] = 12'h714;
    stim[32] = 12'h07c;
    stim[33] = 12'h10e;
    stim[34] = 12'h31e;
    stim[35] = 12'h010;
    stim[36] = 12'h43a;
    stim[37] = 12'h3f3;
    stim[38] = 12'h141;
    stim[39] = 12'h790;
    stim[40] = 12'h00d;
    stim[41] = 12'h577;
    stim[42] = 12'h6be;
    stim[43] = 12'h298;
    stim[44] = 12'h6ce;
    stim[45] = 12'h319;
    stim[46] = 12'h187;
    stim[47] = 12'h67d;
    stim[48] = 12'h239;
    stim[49] = 12'h5b1;
    stim[50] = 12'h247;
    stim[51] = 12'h236;
    stim[52] = 12'h5a1;
    stim[53] = 12'h175;
    stim[54] = 12'h43c;
    stim[55] = 12'h2e3;
    stim[56] = 12'h3df;
    stim[57] = 12'h008;
    stim[58] = 12'h753;
    stim[59] = 12'h3a1;
    stim[60] = 12'h1ed;
    stim[61] = 12'h454;
    stim[62] = 12'h33b;
    stim[63] = 12'h22c;
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
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h3b3;
      expv[7] = 10'h3b3;
      expv[8] = 10'h3b3;
      expv[9] = 10'h3b3;
      expv[10] = 10'h3b3;
      expv[11] = 10'h3b3;
      expv[12] = 10'h3b3;
      expv[13] = 10'h3f4;
      expv[14] = 10'h35d;
      expv[15] = 10'h35d;
      expv[16] = 10'h35d;
      expv[17] = 10'h35d;
      expv[18] = 10'h39d;
      expv[19] = 10'h39d;
      expv[20] = 10'h39d;
      expv[21] = 10'h39d;
      expv[22] = 10'h39d;
      expv[23] = 10'h39d;
      expv[24] = 10'h39d;
      expv[25] = 10'h39d;
      expv[26] = 10'h39d;
      expv[27] = 10'h39d;
      expv[28] = 10'h39d;
      expv[29] = 10'h39d;
      expv[30] = 10'h39d;
      expv[31] = 10'h39d;
      expv[32] = 10'h3ea;
      expv[33] = 10'h3ea;
      expv[34] = 10'h3ea;
      expv[35] = 10'h3ea;
      expv[36] = 10'h3ea;
      expv[37] = 10'h3ea;
      expv[38] = 10'h3ea;
      expv[39] = 10'h3ea;
      expv[40] = 10'h317;
      expv[41] = 10'h317;
      expv[42] = 10'h317;
      expv[43] = 10'h314;
      expv[44] = 10'h314;
      expv[45] = 10'h390;
      expv[46] = 10'h390;
      expv[47] = 10'h390;
      expv[48] = 10'h377;
      expv[49] = 10'h377;
      expv[50] = 10'h377;
      expv[51] = 10'h377;
      expv[52] = 10'h377;
      expv[53] = 10'h377;
      expv[54] = 10'h377;
      expv[55] = 10'h377;
      expv[56] = 10'h377;
      expv[57] = 10'h377;
      expv[58] = 10'h377;
      expv[59] = 10'h3b1;
      expv[60] = 10'h3b1;
      expv[61] = 10'h3b1;
      expv[62] = 10'h3b1;
      expv[63] = 10'h3b1;
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
