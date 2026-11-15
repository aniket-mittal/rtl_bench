// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  adrv9001_aligner4 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .idata(in_vec[8:5]),
    .ivalid(in_vec[4:4]),
    .strobe(in_vec[3:0]),
    .odata(out_vec[4:1]),
    .ovalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h302;
    stim[1] = 10'h339;
    stim[2] = 10'h0a6;
    stim[3] = 10'h0c1;
    stim[4] = 10'h1ca;
    stim[5] = 10'h1f5;
    stim[6] = 10'h0fa;
    stim[7] = 10'h1ee;
    stim[8] = 10'h176;
    stim[9] = 10'h14b;
    stim[10] = 10'h09c;
    stim[11] = 10'h0ff;
    stim[12] = 10'h1f1;
    stim[13] = 10'h15c;
    stim[14] = 10'h1e1;
    stim[15] = 10'h19e;
    stim[16] = 10'h166;
    stim[17] = 10'h14b;
    stim[18] = 10'h0de;
    stim[19] = 10'h0b2;
    stim[20] = 10'h17a;
    stim[21] = 10'h0c1;
    stim[22] = 10'h02b;
    stim[23] = 10'h0db;
    stim[24] = 10'h052;
    stim[25] = 10'h0f5;
    stim[26] = 10'h034;
    stim[27] = 10'h070;
    stim[28] = 10'h090;
    stim[29] = 10'h1cc;
    stim[30] = 10'h115;
    stim[31] = 10'h18a;
    stim[32] = 10'h199;
    stim[33] = 10'h003;
    stim[34] = 10'h078;
    stim[35] = 10'h1a5;
    stim[36] = 10'h118;
    stim[37] = 10'h188;
    stim[38] = 10'h1b2;
    stim[39] = 10'h086;
    stim[40] = 10'h16d;
    stim[41] = 10'h1e6;
    stim[42] = 10'h1ea;
    stim[43] = 10'h08d;
    stim[44] = 10'h11e;
    stim[45] = 10'h0fa;
    stim[46] = 10'h138;
    stim[47] = 10'h0b9;
    stim[48] = 10'h1d6;
    stim[49] = 10'h0bf;
    stim[50] = 10'h017;
    stim[51] = 10'h005;
    stim[52] = 10'h1fa;
    stim[53] = 10'h1cf;
    stim[54] = 10'h135;
    stim[55] = 10'h179;
    stim[56] = 10'h012;
    stim[57] = 10'h1b1;
    stim[58] = 10'h03e;
    stim[59] = 10'h0d3;
    stim[60] = 10'h163;
    stim[61] = 10'h1c3;
    stim[62] = 10'h108;
    stim[63] = 10'h055;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h00;
      expv[2] = 5'h01;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h01;
      expv[7] = 5'h1d;
      expv[8] = 5'h0e;
      expv[9] = 5'h0f;
      expv[10] = 5'h0e;
      expv[11] = 5'h0d;
      expv[12] = 5'h09;
      expv[13] = 5'h0f;
      expv[14] = 5'h1b;
      expv[15] = 5'h14;
      expv[16] = 5'h15;
      expv[17] = 5'h18;
      expv[18] = 5'h18;
      expv[19] = 5'h19;
      expv[20] = 5'h0d;
      expv[21] = 5'h0d;
      expv[22] = 5'h16;
      expv[23] = 5'h16;
      expv[24] = 5'h17;
      expv[25] = 5'h0d;
      expv[26] = 5'h13;
      expv[27] = 5'h1d;
      expv[28] = 5'h05;
      expv[29] = 5'h0d;
      expv[30] = 5'h12;
      expv[31] = 5'h13;
      expv[32] = 5'h02;
      expv[33] = 5'h03;
      expv[34] = 5'h18;
      expv[35] = 5'h19;
      expv[36] = 5'h06;
      expv[37] = 5'h07;
      expv[38] = 5'h10;
      expv[39] = 5'h11;
      expv[40] = 5'h0a;
      expv[41] = 5'h0c;
      expv[42] = 5'h0e;
      expv[43] = 5'h0e;
      expv[44] = 5'h0a;
      expv[45] = 5'h0d;
      expv[46] = 5'h11;
      expv[47] = 5'h0f;
      expv[48] = 5'h13;
      expv[49] = 5'h0b;
      expv[50] = 5'h19;
      expv[51] = 5'h15;
      expv[52] = 5'h00;
      expv[53] = 5'h03;
      expv[54] = 5'h1e;
      expv[55] = 5'h1f;
      expv[56] = 5'h07;
      expv[57] = 5'h17;
      expv[58] = 5'h07;
      expv[59] = 5'h11;
      expv[60] = 5'h03;
      expv[61] = 5'h14;
      expv[62] = 5'h16;
      expv[63] = 5'h14;
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
