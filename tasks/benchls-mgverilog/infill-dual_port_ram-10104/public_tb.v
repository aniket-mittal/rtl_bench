// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10104 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1386c;
    stim[1] = 17'h1b515;
    stim[2] = 17'h18254;
    stim[3] = 17'h1bd38;
    stim[4] = 17'h1969f;
    stim[5] = 17'h00e6d;
    stim[6] = 17'h1c2e4;
    stim[7] = 17'h08984;
    stim[8] = 17'h1379d;
    stim[9] = 17'h07d6d;
    stim[10] = 17'h1963a;
    stim[11] = 17'h1c480;
    stim[12] = 17'h104ee;
    stim[13] = 17'h06430;
    stim[14] = 17'h04c5e;
    stim[15] = 17'h09e59;
    stim[16] = 17'h11eda;
    stim[17] = 17'h0d1fc;
    stim[18] = 17'h1749d;
    stim[19] = 17'h04033;
    stim[20] = 17'h1c90a;
    stim[21] = 17'h143ca;
    stim[22] = 17'h12e75;
    stim[23] = 17'h12b1b;
    stim[24] = 17'h152c4;
    stim[25] = 17'h16feb;
    stim[26] = 17'h0eb20;
    stim[27] = 17'h1b3d5;
    stim[28] = 17'h1011d;
    stim[29] = 17'h13f72;
    stim[30] = 17'h09684;
    stim[31] = 17'h16d7f;
    stim[32] = 17'h106b9;
    stim[33] = 17'h12562;
    stim[34] = 17'h07b8f;
    stim[35] = 17'h12f01;
    stim[36] = 17'h12b6b;
    stim[37] = 17'h038b0;
    stim[38] = 17'h08296;
    stim[39] = 17'h15e64;
    stim[40] = 17'h1151b;
    stim[41] = 17'h1956a;
    stim[42] = 17'h129d6;
    stim[43] = 17'h09f67;
    stim[44] = 17'h118f4;
    stim[45] = 17'h0a143;
    stim[46] = 17'h16a90;
    stim[47] = 17'h0e13e;
    stim[48] = 17'h01c7c;
    stim[49] = 17'h05c45;
    stim[50] = 17'h1b121;
    stim[51] = 17'h1506b;
    stim[52] = 17'h1dada;
    stim[53] = 17'h1229e;
    stim[54] = 17'h0fdfb;
    stim[55] = 17'h0fe6b;
    stim[56] = 17'h18ebf;
    stim[57] = 17'h1782e;
    stim[58] = 17'h0f238;
    stim[59] = 17'h1b506;
    stim[60] = 17'h1a189;
    stim[61] = 17'h1ff43;
    stim[62] = 17'h0e5a1;
    stim[63] = 17'h08c53;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'h9f;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'h80;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hda;
      expv[18] = 8'hxx;
      expv[19] = 8'hee;
      expv[20] = 8'h3a;
      expv[21] = 8'h9d;
      expv[22] = 8'hxx;
      expv[23] = 8'h38;
      expv[24] = 8'h1b;
      expv[25] = 8'hxx;
      expv[26] = 8'h38;
      expv[27] = 8'h9d;
      expv[28] = 8'hda;
      expv[29] = 8'hxx;
      expv[30] = 8'heb;
      expv[31] = 8'hxx;
      expv[32] = 8'h7f;
      expv[33] = 8'hc4;
      expv[34] = 8'hd5;
      expv[35] = 8'hxx;
      expv[36] = 8'hd5;
      expv[37] = 8'h54;
      expv[38] = 8'h6b;
      expv[39] = 8'hxx;
      expv[40] = 8'h64;
      expv[41] = 8'h64;
      expv[42] = 8'h6a;
      expv[43] = 8'hxx;
      expv[44] = 8'h54;
      expv[45] = 8'hf4;
      expv[46] = 8'hxx;
      expv[47] = 8'hf4;
      expv[48] = 8'h0a;
      expv[49] = 8'h0a;
      expv[50] = 8'hf4;
      expv[51] = 8'hb9;
      expv[52] = 8'hxx;
      expv[53] = 8'hd6;
      expv[54] = 8'hda;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hbf;
      expv[58] = 8'h9e;
      expv[59] = 8'h6b;
      expv[60] = 8'hf4;
      expv[61] = 8'hxx;
      expv[62] = 8'h6b;
      expv[63] = 8'h0a;
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
