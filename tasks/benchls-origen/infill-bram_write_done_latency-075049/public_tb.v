// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075049 dut (
    .i_clk(clk),
    .i_rstn(in_vec[46:46]),
    .i_bram_addr(in_vec[45:33]),
    .i_bram_data(in_vec[32:1]),
    .i_bram_trig(in_vec[0:0]),
    .o_bram_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h2ae2e411e072;
    stim[1] = 47'h39f941d7d2ea;
    stim[2] = 47'h474692f3f0ae;
    stim[3] = 47'h5d6ccfb091e1;
    stim[4] = 47'h63b3e7fbf04d;
    stim[5] = 47'h51ff3804fc34;
    stim[6] = 47'h7992aee30236;
    stim[7] = 47'h2cb744913e93;
    stim[8] = 47'h672acaf87ba0;
    stim[9] = 47'h755977ce5695;
    stim[10] = 47'h544672ba1443;
    stim[11] = 47'h72035d7dbb17;
    stim[12] = 47'h60ea06dc21f5;
    stim[13] = 47'h774d55431713;
    stim[14] = 47'h7c240969a1d1;
    stim[15] = 47'h5cf0f52aeb1c;
    stim[16] = 47'h611cf747aa8a;
    stim[17] = 47'h6876402f61c3;
    stim[18] = 47'h3954360ec5e5;
    stim[19] = 47'h6f3beb0419eb;
    stim[20] = 47'h5291930ab207;
    stim[21] = 47'h5aa8ffa1ba2f;
    stim[22] = 47'h51dcdeedc44f;
    stim[23] = 47'h60438c4b793e;
    stim[24] = 47'h71d91ab583b5;
    stim[25] = 47'h402f72cb3987;
    stim[26] = 47'h5f3fdc85f970;
    stim[27] = 47'h5832d6b86192;
    stim[28] = 47'h5806604111e1;
    stim[29] = 47'h57e0e4dc4f8c;
    stim[30] = 47'h53e23e0b16d8;
    stim[31] = 47'h6e13ac7c2fe4;
    stim[32] = 47'h52b121fdb477;
    stim[33] = 47'h4dca9982551a;
    stim[34] = 47'h43e377885f60;
    stim[35] = 47'h70ff7e41add8;
    stim[36] = 47'h4e4e73b7f90b;
    stim[37] = 47'h721000e97316;
    stim[38] = 47'h41b17c43cc65;
    stim[39] = 47'h779bf0eb32b7;
    stim[40] = 47'h7ca3a7387186;
    stim[41] = 47'h507a647ceae8;
    stim[42] = 47'h74b8fd6f5e36;
    stim[43] = 47'h6d13f77adffb;
    stim[44] = 47'h637350157f54;
    stim[45] = 47'h6ff667d5ab4b;
    stim[46] = 47'h50e82ec1ffa4;
    stim[47] = 47'h74749117adb3;
    stim[48] = 47'h690f0ed9d8cc;
    stim[49] = 47'h51453e3ac303;
    stim[50] = 47'h45dc2ea2409d;
    stim[51] = 47'h5b5d33d9acc8;
    stim[52] = 47'h452e1236578b;
    stim[53] = 47'h7c98ec923fb9;
    stim[54] = 47'h701c595cef79;
    stim[55] = 47'h7d3cbd0d43b1;
    stim[56] = 47'h19e468a51b4e;
    stim[57] = 47'h52ea1d44aa5d;
    stim[58] = 47'h63150507106f;
    stim[59] = 47'h48e4b1013d8f;
    stim[60] = 47'h5a6e26bda1d9;
    stim[61] = 47'h621a4ef592c6;
    stim[62] = 47'h7618d2cb8a34;
    stim[63] = 47'h6f6c8b50a0c0;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
