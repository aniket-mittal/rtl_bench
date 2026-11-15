// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00620 dut (
    .clk(clk),
    .data(in_vec[29:14]),
    .rdaddress(in_vec[13:9]),
    .rdclken(in_vec[8:8]),
    .reset_n(in_vec[7:7]),
    .wraddress(in_vec[6:2]),
    .wrclock(in_vec[1:1]),
    .wren(in_vec[0:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h259fde46;
    stim[1] = 30'h3f714c28;
    stim[2] = 30'h13f4cae1;
    stim[3] = 30'h1a4507aa;
    stim[4] = 30'h03425f8c;
    stim[5] = 30'h1c6d40c4;
    stim[6] = 30'h0c8379bf;
    stim[7] = 30'h0f25fbc3;
    stim[8] = 30'h032b0492;
    stim[9] = 30'h214808ad;
    stim[10] = 30'h056a52f1;
    stim[11] = 30'h0d7c03cd;
    stim[12] = 30'h07038ef0;
    stim[13] = 30'h3f9d2a86;
    stim[14] = 30'h2a894989;
    stim[15] = 30'h2d155380;
    stim[16] = 30'h3b738da2;
    stim[17] = 30'h05ab1196;
    stim[18] = 30'h1801b388;
    stim[19] = 30'h010661a7;
    stim[20] = 30'h2cf021e0;
    stim[21] = 30'h0bb0c0d4;
    stim[22] = 30'h26e2d3dc;
    stim[23] = 30'h22d47aa1;
    stim[24] = 30'h377cfcc6;
    stim[25] = 30'h082d9df3;
    stim[26] = 30'h038eaa82;
    stim[27] = 30'h1bb016d5;
    stim[28] = 30'h28c971ea;
    stim[29] = 30'h34a35fc4;
    stim[30] = 30'h06ebf4fb;
    stim[31] = 30'h2008d1a6;
    stim[32] = 30'h304f05b7;
    stim[33] = 30'h0bc6baa7;
    stim[34] = 30'h35292992;
    stim[35] = 30'h15d6cdea;
    stim[36] = 30'h1e3b22c8;
    stim[37] = 30'h00d324a9;
    stim[38] = 30'h0bb9a6c4;
    stim[39] = 30'h1d30a3d5;
    stim[40] = 30'h14c103ae;
    stim[41] = 30'h272523b1;
    stim[42] = 30'h30f3b1a8;
    stim[43] = 30'h13398ae7;
    stim[44] = 30'h1e1f539d;
    stim[45] = 30'h3a2f4ea0;
    stim[46] = 30'h059f7eca;
    stim[47] = 30'h06401493;
    stim[48] = 30'h125867d1;
    stim[49] = 30'h2b24f1d6;
    stim[50] = 30'h207e3ec5;
    stim[51] = 30'h36c163b8;
    stim[52] = 30'h044828ad;
    stim[53] = 30'h15e1efea;
    stim[54] = 30'h375f9ae1;
    stim[55] = 30'h08c9c2fe;
    stim[56] = 30'h25a185c7;
    stim[57] = 30'h0bcd03b5;
    stim[58] = 30'h2f9e65ee;
    stim[59] = 30'h1b7545d0;
    stim[60] = 30'h3ad027af;
    stim[61] = 30'h221c9dfa;
    stim[62] = 30'h060d0b97;
    stim[63] = 30'h21466fc4;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'h320d;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'h0419;
      expv[24] = 16'h0419;
      expv[25] = 16'h0419;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'h320d;
      expv[31] = 16'h320d;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'h0419;
      expv[46] = 16'h0419;
      expv[47] = 16'h0419;
      expv[48] = 16'h0419;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
