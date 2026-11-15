// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174084 dut (
    .ALUOp(in_vec[9:6]),
    .insFunction(in_vec[5:0]),
    .ALUControl(out_vec[4:1]),
    .ShamtCtrl(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h032;
    stim[1] = 10'h1a4;
    stim[2] = 10'h28c;
    stim[3] = 10'h336;
    stim[4] = 10'h2db;
    stim[5] = 10'h001;
    stim[6] = 10'h107;
    stim[7] = 10'h270;
    stim[8] = 10'h3b9;
    stim[9] = 10'h318;
    stim[10] = 10'h1bd;
    stim[11] = 10'h37d;
    stim[12] = 10'h1b9;
    stim[13] = 10'h1f9;
    stim[14] = 10'h38c;
    stim[15] = 10'h2d1;
    stim[16] = 10'h092;
    stim[17] = 10'h1f8;
    stim[18] = 10'h344;
    stim[19] = 10'h161;
    stim[20] = 10'h1dc;
    stim[21] = 10'h1d1;
    stim[22] = 10'h012;
    stim[23] = 10'h153;
    stim[24] = 10'h3d5;
    stim[25] = 10'h2ed;
    stim[26] = 10'h12c;
    stim[27] = 10'h3a7;
    stim[28] = 10'h380;
    stim[29] = 10'h218;
    stim[30] = 10'h1cf;
    stim[31] = 10'h222;
    stim[32] = 10'h048;
    stim[33] = 10'h361;
    stim[34] = 10'h237;
    stim[35] = 10'h168;
    stim[36] = 10'h1c2;
    stim[37] = 10'h383;
    stim[38] = 10'h17e;
    stim[39] = 10'h3d1;
    stim[40] = 10'h23d;
    stim[41] = 10'h224;
    stim[42] = 10'h256;
    stim[43] = 10'h2c0;
    stim[44] = 10'h066;
    stim[45] = 10'h154;
    stim[46] = 10'h069;
    stim[47] = 10'h339;
    stim[48] = 10'h087;
    stim[49] = 10'h16a;
    stim[50] = 10'h15a;
    stim[51] = 10'h3e7;
    stim[52] = 10'h216;
    stim[53] = 10'h16e;
    stim[54] = 10'h049;
    stim[55] = 10'h2c8;
    stim[56] = 10'h3d6;
    stim[57] = 10'h035;
    stim[58] = 10'h2c5;
    stim[59] = 10'h29f;
    stim[60] = 10'h036;
    stim[61] = 10'h1c3;
    stim[62] = 10'h274;
    stim[63] = 10'h248;
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
      expv[0] = 5'h04;
      expv[1] = 5'h08;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h04;
      expv[6] = 5'h02;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h08;
      expv[11] = 5'h00;
      expv[12] = 5'h08;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h06;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h04;
      expv[23] = 5'h06;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h02;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h0c;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h06;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h06;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h0c;
      expv[45] = 5'h06;
      expv[46] = 5'h0c;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h06;
      expv[50] = 5'h06;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h06;
      expv[54] = 5'h0c;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h04;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h04;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
