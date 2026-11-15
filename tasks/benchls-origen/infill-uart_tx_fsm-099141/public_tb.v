// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099141 dut (
    .clk(clk),
    .enter(in_vec[8:8]),
    .B(in_vec[7:0]),
    .sr_sel(out_vec[4:3]),
    .acc_ld(out_vec[2:2]),
    .acc_clr(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h174;
    stim[1] = 9'h02a;
    stim[2] = 9'h1fb;
    stim[3] = 9'h044;
    stim[4] = 9'h0a3;
    stim[5] = 9'h1f0;
    stim[6] = 9'h166;
    stim[7] = 9'h0f8;
    stim[8] = 9'h1cf;
    stim[9] = 9'h123;
    stim[10] = 9'h113;
    stim[11] = 9'h025;
    stim[12] = 9'h0d0;
    stim[13] = 9'h1eb;
    stim[14] = 9'h117;
    stim[15] = 9'h0b6;
    stim[16] = 9'h1c4;
    stim[17] = 9'h17c;
    stim[18] = 9'h194;
    stim[19] = 9'h1a6;
    stim[20] = 9'h105;
    stim[21] = 9'h130;
    stim[22] = 9'h092;
    stim[23] = 9'h1f8;
    stim[24] = 9'h03b;
    stim[25] = 9'h1c8;
    stim[26] = 9'h1ae;
    stim[27] = 9'h187;
    stim[28] = 9'h1ca;
    stim[29] = 9'h007;
    stim[30] = 9'h09d;
    stim[31] = 9'h1be;
    stim[32] = 9'h176;
    stim[33] = 9'h1ae;
    stim[34] = 9'h0a0;
    stim[35] = 9'h056;
    stim[36] = 9'h1ae;
    stim[37] = 9'h125;
    stim[38] = 9'h093;
    stim[39] = 9'h09f;
    stim[40] = 9'h18c;
    stim[41] = 9'h086;
    stim[42] = 9'h0ed;
    stim[43] = 9'h155;
    stim[44] = 9'h025;
    stim[45] = 9'h185;
    stim[46] = 9'h057;
    stim[47] = 9'h0e2;
    stim[48] = 9'h1c2;
    stim[49] = 9'h028;
    stim[50] = 9'h0ea;
    stim[51] = 9'h00b;
    stim[52] = 9'h128;
    stim[53] = 9'h0d2;
    stim[54] = 9'h006;
    stim[55] = 9'h0c6;
    stim[56] = 9'h0b7;
    stim[57] = 9'h089;
    stim[58] = 9'h08a;
    stim[59] = 9'h08c;
    stim[60] = 9'h1ae;
    stim[61] = 9'h11b;
    stim[62] = 9'h00b;
    stim[63] = 9'h12d;
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
      expv[3] = 5'h0a;
      expv[4] = 5'h14;
      expv[5] = 5'h10;
      expv[6] = 5'h14;
      expv[7] = 5'h14;
      expv[8] = 5'h10;
      expv[9] = 5'h14;
      expv[10] = 5'h10;
      expv[11] = 5'h10;
      expv[12] = 5'h01;
      expv[13] = 5'h00;
      expv[14] = 5'h0a;
      expv[15] = 5'h10;
      expv[16] = 5'h10;
      expv[17] = 5'h14;
      expv[18] = 5'h10;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h10;
      expv[22] = 5'h14;
      expv[23] = 5'h01;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h0a;
      expv[27] = 5'h14;
      expv[28] = 5'h14;
      expv[29] = 5'h14;
      expv[30] = 5'h14;
      expv[31] = 5'h14;
      expv[32] = 5'h14;
      expv[33] = 5'h10;
      expv[34] = 5'h14;
      expv[35] = 5'h01;
      expv[36] = 5'h00;
      expv[37] = 5'h0a;
      expv[38] = 5'h14;
      expv[39] = 5'h14;
      expv[40] = 5'h14;
      expv[41] = 5'h10;
      expv[42] = 5'h10;
      expv[43] = 5'h10;
      expv[44] = 5'h10;
      expv[45] = 5'h14;
      expv[46] = 5'h01;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h0a;
      expv[50] = 5'h10;
      expv[51] = 5'h14;
      expv[52] = 5'h10;
      expv[53] = 5'h10;
      expv[54] = 5'h10;
      expv[55] = 5'h10;
      expv[56] = 5'h10;
      expv[57] = 5'h14;
      expv[58] = 5'h01;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h0a;
      expv[62] = 5'h14;
      expv[63] = 5'h10;
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
