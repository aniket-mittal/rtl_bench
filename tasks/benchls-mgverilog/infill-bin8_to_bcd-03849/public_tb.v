// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03849 dut (
    .clk(clk),
    .count(in_vec[8:1]),
    .calculate(in_vec[0:0]),
    .centenas(out_vec[14:11]),
    .decenas(out_vec[10:7]),
    .unidades(out_vec[6:3]),
    .C(out_vec[2:2]),
    .De(out_vec[1:1]),
    .U(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h129;
    stim[1] = 9'h1f7;
    stim[2] = 9'h0d0;
    stim[3] = 9'h121;
    stim[4] = 9'h0bb;
    stim[5] = 9'h11b;
    stim[6] = 9'h02f;
    stim[7] = 9'h0e4;
    stim[8] = 9'h0c1;
    stim[9] = 9'h0d6;
    stim[10] = 9'h041;
    stim[11] = 9'h02d;
    stim[12] = 9'h17c;
    stim[13] = 9'h14f;
    stim[14] = 9'h1b9;
    stim[15] = 9'h0f0;
    stim[16] = 9'h094;
    stim[17] = 9'h199;
    stim[18] = 9'h051;
    stim[19] = 9'h00d;
    stim[20] = 9'h043;
    stim[21] = 9'h164;
    stim[22] = 9'h1d2;
    stim[23] = 9'h1a5;
    stim[24] = 9'h1b6;
    stim[25] = 9'h0ae;
    stim[26] = 9'h1c5;
    stim[27] = 9'h151;
    stim[28] = 9'h104;
    stim[29] = 9'h1f7;
    stim[30] = 9'h00d;
    stim[31] = 9'h1ca;
    stim[32] = 9'h03a;
    stim[33] = 9'h1b4;
    stim[34] = 9'h130;
    stim[35] = 9'h1c3;
    stim[36] = 9'h089;
    stim[37] = 9'h045;
    stim[38] = 9'h04c;
    stim[39] = 9'h06d;
    stim[40] = 9'h08d;
    stim[41] = 9'h04e;
    stim[42] = 9'h092;
    stim[43] = 9'h0eb;
    stim[44] = 9'h1a5;
    stim[45] = 9'h004;
    stim[46] = 9'h091;
    stim[47] = 9'h16d;
    stim[48] = 9'h00f;
    stim[49] = 9'h17f;
    stim[50] = 9'h158;
    stim[51] = 9'h192;
    stim[52] = 9'h112;
    stim[53] = 9'h0bc;
    stim[54] = 9'h052;
    stim[55] = 9'h155;
    stim[56] = 9'h137;
    stim[57] = 9'h11b;
    stim[58] = 9'h0b0;
    stim[59] = 9'h190;
    stim[60] = 9'h1b8;
    stim[61] = 9'h00e;
    stim[62] = 9'h1ff;
    stim[63] = 9'h1ca;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0800;
      expv[2] = 15'h0880;
      expv[3] = 15'h0000;
      expv[4] = 15'h0800;
      expv[5] = 15'h0880;
      expv[6] = 15'h0900;
      expv[7] = 15'h0980;
      expv[8] = 15'h0000;
      expv[9] = 15'h0080;
      expv[10] = 15'h0000;
      expv[11] = 15'h0080;
      expv[12] = 15'h0100;
      expv[13] = 15'h0000;
      expv[14] = 15'h0800;
      expv[15] = 15'h0880;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0800;
      expv[19] = 15'h1000;
      expv[20] = 15'h1025;
      expv[21] = 15'h1025;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0800;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0800;
      expv[28] = 15'h1000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0800;
      expv[31] = 15'h1000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0800;
      expv[37] = 15'h1000;
      expv[38] = 15'h1080;
      expv[39] = 15'h0000;
      expv[40] = 15'h0080;
      expv[41] = 15'h0100;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0800;
      expv[45] = 15'h0880;
      expv[46] = 15'h0000;
      expv[47] = 15'h0080;
      expv[48] = 15'h0100;
      expv[49] = 15'h0180;
      expv[50] = 15'h0200;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0800;
      expv[57] = 15'h0880;
      expv[58] = 15'h0900;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0800;
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
