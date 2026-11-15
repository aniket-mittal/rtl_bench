// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072258 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h611;
    stim[1] = 11'h64e;
    stim[2] = 11'h062;
    stim[3] = 11'h1b8;
    stim[4] = 11'h037;
    stim[5] = 11'h3c5;
    stim[6] = 11'h039;
    stim[7] = 11'h21a;
    stim[8] = 11'h2c5;
    stim[9] = 11'h6c9;
    stim[10] = 11'h03b;
    stim[11] = 11'h066;
    stim[12] = 11'h11e;
    stim[13] = 11'h10c;
    stim[14] = 11'h1b2;
    stim[15] = 11'h230;
    stim[16] = 11'h02b;
    stim[17] = 11'h394;
    stim[18] = 11'h310;
    stim[19] = 11'h06b;
    stim[20] = 11'h1ef;
    stim[21] = 11'h26f;
    stim[22] = 11'h177;
    stim[23] = 11'h38d;
    stim[24] = 11'h300;
    stim[25] = 11'h13b;
    stim[26] = 11'h30f;
    stim[27] = 11'h131;
    stim[28] = 11'h1f5;
    stim[29] = 11'h026;
    stim[30] = 11'h2c3;
    stim[31] = 11'h358;
    stim[32] = 11'h02c;
    stim[33] = 11'h250;
    stim[34] = 11'h11c;
    stim[35] = 11'h0bf;
    stim[36] = 11'h56a;
    stim[37] = 11'h1fe;
    stim[38] = 11'h12b;
    stim[39] = 11'h068;
    stim[40] = 11'h091;
    stim[41] = 11'h24b;
    stim[42] = 11'h253;
    stim[43] = 11'h06e;
    stim[44] = 11'h13d;
    stim[45] = 11'h0e5;
    stim[46] = 11'h3ff;
    stim[47] = 11'h1be;
    stim[48] = 11'h0ff;
    stim[49] = 11'h1dd;
    stim[50] = 11'h1ea;
    stim[51] = 11'h3c0;
    stim[52] = 11'h3b7;
    stim[53] = 11'h08b;
    stim[54] = 11'h346;
    stim[55] = 11'h01c;
    stim[56] = 11'h16d;
    stim[57] = 11'h30b;
    stim[58] = 11'h17b;
    stim[59] = 11'h2fd;
    stim[60] = 11'h2f8;
    stim[61] = 11'h07f;
    stim[62] = 11'h0c8;
    stim[63] = 11'h093;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'h498;
      expv[3] = 12'h8c0;
      expv[4] = 12'h8c0;
      expv[5] = 12'h86d;
      expv[6] = 12'h868;
      expv[7] = 12'h868;
      expv[8] = 12'hc35;
      expv[9] = 12'hc30;
      expv[10] = 12'h430;
      expv[11] = 12'h870;
      expv[12] = 12'h8cd;
      expv[13] = 12'h0ce;
      expv[14] = 12'h0ce;
      expv[15] = 12'h0ce;
      expv[16] = 12'h0ce;
      expv[17] = 12'ha3d;
      expv[18] = 12'ha3d;
      expv[19] = 12'ha3d;
      expv[20] = 12'h8d5;
      expv[21] = 12'hbdd;
      expv[22] = 12'hcdd;
      expv[23] = 12'haed;
      expv[24] = 12'hae8;
      expv[25] = 12'hae8;
      expv[26] = 12'ha75;
      expv[27] = 12'he1d;
      expv[28] = 12'he18;
      expv[29] = 12'he18;
      expv[30] = 12'h84d;
      expv[31] = 12'hd85;
      expv[32] = 12'hd85;
      expv[33] = 12'hd85;
      expv[34] = 12'hd85;
      expv[35] = 12'hd85;
      expv[36] = 12'h97d;
      expv[37] = 12'h178;
      expv[38] = 12'hbf8;
      expv[39] = 12'ha55;
      expv[40] = 12'ha55;
      expv[41] = 12'ha50;
      expv[42] = 12'hc95;
      expv[43] = 12'hca5;
      expv[44] = 12'h4a6;
      expv[45] = 12'h8dd;
      expv[46] = 12'h8d8;
      expv[47] = 12'hffd;
      expv[48] = 12'h7fe;
      expv[49] = 12'hb7d;
      expv[50] = 12'hb78;
      expv[51] = 12'hbd5;
      expv[52] = 12'hbd5;
      expv[53] = 12'hf6d;
      expv[54] = 12'h915;
      expv[55] = 12'h116;
      expv[56] = 12'h116;
      expv[57] = 12'he8d;
      expv[58] = 12'he15;
      expv[59] = 12'haf5;
      expv[60] = 12'haf0;
      expv[61] = 12'haf0;
      expv[62] = 12'h8fd;
      expv[63] = 12'h8fd;
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
