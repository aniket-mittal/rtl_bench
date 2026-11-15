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

  autovcoder_071725 dut (
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
    stim[0] = 11'h549;
    stim[1] = 11'h564;
    stim[2] = 11'h041;
    stim[3] = 11'h391;
    stim[4] = 11'h3b9;
    stim[5] = 11'h1bf;
    stim[6] = 11'h368;
    stim[7] = 11'h084;
    stim[8] = 11'h241;
    stim[9] = 11'h2d1;
    stim[10] = 11'h259;
    stim[11] = 11'h250;
    stim[12] = 11'h24b;
    stim[13] = 11'h0b0;
    stim[14] = 11'h23a;
    stim[15] = 11'h180;
    stim[16] = 11'h18c;
    stim[17] = 11'h399;
    stim[18] = 11'h322;
    stim[19] = 11'h1fc;
    stim[20] = 11'h11d;
    stim[21] = 11'h2de;
    stim[22] = 11'h033;
    stim[23] = 11'h332;
    stim[24] = 11'h270;
    stim[25] = 11'h151;
    stim[26] = 11'h143;
    stim[27] = 11'h33d;
    stim[28] = 11'h077;
    stim[29] = 11'h0fb;
    stim[30] = 11'h29f;
    stim[31] = 11'h293;
    stim[32] = 11'h07f;
    stim[33] = 11'h09a;
    stim[34] = 11'h0f4;
    stim[35] = 11'h0e9;
    stim[36] = 11'h047;
    stim[37] = 11'h0e8;
    stim[38] = 11'h237;
    stim[39] = 11'h1a8;
    stim[40] = 11'h1ed;
    stim[41] = 11'h20a;
    stim[42] = 11'h102;
    stim[43] = 11'h2e1;
    stim[44] = 11'h3c7;
    stim[45] = 11'h386;
    stim[46] = 11'h0a2;
    stim[47] = 11'h16a;
    stim[48] = 11'h0ca;
    stim[49] = 11'h34a;
    stim[50] = 11'h09f;
    stim[51] = 11'h007;
    stim[52] = 11'h3f9;
    stim[53] = 11'h2a5;
    stim[54] = 11'h0eb;
    stim[55] = 11'h25b;
    stim[56] = 11'h10b;
    stim[57] = 11'h0d0;
    stim[58] = 11'h21b;
    stim[59] = 11'h1f6;
    stim[60] = 11'h335;
    stim[61] = 11'h301;
    stim[62] = 11'h34d;
    stim[63] = 11'h358;
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
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hb7d;
      expv[7] = 12'hb7d;
      expv[8] = 12'hb7d;
      expv[9] = 12'hb78;
      expv[10] = 12'hb78;
      expv[11] = 12'hb78;
      expv[12] = 12'hb78;
      expv[13] = 12'hc95;
      expv[14] = 12'hc95;
      expv[15] = 12'h496;
      expv[16] = 12'h496;
      expv[17] = 12'h496;
      expv[18] = 12'hc75;
      expv[19] = 12'h476;
      expv[20] = 12'h476;
      expv[21] = 12'he45;
      expv[22] = 12'h646;
      expv[23] = 12'hdbd;
      expv[24] = 12'h5be;
      expv[25] = 12'h5be;
      expv[26] = 12'he65;
      expv[27] = 12'ha85;
      expv[28] = 12'ha80;
      expv[29] = 12'h8ed;
      expv[30] = 12'h9f5;
      expv[31] = 12'hd3d;
      expv[32] = 12'hd25;
      expv[33] = 12'h8fd;
      expv[34] = 12'h0fe;
      expv[35] = 12'h0fe;
      expv[36] = 12'h935;
      expv[37] = 12'h88d;
      expv[38] = 12'h88d;
      expv[39] = 12'hc6d;
      expv[40] = 12'hc6d;
      expv[41] = 12'hc68;
      expv[42] = 12'hc15;
      expv[43] = 12'h416;
      expv[44] = 12'ha05;
      expv[45] = 12'hf8d;
      expv[46] = 12'h78e;
      expv[47] = 12'h78e;
      expv[48] = 12'h78e;
      expv[49] = 12'h78e;
      expv[50] = 12'h78e;
      expv[51] = 12'hf0d;
      expv[52] = 12'h80d;
      expv[53] = 12'h808;
      expv[54] = 12'h808;
      expv[55] = 12'h9d5;
      expv[56] = 12'hcb5;
      expv[57] = 12'ha15;
      expv[58] = 12'ha15;
      expv[59] = 12'hc35;
      expv[60] = 12'h436;
      expv[61] = 12'hbed;
      expv[62] = 12'hbe8;
      expv[63] = 12'hbe8;
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
