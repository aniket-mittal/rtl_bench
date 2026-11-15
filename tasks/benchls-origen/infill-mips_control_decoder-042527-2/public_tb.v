// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042527 dut (
    .Instruction(in_vec[31:0]),
    .RegWriteD(out_vec[12:12]),
    .MemtoRegD(out_vec[11:11]),
    .MemWriteD(out_vec[10:10]),
    .ALUCtrlD(out_vec[9:7]),
    .ALUSrcD(out_vec[6:6]),
    .RegDstD(out_vec[5:5]),
    .JumpToTargetD(out_vec[4:4]),
    .JumpAndLinkD(out_vec[3:3]),
    .JumpRegD(out_vec[2:2]),
    .BgtzD(out_vec[1:1]),
    .BeqD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hdcfc1ad7;
    stim[1] = 32'hd7911a1b;
    stim[2] = 32'h0e139751;
    stim[3] = 32'h239ce81b;
    stim[4] = 32'hc60bd280;
    stim[5] = 32'h87e1d48c;
    stim[6] = 32'hc491af64;
    stim[7] = 32'h9108b316;
    stim[8] = 32'h8bfc3868;
    stim[9] = 32'h2c649da9;
    stim[10] = 32'h87cc850b;
    stim[11] = 32'h497d2a5a;
    stim[12] = 32'h50cb75cb;
    stim[13] = 32'h0934532c;
    stim[14] = 32'hcac58b40;
    stim[15] = 32'hed2e4656;
    stim[16] = 32'h38f00785;
    stim[17] = 32'h30077f1e;
    stim[18] = 32'h0163c53f;
    stim[19] = 32'hf1a2337c;
    stim[20] = 32'h9e71edc7;
    stim[21] = 32'hba5644c6;
    stim[22] = 32'h3c006572;
    stim[23] = 32'h4e81d564;
    stim[24] = 32'h33fe10a7;
    stim[25] = 32'haea891a4;
    stim[26] = 32'heee67b3e;
    stim[27] = 32'h03d5296c;
    stim[28] = 32'hd62b870b;
    stim[29] = 32'hcd037c85;
    stim[30] = 32'h50c62aa9;
    stim[31] = 32'h5215c289;
    stim[32] = 32'h100094c5;
    stim[33] = 32'h834bc336;
    stim[34] = 32'hf8ef739f;
    stim[35] = 32'hc8dddcaf;
    stim[36] = 32'h0f157e06;
    stim[37] = 32'h046bcebc;
    stim[38] = 32'h47c9d6d0;
    stim[39] = 32'h6e526820;
    stim[40] = 32'he106af38;
    stim[41] = 32'h4eb19540;
    stim[42] = 32'hb1f5fd2a;
    stim[43] = 32'h55dd31ef;
    stim[44] = 32'hed682a2b;
    stim[45] = 32'h6f4dbe58;
    stim[46] = 32'h8e4ebf12;
    stim[47] = 32'h5a98b6b8;
    stim[48] = 32'hb67d46d0;
    stim[49] = 32'h3cb794bc;
    stim[50] = 32'h3d33e942;
    stim[51] = 32'h3954df8e;
    stim[52] = 32'h2bb72db1;
    stim[53] = 32'h3bd85826;
    stim[54] = 32'h231bf885;
    stim[55] = 32'h489430c0;
    stim[56] = 32'h260da432;
    stim[57] = 32'h5819b2f3;
    stim[58] = 32'h5ecdf206;
    stim[59] = 32'h769345ca;
    stim[60] = 32'he6cd0b07;
    stim[61] = 32'h7a75aebe;
    stim[62] = 32'hf03358f9;
    stim[63] = 32'hd392257a;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h1018;
      expv[3] = 13'h1040;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0010;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h11c0;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0440;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0081;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h1018;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h1840;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h11c0;
      expv[50] = 13'h11c0;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h1040;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
