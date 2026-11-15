// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04311 dut (
    ._devsel(clk),
    .addr(in_vec[16:13]),
    .fclk(in_vec[12:12]),
    .q3(in_vec[11:11]),
    ._reset(in_vec[10:10]),
    .dataIn(in_vec[9:2]),
    .sense(in_vec[1:1]),
    .rddata(in_vec[0:0]),
    .dataOut(out_vec[15:8]),
    .wrdata(out_vec[7:7]),
    .phase(out_vec[6:3]),
    ._wrreq(out_vec[2:2]),
    ._enbl1(out_vec[1:1]),
    ._enbl2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h00e76;
    stim[1] = 17'h075be;
    stim[2] = 17'h1436c;
    stim[3] = 17'h183b4;
    stim[4] = 17'h0c3b4;
    stim[5] = 17'h0bb73;
    stim[6] = 17'h02bec;
    stim[7] = 17'h1402b;
    stim[8] = 17'h1c2e6;
    stim[9] = 17'h0c201;
    stim[10] = 17'h06bac;
    stim[11] = 17'h1a8e0;
    stim[12] = 17'h1d827;
    stim[13] = 17'h0d079;
    stim[14] = 17'h060b1;
    stim[15] = 17'h0ebc3;
    stim[16] = 17'h171d1;
    stim[17] = 17'h1da70;
    stim[18] = 17'h01380;
    stim[19] = 17'h149f9;
    stim[20] = 17'h070ad;
    stim[21] = 17'h03142;
    stim[22] = 17'h0882d;
    stim[23] = 17'h1f03c;
    stim[24] = 17'h0a1ca;
    stim[25] = 17'h09bdb;
    stim[26] = 17'h0abae;
    stim[27] = 17'h0f23e;
    stim[28] = 17'h123ac;
    stim[29] = 17'h0c021;
    stim[30] = 17'h0ab10;
    stim[31] = 17'h05be4;
    stim[32] = 17'h1aa67;
    stim[33] = 17'h059e3;
    stim[34] = 17'h11201;
    stim[35] = 17'h0a899;
    stim[36] = 17'h07b8c;
    stim[37] = 17'h11b14;
    stim[38] = 17'h160a6;
    stim[39] = 17'h01132;
    stim[40] = 17'h1b12c;
    stim[41] = 17'h149a6;
    stim[42] = 17'h19344;
    stim[43] = 17'h1c2dd;
    stim[44] = 17'h01a76;
    stim[45] = 17'h1a9cf;
    stim[46] = 17'h1e1ce;
    stim[47] = 17'h05233;
    stim[48] = 17'h05980;
    stim[49] = 17'h16a6f;
    stim[50] = 17'h0d031;
    stim[51] = 17'h0d341;
    stim[52] = 17'h0524a;
    stim[53] = 17'h0d113;
    stim[54] = 17'h1613f;
    stim[55] = 17'h061c8;
    stim[56] = 17'h14a7e;
    stim[57] = 17'h0d11a;
    stim[58] = 17'h18e86;
    stim[59] = 17'h0a9bc;
    stim[60] = 17'h18205;
    stim[61] = 17'h1b0af;
    stim[62] = 17'h0f9ee;
    stim[63] = 17'h1404b;
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
      expv[0] = 16'h0007;
      expv[1] = 16'h0007;
      expv[2] = 16'h0007;
      expv[3] = 16'h0007;
      expv[4] = 16'h0007;
      expv[5] = 16'h0007;
      expv[6] = 16'h0007;
      expv[7] = 16'h0007;
      expv[8] = 16'h0007;
      expv[9] = 16'h0007;
      expv[10] = 16'h0007;
      expv[11] = 16'h0007;
      expv[12] = 16'h0007;
      expv[13] = 16'h0007;
      expv[14] = 16'h0007;
      expv[15] = 16'h0007;
      expv[16] = 16'h0007;
      expv[17] = 16'h0007;
      expv[18] = 16'h0007;
      expv[19] = 16'h0007;
      expv[20] = 16'h0007;
      expv[21] = 16'h0007;
      expv[22] = 16'h0007;
      expv[23] = 16'h0007;
      expv[24] = 16'h0007;
      expv[25] = 16'h0007;
      expv[26] = 16'h0007;
      expv[27] = 16'h0007;
      expv[28] = 16'h0007;
      expv[29] = 16'h0007;
      expv[30] = 16'h0007;
      expv[31] = 16'h0007;
      expv[32] = 16'h0007;
      expv[33] = 16'h0007;
      expv[34] = 16'h0007;
      expv[35] = 16'h0007;
      expv[36] = 16'h0007;
      expv[37] = 16'h0007;
      expv[38] = 16'h0007;
      expv[39] = 16'h0007;
      expv[40] = 16'h0007;
      expv[41] = 16'h0007;
      expv[42] = 16'h0007;
      expv[43] = 16'h0007;
      expv[44] = 16'h0007;
      expv[45] = 16'h0007;
      expv[46] = 16'h0007;
      expv[47] = 16'h0007;
      expv[48] = 16'h0007;
      expv[49] = 16'h0007;
      expv[50] = 16'h0007;
      expv[51] = 16'h0007;
      expv[52] = 16'h0007;
      expv[53] = 16'h0007;
      expv[54] = 16'h0007;
      expv[55] = 16'h0007;
      expv[56] = 16'h0007;
      expv[57] = 16'h0007;
      expv[58] = 16'h0007;
      expv[59] = 16'h0007;
      expv[60] = 16'h0007;
      expv[61] = 16'h0007;
      expv[62] = 16'h0007;
      expv[63] = 16'h0007;
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
