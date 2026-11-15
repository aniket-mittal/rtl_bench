// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065843 dut (
    .KEY(in_vec[13:10]),
    .SW(in_vec[9:0]),
    .LEDR(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h1bc3;
    stim[1] = 14'h0537;
    stim[2] = 14'h2ea0;
    stim[3] = 14'h3f39;
    stim[4] = 14'h1be6;
    stim[5] = 14'h1199;
    stim[6] = 14'h1a96;
    stim[7] = 14'h000b;
    stim[8] = 14'h1a18;
    stim[9] = 14'h0b46;
    stim[10] = 14'h3c35;
    stim[11] = 14'h3195;
    stim[12] = 14'h2dba;
    stim[13] = 14'h2264;
    stim[14] = 14'h0f7f;
    stim[15] = 14'h2072;
    stim[16] = 14'h1ac0;
    stim[17] = 14'h3359;
    stim[18] = 14'h1fd0;
    stim[19] = 14'h1e44;
    stim[20] = 14'h1142;
    stim[21] = 14'h2dd1;
    stim[22] = 14'h10b2;
    stim[23] = 14'h252b;
    stim[24] = 14'h1b3a;
    stim[25] = 14'h1a86;
    stim[26] = 14'h1ed1;
    stim[27] = 14'h120c;
    stim[28] = 14'h0bce;
    stim[29] = 14'h0007;
    stim[30] = 14'h2997;
    stim[31] = 14'h174c;
    stim[32] = 14'h1801;
    stim[33] = 14'h0705;
    stim[34] = 14'h36bb;
    stim[35] = 14'h2779;
    stim[36] = 14'h2ebe;
    stim[37] = 14'h374b;
    stim[38] = 14'h3c70;
    stim[39] = 14'h10dc;
    stim[40] = 14'h07ba;
    stim[41] = 14'h1312;
    stim[42] = 14'h2056;
    stim[43] = 14'h1de6;
    stim[44] = 14'h1797;
    stim[45] = 14'h3f33;
    stim[46] = 14'h3b90;
    stim[47] = 14'h39d6;
    stim[48] = 14'h31f5;
    stim[49] = 14'h0310;
    stim[50] = 14'h1747;
    stim[51] = 14'h37fe;
    stim[52] = 14'h3557;
    stim[53] = 14'h152d;
    stim[54] = 14'h35f5;
    stim[55] = 14'h3e29;
    stim[56] = 14'h3c8c;
    stim[57] = 14'h0b7b;
    stim[58] = 14'h3499;
    stim[59] = 14'h346d;
    stim[60] = 14'h32b3;
    stim[61] = 14'h31ae;
    stim[62] = 14'h1bd0;
    stim[63] = 14'h3588;
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
      expv[0] = 10'h300;
      expv[1] = 10'h084;
      expv[2] = 10'h180;
      expv[3] = 10'h380;
      expv[4] = 10'h300;
      expv[5] = 10'h209;
      expv[6] = 10'h300;
      expv[7] = 10'h00b;
      expv[8] = 10'h301;
      expv[9] = 10'h109;
      expv[10] = 10'h380;
      expv[11] = 10'h20d;
      expv[12] = 10'h18a;
      expv[13] = 10'h00a;
      expv[14] = 10'h187;
      expv[15] = 10'h009;
      expv[16] = 10'h300;
      expv[17] = 10'h20d;
      expv[18] = 10'h380;
      expv[19] = 10'h381;
      expv[20] = 10'h206;
      expv[21] = 10'h181;
      expv[22] = 10'h20b;
      expv[23] = 10'h089;
      expv[24] = 10'h301;
      expv[25] = 10'h300;
      expv[26] = 10'h380;
      expv[27] = 10'h20c;
      expv[28] = 10'h101;
      expv[29] = 10'h007;
      expv[30] = 10'h108;
      expv[31] = 10'h288;
      expv[32] = 10'h301;
      expv[33] = 10'h085;
      expv[34] = 10'h280;
      expv[35] = 10'h082;
      expv[36] = 10'h18a;
      expv[37] = 10'h28f;
      expv[38] = 10'h380;
      expv[39] = 10'h20d;
      expv[40] = 10'h0bf;
      expv[41] = 10'h203;
      expv[42] = 10'h00b;
      expv[43] = 10'h380;
      expv[44] = 10'h28e;
      expv[45] = 10'h381;
      expv[46] = 10'h300;
      expv[47] = 10'h300;
      expv[48] = 10'h20f;
      expv[49] = 10'h001;
      expv[50] = 10'h283;
      expv[51] = 10'h281;
      expv[52] = 10'h282;
      expv[53] = 10'h28f;
      expv[54] = 10'h28a;
      expv[55] = 10'h380;
      expv[56] = 10'h380;
      expv[57] = 10'h104;
      expv[58] = 10'h280;
      expv[59] = 10'h28b;
      expv[60] = 10'h20b;
      expv[61] = 10'h20e;
      expv[62] = 10'h300;
      expv[63] = 10'h280;
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
