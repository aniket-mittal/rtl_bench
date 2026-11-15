// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06432 dut (
    .Clock(clk),
    .Reset(in_vec[34:34]),
    .Set(in_vec[33:33]),
    .Enable(in_vec[32:32]),
    .In(in_vec[31:0]),
    .Out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h65d9b7db5;
    stim[1] = 35'h41d976b67;
    stim[2] = 35'h12101c66d;
    stim[3] = 35'h3c104f953;
    stim[4] = 35'h0ea5fa61d;
    stim[5] = 35'h1a949824e;
    stim[6] = 35'h113233d04;
    stim[7] = 35'h2822209d2;
    stim[8] = 35'h0632c96fd;
    stim[9] = 35'h2c94edd07;
    stim[10] = 35'h3867aff27;
    stim[11] = 35'h375b765a5;
    stim[12] = 35'h24d614654;
    stim[13] = 35'h363468973;
    stim[14] = 35'h3283c3394;
    stim[15] = 35'h067762df9;
    stim[16] = 35'h318f31cd5;
    stim[17] = 35'h0ff8a3ca1;
    stim[18] = 35'h34c98c64a;
    stim[19] = 35'h2fb8163e8;
    stim[20] = 35'h1305bb338;
    stim[21] = 35'h3c3d37246;
    stim[22] = 35'h324986f9c;
    stim[23] = 35'h0247fa7e1;
    stim[24] = 35'h245868d2d;
    stim[25] = 35'h0338cfd71;
    stim[26] = 35'h2de967cbb;
    stim[27] = 35'h34a0b5dd3;
    stim[28] = 35'h3b8ae0da5;
    stim[29] = 35'h1559bc55a;
    stim[30] = 35'h1aaf01ef2;
    stim[31] = 35'h0b82d0139;
    stim[32] = 35'h07df1201f;
    stim[33] = 35'h129bed2e0;
    stim[34] = 35'h31bb2adb3;
    stim[35] = 35'h19761f567;
    stim[36] = 35'h1d17df132;
    stim[37] = 35'h244edd52d;
    stim[38] = 35'h112f51d2c;
    stim[39] = 35'h2e303a87e;
    stim[40] = 35'h36c742f3e;
    stim[41] = 35'h2438a2679;
    stim[42] = 35'h223fddbe4;
    stim[43] = 35'h3803b58dc;
    stim[44] = 35'h0b772b77a;
    stim[45] = 35'h2066505ea;
    stim[46] = 35'h0984b7b7a;
    stim[47] = 35'h3159e4fa3;
    stim[48] = 35'h01c265219;
    stim[49] = 35'h098873d04;
    stim[50] = 35'h38238d35f;
    stim[51] = 35'h06dba7fa4;
    stim[52] = 35'h1f5bc0727;
    stim[53] = 35'h3d38aa679;
    stim[54] = 35'h27b1aabf1;
    stim[55] = 35'h278ee8f94;
    stim[56] = 35'h1a29d7078;
    stim[57] = 35'h3badec801;
    stim[58] = 35'h2b7e55636;
    stim[59] = 35'h0c6b0c727;
    stim[60] = 35'h3fe91cbd2;
    stim[61] = 35'h1096aca1e;
    stim[62] = 35'h29e3b57fb;
    stim[63] = 35'h30fd4a35d;
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
      expv[3] = 32'h2101c66d;
      expv[4] = 32'hffffffff;
      expv[5] = 32'hffffffff;
      expv[6] = 32'ha949824e;
      expv[7] = 32'h13233d04;
      expv[8] = 32'hffffffff;
      expv[9] = 32'hffffffff;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffffffff;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hffffffff;
      expv[20] = 32'hffffffff;
      expv[21] = 32'h305bb338;
      expv[22] = 32'hffffffff;
      expv[23] = 32'hffffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hffffffff;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'h559bc55a;
      expv[31] = 32'haaf01ef2;
      expv[32] = 32'haaf01ef2;
      expv[33] = 32'haaf01ef2;
      expv[34] = 32'h29bed2e0;
      expv[35] = 32'hffffffff;
      expv[36] = 32'h9761f567;
      expv[37] = 32'hd17df132;
      expv[38] = 32'hffffffff;
      expv[39] = 32'h12f51d2c;
      expv[40] = 32'hffffffff;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'hffffffff;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hffffffff;
      expv[47] = 32'hffffffff;
      expv[48] = 32'hffffffff;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffffffff;
      expv[53] = 32'hf5bc0727;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'ha29d7078;
      expv[58] = 32'hffffffff;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hffffffff;
      expv[62] = 32'h096aca1e;
      expv[63] = 32'hffffffff;
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
