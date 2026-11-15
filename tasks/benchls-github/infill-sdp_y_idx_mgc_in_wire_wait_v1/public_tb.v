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

  SDP_Y_IDX_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h29e;
    stim[1] = 10'h12c;
    stim[2] = 10'h36d;
    stim[3] = 10'h2bb;
    stim[4] = 10'h027;
    stim[5] = 10'h1e3;
    stim[6] = 10'h2b4;
    stim[7] = 10'h202;
    stim[8] = 10'h0b8;
    stim[9] = 10'h003;
    stim[10] = 10'h3bc;
    stim[11] = 10'h1d8;
    stim[12] = 10'h092;
    stim[13] = 10'h13e;
    stim[14] = 10'h37f;
    stim[15] = 10'h39f;
    stim[16] = 10'h232;
    stim[17] = 10'h0d9;
    stim[18] = 10'h319;
    stim[19] = 10'h159;
    stim[20] = 10'h064;
    stim[21] = 10'h11a;
    stim[22] = 10'h188;
    stim[23] = 10'h1c8;
    stim[24] = 10'h126;
    stim[25] = 10'h165;
    stim[26] = 10'h1db;
    stim[27] = 10'h013;
    stim[28] = 10'h3f3;
    stim[29] = 10'h147;
    stim[30] = 10'h20e;
    stim[31] = 10'h1bd;
    stim[32] = 10'h2c8;
    stim[33] = 10'h1f4;
    stim[34] = 10'h0a4;
    stim[35] = 10'h012;
    stim[36] = 10'h0f1;
    stim[37] = 10'h206;
    stim[38] = 10'h066;
    stim[39] = 10'h050;
    stim[40] = 10'h09d;
    stim[41] = 10'h086;
    stim[42] = 10'h09e;
    stim[43] = 10'h35d;
    stim[44] = 10'h23b;
    stim[45] = 10'h28a;
    stim[46] = 10'h146;
    stim[47] = 10'h32e;
    stim[48] = 10'h0f6;
    stim[49] = 10'h1cf;
    stim[50] = 10'h221;
    stim[51] = 10'h336;
    stim[52] = 10'h1cc;
    stim[53] = 10'h1b1;
    stim[54] = 10'h300;
    stim[55] = 10'h362;
    stim[56] = 10'h336;
    stim[57] = 10'h265;
    stim[58] = 10'h1a9;
    stim[59] = 10'h14f;
    stim[60] = 10'h0a6;
    stim[61] = 10'h19d;
    stim[62] = 10'h0cf;
    stim[63] = 10'h12a;
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
      expv[0] = 10'h13d;
      expv[1] = 10'h258;
      expv[2] = 10'h2db;
      expv[3] = 10'h177;
      expv[4] = 10'h04e;
      expv[5] = 10'h3c6;
      expv[6] = 10'h169;
      expv[7] = 10'h005;
      expv[8] = 10'h170;
      expv[9] = 10'h006;
      expv[10] = 10'h379;
      expv[11] = 10'h3b0;
      expv[12] = 10'h124;
      expv[13] = 10'h27c;
      expv[14] = 10'h2ff;
      expv[15] = 10'h33f;
      expv[16] = 10'h065;
      expv[17] = 10'h1b2;
      expv[18] = 10'h233;
      expv[19] = 10'h2b2;
      expv[20] = 10'h0c8;
      expv[21] = 10'h234;
      expv[22] = 10'h310;
      expv[23] = 10'h390;
      expv[24] = 10'h24c;
      expv[25] = 10'h2ca;
      expv[26] = 10'h3b6;
      expv[27] = 10'h026;
      expv[28] = 10'h3e7;
      expv[29] = 10'h28e;
      expv[30] = 10'h01d;
      expv[31] = 10'h37a;
      expv[32] = 10'h191;
      expv[33] = 10'h3e8;
      expv[34] = 10'h148;
      expv[35] = 10'h024;
      expv[36] = 10'h1e2;
      expv[37] = 10'h00d;
      expv[38] = 10'h0cc;
      expv[39] = 10'h0a0;
      expv[40] = 10'h13a;
      expv[41] = 10'h10c;
      expv[42] = 10'h13c;
      expv[43] = 10'h2bb;
      expv[44] = 10'h077;
      expv[45] = 10'h115;
      expv[46] = 10'h28c;
      expv[47] = 10'h25d;
      expv[48] = 10'h1ec;
      expv[49] = 10'h39e;
      expv[50] = 10'h043;
      expv[51] = 10'h26d;
      expv[52] = 10'h398;
      expv[53] = 10'h362;
      expv[54] = 10'h201;
      expv[55] = 10'h2c5;
      expv[56] = 10'h26d;
      expv[57] = 10'h0cb;
      expv[58] = 10'h352;
      expv[59] = 10'h29e;
      expv[60] = 10'h14c;
      expv[61] = 10'h33a;
      expv[62] = 10'h19e;
      expv[63] = 10'h254;
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
