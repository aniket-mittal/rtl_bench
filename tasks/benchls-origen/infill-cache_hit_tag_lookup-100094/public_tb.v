// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_100094 dut (
    .clk(clk),
    .rst_n(in_vec[22:22]),
    .cke(in_vec[21:21]),
    .clear_start(in_vec[20:20]),
    .s_user(in_vec[19:12]),
    .s_index(in_vec[11:2]),
    .s_strb(in_vec[1:1]),
    .s_valid(in_vec[0:0]),
    .clear_busy(out_vec[23:23]),
    .m_user(out_vec[22:15]),
    .m_index(out_vec[14:5]),
    .m_way(out_vec[4:3]),
    .m_hit(out_vec[2:2]),
    .m_strb(out_vec[1:1]),
    .m_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h248437;
    stim[1] = 23'h1f1448;
    stim[2] = 23'h43ecf2;
    stim[3] = 23'h781c94;
    stim[4] = 23'h4434d1;
    stim[5] = 23'h5ce4d8;
    stim[6] = 23'h518f16;
    stim[7] = 23'h5749dc;
    stim[8] = 23'h7178e3;
    stim[9] = 23'h5f335e;
    stim[10] = 23'h469c54;
    stim[11] = 23'h6e6af4;
    stim[12] = 23'h5b19c5;
    stim[13] = 23'h4c1d75;
    stim[14] = 23'h4846f3;
    stim[15] = 23'h6c919d;
    stim[16] = 23'h4a674f;
    stim[17] = 23'h6a24ca;
    stim[18] = 23'h789b5f;
    stim[19] = 23'h70f1a0;
    stim[20] = 23'h5e0b16;
    stim[21] = 23'h7a0ee0;
    stim[22] = 23'h677faa;
    stim[23] = 23'h5cee49;
    stim[24] = 23'h52d58c;
    stim[25] = 23'h4c4ac8;
    stim[26] = 23'h7222f1;
    stim[27] = 23'h15c23b;
    stim[28] = 23'h5e6fab;
    stim[29] = 23'h173bf5;
    stim[30] = 23'h5390c4;
    stim[31] = 23'h6efe44;
    stim[32] = 23'h14cac8;
    stim[33] = 23'h79b3e3;
    stim[34] = 23'h6af371;
    stim[35] = 23'h5c6bbe;
    stim[36] = 23'h7de2d0;
    stim[37] = 23'h5eca48;
    stim[38] = 23'h5adbb2;
    stim[39] = 23'h542167;
    stim[40] = 23'h6f0e17;
    stim[41] = 23'h6a981b;
    stim[42] = 23'h4e9951;
    stim[43] = 23'h71e4b1;
    stim[44] = 23'h7f7b99;
    stim[45] = 23'h4b414c;
    stim[46] = 23'h7d3028;
    stim[47] = 23'h401962;
    stim[48] = 23'h03ca5e;
    stim[49] = 23'h5d7b7e;
    stim[50] = 23'h46dfdd;
    stim[51] = 23'h52a722;
    stim[52] = 23'h5e765f;
    stim[53] = 23'h51af99;
    stim[54] = 23'h5c4270;
    stim[55] = 23'h6617db;
    stim[56] = 23'h586c54;
    stim[57] = 23'h5c5fe2;
    stim[58] = 23'h63a193;
    stim[59] = 23'h5a180e;
    stim[60] = 23'h5c8bd5;
    stim[61] = 23'h5cfa24;
    stim[62] = 23'h6153da;
    stim[63] = 23'h7b12f8;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h800000;
      expv[5] = 24'h800000;
      expv[6] = 24'h800000;
      expv[7] = 24'h800000;
      expv[8] = 24'h800000;
      expv[9] = 24'h800000;
      expv[10] = 24'h800000;
      expv[11] = 24'h800000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h800000;
      expv[20] = 24'h800000;
      expv[21] = 24'h800000;
      expv[22] = 24'h800000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h800000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h800000;
      expv[38] = 24'h800000;
      expv[39] = 24'h800000;
      expv[40] = 24'h800000;
      expv[41] = 24'h000000;
      expv[42] = 24'h54c0c3;
      expv[43] = 24'h54c0c3;
      expv[44] = 24'hd4c0c3;
      expv[45] = 24'hd4c0c3;
      expv[46] = 24'hd4c0c3;
      expv[47] = 24'hd4c0c3;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h30bec3;
      expv[57] = 24'h30bec3;
      expv[58] = 24'h30bec3;
      expv[59] = 24'h1d0c8b;
      expv[60] = 24'h1d0c8b;
      expv[61] = 24'h1d0c8b;
      expv[62] = 24'h1d0c8b;
      expv[63] = 24'h1d0c88;
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
