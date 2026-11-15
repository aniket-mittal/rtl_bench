// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097574 dut (
    .A(in_vec[6:6]),
    .S(in_vec[5:5]),
    .D(in_vec[4:4]),
    .F(in_vec[3:3]),
    .G(in_vec[2:2]),
    .H(in_vec[1:1]),
    .J(in_vec[0:0]),
    .note(out_vec[18:15]),
    .volume(out_vec[14:7]),
    .keyArray(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h02;
    stim[1] = 7'h11;
    stim[2] = 7'h69;
    stim[3] = 7'h31;
    stim[4] = 7'h1d;
    stim[5] = 7'h25;
    stim[6] = 7'h4f;
    stim[7] = 7'h61;
    stim[8] = 7'h51;
    stim[9] = 7'h4f;
    stim[10] = 7'h3a;
    stim[11] = 7'h2b;
    stim[12] = 7'h25;
    stim[13] = 7'h19;
    stim[14] = 7'h18;
    stim[15] = 7'h68;
    stim[16] = 7'h6b;
    stim[17] = 7'h39;
    stim[18] = 7'h2d;
    stim[19] = 7'h38;
    stim[20] = 7'h76;
    stim[21] = 7'h2e;
    stim[22] = 7'h58;
    stim[23] = 7'h4a;
    stim[24] = 7'h0f;
    stim[25] = 7'h73;
    stim[26] = 7'h33;
    stim[27] = 7'h1c;
    stim[28] = 7'h1d;
    stim[29] = 7'h05;
    stim[30] = 7'h3d;
    stim[31] = 7'h31;
    stim[32] = 7'h7c;
    stim[33] = 7'h1d;
    stim[34] = 7'h2a;
    stim[35] = 7'h12;
    stim[36] = 7'h22;
    stim[37] = 7'h57;
    stim[38] = 7'h45;
    stim[39] = 7'h61;
    stim[40] = 7'h42;
    stim[41] = 7'h4b;
    stim[42] = 7'h59;
    stim[43] = 7'h46;
    stim[44] = 7'h06;
    stim[45] = 7'h4e;
    stim[46] = 7'h4b;
    stim[47] = 7'h4b;
    stim[48] = 7'h71;
    stim[49] = 7'h5d;
    stim[50] = 7'h7b;
    stim[51] = 7'h03;
    stim[52] = 7'h01;
    stim[53] = 7'h42;
    stim[54] = 7'h4b;
    stim[55] = 7'h3f;
    stim[56] = 7'h01;
    stim[57] = 7'h29;
    stim[58] = 7'h22;
    stim[59] = 7'h2c;
    stim[60] = 7'h50;
    stim[61] = 7'h17;
    stim[62] = 7'h73;
    stim[63] = 7'h63;
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
      expv[0] = 19'h2ffa0;
      expv[1] = 19'h17f84;
      expv[2] = 19'h07f81;
      expv[3] = 19'h0ff82;
      expv[4] = 19'h17f84;
      expv[5] = 19'h0ff82;
      expv[6] = 19'h07f81;
      expv[7] = 19'h07f81;
      expv[8] = 19'h07f81;
      expv[9] = 19'h07f81;
      expv[10] = 19'h0ff82;
      expv[11] = 19'h0ff82;
      expv[12] = 19'h0ff82;
      expv[13] = 19'h17f84;
      expv[14] = 19'h17f84;
      expv[15] = 19'h07f81;
      expv[16] = 19'h07f81;
      expv[17] = 19'h0ff82;
      expv[18] = 19'h0ff82;
      expv[19] = 19'h0ff82;
      expv[20] = 19'h07f81;
      expv[21] = 19'h0ff82;
      expv[22] = 19'h07f81;
      expv[23] = 19'h07f81;
      expv[24] = 19'h1ff88;
      expv[25] = 19'h07f81;
      expv[26] = 19'h0ff82;
      expv[27] = 19'h17f84;
      expv[28] = 19'h17f84;
      expv[29] = 19'h27f90;
      expv[30] = 19'h0ff82;
      expv[31] = 19'h0ff82;
      expv[32] = 19'h07f81;
      expv[33] = 19'h17f84;
      expv[34] = 19'h0ff82;
      expv[35] = 19'h17f84;
      expv[36] = 19'h0ff82;
      expv[37] = 19'h07f81;
      expv[38] = 19'h07f81;
      expv[39] = 19'h07f81;
      expv[40] = 19'h07f81;
      expv[41] = 19'h07f81;
      expv[42] = 19'h07f81;
      expv[43] = 19'h07f81;
      expv[44] = 19'h27f90;
      expv[45] = 19'h07f81;
      expv[46] = 19'h07f81;
      expv[47] = 19'h07f81;
      expv[48] = 19'h07f81;
      expv[49] = 19'h07f81;
      expv[50] = 19'h07f81;
      expv[51] = 19'h2ffa0;
      expv[52] = 19'h37fc0;
      expv[53] = 19'h07f81;
      expv[54] = 19'h07f81;
      expv[55] = 19'h0ff82;
      expv[56] = 19'h37fc0;
      expv[57] = 19'h0ff82;
      expv[58] = 19'h0ff82;
      expv[59] = 19'h0ff82;
      expv[60] = 19'h07f81;
      expv[61] = 19'h17f84;
      expv[62] = 19'h07f81;
      expv[63] = 19'h07f81;
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
