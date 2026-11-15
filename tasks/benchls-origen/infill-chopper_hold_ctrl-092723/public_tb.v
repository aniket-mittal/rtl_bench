// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092723 dut (
    .clk(clk),
    .chop_en(in_vec[33:33]),
    .chop_default(in_vec[32:32]),
    .change_count(in_vec[31:16]),
    .max_count(in_vec[15:0]),
    .chop_o(out_vec[2:2]),
    .chop_dly_o(out_vec[1:1]),
    .data_hold_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h35c0b2ba4;
    stim[1] = 34'h23ebb9fc1;
    stim[2] = 34'h22db58518;
    stim[3] = 34'h171a98677;
    stim[4] = 34'h1c15bddb2;
    stim[5] = 34'h194880ee9;
    stim[6] = 34'h1275b78fc;
    stim[7] = 34'h38620b817;
    stim[8] = 34'h12639c661;
    stim[9] = 34'h1c23c66a5;
    stim[10] = 34'h3998765f2;
    stim[11] = 34'h2cce6d3ea;
    stim[12] = 34'h1c6c38ed4;
    stim[13] = 34'h292fc3db6;
    stim[14] = 34'h3a1615be6;
    stim[15] = 34'h2bcc18de0;
    stim[16] = 34'h060f5640b;
    stim[17] = 34'h34ba9fd7a;
    stim[18] = 34'h2e70a3882;
    stim[19] = 34'h236ae5a26;
    stim[20] = 34'h069f58ee5;
    stim[21] = 34'h0645d7716;
    stim[22] = 34'h3f46dfc11;
    stim[23] = 34'h24ea02c67;
    stim[24] = 34'h2b27377f3;
    stim[25] = 34'h09d50cab3;
    stim[26] = 34'h3be87bfb1;
    stim[27] = 34'h137d32f6e;
    stim[28] = 34'h3f94d24f7;
    stim[29] = 34'h220e173d3;
    stim[30] = 34'h2c059c50b;
    stim[31] = 34'h1f9ba6e9a;
    stim[32] = 34'h0b45b6f60;
    stim[33] = 34'h1c4cee910;
    stim[34] = 34'h3275f0dd9;
    stim[35] = 34'h0eb5728a4;
    stim[36] = 34'h1e9237201;
    stim[37] = 34'h28650b6b4;
    stim[38] = 34'h3a4c25fd2;
    stim[39] = 34'h386309a0c;
    stim[40] = 34'h0d13f04b9;
    stim[41] = 34'h10cf6f3cb;
    stim[42] = 34'h1caeb1979;
    stim[43] = 34'h13e7ca202;
    stim[44] = 34'h25bb0b674;
    stim[45] = 34'h3e70259de;
    stim[46] = 34'h26aad9cae;
    stim[47] = 34'h1a6ac7476;
    stim[48] = 34'h2e92af5a3;
    stim[49] = 34'h3ad6ae15b;
    stim[50] = 34'h1e5f80fb2;
    stim[51] = 34'h007c935fd;
    stim[52] = 34'h254bc4639;
    stim[53] = 34'h3a4bd35d6;
    stim[54] = 34'h14740175d;
    stim[55] = 34'h12a65be54;
    stim[56] = 34'h20d7253f1;
    stim[57] = 34'h1b5c62033;
    stim[58] = 34'h244aec4b5;
    stim[59] = 34'h2fb56cc11;
    stim[60] = 34'h2227a37a9;
    stim[61] = 34'h1f2cfee8a;
    stim[62] = 34'h182c75073;
    stim[63] = 34'h13f9cb73d;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'h6;
      expv[8] = 3'h6;
      expv[9] = 3'h6;
      expv[10] = 3'h6;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h6;
      expv[16] = 3'h6;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h6;
      expv[32] = 3'h6;
      expv[33] = 3'h2;
      expv[34] = 3'h6;
      expv[35] = 3'h6;
      expv[36] = 3'h0;
      expv[37] = 3'h6;
      expv[38] = 3'h6;
      expv[39] = 3'h4;
      expv[40] = 3'h6;
      expv[41] = 3'h2;
      expv[42] = 3'h6;
      expv[43] = 3'h6;
      expv[44] = 3'h4;
      expv[45] = 3'h6;
      expv[46] = 3'h6;
      expv[47] = 3'h6;
      expv[48] = 3'h6;
      expv[49] = 3'h6;
      expv[50] = 3'h6;
      expv[51] = 3'h6;
      expv[52] = 3'h2;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h6;
      expv[59] = 3'h6;
      expv[60] = 3'h6;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'h6;
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
