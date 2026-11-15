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

  rtlpp_11023 dut (
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
    stim[0] = 41'h0010db43d73;
    stim[1] = 41'h0e5793f2313;
    stim[2] = 41'h19e66c469e2;
    stim[3] = 41'h0f74837923c;
    stim[4] = 41'h17a2f1b553f;
    stim[5] = 41'h037f937ae57;
    stim[6] = 41'h0aed3710bf3;
    stim[7] = 41'h03ab542a732;
    stim[8] = 41'h1165af25a78;
    stim[9] = 41'h09e26ddb0e4;
    stim[10] = 41'h08bdb3eb9ba;
    stim[11] = 41'h126f4096dc0;
    stim[12] = 41'h18e5f1d600e;
    stim[13] = 41'h02ea7974f3f;
    stim[14] = 41'h146d9fcfd30;
    stim[15] = 41'h05fd96737b4;
    stim[16] = 41'h057c071cd9a;
    stim[17] = 41'h18e6e4607d3;
    stim[18] = 41'h0b29d111a8f;
    stim[19] = 41'h0fa2db220ac;
    stim[20] = 41'h1e688a24f3e;
    stim[21] = 41'h05a409261ef;
    stim[22] = 41'h1514866b00c;
    stim[23] = 41'h05ff6e1c228;
    stim[24] = 41'h0f3ac6f934f;
    stim[25] = 41'h0f730aab1b3;
    stim[26] = 41'h0a227bb6499;
    stim[27] = 41'h07f8a8d440a;
    stim[28] = 41'h12a8a015757;
    stim[29] = 41'h04afe1b86b5;
    stim[30] = 41'h10a8a5fb57c;
    stim[31] = 41'h1eb8927f967;
    stim[32] = 41'h09679bf0559;
    stim[33] = 41'h0d636d1403d;
    stim[34] = 41'h0571f400026;
    stim[35] = 41'h18e3237d57b;
    stim[36] = 41'h14f69c51ad3;
    stim[37] = 41'h186f6650c78;
    stim[38] = 41'h08a7c9f9e81;
    stim[39] = 41'h086308a2297;
    stim[40] = 41'h083431864db;
    stim[41] = 41'h05a2ca2e378;
    stim[42] = 41'h000115034f5;
    stim[43] = 41'h083eef319e7;
    stim[44] = 41'h1ba35e192fd;
    stim[45] = 41'h17bca1790f6;
    stim[46] = 41'h1a78cba31c3;
    stim[47] = 41'h066ae8c65af;
    stim[48] = 41'h15e620ee610;
    stim[49] = 41'h15aec6ecadb;
    stim[50] = 41'h0262cc89640;
    stim[51] = 41'h1e26411ea2c;
    stim[52] = 41'h10a3ba3bfe6;
    stim[53] = 41'h10391569440;
    stim[54] = 41'h0667acf3588;
    stim[55] = 41'h06346f61bca;
    stim[56] = 41'h196ff6238dd;
    stim[57] = 41'h0b7ab5a719d;
    stim[58] = 41'h19bacd22fa5;
    stim[59] = 41'h06feb1e4cb0;
    stim[60] = 41'h166ca08f95d;
    stim[61] = 41'h183ff5b4157;
    stim[62] = 41'h136e1d91695;
    stim[63] = 41'h1e7668b1ce0;
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
      expv[5] = 33'h100000000;
      expv[6] = 33'h10000000d;
      expv[7] = 33'h100000000;
      expv[8] = 33'h10000000e;
      expv[9] = 33'h10000000f;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h10000000f;
      expv[13] = 33'h10000000f;
      expv[14] = 33'h10000000b;
      expv[15] = 33'h00000000f;
      expv[16] = 33'h000000007;
      expv[17] = 33'h000000005;
      expv[18] = 33'h00000000f;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h00000000f;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000007;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h00000000f;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000002;
      expv[31] = 33'h000000000;
      expv[32] = 33'h00000000f;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000005;
      expv[36] = 33'h00000000f;
      expv[37] = 33'h000000000;
      expv[38] = 33'h00000000f;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000009;
      expv[49] = 33'h000000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000009;
      expv[52] = 33'h10000000f;
      expv[53] = 33'h10000000b;
      expv[54] = 33'h10000000b;
      expv[55] = 33'h100000009;
      expv[56] = 33'h100000008;
      expv[57] = 33'h10000000b;
      expv[58] = 33'h100000000;
      expv[59] = 33'h10000000b;
      expv[60] = 33'h10000000b;
      expv[61] = 33'h10000000b;
      expv[62] = 33'h10000000f;
      expv[63] = 33'h10000000d;
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
