// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164159 dut (
    .A(in_vec[23:12]),
    .B(in_vec[11:0]),
    .O(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h39a1ce;
    stim[1] = 24'hef4126;
    stim[2] = 24'h9d18f0;
    stim[3] = 24'hbb4892;
    stim[4] = 24'h0ea1ea;
    stim[5] = 24'h1c3077;
    stim[6] = 24'hf0809b;
    stim[7] = 24'h0f0aa4;
    stim[8] = 24'h64ca7e;
    stim[9] = 24'hc451c4;
    stim[10] = 24'h8026d2;
    stim[11] = 24'hf3db4c;
    stim[12] = 24'h409758;
    stim[13] = 24'h5b8a65;
    stim[14] = 24'hcf6b10;
    stim[15] = 24'hff6531;
    stim[16] = 24'h3896c1;
    stim[17] = 24'h6a9dea;
    stim[18] = 24'h760878;
    stim[19] = 24'h110b12;
    stim[20] = 24'h8a2459;
    stim[21] = 24'h841248;
    stim[22] = 24'h6c5dc8;
    stim[23] = 24'h296c5f;
    stim[24] = 24'hff3aa7;
    stim[25] = 24'h2e1388;
    stim[26] = 24'h603ec0;
    stim[27] = 24'h551c06;
    stim[28] = 24'hfb3e06;
    stim[29] = 24'h922564;
    stim[30] = 24'he747e3;
    stim[31] = 24'hf81228;
    stim[32] = 24'h5a5481;
    stim[33] = 24'h1b2a14;
    stim[34] = 24'hb5ba68;
    stim[35] = 24'h962e00;
    stim[36] = 24'h68ee6e;
    stim[37] = 24'h093902;
    stim[38] = 24'hc72d82;
    stim[39] = 24'hca9c00;
    stim[40] = 24'hd3da11;
    stim[41] = 24'h53f128;
    stim[42] = 24'hc465ca;
    stim[43] = 24'h58e50f;
    stim[44] = 24'h126f51;
    stim[45] = 24'h036d5a;
    stim[46] = 24'h39f59a;
    stim[47] = 24'h4becd6;
    stim[48] = 24'he6b792;
    stim[49] = 24'he57cf7;
    stim[50] = 24'h1a913c;
    stim[51] = 24'h100183;
    stim[52] = 24'h413654;
    stim[53] = 24'h8099e1;
    stim[54] = 24'hbe58eb;
    stim[55] = 24'h6ef0f4;
    stim[56] = 24'hd55667;
    stim[57] = 24'h04040c;
    stim[58] = 24'he2a41f;
    stim[59] = 24'h694ae0;
    stim[60] = 24'hb725f7;
    stim[61] = 24'hdfeb51;
    stim[62] = 24'hf8a71f;
    stim[63] = 24'h255357;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 13'h0000;
      expv[1] = 13'h0023;
      expv[2] = 13'h0032;
      expv[3] = 13'h0001;
      expv[4] = 13'h0023;
      expv[5] = 13'h0020;
      expv[6] = 13'h0002;
      expv[7] = 13'h0023;
      expv[8] = 13'h0028;
      expv[9] = 13'h0026;
      expv[10] = 13'h0002;
      expv[11] = 13'h000d;
      expv[12] = 13'h0008;
      expv[13] = 13'h0003;
      expv[14] = 13'h0021;
      expv[15] = 13'h0071;
      expv[16] = 13'h0002;
      expv[17] = 13'h0003;
      expv[18] = 13'h0023;
      expv[19] = 13'h0012;
      expv[20] = 13'h0001;
      expv[21] = 13'h0020;
      expv[22] = 13'h0022;
      expv[23] = 13'h0014;
      expv[24] = 13'h0063;
      expv[25] = 13'h0021;
      expv[26] = 13'h0000;
      expv[27] = 13'h0020;
      expv[28] = 13'h0043;
      expv[29] = 13'h0003;
      expv[30] = 13'h0023;
      expv[31] = 13'h0040;
      expv[32] = 13'h0003;
      expv[33] = 13'h0001;
      expv[34] = 13'h0022;
      expv[35] = 13'h0023;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0023;
      expv[39] = 13'h0001;
      expv[40] = 13'h0011;
      expv[41] = 13'h0003;
      expv[42] = 13'h0020;
      expv[43] = 13'h000e;
      expv[44] = 13'h0001;
      expv[45] = 13'h0011;
      expv[46] = 13'h0008;
      expv[47] = 13'h0003;
      expv[48] = 13'h0023;
      expv[49] = 13'h0020;
      expv[50] = 13'h0009;
      expv[51] = 13'h0000;
      expv[52] = 13'h0012;
      expv[53] = 13'h0002;
      expv[54] = 13'h0021;
      expv[55] = 13'h0027;
      expv[56] = 13'h0020;
      expv[57] = 13'h0020;
      expv[58] = 13'h000b;
      expv[59] = 13'h0000;
      expv[60] = 13'h0023;
      expv[61] = 13'h0031;
      expv[62] = 13'h004a;
      expv[63] = 13'h0032;
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
