// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10999 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h342098;
    stim[1] = 22'h0d3fb8;
    stim[2] = 22'h2b48a1;
    stim[3] = 22'h1294b8;
    stim[4] = 22'h172e80;
    stim[5] = 22'h2bf70a;
    stim[6] = 22'h0b1209;
    stim[7] = 22'h27e4fb;
    stim[8] = 22'h324199;
    stim[9] = 22'h1a7f8b;
    stim[10] = 22'h22d085;
    stim[11] = 22'h3fa73d;
    stim[12] = 22'h0e8ccc;
    stim[13] = 22'h2e72f1;
    stim[14] = 22'h3e5ce2;
    stim[15] = 22'h00724c;
    stim[16] = 22'h0f2d5d;
    stim[17] = 22'h2e7fd0;
    stim[18] = 22'h26935e;
    stim[19] = 22'h1f1261;
    stim[20] = 22'h2267c6;
    stim[21] = 22'h33dd28;
    stim[22] = 22'h1b143b;
    stim[23] = 22'h3e64e9;
    stim[24] = 22'h1f3ba6;
    stim[25] = 22'h128d49;
    stim[26] = 22'h3ad31a;
    stim[27] = 22'h3a45ef;
    stim[28] = 22'h0756a7;
    stim[29] = 22'h3b42a6;
    stim[30] = 22'h3fff13;
    stim[31] = 22'h3f9a0e;
    stim[32] = 22'h3b58fd;
    stim[33] = 22'h138e86;
    stim[34] = 22'h0e16fb;
    stim[35] = 22'h1b0ef0;
    stim[36] = 22'h2e3338;
    stim[37] = 22'h0e437f;
    stim[38] = 22'h17e09b;
    stim[39] = 22'h1aa134;
    stim[40] = 22'h2bf14a;
    stim[41] = 22'h0b1232;
    stim[42] = 22'h2784d6;
    stim[43] = 22'h1f6955;
    stim[44] = 22'h069e9e;
    stim[45] = 22'h3633dd;
    stim[46] = 22'h2fa579;
    stim[47] = 22'h12d0e3;
    stim[48] = 22'h1b8765;
    stim[49] = 22'h2f232b;
    stim[50] = 22'h1f50b0;
    stim[51] = 22'h0a9223;
    stim[52] = 22'h2e9df7;
    stim[53] = 22'h2e2705;
    stim[54] = 22'h0a61fe;
    stim[55] = 22'h16267e;
    stim[56] = 22'h325941;
    stim[57] = 22'h275ed9;
    stim[58] = 22'h06dd15;
    stim[59] = 22'h1bb8c0;
    stim[60] = 22'h234054;
    stim[61] = 22'h135db5;
    stim[62] = 22'h1b77f9;
    stim[63] = 22'h062b11;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0c34f;
      expv[5] = 17'h0c34f;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h0c34f;
      expv[20] = 17'h00000;
      expv[21] = 17'h0c34f;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0000b;
      expv[39] = 17'h0c34f;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0000f;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h00000;
      expv[45] = 17'h00002;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h0c34f;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h0000f;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h0000f;
      expv[56] = 17'h0c34f;
      expv[57] = 17'h00000;
      expv[58] = 17'h0c340;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h0c340;
      expv[62] = 17'h0267e;
      expv[63] = 17'h00000;
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
