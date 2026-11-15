// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00586 dut (
    .clk(clk),
    .address(in_vec[10:9]),
    .in_port(in_vec[8:1]),
    .reset_n(in_vec[0:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h0ba;
    stim[1] = 11'h022;
    stim[2] = 11'h0d7;
    stim[3] = 11'h0cb;
    stim[4] = 11'h06b;
    stim[5] = 11'h7b3;
    stim[6] = 11'h039;
    stim[7] = 11'h587;
    stim[8] = 11'h201;
    stim[9] = 11'h51d;
    stim[10] = 11'h249;
    stim[11] = 11'h7a3;
    stim[12] = 11'h64d;
    stim[13] = 11'h39b;
    stim[14] = 11'h3b1;
    stim[15] = 11'h051;
    stim[16] = 11'h753;
    stim[17] = 11'h62b;
    stim[18] = 11'h58f;
    stim[19] = 11'h261;
    stim[20] = 11'h5d5;
    stim[21] = 11'h443;
    stim[22] = 11'h15f;
    stim[23] = 11'h0eb;
    stim[24] = 11'h771;
    stim[25] = 11'h765;
    stim[26] = 11'h0c3;
    stim[27] = 11'h7c9;
    stim[28] = 11'h16d;
    stim[29] = 11'h46d;
    stim[30] = 11'h129;
    stim[31] = 11'h6f1;
    stim[32] = 11'h241;
    stim[33] = 11'h3bb;
    stim[34] = 11'h627;
    stim[35] = 11'h349;
    stim[36] = 11'h7e5;
    stim[37] = 11'h4c7;
    stim[38] = 11'h10d;
    stim[39] = 11'h5bb;
    stim[40] = 11'h0c1;
    stim[41] = 11'h459;
    stim[42] = 11'h643;
    stim[43] = 11'h1e7;
    stim[44] = 11'h005;
    stim[45] = 11'h4c3;
    stim[46] = 11'h75f;
    stim[47] = 11'h0e9;
    stim[48] = 11'h71f;
    stim[49] = 11'h0c1;
    stim[50] = 11'h759;
    stim[51] = 11'h523;
    stim[52] = 11'h6b1;
    stim[53] = 11'h2c5;
    stim[54] = 11'h40b;
    stim[55] = 11'h43b;
    stim[56] = 11'h375;
    stim[57] = 11'h489;
    stim[58] = 11'h391;
    stim[59] = 11'h43d;
    stim[60] = 11'h6db;
    stim[61] = 11'h07c;
    stim[62] = 11'h287;
    stim[63] = 11'h68f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h0000006b;
      expv[4] = 32'h00000065;
      expv[5] = 32'h00000035;
      expv[6] = 32'h00000000;
      expv[7] = 32'h0000001c;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000028;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h000000af;
      expv[24] = 32'h00000075;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000061;
      expv[28] = 32'h00000000;
      expv[29] = 32'h000000b6;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000094;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000086;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000060;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h000000f3;
      expv[45] = 32'h00000002;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000074;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000060;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
