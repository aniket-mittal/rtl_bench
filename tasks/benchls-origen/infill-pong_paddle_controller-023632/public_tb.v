// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023632 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .state(in_vec[16:15]),
    .mode(in_vec[14:13]),
    .keyboard(in_vec[12:11]),
    .ballY(in_vec[10:1]),
    .player(in_vec[0:0]),
    .posX(out_vec[18:9]),
    .posY(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h241ca;
    stim[1] = 18'h2ca28;
    stim[2] = 18'h0104e;
    stim[3] = 18'h1324a;
    stim[4] = 18'h1673d;
    stim[5] = 18'h1bf45;
    stim[6] = 18'h04b39;
    stim[7] = 18'h18023;
    stim[8] = 18'h149cd;
    stim[9] = 18'h09362;
    stim[10] = 18'h02aae;
    stim[11] = 18'h0c0ac;
    stim[12] = 18'h1fc97;
    stim[13] = 18'h01459;
    stim[14] = 18'h19bd2;
    stim[15] = 18'h11dcb;
    stim[16] = 18'h0216c;
    stim[17] = 18'h0a2d9;
    stim[18] = 18'h132c1;
    stim[19] = 18'h0c4dd;
    stim[20] = 18'h2944b;
    stim[21] = 18'h1f0a8;
    stim[22] = 18'h0737a;
    stim[23] = 18'h01159;
    stim[24] = 18'h1fc7e;
    stim[25] = 18'h048d4;
    stim[26] = 18'h0c8d1;
    stim[27] = 18'h046d6;
    stim[28] = 18'h0fe7c;
    stim[29] = 18'h072e0;
    stim[30] = 18'h1a49f;
    stim[31] = 18'h1fe36;
    stim[32] = 18'h10824;
    stim[33] = 18'h1d5cc;
    stim[34] = 18'h09c05;
    stim[35] = 18'h00d74;
    stim[36] = 18'h00ff0;
    stim[37] = 18'h057b8;
    stim[38] = 18'h0c75b;
    stim[39] = 18'h0ef41;
    stim[40] = 18'h1b695;
    stim[41] = 18'h0a948;
    stim[42] = 18'h0d96c;
    stim[43] = 18'h110b2;
    stim[44] = 18'h13c2e;
    stim[45] = 18'h0bd42;
    stim[46] = 18'h00c30;
    stim[47] = 18'h0ec8c;
    stim[48] = 18'h0dd07;
    stim[49] = 18'h167a9;
    stim[50] = 18'h195eb;
    stim[51] = 18'h018fd;
    stim[52] = 18'h06c61;
    stim[53] = 18'h12551;
    stim[54] = 18'h0a19e;
    stim[55] = 18'h09093;
    stim[56] = 18'h08b83;
    stim[57] = 18'h13f15;
    stim[58] = 18'h1c2ce;
    stim[59] = 18'h09fd4;
    stim[60] = 18'h0f9e3;
    stim[61] = 18'h07097;
    stim[62] = 18'h1ccef;
    stim[63] = 18'h0a798;
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
      expv[0] = 19'h000e8;
      expv[1] = 19'h000e8;
      expv[2] = 19'h000e8;
      expv[3] = 19'h000e8;
      expv[4] = 19'h4cce8;
      expv[5] = 19'h4cce9;
      expv[6] = 19'h4cce8;
      expv[7] = 19'h4cce8;
      expv[8] = 19'h4cce8;
      expv[9] = 19'h000e8;
      expv[10] = 19'h000e8;
      expv[11] = 19'h000e8;
      expv[12] = 19'h4cce7;
      expv[13] = 19'h4cce8;
      expv[14] = 19'h000e8;
      expv[15] = 19'h4cce8;
      expv[16] = 19'h000e8;
      expv[17] = 19'h4cce8;
      expv[18] = 19'h4cce9;
      expv[19] = 19'h4ccea;
      expv[20] = 19'h4cce8;
      expv[21] = 19'h000e8;
      expv[22] = 19'h000e8;
      expv[23] = 19'h4cce8;
      expv[24] = 19'h000e8;
      expv[25] = 19'h000e8;
      expv[26] = 19'h4cce8;
      expv[27] = 19'h000e8;
      expv[28] = 19'h000e8;
      expv[29] = 19'h000e9;
      expv[30] = 19'h4cce8;
      expv[31] = 19'h000e8;
      expv[32] = 19'h000e8;
      expv[33] = 19'h000e8;
      expv[34] = 19'h4cce8;
      expv[35] = 19'h000e8;
      expv[36] = 19'h000e8;
      expv[37] = 19'h000e8;
      expv[38] = 19'h4cce8;
      expv[39] = 19'h4cce8;
      expv[40] = 19'h4cce9;
      expv[41] = 19'h000e8;
      expv[42] = 19'h000e8;
      expv[43] = 19'h000e7;
      expv[44] = 19'h000e7;
      expv[45] = 19'h000e7;
      expv[46] = 19'h000e7;
      expv[47] = 19'h000e8;
      expv[48] = 19'h4cce9;
      expv[49] = 19'h4cce9;
      expv[50] = 19'h4ccea;
      expv[51] = 19'h4cce8;
      expv[52] = 19'h4cce8;
      expv[53] = 19'h4cce8;
      expv[54] = 19'h000e9;
      expv[55] = 19'h4cce9;
      expv[56] = 19'h4cce9;
      expv[57] = 19'h4cce9;
      expv[58] = 19'h000ea;
      expv[59] = 19'h000e8;
      expv[60] = 19'h4cce8;
      expv[61] = 19'h4cce7;
      expv[62] = 19'h4cce8;
      expv[63] = 19'h000e8;
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
