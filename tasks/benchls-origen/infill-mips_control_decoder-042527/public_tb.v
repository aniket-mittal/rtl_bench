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
    stim[0] = 32'h51b20956;
    stim[1] = 32'h91b63802;
    stim[2] = 32'hbd728383;
    stim[3] = 32'h32afa6c0;
    stim[4] = 32'ha310d275;
    stim[5] = 32'hb2949a0d;
    stim[6] = 32'h48be07b3;
    stim[7] = 32'hd2b3ced3;
    stim[8] = 32'hb890c185;
    stim[9] = 32'h16d51364;
    stim[10] = 32'h9bc5163f;
    stim[11] = 32'hc823dde2;
    stim[12] = 32'h044b2a9b;
    stim[13] = 32'h9cfacbe8;
    stim[14] = 32'hae92a3ce;
    stim[15] = 32'h08832bd8;
    stim[16] = 32'hfd669f4c;
    stim[17] = 32'hf0196c4b;
    stim[18] = 32'h61b467a4;
    stim[19] = 32'h8465a5dd;
    stim[20] = 32'h2ff5f095;
    stim[21] = 32'h9231dff8;
    stim[22] = 32'hfc337189;
    stim[23] = 32'h0fe5bacf;
    stim[24] = 32'hf72f2808;
    stim[25] = 32'habaccd24;
    stim[26] = 32'hbc8d4734;
    stim[27] = 32'ha47e6029;
    stim[28] = 32'he5580d6e;
    stim[29] = 32'hb95d56e6;
    stim[30] = 32'h97ef7e2f;
    stim[31] = 32'h7e73f908;
    stim[32] = 32'he7e5eea1;
    stim[33] = 32'h24fce153;
    stim[34] = 32'hbef08c2d;
    stim[35] = 32'h8b06950d;
    stim[36] = 32'h4a05717b;
    stim[37] = 32'h2de1a25e;
    stim[38] = 32'ha48d95ff;
    stim[39] = 32'he082b882;
    stim[40] = 32'h41715ac6;
    stim[41] = 32'h32d52a27;
    stim[42] = 32'h6b3fd658;
    stim[43] = 32'hfa95759d;
    stim[44] = 32'hd27ed306;
    stim[45] = 32'hc2b61642;
    stim[46] = 32'hdacb4624;
    stim[47] = 32'h2963cb66;
    stim[48] = 32'h68cd589a;
    stim[49] = 32'h3f69d29e;
    stim[50] = 32'h7662e155;
    stim[51] = 32'heac8aa39;
    stim[52] = 32'h81b60b7a;
    stim[53] = 32'h82af8a2e;
    stim[54] = 32'hd193a635;
    stim[55] = 32'hc6b1b02a;
    stim[56] = 32'h509040b5;
    stim[57] = 32'h6a13fa0f;
    stim[58] = 32'h4e36587b;
    stim[59] = 32'h173b47c9;
    stim[60] = 32'h963f825e;
    stim[61] = 32'h4b240855;
    stim[62] = 32'h206179eb;
    stim[63] = 32'h121334d4;
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
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0440;
      expv[15] = 13'h0010;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h1018;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h11c0;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h1040;
      expv[63] = 13'h0081;
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
