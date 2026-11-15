// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_170093 dut (
    .clk125m(clk),
    .reset(in_vec[33:33]),
    .fifo_wr_en(in_vec[32:32]),
    .din(in_vec[31:3]),
    .sw(in_vec[2:0]),
    .led(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3664d366a;
    stim[1] = 34'h37df74aa3;
    stim[2] = 34'h14a973c0d;
    stim[3] = 34'h1581fc01f;
    stim[4] = 34'h0e44ce573;
    stim[5] = 34'h1cc63bfd4;
    stim[6] = 34'h037a8e531;
    stim[7] = 34'h08e63b6b1;
    stim[8] = 34'h0d893020f;
    stim[9] = 34'h0b868528a;
    stim[10] = 34'h07490a530;
    stim[11] = 34'h1dcac3c82;
    stim[12] = 34'h0ce1c337a;
    stim[13] = 34'h03805a8da;
    stim[14] = 34'h0c2f84014;
    stim[15] = 34'h0b36eeffa;
    stim[16] = 34'h1b4ef945b;
    stim[17] = 34'h0e729c629;
    stim[18] = 34'h1c78395a6;
    stim[19] = 34'h050268e40;
    stim[20] = 34'h1f4ba92ea;
    stim[21] = 34'h11341d036;
    stim[22] = 34'h02ea2f9ad;
    stim[23] = 34'h13ccd4f55;
    stim[24] = 34'h11bd570c2;
    stim[25] = 34'h04538f88e;
    stim[26] = 34'h0f0385bcd;
    stim[27] = 34'h0ab4ffe28;
    stim[28] = 34'h09e2a096a;
    stim[29] = 34'h1fac7ca24;
    stim[30] = 34'h15f241237;
    stim[31] = 34'h1ef22cfb6;
    stim[32] = 34'h032699532;
    stim[33] = 34'h0c17fe250;
    stim[34] = 34'h19ae0d3f1;
    stim[35] = 34'h1191b6557;
    stim[36] = 34'h05ff3b9c3;
    stim[37] = 34'h05996626b;
    stim[38] = 34'h14cbb9923;
    stim[39] = 34'h04f71bb75;
    stim[40] = 34'h1c077f1a6;
    stim[41] = 34'h02c6edb69;
    stim[42] = 34'h110b78399;
    stim[43] = 34'h06e83cc3a;
    stim[44] = 34'h07f43fbf1;
    stim[45] = 34'h1d86bfb87;
    stim[46] = 34'h0f1997c70;
    stim[47] = 34'h060c8e224;
    stim[48] = 34'h0a4b3d20c;
    stim[49] = 34'h0d55d8de9;
    stim[50] = 34'h04216cd34;
    stim[51] = 34'h1b4310208;
    stim[52] = 34'h13335a74f;
    stim[53] = 34'h09e20e635;
    stim[54] = 34'h018fc57ce;
    stim[55] = 34'h126c3d345;
    stim[56] = 34'h255626b72;
    stim[57] = 34'h13f00945d;
    stim[58] = 34'h05e5f02b6;
    stim[59] = 34'h06958402c;
    stim[60] = 34'h0dfab7525;
    stim[61] = 34'h1c7c42553;
    stim[62] = 34'h1c4ac2d85;
    stim[63] = 34'h134a964d1;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h03;
      expv[7] = 8'h03;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'hf8;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h8b;
      expv[18] = 8'h00;
      expv[19] = 8'h72;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'hae;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h59;
      expv[34] = 8'hf6;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h34;
      expv[42] = 8'h34;
      expv[43] = 8'h00;
      expv[44] = 8'h73;
      expv[45] = 8'h00;
      expv[46] = 8'h7f;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h70;
      expv[50] = 8'h00;
      expv[51] = 8'h7f;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'haa;
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
