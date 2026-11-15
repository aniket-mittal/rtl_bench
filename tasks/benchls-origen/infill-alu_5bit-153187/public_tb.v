// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153187 dut (
    .A(in_vec[12:8]),
    .B(in_vec[7:3]),
    .Op(in_vec[2:1]),
    .Cin(in_vec[0:0]),
    .R(out_vec[5:1]),
    .C(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h006c;
    stim[1] = 13'h1760;
    stim[2] = 13'h09ef;
    stim[3] = 13'h195b;
    stim[4] = 13'h1f95;
    stim[5] = 13'h1a74;
    stim[6] = 13'h0bef;
    stim[7] = 13'h02f1;
    stim[8] = 13'h0af1;
    stim[9] = 13'h045e;
    stim[10] = 13'h0349;
    stim[11] = 13'h1433;
    stim[12] = 13'h0fa6;
    stim[13] = 13'h1750;
    stim[14] = 13'h10cb;
    stim[15] = 13'h0cbb;
    stim[16] = 13'h1f15;
    stim[17] = 13'h1a2a;
    stim[18] = 13'h07b1;
    stim[19] = 13'h178d;
    stim[20] = 13'h1759;
    stim[21] = 13'h1fea;
    stim[22] = 13'h0adc;
    stim[23] = 13'h0234;
    stim[24] = 13'h16ef;
    stim[25] = 13'h1ec7;
    stim[26] = 13'h016c;
    stim[27] = 13'h1e44;
    stim[28] = 13'h046e;
    stim[29] = 13'h1b9e;
    stim[30] = 13'h0ce0;
    stim[31] = 13'h011a;
    stim[32] = 13'h0e4f;
    stim[33] = 13'h013c;
    stim[34] = 13'h1ec8;
    stim[35] = 13'h0e40;
    stim[36] = 13'h12df;
    stim[37] = 13'h15d5;
    stim[38] = 13'h1b33;
    stim[39] = 13'h1d7f;
    stim[40] = 13'h0a43;
    stim[41] = 13'h0213;
    stim[42] = 13'h1ac1;
    stim[43] = 13'h059f;
    stim[44] = 13'h1b54;
    stim[45] = 13'h0571;
    stim[46] = 13'h1ec8;
    stim[47] = 13'h1b2a;
    stim[48] = 13'h033f;
    stim[49] = 13'h140e;
    stim[50] = 13'h176e;
    stim[51] = 13'h17f3;
    stim[52] = 13'h1e90;
    stim[53] = 13'h0aaa;
    stim[54] = 13'h1dc6;
    stim[55] = 13'h00ba;
    stim[56] = 13'h0c88;
    stim[57] = 13'h0aed;
    stim[58] = 13'h0632;
    stim[59] = 13'h04d2;
    stim[60] = 13'h146d;
    stim[61] = 13'h0f31;
    stim[62] = 13'h04cf;
    stim[63] = 13'h181d;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h1b;
      expv[3] = 6'h26;
      expv[4] = 6'h1c;
      expv[5] = 6'h08;
      expv[6] = 6'h1f;
      expv[7] = 6'h01;
      expv[8] = 6'h01;
      expv[9] = 6'h33;
      expv[10] = 6'h01;
      expv[11] = 6'h30;
      expv[12] = 6'h37;
      expv[13] = 6'h00;
      expv[14] = 6'h20;
      expv[15] = 6'h28;
      expv[16] = 6'h1c;
      expv[17] = 6'h04;
      expv[18] = 6'h01;
      expv[19] = 6'h0a;
      expv[20] = 6'h00;
      expv[21] = 6'h06;
      expv[22] = 6'h0c;
      expv[23] = 6'h00;
      expv[24] = 6'h35;
      expv[25] = 6'h0e;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h2f;
      expv[29] = 6'h10;
      expv[30] = 6'h01;
      expv[31] = 6'h06;
      expv[32] = 6'h0c;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h31;
      expv[37] = 6'h14;
      expv[38] = 6'h04;
      expv[39] = 6'h1e;
      expv[40] = 6'h20;
      expv[41] = 6'h08;
      expv[42] = 6'h00;
      expv[43] = 6'h27;
      expv[44] = 6'h18;
      expv[45] = 6'h01;
      expv[46] = 6'h00;
      expv[47] = 6'h0e;
      expv[48] = 6'h3b;
      expv[49] = 6'h26;
      expv[50] = 6'h14;
      expv[51] = 6'h24;
      expv[52] = 6'h00;
      expv[53] = 6'h24;
      expv[54] = 6'h0a;
      expv[55] = 6'h00;
      expv[56] = 6'h01;
      expv[57] = 6'h14;
      expv[58] = 6'h08;
      expv[59] = 6'h10;
      expv[60] = 6'h32;
      expv[61] = 6'h00;
      expv[62] = 6'h19;
      expv[63] = 6'h24;
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
