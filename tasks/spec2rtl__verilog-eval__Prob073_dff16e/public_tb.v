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

  TopModule dut (
    .clk(clk),
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1c3b5;
    stim[1] = 19'h3c09e;
    stim[2] = 19'h67cd5;
    stim[3] = 19'h700f0;
    stim[4] = 19'h64b64;
    stim[5] = 19'h62fc2;
    stim[6] = 19'h57c11;
    stim[7] = 19'h53fb3;
    stim[8] = 19'h5c0a6;
    stim[9] = 19'h4eee4;
    stim[10] = 19'h616f2;
    stim[11] = 19'h3c56e;
    stim[12] = 19'h5c2f2;
    stim[13] = 19'h6c2e1;
    stim[14] = 19'h4fa5c;
    stim[15] = 19'h55489;
    stim[16] = 19'h54625;
    stim[17] = 19'h7ca42;
    stim[18] = 19'h5294c;
    stim[19] = 19'h72b7a;
    stim[20] = 19'h73b99;
    stim[21] = 19'h48db4;
    stim[22] = 19'h45a83;
    stim[23] = 19'h60f26;
    stim[24] = 19'h5e338;
    stim[25] = 19'h40554;
    stim[26] = 19'h712aa;
    stim[27] = 19'h5a228;
    stim[28] = 19'h4c0ef;
    stim[29] = 19'h2032c;
    stim[30] = 19'h56e90;
    stim[31] = 19'h7e523;
    stim[32] = 19'h54926;
    stim[33] = 19'h6b620;
    stim[34] = 19'h6a69a;
    stim[35] = 19'h55605;
    stim[36] = 19'h52092;
    stim[37] = 19'h7e12b;
    stim[38] = 19'h69aa9;
    stim[39] = 19'h48319;
    stim[40] = 19'h753c5;
    stim[41] = 19'h34064;
    stim[42] = 19'h427e3;
    stim[43] = 19'h58c1d;
    stim[44] = 19'h49909;
    stim[45] = 19'h6784b;
    stim[46] = 19'h7079e;
    stim[47] = 19'h53c8d;
    stim[48] = 19'h71edf;
    stim[49] = 19'h7be54;
    stim[50] = 19'h47e48;
    stim[51] = 19'h48eb4;
    stim[52] = 19'h5cc52;
    stim[53] = 19'h5dabd;
    stim[54] = 19'h65229;
    stim[55] = 19'h4f2c0;
    stim[56] = 19'h511c1;
    stim[57] = 19'h474ef;
    stim[58] = 19'h4b19f;
    stim[59] = 19'h46f10;
    stim[60] = 19'h6c6f7;
    stim[61] = 19'h77ea8;
    stim[62] = 19'h4f65d;
    stim[63] = 19'h60d7d;
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
      expv[3] = 16'h7c00;
      expv[4] = 16'h00f0;
      expv[5] = 16'h4bf0;
      expv[6] = 16'h2ff0;
      expv[7] = 16'h2f11;
      expv[8] = 16'h2fb3;
      expv[9] = 16'h2fa6;
      expv[10] = 16'h2fa6;
      expv[11] = 16'h16a6;
      expv[12] = 16'h0000;
      expv[13] = 16'h00f2;
      expv[14] = 16'hc2f2;
      expv[15] = 16'hc2f2;
      expv[16] = 16'hc289;
      expv[17] = 16'hc225;
      expv[18] = 16'hca42;
      expv[19] = 16'hca4c;
      expv[20] = 16'h2b7a;
      expv[21] = 16'h3b99;
      expv[22] = 16'h3b99;
      expv[23] = 16'h3b99;
      expv[24] = 16'h0f99;
      expv[25] = 16'h0f38;
      expv[26] = 16'h0f38;
      expv[27] = 16'h12aa;
      expv[28] = 16'h1228;
      expv[29] = 16'h1228;
      expv[30] = 16'h0000;
      expv[31] = 16'h0090;
      expv[32] = 16'he523;
      expv[33] = 16'he526;
      expv[34] = 16'hb626;
      expv[35] = 16'ha626;
      expv[36] = 16'ha605;
      expv[37] = 16'ha692;
      expv[38] = 16'he12b;
      expv[39] = 16'h9a2b;
      expv[40] = 16'h9a2b;
      expv[41] = 16'h53c5;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h001d;
      expv[45] = 16'h001d;
      expv[46] = 16'h781d;
      expv[47] = 16'h079e;
      expv[48] = 16'h078d;
      expv[49] = 16'h1edf;
      expv[50] = 16'hbe54;
      expv[51] = 16'hbe54;
      expv[52] = 16'hbe54;
      expv[53] = 16'hbe52;
      expv[54] = 16'hbebd;
      expv[55] = 16'h52bd;
      expv[56] = 16'h52bd;
      expv[57] = 16'h52c1;
      expv[58] = 16'h52c1;
      expv[59] = 16'h52c1;
      expv[60] = 16'h52c1;
      expv[61] = 16'hc6c1;
      expv[62] = 16'h7ea8;
      expv[63] = 16'h7ea8;
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
