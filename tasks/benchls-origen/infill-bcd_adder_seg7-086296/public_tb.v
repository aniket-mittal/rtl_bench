// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086296 dut (
    .SW(in_vec[8:0]),
    .HEX0(out_vec[27:21]),
    .HEX1(out_vec[20:14]),
    .HEX3(out_vec[13:7]),
    .HEX5(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h131;
    stim[1] = 9'h1ca;
    stim[2] = 9'h064;
    stim[3] = 9'h0be;
    stim[4] = 9'h0e5;
    stim[5] = 9'h1e2;
    stim[6] = 9'h0fd;
    stim[7] = 9'h07f;
    stim[8] = 9'h084;
    stim[9] = 9'h145;
    stim[10] = 9'h13f;
    stim[11] = 9'h02b;
    stim[12] = 9'h0d2;
    stim[13] = 9'h0ad;
    stim[14] = 9'h173;
    stim[15] = 9'h016;
    stim[16] = 9'h16c;
    stim[17] = 9'h14a;
    stim[18] = 9'h079;
    stim[19] = 9'h0c4;
    stim[20] = 9'h062;
    stim[21] = 9'h145;
    stim[22] = 9'h0f5;
    stim[23] = 9'h1af;
    stim[24] = 9'h10c;
    stim[25] = 9'h185;
    stim[26] = 9'h042;
    stim[27] = 9'h14f;
    stim[28] = 9'h1fc;
    stim[29] = 9'h1da;
    stim[30] = 9'h19f;
    stim[31] = 9'h1a1;
    stim[32] = 9'h02f;
    stim[33] = 9'h03f;
    stim[34] = 9'h171;
    stim[35] = 9'h115;
    stim[36] = 9'h044;
    stim[37] = 9'h00a;
    stim[38] = 9'h042;
    stim[39] = 9'h06e;
    stim[40] = 9'h0f9;
    stim[41] = 9'h00c;
    stim[42] = 9'h0d1;
    stim[43] = 9'h10e;
    stim[44] = 9'h028;
    stim[45] = 9'h125;
    stim[46] = 9'h16c;
    stim[47] = 9'h0de;
    stim[48] = 9'h0ec;
    stim[49] = 9'h153;
    stim[50] = 9'h0ca;
    stim[51] = 9'h10c;
    stim[52] = 9'h03d;
    stim[53] = 9'h0bb;
    stim[54] = 9'h1a3;
    stim[55] = 9'h03e;
    stim[56] = 9'h1ba;
    stim[57] = 9'h060;
    stim[58] = 9'h0cb;
    stim[59] = 9'h157;
    stim[60] = 9'h0fa;
    stim[61] = 9'h108;
    stim[62] = 9'h01c;
    stim[63] = 9'h13c;
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
      expv[0] = 28'h2503cb0;
      expv[1] = 28'hf1e4446;
      expv[2] = 28'h11e4c82;
      expv[3] = 28'h21e4303;
      expv[4] = 28'h61e4906;
      expv[5] = 28'hf3e5206;
      expv[6] = 28'h8de508e;
      expv[7] = 28'h05e4778;
      expv[8] = 28'h8de4c80;
      expv[9] = 28'h11e4919;
      expv[10] = 28'h61e4730;
      expv[11] = 28'h43e41a4;
      expv[12] = 28'h1de5221;
      expv[13] = 28'hf1e5088;
      expv[14] = 28'h07e5878;
      expv[15] = 28'hf100179;
      expv[16] = 28'h61e6302;
      expv[17] = 28'h1de4419;
      expv[18] = 28'h81e4878;
      expv[19] = 28'h81e4cc6;
      expv[20] = 28'h0101202;
      expv[21] = 28'h11e4919;
      expv[22] = 28'h33e490e;
      expv[23] = 28'h11e4708;
      expv[24] = 28'h43e6340;
      expv[25] = 28'h0de4900;
      expv[26] = 28'h0501219;
      expv[27] = 28'h33e4719;
      expv[28] = 28'h8de630e;
      expv[29] = 28'h01e4421;
      expv[30] = 28'h21e4710;
      expv[31] = 28'h8de7c88;
      expv[32] = 28'hf3e4724;
      expv[33] = 28'h49e4730;
      expv[34] = 28'h2103cf8;
      expv[35] = 28'hf100979;
      expv[36] = 28'h0100c99;
      expv[37] = 28'h11e4440;
      expv[38] = 28'h0501219;
      expv[39] = 28'h33e4302;
      expv[40] = 28'h01e480e;
      expv[41] = 28'h8de6340;
      expv[42] = 28'h0de7ca1;
      expv[43] = 28'h1de4340;
      expv[44] = 28'h11e4024;
      expv[45] = 28'h0100924;
      expv[46] = 28'h61e6302;
      expv[47] = 28'h07e4321;
      expv[48] = 28'h11e6306;
      expv[49] = 28'h2101812;
      expv[50] = 28'h05e4446;
      expv[51] = 28'h43e6340;
      expv[52] = 28'h81e50b0;
      expv[53] = 28'h05e4183;
      expv[54] = 28'h0de5808;
      expv[55] = 28'hf3e4330;
      expv[56] = 28'h05e4403;
      expv[57] = 28'h0502002;
      expv[58] = 28'hf1e41c6;
      expv[59] = 28'h43e7c12;
      expv[60] = 28'h21e440e;
      expv[61] = 28'h2100040;
      expv[62] = 28'h43e6379;
      expv[63] = 28'h81e6330;
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
