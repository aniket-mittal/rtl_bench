// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08800 dut (
    .clock(clk),
    .angle(in_vec[47:16]),
    .Xin(in_vec[15:8]),
    .Yin(in_vec[7:0]),
    .Xout(out_vec[17:9]),
    .Yout(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h5447703b3fa3;
    stim[1] = 48'h16f7e538c179;
    stim[2] = 48'h044661a0ee89;
    stim[3] = 48'h0074f982aee0;
    stim[4] = 48'h9d767a68bbee;
    stim[5] = 48'h8878698d531c;
    stim[6] = 48'h2b9ee1af5c64;
    stim[7] = 48'hfdca58507f2d;
    stim[8] = 48'h956f87ed63ae;
    stim[9] = 48'h9486a3b05b7e;
    stim[10] = 48'h40d4773c0c0c;
    stim[11] = 48'h283c20666263;
    stim[12] = 48'ha7ff30258ef0;
    stim[13] = 48'h2770488f6669;
    stim[14] = 48'h4b3c5835582b;
    stim[15] = 48'h81e1767856a0;
    stim[16] = 48'h238f8389583f;
    stim[17] = 48'h3d7e3f850780;
    stim[18] = 48'hb056165c93ee;
    stim[19] = 48'h08c9038a50a4;
    stim[20] = 48'haa25bf91a97c;
    stim[21] = 48'h27adc19ccfdf;
    stim[22] = 48'h29acb2e15ed0;
    stim[23] = 48'hdecb9afcffb3;
    stim[24] = 48'habb8d4a55b3d;
    stim[25] = 48'h1b912dde5510;
    stim[26] = 48'hbd56b81aa986;
    stim[27] = 48'h6fbfeac5590a;
    stim[28] = 48'ha104b70a1d4c;
    stim[29] = 48'h2a0af2607f95;
    stim[30] = 48'h7ef7e853a84e;
    stim[31] = 48'h6c70856b9cba;
    stim[32] = 48'hf0535696c68e;
    stim[33] = 48'hfd16c1b8fee0;
    stim[34] = 48'h36af48718adf;
    stim[35] = 48'h601d5effa307;
    stim[36] = 48'h91afe3fab35f;
    stim[37] = 48'h72847f8716e7;
    stim[38] = 48'h0d57b36a69ee;
    stim[39] = 48'hd38a6b100b08;
    stim[40] = 48'h9a7c58fda55c;
    stim[41] = 48'h3d11d086f256;
    stim[42] = 48'h0db060418f55;
    stim[43] = 48'h120ea47af4f6;
    stim[44] = 48'hd4e8bfc8bee2;
    stim[45] = 48'hfe4c2ef193fd;
    stim[46] = 48'h8f9056f78b76;
    stim[47] = 48'h777d387fbe54;
    stim[48] = 48'hb447fa473050;
    stim[49] = 48'hc205d3cf9a82;
    stim[50] = 48'h73d8b79233bd;
    stim[51] = 48'h0f9ed7f46f0a;
    stim[52] = 48'h473d7be30ee2;
    stim[53] = 48'he4404cc24d0e;
    stim[54] = 48'hde674eb02efb;
    stim[55] = 48'h3e1c47da1bd8;
    stim[56] = 48'hfd80663ecbe9;
    stim[57] = 48'h3d562761538e;
    stim[58] = 48'hab3ce95130b0;
    stim[59] = 48'ha61636b7b327;
    stim[60] = 48'h30a6cf0d69a4;
    stim[61] = 48'h5c7ba0ed6e6d;
    stim[62] = 48'hd13ac9c78351;
    stim[63] = 48'hfa66aed4bd88;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'h1b123;
      expv[10] = 18'h382f2;
      expv[11] = 18'h0e5bd;
      expv[12] = 18'h3f04c;
      expv[13] = 18'h184e1;
      expv[14] = 18'h00636;
      expv[15] = 18'h06d53;
      expv[16] = 18'h2aabe;
      expv[17] = 18'h35ea4;
      expv[18] = 18'h0bb82;
      expv[19] = 18'h0d893;
      expv[20] = 18'h0a35f;
      expv[21] = 18'h1a32b;
      expv[22] = 18'h0a96c;
      expv[23] = 18'h026f7;
      expv[24] = 18'h3d514;
      expv[25] = 18'h12132;
      expv[26] = 18'h2a87f;
      expv[27] = 18'h1592f;
      expv[28] = 18'h24208;
      expv[29] = 18'h2f090;
      expv[30] = 18'h1041e;
      expv[31] = 18'h226dc;
      expv[32] = 18'h04a28;
      expv[33] = 18'h125cd;
      expv[34] = 18'h1baeb;
      expv[35] = 18'h3831c;
      expv[36] = 18'h3e8a8;
      expv[37] = 18'h16e07;
      expv[38] = 18'h2f898;
      expv[39] = 18'h21dfb;
      expv[40] = 18'h28e98;
      expv[41] = 18'h3c3f6;
      expv[42] = 18'h0f24d;
      expv[43] = 18'h11bb6;
      expv[44] = 18'h1c80e;
      expv[45] = 18'h26a25;
      expv[46] = 18'h0dcb1;
      expv[47] = 18'h2569e;
      expv[48] = 18'h12877;
      expv[49] = 18'h2a460;
      expv[50] = 18'h3e273;
      expv[51] = 18'h342ca;
      expv[52] = 18'h0ea69;
      expv[53] = 18'h040c6;
      expv[54] = 18'h39880;
      expv[55] = 18'h2fc77;
      expv[56] = 18'h19be2;
      expv[57] = 18'h1d010;
      expv[58] = 18'h34d1a;
      expv[59] = 18'h0a304;
      expv[60] = 18'h242d7;
      expv[61] = 18'h15c9f;
      expv[62] = 18'h1e245;
      expv[63] = 18'h15a41;
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
