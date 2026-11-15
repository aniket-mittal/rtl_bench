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

  autovcoder_071981 dut (
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
    stim[0] = 11'h754;
    stim[1] = 11'h5f9;
    stim[2] = 11'h001;
    stim[3] = 11'h0d3;
    stim[4] = 11'h27e;
    stim[5] = 11'h243;
    stim[6] = 11'h10f;
    stim[7] = 11'h2d4;
    stim[8] = 11'h38e;
    stim[9] = 11'h23c;
    stim[10] = 11'h20a;
    stim[11] = 11'h092;
    stim[12] = 11'h367;
    stim[13] = 11'h34d;
    stim[14] = 11'h196;
    stim[15] = 11'h281;
    stim[16] = 11'h2e0;
    stim[17] = 11'h29e;
    stim[18] = 11'h1c8;
    stim[19] = 11'h170;
    stim[20] = 11'h0e9;
    stim[21] = 11'h123;
    stim[22] = 11'h134;
    stim[23] = 11'h307;
    stim[24] = 11'h044;
    stim[25] = 11'h14c;
    stim[26] = 11'h349;
    stim[27] = 11'h3a9;
    stim[28] = 11'h200;
    stim[29] = 11'h2a5;
    stim[30] = 11'h357;
    stim[31] = 11'h2bf;
    stim[32] = 11'h1f9;
    stim[33] = 11'h12a;
    stim[34] = 11'h376;
    stim[35] = 11'h054;
    stim[36] = 11'h2fe;
    stim[37] = 11'h0dc;
    stim[38] = 11'h2be;
    stim[39] = 11'h37d;
    stim[40] = 11'h202;
    stim[41] = 11'h2e8;
    stim[42] = 11'h20b;
    stim[43] = 11'h2ca;
    stim[44] = 11'h059;
    stim[45] = 11'h076;
    stim[46] = 11'h066;
    stim[47] = 11'h0d8;
    stim[48] = 11'h0e0;
    stim[49] = 11'h3fb;
    stim[50] = 11'h2bc;
    stim[51] = 11'h3bc;
    stim[52] = 11'h051;
    stim[53] = 11'h2b2;
    stim[54] = 11'h254;
    stim[55] = 11'h3be;
    stim[56] = 11'h265;
    stim[57] = 11'h38c;
    stim[58] = 11'h386;
    stim[59] = 11'h0e6;
    stim[60] = 11'h219;
    stim[61] = 11'h3ad;
    stim[62] = 11'h178;
    stim[63] = 11'h269;
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
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h9a5;
      expv[5] = 12'h1a6;
      expv[6] = 12'hcfd;
      expv[7] = 12'ha1d;
      expv[8] = 12'ha1d;
      expv[9] = 12'h21e;
      expv[10] = 12'h21e;
      expv[11] = 12'h21e;
      expv[12] = 12'h21e;
      expv[13] = 12'hf1d;
      expv[14] = 12'hf18;
      expv[15] = 12'hb2d;
      expv[16] = 12'hb28;
      expv[17] = 12'hb28;
      expv[18] = 12'hd3d;
      expv[19] = 12'hd3d;
      expv[20] = 12'hd3d;
      expv[21] = 12'hd38;
      expv[22] = 12'ha45;
      expv[23] = 12'ha45;
      expv[24] = 12'he0d;
      expv[25] = 12'he0d;
      expv[26] = 12'he0d;
      expv[27] = 12'he08;
      expv[28] = 12'he08;
      expv[29] = 12'he08;
      expv[30] = 12'he08;
      expv[31] = 12'head;
      expv[32] = 12'hd7d;
      expv[33] = 12'hd78;
      expv[34] = 12'ha55;
      expv[35] = 12'h256;
      expv[36] = 12'h256;
      expv[37] = 12'h256;
      expv[38] = 12'h256;
      expv[39] = 12'h256;
      expv[40] = 12'heed;
      expv[41] = 12'h6ee;
      expv[42] = 12'h6ee;
      expv[43] = 12'hc05;
      expv[44] = 12'h406;
      expv[45] = 12'hd95;
      expv[46] = 12'h596;
      expv[47] = 12'h596;
      expv[48] = 12'h596;
      expv[49] = 12'h596;
      expv[50] = 12'h8ed;
      expv[51] = 12'h8ed;
      expv[52] = 12'h8ed;
      expv[53] = 12'h8e8;
      expv[54] = 12'hd65;
      expv[55] = 12'hd65;
      expv[56] = 12'h566;
      expv[57] = 12'hf7d;
      expv[58] = 12'hf7d;
      expv[59] = 12'h77e;
      expv[60] = 12'h77e;
      expv[61] = 12'hf0d;
      expv[62] = 12'hf08;
      expv[63] = 12'hf08;
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
