// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_138297 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .addr(in_vec[16:9]),
    .data(in_vec[8:1]),
    .we(in_vec[0:0]),
    .hit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2f69c;
    stim[1] = 18'h3476f;
    stim[2] = 18'h3afd2;
    stim[3] = 18'h08bdf;
    stim[4] = 18'h06a5d;
    stim[5] = 18'h1b77e;
    stim[6] = 18'h06110;
    stim[7] = 18'h030fa;
    stim[8] = 18'h1018b;
    stim[9] = 18'h12f5a;
    stim[10] = 18'h1c8b8;
    stim[11] = 18'h1f459;
    stim[12] = 18'h1cf8d;
    stim[13] = 18'h1e37c;
    stim[14] = 18'h11d41;
    stim[15] = 18'h057fe;
    stim[16] = 18'h10c9a;
    stim[17] = 18'h1d3fa;
    stim[18] = 18'h1d6af;
    stim[19] = 18'h35ef0;
    stim[20] = 18'h11d60;
    stim[21] = 18'h0c98a;
    stim[22] = 18'h09287;
    stim[23] = 18'h103cb;
    stim[24] = 18'h0a5a2;
    stim[25] = 18'h04265;
    stim[26] = 18'h00eae;
    stim[27] = 18'h0f07f;
    stim[28] = 18'h0fa01;
    stim[29] = 18'h24c3b;
    stim[30] = 18'h06258;
    stim[31] = 18'h124d5;
    stim[32] = 18'h1351a;
    stim[33] = 18'h06239;
    stim[34] = 18'h14b12;
    stim[35] = 18'h00f7a;
    stim[36] = 18'h29d31;
    stim[37] = 18'h159a0;
    stim[38] = 18'h18f90;
    stim[39] = 18'h10be3;
    stim[40] = 18'h1c079;
    stim[41] = 18'h1063d;
    stim[42] = 18'h06528;
    stim[43] = 18'h09310;
    stim[44] = 18'h0c289;
    stim[45] = 18'h19b28;
    stim[46] = 18'h01261;
    stim[47] = 18'h13beb;
    stim[48] = 18'h139da;
    stim[49] = 18'h1c861;
    stim[50] = 18'h1d8af;
    stim[51] = 18'h1037a;
    stim[52] = 18'h1ee0d;
    stim[53] = 18'h15876;
    stim[54] = 18'h0e93f;
    stim[55] = 18'h052fc;
    stim[56] = 18'h199ce;
    stim[57] = 18'h05616;
    stim[58] = 18'h0f35a;
    stim[59] = 18'h09c5e;
    stim[60] = 18'h037aa;
    stim[61] = 18'h1fbde;
    stim[62] = 18'h1985c;
    stim[63] = 18'h0e8ba;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
