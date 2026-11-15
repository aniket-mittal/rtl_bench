// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00434 dut (
    .clock(clk),
    .Enable(in_vec[51:51]),
    .Reset(in_vec[50:50]),
    .BaudRate(in_vec[49:30]),
    .ClockFrequency(in_vec[29:0]),
    .ClockI2C(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h52f435102b291;
    stim[1] = 52'hff4196ea37994;
    stim[2] = 52'h32813e2e536a9;
    stim[3] = 52'h337fc5b278d14;
    stim[4] = 52'h9123748996cf5;
    stim[5] = 52'h60ebb0c577610;
    stim[6] = 52'h3d572fb58941e;
    stim[7] = 52'h22cbb6ca3fc00;
    stim[8] = 52'h2aba8610c22f9;
    stim[9] = 52'hb769495114769;
    stim[10] = 52'h34883eb220178;
    stim[11] = 52'h8ee908df82ee0;
    stim[12] = 52'hb6ec7984bf864;
    stim[13] = 52'hb0a8c87abde99;
    stim[14] = 52'hbd5c3e5bac71b;
    stim[15] = 52'h2159b3a7312b6;
    stim[16] = 52'hbcd60ca132d08;
    stim[17] = 52'hbf0550e7b5949;
    stim[18] = 52'h0233d3fe77ef2;
    stim[19] = 52'h995001b0e846c;
    stim[20] = 52'hae7bced1a27e1;
    stim[21] = 52'h20c85ab9f782c;
    stim[22] = 52'h8eb78e62fe8eb;
    stim[23] = 52'h8423893891356;
    stim[24] = 52'h08946a4441af0;
    stim[25] = 52'h92cb281516254;
    stim[26] = 52'hb0d67cdf48f34;
    stim[27] = 52'hdca89057121fb;
    stim[28] = 52'h83848b143ec36;
    stim[29] = 52'h54fab1bd8fdf1;
    stim[30] = 52'h261e01e7510bd;
    stim[31] = 52'h963aedb680938;
    stim[32] = 52'h0ffea258f18f5;
    stim[33] = 52'h02fa81b1f48c4;
    stim[34] = 52'hbd93495303195;
    stim[35] = 52'h80f8241e4f9ec;
    stim[36] = 52'h8f1ab53fd23cf;
    stim[37] = 52'ha681d8a6ad893;
    stim[38] = 52'h35bb3345c2fbc;
    stim[39] = 52'ha0f4bd7da978f;
    stim[40] = 52'h81c1a77a4ed3d;
    stim[41] = 52'h0207ce9625afe;
    stim[42] = 52'h8ce5e36eb6588;
    stim[43] = 52'ha59396ab5007a;
    stim[44] = 52'h0197e1c982127;
    stim[45] = 52'h2b728fdfd9a15;
    stim[46] = 52'h031bce52f20dc;
    stim[47] = 52'h8fc722f549339;
    stim[48] = 52'ha66242a3bc5fe;
    stim[49] = 52'h88f1aaaad8205;
    stim[50] = 52'h038417cbcc19c;
    stim[51] = 52'h9742db9aeac94;
    stim[52] = 52'h0e81d58323a40;
    stim[53] = 52'ha5a8dd9c56120;
    stim[54] = 52'h8d4feeaabac43;
    stim[55] = 52'h36fa63825a896;
    stim[56] = 52'h171ade0f65bfa;
    stim[57] = 52'h8eb306726413a;
    stim[58] = 52'h0557ba7e7a2cd;
    stim[59] = 52'h201e7656dfd3d;
    stim[60] = 52'h034e52a57f9f9;
    stim[61] = 52'ha3c176026f185;
    stim[62] = 52'h9883216a6a729;
    stim[63] = 52'hb5f8349d278e9;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
