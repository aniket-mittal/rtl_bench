// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09966 dut (
    .clock(clk),
    .reset(in_vec[40:40]),
    .ena(in_vec[39:39]),
    .phi_n(in_vec[38:38]),
    .phi_en(in_vec[37:37]),
    .addr(in_vec[36:21]),
    .din(in_vec[20:13]),
    .cpu_di(in_vec[12:5]),
    .m1_n(in_vec[4:4]),
    .iorq_n(in_vec[3:3]),
    .rd_n(in_vec[2:2]),
    .wr_n(in_vec[1:1]),
    .cursor(in_vec[0:0]),
    .dout(out_vec[25:18]),
    .int_n(out_vec[17:17]),
    .nmi(out_vec[16:16]),
    .audio_l(out_vec[15:8]),
    .audio_r(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h19b9490dbc2;
    stim[1] = 41'h1de20bae2eb;
    stim[2] = 41'h0060935d7ba;
    stim[3] = 41'h063bba8565f;
    stim[4] = 41'h0f349a6c41b;
    stim[5] = 41'h022c9fb4d4a;
    stim[6] = 41'h059a1eae83d;
    stim[7] = 41'h09779e4be9a;
    stim[8] = 41'h015a66412cc;
    stim[9] = 41'h08904bd71cc;
    stim[10] = 41'h01f132ddfbf;
    stim[11] = 41'h0883d788ef1;
    stim[12] = 41'h0feb944740a;
    stim[13] = 41'h0d04d07237d;
    stim[14] = 41'h01c0838e1eb;
    stim[15] = 41'h029321061b4;
    stim[16] = 41'h0e7241c1a7a;
    stim[17] = 41'h02a6a4ddd66;
    stim[18] = 41'h07589085d80;
    stim[19] = 41'h082fd51a349;
    stim[20] = 41'h028a9bb337f;
    stim[21] = 41'h02dc750be41;
    stim[22] = 41'h0c4558646d9;
    stim[23] = 41'h07d2c759325;
    stim[24] = 41'h04593b8952c;
    stim[25] = 41'h0ab62e5cad7;
    stim[26] = 41'h0b7191b34f4;
    stim[27] = 41'h04023286a16;
    stim[28] = 41'h07ca47177c6;
    stim[29] = 41'h025b42c1311;
    stim[30] = 41'h0d09a3976ee;
    stim[31] = 41'h006487fe556;
    stim[32] = 41'h0f843d96143;
    stim[33] = 41'h09d7cc33ebe;
    stim[34] = 41'h0db114780e0;
    stim[35] = 41'h018d9faf1e7;
    stim[36] = 41'h1c917c0d45d;
    stim[37] = 41'h02c24196bab;
    stim[38] = 41'h018249a2eda;
    stim[39] = 41'h046064e7472;
    stim[40] = 41'h0d01b8f9b46;
    stim[41] = 41'h0125d05ad4f;
    stim[42] = 41'h0f35c390463;
    stim[43] = 41'h0c742ed662b;
    stim[44] = 41'h016fc074699;
    stim[45] = 41'h0a3398e15e2;
    stim[46] = 41'h04750d50852;
    stim[47] = 41'h07d5cfd0377;
    stim[48] = 41'h07047c73927;
    stim[49] = 41'h0b9d6e465e5;
    stim[50] = 41'h034a1719aa6;
    stim[51] = 41'h0001d9759ba;
    stim[52] = 41'h0a060bc6c28;
    stim[53] = 41'h07478894886;
    stim[54] = 41'h0da48c49ae3;
    stim[55] = 41'h0080f4d5170;
    stim[56] = 41'h0bec3fbfc2d;
    stim[57] = 41'h016f7cc79d1;
    stim[58] = 41'h007ed851c55;
    stim[59] = 41'h0331b3c587c;
    stim[60] = 41'h0b0bbca92f6;
    stim[61] = 41'h0be789cbe98;
    stim[62] = 41'h019c0a09bbf;
    stim[63] = 41'h0884be8ef4c;
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
      expv[0] = 26'h0030000;
      expv[1] = 26'h0030000;
      expv[2] = 26'h0030000;
      expv[3] = 26'h0030000;
      expv[4] = 26'h0030000;
      expv[5] = 26'h0030000;
      expv[6] = 26'h0030000;
      expv[7] = 26'h0030000;
      expv[8] = 26'h0030000;
      expv[9] = 26'h0030000;
      expv[10] = 26'h0030000;
      expv[11] = 26'h0030000;
      expv[12] = 26'h0030000;
      expv[13] = 26'h0030000;
      expv[14] = 26'h0030000;
      expv[15] = 26'h0030000;
      expv[16] = 26'h0030000;
      expv[17] = 26'h0030000;
      expv[18] = 26'h0030000;
      expv[19] = 26'h0030000;
      expv[20] = 26'h0030000;
      expv[21] = 26'h0030000;
      expv[22] = 26'h0030000;
      expv[23] = 26'h0030000;
      expv[24] = 26'h0030000;
      expv[25] = 26'h0030000;
      expv[26] = 26'h0030000;
      expv[27] = 26'h0030000;
      expv[28] = 26'h0030000;
      expv[29] = 26'h0030000;
      expv[30] = 26'h0030000;
      expv[31] = 26'h0030000;
      expv[32] = 26'h0030000;
      expv[33] = 26'h0030000;
      expv[34] = 26'h0030000;
      expv[35] = 26'h0030000;
      expv[36] = 26'h0030000;
      expv[37] = 26'h0030000;
      expv[38] = 26'h0030000;
      expv[39] = 26'h0030000;
      expv[40] = 26'h0030000;
      expv[41] = 26'h0030000;
      expv[42] = 26'h0030000;
      expv[43] = 26'h0030000;
      expv[44] = 26'h0030000;
      expv[45] = 26'h0030000;
      expv[46] = 26'h0030000;
      expv[47] = 26'h0030000;
      expv[48] = 26'h0030000;
      expv[49] = 26'h0030000;
      expv[50] = 26'h0030000;
      expv[51] = 26'h0030000;
      expv[52] = 26'h0030000;
      expv[53] = 26'h0030000;
      expv[54] = 26'h0030000;
      expv[55] = 26'h0030000;
      expv[56] = 26'h0030000;
      expv[57] = 26'h0030000;
      expv[58] = 26'h0030000;
      expv[59] = 26'h0030000;
      expv[60] = 26'h0030000;
      expv[61] = 26'h0030000;
      expv[62] = 26'h0030000;
      expv[63] = 26'h0030000;
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
