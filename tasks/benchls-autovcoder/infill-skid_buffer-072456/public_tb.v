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

  autovcoder_072456 dut (
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
    stim[0] = 11'h6be;
    stim[1] = 11'h57b;
    stim[2] = 11'h345;
    stim[3] = 11'h1e4;
    stim[4] = 11'h06b;
    stim[5] = 11'h3ff;
    stim[6] = 11'h2f3;
    stim[7] = 11'h3af;
    stim[8] = 11'h0f6;
    stim[9] = 11'h094;
    stim[10] = 11'h23f;
    stim[11] = 11'h23f;
    stim[12] = 11'h0e3;
    stim[13] = 11'h348;
    stim[14] = 11'h336;
    stim[15] = 11'h337;
    stim[16] = 11'h040;
    stim[17] = 11'h204;
    stim[18] = 11'h076;
    stim[19] = 11'h3bb;
    stim[20] = 11'h274;
    stim[21] = 11'h38f;
    stim[22] = 11'h003;
    stim[23] = 11'h0cd;
    stim[24] = 11'h1e9;
    stim[25] = 11'h61f;
    stim[26] = 11'h303;
    stim[27] = 11'h245;
    stim[28] = 11'h3e1;
    stim[29] = 11'h210;
    stim[30] = 11'h240;
    stim[31] = 11'h1d6;
    stim[32] = 11'h379;
    stim[33] = 11'h03c;
    stim[34] = 11'h063;
    stim[35] = 11'h03c;
    stim[36] = 11'h22e;
    stim[37] = 11'h37a;
    stim[38] = 11'h306;
    stim[39] = 11'h26e;
    stim[40] = 11'h3d3;
    stim[41] = 11'h1bc;
    stim[42] = 11'h46d;
    stim[43] = 11'h048;
    stim[44] = 11'h17c;
    stim[45] = 11'h01e;
    stim[46] = 11'h0ad;
    stim[47] = 11'h117;
    stim[48] = 11'h320;
    stim[49] = 11'h0ce;
    stim[50] = 11'h017;
    stim[51] = 11'h028;
    stim[52] = 11'h2a8;
    stim[53] = 11'h353;
    stim[54] = 11'h2d4;
    stim[55] = 11'h138;
    stim[56] = 11'h1ec;
    stim[57] = 11'h108;
    stim[58] = 11'h0ca;
    stim[59] = 11'h251;
    stim[60] = 11'h11d;
    stim[61] = 11'h1aa;
    stim[62] = 11'h15d;
    stim[63] = 11'h276;
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
      expv[2] = 12'h2f0;
      expv[3] = 12'haf0;
      expv[4] = 12'haf0;
      expv[5] = 12'h8d5;
      expv[6] = 12'hffd;
      expv[7] = 12'hde5;
      expv[8] = 12'hf5d;
      expv[9] = 12'h75e;
      expv[10] = 12'h75e;
      expv[11] = 12'h9ed;
      expv[12] = 12'hc7d;
      expv[13] = 12'h9c5;
      expv[14] = 12'h9c5;
      expv[15] = 12'h1c6;
      expv[16] = 12'he6d;
      expv[17] = 12'he6d;
      expv[18] = 12'he6d;
      expv[19] = 12'h66e;
      expv[20] = 12'h8ed;
      expv[21] = 12'h8ed;
      expv[22] = 12'hf1d;
      expv[23] = 12'h805;
      expv[24] = 12'h800;
      expv[25] = 12'h800;
      expv[26] = 12'h438;
      expv[27] = 12'he00;
      expv[28] = 12'he00;
      expv[29] = 12'he00;
      expv[30] = 12'he00;
      expv[31] = 12'he00;
      expv[32] = 12'hbad;
      expv[33] = 12'hba8;
      expv[34] = 12'hba8;
      expv[35] = 12'h8c5;
      expv[36] = 12'h8c5;
      expv[37] = 12'h0c6;
      expv[38] = 12'h0c6;
      expv[39] = 12'h0c6;
      expv[40] = 12'h0c6;
      expv[41] = 12'hc5d;
      expv[42] = 12'hc5d;
      expv[43] = 12'h458;
      expv[44] = 12'hc58;
      expv[45] = 12'hc58;
      expv[46] = 12'h83d;
      expv[47] = 12'h838;
      expv[48] = 12'ha2d;
      expv[49] = 12'ha2d;
      expv[50] = 12'h22e;
      expv[51] = 12'h99d;
      expv[52] = 12'h99d;
      expv[53] = 12'h99d;
      expv[54] = 12'hea5;
      expv[55] = 12'hea5;
      expv[56] = 12'hea5;
      expv[57] = 12'hea5;
      expv[58] = 12'hea5;
      expv[59] = 12'h6a6;
      expv[60] = 12'h995;
      expv[61] = 12'h990;
      expv[62] = 12'hb55;
      expv[63] = 12'hb50;
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
