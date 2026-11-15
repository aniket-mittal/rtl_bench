// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  FP32_MUL_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h03f;
    stim[1] = 10'h00b;
    stim[2] = 10'h22a;
    stim[3] = 10'h16f;
    stim[4] = 10'h291;
    stim[5] = 10'h1f9;
    stim[6] = 10'h112;
    stim[7] = 10'h1dc;
    stim[8] = 10'h055;
    stim[9] = 10'h28c;
    stim[10] = 10'h2e4;
    stim[11] = 10'h05b;
    stim[12] = 10'h2fe;
    stim[13] = 10'h183;
    stim[14] = 10'h1c1;
    stim[15] = 10'h0c2;
    stim[16] = 10'h0ca;
    stim[17] = 10'h10d;
    stim[18] = 10'h3c3;
    stim[19] = 10'h15e;
    stim[20] = 10'h388;
    stim[21] = 10'h2d2;
    stim[22] = 10'h2cf;
    stim[23] = 10'h2eb;
    stim[24] = 10'h25b;
    stim[25] = 10'h106;
    stim[26] = 10'h367;
    stim[27] = 10'h213;
    stim[28] = 10'h1bd;
    stim[29] = 10'h36c;
    stim[30] = 10'h2bf;
    stim[31] = 10'h35c;
    stim[32] = 10'h2b5;
    stim[33] = 10'h1cb;
    stim[34] = 10'h0ec;
    stim[35] = 10'h3c0;
    stim[36] = 10'h269;
    stim[37] = 10'h165;
    stim[38] = 10'h25a;
    stim[39] = 10'h2ed;
    stim[40] = 10'h2af;
    stim[41] = 10'h28f;
    stim[42] = 10'h34e;
    stim[43] = 10'h04c;
    stim[44] = 10'h3b9;
    stim[45] = 10'h028;
    stim[46] = 10'h3b3;
    stim[47] = 10'h2d5;
    stim[48] = 10'h2cf;
    stim[49] = 10'h1a1;
    stim[50] = 10'h38a;
    stim[51] = 10'h04e;
    stim[52] = 10'h33b;
    stim[53] = 10'h28d;
    stim[54] = 10'h3ac;
    stim[55] = 10'h059;
    stim[56] = 10'h298;
    stim[57] = 10'h2dc;
    stim[58] = 10'h1b5;
    stim[59] = 10'h36e;
    stim[60] = 10'h3d9;
    stim[61] = 10'h271;
    stim[62] = 10'h1c3;
    stim[63] = 10'h20b;
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
      expv[0] = 10'h07e;
      expv[1] = 10'h016;
      expv[2] = 10'h055;
      expv[3] = 10'h2de;
      expv[4] = 10'h123;
      expv[5] = 10'h3f2;
      expv[6] = 10'h224;
      expv[7] = 10'h3b8;
      expv[8] = 10'h0aa;
      expv[9] = 10'h119;
      expv[10] = 10'h1c9;
      expv[11] = 10'h0b6;
      expv[12] = 10'h1fd;
      expv[13] = 10'h306;
      expv[14] = 10'h382;
      expv[15] = 10'h184;
      expv[16] = 10'h194;
      expv[17] = 10'h21a;
      expv[18] = 10'h387;
      expv[19] = 10'h2bc;
      expv[20] = 10'h311;
      expv[21] = 10'h1a5;
      expv[22] = 10'h19f;
      expv[23] = 10'h1d7;
      expv[24] = 10'h0b7;
      expv[25] = 10'h20c;
      expv[26] = 10'h2cf;
      expv[27] = 10'h027;
      expv[28] = 10'h37a;
      expv[29] = 10'h2d9;
      expv[30] = 10'h17f;
      expv[31] = 10'h2b9;
      expv[32] = 10'h16b;
      expv[33] = 10'h396;
      expv[34] = 10'h1d8;
      expv[35] = 10'h381;
      expv[36] = 10'h0d3;
      expv[37] = 10'h2ca;
      expv[38] = 10'h0b5;
      expv[39] = 10'h1db;
      expv[40] = 10'h15f;
      expv[41] = 10'h11f;
      expv[42] = 10'h29d;
      expv[43] = 10'h098;
      expv[44] = 10'h373;
      expv[45] = 10'h050;
      expv[46] = 10'h367;
      expv[47] = 10'h1ab;
      expv[48] = 10'h19f;
      expv[49] = 10'h342;
      expv[50] = 10'h315;
      expv[51] = 10'h09c;
      expv[52] = 10'h277;
      expv[53] = 10'h11b;
      expv[54] = 10'h359;
      expv[55] = 10'h0b2;
      expv[56] = 10'h131;
      expv[57] = 10'h1b9;
      expv[58] = 10'h36a;
      expv[59] = 10'h2dd;
      expv[60] = 10'h3b3;
      expv[61] = 10'h0e3;
      expv[62] = 10'h386;
      expv[63] = 10'h017;
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
