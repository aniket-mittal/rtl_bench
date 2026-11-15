// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048381 dut (
    .game_clk(clk),
    .reset(in_vec[23:23]),
    .KEY(in_vec[22:20]),
    .apx(in_vec[19:10]),
    .apy(in_vec[9:0]),
    .mpx(out_vec[21:12]),
    .mpy(out_vec[11:2]),
    .hit(out_vec[1:1]),
    .mstate(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hda5621;
    stim[1] = 24'h9f7350;
    stim[2] = 24'h405d25;
    stim[3] = 24'h49e0c7;
    stim[4] = 24'h3e7874;
    stim[5] = 24'h7c3b9e;
    stim[6] = 24'h616c4c;
    stim[7] = 24'h7b27b5;
    stim[8] = 24'h4e6919;
    stim[9] = 24'h4ac969;
    stim[10] = 24'h7e87c5;
    stim[11] = 24'h0d57c6;
    stim[12] = 24'h09bdc3;
    stim[13] = 24'h286db6;
    stim[14] = 24'h454a00;
    stim[15] = 24'h2eb3ea;
    stim[16] = 24'h0a1879;
    stim[17] = 24'h11693f;
    stim[18] = 24'h0c3286;
    stim[19] = 24'h71e825;
    stim[20] = 24'h479f19;
    stim[21] = 24'h3b37cf;
    stim[22] = 24'h3b9546;
    stim[23] = 24'h73a3e2;
    stim[24] = 24'h4eff3e;
    stim[25] = 24'h3e27ae;
    stim[26] = 24'h24cde7;
    stim[27] = 24'hc4821c;
    stim[28] = 24'h539d32;
    stim[29] = 24'h43d5a8;
    stim[30] = 24'h6ccd9f;
    stim[31] = 24'h094416;
    stim[32] = 24'h16eafb;
    stim[33] = 24'h058b01;
    stim[34] = 24'h764b27;
    stim[35] = 24'h562717;
    stim[36] = 24'h733d3d;
    stim[37] = 24'h9b1888;
    stim[38] = 24'h357044;
    stim[39] = 24'h4a39ab;
    stim[40] = 24'h261977;
    stim[41] = 24'h02545b;
    stim[42] = 24'h6b8696;
    stim[43] = 24'h42c23f;
    stim[44] = 24'h6df194;
    stim[45] = 24'h67f4e8;
    stim[46] = 24'h4f8fa3;
    stim[47] = 24'h3a1cff;
    stim[48] = 24'h0a964e;
    stim[49] = 24'h78bb1a;
    stim[50] = 24'h68de06;
    stim[51] = 24'h10339f;
    stim[52] = 24'h7e1d30;
    stim[53] = 24'h537d74;
    stim[54] = 24'h16c383;
    stim[55] = 24'h51761d;
    stim[56] = 24'h393d81;
    stim[57] = 24'h1dcf11;
    stim[58] = 24'h4d03cc;
    stim[59] = 24'h271a61;
    stim[60] = 24'h485c44;
    stim[61] = 24'h618698;
    stim[62] = 24'h16859e;
    stim[63] = 24'h45ee92;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h017495;
      expv[4] = 22'h017491;
      expv[5] = 22'h01748d;
      expv[6] = 22'h017489;
      expv[7] = 22'h017485;
      expv[8] = 22'h017481;
      expv[9] = 22'h01747d;
      expv[10] = 22'h017479;
      expv[11] = 22'h017475;
      expv[12] = 22'h017471;
      expv[13] = 22'h01746d;
      expv[14] = 22'h017469;
      expv[15] = 22'h017465;
      expv[16] = 22'h017461;
      expv[17] = 22'h01745d;
      expv[18] = 22'h017459;
      expv[19] = 22'h017455;
      expv[20] = 22'h017451;
      expv[21] = 22'h01744d;
      expv[22] = 22'h017449;
      expv[23] = 22'h017445;
      expv[24] = 22'h017441;
      expv[25] = 22'h01743d;
      expv[26] = 22'h017439;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h0e74c9;
      expv[30] = 22'h0e74c5;
      expv[31] = 22'h0e74c1;
      expv[32] = 22'h0e74bd;
      expv[33] = 22'h0e74b9;
      expv[34] = 22'h0e74b5;
      expv[35] = 22'h0e74b1;
      expv[36] = 22'h0e74ad;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h28e6ad;
      expv[41] = 22'h28e6a9;
      expv[42] = 22'h28e6a5;
      expv[43] = 22'h28e6a1;
      expv[44] = 22'h28e69d;
      expv[45] = 22'h28e699;
      expv[46] = 22'h28e695;
      expv[47] = 22'h28e691;
      expv[48] = 22'h28e68d;
      expv[49] = 22'h28e689;
      expv[50] = 22'h28e685;
      expv[51] = 22'h28e681;
      expv[52] = 22'h28e67d;
      expv[53] = 22'h28e679;
      expv[54] = 22'h28e675;
      expv[55] = 22'h28e671;
      expv[56] = 22'h28e66d;
      expv[57] = 22'h28e669;
      expv[58] = 22'h28e665;
      expv[59] = 22'h28e661;
      expv[60] = 22'h28e65d;
      expv[61] = 22'h28e659;
      expv[62] = 22'h28e655;
      expv[63] = 22'h28e651;
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
