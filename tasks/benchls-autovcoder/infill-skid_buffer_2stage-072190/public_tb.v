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

  autovcoder_072190 dut (
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
    stim[0] = 11'h725;
    stim[1] = 11'h5a7;
    stim[2] = 11'h128;
    stim[3] = 11'h279;
    stim[4] = 11'h36d;
    stim[5] = 11'h26c;
    stim[6] = 11'h2e3;
    stim[7] = 11'h115;
    stim[8] = 11'h3e6;
    stim[9] = 11'h370;
    stim[10] = 11'h13f;
    stim[11] = 11'h396;
    stim[12] = 11'h0a3;
    stim[13] = 11'h18d;
    stim[14] = 11'h2f9;
    stim[15] = 11'h34b;
    stim[16] = 11'h38d;
    stim[17] = 11'h2f5;
    stim[18] = 11'h369;
    stim[19] = 11'h207;
    stim[20] = 11'h34e;
    stim[21] = 11'h114;
    stim[22] = 11'h2d9;
    stim[23] = 11'h1a0;
    stim[24] = 11'h24d;
    stim[25] = 11'h277;
    stim[26] = 11'h1b1;
    stim[27] = 11'h0c7;
    stim[28] = 11'h19d;
    stim[29] = 11'h359;
    stim[30] = 11'h18b;
    stim[31] = 11'h005;
    stim[32] = 11'h179;
    stim[33] = 11'h2ba;
    stim[34] = 11'h0ae;
    stim[35] = 11'h286;
    stim[36] = 11'h03b;
    stim[37] = 11'h09d;
    stim[38] = 11'h324;
    stim[39] = 11'h1fa;
    stim[40] = 11'h2cc;
    stim[41] = 11'h1d8;
    stim[42] = 11'h142;
    stim[43] = 11'h251;
    stim[44] = 11'h3c3;
    stim[45] = 11'h0d5;
    stim[46] = 11'h0d4;
    stim[47] = 11'h15d;
    stim[48] = 11'h35d;
    stim[49] = 11'h26f;
    stim[50] = 11'h386;
    stim[51] = 11'h350;
    stim[52] = 11'h370;
    stim[53] = 11'h2ee;
    stim[54] = 11'h3cf;
    stim[55] = 11'h2f4;
    stim[56] = 11'h017;
    stim[57] = 11'h17d;
    stim[58] = 11'h398;
    stim[59] = 11'h030;
    stim[60] = 11'h240;
    stim[61] = 11'h3b7;
    stim[62] = 11'h2d6;
    stim[63] = 11'h038;
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
      expv[2] = 12'h348;
      expv[3] = 12'hb48;
      expv[4] = 12'hb48;
      expv[5] = 12'hb48;
      expv[6] = 12'hb48;
      expv[7] = 12'hdc5;
      expv[8] = 12'hdc0;
      expv[9] = 12'hfcd;
      expv[10] = 12'hfcd;
      expv[11] = 12'ha7d;
      expv[12] = 12'h27e;
      expv[13] = 12'hf2d;
      expv[14] = 12'hf28;
      expv[15] = 12'hf28;
      expv[16] = 12'he95;
      expv[17] = 12'he90;
      expv[18] = 12'he90;
      expv[19] = 12'he90;
      expv[20] = 12'hc0d;
      expv[21] = 12'h40e;
      expv[22] = 12'h40e;
      expv[23] = 12'he9d;
      expv[24] = 12'he9d;
      expv[25] = 12'he98;
      expv[26] = 12'hced;
      expv[27] = 12'hce8;
      expv[28] = 12'h98d;
      expv[29] = 12'h988;
      expv[30] = 12'h988;
      expv[31] = 12'hb15;
      expv[32] = 12'hb10;
      expv[33] = 12'hb10;
      expv[34] = 12'hd75;
      expv[35] = 12'h576;
      expv[36] = 12'h576;
      expv[37] = 12'h95d;
      expv[38] = 12'h958;
      expv[39] = 12'h958;
      expv[40] = 12'hbf5;
      expv[41] = 12'hbf5;
      expv[42] = 12'hbf5;
      expv[43] = 12'h3f6;
      expv[44] = 12'ha85;
      expv[45] = 12'hf85;
      expv[46] = 12'hf80;
      expv[47] = 12'hf80;
      expv[48] = 12'hf80;
      expv[49] = 12'hf80;
      expv[50] = 12'hcdd;
      expv[51] = 12'h4de;
      expv[52] = 12'h4de;
      expv[53] = 12'h4de;
      expv[54] = 12'h4de;
      expv[55] = 12'hf0d;
      expv[56] = 12'hf0d;
      expv[57] = 12'h82d;
      expv[58] = 12'h828;
      expv[59] = 12'h828;
      expv[60] = 12'h828;
      expv[61] = 12'h828;
      expv[62] = 12'hf6d;
      expv[63] = 12'h76e;
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
