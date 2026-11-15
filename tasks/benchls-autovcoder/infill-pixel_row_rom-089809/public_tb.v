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

  autovcoder_089809 dut (
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
    stim[0] = 9'h07f;
    stim[1] = 9'h131;
    stim[2] = 9'h04f;
    stim[3] = 9'h15a;
    stim[4] = 9'h107;
    stim[5] = 9'h07f;
    stim[6] = 9'h02c;
    stim[7] = 9'h106;
    stim[8] = 9'h047;
    stim[9] = 9'h11c;
    stim[10] = 9'h17d;
    stim[11] = 9'h07b;
    stim[12] = 9'h1de;
    stim[13] = 9'h1ae;
    stim[14] = 9'h17d;
    stim[15] = 9'h1ee;
    stim[16] = 9'h0f6;
    stim[17] = 9'h109;
    stim[18] = 9'h181;
    stim[19] = 9'h03c;
    stim[20] = 9'h023;
    stim[21] = 9'h19d;
    stim[22] = 9'h1b6;
    stim[23] = 9'h13c;
    stim[24] = 9'h106;
    stim[25] = 9'h067;
    stim[26] = 9'h194;
    stim[27] = 9'h1a2;
    stim[28] = 9'h14f;
    stim[29] = 9'h109;
    stim[30] = 9'h196;
    stim[31] = 9'h07d;
    stim[32] = 9'h1c1;
    stim[33] = 9'h1f6;
    stim[34] = 9'h171;
    stim[35] = 9'h1ea;
    stim[36] = 9'h0e4;
    stim[37] = 9'h1eb;
    stim[38] = 9'h112;
    stim[39] = 9'h03e;
    stim[40] = 9'h15d;
    stim[41] = 9'h0b4;
    stim[42] = 9'h034;
    stim[43] = 9'h0c1;
    stim[44] = 9'h1ba;
    stim[45] = 9'h090;
    stim[46] = 9'h13c;
    stim[47] = 9'h153;
    stim[48] = 9'h163;
    stim[49] = 9'h0f7;
    stim[50] = 9'h081;
    stim[51] = 9'h0df;
    stim[52] = 9'h020;
    stim[53] = 9'h040;
    stim[54] = 9'h04a;
    stim[55] = 9'h02d;
    stim[56] = 9'h03e;
    stim[57] = 9'h0a9;
    stim[58] = 9'h1c6;
    stim[59] = 9'h129;
    stim[60] = 9'h0ca;
    stim[61] = 9'h194;
    stim[62] = 9'h1fa;
    stim[63] = 9'h08e;
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
      expv[0] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[1] = 100'ha9c21a9c449084498e4298c65;
      expv[2] = 100'ha9e86a9c887f88887dfe87ca9;
      expv[3] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[4] = 100'ha9c21a9d983b99843cee43db9;
      expv[5] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[6] = 100'h000210010f6e50f661b9660ee;
      expv[7] = 100'ha9c21a9ddb3b5db330ed331ba;
      expv[8] = 100'ha9e86a9d983b99843cee43db9;
      expv[9] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[10] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[12] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 100'hxxxxxxxxcb7f4cb771fd770aa;
      expv[14] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 100'hxxxxxxxxcb7f4cb771fd770aa;
      expv[16] = 100'ha9e86a9xxxxxxxxxxxxxxxxxx;
      expv[17] = 100'ha9c21a9d544c95454d3254d75;
      expv[18] = 100'hxxxxxxxx6408a6410c2210e85;
      expv[19] = 100'h0002100xxxxxxxxxxxxxxxxxx;
      expv[20] = 100'h000210022019a2021c6621e41;
      expv[21] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[24] = 100'ha9c21a9ddb3b5db330ed331ba;
      expv[25] = 100'ha9c21a9d983b99843cee43db9;
      expv[26] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 100'hxxxxxxxx63196631106511242;
      expv[28] = 100'ha9c21a9c887f88887dfe87ca9;
      expv[29] = 100'ha9c21a9d544c95454d3254d75;
      expv[30] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[32] = 100'hxxxxxxxx6408a6410c2210e85;
      expv[33] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 100'hxxxxxxxx449084498e4298c65;
      expv[35] = 100'hxxxxxxxx535d5535517555132;
      expv[36] = 100'ha9e86a9e1f2a61f220a9221fe;
      expv[37] = 100'hxxxxxxxx105d91065d7665d31;
      expv[38] = 100'ha9c21a9c43a14439928599022;
      expv[39] = 100'h0002100xxxxxxxxxxxxxxxxxx;
      expv[40] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[41] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[42] = 100'h0002100xxxxxxxxxxxxxxxxxx;
      expv[43] = 100'h000210026408a6410c2210e85;
      expv[44] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 100'ha9c21a9c87904878824188066;
      expv[46] = 100'ha9c21a9xxxxxxxxxxxxxxxxxx;
      expv[47] = 100'ha9c21a9c00a1800a9e86a9c21;
      expv[48] = 100'hxxxxxxxx2019a2021c6621e41;
      expv[49] = 100'ha9e86a9xxxxxxxxxxxxxxxxxx;
      expv[50] = 100'ha9c21a9e6408a6410c2210e85;
      expv[51] = 100'h0002100xxxxxxxxxxxxxxxxxx;
      expv[52] = 100'h00021002a7086a70002100286;
      expv[53] = 100'ha9e86a9ea7086a70002100286;
      expv[54] = 100'ha9e86a9d535d5535517555132;
      expv[55] = 100'h00021000cc6e8cc76dba76ced;
      expv[56] = 100'h0002100xxxxxxxxxxxxxxxxxx;
      expv[57] = 100'ha9c21a9d544c95454d3254d75;
      expv[58] = 100'hxxxxxxxxdb3b5db330ed331ba;
      expv[59] = 100'ha9c21a9d544c95454d3254d75;
      expv[60] = 100'h00021001535d5535517555132;
      expv[61] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 100'ha9c21a9ccb7f4cb771fd770aa;
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
