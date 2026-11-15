// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03576 dut (
    .CLK(clk),
    .RESET(in_vec[13:13]),
    .PUSH(in_vec[12:12]),
    .POP(in_vec[11:11]),
    .D(in_vec[10:0]),
    .Q(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h27eb;
    stim[1] = 14'h346d;
    stim[2] = 14'h1dd4;
    stim[3] = 14'h1ea3;
    stim[4] = 14'h153b;
    stim[5] = 14'h1071;
    stim[6] = 14'h0c4b;
    stim[7] = 14'h13ef;
    stim[8] = 14'h149b;
    stim[9] = 14'h1f9d;
    stim[10] = 14'h0271;
    stim[11] = 14'h0b23;
    stim[12] = 14'h17cf;
    stim[13] = 14'h15e5;
    stim[14] = 14'h024d;
    stim[15] = 14'h0bd8;
    stim[16] = 14'h1c34;
    stim[17] = 14'h108b;
    stim[18] = 14'h1dd6;
    stim[19] = 14'h0365;
    stim[20] = 14'h0c3a;
    stim[21] = 14'h02dd;
    stim[22] = 14'h1b08;
    stim[23] = 14'h15e4;
    stim[24] = 14'h1171;
    stim[25] = 14'h16f1;
    stim[26] = 14'h140f;
    stim[27] = 14'h1c35;
    stim[28] = 14'h19df;
    stim[29] = 14'h15d1;
    stim[30] = 14'h0f70;
    stim[31] = 14'h127d;
    stim[32] = 14'h176e;
    stim[33] = 14'h0dee;
    stim[34] = 14'h074e;
    stim[35] = 14'h1bd9;
    stim[36] = 14'h17b1;
    stim[37] = 14'h15ee;
    stim[38] = 14'h0834;
    stim[39] = 14'h040e;
    stim[40] = 14'h1494;
    stim[41] = 14'h12db;
    stim[42] = 14'h1e8e;
    stim[43] = 14'h028b;
    stim[44] = 14'h08c1;
    stim[45] = 14'h0086;
    stim[46] = 14'h0a74;
    stim[47] = 14'h0f5a;
    stim[48] = 14'h0765;
    stim[49] = 14'h10c9;
    stim[50] = 14'h17af;
    stim[51] = 14'h0ced;
    stim[52] = 14'h0c62;
    stim[53] = 14'h3bcc;
    stim[54] = 14'h13a6;
    stim[55] = 14'h1b50;
    stim[56] = 14'h13e8;
    stim[57] = 14'h0b49;
    stim[58] = 14'h140b;
    stim[59] = 14'h15ea;
    stim[60] = 14'h02c9;
    stim[61] = 14'h0c4b;
    stim[62] = 14'h0d11;
    stim[63] = 14'h163b;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'h5d4;
      expv[5] = 11'h6a3;
      expv[6] = 11'h53b;
      expv[7] = 11'h071;
      expv[8] = 11'h53b;
      expv[9] = 11'h3ef;
      expv[10] = 11'h49b;
      expv[11] = 11'h49b;
      expv[12] = 11'h79d;
      expv[13] = 11'h49b;
      expv[14] = 11'h7cf;
      expv[15] = 11'h7cf;
      expv[16] = 11'h5e5;
      expv[17] = 11'h7cf;
      expv[18] = 11'h434;
      expv[19] = 11'h08b;
      expv[20] = 11'h08b;
      expv[21] = 11'h5d6;
      expv[22] = 11'h5d6;
      expv[23] = 11'h08b;
      expv[24] = 11'h308;
      expv[25] = 11'h5e4;
      expv[26] = 11'h171;
      expv[27] = 11'h6f1;
      expv[28] = 11'h40f;
      expv[29] = 11'h435;
      expv[30] = 11'h1df;
      expv[31] = 11'h5d1;
      expv[32] = 11'h1df;
      expv[33] = 11'h27d;
      expv[34] = 11'h76e;
      expv[35] = 11'h76e;
      expv[36] = 11'h27d;
      expv[37] = 11'h3d9;
      expv[38] = 11'h7b1;
      expv[39] = 11'h5ee;
      expv[40] = 11'h5ee;
      expv[41] = 11'h7b1;
      expv[42] = 11'h494;
      expv[43] = 11'h2db;
      expv[44] = 11'h2db;
      expv[45] = 11'h68e;
      expv[46] = 11'h68e;
      expv[47] = 11'h2db;
      expv[48] = 11'h494;
      expv[49] = 11'h494;
      expv[50] = 11'h7b1;
      expv[51] = 11'h0c9;
      expv[52] = 11'h7af;
      expv[53] = 11'h0c9;
      expv[54] = 11'h7b1;
      expv[55] = 11'hxxx;
      expv[56] = 11'h3a6;
      expv[57] = 11'h350;
      expv[58] = 11'h3e8;
      expv[59] = 11'h350;
      expv[60] = 11'h40b;
      expv[61] = 11'h40b;
      expv[62] = 11'h5ea;
      expv[63] = 11'h40b;
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
