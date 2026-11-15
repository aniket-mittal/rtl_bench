// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134837 dut (
    .clock(clk),
    .nReset(in_vec[26:26]),
    .inValid(in_vec[25:25]),
    .a(in_vec[24:8]),
    .roundingMode(in_vec[7:5]),
    .control(in_vec[4:0]),
    .inReady(out_vec[14:14]),
    .outValid(out_vec[13:13]),
    .out(out_vec[12:4]),
    .exceptionFlags(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h74ee7cf;
    stim[1] = 27'h62e7f81;
    stim[2] = 27'h35751cc;
    stim[3] = 27'h18a5d0d;
    stim[4] = 27'h0882200;
    stim[5] = 27'h3a9b0ae;
    stim[6] = 27'h0c22dd8;
    stim[7] = 27'h72c0bac;
    stim[8] = 27'h2ed09fd;
    stim[9] = 27'h24456aa;
    stim[10] = 27'h2b02681;
    stim[11] = 27'h02ec4eb;
    stim[12] = 27'h2764ac2;
    stim[13] = 27'h0610769;
    stim[14] = 27'h07683ce;
    stim[15] = 27'h2afa71b;
    stim[16] = 27'h190e429;
    stim[17] = 27'h1616e6b;
    stim[18] = 27'h2b453d6;
    stim[19] = 27'h13a27ac;
    stim[20] = 27'h3bf51a5;
    stim[21] = 27'h155dfc5;
    stim[22] = 27'h316f7de;
    stim[23] = 27'h028c7ba;
    stim[24] = 27'h7a9b9c6;
    stim[25] = 27'h26fedc0;
    stim[26] = 27'h31cf005;
    stim[27] = 27'h1b3dc14;
    stim[28] = 27'h145be5a;
    stim[29] = 27'h0113e4e;
    stim[30] = 27'h383f6b3;
    stim[31] = 27'h16aa63d;
    stim[32] = 27'h187f0ee;
    stim[33] = 27'h1a2cc7a;
    stim[34] = 27'h20f3247;
    stim[35] = 27'h12e636a;
    stim[36] = 27'h1755f50;
    stim[37] = 27'h23fb763;
    stim[38] = 27'h3fb6c01;
    stim[39] = 27'h0b20bea;
    stim[40] = 27'h297bbc2;
    stim[41] = 27'h3dc98b3;
    stim[42] = 27'h0456843;
    stim[43] = 27'h11743a0;
    stim[44] = 27'h05b1efa;
    stim[45] = 27'h18f6208;
    stim[46] = 27'h3f93102;
    stim[47] = 27'h1ee65ce;
    stim[48] = 27'h28091e5;
    stim[49] = 27'h095d4d4;
    stim[50] = 27'h0c5b6e7;
    stim[51] = 27'h34e1cc2;
    stim[52] = 27'h33ed0ab;
    stim[53] = 27'h219e871;
    stim[54] = 27'h1984c6d;
    stim[55] = 27'h3dd5fea;
    stim[56] = 27'h2d61612;
    stim[57] = 27'h0fa6e31;
    stim[58] = 27'h0f1a929;
    stim[59] = 27'h2910649;
    stim[60] = 27'h057c216;
    stim[61] = 27'h019a92a;
    stim[62] = 27'h1b66593;
    stim[63] = 27'h064a618;
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
      expv[0] = 15'h4000;
      expv[1] = 15'h0000;
      expv[2] = 15'h4000;
      expv[3] = 15'h4000;
      expv[4] = 15'h4000;
      expv[5] = 15'h4000;
      expv[6] = 15'h4000;
      expv[7] = 15'h4000;
      expv[8] = 15'h4000;
      expv[9] = 15'h4000;
      expv[10] = 15'h4000;
      expv[11] = 15'h4000;
      expv[12] = 15'h4000;
      expv[13] = 15'h4000;
      expv[14] = 15'h4000;
      expv[15] = 15'h4000;
      expv[16] = 15'h4000;
      expv[17] = 15'h4000;
      expv[18] = 15'h4000;
      expv[19] = 15'h4000;
      expv[20] = 15'h4000;
      expv[21] = 15'h4000;
      expv[22] = 15'h4000;
      expv[23] = 15'h4000;
      expv[24] = 15'h4000;
      expv[25] = 15'h4000;
      expv[26] = 15'h4000;
      expv[27] = 15'h4000;
      expv[28] = 15'h4000;
      expv[29] = 15'h4000;
      expv[30] = 15'h4000;
      expv[31] = 15'h4000;
      expv[32] = 15'h4000;
      expv[33] = 15'h4000;
      expv[34] = 15'h4000;
      expv[35] = 15'h4000;
      expv[36] = 15'h4000;
      expv[37] = 15'h4000;
      expv[38] = 15'h4000;
      expv[39] = 15'h4000;
      expv[40] = 15'h4000;
      expv[41] = 15'h4000;
      expv[42] = 15'h4000;
      expv[43] = 15'h4000;
      expv[44] = 15'h4000;
      expv[45] = 15'h4000;
      expv[46] = 15'h4000;
      expv[47] = 15'h4000;
      expv[48] = 15'h4000;
      expv[49] = 15'h4000;
      expv[50] = 15'h4000;
      expv[51] = 15'h4000;
      expv[52] = 15'h4000;
      expv[53] = 15'h4000;
      expv[54] = 15'h4000;
      expv[55] = 15'h4000;
      expv[56] = 15'h4000;
      expv[57] = 15'h4000;
      expv[58] = 15'h4000;
      expv[59] = 15'h4000;
      expv[60] = 15'h4000;
      expv[61] = 15'h4000;
      expv[62] = 15'h4000;
      expv[63] = 15'h4000;
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
