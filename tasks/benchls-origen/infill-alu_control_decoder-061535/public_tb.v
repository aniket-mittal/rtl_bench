// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061535 dut (
    .funct(in_vec[8:3]),
    .aluop(in_vec[2:0]),
    .alucontrol(out_vec[6:2]),
    .ret(out_vec[1:1]),
    .double(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1cd;
    stim[1] = 9'h01f;
    stim[2] = 9'h0a4;
    stim[3] = 9'h0c5;
    stim[4] = 9'h10f;
    stim[5] = 9'h09e;
    stim[6] = 9'h1c3;
    stim[7] = 9'h0da;
    stim[8] = 9'h03a;
    stim[9] = 9'h1c1;
    stim[10] = 9'h110;
    stim[11] = 9'h058;
    stim[12] = 9'h123;
    stim[13] = 9'h067;
    stim[14] = 9'h1ff;
    stim[15] = 9'h146;
    stim[16] = 9'h174;
    stim[17] = 9'h186;
    stim[18] = 9'h1f1;
    stim[19] = 9'h0ab;
    stim[20] = 9'h16c;
    stim[21] = 9'h053;
    stim[22] = 9'h025;
    stim[23] = 9'h1d7;
    stim[24] = 9'h102;
    stim[25] = 9'h1e5;
    stim[26] = 9'h1f7;
    stim[27] = 9'h172;
    stim[28] = 9'h1b6;
    stim[29] = 9'h023;
    stim[30] = 9'h104;
    stim[31] = 9'h0b0;
    stim[32] = 9'h162;
    stim[33] = 9'h03a;
    stim[34] = 9'h0c2;
    stim[35] = 9'h10d;
    stim[36] = 9'h193;
    stim[37] = 9'h12d;
    stim[38] = 9'h14c;
    stim[39] = 9'h0a1;
    stim[40] = 9'h0c0;
    stim[41] = 9'h067;
    stim[42] = 9'h143;
    stim[43] = 9'h1e7;
    stim[44] = 9'h0c5;
    stim[45] = 9'h05e;
    stim[46] = 9'h173;
    stim[47] = 9'h17a;
    stim[48] = 9'h1bc;
    stim[49] = 9'h138;
    stim[50] = 9'h0f7;
    stim[51] = 9'h10d;
    stim[52] = 9'h055;
    stim[53] = 9'h1e3;
    stim[54] = 9'h1c3;
    stim[55] = 9'h1f5;
    stim[56] = 9'h132;
    stim[57] = 9'h042;
    stim[58] = 9'h02d;
    stim[59] = 9'h06d;
    stim[60] = 9'h173;
    stim[61] = 9'h0a6;
    stim[62] = 9'h151;
    stim[63] = 9'h160;
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
      expv[0] = 7'h1c;
      expv[1] = 7'h40;
      expv[2] = 7'h04;
      expv[3] = 7'h1c;
      expv[4] = 7'hxx;
      expv[5] = 7'hxx;
      expv[6] = 7'h00;
      expv[7] = 7'hxx;
      expv[8] = 7'hxx;
      expv[9] = 7'h18;
      expv[10] = 7'h08;
      expv[11] = 7'h08;
      expv[12] = 7'h00;
      expv[13] = 7'hxx;
      expv[14] = 7'hxx;
      expv[15] = 7'hxx;
      expv[16] = 7'h04;
      expv[17] = 7'hxx;
      expv[18] = 7'h18;
      expv[19] = 7'h00;
      expv[20] = 7'h04;
      expv[21] = 7'h00;
      expv[22] = 7'h1c;
      expv[23] = 7'hxx;
      expv[24] = 7'h08;
      expv[25] = 7'h1c;
      expv[26] = 7'hxx;
      expv[27] = 7'hxx;
      expv[28] = 7'hxx;
      expv[29] = 7'h00;
      expv[30] = 7'h04;
      expv[31] = 7'h08;
      expv[32] = 7'hxx;
      expv[33] = 7'hxx;
      expv[34] = 7'h25;
      expv[35] = 7'h1c;
      expv[36] = 7'h00;
      expv[37] = 7'h1c;
      expv[38] = 7'h04;
      expv[39] = 7'h18;
      expv[40] = 7'h08;
      expv[41] = 7'hxx;
      expv[42] = 7'h00;
      expv[43] = 7'hxx;
      expv[44] = 7'h1c;
      expv[45] = 7'hxx;
      expv[46] = 7'h00;
      expv[47] = 7'hxx;
      expv[48] = 7'h04;
      expv[49] = 7'h08;
      expv[50] = 7'hxx;
      expv[51] = 7'h1c;
      expv[52] = 7'h1c;
      expv[53] = 7'h00;
      expv[54] = 7'h00;
      expv[55] = 7'h1c;
      expv[56] = 7'hxx;
      expv[57] = 7'h22;
      expv[58] = 7'h1c;
      expv[59] = 7'h1c;
      expv[60] = 7'h00;
      expv[61] = 7'hxx;
      expv[62] = 7'h18;
      expv[63] = 7'h08;
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
