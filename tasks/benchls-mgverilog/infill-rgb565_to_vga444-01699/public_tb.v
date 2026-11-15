// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01699 dut (
    .rgb565(in_vec[15:0]),
    .vga_r(out_vec[11:8]),
    .vga_g(out_vec[7:4]),
    .vga_b(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h1647;
    stim[1] = 16'hb4b0;
    stim[2] = 16'h3f15;
    stim[3] = 16'hed31;
    stim[4] = 16'h8c63;
    stim[5] = 16'hea4a;
    stim[6] = 16'h027e;
    stim[7] = 16'h8908;
    stim[8] = 16'h3370;
    stim[9] = 16'ha852;
    stim[10] = 16'h74b0;
    stim[11] = 16'h6d0c;
    stim[12] = 16'had1b;
    stim[13] = 16'hfe0c;
    stim[14] = 16'hd204;
    stim[15] = 16'hc014;
    stim[16] = 16'h377f;
    stim[17] = 16'h4ed8;
    stim[18] = 16'h7576;
    stim[19] = 16'ha05c;
    stim[20] = 16'h8835;
    stim[21] = 16'h9f67;
    stim[22] = 16'h7e01;
    stim[23] = 16'h5230;
    stim[24] = 16'hb0df;
    stim[25] = 16'hc6c0;
    stim[26] = 16'h74a3;
    stim[27] = 16'ha3ed;
    stim[28] = 16'h2458;
    stim[29] = 16'hf624;
    stim[30] = 16'hd7fe;
    stim[31] = 16'hca15;
    stim[32] = 16'h7c01;
    stim[33] = 16'hb7ff;
    stim[34] = 16'hbe8b;
    stim[35] = 16'he1a7;
    stim[36] = 16'h9792;
    stim[37] = 16'h00b4;
    stim[38] = 16'h3145;
    stim[39] = 16'h4f24;
    stim[40] = 16'h4cd2;
    stim[41] = 16'habe9;
    stim[42] = 16'hddc9;
    stim[43] = 16'hd610;
    stim[44] = 16'h931c;
    stim[45] = 16'h5b99;
    stim[46] = 16'h1f2e;
    stim[47] = 16'h3850;
    stim[48] = 16'h3a32;
    stim[49] = 16'he74b;
    stim[50] = 16'h0e87;
    stim[51] = 16'ha0c7;
    stim[52] = 16'h6cab;
    stim[53] = 16'hb849;
    stim[54] = 16'h336e;
    stim[55] = 16'h3429;
    stim[56] = 16'hfeec;
    stim[57] = 16'hc418;
    stim[58] = 16'h8d43;
    stim[59] = 16'hb25e;
    stim[60] = 16'h1f97;
    stim[61] = 16'h2a67;
    stim[62] = 16'h5c68;
    stim[63] = 16'h422a;
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
      expv[0] = 12'h1c3;
      expv[1] = 12'hb98;
      expv[2] = 12'h3ea;
      expv[3] = 12'hea8;
      expv[4] = 12'h881;
      expv[5] = 12'he45;
      expv[6] = 12'h04f;
      expv[7] = 12'h824;
      expv[8] = 12'h368;
      expv[9] = 12'ha09;
      expv[10] = 12'h798;
      expv[11] = 12'h6a6;
      expv[12] = 12'haad;
      expv[13] = 12'hfc6;
      expv[14] = 12'hd42;
      expv[15] = 12'hc0a;
      expv[16] = 12'h3ef;
      expv[17] = 12'h4dc;
      expv[18] = 12'h7ab;
      expv[19] = 12'ha0e;
      expv[20] = 12'h80a;
      expv[21] = 12'h9e3;
      expv[22] = 12'h7c0;
      expv[23] = 12'h548;
      expv[24] = 12'hb1f;
      expv[25] = 12'hcd0;
      expv[26] = 12'h791;
      expv[27] = 12'ha76;
      expv[28] = 12'h28c;
      expv[29] = 12'hfc2;
      expv[30] = 12'hdff;
      expv[31] = 12'hc4a;
      expv[32] = 12'h780;
      expv[33] = 12'hbff;
      expv[34] = 12'hbd5;
      expv[35] = 12'he33;
      expv[36] = 12'h9f9;
      expv[37] = 12'h01a;
      expv[38] = 12'h322;
      expv[39] = 12'h4e2;
      expv[40] = 12'h499;
      expv[41] = 12'ha74;
      expv[42] = 12'hdb4;
      expv[43] = 12'hdc8;
      expv[44] = 12'h96e;
      expv[45] = 12'h57c;
      expv[46] = 12'h1e7;
      expv[47] = 12'h308;
      expv[48] = 12'h349;
      expv[49] = 12'hee5;
      expv[50] = 12'h0d3;
      expv[51] = 12'ha13;
      expv[52] = 12'h695;
      expv[53] = 12'hb04;
      expv[54] = 12'h367;
      expv[55] = 12'h384;
      expv[56] = 12'hfd6;
      expv[57] = 12'hc8c;
      expv[58] = 12'h8a1;
      expv[59] = 12'hb4f;
      expv[60] = 12'h1fb;
      expv[61] = 12'h243;
      expv[62] = 12'h584;
      expv[63] = 12'h445;
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
