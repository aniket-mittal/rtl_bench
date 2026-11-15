// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09512 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .note_on(in_vec[8:8]),
    .note_off(in_vec[7:7]),
    .note(in_vec[6:0]),
    .out_note(out_vec[7:1]),
    .out_gate(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h222;
    stim[1] = 10'h3ab;
    stim[2] = 10'h0d9;
    stim[3] = 10'h01b;
    stim[4] = 10'h1f6;
    stim[5] = 10'h11c;
    stim[6] = 10'h130;
    stim[7] = 10'h09c;
    stim[8] = 10'h17f;
    stim[9] = 10'h19f;
    stim[10] = 10'h10e;
    stim[11] = 10'h1ca;
    stim[12] = 10'h18d;
    stim[13] = 10'h1a8;
    stim[14] = 10'h03e;
    stim[15] = 10'h1a2;
    stim[16] = 10'h19e;
    stim[17] = 10'h0ce;
    stim[18] = 10'h083;
    stim[19] = 10'h04d;
    stim[20] = 10'h106;
    stim[21] = 10'h130;
    stim[22] = 10'h132;
    stim[23] = 10'h148;
    stim[24] = 10'h028;
    stim[25] = 10'h1f5;
    stim[26] = 10'h09b;
    stim[27] = 10'h14b;
    stim[28] = 10'h122;
    stim[29] = 10'h031;
    stim[30] = 10'h1bb;
    stim[31] = 10'h0ea;
    stim[32] = 10'h084;
    stim[33] = 10'h1da;
    stim[34] = 10'h046;
    stim[35] = 10'h0cb;
    stim[36] = 10'h0c4;
    stim[37] = 10'h0ae;
    stim[38] = 10'h09e;
    stim[39] = 10'h1a9;
    stim[40] = 10'h1a8;
    stim[41] = 10'h046;
    stim[42] = 10'h018;
    stim[43] = 10'h11e;
    stim[44] = 10'h120;
    stim[45] = 10'h1b2;
    stim[46] = 10'h0c6;
    stim[47] = 10'h13d;
    stim[48] = 10'h13c;
    stim[49] = 10'h0d1;
    stim[50] = 10'h0ab;
    stim[51] = 10'h031;
    stim[52] = 10'h015;
    stim[53] = 10'h107;
    stim[54] = 10'h0b7;
    stim[55] = 10'h129;
    stim[56] = 10'h1ba;
    stim[57] = 10'h0e8;
    stim[58] = 10'h0f1;
    stim[59] = 10'h1b5;
    stim[60] = 10'h17a;
    stim[61] = 10'h1be;
    stim[62] = 10'h077;
    stim[63] = 10'h0fa;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hff;
      expv[18] = 8'hff;
      expv[19] = 8'hff;
      expv[20] = 8'hff;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hff;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hff;
      expv[28] = 8'hff;
      expv[29] = 8'hff;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hff;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
