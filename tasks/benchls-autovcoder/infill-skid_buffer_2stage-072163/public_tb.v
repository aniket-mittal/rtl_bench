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

  autovcoder_072163 dut (
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
    stim[0] = 11'h58d;
    stim[1] = 11'h5d4;
    stim[2] = 11'h0e0;
    stim[3] = 11'h3f5;
    stim[4] = 11'h28e;
    stim[5] = 11'h023;
    stim[6] = 11'h060;
    stim[7] = 11'h19d;
    stim[8] = 11'h02e;
    stim[9] = 11'h3c8;
    stim[10] = 11'h1fb;
    stim[11] = 11'h235;
    stim[12] = 11'h1cb;
    stim[13] = 11'h19e;
    stim[14] = 11'h1e0;
    stim[15] = 11'h0ff;
    stim[16] = 11'h3ca;
    stim[17] = 11'h1c9;
    stim[18] = 11'h163;
    stim[19] = 11'h3c9;
    stim[20] = 11'h0d8;
    stim[21] = 11'h1da;
    stim[22] = 11'h3fc;
    stim[23] = 11'h0e2;
    stim[24] = 11'h0bf;
    stim[25] = 11'h1f7;
    stim[26] = 11'h23e;
    stim[27] = 11'h257;
    stim[28] = 11'h055;
    stim[29] = 11'h36e;
    stim[30] = 11'h3a8;
    stim[31] = 11'h0ba;
    stim[32] = 11'h2b1;
    stim[33] = 11'h151;
    stim[34] = 11'h109;
    stim[35] = 11'h373;
    stim[36] = 11'h176;
    stim[37] = 11'h253;
    stim[38] = 11'h14c;
    stim[39] = 11'h147;
    stim[40] = 11'h220;
    stim[41] = 11'h022;
    stim[42] = 11'h03d;
    stim[43] = 11'h0a4;
    stim[44] = 11'h2b2;
    stim[45] = 11'h037;
    stim[46] = 11'h13c;
    stim[47] = 11'h157;
    stim[48] = 11'h391;
    stim[49] = 11'h0bf;
    stim[50] = 11'h2b9;
    stim[51] = 11'h043;
    stim[52] = 11'h3c7;
    stim[53] = 11'h1d8;
    stim[54] = 11'h393;
    stim[55] = 11'h389;
    stim[56] = 11'h1bb;
    stim[57] = 11'h221;
    stim[58] = 11'h256;
    stim[59] = 11'h02b;
    stim[60] = 11'h21b;
    stim[61] = 11'h3d7;
    stim[62] = 11'h3c0;
    stim[63] = 11'h2a3;
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
      expv[5] = 12'hd1d;
      expv[6] = 12'h845;
      expv[7] = 12'h845;
      expv[8] = 12'h840;
      expv[9] = 12'h85d;
      expv[10] = 12'h85d;
      expv[11] = 12'hbf5;
      expv[12] = 12'hbf0;
      expv[13] = 12'hb95;
      expv[14] = 12'h396;
      expv[15] = 12'h396;
      expv[16] = 12'hb3d;
      expv[17] = 12'h33e;
      expv[18] = 12'hf95;
      expv[19] = 12'hac5;
      expv[20] = 12'hac0;
      expv[21] = 12'hac0;
      expv[22] = 12'hbb5;
      expv[23] = 12'hbb5;
      expv[24] = 12'h3b6;
      expv[25] = 12'h9c5;
      expv[26] = 12'hbed;
      expv[27] = 12'h3ee;
      expv[28] = 12'hc7d;
      expv[29] = 12'hc78;
      expv[30] = 12'hedd;
      expv[31] = 12'hedd;
      expv[32] = 12'h6de;
      expv[33] = 12'h975;
      expv[34] = 12'h970;
      expv[35] = 12'h970;
      expv[36] = 12'hee5;
      expv[37] = 12'h6e6;
      expv[38] = 12'haed;
      expv[39] = 12'haed;
      expv[40] = 12'ha8d;
      expv[41] = 12'ha8d;
      expv[42] = 12'h28e;
      expv[43] = 12'h845;
      expv[44] = 12'h845;
      expv[45] = 12'h046;
      expv[46] = 12'hd65;
      expv[47] = 12'hd65;
      expv[48] = 12'haad;
      expv[49] = 12'haa8;
      expv[50] = 12'h97d;
      expv[51] = 12'h978;
      expv[52] = 12'h885;
      expv[53] = 12'hf8d;
      expv[54] = 12'hf8d;
      expv[55] = 12'hf25;
      expv[56] = 12'hf20;
      expv[57] = 12'hb75;
      expv[58] = 12'hb70;
      expv[59] = 12'hcad;
      expv[60] = 12'h855;
      expv[61] = 12'hc35;
      expv[62] = 12'hfad;
      expv[63] = 12'hfad;
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
