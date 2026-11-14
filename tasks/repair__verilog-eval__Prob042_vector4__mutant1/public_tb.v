// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc3;
    stim[1] = 8'h17;
    stim[2] = 8'h71;
    stim[3] = 8'hc1;
    stim[4] = 8'h67;
    stim[5] = 8'hec;
    stim[6] = 8'h01;
    stim[7] = 8'h8b;
    stim[8] = 8'heb;
    stim[9] = 8'h75;
    stim[10] = 8'hf6;
    stim[11] = 8'h7e;
    stim[12] = 8'h54;
    stim[13] = 8'hee;
    stim[14] = 8'h4d;
    stim[15] = 8'h64;
    stim[16] = 8'hca;
    stim[17] = 8'hc1;
    stim[18] = 8'h54;
    stim[19] = 8'h91;
    stim[20] = 8'he3;
    stim[21] = 8'h7a;
    stim[22] = 8'hb1;
    stim[23] = 8'ha7;
    stim[24] = 8'hb0;
    stim[25] = 8'h1b;
    stim[26] = 8'ha8;
    stim[27] = 8'h4c;
    stim[28] = 8'h94;
    stim[29] = 8'h64;
    stim[30] = 8'h45;
    stim[31] = 8'h8a;
    stim[32] = 8'ha0;
    stim[33] = 8'hdd;
    stim[34] = 8'h29;
    stim[35] = 8'h08;
    stim[36] = 8'hea;
    stim[37] = 8'hc4;
    stim[38] = 8'hbf;
    stim[39] = 8'h95;
    stim[40] = 8'h0d;
    stim[41] = 8'h7b;
    stim[42] = 8'h61;
    stim[43] = 8'hb4;
    stim[44] = 8'h37;
    stim[45] = 8'had;
    stim[46] = 8'h9d;
    stim[47] = 8'h29;
    stim[48] = 8'hed;
    stim[49] = 8'hef;
    stim[50] = 8'h35;
    stim[51] = 8'h23;
    stim[52] = 8'h2f;
    stim[53] = 8'h9c;
    stim[54] = 8'h63;
    stim[55] = 8'h2a;
    stim[56] = 8'h33;
    stim[57] = 8'h0c;
    stim[58] = 8'hd1;
    stim[59] = 8'h54;
    stim[60] = 8'h95;
    stim[61] = 8'he1;
    stim[62] = 8'h46;
    stim[63] = 8'h77;
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
      expv[0] = 32'h7fffffc3;
      expv[1] = 32'h00000017;
      expv[2] = 32'h00000071;
      expv[3] = 32'h7fffffc1;
      expv[4] = 32'h00000067;
      expv[5] = 32'h7fffffec;
      expv[6] = 32'h00000001;
      expv[7] = 32'h7fffff8b;
      expv[8] = 32'h7fffffeb;
      expv[9] = 32'h00000075;
      expv[10] = 32'h7ffffff6;
      expv[11] = 32'h0000007e;
      expv[12] = 32'h00000054;
      expv[13] = 32'h7fffffee;
      expv[14] = 32'h0000004d;
      expv[15] = 32'h00000064;
      expv[16] = 32'h7fffffca;
      expv[17] = 32'h7fffffc1;
      expv[18] = 32'h00000054;
      expv[19] = 32'h7fffff91;
      expv[20] = 32'h7fffffe3;
      expv[21] = 32'h0000007a;
      expv[22] = 32'h7fffffb1;
      expv[23] = 32'h7fffffa7;
      expv[24] = 32'h7fffffb0;
      expv[25] = 32'h0000001b;
      expv[26] = 32'h7fffffa8;
      expv[27] = 32'h0000004c;
      expv[28] = 32'h7fffff94;
      expv[29] = 32'h00000064;
      expv[30] = 32'h00000045;
      expv[31] = 32'h7fffff8a;
      expv[32] = 32'h7fffffa0;
      expv[33] = 32'h7fffffdd;
      expv[34] = 32'h00000029;
      expv[35] = 32'h00000008;
      expv[36] = 32'h7fffffea;
      expv[37] = 32'h7fffffc4;
      expv[38] = 32'h7fffffbf;
      expv[39] = 32'h7fffff95;
      expv[40] = 32'h0000000d;
      expv[41] = 32'h0000007b;
      expv[42] = 32'h00000061;
      expv[43] = 32'h7fffffb4;
      expv[44] = 32'h00000037;
      expv[45] = 32'h7fffffad;
      expv[46] = 32'h7fffff9d;
      expv[47] = 32'h00000029;
      expv[48] = 32'h7fffffed;
      expv[49] = 32'h7fffffef;
      expv[50] = 32'h00000035;
      expv[51] = 32'h00000023;
      expv[52] = 32'h0000002f;
      expv[53] = 32'h7fffff9c;
      expv[54] = 32'h00000063;
      expv[55] = 32'h0000002a;
      expv[56] = 32'h00000033;
      expv[57] = 32'h0000000c;
      expv[58] = 32'h7fffffd1;
      expv[59] = 32'h00000054;
      expv[60] = 32'h7fffff95;
      expv[61] = 32'h7fffffe1;
      expv[62] = 32'h00000046;
      expv[63] = 32'h00000077;
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
