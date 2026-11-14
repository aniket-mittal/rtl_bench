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

  dut dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h124ab;
    stim[1] = 17'h0a257;
    stim[2] = 17'h1ea54;
    stim[3] = 17'h0e8e5;
    stim[4] = 17'h1d70f;
    stim[5] = 17'h03ec6;
    stim[6] = 17'h0eb30;
    stim[7] = 17'h1753e;
    stim[8] = 17'h054ba;
    stim[9] = 17'h16895;
    stim[10] = 17'h1f25d;
    stim[11] = 17'h1ae80;
    stim[12] = 17'h13d9b;
    stim[13] = 17'h09710;
    stim[14] = 17'h078ea;
    stim[15] = 17'h197b3;
    stim[16] = 17'h18035;
    stim[17] = 17'h1fca3;
    stim[18] = 17'h0b532;
    stim[19] = 17'h19bcf;
    stim[20] = 17'h01808;
    stim[21] = 17'h03aa1;
    stim[22] = 17'h03bab;
    stim[23] = 17'h0ccec;
    stim[24] = 17'h0ff78;
    stim[25] = 17'h0623f;
    stim[26] = 17'h16526;
    stim[27] = 17'h12008;
    stim[28] = 17'h1df39;
    stim[29] = 17'h1b334;
    stim[30] = 17'h07e5b;
    stim[31] = 17'h09390;
    stim[32] = 17'h02212;
    stim[33] = 17'h1b85e;
    stim[34] = 17'h0fa39;
    stim[35] = 17'h017d2;
    stim[36] = 17'h139af;
    stim[37] = 17'h13241;
    stim[38] = 17'h07dd2;
    stim[39] = 17'h1435f;
    stim[40] = 17'h1ae75;
    stim[41] = 17'h14601;
    stim[42] = 17'h1b626;
    stim[43] = 17'h05a15;
    stim[44] = 17'h1dcef;
    stim[45] = 17'h1b8ea;
    stim[46] = 17'h130a3;
    stim[47] = 17'h0727a;
    stim[48] = 17'h1f8de;
    stim[49] = 17'h1530a;
    stim[50] = 17'h16600;
    stim[51] = 17'h1a7fb;
    stim[52] = 17'h0d23b;
    stim[53] = 17'h1054b;
    stim[54] = 17'h1bf87;
    stim[55] = 17'h08329;
    stim[56] = 17'h1e3c3;
    stim[57] = 17'h018ac;
    stim[58] = 17'h119d4;
    stim[59] = 17'h0f19c;
    stim[60] = 17'h0e0db;
    stim[61] = 17'h17cdb;
    stim[62] = 17'h0b520;
    stim[63] = 17'h08af1;
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
      expv[0] = 8'h24;
      expv[1] = 8'h00;
      expv[2] = 8'hea;
      expv[3] = 8'h00;
      expv[4] = 8'hd7;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h75;
      expv[8] = 8'h00;
      expv[9] = 8'h68;
      expv[10] = 8'hf2;
      expv[11] = 8'hae;
      expv[12] = 8'h3d;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h97;
      expv[16] = 8'h80;
      expv[17] = 8'hfc;
      expv[18] = 8'h00;
      expv[19] = 8'h9b;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h65;
      expv[27] = 8'h20;
      expv[28] = 8'hdf;
      expv[29] = 8'hb3;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'hb8;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h39;
      expv[37] = 8'h32;
      expv[38] = 8'h00;
      expv[39] = 8'h43;
      expv[40] = 8'hae;
      expv[41] = 8'h46;
      expv[42] = 8'hb6;
      expv[43] = 8'h00;
      expv[44] = 8'hdc;
      expv[45] = 8'hb8;
      expv[46] = 8'h30;
      expv[47] = 8'h00;
      expv[48] = 8'hf8;
      expv[49] = 8'h53;
      expv[50] = 8'h66;
      expv[51] = 8'ha7;
      expv[52] = 8'h00;
      expv[53] = 8'h05;
      expv[54] = 8'hbf;
      expv[55] = 8'h00;
      expv[56] = 8'he3;
      expv[57] = 8'h00;
      expv[58] = 8'h19;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h7c;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
