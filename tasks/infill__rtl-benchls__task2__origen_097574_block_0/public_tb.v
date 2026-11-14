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
    stim[0] = 7'h04;
    stim[1] = 7'h5a;
    stim[2] = 7'h00;
    stim[3] = 7'h3f;
    stim[4] = 7'h02;
    stim[5] = 7'h11;
    stim[6] = 7'h0e;
    stim[7] = 7'h4d;
    stim[8] = 7'h3f;
    stim[9] = 7'h33;
    stim[10] = 7'h79;
    stim[11] = 7'h3b;
    stim[12] = 7'h1c;
    stim[13] = 7'h03;
    stim[14] = 7'h67;
    stim[15] = 7'h71;
    stim[16] = 7'h0f;
    stim[17] = 7'h48;
    stim[18] = 7'h24;
    stim[19] = 7'h1c;
    stim[20] = 7'h21;
    stim[21] = 7'h61;
    stim[22] = 7'h7c;
    stim[23] = 7'h0d;
    stim[24] = 7'h12;
    stim[25] = 7'h21;
    stim[26] = 7'h00;
    stim[27] = 7'h65;
    stim[28] = 7'h66;
    stim[29] = 7'h02;
    stim[30] = 7'h56;
    stim[31] = 7'h60;
    stim[32] = 7'h54;
    stim[33] = 7'h3c;
    stim[34] = 7'h0b;
    stim[35] = 7'h16;
    stim[36] = 7'h56;
    stim[37] = 7'h26;
    stim[38] = 7'h21;
    stim[39] = 7'h7e;
    stim[40] = 7'h40;
    stim[41] = 7'h44;
    stim[42] = 7'h56;
    stim[43] = 7'h2a;
    stim[44] = 7'h3f;
    stim[45] = 7'h5a;
    stim[46] = 7'h67;
    stim[47] = 7'h3e;
    stim[48] = 7'h67;
    stim[49] = 7'h78;
    stim[50] = 7'h01;
    stim[51] = 7'h52;
    stim[52] = 7'h6c;
    stim[53] = 7'h70;
    stim[54] = 7'h2c;
    stim[55] = 7'h1d;
    stim[56] = 7'h19;
    stim[57] = 7'h18;
    stim[58] = 7'h0a;
    stim[59] = 7'h6f;
    stim[60] = 7'h6c;
    stim[61] = 7'h3f;
    stim[62] = 7'h65;
    stim[63] = 7'h43;
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
      expv[0] = 19'h27f90;
      expv[1] = 19'h07f81;
      expv[2] = 19'h00000;
      expv[3] = 19'h0ff82;
      expv[4] = 19'h2ffa0;
      expv[5] = 19'h17f84;
      expv[6] = 19'h1ff88;
      expv[7] = 19'h07f81;
      expv[8] = 19'h0ff82;
      expv[9] = 19'h0ff82;
      expv[10] = 19'h07f81;
      expv[11] = 19'h0ff82;
      expv[12] = 19'h17f84;
      expv[13] = 19'h2ffa0;
      expv[14] = 19'h07f81;
      expv[15] = 19'h07f81;
      expv[16] = 19'h1ff88;
      expv[17] = 19'h07f81;
      expv[18] = 19'h0ff82;
      expv[19] = 19'h17f84;
      expv[20] = 19'h0ff82;
      expv[21] = 19'h07f81;
      expv[22] = 19'h07f81;
      expv[23] = 19'h1ff88;
      expv[24] = 19'h17f84;
      expv[25] = 19'h0ff82;
      expv[26] = 19'h00000;
      expv[27] = 19'h07f81;
      expv[28] = 19'h07f81;
      expv[29] = 19'h2ffa0;
      expv[30] = 19'h07f81;
      expv[31] = 19'h07f81;
      expv[32] = 19'h07f81;
      expv[33] = 19'h0ff82;
      expv[34] = 19'h1ff88;
      expv[35] = 19'h17f84;
      expv[36] = 19'h07f81;
      expv[37] = 19'h0ff82;
      expv[38] = 19'h0ff82;
      expv[39] = 19'h07f81;
      expv[40] = 19'h07f81;
      expv[41] = 19'h07f81;
      expv[42] = 19'h07f81;
      expv[43] = 19'h0ff82;
      expv[44] = 19'h0ff82;
      expv[45] = 19'h07f81;
      expv[46] = 19'h07f81;
      expv[47] = 19'h0ff82;
      expv[48] = 19'h07f81;
      expv[49] = 19'h07f81;
      expv[50] = 19'h37fc0;
      expv[51] = 19'h07f81;
      expv[52] = 19'h07f81;
      expv[53] = 19'h07f81;
      expv[54] = 19'h0ff82;
      expv[55] = 19'h17f84;
      expv[56] = 19'h17f84;
      expv[57] = 19'h17f84;
      expv[58] = 19'h1ff88;
      expv[59] = 19'h07f81;
      expv[60] = 19'h07f81;
      expv[61] = 19'h0ff82;
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
