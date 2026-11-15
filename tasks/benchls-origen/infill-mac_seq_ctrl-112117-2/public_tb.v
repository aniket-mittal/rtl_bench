// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_112117 dut (
    .clk(clk),
    .start(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .clear_acc(out_vec[12:12]),
    .done(out_vec[11:11]),
    .wr_en_x(out_vec[10:10]),
    .wr_en_y(out_vec[9:9]),
    .wr_en_a(out_vec[8:8]),
    .addr_x(out_vec[7:4]),
    .addr_y(out_vec[3:2]),
    .addr_a(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h1;
    stim[2] = 2'h2;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h0;
    stim[6] = 2'h2;
    stim[7] = 2'h0;
    stim[8] = 2'h2;
    stim[9] = 2'h0;
    stim[10] = 2'h0;
    stim[11] = 2'h0;
    stim[12] = 2'h2;
    stim[13] = 2'h2;
    stim[14] = 2'h2;
    stim[15] = 2'h2;
    stim[16] = 2'h2;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h2;
    stim[21] = 2'h0;
    stim[22] = 2'h2;
    stim[23] = 2'h0;
    stim[24] = 2'h2;
    stim[25] = 2'h2;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h2;
    stim[29] = 2'h0;
    stim[30] = 2'h2;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h2;
    stim[34] = 2'h0;
    stim[35] = 2'h0;
    stim[36] = 2'h2;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h0;
    stim[40] = 2'h2;
    stim[41] = 2'h0;
    stim[42] = 2'h3;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h2;
    stim[46] = 2'h2;
    stim[47] = 2'h2;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h0;
    stim[53] = 2'h2;
    stim[54] = 2'h0;
    stim[55] = 2'h0;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h2;
    stim[61] = 2'h0;
    stim[62] = 2'h0;
    stim[63] = 2'h3;
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
      expv[0] = 13'h0400;
      expv[1] = 13'h0400;
      expv[2] = 13'h0400;
      expv[3] = 13'h0410;
      expv[4] = 13'h0420;
      expv[5] = 13'h0430;
      expv[6] = 13'h0440;
      expv[7] = 13'h0450;
      expv[8] = 13'h0460;
      expv[9] = 13'h0470;
      expv[10] = 13'h0480;
      expv[11] = 13'h0590;
      expv[12] = 13'h0101;
      expv[13] = 13'h0102;
      expv[14] = 13'h1103;
      expv[15] = 13'h0001;
      expv[16] = 13'h0010;
      expv[17] = 13'h0021;
      expv[18] = 13'h0030;
      expv[19] = 13'h0041;
      expv[20] = 13'h0050;
      expv[21] = 13'h0061;
      expv[22] = 13'h1200;
      expv[23] = 13'h0001;
      expv[24] = 13'h0010;
      expv[25] = 13'h0021;
      expv[26] = 13'h0030;
      expv[27] = 13'h0041;
      expv[28] = 13'h0050;
      expv[29] = 13'h0061;
      expv[30] = 13'h1204;
      expv[31] = 13'h0001;
      expv[32] = 13'h0010;
      expv[33] = 13'h0021;
      expv[34] = 13'h0030;
      expv[35] = 13'h0041;
      expv[36] = 13'h0050;
      expv[37] = 13'h0061;
      expv[38] = 13'h0208;
      expv[39] = 13'h0800;
      expv[40] = 13'h0800;
      expv[41] = 13'h0000;
      expv[42] = 13'h0400;
      expv[43] = 13'h0400;
      expv[44] = 13'h0400;
      expv[45] = 13'h0400;
      expv[46] = 13'h0410;
      expv[47] = 13'h0420;
      expv[48] = 13'h0430;
      expv[49] = 13'h0440;
      expv[50] = 13'h0450;
      expv[51] = 13'h0460;
      expv[52] = 13'h0470;
      expv[53] = 13'h0480;
      expv[54] = 13'h0590;
      expv[55] = 13'h0101;
      expv[56] = 13'h0102;
      expv[57] = 13'h1103;
      expv[58] = 13'h0001;
      expv[59] = 13'h0010;
      expv[60] = 13'h0021;
      expv[61] = 13'h0030;
      expv[62] = 13'h0041;
      expv[63] = 13'h0400;
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
