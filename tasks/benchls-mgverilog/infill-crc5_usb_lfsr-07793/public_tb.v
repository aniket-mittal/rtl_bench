// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07793 dut (
    .clk(clk),
    .data_in(in_vec[12:2]),
    .crc_en(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .crc_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0329;
    stim[1] = 13'h1851;
    stim[2] = 13'h0a3e;
    stim[3] = 13'h0b31;
    stim[4] = 13'h1a14;
    stim[5] = 13'h0960;
    stim[6] = 13'h02c2;
    stim[7] = 13'h127c;
    stim[8] = 13'h1c10;
    stim[9] = 13'h1e16;
    stim[10] = 13'h0df4;
    stim[11] = 13'h0884;
    stim[12] = 13'h0bee;
    stim[13] = 13'h0df2;
    stim[14] = 13'h09e4;
    stim[15] = 13'h0252;
    stim[16] = 13'h18e2;
    stim[17] = 13'h176a;
    stim[18] = 13'h0255;
    stim[19] = 13'h1594;
    stim[20] = 13'h09b8;
    stim[21] = 13'h0378;
    stim[22] = 13'h1d16;
    stim[23] = 13'h0c3e;
    stim[24] = 13'h1fb2;
    stim[25] = 13'h134a;
    stim[26] = 13'h0d10;
    stim[27] = 13'h0dcc;
    stim[28] = 13'h032e;
    stim[29] = 13'h02ce;
    stim[30] = 13'h10c2;
    stim[31] = 13'h1544;
    stim[32] = 13'h0d56;
    stim[33] = 13'h0cf8;
    stim[34] = 13'h135e;
    stim[35] = 13'h194c;
    stim[36] = 13'h14bc;
    stim[37] = 13'h044c;
    stim[38] = 13'h02cc;
    stim[39] = 13'h1f04;
    stim[40] = 13'h043e;
    stim[41] = 13'h1ede;
    stim[42] = 13'h0a9a;
    stim[43] = 13'h1d52;
    stim[44] = 13'h080a;
    stim[45] = 13'h160a;
    stim[46] = 13'h0f46;
    stim[47] = 13'h1ad6;
    stim[48] = 13'h06ac;
    stim[49] = 13'h1dcd;
    stim[50] = 13'h10ba;
    stim[51] = 13'h11b4;
    stim[52] = 13'h1d8c;
    stim[53] = 13'h1c7e;
    stim[54] = 13'h036c;
    stim[55] = 13'h198e;
    stim[56] = 13'h1340;
    stim[57] = 13'h1056;
    stim[58] = 13'h0ed4;
    stim[59] = 13'h1082;
    stim[60] = 13'h0464;
    stim[61] = 13'h0fd6;
    stim[62] = 13'h051c;
    stim[63] = 13'h1ac2;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h0d;
      expv[8] = 5'h0d;
      expv[9] = 5'h0d;
      expv[10] = 5'h0f;
      expv[11] = 5'h0f;
      expv[12] = 5'h0f;
      expv[13] = 5'h1d;
      expv[14] = 5'h05;
      expv[15] = 5'h05;
      expv[16] = 5'h13;
      expv[17] = 5'h1a;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h1f;
      expv[25] = 5'h00;
      expv[26] = 5'h0e;
      expv[27] = 5'h0e;
      expv[28] = 5'h0e;
      expv[29] = 5'h0c;
      expv[30] = 5'h03;
      expv[31] = 5'h15;
      expv[32] = 5'h15;
      expv[33] = 5'h01;
      expv[34] = 5'h01;
      expv[35] = 5'h18;
      expv[36] = 5'h18;
      expv[37] = 5'h18;
      expv[38] = 5'h18;
      expv[39] = 5'h18;
      expv[40] = 5'h18;
      expv[41] = 5'h00;
      expv[42] = 5'h08;
      expv[43] = 5'h09;
      expv[44] = 5'h05;
      expv[45] = 5'h04;
      expv[46] = 5'h13;
      expv[47] = 5'h09;
      expv[48] = 5'h04;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h15;
      expv[52] = 5'h15;
      expv[53] = 5'h15;
      expv[54] = 5'h1e;
      expv[55] = 5'h1e;
      expv[56] = 5'h03;
      expv[57] = 5'h03;
      expv[58] = 5'h15;
      expv[59] = 5'h15;
      expv[60] = 5'h02;
      expv[61] = 5'h02;
      expv[62] = 5'h14;
      expv[63] = 5'h14;
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
