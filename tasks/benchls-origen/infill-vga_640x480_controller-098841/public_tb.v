// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 79;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098841 dut (
    .iCLK_50M(clk),
    .iRed(in_vec[30:21]),
    .iGreen(in_vec[20:11]),
    .iBlue(in_vec[10:1]),
    .iRST_N(in_vec[0:0]),
    .oCurrent_X(out_vec[78:68]),
    .oCurrent_Y(out_vec[67:57]),
    .oAddress(out_vec[56:35]),
    .oRequest(out_vec[34:34]),
    .oVGA_R(out_vec[33:24]),
    .oVGA_G(out_vec[23:14]),
    .oVGA_B(out_vec[13:4]),
    .oVGA_HS(out_vec[3:3]),
    .oVGA_VS(out_vec[2:2]),
    .oVGA_BLANK(out_vec[1:1]),
    .oVGA_CLOCK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h6c279bc8;
    stim[1] = 31'h7d356336;
    stim[2] = 31'h18459c93;
    stim[3] = 31'h03fd0045;
    stim[4] = 31'h74df8a47;
    stim[5] = 31'h3b98f6fd;
    stim[6] = 31'h1546ae7b;
    stim[7] = 31'h7699160d;
    stim[8] = 31'h09c12285;
    stim[9] = 31'h6821f30f;
    stim[10] = 31'h563a6c6b;
    stim[11] = 31'h00e7ebdd;
    stim[12] = 31'h12d00991;
    stim[13] = 31'h76875a93;
    stim[14] = 31'h539bc37d;
    stim[15] = 31'h27493d2b;
    stim[16] = 31'h19083061;
    stim[17] = 31'h5e571d87;
    stim[18] = 31'h6804a117;
    stim[19] = 31'h43ad9ce5;
    stim[20] = 31'h6a7b8ab1;
    stim[21] = 31'h792f43d9;
    stim[22] = 31'h5dbe951a;
    stim[23] = 31'h4df3f1f7;
    stim[24] = 31'h2e7353bf;
    stim[25] = 31'h6fdc38fd;
    stim[26] = 31'h790cc32f;
    stim[27] = 31'h2f0e190d;
    stim[28] = 31'h28d199bd;
    stim[29] = 31'h20abf0c7;
    stim[30] = 31'h4aabd625;
    stim[31] = 31'h4e3bac57;
    stim[32] = 31'h43b0498f;
    stim[33] = 31'h726a1a35;
    stim[34] = 31'h7a48abcb;
    stim[35] = 31'h365d3681;
    stim[36] = 31'h5990e015;
    stim[37] = 31'h7f128ced;
    stim[38] = 31'h46fab1ef;
    stim[39] = 31'h6ba72e81;
    stim[40] = 31'h4dabeded;
    stim[41] = 31'h0e1bf6c5;
    stim[42] = 31'h39c75a07;
    stim[43] = 31'h4d602e4d;
    stim[44] = 31'h064de13f;
    stim[45] = 31'h40158f05;
    stim[46] = 31'h5ffe5e31;
    stim[47] = 31'h2ab413b9;
    stim[48] = 31'h7654f1ed;
    stim[49] = 31'h5d379763;
    stim[50] = 31'h681de6c3;
    stim[51] = 31'h5a7413b3;
    stim[52] = 31'h083887bd;
    stim[53] = 31'h306d11cf;
    stim[54] = 31'h5539ffd3;
    stim[55] = 31'h13fd47a1;
    stim[56] = 31'h0f3a3e9f;
    stim[57] = 31'h239bad63;
    stim[58] = 31'h5c9cda91;
    stim[59] = 31'h1537810f;
    stim[60] = 31'h65382977;
    stim[61] = 31'h44f775c1;
    stim[62] = 31'h235b7609;
    stim[63] = 31'h1a63c4c7;
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
      expv[0] = 79'h0000000000000000000d;
      expv[1] = 79'h0000000000000000000d;
      expv[2] = 79'h0000000000000000000d;
      expv[3] = 79'h000000000000c22ce49e;
      expv[4] = 79'h000000000000c22ce49f;
      expv[5] = 79'h0000000000000000000e;
      expv[6] = 79'h0000000000000000000f;
      expv[7] = 79'h0000000000000000000e;
      expv[8] = 79'h0000000000000000000f;
      expv[9] = 79'h0000000000000000000e;
      expv[10] = 79'h0000000000000000000f;
      expv[11] = 79'h0000000000000000000e;
      expv[12] = 79'h0000000000000000000f;
      expv[13] = 79'h0000000000000000000e;
      expv[14] = 79'h0000000000000000000f;
      expv[15] = 79'h0000000000000000000e;
      expv[16] = 79'h0000000000000000000f;
      expv[17] = 79'h0000000000000000000e;
      expv[18] = 79'h0000000000000000000f;
      expv[19] = 79'h0000000000000000000e;
      expv[20] = 79'h0000000000000000000f;
      expv[21] = 79'h0000000000000000000e;
      expv[22] = 79'h0000000000000000000d;
      expv[23] = 79'h0000000000000000000d;
      expv[24] = 79'h0000000000026f9f8fbe;
      expv[25] = 79'h0000000000026f9f8fbf;
      expv[26] = 79'h0000000000000000000e;
      expv[27] = 79'h0000000000000000000f;
      expv[28] = 79'h0000000000000000000e;
      expv[29] = 79'h0000000000000000000f;
      expv[30] = 79'h0000000000000000000e;
      expv[31] = 79'h0000000000000000000f;
      expv[32] = 79'h0000000000000000000e;
      expv[33] = 79'h0000000000000000000f;
      expv[34] = 79'h0000000000000000000e;
      expv[35] = 79'h0000000000000000000f;
      expv[36] = 79'h0000000000000000000e;
      expv[37] = 79'h0000000000000000000f;
      expv[38] = 79'h0000000000000000000e;
      expv[39] = 79'h0000000000000000000f;
      expv[40] = 79'h0000000000000000000e;
      expv[41] = 79'h0000000000000000000f;
      expv[42] = 79'h0000000000000000000e;
      expv[43] = 79'h0000000000000000000f;
      expv[44] = 79'h0000000000000000000e;
      expv[45] = 79'h0000000000000000000f;
      expv[46] = 79'h0000000000000000000e;
      expv[47] = 79'h0000000000000000000f;
      expv[48] = 79'h0000000000000000000e;
      expv[49] = 79'h0000000000000000000f;
      expv[50] = 79'h0000000000000000000e;
      expv[51] = 79'h0000000000000000000f;
      expv[52] = 79'h0000000000000000000e;
      expv[53] = 79'h0000000000000000000f;
      expv[54] = 79'h00000000000000000006;
      expv[55] = 79'h00000000000000000007;
      expv[56] = 79'h00000000000000000006;
      expv[57] = 79'h00000000000000000007;
      expv[58] = 79'h00000000000000000006;
      expv[59] = 79'h00000000000000000007;
      expv[60] = 79'h00000000000000000006;
      expv[61] = 79'h00000000000000000007;
      expv[62] = 79'h00000000000000000006;
      expv[63] = 79'h00000000000000000007;
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
