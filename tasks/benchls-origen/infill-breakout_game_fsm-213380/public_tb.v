// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213380 dut (
    .pb1(in_vec[11:11]),
    .pb2(in_vec[10:10]),
    .foursec(in_vec[9:9]),
    .nolives(in_vec[8:8]),
    .collision(in_vec[7:7]),
    .paddlegone(in_vec[6:6]),
    .PS(in_vec[5:0]),
    .NS(out_vec[14:9]),
    .movecarpet(out_vec[8:8]),
    .moveball(out_vec[7:7]),
    .movepaddle(out_vec[6:6]),
    .resettimer(out_vec[5:5]),
    .decrementlives(out_vec[4:4]),
    .loadlives(out_vec[3:3]),
    .paddlehide(out_vec[2:2]),
    .timecount(out_vec[1:1]),
    .resetpositions(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h2bf;
    stim[1] = 12'hcfa;
    stim[2] = 12'h1f0;
    stim[3] = 12'h64b;
    stim[4] = 12'hc8e;
    stim[5] = 12'h59a;
    stim[6] = 12'h373;
    stim[7] = 12'hc7f;
    stim[8] = 12'h2dc;
    stim[9] = 12'h417;
    stim[10] = 12'hff9;
    stim[11] = 12'h636;
    stim[12] = 12'hbb2;
    stim[13] = 12'ha13;
    stim[14] = 12'hed6;
    stim[15] = 12'hee3;
    stim[16] = 12'h5b6;
    stim[17] = 12'hece;
    stim[18] = 12'h628;
    stim[19] = 12'hbc2;
    stim[20] = 12'h8da;
    stim[21] = 12'h698;
    stim[22] = 12'hde5;
    stim[23] = 12'he6b;
    stim[24] = 12'he6b;
    stim[25] = 12'h2cb;
    stim[26] = 12'h282;
    stim[27] = 12'he7b;
    stim[28] = 12'hbc5;
    stim[29] = 12'hf4b;
    stim[30] = 12'h1b5;
    stim[31] = 12'h166;
    stim[32] = 12'hbbc;
    stim[33] = 12'h743;
    stim[34] = 12'hff0;
    stim[35] = 12'h09f;
    stim[36] = 12'hf0e;
    stim[37] = 12'hf99;
    stim[38] = 12'h035;
    stim[39] = 12'h104;
    stim[40] = 12'h2e0;
    stim[41] = 12'h1e5;
    stim[42] = 12'hadc;
    stim[43] = 12'h194;
    stim[44] = 12'h938;
    stim[45] = 12'h737;
    stim[46] = 12'h93f;
    stim[47] = 12'h18a;
    stim[48] = 12'h84d;
    stim[49] = 12'hd57;
    stim[50] = 12'h3e4;
    stim[51] = 12'hf6c;
    stim[52] = 12'h2de;
    stim[53] = 12'hffe;
    stim[54] = 12'hb9c;
    stim[55] = 12'h017;
    stim[56] = 12'h024;
    stim[57] = 12'hec1;
    stim[58] = 12'haf3;
    stim[59] = 12'h576;
    stim[60] = 12'hdd8;
    stim[61] = 12'h0dd;
    stim[62] = 12'h318;
    stim[63] = 12'ha2d;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'hxxxx;
      expv[2] = 15'hxxxx;
      expv[3] = 15'hxxxx;
      expv[4] = 15'hxxxx;
      expv[5] = 15'hxxxx;
      expv[6] = 15'hxxxx;
      expv[7] = 15'hxxxx;
      expv[8] = 15'hxxxx;
      expv[9] = 15'hxxxx;
      expv[10] = 15'hxxxx;
      expv[11] = 15'hxxxx;
      expv[12] = 15'hxxxx;
      expv[13] = 15'hxxxx;
      expv[14] = 15'hxxxx;
      expv[15] = 15'hxxxx;
      expv[16] = 15'hxxxx;
      expv[17] = 15'hxxxx;
      expv[18] = 15'hxxxx;
      expv[19] = 15'h0400;
      expv[20] = 15'h0400;
      expv[21] = 15'h0400;
      expv[22] = 15'h0400;
      expv[23] = 15'h0400;
      expv[24] = 15'h0400;
      expv[25] = 15'h0400;
      expv[26] = 15'h0400;
      expv[27] = 15'h0400;
      expv[28] = 15'h0400;
      expv[29] = 15'h0400;
      expv[30] = 15'h0400;
      expv[31] = 15'h0400;
      expv[32] = 15'h0400;
      expv[33] = 15'h0400;
      expv[34] = 15'h0400;
      expv[35] = 15'h0400;
      expv[36] = 15'h0400;
      expv[37] = 15'h0400;
      expv[38] = 15'h0400;
      expv[39] = 15'h09c2;
      expv[40] = 15'h41c7;
      expv[41] = 15'h41c7;
      expv[42] = 15'h41c7;
      expv[43] = 15'h41c7;
      expv[44] = 15'h41c7;
      expv[45] = 15'h41c7;
      expv[46] = 15'h41c7;
      expv[47] = 15'h41c7;
      expv[48] = 15'h41c7;
      expv[49] = 15'h41c7;
      expv[50] = 15'h41c7;
      expv[51] = 15'h41c7;
      expv[52] = 15'h41c7;
      expv[53] = 15'h41c7;
      expv[54] = 15'h41c7;
      expv[55] = 15'h41c7;
      expv[56] = 15'h41c7;
      expv[57] = 15'h0229;
      expv[58] = 15'h0229;
      expv[59] = 15'h0229;
      expv[60] = 15'h0229;
      expv[61] = 15'h0229;
      expv[62] = 15'h0229;
      expv[63] = 15'h0229;
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
