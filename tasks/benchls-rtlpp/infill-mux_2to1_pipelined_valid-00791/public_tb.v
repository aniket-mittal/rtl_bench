// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00791 dut (
    .clk(clk),
    .reset(in_vec[22:22]),
    .select(in_vec[21:20]),
    .in0(in_vec[19:16]),
    .in1(in_vec[15:12]),
    .in2(in_vec[11:8]),
    .in3(in_vec[7:4]),
    .in0_valid(in_vec[3:3]),
    .in1_valid(in_vec[2:2]),
    .in2_valid(in_vec[1:1]),
    .in3_valid(in_vec[0:0]),
    .out_b(out_vec[4:1]),
    .out_valid_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h46de2c;
    stim[1] = 23'h7feea2;
    stim[2] = 23'h3c64d1;
    stim[3] = 23'h080ac7;
    stim[4] = 23'h302b70;
    stim[5] = 23'h1f49c5;
    stim[6] = 23'h382966;
    stim[7] = 23'h2135e9;
    stim[8] = 23'h141fae;
    stim[9] = 23'h06425a;
    stim[10] = 23'h0775b0;
    stim[11] = 23'h372493;
    stim[12] = 23'h23a71d;
    stim[13] = 23'h280a97;
    stim[14] = 23'h281a33;
    stim[15] = 23'h30aa5b;
    stim[16] = 23'h3ba8a0;
    stim[17] = 23'h012a29;
    stim[18] = 23'h277579;
    stim[19] = 23'h1696b9;
    stim[20] = 23'h1f5e0d;
    stim[21] = 23'h26e2d5;
    stim[22] = 23'h3c8033;
    stim[23] = 23'h2c5919;
    stim[24] = 23'h14b3bb;
    stim[25] = 23'h034562;
    stim[26] = 23'h04cfc7;
    stim[27] = 23'h139db7;
    stim[28] = 23'h2a6710;
    stim[29] = 23'h1284e9;
    stim[30] = 23'h19e6a5;
    stim[31] = 23'h0e1c7d;
    stim[32] = 23'h2fc029;
    stim[33] = 23'h32829f;
    stim[34] = 23'h359241;
    stim[35] = 23'h0801dc;
    stim[36] = 23'h387d67;
    stim[37] = 23'h3340ed;
    stim[38] = 23'h0a78f4;
    stim[39] = 23'h39a14e;
    stim[40] = 23'h0440da;
    stim[41] = 23'h121c5a;
    stim[42] = 23'h2d659c;
    stim[43] = 23'h35e8d9;
    stim[44] = 23'h08e02e;
    stim[45] = 23'h2e9536;
    stim[46] = 23'h110d20;
    stim[47] = 23'h13d13d;
    stim[48] = 23'h231a7d;
    stim[49] = 23'h18f458;
    stim[50] = 23'h2effaf;
    stim[51] = 23'h05eeae;
    stim[52] = 23'h12b90f;
    stim[53] = 23'h005fa0;
    stim[54] = 23'h68b4a3;
    stim[55] = 23'h77bfa3;
    stim[56] = 23'h19591e;
    stim[57] = 23'h162f28;
    stim[58] = 23'h342b8c;
    stim[59] = 23'h1aa541;
    stim[60] = 23'h749003;
    stim[61] = 23'h7564df;
    stim[62] = 23'h263452;
    stim[63] = 23'h3ab4c7;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h0c;
      expv[5] = 5'h15;
      expv[6] = 5'h04;
      expv[7] = 5'h19;
      expv[8] = 5'h0c;
      expv[9] = 5'h03;
      expv[10] = 5'h03;
      expv[11] = 5'h0d;
      expv[12] = 5'h0a;
      expv[13] = 5'h13;
      expv[14] = 5'h0e;
      expv[15] = 5'h15;
      expv[16] = 5'h15;
      expv[17] = 5'h0b;
      expv[18] = 5'h14;
      expv[19] = 5'h14;
      expv[20] = 5'h0f;
      expv[21] = 5'h12;
      expv[22] = 5'h01;
      expv[23] = 5'h04;
      expv[24] = 5'h07;
      expv[25] = 5'h19;
      expv[26] = 5'h16;
      expv[27] = 5'h06;
      expv[28] = 5'h08;
      expv[29] = 5'h17;
      expv[30] = 5'h14;
      expv[31] = 5'h10;
      expv[32] = 5'h1d;
      expv[33] = 5'h18;
      expv[34] = 5'h00;
      expv[35] = 5'h13;
      expv[36] = 5'h12;
      expv[37] = 5'h02;
      expv[38] = 5'h0d;
      expv[39] = 5'h09;
      expv[40] = 5'h10;
      expv[41] = 5'h15;
      expv[42] = 5'h09;
      expv[43] = 5'h0a;
      expv[44] = 5'h0a;
      expv[45] = 5'h1c;
      expv[46] = 5'h01;
      expv[47] = 5'h1c;
      expv[48] = 5'h00;
      expv[49] = 5'h07;
      expv[50] = 5'h07;
      expv[51] = 5'h0a;
      expv[52] = 5'h1d;
      expv[53] = 5'h0b;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h0b;
      expv[59] = 5'h04;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
