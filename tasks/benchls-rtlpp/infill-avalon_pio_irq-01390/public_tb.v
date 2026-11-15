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

  rtlpp_01390 dut (
    .clk(clk),
    .address(in_vec[38:37]),
    .chipselect(in_vec[36:36]),
    .in_port(in_vec[35:34]),
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
    stim[0] = 39'h256dca7d03;
    stim[1] = 39'h54018fb8d6;
    stim[2] = 39'h6a07288808;
    stim[3] = 39'h5a8f6b64d5;
    stim[4] = 39'h7b5fb13f5a;
    stim[5] = 39'h1e4da1c009;
    stim[6] = 39'h6732694f31;
    stim[7] = 39'h2e214d688e;
    stim[8] = 39'h1f24b15353;
    stim[9] = 39'h2386108396;
    stim[10] = 39'h6b8bf29a87;
    stim[11] = 39'h2e74c2186c;
    stim[12] = 39'h068ed0ef9e;
    stim[13] = 39'h0af1d39d02;
    stim[14] = 39'h6f5a176aa8;
    stim[15] = 39'h765531e4b4;
    stim[16] = 39'h0ed63c927a;
    stim[17] = 39'h331f7e1548;
    stim[18] = 39'h333c63ed6a;
    stim[19] = 39'h127bb4a2e0;
    stim[20] = 39'h663bd6f3a1;
    stim[21] = 39'h7702b51fc0;
    stim[22] = 39'h224047674b;
    stim[23] = 39'h43305a6ee4;
    stim[24] = 39'h4f3111d7f6;
    stim[25] = 39'h0aea98f31d;
    stim[26] = 39'h4bbf58a4ba;
    stim[27] = 39'h42daecd8a5;
    stim[28] = 39'h2bb1412cc7;
    stim[29] = 39'h2aba724003;
    stim[30] = 39'h4fb4405168;
    stim[31] = 39'h1bd3b5bde1;
    stim[32] = 39'h0a8bbf207b;
    stim[33] = 39'h426f924ae0;
    stim[34] = 39'h2bdef983e5;
    stim[35] = 39'h02ab8b1342;
    stim[36] = 39'h4a2ba60d89;
    stim[37] = 39'h7fbea9c1f2;
    stim[38] = 39'h3be6e3251c;
    stim[39] = 39'h43f0a15391;
    stim[40] = 39'h0fccd9ed58;
    stim[41] = 39'h0b55d24df0;
    stim[42] = 39'h0f4d047644;
    stim[43] = 39'h6636b00188;
    stim[44] = 39'h272e1eb004;
    stim[45] = 39'h66cdc2adee;
    stim[46] = 39'h4e98b0838e;
    stim[47] = 39'h765d2efc68;
    stim[48] = 39'h17edd6b166;
    stim[49] = 39'h5ae05af908;
    stim[50] = 39'h639bc34409;
    stim[51] = 39'h6ca3a4eecd;
    stim[52] = 39'h3ed1c6e7f4;
    stim[53] = 39'h4e7f452d3b;
    stim[54] = 39'h0773e5c441;
    stim[55] = 39'h1b853ac1a9;
    stim[56] = 39'h67a51f0682;
    stim[57] = 39'h3f385048d2;
    stim[58] = 39'h02ab79df19;
    stim[59] = 39'h1f69b5d5cb;
    stim[60] = 39'h7aa19cb02a;
    stim[61] = 39'h479669b3d4;
    stim[62] = 39'h1a1670436f;
    stim[63] = 39'h3be1038d75;
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
      expv[6] = 33'h000000003;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000003;
      expv[10] = 33'h000000000;
      expv[11] = 33'h100000002;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000001;
      expv[14] = 33'h100000002;
      expv[15] = 33'h100000003;
      expv[16] = 33'h000000003;
      expv[17] = 33'h000000003;
      expv[18] = 33'h000000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000003;
      expv[22] = 33'h100000003;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000001;
      expv[25] = 33'h100000001;
      expv[26] = 33'h100000002;
      expv[27] = 33'h100000001;
      expv[28] = 33'h100000001;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000002;
      expv[33] = 33'h100000002;
      expv[34] = 33'h100000001;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000003;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000003;
      expv[42] = 33'h100000002;
      expv[43] = 33'h100000003;
      expv[44] = 33'h100000003;
      expv[45] = 33'h100000000;
      expv[46] = 33'h100000003;
      expv[47] = 33'h100000001;
      expv[48] = 33'h000000003;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000001;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000002;
      expv[57] = 33'h000000002;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000003;
      expv[61] = 33'h000000003;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000002;
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
