// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06321 dut (
    .CLK(clk),
    .DIN(in_vec[21:3]),
    .RST(in_vec[2:2]),
    .IN_EN(in_vec[1:1]),
    .OUT_EN(in_vec[0:0]),
    .DOUT(out_vec[20:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3b2755;
    stim[1] = 22'h20c926;
    stim[2] = 22'h2519ab;
    stim[3] = 22'h210879;
    stim[4] = 22'h2a7529;
    stim[5] = 22'h0c6bf2;
    stim[6] = 22'h3cbce2;
    stim[7] = 22'h265e23;
    stim[8] = 22'h2b7dc2;
    stim[9] = 22'h1de991;
    stim[10] = 22'h04dd0a;
    stim[11] = 22'h1c86b0;
    stim[12] = 22'h3a5b0b;
    stim[13] = 22'h2c6793;
    stim[14] = 22'h33d3eb;
    stim[15] = 22'h34d3c0;
    stim[16] = 22'h1f2340;
    stim[17] = 22'h00db71;
    stim[18] = 22'h13052a;
    stim[19] = 22'h15f6b9;
    stim[20] = 22'h02f582;
    stim[21] = 22'h19b7eb;
    stim[22] = 22'h21fb11;
    stim[23] = 22'h336ddb;
    stim[24] = 22'h3bcba3;
    stim[25] = 22'h110f31;
    stim[26] = 22'h033dbb;
    stim[27] = 22'h1a33c8;
    stim[28] = 22'h331659;
    stim[29] = 22'h3b21fb;
    stim[30] = 22'h1b1ce9;
    stim[31] = 22'h139a72;
    stim[32] = 22'h00102a;
    stim[33] = 22'h0dd0a9;
    stim[34] = 22'h0242aa;
    stim[35] = 22'h2920c9;
    stim[36] = 22'h1d5f6b;
    stim[37] = 22'h291f11;
    stim[38] = 22'h3fa893;
    stim[39] = 22'h140f83;
    stim[40] = 22'h1cbe8a;
    stim[41] = 22'h3ccffa;
    stim[42] = 22'h03ee03;
    stim[43] = 22'h1f0da8;
    stim[44] = 22'h0c0adb;
    stim[45] = 22'h0afa28;
    stim[46] = 22'h0a62ca;
    stim[47] = 22'h17c858;
    stim[48] = 22'h19277c;
    stim[49] = 22'h3b1442;
    stim[50] = 22'h388ab1;
    stim[51] = 22'h0c6d5a;
    stim[52] = 22'h0a7cc9;
    stim[53] = 22'h0a267a;
    stim[54] = 22'h09bedb;
    stim[55] = 22'h079339;
    stim[56] = 22'h02c733;
    stim[57] = 22'h068cf9;
    stim[58] = 22'h2ca8a0;
    stim[59] = 22'h1f8f01;
    stim[60] = 22'h1174a3;
    stim[61] = 22'h192a72;
    stim[62] = 22'h171a9a;
    stim[63] = 22'h122ee1;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'h000000;
      expv[2] = 21'h106490;
      expv[3] = 21'h106490;
      expv[4] = 21'h106490;
      expv[5] = 21'h000000;
      expv[6] = 21'h000000;
      expv[7] = 21'hxxxxxx;
      expv[8] = 21'h000000;
      expv[9] = 21'hxxxxxx;
      expv[10] = 21'h000001;
      expv[11] = 21'h000001;
      expv[12] = 21'h026e85;
      expv[13] = 21'h026e85;
      expv[14] = 21'h026e85;
      expv[15] = 21'h000001;
      expv[16] = 21'h000001;
      expv[17] = 21'hxxxxxx;
      expv[18] = 21'h000001;
      expv[19] = 21'h098295;
      expv[20] = 21'h000001;
      expv[21] = 21'h017ac1;
      expv[22] = 21'h017ac1;
      expv[23] = 21'h017ac1;
      expv[24] = 21'h017ac1;
      expv[25] = 21'h017ac1;
      expv[26] = 21'h017ac1;
      expv[27] = 21'h000001;
      expv[28] = 21'h106491;
      expv[29] = 21'h106491;
      expv[30] = 21'h106491;
      expv[31] = 21'h000001;
      expv[32] = 21'h000001;
      expv[33] = 21'hxxxxxx;
      expv[34] = 21'h000001;
      expv[35] = 21'hxxxxxx;
      expv[36] = 21'hxxxxxx;
      expv[37] = 21'hxxxxxx;
      expv[38] = 21'hxxxxxx;
      expv[39] = 21'hxxxxxx;
      expv[40] = 21'h000001;
      expv[41] = 21'h000001;
      expv[42] = 21'h098295;
      expv[43] = 21'h000001;
      expv[44] = 21'h017ac1;
      expv[45] = 21'h000001;
      expv[46] = 21'h000001;
      expv[47] = 21'h000001;
      expv[48] = 21'h000000;
      expv[49] = 21'h000000;
      expv[50] = 21'h1d8a20;
      expv[51] = 21'h000001;
      expv[52] = 21'h0636ad;
      expv[53] = 21'h000001;
      expv[54] = 21'h05133d;
      expv[55] = 21'h05133d;
      expv[56] = 21'h05133d;
      expv[57] = 21'h05133d;
      expv[58] = 21'h000001;
      expv[59] = 21'h1d2d85;
      expv[60] = 21'h1d2d85;
      expv[61] = 21'h000001;
      expv[62] = 21'h000001;
      expv[63] = 21'hxxxxxx;
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
