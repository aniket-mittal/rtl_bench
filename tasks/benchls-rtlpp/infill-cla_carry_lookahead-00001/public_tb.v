// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00001 dut (
    .A0(in_vec[13:13]),
    .A1(in_vec[12:12]),
    .A2(in_vec[11:11]),
    .A3(in_vec[10:10]),
    .B0(in_vec[9:9]),
    .B1(in_vec[8:8]),
    .B2(in_vec[7:7]),
    .B3(in_vec[6:6]),
    .S0(in_vec[5:5]),
    .S1(in_vec[4:4]),
    .S2(in_vec[3:3]),
    .S3(in_vec[2:2]),
    .M(in_vec[1:1]),
    .CIN_N(in_vec[0:0]),
    .F0(out_vec[7:7]),
    .F1(out_vec[6:6]),
    .F2(out_vec[5:5]),
    .F3(out_vec[4:4]),
    .COUT_N(out_vec[3:3]),
    .Y(out_vec[2:2]),
    .X(out_vec[1:1]),
    .AEB(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h1cf7;
    stim[1] = 14'h098c;
    stim[2] = 14'h2e36;
    stim[3] = 14'h3011;
    stim[4] = 14'h1058;
    stim[5] = 14'h34a3;
    stim[6] = 14'h3e2f;
    stim[7] = 14'h020b;
    stim[8] = 14'h161c;
    stim[9] = 14'h028f;
    stim[10] = 14'h0aa8;
    stim[11] = 14'h3238;
    stim[12] = 14'h0ac2;
    stim[13] = 14'h0bf4;
    stim[14] = 14'h141a;
    stim[15] = 14'h2c26;
    stim[16] = 14'h2c74;
    stim[17] = 14'h0101;
    stim[18] = 14'h037f;
    stim[19] = 14'h2cb1;
    stim[20] = 14'h1ccf;
    stim[21] = 14'h1795;
    stim[22] = 14'h2c1d;
    stim[23] = 14'h1cdf;
    stim[24] = 14'h3e95;
    stim[25] = 14'h1997;
    stim[26] = 14'h330b;
    stim[27] = 14'h1703;
    stim[28] = 14'h044a;
    stim[29] = 14'h209c;
    stim[30] = 14'h023d;
    stim[31] = 14'h1948;
    stim[32] = 14'h1937;
    stim[33] = 14'h308b;
    stim[34] = 14'h2db9;
    stim[35] = 14'h121b;
    stim[36] = 14'h3c52;
    stim[37] = 14'h3767;
    stim[38] = 14'h3ada;
    stim[39] = 14'h11e6;
    stim[40] = 14'h2d59;
    stim[41] = 14'h3dcd;
    stim[42] = 14'h0906;
    stim[43] = 14'h0e45;
    stim[44] = 14'h1e19;
    stim[45] = 14'h1391;
    stim[46] = 14'h0577;
    stim[47] = 14'h1ea4;
    stim[48] = 14'h13fa;
    stim[49] = 14'h08a4;
    stim[50] = 14'h2756;
    stim[51] = 14'h13a9;
    stim[52] = 14'h1c44;
    stim[53] = 14'h18ea;
    stim[54] = 14'h29fd;
    stim[55] = 14'h1a7d;
    stim[56] = 14'h1d30;
    stim[57] = 14'h24a0;
    stim[58] = 14'h0ac4;
    stim[59] = 14'h18ea;
    stim[60] = 14'h236f;
    stim[61] = 14'h1039;
    stim[62] = 14'h0822;
    stim[63] = 14'h0701;
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
      expv[0] = 8'h36;
      expv[1] = 8'h9a;
      expv[2] = 8'h86;
      expv[3] = 8'hfd;
      expv[4] = 8'h5a;
      expv[5] = 8'h0c;
      expv[6] = 8'hf7;
      expv[7] = 8'hf9;
      expv[8] = 8'h96;
      expv[9] = 8'hf9;
      expv[10] = 8'h68;
      expv[11] = 8'h46;
      expv[12] = 8'hd8;
      expv[13] = 8'h26;
      expv[14] = 8'h56;
      expv[15] = 8'h48;
      expv[16] = 8'h16;
      expv[17] = 8'h08;
      expv[18] = 8'h0c;
      expv[19] = 8'hfd;
      expv[20] = 8'hf7;
      expv[21] = 8'h3a;
      expv[22] = 8'h36;
      expv[23] = 8'h76;
      expv[24] = 8'h26;
      expv[25] = 8'h66;
      expv[26] = 8'h38;
      expv[27] = 8'ha8;
      expv[28] = 8'he8;
      expv[29] = 8'hba;
      expv[30] = 8'hfd;
      expv[31] = 8'hda;
      expv[32] = 8'h46;
      expv[33] = 8'hfb;
      expv[34] = 8'h16;
      expv[35] = 8'hc6;
      expv[36] = 8'h04;
      expv[37] = 8'hf7;
      expv[38] = 8'h5a;
      expv[39] = 8'hc6;
      expv[40] = 8'h46;
      expv[41] = 8'h76;
      expv[42] = 8'hd8;
      expv[43] = 8'h26;
      expv[44] = 8'h36;
      expv[45] = 8'h58;
      expv[46] = 8'h16;
      expv[47] = 8'h26;
      expv[48] = 8'h04;
      expv[49] = 8'h9a;
      expv[50] = 8'hd6;
      expv[51] = 8'he8;
      expv[52] = 8'he6;
      expv[53] = 8'hc6;
      expv[54] = 8'h26;
      expv[55] = 8'ha6;
      expv[56] = 8'h04;
      expv[57] = 8'h78;
      expv[58] = 8'h9a;
      expv[59] = 8'hc6;
      expv[60] = 8'haa;
      expv[61] = 8'h86;
      expv[62] = 8'hd8;
      expv[63] = 8'h18;
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
