// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011734 dut (
    .VGA_CLK(clk),
    .disp_en(in_vec[22:22]),
    .x(in_vec[21:11]),
    .y(in_vec[10:0]),
    .r(out_vec[23:16]),
    .g(out_vec[15:8]),
    .b(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h5287b6;
    stim[1] = 23'h3a312a;
    stim[2] = 23'h06c83a;
    stim[3] = 23'h52b8b7;
    stim[4] = 23'h1f0373;
    stim[5] = 23'h5b9903;
    stim[6] = 23'h383e16;
    stim[7] = 23'h02afa0;
    stim[8] = 23'h303dca;
    stim[9] = 23'h6c200c;
    stim[10] = 23'h42054d;
    stim[11] = 23'h6e0df0;
    stim[12] = 23'h0a769e;
    stim[13] = 23'h4a80d4;
    stim[14] = 23'h358598;
    stim[15] = 23'h73b4d0;
    stim[16] = 23'h43e7d6;
    stim[17] = 23'h4b5be0;
    stim[18] = 23'h6f1908;
    stim[19] = 23'h301b18;
    stim[20] = 23'h1f05eb;
    stim[21] = 23'h38dfec;
    stim[22] = 23'h5c4f90;
    stim[23] = 23'h2e9095;
    stim[24] = 23'h029089;
    stim[25] = 23'h050dd9;
    stim[26] = 23'h2d195a;
    stim[27] = 23'h4233eb;
    stim[28] = 23'h5554eb;
    stim[29] = 23'h3df421;
    stim[30] = 23'h4108fb;
    stim[31] = 23'h46ad5d;
    stim[32] = 23'h48cf87;
    stim[33] = 23'h744310;
    stim[34] = 23'h0e14ff;
    stim[35] = 23'h7f07a9;
    stim[36] = 23'h2ddc28;
    stim[37] = 23'h04d8de;
    stim[38] = 23'h4b33c0;
    stim[39] = 23'h31d6d6;
    stim[40] = 23'h21c3c7;
    stim[41] = 23'h08731e;
    stim[42] = 23'h11f923;
    stim[43] = 23'h0f9d74;
    stim[44] = 23'h6420bd;
    stim[45] = 23'h538da2;
    stim[46] = 23'h6c2fb7;
    stim[47] = 23'h499b06;
    stim[48] = 23'h5e056b;
    stim[49] = 23'h65b822;
    stim[50] = 23'h017dd1;
    stim[51] = 23'h078c9c;
    stim[52] = 23'h150c5f;
    stim[53] = 23'h050c40;
    stim[54] = 23'h0bbd6b;
    stim[55] = 23'h43ac56;
    stim[56] = 23'h6c257c;
    stim[57] = 23'h4b597e;
    stim[58] = 23'h42ce3c;
    stim[59] = 23'h10fb1f;
    stim[60] = 23'h4eaebe;
    stim[61] = 23'h3ca845;
    stim[62] = 23'h0fca3a;
    stim[63] = 23'h504e90;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hff00ff;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h0000d2;
      expv[5] = 24'h000000;
      expv[6] = 24'h0000bf;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h00ffff;
      expv[11] = 24'hff00ff;
      expv[12] = 24'hffff00;
      expv[13] = 24'h000000;
      expv[14] = 24'h0000ca;
      expv[15] = 24'h000000;
      expv[16] = 24'hffff00;
      expv[17] = 24'hff00ff;
      expv[18] = 24'h000007;
      expv[19] = 24'hffff00;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'hff00ff;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'hff00ff;
      expv[29] = 24'hff00ff;
      expv[30] = 24'h000000;
      expv[31] = 24'h0000c1;
      expv[32] = 24'hff00ff;
      expv[33] = 24'hff00ff;
      expv[34] = 24'hffff00;
      expv[35] = 24'h000000;
      expv[36] = 24'hffff00;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h00000f;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h0000d0;
      expv[46] = 24'hff00ff;
      expv[47] = 24'hffff00;
      expv[48] = 24'h00003e;
      expv[49] = 24'hff00ff;
      expv[50] = 24'h0000f7;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'hff00ff;
      expv[57] = 24'hffff00;
      expv[58] = 24'h0000a0;
      expv[59] = 24'hff00ff;
      expv[60] = 24'h000000;
      expv[61] = 24'hff00ff;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
