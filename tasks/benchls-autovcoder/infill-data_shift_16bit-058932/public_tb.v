// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_058932 dut (
    .Data_In(in_vec[15:0]),
    .Data_Out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hc507;
    stim[1] = 16'hb5e7;
    stim[2] = 16'hc6e2;
    stim[3] = 16'hed29;
    stim[4] = 16'h1bf8;
    stim[5] = 16'hbd1b;
    stim[6] = 16'h6855;
    stim[7] = 16'ha479;
    stim[8] = 16'h8fbc;
    stim[9] = 16'hd391;
    stim[10] = 16'hf379;
    stim[11] = 16'hfefb;
    stim[12] = 16'h80ec;
    stim[13] = 16'h7cf9;
    stim[14] = 16'h5684;
    stim[15] = 16'h38a5;
    stim[16] = 16'h6f33;
    stim[17] = 16'h8af1;
    stim[18] = 16'h4b2c;
    stim[19] = 16'h5cc0;
    stim[20] = 16'h4938;
    stim[21] = 16'h7e00;
    stim[22] = 16'hb6c0;
    stim[23] = 16'hf01e;
    stim[24] = 16'he6ce;
    stim[25] = 16'h67fe;
    stim[26] = 16'h3066;
    stim[27] = 16'he619;
    stim[28] = 16'h66b8;
    stim[29] = 16'h0fec;
    stim[30] = 16'h6e43;
    stim[31] = 16'h1e3f;
    stim[32] = 16'h90c9;
    stim[33] = 16'hb86d;
    stim[34] = 16'h430b;
    stim[35] = 16'hc932;
    stim[36] = 16'h3dab;
    stim[37] = 16'hf029;
    stim[38] = 16'h0081;
    stim[39] = 16'hf0b3;
    stim[40] = 16'h7cc3;
    stim[41] = 16'h8ff0;
    stim[42] = 16'h47f1;
    stim[43] = 16'h42f3;
    stim[44] = 16'hdd40;
    stim[45] = 16'hd9b0;
    stim[46] = 16'hbf9b;
    stim[47] = 16'h0339;
    stim[48] = 16'hbba7;
    stim[49] = 16'h1442;
    stim[50] = 16'hec6e;
    stim[51] = 16'h54ba;
    stim[52] = 16'h77bc;
    stim[53] = 16'h5154;
    stim[54] = 16'h1973;
    stim[55] = 16'h815b;
    stim[56] = 16'h69a1;
    stim[57] = 16'h9666;
    stim[58] = 16'h230e;
    stim[59] = 16'ha0f7;
    stim[60] = 16'h3ab1;
    stim[61] = 16'h65f7;
    stim[62] = 16'heda4;
    stim[63] = 16'h8d50;
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
      expv[0] = 16'hfb14;
      expv[1] = 16'hfad7;
      expv[2] = 16'hfb1b;
      expv[3] = 16'hfbb4;
      expv[4] = 16'h006f;
      expv[5] = 16'hfaf4;
      expv[6] = 16'h01a1;
      expv[7] = 16'hfa91;
      expv[8] = 16'hfa3e;
      expv[9] = 16'hfb4e;
      expv[10] = 16'hfbcd;
      expv[11] = 16'hfbfb;
      expv[12] = 16'hfa03;
      expv[13] = 16'h01f3;
      expv[14] = 16'h015a;
      expv[15] = 16'h00e2;
      expv[16] = 16'h01bc;
      expv[17] = 16'hfa2b;
      expv[18] = 16'h012c;
      expv[19] = 16'h0173;
      expv[20] = 16'h0124;
      expv[21] = 16'h01f8;
      expv[22] = 16'hfadb;
      expv[23] = 16'hfbc0;
      expv[24] = 16'hfb9b;
      expv[25] = 16'h019f;
      expv[26] = 16'h00c1;
      expv[27] = 16'hfb98;
      expv[28] = 16'h019a;
      expv[29] = 16'h003f;
      expv[30] = 16'h01b9;
      expv[31] = 16'h0078;
      expv[32] = 16'hfa43;
      expv[33] = 16'hfae1;
      expv[34] = 16'h010c;
      expv[35] = 16'hfb24;
      expv[36] = 16'h00f6;
      expv[37] = 16'hfbc0;
      expv[38] = 16'h0002;
      expv[39] = 16'hfbc2;
      expv[40] = 16'h01f3;
      expv[41] = 16'hfa3f;
      expv[42] = 16'h011f;
      expv[43] = 16'h010b;
      expv[44] = 16'hfb75;
      expv[45] = 16'hfb66;
      expv[46] = 16'hfafe;
      expv[47] = 16'h000c;
      expv[48] = 16'hfaee;
      expv[49] = 16'h0051;
      expv[50] = 16'hfbb1;
      expv[51] = 16'h0152;
      expv[52] = 16'h01de;
      expv[53] = 16'h0145;
      expv[54] = 16'h0065;
      expv[55] = 16'hfa05;
      expv[56] = 16'h01a6;
      expv[57] = 16'hfa59;
      expv[58] = 16'h008c;
      expv[59] = 16'hfa83;
      expv[60] = 16'h00ea;
      expv[61] = 16'h0197;
      expv[62] = 16'hfbb6;
      expv[63] = 16'hfa35;
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
