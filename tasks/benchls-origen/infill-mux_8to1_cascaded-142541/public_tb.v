// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142541 dut (
    .D(in_vec[14:7]),
    .S(in_vec[6:4]),
    .VPWR(in_vec[3:3]),
    .VGND(in_vec[2:2]),
    .VPB(in_vec[1:1]),
    .VNB(in_vec[0:0]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h1d86;
    stim[1] = 15'h781a;
    stim[2] = 15'h76fe;
    stim[3] = 15'h0e0f;
    stim[4] = 15'h74ad;
    stim[5] = 15'h5844;
    stim[6] = 15'h1c45;
    stim[7] = 15'h25a0;
    stim[8] = 15'h070e;
    stim[9] = 15'h4ce5;
    stim[10] = 15'h7890;
    stim[11] = 15'h1aec;
    stim[12] = 15'h6a5d;
    stim[13] = 15'h049c;
    stim[14] = 15'h0ac2;
    stim[15] = 15'h54f2;
    stim[16] = 15'h7cf6;
    stim[17] = 15'h234b;
    stim[18] = 15'h2af5;
    stim[19] = 15'h7d44;
    stim[20] = 15'h76bd;
    stim[21] = 15'h003a;
    stim[22] = 15'h074d;
    stim[23] = 15'h4919;
    stim[24] = 15'h6376;
    stim[25] = 15'h1f62;
    stim[26] = 15'h70d9;
    stim[27] = 15'h01c6;
    stim[28] = 15'h3eb7;
    stim[29] = 15'h29a7;
    stim[30] = 15'h1370;
    stim[31] = 15'h192b;
    stim[32] = 15'h33dc;
    stim[33] = 15'h77f1;
    stim[34] = 15'h45b7;
    stim[35] = 15'h7c9b;
    stim[36] = 15'h74af;
    stim[37] = 15'h6f19;
    stim[38] = 15'h4ac5;
    stim[39] = 15'h54fc;
    stim[40] = 15'h2094;
    stim[41] = 15'h2601;
    stim[42] = 15'h7c5a;
    stim[43] = 15'h5b2a;
    stim[44] = 15'h5145;
    stim[45] = 15'h44b9;
    stim[46] = 15'h37c5;
    stim[47] = 15'h0068;
    stim[48] = 15'h7f38;
    stim[49] = 15'h2c48;
    stim[50] = 15'h377b;
    stim[51] = 15'h14e0;
    stim[52] = 15'h6877;
    stim[53] = 15'h64e3;
    stim[54] = 15'h3d0a;
    stim[55] = 15'h7b46;
    stim[56] = 15'h5c2d;
    stim[57] = 15'h2310;
    stim[58] = 15'h38b6;
    stim[59] = 15'h6532;
    stim[60] = 15'h414d;
    stim[61] = 15'h4ded;
    stim[62] = 15'h4f4e;
    stim[63] = 15'h7226;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
