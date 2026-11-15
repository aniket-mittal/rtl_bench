// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066374 dut (
    .currentFrame(in_vec[8:5]),
    .address0(in_vec[4:0]),
    .startPixel0(out_vec[99:90]),
    .startPixel1(out_vec[89:80]),
    .startPixel2(out_vec[79:70]),
    .rowPixelPanel0(out_vec[69:60]),
    .rowPixelPanel1(out_vec[59:50]),
    .rowPixelPanel2(out_vec[49:40]),
    .rowPixelPanel3(out_vec[39:30]),
    .rowPixelPanel4(out_vec[29:20]),
    .rowPixelPanel5(out_vec[19:10]),
    .rowPixelPanel7(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1d2;
    stim[1] = 9'h1af;
    stim[2] = 9'h0b8;
    stim[3] = 9'h046;
    stim[4] = 9'h1fa;
    stim[5] = 9'h118;
    stim[6] = 9'h056;
    stim[7] = 9'h0f6;
    stim[8] = 9'h103;
    stim[9] = 9'h1d2;
    stim[10] = 9'h023;
    stim[11] = 9'h188;
    stim[12] = 9'h018;
    stim[13] = 9'h1a8;
    stim[14] = 9'h11d;
    stim[15] = 9'h06a;
    stim[16] = 9'h02c;
    stim[17] = 9'h104;
    stim[18] = 9'h03b;
    stim[19] = 9'h0e0;
    stim[20] = 9'h07d;
    stim[21] = 9'h011;
    stim[22] = 9'h14a;
    stim[23] = 9'h055;
    stim[24] = 9'h1c1;
    stim[25] = 9'h019;
    stim[26] = 9'h163;
    stim[27] = 9'h105;
    stim[28] = 9'h0be;
    stim[29] = 9'h006;
    stim[30] = 9'h1af;
    stim[31] = 9'h1b9;
    stim[32] = 9'h0dd;
    stim[33] = 9'h097;
    stim[34] = 9'h057;
    stim[35] = 9'h1f3;
    stim[36] = 9'h129;
    stim[37] = 9'h169;
    stim[38] = 9'h17f;
    stim[39] = 9'h060;
    stim[40] = 9'h016;
    stim[41] = 9'h099;
    stim[42] = 9'h179;
    stim[43] = 9'h1bc;
    stim[44] = 9'h139;
    stim[45] = 9'h189;
    stim[46] = 9'h0d3;
    stim[47] = 9'h058;
    stim[48] = 9'h19d;
    stim[49] = 9'h0c3;
    stim[50] = 9'h137;
    stim[51] = 9'h0ad;
    stim[52] = 9'h085;
    stim[53] = 9'h1ae;
    stim[54] = 9'h1bc;
    stim[55] = 9'h1df;
    stim[56] = 9'h156;
    stim[57] = 9'h1c2;
    stim[58] = 9'h108;
    stim[59] = 9'h17f;
    stim[60] = 9'h040;
    stim[61] = 9'h1a4;
    stim[62] = 9'h087;
    stim[63] = 9'h0f3;
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
      expv[0] = 100'h0000000000000000000000000;
      expv[1] = 100'h0000000000000000000000000;
      expv[2] = 100'h0000000000000000000000000;
      expv[3] = 100'h0000000000000000000000000;
      expv[4] = 100'h0000000000000000000000000;
      expv[5] = 100'h0000000000000000000000000;
      expv[6] = 100'h0000000000000000000000000;
      expv[7] = 100'h0000000000000000000000000;
      expv[8] = 100'h0000000000000000000000000;
      expv[9] = 100'h0000000000000000000000000;
      expv[10] = 100'h0000000000000000000000000;
      expv[11] = 100'h0000000000000000000000000;
      expv[12] = 100'h0000000000000000000000000;
      expv[13] = 100'h0000000000000000000000000;
      expv[14] = 100'h0000000000000000000000000;
      expv[15] = 100'h0000000000000000000000000;
      expv[16] = 100'h0000000000000000000000000;
      expv[17] = 100'h0000000000000000000000000;
      expv[18] = 100'h0000000000000000000000000;
      expv[19] = 100'h0000000000000000000000000;
      expv[20] = 100'h0000000000000000000000000;
      expv[21] = 100'h0000000000000000000000000;
      expv[22] = 100'h0000000000000000000000000;
      expv[23] = 100'h0000000000000000000000000;
      expv[24] = 100'h0000000000000000000000000;
      expv[25] = 100'h0000000000000000000000000;
      expv[26] = 100'h0000000000000000000000000;
      expv[27] = 100'h0000000000000000000000000;
      expv[28] = 100'h0000000000000000000000000;
      expv[29] = 100'h0000000000000000000000000;
      expv[30] = 100'h0000000000000000000000000;
      expv[31] = 100'h0000000000000000000000000;
      expv[32] = 100'h0000000000000000000000000;
      expv[33] = 100'h0000000000000000000000000;
      expv[34] = 100'h0000000000000000000000000;
      expv[35] = 100'h0000000000000000000000000;
      expv[36] = 100'h0000000000000000000000000;
      expv[37] = 100'h0000000000000000000000000;
      expv[38] = 100'h0000000000000000000000000;
      expv[39] = 100'h0000000000000000000000000;
      expv[40] = 100'h0000000000000000000000000;
      expv[41] = 100'h0000000000000000000000000;
      expv[42] = 100'h0000000000000000000000000;
      expv[43] = 100'h0000000000000000000000000;
      expv[44] = 100'h0000000000000000000000000;
      expv[45] = 100'h0000000000000000000000000;
      expv[46] = 100'h0000000000000000000000000;
      expv[47] = 100'h0000000000000000000000000;
      expv[48] = 100'h0000000000000000000000000;
      expv[49] = 100'h0000000000000000000000000;
      expv[50] = 100'h0000000000000000000000000;
      expv[51] = 100'h0000000000000000000000000;
      expv[52] = 100'h0000000000000000000000000;
      expv[53] = 100'h0000000000000000000000000;
      expv[54] = 100'h0000000000000000000000000;
      expv[55] = 100'h0000000000000000000000000;
      expv[56] = 100'h0000000000000000000000000;
      expv[57] = 100'h0000000000000000000000000;
      expv[58] = 100'h0000000000000000000000000;
      expv[59] = 100'h0000000000000000000000000;
      expv[60] = 100'h0000000000000000000000000;
      expv[61] = 100'h0000000000000000000000000;
      expv[62] = 100'h0000000000000000000000000;
      expv[63] = 100'h0000000000000000000000000;
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
