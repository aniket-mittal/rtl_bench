// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10320 dut (
    .clk(clk),
    .reset(in_vec[13:13]),
    .PIXEL_DATA(in_vec[12:3]),
    .LINE_VALID(in_vec[2:2]),
    .FRAME_VALID(in_vec[1:1]),
    .ready(in_vec[0:0]),
    .data(out_vec[12:3]),
    .startofpacket(out_vec[2:2]),
    .endofpacket(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3b86;
    stim[1] = 14'h2377;
    stim[2] = 14'h12f9;
    stim[3] = 14'h15a2;
    stim[4] = 14'h1136;
    stim[5] = 14'h051d;
    stim[6] = 14'h153e;
    stim[7] = 14'h13ac;
    stim[8] = 14'h1de7;
    stim[9] = 14'h002d;
    stim[10] = 14'h176e;
    stim[11] = 14'h1f61;
    stim[12] = 14'h0af6;
    stim[13] = 14'h00ed;
    stim[14] = 14'h0cb4;
    stim[15] = 14'h0f76;
    stim[16] = 14'h0ea4;
    stim[17] = 14'h0a8b;
    stim[18] = 14'h02c0;
    stim[19] = 14'h1124;
    stim[20] = 14'h1be4;
    stim[21] = 14'h1f31;
    stim[22] = 14'h18ad;
    stim[23] = 14'h19fb;
    stim[24] = 14'h0ee5;
    stim[25] = 14'h0a95;
    stim[26] = 14'h0b8f;
    stim[27] = 14'h07f9;
    stim[28] = 14'h0de5;
    stim[29] = 14'h1eab;
    stim[30] = 14'h0e4c;
    stim[31] = 14'h0d51;
    stim[32] = 14'h0fdd;
    stim[33] = 14'h0453;
    stim[34] = 14'h179d;
    stim[35] = 14'h06e4;
    stim[36] = 14'h12b0;
    stim[37] = 14'h0bfb;
    stim[38] = 14'h0c43;
    stim[39] = 14'h0145;
    stim[40] = 14'h1796;
    stim[41] = 14'h1912;
    stim[42] = 14'h0d48;
    stim[43] = 14'h0762;
    stim[44] = 14'h01f6;
    stim[45] = 14'h0ed9;
    stim[46] = 14'h18b4;
    stim[47] = 14'h097a;
    stim[48] = 14'h024e;
    stim[49] = 14'h056c;
    stim[50] = 14'h0016;
    stim[51] = 14'h18a7;
    stim[52] = 14'h1381;
    stim[53] = 14'h009d;
    stim[54] = 14'h01a4;
    stim[55] = 14'h188f;
    stim[56] = 14'h1c0f;
    stim[57] = 14'h1b2d;
    stim[58] = 14'h03f9;
    stim[59] = 14'h0346;
    stim[60] = 14'h12de;
    stim[61] = 14'h0a2c;
    stim[62] = 14'h123f;
    stim[63] = 14'h2589;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0373;
      expv[6] = 13'h15a4;
      expv[7] = 13'h1135;
      expv[8] = 13'h1135;
      expv[9] = 13'h1134;
      expv[10] = 13'h051a;
      expv[11] = 13'h1de5;
      expv[12] = 13'h002a;
      expv[13] = 13'h176d;
      expv[14] = 13'h1f62;
      expv[15] = 13'h0af5;
      expv[16] = 13'h0af5;
      expv[17] = 13'h0af5;
      expv[18] = 13'h0af4;
      expv[19] = 13'h0af4;
      expv[20] = 13'h0af4;
      expv[21] = 13'h0af4;
      expv[22] = 13'h0af4;
      expv[23] = 13'h0af4;
      expv[24] = 13'h0af4;
      expv[25] = 13'h0af4;
      expv[26] = 13'h0af4;
      expv[27] = 13'h0af4;
      expv[28] = 13'h00ea;
      expv[29] = 13'h0b8d;
      expv[30] = 13'h0b8c;
      expv[31] = 13'h0b8c;
      expv[32] = 13'h0b8c;
      expv[33] = 13'h0b8c;
      expv[34] = 13'h0b8c;
      expv[35] = 13'h0b8c;
      expv[36] = 13'h0b8c;
      expv[37] = 13'h0b8c;
      expv[38] = 13'h0b8c;
      expv[39] = 13'h0b8c;
      expv[40] = 13'h0b8c;
      expv[41] = 13'h0b8c;
      expv[42] = 13'h07fa;
      expv[43] = 13'h1795;
      expv[44] = 13'h1795;
      expv[45] = 13'h1795;
      expv[46] = 13'h1912;
      expv[47] = 13'h01f5;
      expv[48] = 13'h01f5;
      expv[49] = 13'h01f5;
      expv[50] = 13'h01f5;
      expv[51] = 13'h01f5;
      expv[52] = 13'h0eda;
      expv[53] = 13'h0015;
      expv[54] = 13'h0014;
      expv[55] = 13'h18a3;
      expv[56] = 13'h18a2;
      expv[57] = 13'h009e;
      expv[58] = 13'h188d;
      expv[59] = 13'h188c;
      expv[60] = 13'h1c0b;
      expv[61] = 13'h1c0b;
      expv[62] = 13'h1c0b;
      expv[63] = 13'h1c0a;
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
