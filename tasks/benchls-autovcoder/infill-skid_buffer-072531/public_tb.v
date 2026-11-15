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

  autovcoder_072531 dut (
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
    stim[0] = 11'h42e;
    stim[1] = 11'h799;
    stim[2] = 11'h113;
    stim[3] = 11'h0ae;
    stim[4] = 11'h18c;
    stim[5] = 11'h281;
    stim[6] = 11'h234;
    stim[7] = 11'h3b7;
    stim[8] = 11'h324;
    stim[9] = 11'h25b;
    stim[10] = 11'h085;
    stim[11] = 11'h035;
    stim[12] = 11'h0c5;
    stim[13] = 11'h17e;
    stim[14] = 11'h217;
    stim[15] = 11'h3ee;
    stim[16] = 11'h347;
    stim[17] = 11'h0fe;
    stim[18] = 11'h27a;
    stim[19] = 11'h0b3;
    stim[20] = 11'h137;
    stim[21] = 11'h07c;
    stim[22] = 11'h00e;
    stim[23] = 11'h2c9;
    stim[24] = 11'h312;
    stim[25] = 11'h16a;
    stim[26] = 11'h267;
    stim[27] = 11'h19c;
    stim[28] = 11'h205;
    stim[29] = 11'h1f8;
    stim[30] = 11'h228;
    stim[31] = 11'h7be;
    stim[32] = 11'h0be;
    stim[33] = 11'h341;
    stim[34] = 11'h2c4;
    stim[35] = 11'h0f7;
    stim[36] = 11'h01b;
    stim[37] = 11'h132;
    stim[38] = 11'h30d;
    stim[39] = 11'h203;
    stim[40] = 11'h1cf;
    stim[41] = 11'h3d1;
    stim[42] = 11'h27d;
    stim[43] = 11'h019;
    stim[44] = 11'h1a1;
    stim[45] = 11'h3c0;
    stim[46] = 11'h2cb;
    stim[47] = 11'h194;
    stim[48] = 11'h106;
    stim[49] = 11'h213;
    stim[50] = 11'h355;
    stim[51] = 11'h2d5;
    stim[52] = 11'h061;
    stim[53] = 11'h0ae;
    stim[54] = 11'h1fd;
    stim[55] = 11'h06d;
    stim[56] = 11'h0eb;
    stim[57] = 11'h103;
    stim[58] = 11'h15f;
    stim[59] = 11'h36a;
    stim[60] = 11'h0d0;
    stim[61] = 11'h251;
    stim[62] = 11'h303;
    stim[63] = 11'h38d;
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
      expv[3] = 12'ha20;
      expv[4] = 12'h95d;
      expv[5] = 12'h95d;
      expv[6] = 12'h958;
      expv[7] = 12'h958;
      expv[8] = 12'hf6d;
      expv[9] = 12'hf6d;
      expv[10] = 12'hcb5;
      expv[11] = 12'hcb0;
      expv[12] = 12'hcb0;
      expv[13] = 12'hcb0;
      expv[14] = 12'hafd;
      expv[15] = 12'hc2d;
      expv[16] = 12'h42e;
      expv[17] = 12'hfdd;
      expv[18] = 12'h7de;
      expv[19] = 12'h7de;
      expv[20] = 12'h9fd;
      expv[21] = 12'ha6d;
      expv[22] = 12'ha6d;
      expv[23] = 12'h26e;
      expv[24] = 12'h81d;
      expv[25] = 12'h01e;
      expv[26] = 12'h01e;
      expv[27] = 12'he25;
      expv[28] = 12'he25;
      expv[29] = 12'he20;
      expv[30] = 12'he20;
      expv[31] = 12'he20;
      expv[32] = 12'h778;
      expv[33] = 12'h978;
      expv[34] = 12'h978;
      expv[35] = 12'h978;
      expv[36] = 12'h9ed;
      expv[37] = 12'h835;
      expv[38] = 12'h036;
      expv[39] = 12'ha65;
      expv[40] = 12'hc05;
      expv[41] = 12'hb9d;
      expv[42] = 12'hb98;
      expv[43] = 12'hb98;
      expv[44] = 12'hb98;
      expv[45] = 12'hb98;
      expv[46] = 12'hb98;
      expv[47] = 12'hd95;
      expv[48] = 12'hd95;
      expv[49] = 12'h596;
      expv[50] = 12'ha0d;
      expv[51] = 12'ha08;
      expv[52] = 12'ha08;
      expv[53] = 12'ha08;
      expv[54] = 12'h95d;
      expv[55] = 12'h958;
      expv[56] = 12'h958;
      expv[57] = 12'h9d5;
      expv[58] = 12'ha05;
      expv[59] = 12'habd;
      expv[60] = 12'h2be;
      expv[61] = 12'h2be;
      expv[62] = 12'hed5;
      expv[63] = 12'he05;
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
