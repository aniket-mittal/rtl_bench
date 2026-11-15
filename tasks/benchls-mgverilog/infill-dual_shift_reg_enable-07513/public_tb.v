// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07513 dut (
    .clk(clk),
    .wen(in_vec[16:16]),
    .din_1(in_vec[15:8]),
    .din_2(in_vec[7:0]),
    .dout_1(out_vec[15:8]),
    .dout_2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0df5d;
    stim[1] = 17'h0a0ee;
    stim[2] = 17'h00173;
    stim[3] = 17'h0c1e7;
    stim[4] = 17'h096be;
    stim[5] = 17'h02974;
    stim[6] = 17'h1e538;
    stim[7] = 17'h0c55a;
    stim[8] = 17'h07ab4;
    stim[9] = 17'h1c78a;
    stim[10] = 17'h053e5;
    stim[11] = 17'h183bd;
    stim[12] = 17'h184db;
    stim[13] = 17'h1eaec;
    stim[14] = 17'h083d2;
    stim[15] = 17'h0de81;
    stim[16] = 17'h19c09;
    stim[17] = 17'h0359a;
    stim[18] = 17'h1dd51;
    stim[19] = 17'h07bf4;
    stim[20] = 17'h024dc;
    stim[21] = 17'h1e1f1;
    stim[22] = 17'h14302;
    stim[23] = 17'h04218;
    stim[24] = 17'h1f6c8;
    stim[25] = 17'h0d2e5;
    stim[26] = 17'h16552;
    stim[27] = 17'h0265d;
    stim[28] = 17'h0edd3;
    stim[29] = 17'h1caa7;
    stim[30] = 17'h18ee5;
    stim[31] = 17'h0d33a;
    stim[32] = 17'h059d8;
    stim[33] = 17'h1c9d9;
    stim[34] = 17'h1ab79;
    stim[35] = 17'h09c55;
    stim[36] = 17'h0c356;
    stim[37] = 17'h03437;
    stim[38] = 17'h0c005;
    stim[39] = 17'h0b8e6;
    stim[40] = 17'h1d673;
    stim[41] = 17'h166e4;
    stim[42] = 17'h0f7c6;
    stim[43] = 17'h187c0;
    stim[44] = 17'h15e86;
    stim[45] = 17'h0c2b3;
    stim[46] = 17'h03fdb;
    stim[47] = 17'h1904b;
    stim[48] = 17'h1e35a;
    stim[49] = 17'h02ebe;
    stim[50] = 17'h0e4f3;
    stim[51] = 17'h1ccee;
    stim[52] = 17'h1c891;
    stim[53] = 17'h034ce;
    stim[54] = 17'h09bc1;
    stim[55] = 17'h18f8d;
    stim[56] = 17'h17a1a;
    stim[57] = 17'h17f2a;
    stim[58] = 17'h13ce9;
    stim[59] = 17'h05951;
    stim[60] = 17'h1f89a;
    stim[61] = 17'h03a26;
    stim[62] = 17'h1471a;
    stim[63] = 17'h079e7;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'he538;
      expv[8] = 16'he538;
      expv[9] = 16'he538;
      expv[10] = 16'hc78a;
      expv[11] = 16'hc78a;
      expv[12] = 16'h83bd;
      expv[13] = 16'h84db;
      expv[14] = 16'heaec;
      expv[15] = 16'heaec;
      expv[16] = 16'heaec;
      expv[17] = 16'h9c09;
      expv[18] = 16'h9c09;
      expv[19] = 16'hdd51;
      expv[20] = 16'hdd51;
      expv[21] = 16'hdd51;
      expv[22] = 16'he1f1;
      expv[23] = 16'h4302;
      expv[24] = 16'h4302;
      expv[25] = 16'hf6c8;
      expv[26] = 16'hf6c8;
      expv[27] = 16'h6552;
      expv[28] = 16'h6552;
      expv[29] = 16'h6552;
      expv[30] = 16'hcaa7;
      expv[31] = 16'h8ee5;
      expv[32] = 16'h8ee5;
      expv[33] = 16'h8ee5;
      expv[34] = 16'hc9d9;
      expv[35] = 16'hab79;
      expv[36] = 16'hab79;
      expv[37] = 16'hab79;
      expv[38] = 16'hab79;
      expv[39] = 16'hab79;
      expv[40] = 16'hab79;
      expv[41] = 16'hd673;
      expv[42] = 16'h66e4;
      expv[43] = 16'h66e4;
      expv[44] = 16'h87c0;
      expv[45] = 16'h5e86;
      expv[46] = 16'h5e86;
      expv[47] = 16'h5e86;
      expv[48] = 16'h904b;
      expv[49] = 16'he35a;
      expv[50] = 16'he35a;
      expv[51] = 16'he35a;
      expv[52] = 16'hccee;
      expv[53] = 16'hc891;
      expv[54] = 16'hc891;
      expv[55] = 16'hc891;
      expv[56] = 16'h8f8d;
      expv[57] = 16'h7a1a;
      expv[58] = 16'h7f2a;
      expv[59] = 16'h3ce9;
      expv[60] = 16'h3ce9;
      expv[61] = 16'hf89a;
      expv[62] = 16'hf89a;
      expv[63] = 16'h471a;
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
