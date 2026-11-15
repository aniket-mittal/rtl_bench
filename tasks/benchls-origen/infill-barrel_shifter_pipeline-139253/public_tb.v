// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139253 dut (
    .clk(clk),
    .rst_n(in_vec[38:38]),
    .data_in(in_vec[37:6]),
    .shift_amount(in_vec[5:1]),
    .shift_left(in_vec[0:0]),
    .shifted_out(out_vec[32:1]),
    .zero_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h37e61474e6;
    stim[1] = 39'h0bc26d2b89;
    stim[2] = 39'h6e9ebd6ae8;
    stim[3] = 39'h665137c261;
    stim[4] = 39'h766c56cca8;
    stim[5] = 39'h5b0c81f6e9;
    stim[6] = 39'h508748e10c;
    stim[7] = 39'h7b74e783e4;
    stim[8] = 39'h5d57424768;
    stim[9] = 39'h562a56cfa6;
    stim[10] = 39'h40e27c6d2f;
    stim[11] = 39'h5478812ee5;
    stim[12] = 39'h4657a94b49;
    stim[13] = 39'h5edb3c51e5;
    stim[14] = 39'h5e3ddc1cdb;
    stim[15] = 39'h7da2a0fdd0;
    stim[16] = 39'h5aa7183738;
    stim[17] = 39'h6c40aef81d;
    stim[18] = 39'h5bb5721a6e;
    stim[19] = 39'h7183f2dbae;
    stim[20] = 39'h5aec8ae281;
    stim[21] = 39'h45117dac8c;
    stim[22] = 39'h50eeab64b0;
    stim[23] = 39'h568e2b786b;
    stim[24] = 39'h42079db50a;
    stim[25] = 39'h5690eeb9bc;
    stim[26] = 39'h457d4d30f4;
    stim[27] = 39'h5005bc398e;
    stim[28] = 39'h4ec039b429;
    stim[29] = 39'h40c2ef3989;
    stim[30] = 39'h6d32b1836e;
    stim[31] = 39'h5595632d95;
    stim[32] = 39'h48521ecadb;
    stim[33] = 39'h5c5af8a7d4;
    stim[34] = 39'h473704ef7c;
    stim[35] = 39'h6e4c504ec0;
    stim[36] = 39'h6cfed716c9;
    stim[37] = 39'h70382f25e8;
    stim[38] = 39'h7a900f3aec;
    stim[39] = 39'h79d7d12a38;
    stim[40] = 39'h74ef020019;
    stim[41] = 39'h5af53d016c;
    stim[42] = 39'h68edcd8769;
    stim[43] = 39'h5d6340480f;
    stim[44] = 39'h406182431b;
    stim[45] = 39'h5f5d9cd2e2;
    stim[46] = 39'h5705964221;
    stim[47] = 39'h6482392f50;
    stim[48] = 39'h61ce808401;
    stim[49] = 39'h78a18e808f;
    stim[50] = 39'h6ee9338d19;
    stim[51] = 39'h50ded134bc;
    stim[52] = 39'h6cbe6877c3;
    stim[53] = 39'h54cdf0cbc2;
    stim[54] = 39'h5a75b4b4dc;
    stim[55] = 39'h4c09524605;
    stim[56] = 39'h762ab87c11;
    stim[57] = 39'h50f54ef9cb;
    stim[58] = 39'h472e67ae93;
    stim[59] = 39'h756377b636;
    stim[60] = 39'h73b355d39f;
    stim[61] = 39'h643e4b72fd;
    stim[62] = 39'h4b566a0d90;
    stim[63] = 39'h6c0676e98c;
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
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h00000174e;
      expv[6] = 33'h1be120000;
      expv[7] = 33'h000001b36;
      expv[8] = 33'h0fb600000;
      expv[9] = 33'h00210e91c;
      expv[10] = 33'h0000076e8;
      expv[11] = 33'h000000eaa;
      expv[12] = 33'h00000162a;
      expv[13] = 33'h1b4000000;
      expv[14] = 33'h025d80000;
      expv[15] = 33'h12bd4a5a0;
      expv[16] = 33'h18a380000;
      expv[17] = 33'h1dc1cc000;
      expv[18] = 33'h001ed1506;
      expv[19] = 33'h00000000c;
      expv[20] = 33'h15df00000;
      expv[21] = 33'h0000001ba;
      expv[22] = 33'h000000318;
      expv[23] = 33'h0d7645714;
      expv[24] = 33'h000a22fb4;
      expv[25] = 33'h000000086;
      expv[26] = 33'h178400000;
      expv[27] = 33'h00081e76c;
      expv[28] = 33'h000000002;
      expv[29] = 33'h00000000a;
      expv[30] = 33'h001005bc2;
      expv[31] = 33'h0da000000;
      expv[32] = 33'h061779cc0;
      expv[33] = 33'h0000002d2;
      expv[34] = 33'h0ac65b000;
      expv[35] = 33'h01ecac000;
      expv[36] = 33'h00038b5f0;
      expv[37] = 33'h000000001;
      expv[38] = 33'h172628276;
      expv[39] = 33'h07f6b8b60;
      expv[40] = 33'h00000181c;
      expv[41] = 33'h000000752;
      expv[42] = 33'h00000001c;
      expv[43] = 33'h181000000;
      expv[44] = 33'h00000035e;
      expv[45] = 33'h0c3a00000;
      expv[46] = 33'h18d012000;
      expv[47] = 33'h182430000;
      expv[48] = 33'h000007d76;
      expv[49] = 33'h0b2100000;
      expv[50] = 33'h0012411c8;
      expv[51] = 33'h10e740420;
      expv[52] = 33'h0863a0200;
      expv[53] = 33'h099c68000;
      expv[54] = 33'h000000002;
      expv[55] = 33'h0cbe6877c;
      expv[56] = 33'h05337c32e;
      expv[57] = 33'h000034eb6;
      expv[58] = 33'h1812a48c0;
      expv[59] = 33'h155c3e000;
      expv[60] = 33'h0f54ef9c0;
      expv[61] = 33'h0e67ae800;
      expv[62] = 33'h000000034;
      expv[63] = 33'h1574e0000;
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
