// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08261 dut (
    .clk(clk),
    .sclkPosEdge(in_vec[10:10]),
    .instr(in_vec[9:0]),
    .cs(out_vec[10:10]),
    .dc(out_vec[9:9]),
    .delayEn(out_vec[8:8]),
    .parallelData(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1b2;
    stim[1] = 11'h524;
    stim[2] = 11'h27d;
    stim[3] = 11'h6b1;
    stim[4] = 11'h22f;
    stim[5] = 11'h304;
    stim[6] = 11'h141;
    stim[7] = 11'h4bb;
    stim[8] = 11'h33f;
    stim[9] = 11'h405;
    stim[10] = 11'h0dc;
    stim[11] = 11'h21b;
    stim[12] = 11'h551;
    stim[13] = 11'h4bf;
    stim[14] = 11'h51b;
    stim[15] = 11'h20a;
    stim[16] = 11'h43c;
    stim[17] = 11'h6d6;
    stim[18] = 11'h66f;
    stim[19] = 11'h4f1;
    stim[20] = 11'h367;
    stim[21] = 11'h23b;
    stim[22] = 11'h540;
    stim[23] = 11'h124;
    stim[24] = 11'h145;
    stim[25] = 11'h6ea;
    stim[26] = 11'h18c;
    stim[27] = 11'h64f;
    stim[28] = 11'h21e;
    stim[29] = 11'h11f;
    stim[30] = 11'h3dd;
    stim[31] = 11'h60c;
    stim[32] = 11'h102;
    stim[33] = 11'h41a;
    stim[34] = 11'h773;
    stim[35] = 11'h4d7;
    stim[36] = 11'h21d;
    stim[37] = 11'h374;
    stim[38] = 11'h568;
    stim[39] = 11'h1a9;
    stim[40] = 11'h355;
    stim[41] = 11'h243;
    stim[42] = 11'h4e8;
    stim[43] = 11'h23c;
    stim[44] = 11'h163;
    stim[45] = 11'h1e5;
    stim[46] = 11'h785;
    stim[47] = 11'h271;
    stim[48] = 11'h2f3;
    stim[49] = 11'h53a;
    stim[50] = 11'h43d;
    stim[51] = 11'h5fc;
    stim[52] = 11'h47f;
    stim[53] = 11'h426;
    stim[54] = 11'h421;
    stim[55] = 11'h2d7;
    stim[56] = 11'h760;
    stim[57] = 11'h49c;
    stim[58] = 11'h589;
    stim[59] = 11'h362;
    stim[60] = 11'h080;
    stim[61] = 11'h42d;
    stim[62] = 11'h778;
    stim[63] = 11'h012;
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
      expv[0] = 11'h0b2;
      expv[1] = 11'h024;
      expv[2] = 11'h57d;
      expv[3] = 11'h5b1;
      expv[4] = 11'h52f;
      expv[5] = 11'h504;
      expv[6] = 11'h041;
      expv[7] = 11'h2bb;
      expv[8] = 11'h23f;
      expv[9] = 11'h205;
      expv[10] = 11'h2dc;
      expv[11] = 11'h71b;
      expv[12] = 11'h051;
      expv[13] = 11'h2bf;
      expv[14] = 11'h01b;
      expv[15] = 11'h50a;
      expv[16] = 11'h23c;
      expv[17] = 11'h7d6;
      expv[18] = 11'h76f;
      expv[19] = 11'h2f1;
      expv[20] = 11'h267;
      expv[21] = 11'h73b;
      expv[22] = 11'h040;
      expv[23] = 11'h024;
      expv[24] = 11'h045;
      expv[25] = 11'h5ea;
      expv[26] = 11'h08c;
      expv[27] = 11'h54f;
      expv[28] = 11'h51e;
      expv[29] = 11'h01f;
      expv[30] = 11'h0dd;
      expv[31] = 11'h50c;
      expv[32] = 11'h002;
      expv[33] = 11'h21a;
      expv[34] = 11'h273;
      expv[35] = 11'h2d7;
      expv[36] = 11'h71d;
      expv[37] = 11'h774;
      expv[38] = 11'h068;
      expv[39] = 11'h0a9;
      expv[40] = 11'h055;
      expv[41] = 11'h543;
      expv[42] = 11'h2e8;
      expv[43] = 11'h73c;
      expv[44] = 11'h063;
      expv[45] = 11'h0e5;
      expv[46] = 11'h085;
      expv[47] = 11'h571;
      expv[48] = 11'h5f3;
      expv[49] = 11'h03a;
      expv[50] = 11'h23d;
      expv[51] = 11'h0fc;
      expv[52] = 11'h27f;
      expv[53] = 11'h226;
      expv[54] = 11'h221;
      expv[55] = 11'h7d7;
      expv[56] = 11'h760;
      expv[57] = 11'h29c;
      expv[58] = 11'h089;
      expv[59] = 11'h062;
      expv[60] = 11'h280;
      expv[61] = 11'h22d;
      expv[62] = 11'h278;
      expv[63] = 11'h212;
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
