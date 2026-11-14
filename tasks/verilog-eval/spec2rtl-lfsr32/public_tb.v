// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .reset(in_vec[0:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000001;
      expv[2] = 32'h00000001;
      expv[3] = 32'h80200003;
      expv[4] = 32'hc0300002;
      expv[5] = 32'h60180001;
      expv[6] = 32'hb02c0003;
      expv[7] = 32'hd8360002;
      expv[8] = 32'h6c1b0001;
      expv[9] = 32'hb62d8003;
      expv[10] = 32'hdb36c002;
      expv[11] = 32'h6d9b6001;
      expv[12] = 32'hb6edb003;
      expv[13] = 32'hdb56d802;
      expv[14] = 32'h6dab6c01;
      expv[15] = 32'hb6f5b603;
      expv[16] = 32'hdb5adb02;
      expv[17] = 32'h6dad6d81;
      expv[18] = 32'hb6f6b6c3;
      expv[19] = 32'hdb5b5b62;
      expv[20] = 32'h6dadadb1;
      expv[21] = 32'hb6f6d6db;
      expv[22] = 32'hdb5b6b6e;
      expv[23] = 32'h6dadb5b7;
      expv[24] = 32'hb6f6dad8;
      expv[25] = 32'h5b7b6d6c;
      expv[26] = 32'h2dbdb6b6;
      expv[27] = 32'h16dedb5b;
      expv[28] = 32'h8b4f6dae;
      expv[29] = 32'h45a7b6d7;
      expv[30] = 32'ha2f3db68;
      expv[31] = 32'h5179edb4;
      expv[32] = 32'h28bcf6da;
      expv[33] = 32'h145e7b6d;
      expv[34] = 32'h8a0f3db5;
      expv[35] = 32'hc5279ed9;
      expv[36] = 32'he2b3cf6f;
      expv[37] = 32'hf179e7b4;
      expv[38] = 32'h78bcf3da;
      expv[39] = 32'h3c5e79ed;
      expv[40] = 32'h9e0f3cf5;
      expv[41] = 32'hcf279e79;
      expv[42] = 32'he7b3cf3f;
      expv[43] = 32'hf3f9e79c;
      expv[44] = 32'h79fcf3ce;
      expv[45] = 32'h3cfe79e7;
      expv[46] = 32'h9e5f3cf0;
      expv[47] = 32'h4f2f9e78;
      expv[48] = 32'h2797cf3c;
      expv[49] = 32'h13cbe79e;
      expv[50] = 32'h09e5f3cf;
      expv[51] = 32'h84d2f9e4;
      expv[52] = 32'h42697cf2;
      expv[53] = 32'h2134be79;
      expv[54] = 32'h90ba5f3f;
      expv[55] = 32'hc87d2f9c;
      expv[56] = 32'h643e97ce;
      expv[57] = 32'h321f4be7;
      expv[58] = 32'h992fa5f0;
      expv[59] = 32'h4c97d2f8;
      expv[60] = 32'h264be97c;
      expv[61] = 32'h1325f4be;
      expv[62] = 32'h0992fa5f;
      expv[63] = 32'h84e97d2c;
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
