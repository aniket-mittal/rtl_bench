// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06694 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[41:32]),
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
    stim[0] = 37'h1c86ed1ef3;
    stim[1] = 37'h1557b7cb90;
    stim[2] = 37'h12b3dcb0ff;
    stim[3] = 37'h1a4731c398;
    stim[4] = 37'h0614872e7d;
    stim[5] = 37'h032fa7db31;
    stim[6] = 37'h1ee6f954e9;
    stim[7] = 37'h13f09ed382;
    stim[8] = 37'h12e2e22388;
    stim[9] = 37'h12501aeef5;
    stim[10] = 37'h1e828bd08c;
    stim[11] = 37'h0e9fe9e07f;
    stim[12] = 37'h037c887285;
    stim[13] = 37'h1b8b337317;
    stim[14] = 37'h12d3066dbb;
    stim[15] = 37'h1a6fe4edf1;
    stim[16] = 37'h12a6667849;
    stim[17] = 37'h1bbc07747a;
    stim[18] = 37'h0f23a2096f;
    stim[19] = 37'h160ccb2ce8;
    stim[20] = 37'h0e3d5d8ff1;
    stim[21] = 37'h02f182b72f;
    stim[22] = 37'h0beb29eaeb;
    stim[23] = 37'h1e7b98dff1;
    stim[24] = 37'h1ad4083764;
    stim[25] = 37'h1fbccdf9e3;
    stim[26] = 37'h0fb8debdc4;
    stim[27] = 37'h160910d245;
    stim[28] = 37'h1369c0f18b;
    stim[29] = 37'h0704e7d51b;
    stim[30] = 37'h1a69045e3c;
    stim[31] = 37'h06036b7cea;
    stim[32] = 37'h029b823bce;
    stim[33] = 37'h068555f038;
    stim[34] = 37'h03ee358096;
    stim[35] = 37'h07603a4c5a;
    stim[36] = 37'h065a017b0e;
    stim[37] = 37'h1317cce487;
    stim[38] = 37'h1a0d0576f6;
    stim[39] = 37'h1616d1c6e1;
    stim[40] = 37'h1b67d46784;
    stim[41] = 37'h1e4ae2d4f8;
    stim[42] = 37'h07d4f5bef8;
    stim[43] = 37'h1bf3459cb4;
    stim[44] = 37'h1f010bf988;
    stim[45] = 37'h0ea5c3bc7d;
    stim[46] = 37'h079016d9c7;
    stim[47] = 37'h03b59a4870;
    stim[48] = 37'h0d1b75db28;
    stim[49] = 37'h020edd6490;
    stim[50] = 37'h12f6e3f405;
    stim[51] = 37'h061e78eded;
    stim[52] = 37'h0e135a803d;
    stim[53] = 37'h19222a65ab;
    stim[54] = 37'h1ebe3b5394;
    stim[55] = 37'h1289a0ca29;
    stim[56] = 37'h06e513517e;
    stim[57] = 37'h171ff592d4;
    stim[58] = 37'h1268467d4f;
    stim[59] = 37'h02633526f6;
    stim[60] = 37'h0fd5e0f908;
    stim[61] = 37'h1ede4799fd;
    stim[62] = 37'h129d12200b;
    stim[63] = 37'h0a74f8bdb6;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h27d0000027d;
      expv[6] = 42'h27d00000000;
      expv[7] = 42'h27d00000000;
      expv[8] = 42'h27d00000000;
      expv[9] = 42'h27d00000000;
      expv[10] = 42'h27d00000000;
      expv[11] = 42'h27d00000000;
      expv[12] = 42'h27d0000027d;
      expv[13] = 42'h27d00000000;
      expv[14] = 42'h27d00000000;
      expv[15] = 42'h27d00000000;
      expv[16] = 42'h27d00000000;
      expv[17] = 42'h27d00000000;
      expv[18] = 42'h27d00000000;
      expv[19] = 42'h27d00000000;
      expv[20] = 42'h27d00000000;
      expv[21] = 42'h27d0000027d;
      expv[22] = 42'h27d00000000;
      expv[23] = 42'h27d00000000;
      expv[24] = 42'h27d00000000;
      expv[25] = 42'h27d00000000;
      expv[26] = 42'h27d00000000;
      expv[27] = 42'h27d00000000;
      expv[28] = 42'h27d00000000;
      expv[29] = 42'h27d0000027d;
      expv[30] = 42'h27d00000000;
      expv[31] = 42'h27d0000027d;
      expv[32] = 42'h0ea000000ea;
      expv[33] = 42'h0ea000000ea;
      expv[34] = 42'h03800000038;
      expv[35] = 42'h03800000038;
      expv[36] = 42'h03800000038;
      expv[37] = 42'h30e00000000;
      expv[38] = 42'h30e00000000;
      expv[39] = 42'h30e00000000;
      expv[40] = 42'h30e00000000;
      expv[41] = 42'h30e00000000;
      expv[42] = 42'h30e0000030e;
      expv[43] = 42'h30e00000000;
      expv[44] = 42'h30e00000000;
      expv[45] = 42'h30e00000000;
      expv[46] = 42'h30e0000030e;
      expv[47] = 42'h30e0000030e;
      expv[48] = 42'h00000000000;
      expv[49] = 42'h00000000000;
      expv[50] = 42'h00000000000;
      expv[51] = 42'h00000000000;
      expv[52] = 42'h1ed00000000;
      expv[53] = 42'h00000000000;
      expv[54] = 42'h00000000000;
      expv[55] = 42'h00000000000;
      expv[56] = 42'h00000000000;
      expv[57] = 42'h17e00000000;
      expv[58] = 42'h17e00000000;
      expv[59] = 42'h17e0000017e;
      expv[60] = 42'h17e00000000;
      expv[61] = 42'h17e00000000;
      expv[62] = 42'h17e00000000;
      expv[63] = 42'h17e00000000;
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
