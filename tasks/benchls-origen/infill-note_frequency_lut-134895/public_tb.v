// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134895 dut (
    .clk(clk),
    .note(in_vec[8:0]),
    .frequency(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h19e;
    stim[1] = 9'h08b;
    stim[2] = 9'h134;
    stim[3] = 9'h033;
    stim[4] = 9'h1d5;
    stim[5] = 9'h036;
    stim[6] = 9'h078;
    stim[7] = 9'h060;
    stim[8] = 9'h02e;
    stim[9] = 9'h028;
    stim[10] = 9'h083;
    stim[11] = 9'h113;
    stim[12] = 9'h15c;
    stim[13] = 9'h094;
    stim[14] = 9'h006;
    stim[15] = 9'h014;
    stim[16] = 9'h016;
    stim[17] = 9'h0b2;
    stim[18] = 9'h0ed;
    stim[19] = 9'h02d;
    stim[20] = 9'h0a8;
    stim[21] = 9'h133;
    stim[22] = 9'h04e;
    stim[23] = 9'h176;
    stim[24] = 9'h000;
    stim[25] = 9'h0c2;
    stim[26] = 9'h154;
    stim[27] = 9'h1e7;
    stim[28] = 9'h080;
    stim[29] = 9'h10c;
    stim[30] = 9'h0f6;
    stim[31] = 9'h0b5;
    stim[32] = 9'h0cc;
    stim[33] = 9'h15e;
    stim[34] = 9'h187;
    stim[35] = 9'h168;
    stim[36] = 9'h0d7;
    stim[37] = 9'h029;
    stim[38] = 9'h1b6;
    stim[39] = 9'h16d;
    stim[40] = 9'h0df;
    stim[41] = 9'h1a1;
    stim[42] = 9'h127;
    stim[43] = 9'h033;
    stim[44] = 9'h1ad;
    stim[45] = 9'h0d6;
    stim[46] = 9'h12d;
    stim[47] = 9'h0fe;
    stim[48] = 9'h099;
    stim[49] = 9'h1c3;
    stim[50] = 9'h064;
    stim[51] = 9'h0c0;
    stim[52] = 9'h01f;
    stim[53] = 9'h0e2;
    stim[54] = 9'h07b;
    stim[55] = 9'h02a;
    stim[56] = 9'h16a;
    stim[57] = 9'h1f4;
    stim[58] = 9'h131;
    stim[59] = 9'h129;
    stim[60] = 9'h065;
    stim[61] = 9'h151;
    stim[62] = 9'h1f6;
    stim[63] = 9'h051;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h0000004b;
      expv[5] = 32'h00000000;
      expv[6] = 32'h0000005a;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000038;
      expv[10] = 32'h00000028;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000005;
      expv[16] = 32'h0000000c;
      expv[17] = 32'h0000000e;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000035;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000003;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h0000002a;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h0000004b;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000017;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h0000002d;
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
