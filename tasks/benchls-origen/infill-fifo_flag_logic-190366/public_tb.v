// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190366 dut (
    .clk(clk),
    .wr(in_vec[14:14]),
    .rd(in_vec[13:13]),
    .fifo_we(in_vec[12:12]),
    .fifo_rd(in_vec[11:11]),
    .wptr(in_vec[10:6]),
    .rptr(in_vec[5:1]),
    .rst_n(in_vec[0:0]),
    .fifo_full(out_vec[4:4]),
    .fifo_empty(out_vec[3:3]),
    .fifo_threshold(out_vec[2:2]),
    .fifo_overflow(out_vec[1:1]),
    .fifo_underflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h26a0;
    stim[1] = 15'h1122;
    stim[2] = 15'h789b;
    stim[3] = 15'h32c9;
    stim[4] = 15'h26c7;
    stim[5] = 15'h0f55;
    stim[6] = 15'h2b22;
    stim[7] = 15'h3beb;
    stim[8] = 15'h5b65;
    stim[9] = 15'h420d;
    stim[10] = 15'h7d57;
    stim[11] = 15'h28b9;
    stim[12] = 15'h6ab9;
    stim[13] = 15'h0e1f;
    stim[14] = 15'h107e;
    stim[15] = 15'h2545;
    stim[16] = 15'h1cad;
    stim[17] = 15'h6c75;
    stim[18] = 15'h5e9b;
    stim[19] = 15'h6153;
    stim[20] = 15'h607f;
    stim[21] = 15'h489b;
    stim[22] = 15'h15b9;
    stim[23] = 15'h517b;
    stim[24] = 15'h63f9;
    stim[25] = 15'h3ad9;
    stim[26] = 15'h276f;
    stim[27] = 15'h7273;
    stim[28] = 15'h22cf;
    stim[29] = 15'h4179;
    stim[30] = 15'h2077;
    stim[31] = 15'h5fb1;
    stim[32] = 15'h1649;
    stim[33] = 15'h0889;
    stim[34] = 15'h7d53;
    stim[35] = 15'h7b4b;
    stim[36] = 15'h4b59;
    stim[37] = 15'h5ec7;
    stim[38] = 15'h0781;
    stim[39] = 15'h3d9d;
    stim[40] = 15'h6c1d;
    stim[41] = 15'h0159;
    stim[42] = 15'h5281;
    stim[43] = 15'h2c1b;
    stim[44] = 15'h1e43;
    stim[45] = 15'h0a87;
    stim[46] = 15'h5223;
    stim[47] = 15'h15cb;
    stim[48] = 15'h59e9;
    stim[49] = 15'h0e47;
    stim[50] = 15'h287d;
    stim[51] = 15'h33bb;
    stim[52] = 15'h5bfd;
    stim[53] = 15'h5b87;
    stim[54] = 15'h42e7;
    stim[55] = 15'h20ed;
    stim[56] = 15'h58f6;
    stim[57] = 15'h2f0d;
    stim[58] = 15'h266d;
    stim[59] = 15'h4f81;
    stim[60] = 15'h7523;
    stim[61] = 15'h5c83;
    stim[62] = 15'h2e03;
    stim[63] = 15'h0a8f;
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
      expv[0] = 5'h08;
      expv[1] = 5'h08;
      expv[2] = 5'h08;
      expv[3] = 5'h05;
      expv[4] = 5'h04;
      expv[5] = 5'h04;
      expv[6] = 5'h08;
      expv[7] = 5'h08;
      expv[8] = 5'h05;
      expv[9] = 5'h04;
      expv[10] = 5'h00;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h04;
      expv[14] = 5'h08;
      expv[15] = 5'h08;
      expv[16] = 5'h04;
      expv[17] = 5'h04;
      expv[18] = 5'h04;
      expv[19] = 5'h04;
      expv[20] = 5'h04;
      expv[21] = 5'h00;
      expv[22] = 5'h04;
      expv[23] = 5'h04;
      expv[24] = 5'h04;
      expv[25] = 5'h04;
      expv[26] = 5'h04;
      expv[27] = 5'h04;
      expv[28] = 5'h04;
      expv[29] = 5'h04;
      expv[30] = 5'h04;
      expv[31] = 5'h04;
      expv[32] = 5'h04;
      expv[33] = 5'h04;
      expv[34] = 5'h04;
      expv[35] = 5'h04;
      expv[36] = 5'h04;
      expv[37] = 5'h00;
      expv[38] = 5'h04;
      expv[39] = 5'h04;
      expv[40] = 5'h04;
      expv[41] = 5'h00;
      expv[42] = 5'h04;
      expv[43] = 5'h04;
      expv[44] = 5'h04;
      expv[45] = 5'h04;
      expv[46] = 5'h04;
      expv[47] = 5'h04;
      expv[48] = 5'h04;
      expv[49] = 5'h04;
      expv[50] = 5'h04;
      expv[51] = 5'h04;
      expv[52] = 5'h04;
      expv[53] = 5'h04;
      expv[54] = 5'h04;
      expv[55] = 5'h04;
      expv[56] = 5'h08;
      expv[57] = 5'h08;
      expv[58] = 5'h05;
      expv[59] = 5'h05;
      expv[60] = 5'h05;
      expv[61] = 5'h04;
      expv[62] = 5'h04;
      expv[63] = 5'h04;
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
