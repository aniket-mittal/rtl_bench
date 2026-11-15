// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07504 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sample_clk_en(in_vec[17:17]),
    .fnum(in_vec[16:9]),
    .mult(in_vec[8:5]),
    .block(in_vec[4:2]),
    .vib(in_vec[1:1]),
    .dvb(in_vec[0:0]),
    .phase_inc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h41576;
    stim[1] = 19'h5bacf;
    stim[2] = 19'h080a0;
    stim[3] = 19'h2a826;
    stim[4] = 19'h00252;
    stim[5] = 19'h0c64a;
    stim[6] = 19'h2714b;
    stim[7] = 19'h2ec93;
    stim[8] = 19'h07b08;
    stim[9] = 19'h2d29a;
    stim[10] = 19'h7e69e;
    stim[11] = 19'h3c2dd;
    stim[12] = 19'h14a65;
    stim[13] = 19'h2df6c;
    stim[14] = 19'h33932;
    stim[15] = 19'h27c74;
    stim[16] = 19'h3ec44;
    stim[17] = 19'h26292;
    stim[18] = 19'h0dd11;
    stim[19] = 19'h35a1a;
    stim[20] = 19'h2b55e;
    stim[21] = 19'h0ab3b;
    stim[22] = 19'h18f6d;
    stim[23] = 19'h56d02;
    stim[24] = 19'h3cbca;
    stim[25] = 19'h1736a;
    stim[26] = 19'h1f28b;
    stim[27] = 19'h2b95e;
    stim[28] = 19'h1d266;
    stim[29] = 19'h3d469;
    stim[30] = 19'h16fcb;
    stim[31] = 19'h3a1a8;
    stim[32] = 19'h18cbe;
    stim[33] = 19'h2ef37;
    stim[34] = 19'h1e733;
    stim[35] = 19'h32b63;
    stim[36] = 19'h07692;
    stim[37] = 19'h3e825;
    stim[38] = 19'h37045;
    stim[39] = 19'h00aad;
    stim[40] = 19'h3ce64;
    stim[41] = 19'h1efa5;
    stim[42] = 19'h120aa;
    stim[43] = 19'h0b43d;
    stim[44] = 19'h2380f;
    stim[45] = 19'h06aa1;
    stim[46] = 19'h6335f;
    stim[47] = 19'h05ef9;
    stim[48] = 19'h18f7c;
    stim[49] = 19'h3df9c;
    stim[50] = 19'h118c7;
    stim[51] = 19'h3d21b;
    stim[52] = 19'h2e548;
    stim[53] = 19'h1b12b;
    stim[54] = 19'h0f65e;
    stim[55] = 19'h1657f;
    stim[56] = 19'h197b8;
    stim[57] = 19'h1b8cd;
    stim[58] = 19'h129b7;
    stim[59] = 19'h243cd;
    stim[60] = 19'h3e467;
    stim[61] = 19'h1d27f;
    stim[62] = 19'h02525;
    stim[63] = 19'h1461a;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0140;
      expv[4] = 16'h00a8;
      expv[5] = 16'h0020;
      expv[6] = 16'h0318;
      expv[7] = 16'hfac0;
      expv[8] = 16'h1d80;
      expv[9] = 16'hf860;
      expv[10] = 16'h6900;
      expv[11] = 16'h0000;
      expv[12] = 16'ha300;
      expv[13] = 16'h03de;
      expv[14] = 16'heb30;
      expv[15] = 16'hbbc0;
      expv[16] = 16'h1740;
      expv[17] = 16'h03d8;
      expv[18] = 16'h0c40;
      expv[19] = 16'hc900;
      expv[20] = 16'h15a0;
      expv[21] = 16'hf200;
      expv[22] = 16'h6b40;
      expv[23] = 16'hdab0;
      expv[24] = 16'h0000;
      expv[25] = 16'hfc6c;
      expv[26] = 16'heea8;
      expv[27] = 16'h0f90;
      expv[28] = 16'hec00;
      expv[29] = 16'h0576;
      expv[30] = 16'h0af8;
      expv[31] = 16'hfd24;
      expv[32] = 16'hf300;
      expv[33] = 16'hef00;
      expv[34] = 16'h97e0;
      expv[35] = 16'h95b0;
      expv[36] = 16'hfc82;
      expv[37] = 16'h0ec0;
      expv[38] = 16'h01e8;
      expv[39] = 16'h02e0;
      expv[40] = 16'h00c8;
      expv[41] = 16'h056a;
      expv[42] = 16'hf848;
      expv[43] = 16'h0b40;
      expv[44] = 16'h2d00;
      expv[45] = 16'h0070;
      expv[46] = 16'h0109;
      expv[47] = 16'h0000;
      expv[48] = 16'h5240;
      expv[49] = 16'hab00;
      expv[50] = 16'h2200;
      expv[51] = 16'h0690;
      expv[52] = 16'h1d20;
      expv[53] = 16'hf550;
      expv[54] = 16'he860;
      expv[55] = 16'h7b00;
      expv[56] = 16'hea00;
      expv[57] = 16'h3500;
      expv[58] = 16'h2940;
      expv[59] = 16'hb600;
      expv[60] = 16'hfef8;
      expv[61] = 16'h05ac;
      expv[62] = 16'h5d80;
      expv[63] = 16'hff04;
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
