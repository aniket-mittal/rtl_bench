// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099551 dut (
    .in1(in_vec[16:9]),
    .in0(in_vec[8:1]),
    .sel(in_vec[0:0]),
    .ou1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h016b1;
    stim[1] = 17'h0b7d8;
    stim[2] = 17'h1a789;
    stim[3] = 17'h1714d;
    stim[4] = 17'h0ea99;
    stim[5] = 17'h0dbda;
    stim[6] = 17'h1c9e4;
    stim[7] = 17'h0a6fc;
    stim[8] = 17'h07e35;
    stim[9] = 17'h06684;
    stim[10] = 17'h1a719;
    stim[11] = 17'h096ef;
    stim[12] = 17'h1ca63;
    stim[13] = 17'h0fb06;
    stim[14] = 17'h16934;
    stim[15] = 17'h05b49;
    stim[16] = 17'h1d675;
    stim[17] = 17'h0faf8;
    stim[18] = 17'h0c7dd;
    stim[19] = 17'h0cb68;
    stim[20] = 17'h07c77;
    stim[21] = 17'h0b7b6;
    stim[22] = 17'h1e0ba;
    stim[23] = 17'h005b9;
    stim[24] = 17'h111e5;
    stim[25] = 17'h067b0;
    stim[26] = 17'h118fe;
    stim[27] = 17'h026f2;
    stim[28] = 17'h07ee7;
    stim[29] = 17'h001e4;
    stim[30] = 17'h06c98;
    stim[31] = 17'h19fab;
    stim[32] = 17'h05140;
    stim[33] = 17'h1f197;
    stim[34] = 17'h18c13;
    stim[35] = 17'h177c2;
    stim[36] = 17'h12027;
    stim[37] = 17'h04fd5;
    stim[38] = 17'h0f485;
    stim[39] = 17'h12d24;
    stim[40] = 17'h127f5;
    stim[41] = 17'h1b32b;
    stim[42] = 17'h1509f;
    stim[43] = 17'h12ae6;
    stim[44] = 17'h004d8;
    stim[45] = 17'h141bb;
    stim[46] = 17'h0be75;
    stim[47] = 17'h06c89;
    stim[48] = 17'h095af;
    stim[49] = 17'h0a965;
    stim[50] = 17'h135da;
    stim[51] = 17'h0d49e;
    stim[52] = 17'h08a0c;
    stim[53] = 17'h0555e;
    stim[54] = 17'h1d160;
    stim[55] = 17'h0d4b7;
    stim[56] = 17'h16032;
    stim[57] = 17'h061f9;
    stim[58] = 17'h1c943;
    stim[59] = 17'h10622;
    stim[60] = 17'h17c62;
    stim[61] = 17'h0b768;
    stim[62] = 17'h07b0f;
    stim[63] = 17'h12e85;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h0b;
      expv[1] = 8'hec;
      expv[2] = 8'hd3;
      expv[3] = 8'hb8;
      expv[4] = 8'h75;
      expv[5] = 8'hed;
      expv[6] = 8'hf2;
      expv[7] = 8'h7e;
      expv[8] = 8'h3f;
      expv[9] = 8'h42;
      expv[10] = 8'hd3;
      expv[11] = 8'h4b;
      expv[12] = 8'he5;
      expv[13] = 8'h83;
      expv[14] = 8'h9a;
      expv[15] = 8'h2d;
      expv[16] = 8'heb;
      expv[17] = 8'h7c;
      expv[18] = 8'h63;
      expv[19] = 8'hb4;
      expv[20] = 8'h3e;
      expv[21] = 8'hdb;
      expv[22] = 8'h5d;
      expv[23] = 8'h02;
      expv[24] = 8'h88;
      expv[25] = 8'hd8;
      expv[26] = 8'h7f;
      expv[27] = 8'h79;
      expv[28] = 8'h3f;
      expv[29] = 8'hf2;
      expv[30] = 8'h4c;
      expv[31] = 8'hcf;
      expv[32] = 8'ha0;
      expv[33] = 8'hf8;
      expv[34] = 8'hc6;
      expv[35] = 8'he1;
      expv[36] = 8'h90;
      expv[37] = 8'h27;
      expv[38] = 8'h7a;
      expv[39] = 8'h92;
      expv[40] = 8'h93;
      expv[41] = 8'hd9;
      expv[42] = 8'ha8;
      expv[43] = 8'h73;
      expv[44] = 8'h6c;
      expv[45] = 8'ha0;
      expv[46] = 8'h5f;
      expv[47] = 8'h36;
      expv[48] = 8'h4a;
      expv[49] = 8'h54;
      expv[50] = 8'hed;
      expv[51] = 8'h4f;
      expv[52] = 8'h06;
      expv[53] = 8'haf;
      expv[54] = 8'hb0;
      expv[55] = 8'h6a;
      expv[56] = 8'h19;
      expv[57] = 8'h30;
      expv[58] = 8'he4;
      expv[59] = 8'h11;
      expv[60] = 8'h31;
      expv[61] = 8'hb4;
      expv[62] = 8'h3d;
      expv[63] = 8'h97;
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
