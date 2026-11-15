// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148688 dut (
    .clk(clk),
    .offsetdelayctrlin(in_vec[15:9]),
    .offset(in_vec[8:2]),
    .addnsub(in_vec[1:1]),
    .aload(in_vec[0:0]),
    .offsetctrlout(out_vec[13:7]),
    .offsettestout(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h9f55;
    stim[1] = 16'hc50c;
    stim[2] = 16'h2ff2;
    stim[3] = 16'h8a48;
    stim[4] = 16'h926d;
    stim[5] = 16'hea9f;
    stim[6] = 16'h4a1b;
    stim[7] = 16'h6b34;
    stim[8] = 16'h3338;
    stim[9] = 16'h12f3;
    stim[10] = 16'h481f;
    stim[11] = 16'hb110;
    stim[12] = 16'h29f3;
    stim[13] = 16'h71af;
    stim[14] = 16'h5343;
    stim[15] = 16'h49fc;
    stim[16] = 16'hba42;
    stim[17] = 16'h662e;
    stim[18] = 16'he82b;
    stim[19] = 16'h2dde;
    stim[20] = 16'h3c92;
    stim[21] = 16'he37e;
    stim[22] = 16'h05d5;
    stim[23] = 16'h7d35;
    stim[24] = 16'h7be8;
    stim[25] = 16'hf30d;
    stim[26] = 16'h05ae;
    stim[27] = 16'ha4d2;
    stim[28] = 16'hacb3;
    stim[29] = 16'h5d1f;
    stim[30] = 16'hf7b0;
    stim[31] = 16'hf1bd;
    stim[32] = 16'h2ea3;
    stim[33] = 16'haa44;
    stim[34] = 16'hdd2b;
    stim[35] = 16'h4c9b;
    stim[36] = 16'hdeda;
    stim[37] = 16'hbc2f;
    stim[38] = 16'hd40a;
    stim[39] = 16'ha1d3;
    stim[40] = 16'h1b9e;
    stim[41] = 16'h6fe6;
    stim[42] = 16'hc6e0;
    stim[43] = 16'he0bb;
    stim[44] = 16'h886a;
    stim[45] = 16'h8b96;
    stim[46] = 16'h9c00;
    stim[47] = 16'hd6de;
    stim[48] = 16'h6ff8;
    stim[49] = 16'hc5a1;
    stim[50] = 16'h4bfb;
    stim[51] = 16'he480;
    stim[52] = 16'hec5c;
    stim[53] = 16'hda5e;
    stim[54] = 16'hfb01;
    stim[55] = 16'h6189;
    stim[56] = 16'hf956;
    stim[57] = 16'h1aac;
    stim[58] = 16'h8d4c;
    stim[59] = 16'h2489;
    stim[60] = 16'h6a75;
    stim[61] = 16'h80c6;
    stim[62] = 16'h90eb;
    stim[63] = 16'h2cfb;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'hxxxx;
      expv[2] = 14'h27cf;
      expv[3] = 14'h3162;
      expv[4] = 14'h0b97;
      expv[5] = 14'h22c5;
      expv[6] = 14'h24c9;
      expv[7] = 14'h3af5;
      expv[8] = 14'h12a5;
      expv[9] = 14'h1ab5;
      expv[10] = 14'h0c99;
      expv[11] = 14'h0489;
      expv[12] = 14'h1224;
      expv[13] = 14'h2c58;
      expv[14] = 14'h0a14;
      expv[15] = 14'h1c38;
      expv[16] = 14'h14a9;
      expv[17] = 14'h1224;
      expv[18] = 14'h2edd;
      expv[19] = 14'h19b3;
      expv[20] = 14'h3a74;
      expv[21] = 14'h0b16;
      expv[22] = 14'h0f1e;
      expv[23] = 14'h38f1;
      expv[24] = 14'h0102;
      expv[25] = 14'h1f3e;
      expv[26] = 14'h1ebd;
      expv[27] = 14'h3cf9;
      expv[28] = 14'h0102;
      expv[29] = 14'h2952;
      expv[30] = 14'h2b56;
      expv[31] = 14'h172e;
      expv[32] = 14'h3dfb;
      expv[33] = 14'h3c78;
      expv[34] = 14'h0b97;
      expv[35] = 14'h2ad5;
      expv[36] = 14'h376e;
      expv[37] = 14'h1326;
      expv[38] = 14'h37ef;
      expv[39] = 14'h2f5e;
      expv[40] = 14'h356a;
      expv[41] = 14'h2850;
      expv[42] = 14'h068d;
      expv[43] = 14'h1bb7;
      expv[44] = 14'h31e3;
      expv[45] = 14'h3870;
      expv[46] = 14'h2244;
      expv[47] = 14'h22c5;
      expv[48] = 14'h274e;
      expv[49] = 14'h35eb;
      expv[50] = 14'h1bb7;
      expv[51] = 14'h3162;
      expv[52] = 14'h12a5;
      expv[53] = 14'h3972;
      expv[54] = 14'h3b76;
      expv[55] = 14'h36ed;
      expv[56] = 14'h3efd;
      expv[57] = 14'h1830;
      expv[58] = 14'h3e7c;
      expv[59] = 14'h068d;
      expv[60] = 14'h2346;
      expv[61] = 14'h0912;
      expv[62] = 14'h1ab5;
      expv[63] = 14'h2040;
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
