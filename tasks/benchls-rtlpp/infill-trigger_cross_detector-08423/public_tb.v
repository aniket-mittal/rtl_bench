// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08423 dut (
    .clk(clk),
    .vc(in_vec[18:18]),
    .sc(in_vec[17:16]),
    .vctop(in_vec[15:15]),
    .sctop(in_vec[14:13]),
    .vcbot(in_vec[12:12]),
    .scbot(in_vec[11:10]),
    .va(in_vec[9:9]),
    .sa(in_vec[8:7]),
    .vatop(in_vec[6:6]),
    .satop(in_vec[5:4]),
    .vabot(in_vec[3:3]),
    .sabot(in_vec[2:1]),
    .trig_stop(in_vec[0:0]),
    .vcr(out_vec[1:1]),
    .varr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4c64b;
    stim[1] = 19'h26ace;
    stim[2] = 19'h7b417;
    stim[3] = 19'h37e94;
    stim[4] = 19'h616b2;
    stim[5] = 19'h30140;
    stim[6] = 19'h2bef6;
    stim[7] = 19'h0b2d6;
    stim[8] = 19'h2ad3d;
    stim[9] = 19'h39ba4;
    stim[10] = 19'h18f57;
    stim[11] = 19'h67090;
    stim[12] = 19'h23a21;
    stim[13] = 19'h21a5d;
    stim[14] = 19'h7dcf2;
    stim[15] = 19'h494f3;
    stim[16] = 19'h23960;
    stim[17] = 19'h6f70e;
    stim[18] = 19'h1f6c3;
    stim[19] = 19'h01a83;
    stim[20] = 19'h397c2;
    stim[21] = 19'h23752;
    stim[22] = 19'h44648;
    stim[23] = 19'h2c8b1;
    stim[24] = 19'h00e0e;
    stim[25] = 19'h4b241;
    stim[26] = 19'h752f8;
    stim[27] = 19'h5687c;
    stim[28] = 19'h22a63;
    stim[29] = 19'h4f0b1;
    stim[30] = 19'h085a2;
    stim[31] = 19'h1c543;
    stim[32] = 19'h02f2b;
    stim[33] = 19'h4da5d;
    stim[34] = 19'h54dd5;
    stim[35] = 19'h5ffbc;
    stim[36] = 19'h517a0;
    stim[37] = 19'h4caa5;
    stim[38] = 19'h51c25;
    stim[39] = 19'h1af80;
    stim[40] = 19'h2e9f6;
    stim[41] = 19'h28349;
    stim[42] = 19'h432a8;
    stim[43] = 19'h07bf7;
    stim[44] = 19'h18f16;
    stim[45] = 19'h43055;
    stim[46] = 19'h01a5a;
    stim[47] = 19'h7f7ae;
    stim[48] = 19'h09c64;
    stim[49] = 19'h0bc14;
    stim[50] = 19'h6477e;
    stim[51] = 19'h75257;
    stim[52] = 19'h4a844;
    stim[53] = 19'h00142;
    stim[54] = 19'h47def;
    stim[55] = 19'h20e4c;
    stim[56] = 19'h6f9d1;
    stim[57] = 19'h4b6f5;
    stim[58] = 19'h7d438;
    stim[59] = 19'h05aa4;
    stim[60] = 19'h02a13;
    stim[61] = 19'h4d94a;
    stim[62] = 19'h21cc4;
    stim[63] = 19'h36c86;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h2;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h2;
      expv[12] = 2'h1;
      expv[13] = 2'h0;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h2;
      expv[35] = 2'h1;
      expv[36] = 2'h3;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h3;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h1;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
