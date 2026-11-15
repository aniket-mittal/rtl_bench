// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121304 dut (
    .clk(clk),
    .reset(in_vec[29:29]),
    .rom_q(in_vec[28:0]),
    .rom_addr(out_vec[33:25]),
    .ram_a_addr(out_vec[24:19]),
    .ram_b_addr(out_vec[18:13]),
    .ram_b_w(out_vec[12:12]),
    .pe(out_vec[11:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3be99f2b;
    stim[1] = 30'h3a1a9650;
    stim[2] = 30'h12e30a32;
    stim[3] = 30'h156806cd;
    stim[4] = 30'h15c8997b;
    stim[5] = 30'h000f0926;
    stim[6] = 30'h0d3fa8cd;
    stim[7] = 30'h174ee715;
    stim[8] = 30'h18221a8a;
    stim[9] = 30'h1f1943e2;
    stim[10] = 30'h1bc910a8;
    stim[11] = 30'h0846e844;
    stim[12] = 30'h0bc7c4ce;
    stim[13] = 30'h0c01f8a6;
    stim[14] = 30'h16272783;
    stim[15] = 30'h13140618;
    stim[16] = 30'h0da48f18;
    stim[17] = 30'h1b3a21ee;
    stim[18] = 30'h0c99502c;
    stim[19] = 30'h187edcd2;
    stim[20] = 30'h0b857470;
    stim[21] = 30'h0519e38b;
    stim[22] = 30'h0926ee37;
    stim[23] = 30'h07aa6140;
    stim[24] = 30'h19ad0974;
    stim[25] = 30'h0116f691;
    stim[26] = 30'h01fdfea4;
    stim[27] = 30'h17f2b0fd;
    stim[28] = 30'h1e028883;
    stim[29] = 30'h100919e6;
    stim[30] = 30'h043f5e74;
    stim[31] = 30'h0c424723;
    stim[32] = 30'h1618c694;
    stim[33] = 30'h0022fce3;
    stim[34] = 30'h171d93d4;
    stim[35] = 30'h067164f0;
    stim[36] = 30'h1541d021;
    stim[37] = 30'h0a6bb396;
    stim[38] = 30'h1f51bde3;
    stim[39] = 30'h1f2e648f;
    stim[40] = 30'h0ff7a8f9;
    stim[41] = 30'h10b106f4;
    stim[42] = 30'h1f136d42;
    stim[43] = 30'h0de062e2;
    stim[44] = 30'h09e85f25;
    stim[45] = 30'h009150f5;
    stim[46] = 30'h0eab88cc;
    stim[47] = 30'h08f29f95;
    stim[48] = 30'h03a56079;
    stim[49] = 30'h157d089d;
    stim[50] = 30'h1abd4abf;
    stim[51] = 30'h0cbf1d26;
    stim[52] = 30'h1660d51a;
    stim[53] = 30'h0d5fd47e;
    stim[54] = 30'h169da72a;
    stim[55] = 30'h12737480;
    stim[56] = 30'h1de8afc8;
    stim[57] = 30'h0173f73f;
    stim[58] = 30'h09eabe14;
    stim[59] = 30'h0e564607;
    stim[60] = 30'h004fa303;
    stim[61] = 30'h1249482d;
    stim[62] = 30'h1a924ced;
    stim[63] = 30'h08bf9092;
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
      expv[0] = 34'hxxx00xxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h001a08000;
      expv[4] = 34'h001df6c80;
      expv[5] = 34'h000000300;
      expv[6] = 34'h000000502;
      expv[7] = 34'h00000007e;
      expv[8] = 34'h000000022;
      expv[9] = 34'h000000022;
      expv[10] = 34'h000000502;
      expv[11] = 34'h000000502;
      expv[12] = 34'h000000022;
      expv[13] = 34'h00000007e;
      expv[14] = 34'h00000007e;
      expv[15] = 34'h000000502;
      expv[16] = 34'h000000022;
      expv[17] = 34'h000000022;
      expv[18] = 34'h000000022;
      expv[19] = 34'h000000502;
      expv[20] = 34'h000000022;
      expv[21] = 34'h000000502;
      expv[22] = 34'h00000007e;
      expv[23] = 34'h000000022;
      expv[24] = 34'h000000022;
      expv[25] = 34'h000000502;
      expv[26] = 34'h000000022;
      expv[27] = 34'h00000007e;
      expv[28] = 34'h000000022;
      expv[29] = 34'h000000022;
      expv[30] = 34'h000000502;
      expv[31] = 34'h000000502;
      expv[32] = 34'h000000022;
      expv[33] = 34'h002001000;
      expv[34] = 34'h002700000;
      expv[35] = 34'h003860f00;
      expv[36] = 34'h002000000;
      expv[37] = 34'h00200007e;
      expv[38] = 34'h00200007e;
      expv[39] = 34'h00200007e;
      expv[40] = 34'h002000022;
      expv[41] = 34'h00200007e;
      expv[42] = 34'h002000502;
      expv[43] = 34'h002000502;
      expv[44] = 34'h002000022;
      expv[45] = 34'h002000022;
      expv[46] = 34'h002000502;
      expv[47] = 34'h00200007e;
      expv[48] = 34'h002000022;
      expv[49] = 34'h002000502;
      expv[50] = 34'h002000502;
      expv[51] = 34'h002000502;
      expv[52] = 34'h002000502;
      expv[53] = 34'h002000022;
      expv[54] = 34'h00200007e;
      expv[55] = 34'h00200007e;
      expv[56] = 34'h002000502;
      expv[57] = 34'h002000022;
      expv[58] = 34'h00200007e;
      expv[59] = 34'h002000022;
      expv[60] = 34'h002000022;
      expv[61] = 34'h00200007e;
      expv[62] = 34'h002000502;
      expv[63] = 34'h002000022;
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
