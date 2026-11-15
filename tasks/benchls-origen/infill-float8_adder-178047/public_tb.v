// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178047 dut (
    .f1(in_vec[15:8]),
    .f2(in_vec[7:0]),
    .fout(out_vec[9:2]),
    .overflow(out_vec[1:1]),
    .underflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hd38d;
    stim[1] = 16'hb99c;
    stim[2] = 16'h9c69;
    stim[3] = 16'hcf82;
    stim[4] = 16'hfc0b;
    stim[5] = 16'h809b;
    stim[6] = 16'h6f6c;
    stim[7] = 16'hcafd;
    stim[8] = 16'h2654;
    stim[9] = 16'hbca5;
    stim[10] = 16'h8283;
    stim[11] = 16'h2dd0;
    stim[12] = 16'h267d;
    stim[13] = 16'h437b;
    stim[14] = 16'h6a1c;
    stim[15] = 16'hc313;
    stim[16] = 16'h3886;
    stim[17] = 16'h11e9;
    stim[18] = 16'h32bf;
    stim[19] = 16'hf402;
    stim[20] = 16'hada3;
    stim[21] = 16'he75e;
    stim[22] = 16'hb7e2;
    stim[23] = 16'h0de2;
    stim[24] = 16'he1e0;
    stim[25] = 16'h2db3;
    stim[26] = 16'h289d;
    stim[27] = 16'h5d2a;
    stim[28] = 16'hd954;
    stim[29] = 16'h07dd;
    stim[30] = 16'hea9d;
    stim[31] = 16'ha311;
    stim[32] = 16'h9844;
    stim[33] = 16'hf71e;
    stim[34] = 16'he357;
    stim[35] = 16'h4351;
    stim[36] = 16'h1e3f;
    stim[37] = 16'hab19;
    stim[38] = 16'hf276;
    stim[39] = 16'h3f55;
    stim[40] = 16'hb454;
    stim[41] = 16'hbc51;
    stim[42] = 16'hc9c8;
    stim[43] = 16'h2cdf;
    stim[44] = 16'h10a4;
    stim[45] = 16'h553d;
    stim[46] = 16'ha192;
    stim[47] = 16'h6547;
    stim[48] = 16'h3c09;
    stim[49] = 16'h06fa;
    stim[50] = 16'h781c;
    stim[51] = 16'h4161;
    stim[52] = 16'hc393;
    stim[53] = 16'h9b19;
    stim[54] = 16'h4b1e;
    stim[55] = 16'hc294;
    stim[56] = 16'h7217;
    stim[57] = 16'h436c;
    stim[58] = 16'h59fc;
    stim[59] = 16'hffcc;
    stim[60] = 16'h6914;
    stim[61] = 16'h6f56;
    stim[62] = 16'he29f;
    stim[63] = 16'h095f;
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
      expv[0] = 10'h180;
      expv[1] = 10'h154;
      expv[2] = 10'h014;
      expv[3] = 10'h144;
      expv[4] = 10'h01c;
      expv[5] = 10'h06c;
      expv[6] = 10'h36c;
      expv[7] = 10'h31c;
      expv[8] = 10'h1e8;
      expv[9] = 10'h184;
      expv[10] = 10'h014;
      expv[11] = 10'h3f4;
      expv[12] = 10'h28c;
      expv[13] = 10'h2f8;
      expv[14] = 10'h218;
      expv[15] = 10'h358;
      expv[16] = 10'h2f8;
      expv[17] = 10'h3e8;
      expv[18] = 10'h3c4;
      expv[19] = 10'h3d8;
      expv[20] = 10'h140;
      expv[21] = 10'h114;
      expv[22] = 10'h264;
      expv[23] = 10'h3bc;
      expv[24] = 10'h304;
      expv[25] = 10'h380;
      expv[26] = 10'h314;
      expv[27] = 10'h21c;
      expv[28] = 10'h0b4;
      expv[29] = 10'h390;
      expv[30] = 10'h21c;
      expv[31] = 10'h2d0;
      expv[32] = 10'h370;
      expv[33] = 10'h054;
      expv[34] = 10'h0e8;
      expv[35] = 10'h250;
      expv[36] = 10'h174;
      expv[37] = 10'h310;
      expv[38] = 10'h1a0;
      expv[39] = 10'h250;
      expv[40] = 10'h020;
      expv[41] = 10'h034;
      expv[42] = 10'h244;
      expv[43] = 10'h02c;
      expv[44] = 10'h2d0;
      expv[45] = 10'h248;
      expv[46] = 10'h0cc;
      expv[47] = 10'h2b0;
      expv[48] = 10'h114;
      expv[49] = 10'h000;
      expv[50] = 10'h250;
      expv[51] = 10'h288;
      expv[52] = 10'h158;
      expv[53] = 10'h2d0;
      expv[54] = 10'h1a4;
      expv[55] = 10'h158;
      expv[56] = 10'h224;
      expv[57] = 10'h2bc;
      expv[58] = 10'h154;
      expv[59] = 10'h32c;
      expv[60] = 10'h1f4;
      expv[61] = 10'h314;
      expv[62] = 10'h204;
      expv[63] = 10'h1a0;
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
