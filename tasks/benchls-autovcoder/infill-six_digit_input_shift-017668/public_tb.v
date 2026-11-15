// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_017668 dut (
    .clock(clk),
    .reset(in_vec[4:4]),
    .data(in_vec[3:0]),
    .out0(out_vec[26:23]),
    .out1(out_vec[22:19]),
    .out2(out_vec[18:15]),
    .out3(out_vec[14:11]),
    .out4(out_vec[10:7]),
    .out5(out_vec[6:3]),
    .ledr(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1f;
    stim[1] = 5'h1b;
    stim[2] = 5'h08;
    stim[3] = 5'h04;
    stim[4] = 5'h03;
    stim[5] = 5'h0f;
    stim[6] = 5'h06;
    stim[7] = 5'h09;
    stim[8] = 5'h0b;
    stim[9] = 5'h08;
    stim[10] = 5'h07;
    stim[11] = 5'h0c;
    stim[12] = 5'h0d;
    stim[13] = 5'h01;
    stim[14] = 5'h03;
    stim[15] = 5'h02;
    stim[16] = 5'h0f;
    stim[17] = 5'h04;
    stim[18] = 5'h0c;
    stim[19] = 5'h0e;
    stim[20] = 5'h00;
    stim[21] = 5'h06;
    stim[22] = 5'h0f;
    stim[23] = 5'h07;
    stim[24] = 5'h0c;
    stim[25] = 5'h06;
    stim[26] = 5'h00;
    stim[27] = 5'h05;
    stim[28] = 5'h0e;
    stim[29] = 5'h01;
    stim[30] = 5'h0f;
    stim[31] = 5'h0e;
    stim[32] = 5'h04;
    stim[33] = 5'h0a;
    stim[34] = 5'h08;
    stim[35] = 5'h04;
    stim[36] = 5'h0e;
    stim[37] = 5'h00;
    stim[38] = 5'h09;
    stim[39] = 5'h01;
    stim[40] = 5'h05;
    stim[41] = 5'h09;
    stim[42] = 5'h0c;
    stim[43] = 5'h05;
    stim[44] = 5'h07;
    stim[45] = 5'h07;
    stim[46] = 5'h04;
    stim[47] = 5'h0d;
    stim[48] = 5'h03;
    stim[49] = 5'h03;
    stim[50] = 5'h0a;
    stim[51] = 5'h03;
    stim[52] = 5'h05;
    stim[53] = 5'h06;
    stim[54] = 5'h0f;
    stim[55] = 5'h0e;
    stim[56] = 5'h0d;
    stim[57] = 5'h0e;
    stim[58] = 5'h0f;
    stim[59] = 5'h01;
    stim[60] = 5'h0d;
    stim[61] = 5'h08;
    stim[62] = 5'h04;
    stim[63] = 5'h12;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000001;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0000000;
      expv[6] = 27'h0000000;
      expv[7] = 27'h0000000;
      expv[8] = 27'h0000000;
      expv[9] = 27'h0000000;
      expv[10] = 27'h0000000;
      expv[11] = 27'h0000000;
      expv[12] = 27'h0000000;
      expv[13] = 27'h0000000;
      expv[14] = 27'h0000000;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000000;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000000;
      expv[20] = 27'h0000000;
      expv[21] = 27'h0000000;
      expv[22] = 27'h0000000;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000000;
      expv[25] = 27'h0000000;
      expv[26] = 27'h0000000;
      expv[27] = 27'h0000000;
      expv[28] = 27'h0000000;
      expv[29] = 27'h0000000;
      expv[30] = 27'h0000000;
      expv[31] = 27'h0000000;
      expv[32] = 27'h0000000;
      expv[33] = 27'h0000000;
      expv[34] = 27'h0000000;
      expv[35] = 27'h0000000;
      expv[36] = 27'h0000000;
      expv[37] = 27'h0000000;
      expv[38] = 27'h0000000;
      expv[39] = 27'h0000000;
      expv[40] = 27'h0000000;
      expv[41] = 27'h0000000;
      expv[42] = 27'h0000000;
      expv[43] = 27'h0000000;
      expv[44] = 27'h0000000;
      expv[45] = 27'h0000000;
      expv[46] = 27'h0000000;
      expv[47] = 27'h0000000;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000000;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000000;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000000;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000000;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000000;
      expv[62] = 27'h0000000;
      expv[63] = 27'h0000000;
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
