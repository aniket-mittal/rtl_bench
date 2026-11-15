// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004227 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .dispatch_en_i(in_vec[13:13]),
    .retire_en_i(in_vec[12:12]),
    .retire_preg_i(in_vec[11:6]),
    .recover_en_i(in_vec[5:5]),
    .recover_head_i(in_vec[4:0]),
    .free_preg_vld_o(out_vec[11:11]),
    .free_preg_o(out_vec[10:5]),
    .free_preg_cur_head_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h46ba;
    stim[1] = 15'h5058;
    stim[2] = 15'h2c6d;
    stim[3] = 15'h0e5e;
    stim[4] = 15'h0860;
    stim[5] = 15'h3fc0;
    stim[6] = 15'h1005;
    stim[7] = 15'h20f4;
    stim[8] = 15'h06a6;
    stim[9] = 15'h287c;
    stim[10] = 15'h13f1;
    stim[11] = 15'h292c;
    stim[12] = 15'h6fc8;
    stim[13] = 15'h3523;
    stim[14] = 15'h23e5;
    stim[15] = 15'h1a23;
    stim[16] = 15'h085a;
    stim[17] = 15'h0809;
    stim[18] = 15'h3ba4;
    stim[19] = 15'h2a49;
    stim[20] = 15'h033e;
    stim[21] = 15'h2538;
    stim[22] = 15'h1aa7;
    stim[23] = 15'h11e6;
    stim[24] = 15'h0ba9;
    stim[25] = 15'h0961;
    stim[26] = 15'h08d5;
    stim[27] = 15'h169d;
    stim[28] = 15'h19b8;
    stim[29] = 15'h206f;
    stim[30] = 15'h251a;
    stim[31] = 15'h1f5c;
    stim[32] = 15'h0141;
    stim[33] = 15'h0f8d;
    stim[34] = 15'h05c7;
    stim[35] = 15'h15d1;
    stim[36] = 15'h0664;
    stim[37] = 15'h2b3a;
    stim[38] = 15'h15f1;
    stim[39] = 15'h3425;
    stim[40] = 15'h2a3d;
    stim[41] = 15'h1276;
    stim[42] = 15'h076e;
    stim[43] = 15'h234f;
    stim[44] = 15'h07c5;
    stim[45] = 15'h2af7;
    stim[46] = 15'h0e37;
    stim[47] = 15'h2a9d;
    stim[48] = 15'h346c;
    stim[49] = 15'h21f6;
    stim[50] = 15'h1bb9;
    stim[51] = 15'h3932;
    stim[52] = 15'h1aaf;
    stim[53] = 15'h0d78;
    stim[54] = 15'h0ea7;
    stim[55] = 15'h1abb;
    stim[56] = 15'h0034;
    stim[57] = 15'h3b00;
    stim[58] = 15'h3ebd;
    stim[59] = 15'h2ba2;
    stim[60] = 15'h1167;
    stim[61] = 15'h02e4;
    stim[62] = 15'h1214;
    stim[63] = 15'h1ff5;
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
      expv[0] = 12'hc00;
      expv[1] = 12'hc00;
      expv[2] = 12'hc00;
      expv[3] = 12'hc00;
      expv[4] = 12'hc0d;
      expv[5] = 12'hc0d;
      expv[6] = 12'hc00;
      expv[7] = 12'h801;
      expv[8] = 12'hc21;
      expv[9] = 12'hc34;
      expv[10] = 12'hcc6;
      expv[11] = 12'h9fc;
      expv[12] = 12'hc00;
      expv[13] = 12'hc00;
      expv[14] = 12'hc00;
      expv[15] = 12'hc63;
      expv[16] = 12'hd05;
      expv[17] = 12'hd03;
      expv[18] = 12'hd03;
      expv[19] = 12'hc63;
      expv[20] = 12'hc84;
      expv[21] = 12'hc85;
      expv[22] = 12'hfde;
      expv[23] = 12'hd58;
      expv[24] = 12'h8e7;
      expv[25] = 12'h8e6;
      expv[26] = 12'h8e9;
      expv[27] = 12'h8e1;
      expv[28] = 12'hb41;
      expv[29] = 12'hb41;
      expv[30] = 12'hf18;
      expv[31] = 12'hdef;
      expv[32] = 12'hfb0;
      expv[33] = 12'hfb0;
      expv[34] = 12'hfb0;
      expv[35] = 12'hfb0;
      expv[36] = 12'haf0;
      expv[37] = 12'haf0;
      expv[38] = 12'hc84;
      expv[39] = 12'hafa;
      expv[40] = 12'he31;
      expv[41] = 12'hca5;
      expv[42] = 12'h93d;
      expv[43] = 12'h936;
      expv[44] = 12'hdce;
      expv[45] = 12'hdcf;
      expv[46] = 12'hdef;
      expv[47] = 12'hdf7;
      expv[48] = 12'hef7;
      expv[49] = 12'hf18;
      expv[50] = 12'hd8c;
      expv[51] = 12'hdd6;
      expv[52] = 12'hf39;
      expv[53] = 12'hd52;
      expv[54] = 12'hd4f;
      expv[55] = 12'hd58;
      expv[56] = 12'hd47;
      expv[57] = 12'hd5b;
      expv[58] = 12'he94;
      expv[59] = 12'heb5;
      expv[60] = 12'hfbd;
      expv[61] = 12'hfa2;
      expv[62] = 12'hfa7;
      expv[63] = 12'hfa4;
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
