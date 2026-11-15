// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022207 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .rx_done_tick(in_vec[16:16]),
    .rx_data_in(in_vec[15:8]),
    .alu_data_in(in_vec[7:0]),
    .tx_start(out_vec[30:30]),
    .A(out_vec[29:22]),
    .B(out_vec[21:14]),
    .OPCODE(out_vec[13:8]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h379ad;
    stim[1] = 18'h2640b;
    stim[2] = 18'h02378;
    stim[3] = 18'h0ab4b;
    stim[4] = 18'h114be;
    stim[5] = 18'h09140;
    stim[6] = 18'h1d6fb;
    stim[7] = 18'h1d57a;
    stim[8] = 18'h0f94c;
    stim[9] = 18'h17288;
    stim[10] = 18'h128ff;
    stim[11] = 18'h15c6a;
    stim[12] = 18'h1f4f2;
    stim[13] = 18'h1c745;
    stim[14] = 18'h0f4f7;
    stim[15] = 18'h1c26e;
    stim[16] = 18'h122c4;
    stim[17] = 18'h05e21;
    stim[18] = 18'h1b7a6;
    stim[19] = 18'h03ce7;
    stim[20] = 18'h02dab;
    stim[21] = 18'h1b491;
    stim[22] = 18'h03cb6;
    stim[23] = 18'h0d548;
    stim[24] = 18'h05845;
    stim[25] = 18'h14ec3;
    stim[26] = 18'h0f8e8;
    stim[27] = 18'h1da9b;
    stim[28] = 18'h0edc9;
    stim[29] = 18'h0e92c;
    stim[30] = 18'h075da;
    stim[31] = 18'h1abdf;
    stim[32] = 18'h14bbb;
    stim[33] = 18'h1d59a;
    stim[34] = 18'h07db7;
    stim[35] = 18'h123fe;
    stim[36] = 18'h06913;
    stim[37] = 18'h152c9;
    stim[38] = 18'h16076;
    stim[39] = 18'h0f5c6;
    stim[40] = 18'h19c88;
    stim[41] = 18'h05078;
    stim[42] = 18'h0f47e;
    stim[43] = 18'h19987;
    stim[44] = 18'h1d388;
    stim[45] = 18'h04f76;
    stim[46] = 18'h0730a;
    stim[47] = 18'h03986;
    stim[48] = 18'h1ba7b;
    stim[49] = 18'h1bddc;
    stim[50] = 18'h190dc;
    stim[51] = 18'h1ff14;
    stim[52] = 18'h0c7f5;
    stim[53] = 18'h1e5be;
    stim[54] = 18'h17395;
    stim[55] = 18'h08254;
    stim[56] = 18'h05a07;
    stim[57] = 18'h1dbbc;
    stim[58] = 18'h15560;
    stim[59] = 18'h16a4e;
    stim[60] = 18'h0d5c1;
    stim[61] = 18'h140c1;
    stim[62] = 18'h2c154;
    stim[63] = 18'h03a20;
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
      expv[0] = 31'h000000ad;
      expv[1] = 31'h0000000b;
      expv[2] = 31'h00000078;
      expv[3] = 31'h0000004b;
      expv[4] = 31'h000000be;
      expv[5] = 31'h05000040;
      expv[6] = 31'h050000fb;
      expv[7] = 31'h0535807a;
      expv[8] = 31'h0535954c;
      expv[9] = 31'h05359588;
      expv[10] = 31'h453595ff;
      expv[11] = 31'h4a35956a;
      expv[12] = 31'h4a1715f2;
      expv[13] = 31'h4a173445;
      expv[14] = 31'h4a1734f7;
      expv[15] = 31'h0a17346e;
      expv[16] = 31'h309734c4;
      expv[17] = 31'h3088b421;
      expv[18] = 31'h3088b4a6;
      expv[19] = 31'h3088b7e7;
      expv[20] = 31'h3088b7ab;
      expv[21] = 31'h3088b791;
      expv[22] = 31'h7088b7b6;
      expv[23] = 31'h3088b748;
      expv[24] = 31'h3088b745;
      expv[25] = 31'h3088b7c3;
      expv[26] = 31'h1388b7e8;
      expv[27] = 31'h1388b79b;
      expv[28] = 31'h13b6b7c9;
      expv[29] = 31'h13b6b72c;
      expv[30] = 31'h13b6b7da;
      expv[31] = 31'h13b6b7df;
      expv[32] = 31'h13b6abbb;
      expv[33] = 31'h53b6ab9a;
      expv[34] = 31'h7576abb7;
      expv[35] = 31'h3576abfe;
      expv[36] = 31'h3548eb13;
      expv[37] = 31'h3548ebc9;
      expv[38] = 31'h3548d276;
      expv[39] = 31'h7548d2c6;
      expv[40] = 31'h3548d288;
      expv[41] = 31'h2708d278;
      expv[42] = 31'h2708d27e;
      expv[43] = 31'h2708d287;
      expv[44] = 31'h27265288;
      expv[45] = 31'h27265376;
      expv[46] = 31'h2726530a;
      expv[47] = 31'h27265386;
      expv[48] = 31'h2726537b;
      expv[49] = 31'h672653dc;
      expv[50] = 31'h6f6653dc;
      expv[51] = 31'h6f641314;
      expv[52] = 31'h6f643ff5;
      expv[53] = 31'h2f643fbe;
      expv[54] = 31'h6f643f95;
      expv[55] = 31'h5ce43f54;
      expv[56] = 31'h1ce43f07;
      expv[57] = 31'h1ce43fbc;
      expv[58] = 31'h1cf6ff60;
      expv[59] = 31'h1cf6d54e;
      expv[60] = 31'h5cf6d5c1;
      expv[61] = 31'h1cf6d5c1;
      expv[62] = 31'h00000054;
      expv[63] = 31'h00000020;
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
