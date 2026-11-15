// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02410 dut (
    .PixelClock(clk),
    .inRed(in_vec[23:16]),
    .inGreen(in_vec[15:8]),
    .inBlue(in_vec[7:0]),
    .outRed(out_vec[47:40]),
    .outGreen(out_vec[39:32]),
    .outBlue(out_vec[31:24]),
    .VertSynchOut(out_vec[23:23]),
    .HorSynchOut(out_vec[22:22]),
    .XPosition(out_vec[21:11]),
    .YPosition(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h4b6135;
    stim[1] = 24'ha93ceb;
    stim[2] = 24'hf079f7;
    stim[3] = 24'h1b27aa;
    stim[4] = 24'he487ae;
    stim[5] = 24'hb950c6;
    stim[6] = 24'h851af8;
    stim[7] = 24'h3b1f06;
    stim[8] = 24'he75471;
    stim[9] = 24'he1ff99;
    stim[10] = 24'h61a52c;
    stim[11] = 24'h689089;
    stim[12] = 24'h765a4d;
    stim[13] = 24'h1534d1;
    stim[14] = 24'h412338;
    stim[15] = 24'h68c95b;
    stim[16] = 24'h547eb6;
    stim[17] = 24'he0db0c;
    stim[18] = 24'h574108;
    stim[19] = 24'hd44b75;
    stim[20] = 24'hb7e28f;
    stim[21] = 24'h173791;
    stim[22] = 24'h4d877a;
    stim[23] = 24'h3afaf9;
    stim[24] = 24'h667955;
    stim[25] = 24'h64a19d;
    stim[26] = 24'hf98d49;
    stim[27] = 24'h87f7e7;
    stim[28] = 24'h69d501;
    stim[29] = 24'h6463fb;
    stim[30] = 24'h522f11;
    stim[31] = 24'h9817d9;
    stim[32] = 24'h770768;
    stim[33] = 24'h6cd492;
    stim[34] = 24'hf104b3;
    stim[35] = 24'h03f36b;
    stim[36] = 24'h8d05f8;
    stim[37] = 24'he57d80;
    stim[38] = 24'h6e7367;
    stim[39] = 24'hb3c6ea;
    stim[40] = 24'h504937;
    stim[41] = 24'h4c97b3;
    stim[42] = 24'hea5329;
    stim[43] = 24'h3c9ea4;
    stim[44] = 24'h6a6a8c;
    stim[45] = 24'h9fb241;
    stim[46] = 24'h615eee;
    stim[47] = 24'hace467;
    stim[48] = 24'h0b9230;
    stim[49] = 24'heede10;
    stim[50] = 24'h12faa8;
    stim[51] = 24'he65d8c;
    stim[52] = 24'h8f1219;
    stim[53] = 24'h125513;
    stim[54] = 24'he563ab;
    stim[55] = 24'h654042;
    stim[56] = 24'ha1f90e;
    stim[57] = 24'hd557b7;
    stim[58] = 24'h7a6068;
    stim[59] = 24'h14ac75;
    stim[60] = 24'h30d937;
    stim[61] = 24'h07c57b;
    stim[62] = 24'h7ae646;
    stim[63] = 24'h22a1bf;
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
      expv[0] = 48'h000000f4c7d7;
      expv[1] = 48'h00000034cfd7;
      expv[2] = 48'h00000034d7d7;
      expv[3] = 48'h00000034dfd7;
      expv[4] = 48'h00000034e7d7;
      expv[5] = 48'h00000034efd7;
      expv[6] = 48'h00000034f7d7;
      expv[7] = 48'h00000034ffd7;
      expv[8] = 48'h0000003507d7;
      expv[9] = 48'h000000350fd7;
      expv[10] = 48'h0000003517d7;
      expv[11] = 48'h000000351fd7;
      expv[12] = 48'h0000003527d7;
      expv[13] = 48'h000000352fd7;
      expv[14] = 48'h0000003537d7;
      expv[15] = 48'h000000353fd7;
      expv[16] = 48'h0000003547d7;
      expv[17] = 48'h000000354fd7;
      expv[18] = 48'h0000003557d7;
      expv[19] = 48'h000000355fd7;
      expv[20] = 48'h0000003567d7;
      expv[21] = 48'h000000356fd7;
      expv[22] = 48'h0000003577d7;
      expv[23] = 48'h000000357fd7;
      expv[24] = 48'h0000003587d7;
      expv[25] = 48'h000000358fd7;
      expv[26] = 48'h0000003597d7;
      expv[27] = 48'h000000359fd7;
      expv[28] = 48'h00000035a7d7;
      expv[29] = 48'h00000035afd7;
      expv[30] = 48'h00000035b7d7;
      expv[31] = 48'h00000035bfd7;
      expv[32] = 48'h00000035c7d7;
      expv[33] = 48'h00000035cfd7;
      expv[34] = 48'h00000035d7d7;
      expv[35] = 48'h00000035dfd7;
      expv[36] = 48'h00000035e7d7;
      expv[37] = 48'h00000035efd7;
      expv[38] = 48'h00000035f7d7;
      expv[39] = 48'h00000035ffd7;
      expv[40] = 48'h0000003607d7;
      expv[41] = 48'h000000360fd7;
      expv[42] = 48'h0000003617d7;
      expv[43] = 48'h000000361fd7;
      expv[44] = 48'h0000003627d7;
      expv[45] = 48'h000000362fd7;
      expv[46] = 48'h0000003637d7;
      expv[47] = 48'h000000363fd7;
      expv[48] = 48'h0000003647d7;
      expv[49] = 48'h000000364fd7;
      expv[50] = 48'h0000003657d7;
      expv[51] = 48'h000000365fd7;
      expv[52] = 48'h0000003667d7;
      expv[53] = 48'h000000366fd7;
      expv[54] = 48'h0000003677d7;
      expv[55] = 48'h000000367fd7;
      expv[56] = 48'h0000003687d7;
      expv[57] = 48'h000000368fd7;
      expv[58] = 48'h0000003697d7;
      expv[59] = 48'h000000369fd7;
      expv[60] = 48'h00000036a7d7;
      expv[61] = 48'h00000036afd7;
      expv[62] = 48'h00000036b7d7;
      expv[63] = 48'h00000036bfd7;
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
