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

  autovcoder_072202 dut (
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
    stim[0] = 11'h542;
    stim[1] = 11'h46b;
    stim[2] = 11'h1cd;
    stim[3] = 11'h0ca;
    stim[4] = 11'h01d;
    stim[5] = 11'h4e1;
    stim[6] = 11'h081;
    stim[7] = 11'h3ef;
    stim[8] = 11'h01b;
    stim[9] = 11'h0b1;
    stim[10] = 11'h150;
    stim[11] = 11'h205;
    stim[12] = 11'h261;
    stim[13] = 11'h32d;
    stim[14] = 11'h173;
    stim[15] = 11'h261;
    stim[16] = 11'h2ad;
    stim[17] = 11'h029;
    stim[18] = 11'h127;
    stim[19] = 11'h3f4;
    stim[20] = 11'h2c8;
    stim[21] = 11'h31f;
    stim[22] = 11'h759;
    stim[23] = 11'h117;
    stim[24] = 11'h12d;
    stim[25] = 11'h230;
    stim[26] = 11'h1d4;
    stim[27] = 11'h153;
    stim[28] = 11'h0c1;
    stim[29] = 11'h13d;
    stim[30] = 11'h2d7;
    stim[31] = 11'h038;
    stim[32] = 11'h0e0;
    stim[33] = 11'h368;
    stim[34] = 11'h385;
    stim[35] = 11'h122;
    stim[36] = 11'h235;
    stim[37] = 11'h37f;
    stim[38] = 11'h14d;
    stim[39] = 11'h3a1;
    stim[40] = 11'h173;
    stim[41] = 11'h044;
    stim[42] = 11'h107;
    stim[43] = 11'h3d6;
    stim[44] = 11'h3a5;
    stim[45] = 11'h0fc;
    stim[46] = 11'h3f7;
    stim[47] = 11'h286;
    stim[48] = 11'h0d8;
    stim[49] = 11'h264;
    stim[50] = 11'h187;
    stim[51] = 11'h0f5;
    stim[52] = 11'h085;
    stim[53] = 11'h1d8;
    stim[54] = 11'h1c6;
    stim[55] = 11'h314;
    stim[56] = 11'h080;
    stim[57] = 11'h1cf;
    stim[58] = 11'h1e5;
    stim[59] = 11'h1d8;
    stim[60] = 11'h2da;
    stim[61] = 11'h3c5;
    stim[62] = 11'h014;
    stim[63] = 11'h117;
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
      expv[2] = 12'h0d0;
      expv[3] = 12'h8d0;
      expv[4] = 12'h995;
      expv[5] = 12'h990;
      expv[6] = 12'h190;
      expv[7] = 12'h990;
      expv[8] = 12'hfdd;
      expv[9] = 12'h835;
      expv[10] = 12'h830;
      expv[11] = 12'h830;
      expv[12] = 12'h830;
      expv[13] = 12'h830;
      expv[14] = 12'h830;
      expv[15] = 12'hae5;
      expv[16] = 12'hae0;
      expv[17] = 12'hae0;
      expv[18] = 12'hae0;
      expv[19] = 12'ha4d;
      expv[20] = 12'ha4d;
      expv[21] = 12'ha4d;
      expv[22] = 12'he3d;
      expv[23] = 12'h638;
      expv[24] = 12'ha28;
      expv[25] = 12'ha28;
      expv[26] = 12'ha28;
      expv[27] = 12'ha28;
      expv[28] = 12'haa5;
      expv[29] = 12'haa0;
      expv[30] = 12'haa0;
      expv[31] = 12'hdad;
      expv[32] = 12'hdad;
      expv[33] = 12'hdad;
      expv[34] = 12'hdad;
      expv[35] = 12'hda8;
      expv[36] = 12'ha45;
      expv[37] = 12'ha40;
      expv[38] = 12'hefd;
      expv[39] = 12'hef8;
      expv[40] = 12'hef8;
      expv[41] = 12'hae5;
      expv[42] = 12'hae5;
      expv[43] = 12'ha0d;
      expv[44] = 12'h20e;
      expv[45] = 12'hfad;
      expv[46] = 12'hfad;
      expv[47] = 12'hfed;
      expv[48] = 12'h7ee;
      expv[49] = 12'h7ee;
      expv[50] = 12'h7ee;
      expv[51] = 12'hd0d;
      expv[52] = 12'hd08;
      expv[53] = 12'hd08;
      expv[54] = 12'hd08;
      expv[55] = 12'hb8d;
      expv[56] = 12'hb8d;
      expv[57] = 12'hb8d;
      expv[58] = 12'hb9d;
      expv[59] = 12'hb98;
      expv[60] = 12'hb98;
      expv[61] = 12'hdb5;
      expv[62] = 12'hdb0;
      expv[63] = 12'hdb0;
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
