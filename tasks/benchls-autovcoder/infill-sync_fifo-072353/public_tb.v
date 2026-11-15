// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072353 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9ce;
    stim[1] = 12'hdfb;
    stim[2] = 12'h798;
    stim[3] = 12'h29e;
    stim[4] = 12'h494;
    stim[5] = 12'h593;
    stim[6] = 12'h626;
    stim[7] = 12'h370;
    stim[8] = 12'h10e;
    stim[9] = 12'h0c2;
    stim[10] = 12'h101;
    stim[11] = 12'h710;
    stim[12] = 12'h6db;
    stim[13] = 12'h204;
    stim[14] = 12'h530;
    stim[15] = 12'h3a7;
    stim[16] = 12'h774;
    stim[17] = 12'h30e;
    stim[18] = 12'h761;
    stim[19] = 12'h256;
    stim[20] = 12'h22a;
    stim[21] = 12'h336;
    stim[22] = 12'h1d3;
    stim[23] = 12'h493;
    stim[24] = 12'h464;
    stim[25] = 12'h460;
    stim[26] = 12'h311;
    stim[27] = 12'h5a7;
    stim[28] = 12'h253;
    stim[29] = 12'h78b;
    stim[30] = 12'h390;
    stim[31] = 12'h19f;
    stim[32] = 12'h404;
    stim[33] = 12'h7c7;
    stim[34] = 12'h0c5;
    stim[35] = 12'h4b7;
    stim[36] = 12'h36c;
    stim[37] = 12'h52b;
    stim[38] = 12'h00f;
    stim[39] = 12'h568;
    stim[40] = 12'h19a;
    stim[41] = 12'h371;
    stim[42] = 12'h7cf;
    stim[43] = 12'h07d;
    stim[44] = 12'h32d;
    stim[45] = 12'h645;
    stim[46] = 12'h6ef;
    stim[47] = 12'h108;
    stim[48] = 12'h0a3;
    stim[49] = 12'h696;
    stim[50] = 12'h32b;
    stim[51] = 12'h367;
    stim[52] = 12'h1f1;
    stim[53] = 12'h5a4;
    stim[54] = 12'h1ed;
    stim[55] = 12'h20b;
    stim[56] = 12'h0ed;
    stim[57] = 12'h1f9;
    stim[58] = 12'h588;
    stim[59] = 12'h24a;
    stim[60] = 12'hb14;
    stim[61] = 12'h47d;
    stim[62] = 12'h6ef;
    stim[63] = 12'h048;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1fb;
      expv[4] = 10'h1fb;
      expv[5] = 10'h398;
      expv[6] = 10'h398;
      expv[7] = 10'h393;
      expv[8] = 10'h393;
      expv[9] = 10'h393;
      expv[10] = 10'h393;
      expv[11] = 10'h393;
      expv[12] = 10'h193;
      expv[13] = 10'h310;
      expv[14] = 10'h310;
      expv[15] = 10'h310;
      expv[16] = 10'h310;
      expv[17] = 10'h330;
      expv[18] = 10'h330;
      expv[19] = 10'h374;
      expv[20] = 10'h374;
      expv[21] = 10'h374;
      expv[22] = 10'h374;
      expv[23] = 10'h374;
      expv[24] = 10'h374;
      expv[25] = 10'h374;
      expv[26] = 10'h374;
      expv[27] = 10'h374;
      expv[28] = 10'h374;
      expv[29] = 10'h374;
      expv[30] = 10'h361;
      expv[31] = 10'h361;
      expv[32] = 10'h361;
      expv[33] = 10'h361;
      expv[34] = 10'h3a7;
      expv[35] = 10'h3a7;
      expv[36] = 10'h3a7;
      expv[37] = 10'h3a7;
      expv[38] = 10'h3a7;
      expv[39] = 10'h3a7;
      expv[40] = 10'h3a7;
      expv[41] = 10'h3a7;
      expv[42] = 10'h3a7;
      expv[43] = 10'h38b;
      expv[44] = 10'h38b;
      expv[45] = 10'h38b;
      expv[46] = 10'h3c7;
      expv[47] = 10'h32b;
      expv[48] = 10'h32b;
      expv[49] = 10'h32b;
      expv[50] = 10'h368;
      expv[51] = 10'h368;
      expv[52] = 10'h368;
      expv[53] = 10'h368;
      expv[54] = 10'h368;
      expv[55] = 10'h368;
      expv[56] = 10'h368;
      expv[57] = 10'h368;
      expv[58] = 10'h368;
      expv[59] = 10'h368;
      expv[60] = 10'h368;
      expv[61] = 10'h100;
      expv[62] = 10'h188;
      expv[63] = 10'h188;
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
