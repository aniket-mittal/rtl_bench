// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01191 dut (
    .clk(clk),
    .piso1(in_vec[9:9]),
    .piso2(in_vec[8:8]),
    .piso3(in_vec[7:7]),
    .piso4(in_vec[6:6]),
    .S1(in_vec[5:5]),
    .B2(in_vec[4:4]),
    .S2(in_vec[3:3]),
    .B3(in_vec[2:2]),
    .S3(in_vec[1:1]),
    .B4(in_vec[0:0]),
    .boton_pres(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3fa;
    stim[1] = 10'h116;
    stim[2] = 10'h1ca;
    stim[3] = 10'h24f;
    stim[4] = 10'h3ef;
    stim[5] = 10'h247;
    stim[6] = 10'h09b;
    stim[7] = 10'h2c2;
    stim[8] = 10'h0e9;
    stim[9] = 10'h072;
    stim[10] = 10'h293;
    stim[11] = 10'h095;
    stim[12] = 10'h0e9;
    stim[13] = 10'h028;
    stim[14] = 10'h1fc;
    stim[15] = 10'h19d;
    stim[16] = 10'h2f0;
    stim[17] = 10'h1ae;
    stim[18] = 10'h08b;
    stim[19] = 10'h342;
    stim[20] = 10'h1a6;
    stim[21] = 10'h286;
    stim[22] = 10'h1ad;
    stim[23] = 10'h0c3;
    stim[24] = 10'h1e0;
    stim[25] = 10'h098;
    stim[26] = 10'h239;
    stim[27] = 10'h3c4;
    stim[28] = 10'h139;
    stim[29] = 10'h1be;
    stim[30] = 10'h053;
    stim[31] = 10'h1c8;
    stim[32] = 10'h30b;
    stim[33] = 10'h0b4;
    stim[34] = 10'h237;
    stim[35] = 10'h340;
    stim[36] = 10'h14a;
    stim[37] = 10'h2f1;
    stim[38] = 10'h054;
    stim[39] = 10'h343;
    stim[40] = 10'h0a1;
    stim[41] = 10'h1e6;
    stim[42] = 10'h08e;
    stim[43] = 10'h1da;
    stim[44] = 10'h1b2;
    stim[45] = 10'h038;
    stim[46] = 10'h12c;
    stim[47] = 10'h10e;
    stim[48] = 10'h25b;
    stim[49] = 10'h28c;
    stim[50] = 10'h05a;
    stim[51] = 10'h257;
    stim[52] = 10'h0c9;
    stim[53] = 10'h0fc;
    stim[54] = 10'h1a7;
    stim[55] = 10'h08c;
    stim[56] = 10'h321;
    stim[57] = 10'h353;
    stim[58] = 10'h166;
    stim[59] = 10'h337;
    stim[60] = 10'h200;
    stim[61] = 10'h21e;
    stim[62] = 10'h31a;
    stim[63] = 10'h1f1;
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
      expv[0] = 4'h0;
      expv[1] = 4'h1;
      expv[2] = 4'h2;
      expv[3] = 4'h2;
      expv[4] = 4'h1;
      expv[5] = 4'h1;
      expv[6] = 4'h1;
      expv[7] = 4'h3;
      expv[8] = 4'h1;
      expv[9] = 4'h3;
      expv[10] = 4'h4;
      expv[11] = 4'h1;
      expv[12] = 4'h3;
      expv[13] = 4'h3;
      expv[14] = 4'h5;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'h1;
      expv[18] = 4'h2;
      expv[19] = 4'h3;
      expv[20] = 4'h1;
      expv[21] = 4'h2;
      expv[22] = 4'h1;
      expv[23] = 4'h2;
      expv[24] = 4'h3;
      expv[25] = 4'h2;
      expv[26] = 4'h3;
      expv[27] = 4'h1;
      expv[28] = 4'h1;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'h4;
      expv[32] = 4'h2;
      expv[33] = 4'h1;
      expv[34] = 4'h3;
      expv[35] = 4'h1;
      expv[36] = 4'h1;
      expv[37] = 4'h2;
      expv[38] = 4'h1;
      expv[39] = 4'h4;
      expv[40] = 4'h1;
      expv[41] = 4'h3;
      expv[42] = 4'h2;
      expv[43] = 4'h3;
      expv[44] = 4'h2;
      expv[45] = 4'h2;
      expv[46] = 4'h5;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'h1;
      expv[50] = 4'h1;
      expv[51] = 4'h4;
      expv[52] = 4'h1;
      expv[53] = 4'h3;
      expv[54] = 4'h3;
      expv[55] = 4'h2;
      expv[56] = 4'h3;
      expv[57] = 4'h1;
      expv[58] = 4'h1;
      expv[59] = 4'h2;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
