// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  asyn_fifo dut (
    .wclk(clk),
    .rclk(in_vec[12:12]),
    .wrstn(in_vec[11:11]),
    .rrstn(in_vec[10:10]),
    .winc(in_vec[9:9]),
    .rinc(in_vec[8:8]),
    .wdata(in_vec[7:0]),
    .wfull(out_vec[9:9]),
    .rempty(out_vec[8:8]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h153c;
    stim[1] = 13'h04b5;
    stim[2] = 13'h0c71;
    stim[3] = 13'h1bac;
    stim[4] = 13'h0b65;
    stim[5] = 13'h0ea1;
    stim[6] = 13'h1d33;
    stim[7] = 13'h0cce;
    stim[8] = 13'h188b;
    stim[9] = 13'h1cdb;
    stim[10] = 13'h1868;
    stim[11] = 13'h1f49;
    stim[12] = 13'h0c8d;
    stim[13] = 13'h1fe6;
    stim[14] = 13'h0b77;
    stim[15] = 13'h1cfa;
    stim[16] = 13'h0dd5;
    stim[17] = 13'h19b1;
    stim[18] = 13'h0b2a;
    stim[19] = 13'h0b3a;
    stim[20] = 13'h18e9;
    stim[21] = 13'h091d;
    stim[22] = 13'h0cfc;
    stim[23] = 13'h0f48;
    stim[24] = 13'h19f9;
    stim[25] = 13'h095d;
    stim[26] = 13'h0f2e;
    stim[27] = 13'h185a;
    stim[28] = 13'h09d3;
    stim[29] = 13'h1852;
    stim[30] = 13'h1cf5;
    stim[31] = 13'h0843;
    stim[32] = 13'h1f5f;
    stim[33] = 13'h0c77;
    stim[34] = 13'h099e;
    stim[35] = 13'h19a8;
    stim[36] = 13'h0fbd;
    stim[37] = 13'h09b2;
    stim[38] = 13'h0d49;
    stim[39] = 13'h1dfd;
    stim[40] = 13'h183b;
    stim[41] = 13'h0ff9;
    stim[42] = 13'h0e56;
    stim[43] = 13'h0af3;
    stim[44] = 13'h0860;
    stim[45] = 13'h0d05;
    stim[46] = 13'h1d1c;
    stim[47] = 13'h1ab9;
    stim[48] = 13'h0f52;
    stim[49] = 13'h1b2e;
    stim[50] = 13'h0f5e;
    stim[51] = 13'h0f0f;
    stim[52] = 13'h19f7;
    stim[53] = 13'h1f8a;
    stim[54] = 13'h0143;
    stim[55] = 13'h1e34;
    stim[56] = 13'h09fd;
    stim[57] = 13'h0bfa;
    stim[58] = 13'h1c77;
    stim[59] = 13'h0caf;
    stim[60] = 13'h0ae6;
    stim[61] = 13'h0ec5;
    stim[62] = 13'h0fc5;
    stim[63] = 13'h0e61;
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
      expv[0] = 10'h1xx;
      expv[1] = 10'h1xx;
      expv[2] = 10'h1xx;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h1xx;
      expv[11] = 10'h1xx;
      expv[12] = 10'h1xx;
      expv[13] = 10'h1xx;
      expv[14] = 10'h1xx;
      expv[15] = 10'h1xx;
      expv[16] = 10'h1xx;
      expv[17] = 10'h1xx;
      expv[18] = 10'h1xx;
      expv[19] = 10'h1xx;
      expv[20] = 10'h1xx;
      expv[21] = 10'h1xx;
      expv[22] = 10'h1xx;
      expv[23] = 10'h1xx;
      expv[24] = 10'h1xx;
      expv[25] = 10'h1xx;
      expv[26] = 10'h1xx;
      expv[27] = 10'h1xx;
      expv[28] = 10'h1xx;
      expv[29] = 10'h1xx;
      expv[30] = 10'h1xx;
      expv[31] = 10'h1xx;
      expv[32] = 10'h1xx;
      expv[33] = 10'h1xx;
      expv[34] = 10'h1xx;
      expv[35] = 10'h1xx;
      expv[36] = 10'h1xx;
      expv[37] = 10'h1xx;
      expv[38] = 10'h1xx;
      expv[39] = 10'h1xx;
      expv[40] = 10'h1xx;
      expv[41] = 10'h1xx;
      expv[42] = 10'h1xx;
      expv[43] = 10'h1xx;
      expv[44] = 10'h1xx;
      expv[45] = 10'h1xx;
      expv[46] = 10'h1xx;
      expv[47] = 10'h1xx;
      expv[48] = 10'h1xx;
      expv[49] = 10'h3xx;
      expv[50] = 10'h1xx;
      expv[51] = 10'h1xx;
      expv[52] = 10'h1xx;
      expv[53] = 10'h1xx;
      expv[54] = 10'h1xx;
      expv[55] = 10'h1xx;
      expv[56] = 10'h1xx;
      expv[57] = 10'h1xx;
      expv[58] = 10'h1xx;
      expv[59] = 10'h1xx;
      expv[60] = 10'h1xx;
      expv[61] = 10'h1xx;
      expv[62] = 10'h1xx;
      expv[63] = 10'h1xx;
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
