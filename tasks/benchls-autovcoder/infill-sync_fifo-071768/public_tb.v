// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071768 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd62;
    stim[1] = 12'hd5e;
    stim[2] = 12'h6e9;
    stim[3] = 12'h3df;
    stim[4] = 12'h628;
    stim[5] = 12'h64d;
    stim[6] = 12'h147;
    stim[7] = 12'h777;
    stim[8] = 12'h2e0;
    stim[9] = 12'h0f5;
    stim[10] = 12'h0d6;
    stim[11] = 12'h5ad;
    stim[12] = 12'h7bc;
    stim[13] = 12'h47a;
    stim[14] = 12'h4b1;
    stim[15] = 12'h691;
    stim[16] = 12'h40b;
    stim[17] = 12'h2fb;
    stim[18] = 12'h6c8;
    stim[19] = 12'h233;
    stim[20] = 12'ha49;
    stim[21] = 12'h4f6;
    stim[22] = 12'h0e6;
    stim[23] = 12'h406;
    stim[24] = 12'h615;
    stim[25] = 12'h559;
    stim[26] = 12'h55d;
    stim[27] = 12'h86b;
    stim[28] = 12'h8ab;
    stim[29] = 12'h397;
    stim[30] = 12'h6e1;
    stim[31] = 12'h5c4;
    stim[32] = 12'h156;
    stim[33] = 12'h16e;
    stim[34] = 12'h4b5;
    stim[35] = 12'h17b;
    stim[36] = 12'h532;
    stim[37] = 12'h72c;
    stim[38] = 12'h773;
    stim[39] = 12'h760;
    stim[40] = 12'h035;
    stim[41] = 12'h69a;
    stim[42] = 12'h2c2;
    stim[43] = 12'h0fb;
    stim[44] = 12'h745;
    stim[45] = 12'h2bf;
    stim[46] = 12'h7ed;
    stim[47] = 12'h2d4;
    stim[48] = 12'h33d;
    stim[49] = 12'h188;
    stim[50] = 12'h723;
    stim[51] = 12'h5a1;
    stim[52] = 12'h17f;
    stim[53] = 12'hf77;
    stim[54] = 12'h3ee;
    stim[55] = 12'h479;
    stim[56] = 12'h2e6;
    stim[57] = 12'h59a;
    stim[58] = 12'h63c;
    stim[59] = 12'h23b;
    stim[60] = 12'h47f;
    stim[61] = 12'h509;
    stim[62] = 12'h16f;
    stim[63] = 12'h584;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h15e;
      expv[4] = 10'h15e;
      expv[5] = 10'h15e;
      expv[6] = 10'h15e;
      expv[7] = 10'h15e;
      expv[8] = 10'h15e;
      expv[9] = 10'h15e;
      expv[10] = 10'h15e;
      expv[11] = 10'h15e;
      expv[12] = 10'h377;
      expv[13] = 10'h3ad;
      expv[14] = 10'h3ad;
      expv[15] = 10'h3ad;
      expv[16] = 10'h3bc;
      expv[17] = 10'h3bc;
      expv[18] = 10'h3bc;
      expv[19] = 10'h1bc;
      expv[20] = 10'h1bc;
      expv[21] = 10'h100;
      expv[22] = 10'h1bc;
      expv[23] = 10'h1bc;
      expv[24] = 10'h1bc;
      expv[25] = 10'h1bc;
      expv[26] = 10'h1bc;
      expv[27] = 10'h359;
      expv[28] = 10'h100;
      expv[29] = 10'h100;
      expv[30] = 10'h100;
      expv[31] = 10'h15d;
      expv[32] = 10'h15d;
      expv[33] = 10'h15d;
      expv[34] = 10'h15d;
      expv[35] = 10'h3c4;
      expv[36] = 10'h3c4;
      expv[37] = 10'h3c4;
      expv[38] = 10'h332;
      expv[39] = 10'h32c;
      expv[40] = 10'h373;
      expv[41] = 10'h373;
      expv[42] = 10'h360;
      expv[43] = 10'h360;
      expv[44] = 10'h360;
      expv[45] = 10'h160;
      expv[46] = 10'h160;
      expv[47] = 10'h345;
      expv[48] = 10'h345;
      expv[49] = 10'h345;
      expv[50] = 10'h345;
      expv[51] = 10'h3ed;
      expv[52] = 10'h3ed;
      expv[53] = 10'h3ed;
      expv[54] = 10'h100;
      expv[55] = 10'h100;
      expv[56] = 10'h177;
      expv[57] = 10'h177;
      expv[58] = 10'h177;
      expv[59] = 10'h39a;
      expv[60] = 10'h39a;
      expv[61] = 10'h39a;
      expv[62] = 10'h39a;
      expv[63] = 10'h39a;
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
