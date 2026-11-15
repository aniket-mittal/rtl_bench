// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140037 dut (
    .clk(clk),
    .x(in_vec[16:1]),
    .clr(in_vec[0:0]),
    .a_to_g(out_vec[11:5]),
    .an(out_vec[4:1]),
    .dp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1931d;
    stim[1] = 17'h13307;
    stim[2] = 17'h09c3e;
    stim[3] = 17'h0bbe4;
    stim[4] = 17'h00936;
    stim[5] = 17'h16e88;
    stim[6] = 17'h00c10;
    stim[7] = 17'h06f40;
    stim[8] = 17'h0d330;
    stim[9] = 17'h02bd8;
    stim[10] = 17'h06568;
    stim[11] = 17'h18786;
    stim[12] = 17'h1c978;
    stim[13] = 17'h12da6;
    stim[14] = 17'h1578c;
    stim[15] = 17'h1ad68;
    stim[16] = 17'h19b48;
    stim[17] = 17'h0f292;
    stim[18] = 17'h0c1d2;
    stim[19] = 17'h0edc8;
    stim[20] = 17'h1c82c;
    stim[21] = 17'h0ca52;
    stim[22] = 17'h0438e;
    stim[23] = 17'h061c4;
    stim[24] = 17'h0d834;
    stim[25] = 17'h172f6;
    stim[26] = 17'h05508;
    stim[27] = 17'h04954;
    stim[28] = 17'h042a4;
    stim[29] = 17'h062a6;
    stim[30] = 17'h04610;
    stim[31] = 17'h08392;
    stim[32] = 17'h08cb6;
    stim[33] = 17'h0d872;
    stim[34] = 17'h040d8;
    stim[35] = 17'h0e510;
    stim[36] = 17'h16f5c;
    stim[37] = 17'h0b2f0;
    stim[38] = 17'h13a04;
    stim[39] = 17'h120aa;
    stim[40] = 17'h00e5a;
    stim[41] = 17'h1ee10;
    stim[42] = 17'h1d84e;
    stim[43] = 17'h08bca;
    stim[44] = 17'h1efbe;
    stim[45] = 17'h00472;
    stim[46] = 17'h18276;
    stim[47] = 17'h1c89e;
    stim[48] = 17'h099de;
    stim[49] = 17'h19ebc;
    stim[50] = 17'h1b2be;
    stim[51] = 17'h07a76;
    stim[52] = 17'h1c828;
    stim[53] = 17'h0b47a;
    stim[54] = 17'h036d8;
    stim[55] = 17'h0fc3e;
    stim[56] = 17'h0346e;
    stim[57] = 17'h0a078;
    stim[58] = 17'h147a0;
    stim[59] = 17'h11802;
    stim[60] = 17'h05dc4;
    stim[61] = 17'h160a4;
    stim[62] = 17'h1828c;
    stim[63] = 17'h15cfc;
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
      expv[0] = 12'h0dc;
      expv[1] = 12'h61c;
      expv[2] = 12'h1dc;
      expv[3] = 12'h49c;
      expv[4] = 12'h07c;
      expv[5] = 12'h33c;
      expv[6] = 12'h01c;
      expv[7] = 12'h81c;
      expv[8] = 12'h01c;
      expv[9] = 12'h8dc;
      expv[10] = 12'h33c;
      expv[11] = 12'h61c;
      expv[12] = 12'h8dc;
      expv[13] = 12'h61c;
      expv[14] = 12'h05c;
      expv[15] = 12'h33c;
      expv[16] = 12'h33c;
      expv[17] = 12'h21c;
      expv[18] = 12'h21c;
      expv[19] = 12'h33c;
      expv[20] = 12'h05c;
      expv[21] = 12'h21c;
      expv[22] = 12'hf1c;
      expv[23] = 12'h49c;
      expv[24] = 12'h11c;
      expv[25] = 12'h07c;
      expv[26] = 12'h33c;
      expv[27] = 12'h11c;
      expv[28] = 12'h49c;
      expv[29] = 12'h61c;
      expv[30] = 12'h01c;
      expv[31] = 12'h21c;
      expv[32] = 12'h07c;
      expv[33] = 12'h21c;
      expv[34] = 12'h8dc;
      expv[35] = 12'h01c;
      expv[36] = 12'h0dc;
      expv[37] = 12'h01c;
      expv[38] = 12'h49c;
      expv[39] = 12'h25c;
      expv[40] = 12'h43c;
      expv[41] = 12'h01c;
      expv[42] = 12'hf1c;
      expv[43] = 12'h25c;
      expv[44] = 12'h1dc;
      expv[45] = 12'h21c;
      expv[46] = 12'h07c;
      expv[47] = 12'h1dc;
      expv[48] = 12'h1dc;
      expv[49] = 12'h0dc;
      expv[50] = 12'h1dc;
      expv[51] = 12'h07c;
      expv[52] = 12'h33c;
      expv[53] = 12'h43c;
      expv[54] = 12'h8dc;
      expv[55] = 12'h1dc;
      expv[56] = 12'hf1c;
      expv[57] = 12'h8dc;
      expv[58] = 12'h81c;
      expv[59] = 12'hf3c;
      expv[60] = 12'h49c;
      expv[61] = 12'h49c;
      expv[62] = 12'h05c;
      expv[63] = 12'h0dc;
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
