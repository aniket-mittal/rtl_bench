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

  TopLevel74181 dut (
    .S(in_vec[13:10]),
    .A(in_vec[9:6]),
    .B(in_vec[5:2]),
    .M(in_vec[1:1]),
    .CNb(in_vec[0:0]),
    .F(out_vec[7:4]),
    .X(out_vec[3:3]),
    .Y(out_vec[2:2]),
    .CN4b(out_vec[1:1]),
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
    stim[0] = 14'h0852;
    stim[1] = 14'h3bcd;
    stim[2] = 14'h2b33;
    stim[3] = 14'h1cad;
    stim[4] = 14'h1f71;
    stim[5] = 14'h125b;
    stim[6] = 14'h0ed1;
    stim[7] = 14'h3483;
    stim[8] = 14'h1985;
    stim[9] = 14'h3713;
    stim[10] = 14'h019d;
    stim[11] = 14'h195e;
    stim[12] = 14'h0c2d;
    stim[13] = 14'h3880;
    stim[14] = 14'h211d;
    stim[15] = 14'h270d;
    stim[16] = 14'h363b;
    stim[17] = 14'h13a2;
    stim[18] = 14'h29d0;
    stim[19] = 14'h389a;
    stim[20] = 14'h1e39;
    stim[21] = 14'h08c9;
    stim[22] = 14'h03e5;
    stim[23] = 14'h07c4;
    stim[24] = 14'h156a;
    stim[25] = 14'h3efb;
    stim[26] = 14'h04d4;
    stim[27] = 14'h1c88;
    stim[28] = 14'h0160;
    stim[29] = 14'h20c5;
    stim[30] = 14'h356f;
    stim[31] = 14'h1f38;
    stim[32] = 14'h1a73;
    stim[33] = 14'h1576;
    stim[34] = 14'h0f36;
    stim[35] = 14'h0842;
    stim[36] = 14'h07e0;
    stim[37] = 14'h3755;
    stim[38] = 14'h0dc5;
    stim[39] = 14'h38c9;
    stim[40] = 14'h1654;
    stim[41] = 14'h0325;
    stim[42] = 14'h1e84;
    stim[43] = 14'h220e;
    stim[44] = 14'h2315;
    stim[45] = 14'h34c8;
    stim[46] = 14'h206f;
    stim[47] = 14'h03d5;
    stim[48] = 14'h0cd9;
    stim[49] = 14'h2de6;
    stim[50] = 14'h092f;
    stim[51] = 14'h3a25;
    stim[52] = 14'h0e2e;
    stim[53] = 14'h3ca0;
    stim[54] = 14'h18fa;
    stim[55] = 14'h166a;
    stim[56] = 14'h2221;
    stim[57] = 14'h096a;
    stim[58] = 14'h3a88;
    stim[59] = 14'h3c6f;
    stim[60] = 14'h0251;
    stim[61] = 14'h3249;
    stim[62] = 14'h349f;
    stim[63] = 14'h18ee;
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
      expv[0] = 8'h42;
      expv[1] = 8'hec;
      expv[2] = 8'hcc;
      expv[3] = 8'hf7;
      expv[4] = 8'h0c;
      expv[5] = 8'hfd;
      expv[6] = 8'hf7;
      expv[7] = 8'hfb;
      expv[8] = 8'h4c;
      expv[9] = 8'hfd;
      expv[10] = 8'h62;
      expv[11] = 8'h22;
      expv[12] = 8'hf7;
      expv[13] = 8'h2c;
      expv[14] = 8'h8a;
      expv[15] = 8'hf7;
      expv[16] = 8'h9c;
      expv[17] = 8'h7c;
      expv[18] = 8'h4c;
      expv[19] = 8'h6a;
      expv[20] = 8'hf7;
      expv[21] = 8'hf7;
      expv[22] = 8'hf7;
      expv[23] = 8'h04;
      expv[24] = 8'h5c;
      expv[25] = 8'hbc;
      expv[26] = 8'h82;
      expv[27] = 8'h04;
      expv[28] = 8'h62;
      expv[29] = 8'h4a;
      expv[30] = 8'h5c;
      expv[31] = 8'h04;
      expv[32] = 8'h5a;
      expv[33] = 8'h22;
      expv[34] = 8'h04;
      expv[35] = 8'h04;
      expv[36] = 8'h04;
      expv[37] = 8'hac;
      expv[38] = 8'hf7;
      expv[39] = 8'h2c;
      expv[40] = 8'h6c;
      expv[41] = 8'hc2;
      expv[42] = 8'hac;
      expv[43] = 8'h72;
      expv[44] = 8'h0c;
      expv[45] = 8'h7a;
      expv[46] = 8'hfb;
      expv[47] = 8'hf7;
      expv[48] = 8'hf7;
      expv[49] = 8'h1c;
      expv[50] = 8'hb2;
      expv[51] = 8'h6c;
      expv[52] = 8'h04;
      expv[53] = 8'h2c;
      expv[54] = 8'hda;
      expv[55] = 8'h5a;
      expv[56] = 8'h0c;
      expv[57] = 8'ha2;
      expv[58] = 8'hac;
      expv[59] = 8'h1c;
      expv[60] = 8'h92;
      expv[61] = 8'h2c;
      expv[62] = 8'haa;
      expv[63] = 8'h82;
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
