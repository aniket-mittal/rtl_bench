// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mux8to1 dut (
    .W(in_vec[10:3]),
    .S(in_vec[2:0]),
    .f(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4b7;
    stim[1] = 11'h1f5;
    stim[2] = 11'h53c;
    stim[3] = 11'h048;
    stim[4] = 11'h479;
    stim[5] = 11'h55d;
    stim[6] = 11'h2b3;
    stim[7] = 11'h3dc;
    stim[8] = 11'h4a0;
    stim[9] = 11'h6c5;
    stim[10] = 11'h1b4;
    stim[11] = 11'h029;
    stim[12] = 11'h75e;
    stim[13] = 11'h287;
    stim[14] = 11'h3aa;
    stim[15] = 11'h220;
    stim[16] = 11'h21f;
    stim[17] = 11'h4f3;
    stim[18] = 11'h4d4;
    stim[19] = 11'h494;
    stim[20] = 11'h71b;
    stim[21] = 11'h6c0;
    stim[22] = 11'h513;
    stim[23] = 11'h7e3;
    stim[24] = 11'h430;
    stim[25] = 11'h4b3;
    stim[26] = 11'h7b9;
    stim[27] = 11'h6ba;
    stim[28] = 11'h0a2;
    stim[29] = 11'h435;
    stim[30] = 11'h15d;
    stim[31] = 11'h66a;
    stim[32] = 11'h5c1;
    stim[33] = 11'h384;
    stim[34] = 11'h173;
    stim[35] = 11'h773;
    stim[36] = 11'h67a;
    stim[37] = 11'h70f;
    stim[38] = 11'h0af;
    stim[39] = 11'h39f;
    stim[40] = 11'h4fa;
    stim[41] = 11'h741;
    stim[42] = 11'h418;
    stim[43] = 11'h357;
    stim[44] = 11'h522;
    stim[45] = 11'h44f;
    stim[46] = 11'h1a5;
    stim[47] = 11'h11a;
    stim[48] = 11'h794;
    stim[49] = 11'h4ef;
    stim[50] = 11'h41e;
    stim[51] = 11'h541;
    stim[52] = 11'h415;
    stim[53] = 11'h21d;
    stim[54] = 11'h366;
    stim[55] = 11'h0b7;
    stim[56] = 11'h6b3;
    stim[57] = 11'h44c;
    stim[58] = 11'h5ae;
    stim[59] = 11'h481;
    stim[60] = 11'h331;
    stim[61] = 11'h7fa;
    stim[62] = 11'h33c;
    stim[63] = 11'h1ff;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
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
