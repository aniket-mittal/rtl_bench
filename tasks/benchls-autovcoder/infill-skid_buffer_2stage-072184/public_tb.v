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

  autovcoder_072184 dut (
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
    stim[0] = 11'h5cf;
    stim[1] = 11'h658;
    stim[2] = 11'h2f8;
    stim[3] = 11'h08d;
    stim[4] = 11'h098;
    stim[5] = 11'h12b;
    stim[6] = 11'h25d;
    stim[7] = 11'h1ad;
    stim[8] = 11'h29e;
    stim[9] = 11'h144;
    stim[10] = 11'h090;
    stim[11] = 11'h3b8;
    stim[12] = 11'h312;
    stim[13] = 11'h372;
    stim[14] = 11'h24e;
    stim[15] = 11'h37d;
    stim[16] = 11'h38b;
    stim[17] = 11'h2cb;
    stim[18] = 11'h1a6;
    stim[19] = 11'h01a;
    stim[20] = 11'h1bd;
    stim[21] = 11'h1a6;
    stim[22] = 11'h38c;
    stim[23] = 11'h39f;
    stim[24] = 11'h2b1;
    stim[25] = 11'h1e0;
    stim[26] = 11'h1ed;
    stim[27] = 11'h3db;
    stim[28] = 11'h106;
    stim[29] = 11'h017;
    stim[30] = 11'h300;
    stim[31] = 11'h32d;
    stim[32] = 11'h219;
    stim[33] = 11'h3f9;
    stim[34] = 11'h036;
    stim[35] = 11'h14f;
    stim[36] = 11'h139;
    stim[37] = 11'h347;
    stim[38] = 11'h363;
    stim[39] = 11'h3ba;
    stim[40] = 11'h471;
    stim[41] = 11'h1c4;
    stim[42] = 11'h33c;
    stim[43] = 11'h3fd;
    stim[44] = 11'h0c4;
    stim[45] = 11'h2ac;
    stim[46] = 11'h1f6;
    stim[47] = 11'h16c;
    stim[48] = 11'h23a;
    stim[49] = 11'h111;
    stim[50] = 11'h197;
    stim[51] = 11'h250;
    stim[52] = 11'h04c;
    stim[53] = 11'h130;
    stim[54] = 11'h393;
    stim[55] = 11'h12f;
    stim[56] = 11'h030;
    stim[57] = 11'h37a;
    stim[58] = 11'h01e;
    stim[59] = 11'h3aa;
    stim[60] = 11'h028;
    stim[61] = 11'h009;
    stim[62] = 11'h0a8;
    stim[63] = 11'h176;
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
      expv[6] = 12'ha55;
      expv[7] = 12'ha50;
      expv[8] = 12'ha50;
      expv[9] = 12'hd3d;
      expv[10] = 12'hd3d;
      expv[11] = 12'hd3d;
      expv[12] = 12'hd3d;
      expv[13] = 12'h53e;
      expv[14] = 12'h53e;
      expv[15] = 12'h53e;
      expv[16] = 12'he25;
      expv[17] = 12'hf15;
      expv[18] = 12'hd95;
      expv[19] = 12'h596;
      expv[20] = 12'h596;
      expv[21] = 12'hb4d;
      expv[22] = 12'h34e;
      expv[23] = 12'h34e;
      expv[24] = 12'hb4d;
      expv[25] = 12'hb48;
      expv[26] = 12'hb48;
      expv[27] = 12'hb48;
      expv[28] = 12'hfb5;
      expv[29] = 12'h7b6;
      expv[30] = 12'ha0d;
      expv[31] = 12'ha0d;
      expv[32] = 12'ha08;
      expv[33] = 12'ha08;
      expv[34] = 12'ha08;
      expv[35] = 12'h86d;
      expv[36] = 12'ha9d;
      expv[37] = 12'ha98;
      expv[38] = 12'he8d;
      expv[39] = 12'hec5;
      expv[40] = 12'h6c6;
      expv[41] = 12'h770;
      expv[42] = 12'hf70;
      expv[43] = 12'hf70;
      expv[44] = 12'hf70;
      expv[45] = 12'hf70;
      expv[46] = 12'hf70;
      expv[47] = 12'hbed;
      expv[48] = 12'hbed;
      expv[49] = 12'h3ee;
      expv[50] = 12'hc75;
      expv[51] = 12'hb2d;
      expv[52] = 12'hb2d;
      expv[53] = 12'hb2d;
      expv[54] = 12'hb2d;
      expv[55] = 12'hf25;
      expv[56] = 12'ha5d;
      expv[57] = 12'ha5d;
      expv[58] = 12'h25e;
      expv[59] = 12'h25e;
      expv[60] = 12'h25e;
      expv[61] = 12'h25e;
      expv[62] = 12'hef5;
      expv[63] = 12'hef5;
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
