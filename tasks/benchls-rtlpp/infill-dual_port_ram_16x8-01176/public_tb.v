// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01176 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h14c71;
    stim[1] = 17'h0ad36;
    stim[2] = 17'h0e708;
    stim[3] = 17'h0029b;
    stim[4] = 17'h12c3b;
    stim[5] = 17'h00ecb;
    stim[6] = 17'h0ca01;
    stim[7] = 17'h1b3dd;
    stim[8] = 17'h190b7;
    stim[9] = 17'h156fc;
    stim[10] = 17'h132d7;
    stim[11] = 17'h09283;
    stim[12] = 17'h154a9;
    stim[13] = 17'h1457d;
    stim[14] = 17'h104c5;
    stim[15] = 17'h13389;
    stim[16] = 17'h1071a;
    stim[17] = 17'h0d7ed;
    stim[18] = 17'h0fae9;
    stim[19] = 17'h0e4b5;
    stim[20] = 17'h12084;
    stim[21] = 17'h0e009;
    stim[22] = 17'h1cea0;
    stim[23] = 17'h1cb0f;
    stim[24] = 17'h15850;
    stim[25] = 17'h025f0;
    stim[26] = 17'h01237;
    stim[27] = 17'h07af3;
    stim[28] = 17'h0c4bc;
    stim[29] = 17'h12520;
    stim[30] = 17'h13f16;
    stim[31] = 17'h08500;
    stim[32] = 17'h06cf3;
    stim[33] = 17'h1ede6;
    stim[34] = 17'h0d411;
    stim[35] = 17'h05e6b;
    stim[36] = 17'h0f031;
    stim[37] = 17'h00859;
    stim[38] = 17'h02144;
    stim[39] = 17'h04579;
    stim[40] = 17'h1070d;
    stim[41] = 17'h1a283;
    stim[42] = 17'h03a1f;
    stim[43] = 17'h09128;
    stim[44] = 17'h12f0c;
    stim[45] = 17'h11d7c;
    stim[46] = 17'h10887;
    stim[47] = 17'h00de2;
    stim[48] = 17'h0d4f7;
    stim[49] = 17'h08649;
    stim[50] = 17'h1ef7a;
    stim[51] = 17'h1c71d;
    stim[52] = 17'h0e27b;
    stim[53] = 17'h12e34;
    stim[54] = 17'h1fca4;
    stim[55] = 17'h06ee0;
    stim[56] = 17'h14882;
    stim[57] = 17'h0f7de;
    stim[58] = 17'h1a4c2;
    stim[59] = 17'h0037f;
    stim[60] = 17'h1f36e;
    stim[61] = 17'h16ab6;
    stim[62] = 17'h06718;
    stim[63] = 17'h060f4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'h3b;
      expv[11] = 8'h3b;
      expv[12] = 8'h71;
      expv[13] = 8'ha9;
      expv[14] = 8'h7d;
      expv[15] = 8'hd7;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'h7d;
      expv[20] = 8'h1a;
      expv[21] = 8'h1a;
      expv[22] = 8'hxx;
      expv[23] = 8'hdd;
      expv[24] = 8'hxx;
      expv[25] = 8'h50;
      expv[26] = 8'h84;
      expv[27] = 8'hxx;
      expv[28] = 8'h7d;
      expv[29] = 8'h50;
      expv[30] = 8'hxx;
      expv[31] = 8'h50;
      expv[32] = 8'h0f;
      expv[33] = 8'hxx;
      expv[34] = 8'h7d;
      expv[35] = 8'he6;
      expv[36] = 8'h1a;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'h50;
      expv[40] = 8'hxx;
      expv[41] = 8'h20;
      expv[42] = 8'h83;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'h7d;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'h0c;
      expv[53] = 8'h7a;
      expv[54] = 8'h1d;
      expv[55] = 8'h7a;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'h82;
      expv[59] = 8'h16;
      expv[60] = 8'h16;
      expv[61] = 8'hc2;
      expv[62] = 8'hxx;
      expv[63] = 8'h87;
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
