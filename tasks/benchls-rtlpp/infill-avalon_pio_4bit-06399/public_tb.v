// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06399 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1cc32433a7e;
    stim[1] = 41'h0b8ca0c5329;
    stim[2] = 41'h0831884ec0d;
    stim[3] = 41'h10bc2a1669a;
    stim[4] = 41'h11640fbb135;
    stim[5] = 41'h003a3378756;
    stim[6] = 41'h1fe37ed4409;
    stim[7] = 41'h04b1f74c82b;
    stim[8] = 41'h11b4ba980ac;
    stim[9] = 41'h0b3119a0047;
    stim[10] = 41'h17f84e3fc36;
    stim[11] = 41'h0ce34d501fa;
    stim[12] = 41'h1b152b1f767;
    stim[13] = 41'h187a8a29ff4;
    stim[14] = 41'h01b1d95ff51;
    stim[15] = 41'h1dad10e4796;
    stim[16] = 41'h0f2e869de39;
    stim[17] = 41'h1fb7a59f169;
    stim[18] = 41'h19e2de5cc36;
    stim[19] = 41'h00b7b5ad0e7;
    stim[20] = 41'h14a68a02997;
    stim[21] = 41'h1f2e352ab7c;
    stim[22] = 41'h197561b6be4;
    stim[23] = 41'h0cfdefb93be;
    stim[24] = 41'h1c7eaa1e97c;
    stim[25] = 41'h0daab3921ae;
    stim[26] = 41'h0cff7f6c043;
    stim[27] = 41'h0f237aa68c5;
    stim[28] = 41'h00b60909aa2;
    stim[29] = 41'h0f2910dab5e;
    stim[30] = 41'h14ab99f1637;
    stim[31] = 41'h127317130b8;
    stim[32] = 41'h083f7db2358;
    stim[33] = 41'h08b001ba889;
    stim[34] = 41'h1aba39cc975;
    stim[35] = 41'h15f20710899;
    stim[36] = 41'h1fa4ccf30a9;
    stim[37] = 41'h0de57437ebb;
    stim[38] = 41'h11ac6ee39f5;
    stim[39] = 41'h0f719e8b381;
    stim[40] = 41'h10e68e63837;
    stim[41] = 41'h0c2abb2f859;
    stim[42] = 41'h1ae018d34c4;
    stim[43] = 41'h0cfd038e8e3;
    stim[44] = 41'h1ba26b46d82;
    stim[45] = 41'h07aed593a8b;
    stim[46] = 41'h1468a26adc1;
    stim[47] = 41'h0121cfc0d03;
    stim[48] = 41'h1877c6627bf;
    stim[49] = 41'h12363bb0e79;
    stim[50] = 41'h05ec482cc5c;
    stim[51] = 41'h046b35204a3;
    stim[52] = 41'h1ae4c23385e;
    stim[53] = 41'h17726be761c;
    stim[54] = 41'h05349f686b3;
    stim[55] = 41'h152e5dac00a;
    stim[56] = 41'h0669182db5e;
    stim[57] = 41'h18ff0698da4;
    stim[58] = 41'h1db574a4d1a;
    stim[59] = 41'h0cea3d02fae;
    stim[60] = 41'h036efa01d5f;
    stim[61] = 41'h0ce445f0908;
    stim[62] = 41'h117ed10eae1;
    stim[63] = 41'h17acde4ed63;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000002;
      expv[8] = 33'h000000002;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000006;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000002;
      expv[20] = 33'h000000002;
      expv[21] = 33'h100000000;
      expv[22] = 33'h00000000f;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h10000000a;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000002;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000007;
      expv[32] = 33'h100000007;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h10000000f;
      expv[36] = 33'h100000007;
      expv[37] = 33'h00000000f;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000007;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000007;
      expv[42] = 33'h100000000;
      expv[43] = 33'h10000000f;
      expv[44] = 33'h100000000;
      expv[45] = 33'h10000000f;
      expv[46] = 33'h10000000e;
      expv[47] = 33'h100000007;
      expv[48] = 33'h100000004;
      expv[49] = 33'h10000000f;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000007;
      expv[52] = 33'h100000001;
      expv[53] = 33'h10000000f;
      expv[54] = 33'h100000001;
      expv[55] = 33'h100000004;
      expv[56] = 33'h100000001;
      expv[57] = 33'h100000009;
      expv[58] = 33'h10000000f;
      expv[59] = 33'h10000000f;
      expv[60] = 33'h100000000;
      expv[61] = 33'h10000000d;
      expv[62] = 33'h100000000;
      expv[63] = 33'h10000000a;
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
