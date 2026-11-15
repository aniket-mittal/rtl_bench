// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_131596 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .instruction(in_vec[31:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h18f7d7842;
    stim[1] = 33'h188f0cff3;
    stim[2] = 33'h0e365108f;
    stim[3] = 33'h04d55a1cd;
    stim[4] = 33'h039388b58;
    stim[5] = 33'h00d2b1303;
    stim[6] = 33'h050d85f03;
    stim[7] = 33'h0cebf3509;
    stim[8] = 33'h0f20e7161;
    stim[9] = 33'h038b0f803;
    stim[10] = 33'h0ddc25e3e;
    stim[11] = 33'h0e5b51df7;
    stim[12] = 33'h0a957fd2e;
    stim[13] = 33'h0130658d9;
    stim[14] = 33'h05333d266;
    stim[15] = 33'h0fb8be37f;
    stim[16] = 33'h03b862d67;
    stim[17] = 33'h0e75274ab;
    stim[18] = 33'h051cf52c1;
    stim[19] = 33'h0583f3f9f;
    stim[20] = 33'h06d123565;
    stim[21] = 33'h0224182c4;
    stim[22] = 33'h079617278;
    stim[23] = 33'h00aa658f4;
    stim[24] = 33'h00ca92bb9;
    stim[25] = 33'h096dfa1f1;
    stim[26] = 33'h0bf914043;
    stim[27] = 33'h0a58f4b4e;
    stim[28] = 33'h0a793e07d;
    stim[29] = 33'h0c0316cd6;
    stim[30] = 33'h0b10ee9ed;
    stim[31] = 33'h04b802a91;
    stim[32] = 33'h0d42f0d96;
    stim[33] = 33'h096f8dfe2;
    stim[34] = 33'h07a3b0e93;
    stim[35] = 33'h0404fb12a;
    stim[36] = 33'h00994f605;
    stim[37] = 33'h0d522e57e;
    stim[38] = 33'h02f87ad4f;
    stim[39] = 33'h0745f30bf;
    stim[40] = 33'h0373a8f61;
    stim[41] = 33'h06ddd58cd;
    stim[42] = 33'h032e54a25;
    stim[43] = 33'h0be3ec063;
    stim[44] = 33'h019d911f1;
    stim[45] = 33'h085e8f7fc;
    stim[46] = 33'h031bbef3b;
    stim[47] = 33'h0deddcd0d;
    stim[48] = 33'h0748a6719;
    stim[49] = 33'h0cdfe1edc;
    stim[50] = 33'h045577488;
    stim[51] = 33'h00c3310f6;
    stim[52] = 33'h0a6e0799b;
    stim[53] = 33'h0eb3b3d70;
    stim[54] = 33'h040debed4;
    stim[55] = 33'h0fbd29af0;
    stim[56] = 33'h0630d5c6f;
    stim[57] = 33'h06116e2b9;
    stim[58] = 33'h0836272ac;
    stim[59] = 33'h0ad06b814;
    stim[60] = 33'h01ce71c6c;
    stim[61] = 33'h0a93c2310;
    stim[62] = 33'h08bba4887;
    stim[63] = 33'h041d5e309;
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
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000002;
      expv[8] = 32'h0000202e;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000004;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'ha77968a2;
      expv[16] = 32'h000045d3;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h117f3bc4;
      expv[25] = 32'h00000000;
      expv[26] = 32'h0000639a;
      expv[27] = 32'h00003862;
      expv[28] = 32'h00000b12;
      expv[29] = 32'h00000000;
      expv[30] = 32'h30b35692;
      expv[31] = 32'h92f272c7;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000001;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h000048ea;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h0000ff99;
      expv[40] = 32'h00000000;
      expv[41] = 32'h202ce5a9;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000002;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000001;
      expv[46] = 32'h00000001;
      expv[47] = 32'hfffff818;
      expv[48] = 32'h00017de4;
      expv[49] = 32'h00000004;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00001d29;
      expv[55] = 32'h4f44e9a0;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h0000f60e;
      expv[62] = 32'h7c69d478;
      expv[63] = 32'hffffff85;
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
