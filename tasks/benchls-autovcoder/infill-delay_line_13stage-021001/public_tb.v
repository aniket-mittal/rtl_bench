// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021001 dut (
    .clk(clk),
    .din(in_vec[14:1]),
    .rst(in_vec[0:0]),
    .dout(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h7f1d;
    stim[1] = 15'h279f;
    stim[2] = 15'h6416;
    stim[3] = 15'h4910;
    stim[4] = 15'h737b;
    stim[5] = 15'h4c7c;
    stim[6] = 15'h6d37;
    stim[7] = 15'h20ea;
    stim[8] = 15'h571a;
    stim[9] = 15'h0bc0;
    stim[10] = 15'h12aa;
    stim[11] = 15'h2d4e;
    stim[12] = 15'h4801;
    stim[13] = 15'h0708;
    stim[14] = 15'h7f50;
    stim[15] = 15'h167a;
    stim[16] = 15'h4522;
    stim[17] = 15'h2ae8;
    stim[18] = 15'h58e8;
    stim[19] = 15'h77ca;
    stim[20] = 15'h40dc;
    stim[21] = 15'h10cb;
    stim[22] = 15'h0384;
    stim[23] = 15'h4692;
    stim[24] = 15'h5f24;
    stim[25] = 15'h6d32;
    stim[26] = 15'h02f2;
    stim[27] = 15'h6db4;
    stim[28] = 15'h3680;
    stim[29] = 15'h68b0;
    stim[30] = 15'h4f48;
    stim[31] = 15'h3020;
    stim[32] = 15'h57a4;
    stim[33] = 15'h6be4;
    stim[34] = 15'h32f0;
    stim[35] = 15'h242a;
    stim[36] = 15'h7a5a;
    stim[37] = 15'h266e;
    stim[38] = 15'h4af0;
    stim[39] = 15'h54f2;
    stim[40] = 15'h4da0;
    stim[41] = 15'h30fa;
    stim[42] = 15'h5d10;
    stim[43] = 15'h4404;
    stim[44] = 15'h48f2;
    stim[45] = 15'h1270;
    stim[46] = 15'h1b4c;
    stim[47] = 15'h3328;
    stim[48] = 15'h1d76;
    stim[49] = 15'h08c4;
    stim[50] = 15'h7538;
    stim[51] = 15'h7bba;
    stim[52] = 15'h023a;
    stim[53] = 15'h7f04;
    stim[54] = 15'h6e7c;
    stim[55] = 15'h56a2;
    stim[56] = 15'h64c0;
    stim[57] = 15'h7290;
    stim[58] = 15'h35ca;
    stim[59] = 15'h2bd8;
    stim[60] = 15'h628e;
    stim[61] = 15'h1718;
    stim[62] = 15'h2c92;
    stim[63] = 15'h50b2;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h01c2;
      expv[36] = 14'h2349;
      expv[37] = 14'h2f92;
      expv[38] = 14'h3699;
      expv[39] = 14'h0179;
      expv[40] = 14'h36da;
      expv[41] = 14'h1b40;
      expv[42] = 14'h3458;
      expv[43] = 14'h27a4;
      expv[44] = 14'h1810;
      expv[45] = 14'h2bd2;
      expv[46] = 14'h35f2;
      expv[47] = 14'h1978;
      expv[48] = 14'h1215;
      expv[49] = 14'h3d2d;
      expv[50] = 14'h1337;
      expv[51] = 14'h2578;
      expv[52] = 14'h2a79;
      expv[53] = 14'h26d0;
      expv[54] = 14'h187d;
      expv[55] = 14'h2e88;
      expv[56] = 14'h2202;
      expv[57] = 14'h2479;
      expv[58] = 14'h0938;
      expv[59] = 14'h0da6;
      expv[60] = 14'h1994;
      expv[61] = 14'h0ebb;
      expv[62] = 14'h0462;
      expv[63] = 14'h3a9c;
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
