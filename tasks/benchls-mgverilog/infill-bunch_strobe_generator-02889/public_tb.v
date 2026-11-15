// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02889 dut (
    .clk(clk),
    .store_strb(in_vec[30:30]),
    .b1_strobe(in_vec[29:22]),
    .b2_strobe(in_vec[21:14]),
    .no_bunches(in_vec[13:12]),
    .no_samples(in_vec[11:8]),
    .sample_spacing(in_vec[7:0]),
    .bunch_strb(out_vec[1:1]),
    .LUTcond(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h7dd5b6ca;
    stim[1] = 31'h7430ee47;
    stim[2] = 31'h41830c65;
    stim[3] = 31'h60af0f16;
    stim[4] = 31'h0c5dc293;
    stim[5] = 31'h0d829539;
    stim[6] = 31'h49c532ff;
    stim[7] = 31'h3d1f8039;
    stim[8] = 31'h7f0871f8;
    stim[9] = 31'h5efa07a8;
    stim[10] = 31'h6eece9eb;
    stim[11] = 31'h0cea170b;
    stim[12] = 31'h7c9e7b75;
    stim[13] = 31'h42924648;
    stim[14] = 31'h3ea8f943;
    stim[15] = 31'h62e72fc8;
    stim[16] = 31'h5f6e483e;
    stim[17] = 31'h616d01d9;
    stim[18] = 31'h1560b96f;
    stim[19] = 31'h7fb181c8;
    stim[20] = 31'h2cfd5f46;
    stim[21] = 31'h5b668021;
    stim[22] = 31'h52ed2c81;
    stim[23] = 31'h61765934;
    stim[24] = 31'h6f1d9ae2;
    stim[25] = 31'h5f9b19da;
    stim[26] = 31'h35cf3346;
    stim[27] = 31'h0b68f176;
    stim[28] = 31'h2667bfac;
    stim[29] = 31'h4ec65613;
    stim[30] = 31'h433ddc39;
    stim[31] = 31'h11721d95;
    stim[32] = 31'h361bb460;
    stim[33] = 31'h6efdccd0;
    stim[34] = 31'h7c16fade;
    stim[35] = 31'h2005fa6a;
    stim[36] = 31'h11717228;
    stim[37] = 31'h5faf83c4;
    stim[38] = 31'h6993e45c;
    stim[39] = 31'h11011d9e;
    stim[40] = 31'h263b5ed7;
    stim[41] = 31'h6667d625;
    stim[42] = 31'h6ce29da9;
    stim[43] = 31'h0be49966;
    stim[44] = 31'h50f52db0;
    stim[45] = 31'h38c2d918;
    stim[46] = 31'h06511698;
    stim[47] = 31'h07fb242c;
    stim[48] = 31'h3f2ee84b;
    stim[49] = 31'h0b7a5adf;
    stim[50] = 31'h41477dce;
    stim[51] = 31'h1692b3a9;
    stim[52] = 31'h5a7b30ed;
    stim[53] = 31'h6fdf4833;
    stim[54] = 31'h69a9ba3c;
    stim[55] = 31'h1f81c363;
    stim[56] = 31'h1ce7f62f;
    stim[57] = 31'h28501669;
    stim[58] = 31'h25e37833;
    stim[59] = 31'h405dd66b;
    stim[60] = 31'h32b4023f;
    stim[61] = 31'h49336056;
    stim[62] = 31'h2c7584f8;
    stim[63] = 31'h4971f94b;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'hx;
      expv[4] = 2'hx;
      expv[5] = 2'hx;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
