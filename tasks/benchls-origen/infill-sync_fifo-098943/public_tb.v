// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098943 dut (
    .clk(clk),
    .nrst(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .rd(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .data_out(out_vec[9:2]),
    .fifo_full(out_vec[1:1]),
    .fifo_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h727;
    stim[1] = 11'h75e;
    stim[2] = 11'h0f3;
    stim[3] = 11'h3b5;
    stim[4] = 11'h3f2;
    stim[5] = 11'h063;
    stim[6] = 11'h17c;
    stim[7] = 11'h3be;
    stim[8] = 11'h1ed;
    stim[9] = 11'h2d1;
    stim[10] = 11'h295;
    stim[11] = 11'h048;
    stim[12] = 11'h32f;
    stim[13] = 11'h045;
    stim[14] = 11'h09d;
    stim[15] = 11'h1f6;
    stim[16] = 11'h21f;
    stim[17] = 11'h28e;
    stim[18] = 11'h353;
    stim[19] = 11'h30d;
    stim[20] = 11'h3e4;
    stim[21] = 11'h2e9;
    stim[22] = 11'h09b;
    stim[23] = 11'h294;
    stim[24] = 11'h29b;
    stim[25] = 11'h247;
    stim[26] = 11'h2cc;
    stim[27] = 11'h250;
    stim[28] = 11'h09d;
    stim[29] = 11'h0d3;
    stim[30] = 11'h2dd;
    stim[31] = 11'h13c;
    stim[32] = 11'h2fd;
    stim[33] = 11'h24b;
    stim[34] = 11'h3c5;
    stim[35] = 11'h2e0;
    stim[36] = 11'h210;
    stim[37] = 11'h3e9;
    stim[38] = 11'h1fe;
    stim[39] = 11'h113;
    stim[40] = 11'h27c;
    stim[41] = 11'h01c;
    stim[42] = 11'h189;
    stim[43] = 11'h3bf;
    stim[44] = 11'h3d6;
    stim[45] = 11'h0b6;
    stim[46] = 11'h176;
    stim[47] = 11'h1d8;
    stim[48] = 11'h36f;
    stim[49] = 11'h2ec;
    stim[50] = 11'h05d;
    stim[51] = 11'h239;
    stim[52] = 11'h3dd;
    stim[53] = 11'h3f7;
    stim[54] = 11'h00a;
    stim[55] = 11'h0f8;
    stim[56] = 11'h315;
    stim[57] = 11'h2cb;
    stim[58] = 11'h018;
    stim[59] = 11'h30e;
    stim[60] = 11'h0c2;
    stim[61] = 11'h3e7;
    stim[62] = 11'h0e4;
    stim[63] = 11'h15a;
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
      expv[0] = 10'h001;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h001;
      expv[4] = 10'h001;
      expv[5] = 10'h001;
      expv[6] = 10'h001;
      expv[7] = 10'h001;
      expv[8] = 10'h001;
      expv[9] = 10'h001;
      expv[10] = 10'h001;
      expv[11] = 10'h001;
      expv[12] = 10'h001;
      expv[13] = 10'h001;
      expv[14] = 10'h001;
      expv[15] = 10'h001;
      expv[16] = 10'h001;
      expv[17] = 10'h001;
      expv[18] = 10'h001;
      expv[19] = 10'h001;
      expv[20] = 10'h001;
      expv[21] = 10'h001;
      expv[22] = 10'h001;
      expv[23] = 10'h001;
      expv[24] = 10'h001;
      expv[25] = 10'h001;
      expv[26] = 10'h001;
      expv[27] = 10'h001;
      expv[28] = 10'h001;
      expv[29] = 10'h001;
      expv[30] = 10'h001;
      expv[31] = 10'h001;
      expv[32] = 10'h001;
      expv[33] = 10'h001;
      expv[34] = 10'h001;
      expv[35] = 10'h001;
      expv[36] = 10'h001;
      expv[37] = 10'h001;
      expv[38] = 10'h001;
      expv[39] = 10'h001;
      expv[40] = 10'h001;
      expv[41] = 10'h001;
      expv[42] = 10'h001;
      expv[43] = 10'h001;
      expv[44] = 10'h001;
      expv[45] = 10'h001;
      expv[46] = 10'h001;
      expv[47] = 10'h001;
      expv[48] = 10'h001;
      expv[49] = 10'h001;
      expv[50] = 10'h001;
      expv[51] = 10'h001;
      expv[52] = 10'h001;
      expv[53] = 10'h001;
      expv[54] = 10'h001;
      expv[55] = 10'h001;
      expv[56] = 10'h001;
      expv[57] = 10'h001;
      expv[58] = 10'h001;
      expv[59] = 10'h001;
      expv[60] = 10'h001;
      expv[61] = 10'h001;
      expv[62] = 10'h001;
      expv[63] = 10'h001;
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
