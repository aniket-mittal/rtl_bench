// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213869 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .start(in_vec[10:10]),
    .data(in_vec[9:0]),
    .en(out_vec[22:22]),
    .flag(out_vec[21:21]),
    .fin(out_vec[20:20]),
    .addr(out_vec[19:10]),
    .result(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hffd;
    stim[1] = 12'hdaf;
    stim[2] = 12'h187;
    stim[3] = 12'hd15;
    stim[4] = 12'h0c5;
    stim[5] = 12'h131;
    stim[6] = 12'h439;
    stim[7] = 12'h31a;
    stim[8] = 12'h4c4;
    stim[9] = 12'h0c1;
    stim[10] = 12'h727;
    stim[11] = 12'h04a;
    stim[12] = 12'h4a6;
    stim[13] = 12'h2be;
    stim[14] = 12'h08d;
    stim[15] = 12'h362;
    stim[16] = 12'h5df;
    stim[17] = 12'h4b8;
    stim[18] = 12'h319;
    stim[19] = 12'h203;
    stim[20] = 12'h4ac;
    stim[21] = 12'h79a;
    stim[22] = 12'h12e;
    stim[23] = 12'h402;
    stim[24] = 12'h575;
    stim[25] = 12'h7b5;
    stim[26] = 12'h42f;
    stim[27] = 12'h1df;
    stim[28] = 12'h3b2;
    stim[29] = 12'h1f8;
    stim[30] = 12'h527;
    stim[31] = 12'h431;
    stim[32] = 12'h089;
    stim[33] = 12'h007;
    stim[34] = 12'h225;
    stim[35] = 12'h4e0;
    stim[36] = 12'h3f2;
    stim[37] = 12'h627;
    stim[38] = 12'h7ef;
    stim[39] = 12'h659;
    stim[40] = 12'h39a;
    stim[41] = 12'h02b;
    stim[42] = 12'h5eb;
    stim[43] = 12'h2a5;
    stim[44] = 12'h56b;
    stim[45] = 12'h502;
    stim[46] = 12'h299;
    stim[47] = 12'h383;
    stim[48] = 12'h5d9;
    stim[49] = 12'h4c5;
    stim[50] = 12'h64c;
    stim[51] = 12'h665;
    stim[52] = 12'h697;
    stim[53] = 12'h768;
    stim[54] = 12'h373;
    stim[55] = 12'h75e;
    stim[56] = 12'h552;
    stim[57] = 12'h7ac;
    stim[58] = 12'h48c;
    stim[59] = 12'h39e;
    stim[60] = 12'h362;
    stim[61] = 12'h112;
    stim[62] = 12'h1e2;
    stim[63] = 12'h14e;
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
      expv[0] = 23'h400000;
      expv[1] = 23'h400000;
      expv[2] = 23'h400000;
      expv[3] = 23'h400000;
      expv[4] = 23'h400000;
      expv[5] = 23'h400000;
      expv[6] = 23'h400000;
      expv[7] = 23'h400000;
      expv[8] = 23'h4ffc00;
      expv[9] = 23'h400000;
      expv[10] = 23'h400400;
      expv[11] = 23'h400800;
      expv[12] = 23'h400c00;
      expv[13] = 23'h401000;
      expv[14] = 23'h401400;
      expv[15] = 23'h401800;
      expv[16] = 23'h401c00;
      expv[17] = 23'h402000;
      expv[18] = 23'h402400;
      expv[19] = 23'h402800;
      expv[20] = 23'h402c00;
      expv[21] = 23'h403000;
      expv[22] = 23'h403400;
      expv[23] = 23'h403800;
      expv[24] = 23'h403c00;
      expv[25] = 23'h404000;
      expv[26] = 23'h404400;
      expv[27] = 23'h404800;
      expv[28] = 23'h604c00;
      expv[29] = 23'h605000;
      expv[30] = 23'h605400;
      expv[31] = 23'h605800;
      expv[32] = 23'h605c00;
      expv[33] = 23'h606000;
      expv[34] = 23'h606400;
      expv[35] = 23'h606800;
      expv[36] = 23'h606c00;
      expv[37] = 23'h607000;
      expv[38] = 23'h607400;
      expv[39] = 23'h607800;
      expv[40] = 23'h607c00;
      expv[41] = 23'h608000;
      expv[42] = 23'h608400;
      expv[43] = 23'h608800;
      expv[44] = 23'h608c00;
      expv[45] = 23'h609000;
      expv[46] = 23'h609400;
      expv[47] = 23'h609800;
      expv[48] = 23'h609c00;
      expv[49] = 23'h60a000;
      expv[50] = 23'h60a400;
      expv[51] = 23'h60a800;
      expv[52] = 23'h60ac00;
      expv[53] = 23'h60b000;
      expv[54] = 23'h60b400;
      expv[55] = 23'h60b800;
      expv[56] = 23'h40bc00;
      expv[57] = 23'h40c000;
      expv[58] = 23'h40c400;
      expv[59] = 23'h40c800;
      expv[60] = 23'h40cc00;
      expv[61] = 23'h40d000;
      expv[62] = 23'h40d400;
      expv[63] = 23'h40d800;
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
