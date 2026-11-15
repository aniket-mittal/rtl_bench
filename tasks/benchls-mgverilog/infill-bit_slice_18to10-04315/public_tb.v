// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04315 dut (
    .Din(in_vec[17:0]),
    .Dout(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h19c44;
    stim[1] = 18'h21315;
    stim[2] = 18'h23255;
    stim[3] = 18'h35288;
    stim[4] = 18'h2894f;
    stim[5] = 18'h23815;
    stim[6] = 18'h216ac;
    stim[7] = 18'h3dbd2;
    stim[8] = 18'h180e5;
    stim[9] = 18'h0261f;
    stim[10] = 18'h294b8;
    stim[11] = 18'h3e5d8;
    stim[12] = 18'h05597;
    stim[13] = 18'h2205a;
    stim[14] = 18'h2938a;
    stim[15] = 18'h36370;
    stim[16] = 18'h1b5c6;
    stim[17] = 18'h2b29f;
    stim[18] = 18'h39a1e;
    stim[19] = 18'h39b38;
    stim[20] = 18'h01d82;
    stim[21] = 18'h19cee;
    stim[22] = 18'h17809;
    stim[23] = 18'h0cc6f;
    stim[24] = 18'h3caec;
    stim[25] = 18'h339ab;
    stim[26] = 18'h2792e;
    stim[27] = 18'h194a1;
    stim[28] = 18'h1f57f;
    stim[29] = 18'h34545;
    stim[30] = 18'h0a932;
    stim[31] = 18'h150ff;
    stim[32] = 18'h1766f;
    stim[33] = 18'h05675;
    stim[34] = 18'h3ae04;
    stim[35] = 18'h2cbe0;
    stim[36] = 18'h3b000;
    stim[37] = 18'h2faea;
    stim[38] = 18'h2a35a;
    stim[39] = 18'h05775;
    stim[40] = 18'h09897;
    stim[41] = 18'h2cfa1;
    stim[42] = 18'h0f631;
    stim[43] = 18'h3e021;
    stim[44] = 18'h36ffd;
    stim[45] = 18'h33dda;
    stim[46] = 18'h25d98;
    stim[47] = 18'h00892;
    stim[48] = 18'h27456;
    stim[49] = 18'h36719;
    stim[50] = 18'h3640c;
    stim[51] = 18'h1556a;
    stim[52] = 18'h07e38;
    stim[53] = 18'h3534c;
    stim[54] = 18'h0154d;
    stim[55] = 18'h3ba1f;
    stim[56] = 18'h2243a;
    stim[57] = 18'h37ae5;
    stim[58] = 18'h059a9;
    stim[59] = 18'h0b589;
    stim[60] = 18'h18b85;
    stim[61] = 18'h1e5af;
    stim[62] = 18'h38769;
    stim[63] = 18'h06d90;
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
      expv[0] = 10'h388;
      expv[1] = 10'h262;
      expv[2] = 10'h24a;
      expv[3] = 10'h251;
      expv[4] = 10'h129;
      expv[5] = 10'h302;
      expv[6] = 10'h2d5;
      expv[7] = 10'h37a;
      expv[8] = 10'h01c;
      expv[9] = 10'h0c3;
      expv[10] = 10'h297;
      expv[11] = 10'h0bb;
      expv[12] = 10'h2b2;
      expv[13] = 10'h00b;
      expv[14] = 10'h271;
      expv[15] = 10'h06e;
      expv[16] = 10'h2b8;
      expv[17] = 10'h253;
      expv[18] = 10'h343;
      expv[19] = 10'h367;
      expv[20] = 10'h3b0;
      expv[21] = 10'h39d;
      expv[22] = 10'h301;
      expv[23] = 10'h18d;
      expv[24] = 10'h15d;
      expv[25] = 10'h335;
      expv[26] = 10'h325;
      expv[27] = 10'h294;
      expv[28] = 10'h2af;
      expv[29] = 10'h0a8;
      expv[30] = 10'h126;
      expv[31] = 10'h21f;
      expv[32] = 10'h2cd;
      expv[33] = 10'h2ce;
      expv[34] = 10'h1c0;
      expv[35] = 10'h17c;
      expv[36] = 10'h200;
      expv[37] = 10'h35d;
      expv[38] = 10'h06b;
      expv[39] = 10'h2ee;
      expv[40] = 10'h312;
      expv[41] = 10'h1f4;
      expv[42] = 10'h2c6;
      expv[43] = 10'h004;
      expv[44] = 10'h1ff;
      expv[45] = 10'h3bb;
      expv[46] = 10'h3b3;
      expv[47] = 10'h112;
      expv[48] = 10'h28a;
      expv[49] = 10'h0e3;
      expv[50] = 10'h081;
      expv[51] = 10'h2ad;
      expv[52] = 10'h3c7;
      expv[53] = 10'h269;
      expv[54] = 10'h2a9;
      expv[55] = 10'h343;
      expv[56] = 10'h087;
      expv[57] = 10'h35c;
      expv[58] = 10'h335;
      expv[59] = 10'h2b1;
      expv[60] = 10'h170;
      expv[61] = 10'h0b5;
      expv[62] = 10'h0ed;
      expv[63] = 10'h1b2;
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
