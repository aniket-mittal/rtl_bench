// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190648 dut (
    .a(in_vec[6:4]),
    .b(in_vec[3:1]),
    .S(in_vec[0:0]),
    .G(out_vec[2:2]),
    .E(out_vec[1:1]),
    .L(out_vec[0:0])
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
    stim[1] = 7'h6a;
    stim[2] = 7'h30;
    stim[3] = 7'h10;
    stim[4] = 7'h74;
    stim[5] = 7'h70;
    stim[6] = 7'h33;
    stim[7] = 7'h0e;
    stim[8] = 7'h2d;
    stim[9] = 7'h54;
    stim[10] = 7'h09;
    stim[11] = 7'h17;
    stim[12] = 7'h41;
    stim[13] = 7'h52;
    stim[14] = 7'h15;
    stim[15] = 7'h50;
    stim[16] = 7'h51;
    stim[17] = 7'h6e;
    stim[18] = 7'h18;
    stim[19] = 7'h40;
    stim[20] = 7'h5a;
    stim[21] = 7'h26;
    stim[22] = 7'h52;
    stim[23] = 7'h2d;
    stim[24] = 7'h10;
    stim[25] = 7'h2f;
    stim[26] = 7'h21;
    stim[27] = 7'h66;
    stim[28] = 7'h4b;
    stim[29] = 7'h71;
    stim[30] = 7'h5c;
    stim[31] = 7'h45;
    stim[32] = 7'h58;
    stim[33] = 7'h55;
    stim[34] = 7'h3b;
    stim[35] = 7'h3f;
    stim[36] = 7'h62;
    stim[37] = 7'h35;
    stim[38] = 7'h27;
    stim[39] = 7'h13;
    stim[40] = 7'h46;
    stim[41] = 7'h6e;
    stim[42] = 7'h1c;
    stim[43] = 7'h34;
    stim[44] = 7'h36;
    stim[45] = 7'h47;
    stim[46] = 7'h35;
    stim[47] = 7'h50;
    stim[48] = 7'h4f;
    stim[49] = 7'h2b;
    stim[50] = 7'h2f;
    stim[51] = 7'h5f;
    stim[52] = 7'h17;
    stim[53] = 7'h16;
    stim[54] = 7'h31;
    stim[55] = 7'h25;
    stim[56] = 7'h6a;
    stim[57] = 7'h30;
    stim[58] = 7'h20;
    stim[59] = 7'h1c;
    stim[60] = 7'h13;
    stim[61] = 7'h54;
    stim[62] = 7'h33;
    stim[63] = 7'h72;
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
      expv[0] = 3'h1;
      expv[1] = 3'h4;
      expv[2] = 3'h4;
      expv[3] = 3'h4;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h1;
      expv[9] = 3'h1;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h4;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h4;
      expv[17] = 3'h1;
      expv[18] = 3'h4;
      expv[19] = 3'h1;
      expv[20] = 3'h2;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h4;
      expv[25] = 3'h1;
      expv[26] = 3'h4;
      expv[27] = 3'h1;
      expv[28] = 3'h1;
      expv[29] = 3'h4;
      expv[30] = 3'h1;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h4;
      expv[38] = 3'h1;
      expv[39] = 3'h2;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h2;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h4;
      expv[55] = 3'h2;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h2;
      expv[61] = 3'h1;
      expv[62] = 3'h4;
      expv[63] = 3'h1;
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
