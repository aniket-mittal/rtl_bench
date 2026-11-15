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

  autovcoder_071740 dut (
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
    stim[0] = 11'h4c9;
    stim[1] = 11'h50e;
    stim[2] = 11'h2df;
    stim[3] = 11'h03a;
    stim[4] = 11'h28c;
    stim[5] = 11'h349;
    stim[6] = 11'h02e;
    stim[7] = 11'h22f;
    stim[8] = 11'h206;
    stim[9] = 11'h07a;
    stim[10] = 11'h3ae;
    stim[11] = 11'h081;
    stim[12] = 11'h1fc;
    stim[13] = 11'h068;
    stim[14] = 11'h300;
    stim[15] = 11'h110;
    stim[16] = 11'h2f8;
    stim[17] = 11'h1b1;
    stim[18] = 11'h3d2;
    stim[19] = 11'h296;
    stim[20] = 11'h35f;
    stim[21] = 11'h07d;
    stim[22] = 11'h022;
    stim[23] = 11'h0f7;
    stim[24] = 11'h1e1;
    stim[25] = 11'h13a;
    stim[26] = 11'h275;
    stim[27] = 11'h39b;
    stim[28] = 11'h06b;
    stim[29] = 11'h30c;
    stim[30] = 11'h304;
    stim[31] = 11'h2c2;
    stim[32] = 11'h0cc;
    stim[33] = 11'h3fc;
    stim[34] = 11'h2da;
    stim[35] = 11'h39c;
    stim[36] = 11'h1a2;
    stim[37] = 11'h1fb;
    stim[38] = 11'h29b;
    stim[39] = 11'h3be;
    stim[40] = 11'h302;
    stim[41] = 11'h14a;
    stim[42] = 11'h291;
    stim[43] = 11'h0bd;
    stim[44] = 11'h20a;
    stim[45] = 11'h074;
    stim[46] = 11'h3c7;
    stim[47] = 11'h19f;
    stim[48] = 11'h01e;
    stim[49] = 11'h244;
    stim[50] = 11'h345;
    stim[51] = 11'h12d;
    stim[52] = 11'h14c;
    stim[53] = 11'h019;
    stim[54] = 11'h139;
    stim[55] = 11'h2eb;
    stim[56] = 11'h16f;
    stim[57] = 11'h14f;
    stim[58] = 11'h392;
    stim[59] = 11'h398;
    stim[60] = 11'h2a0;
    stim[61] = 11'h22b;
    stim[62] = 11'h104;
    stim[63] = 11'h16a;
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
      expv[2] = 12'h218;
      expv[3] = 12'hdb8;
      expv[4] = 12'h875;
      expv[5] = 12'h875;
      expv[6] = 12'h870;
      expv[7] = 12'h85d;
      expv[8] = 12'hc5d;
      expv[9] = 12'h45e;
      expv[10] = 12'h45e;
      expv[11] = 12'h45e;
      expv[12] = 12'hc0d;
      expv[13] = 12'hc0d;
      expv[14] = 12'hc0d;
      expv[15] = 12'hc0d;
      expv[16] = 12'hc0d;
      expv[17] = 12'hc0d;
      expv[18] = 12'hc08;
      expv[19] = 12'hfa5;
      expv[20] = 12'h7a6;
      expv[21] = 12'hd2d;
      expv[22] = 12'hd28;
      expv[23] = 12'h845;
      expv[24] = 12'h9ed;
      expv[25] = 12'h9e8;
      expv[26] = 12'ha75;
      expv[27] = 12'ha70;
      expv[28] = 12'hf35;
      expv[29] = 12'h8d5;
      expv[30] = 12'h8d5;
      expv[31] = 12'h8d5;
      expv[32] = 12'h0d6;
      expv[33] = 12'h0d6;
      expv[34] = 12'h0d6;
      expv[35] = 12'h0d6;
      expv[36] = 12'h0d6;
      expv[37] = 12'h0d6;
      expv[38] = 12'hd85;
      expv[39] = 12'hd35;
      expv[40] = 12'h536;
      expv[41] = 12'h536;
      expv[42] = 12'h536;
      expv[43] = 12'hf7d;
      expv[44] = 12'hf78;
      expv[45] = 12'hc15;
      expv[46] = 12'hc15;
      expv[47] = 12'hf8d;
      expv[48] = 12'hb3d;
      expv[49] = 12'h33e;
      expv[50] = 12'h33e;
      expv[51] = 12'h83d;
      expv[52] = 12'h838;
      expv[53] = 12'h838;
      expv[54] = 12'h838;
      expv[55] = 12'h838;
      expv[56] = 12'hdd5;
      expv[57] = 12'hadd;
      expv[58] = 12'ha9d;
      expv[59] = 12'h29e;
      expv[60] = 12'h29e;
      expv[61] = 12'h29e;
      expv[62] = 12'hf25;
      expv[63] = 12'hf25;
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
