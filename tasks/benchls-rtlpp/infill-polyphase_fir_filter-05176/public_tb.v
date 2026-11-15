// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05176 dut (
    .clk(clk),
    .clk_enable(in_vec[18:18]),
    .reset(in_vec[17:17]),
    .filter_in(in_vec[16:0]),
    .filter_out(out_vec[16:1]),
    .ce_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h61cd0;
    stim[1] = 19'h6739c;
    stim[2] = 19'h5b832;
    stim[3] = 19'h12c75;
    stim[4] = 19'h45448;
    stim[5] = 19'h0e115;
    stim[6] = 19'h58dff;
    stim[7] = 19'h02456;
    stim[8] = 19'h40162;
    stim[9] = 19'h15c05;
    stim[10] = 19'h1ed4b;
    stim[11] = 19'h4520c;
    stim[12] = 19'h57b48;
    stim[13] = 19'h48a40;
    stim[14] = 19'h1010e;
    stim[15] = 19'h4b19b;
    stim[16] = 19'h05db4;
    stim[17] = 19'h03f1e;
    stim[18] = 19'h1aede;
    stim[19] = 19'h1420a;
    stim[20] = 19'h41bd9;
    stim[21] = 19'h5ab64;
    stim[22] = 19'h41113;
    stim[23] = 19'h4fa6c;
    stim[24] = 19'h554ad;
    stim[25] = 19'h491fd;
    stim[26] = 19'h42d8d;
    stim[27] = 19'h0f81d;
    stim[28] = 19'h03d96;
    stim[29] = 19'h0dbe3;
    stim[30] = 19'h164d8;
    stim[31] = 19'h42b05;
    stim[32] = 19'h49fe7;
    stim[33] = 19'h40c09;
    stim[34] = 19'h4593a;
    stim[35] = 19'h44ed5;
    stim[36] = 19'h0cf07;
    stim[37] = 19'h467b0;
    stim[38] = 19'h5b001;
    stim[39] = 19'h1b154;
    stim[40] = 19'h1bb4d;
    stim[41] = 19'h5d39a;
    stim[42] = 19'h0984f;
    stim[43] = 19'h4c286;
    stim[44] = 19'h4ab3c;
    stim[45] = 19'h0adad;
    stim[46] = 19'h5af58;
    stim[47] = 19'h54d21;
    stim[48] = 19'h3412d;
    stim[49] = 19'h4bd30;
    stim[50] = 19'h12722;
    stim[51] = 19'h4c9f6;
    stim[52] = 19'h17360;
    stim[53] = 19'h0988c;
    stim[54] = 19'h12973;
    stim[55] = 19'h47b3a;
    stim[56] = 19'h00b3c;
    stim[57] = 19'h42593;
    stim[58] = 19'h47d7a;
    stim[59] = 19'h0b612;
    stim[60] = 19'h5a36f;
    stim[61] = 19'h09ba4;
    stim[62] = 19'h0a5bd;
    stim[63] = 19'h1714b;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00001;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h1e6fe;
      expv[8] = 17'h1e6ff;
      expv[9] = 17'h0c192;
      expv[10] = 17'h0c192;
      expv[11] = 17'h0c192;
      expv[12] = 17'h0c129;
      expv[13] = 17'h1ea2c;
      expv[14] = 17'h02a8e;
      expv[15] = 17'h02a8f;
      expv[16] = 17'h10000;
      expv[17] = 17'h10000;
      expv[18] = 17'h10000;
      expv[19] = 17'h10000;
      expv[20] = 17'h10000;
      expv[21] = 17'h10001;
      expv[22] = 17'h0fffe;
      expv[23] = 17'h0ffff;
      expv[24] = 17'h108fc;
      expv[25] = 17'h10001;
      expv[26] = 17'h0fffe;
      expv[27] = 17'h0fffe;
      expv[28] = 17'h0fffe;
      expv[29] = 17'h0fffe;
      expv[30] = 17'h0fffe;
      expv[31] = 17'h0ffff;
      expv[32] = 17'h0fffe;
      expv[33] = 17'h0ffff;
      expv[34] = 17'h0377e;
      expv[35] = 17'h05f3d;
      expv[36] = 17'h00ee0;
      expv[37] = 17'h00ee0;
      expv[38] = 17'h00441;
      expv[39] = 17'h0b17c;
      expv[40] = 17'h0b17c;
      expv[41] = 17'h0b17c;
      expv[42] = 17'h0ccca;
      expv[43] = 17'h0cccb;
      expv[44] = 17'h130e2;
      expv[45] = 17'h10e90;
      expv[46] = 17'h10e91;
      expv[47] = 17'h0fffe;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00001;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h1c414;
      expv[57] = 17'h1c415;
      expv[58] = 17'h0fffe;
      expv[59] = 17'h0fffe;
      expv[60] = 17'h0ffff;
      expv[61] = 17'h01a60;
      expv[62] = 17'h01a60;
      expv[63] = 17'h01a60;
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
