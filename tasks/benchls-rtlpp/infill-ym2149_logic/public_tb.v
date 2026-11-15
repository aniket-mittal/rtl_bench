// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ym2149_logic dut (
    .CLK(clk),
    .RESET(in_vec[13:13]),
    .CE(in_vec[12:12]),
    .SEL(in_vec[11:11]),
    .MODE(in_vec[10:10]),
    .BC(in_vec[9:9]),
    .BDIR(in_vec[8:8]),
    .DI(in_vec[7:0]),
    .CHANNEL_A(out_vec[23:16]),
    .CHANNEL_B(out_vec[15:8]),
    .CHANNEL_C(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3c2f;
    stim[1] = 14'h2afa;
    stim[2] = 14'h157c;
    stim[3] = 14'h08a1;
    stim[4] = 14'h094f;
    stim[5] = 14'h1e5d;
    stim[6] = 14'h0174;
    stim[7] = 14'h0b6b;
    stim[8] = 14'h10cd;
    stim[9] = 14'h1883;
    stim[10] = 14'h197a;
    stim[11] = 14'h1f32;
    stim[12] = 14'h36ad;
    stim[13] = 14'h02dc;
    stim[14] = 14'h0965;
    stim[15] = 14'h1f58;
    stim[16] = 14'h0065;
    stim[17] = 14'h0ac1;
    stim[18] = 14'h01e2;
    stim[19] = 14'h18f9;
    stim[20] = 14'h1553;
    stim[21] = 14'h13cf;
    stim[22] = 14'h1f3c;
    stim[23] = 14'h089b;
    stim[24] = 14'h11a8;
    stim[25] = 14'h07df;
    stim[26] = 14'h0903;
    stim[27] = 14'h11ba;
    stim[28] = 14'h1560;
    stim[29] = 14'h0223;
    stim[30] = 14'h088f;
    stim[31] = 14'h03f2;
    stim[32] = 14'h1c6d;
    stim[33] = 14'h0791;
    stim[34] = 14'h0c5e;
    stim[35] = 14'h1d63;
    stim[36] = 14'h1770;
    stim[37] = 14'h0382;
    stim[38] = 14'h05cf;
    stim[39] = 14'h0059;
    stim[40] = 14'h1ba4;
    stim[41] = 14'h12fa;
    stim[42] = 14'h179a;
    stim[43] = 14'h0585;
    stim[44] = 14'h31f5;
    stim[45] = 14'h11fa;
    stim[46] = 14'h0565;
    stim[47] = 14'h1b48;
    stim[48] = 14'h1b7a;
    stim[49] = 14'h0993;
    stim[50] = 14'h1af2;
    stim[51] = 14'h0323;
    stim[52] = 14'h0500;
    stim[53] = 14'h1edb;
    stim[54] = 14'h0533;
    stim[55] = 14'h1de4;
    stim[56] = 14'h20da;
    stim[57] = 14'h0df2;
    stim[58] = 14'h1bf1;
    stim[59] = 14'h0318;
    stim[60] = 14'h1de9;
    stim[61] = 14'h1987;
    stim[62] = 14'h0451;
    stim[63] = 14'h0f00;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h00007c;
      expv[4] = 24'h00007c;
      expv[5] = 24'h00007c;
      expv[6] = 24'h00007c;
      expv[7] = 24'h00007c;
      expv[8] = 24'h00007c;
      expv[9] = 24'h00007c;
      expv[10] = 24'h00007c;
      expv[11] = 24'h007a7c;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h580000;
      expv[17] = 24'h580000;
      expv[18] = 24'h580000;
      expv[19] = 24'h580000;
      expv[20] = 24'h580000;
      expv[21] = 24'h580053;
      expv[22] = 24'h5800cf;
      expv[23] = 24'h3c00cf;
      expv[24] = 24'h3c00cf;
      expv[25] = 24'h3c00a8;
      expv[26] = 24'h3c00a8;
      expv[27] = 24'h3c00a8;
      expv[28] = 24'h3c00ba;
      expv[29] = 24'h3c0060;
      expv[30] = 24'h3c0060;
      expv[31] = 24'h3c0060;
      expv[32] = 24'h3c0060;
      expv[33] = 24'h3c0060;
      expv[34] = 24'h3c0060;
      expv[35] = 24'h3c0060;
      expv[36] = 24'h3c6360;
      expv[37] = 24'h3c6370;
      expv[38] = 24'h3c6370;
      expv[39] = 24'h3c6370;
      expv[40] = 24'h3c6370;
      expv[41] = 24'ha46370;
      expv[42] = 24'ha46370;
      expv[43] = 24'ha4639a;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h0000fa;
      expv[47] = 24'h0000fa;
      expv[48] = 24'h4800fa;
      expv[49] = 24'h7a00fa;
      expv[50] = 24'h7a00fa;
      expv[51] = 24'h7a00fa;
      expv[52] = 24'h7a00fa;
      expv[53] = 24'h7a00fa;
      expv[54] = 24'h7a00fa;
      expv[55] = 24'h7a00fa;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'hf10000;
      expv[60] = 24'hf10000;
      expv[61] = 24'hf1e900;
      expv[62] = 24'hf18700;
      expv[63] = 24'hf18700;
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
