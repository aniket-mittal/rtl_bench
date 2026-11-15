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

  FP16_TO_FP17_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h208;
    stim[1] = 10'h2b9;
    stim[2] = 10'h3cd;
    stim[3] = 10'h0c1;
    stim[4] = 10'h077;
    stim[5] = 10'h25e;
    stim[6] = 10'h2ef;
    stim[7] = 10'h10c;
    stim[8] = 10'h208;
    stim[9] = 10'h3c4;
    stim[10] = 10'h0f8;
    stim[11] = 10'h052;
    stim[12] = 10'h131;
    stim[13] = 10'h282;
    stim[14] = 10'h0ad;
    stim[15] = 10'h31d;
    stim[16] = 10'h055;
    stim[17] = 10'h0a6;
    stim[18] = 10'h16e;
    stim[19] = 10'h2a7;
    stim[20] = 10'h096;
    stim[21] = 10'h0ac;
    stim[22] = 10'h126;
    stim[23] = 10'h0a6;
    stim[24] = 10'h029;
    stim[25] = 10'h357;
    stim[26] = 10'h2e1;
    stim[27] = 10'h357;
    stim[28] = 10'h13a;
    stim[29] = 10'h150;
    stim[30] = 10'h33f;
    stim[31] = 10'h124;
    stim[32] = 10'h05d;
    stim[33] = 10'h039;
    stim[34] = 10'h0e0;
    stim[35] = 10'h1b0;
    stim[36] = 10'h000;
    stim[37] = 10'h10b;
    stim[38] = 10'h151;
    stim[39] = 10'h093;
    stim[40] = 10'h357;
    stim[41] = 10'h2c5;
    stim[42] = 10'h258;
    stim[43] = 10'h2a1;
    stim[44] = 10'h1ca;
    stim[45] = 10'h036;
    stim[46] = 10'h2d5;
    stim[47] = 10'h0d8;
    stim[48] = 10'h2fb;
    stim[49] = 10'h164;
    stim[50] = 10'h005;
    stim[51] = 10'h121;
    stim[52] = 10'h32e;
    stim[53] = 10'h24b;
    stim[54] = 10'h176;
    stim[55] = 10'h2aa;
    stim[56] = 10'h05b;
    stim[57] = 10'h358;
    stim[58] = 10'h1de;
    stim[59] = 10'h1e9;
    stim[60] = 10'h00d;
    stim[61] = 10'h3c5;
    stim[62] = 10'h25c;
    stim[63] = 10'h1b5;
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
      expv[0] = 10'h011;
      expv[1] = 10'h173;
      expv[2] = 10'h39b;
      expv[3] = 10'h182;
      expv[4] = 10'h0ee;
      expv[5] = 10'h0bd;
      expv[6] = 10'h1df;
      expv[7] = 10'h218;
      expv[8] = 10'h011;
      expv[9] = 10'h389;
      expv[10] = 10'h1f0;
      expv[11] = 10'h0a4;
      expv[12] = 10'h262;
      expv[13] = 10'h105;
      expv[14] = 10'h15a;
      expv[15] = 10'h23b;
      expv[16] = 10'h0aa;
      expv[17] = 10'h14c;
      expv[18] = 10'h2dc;
      expv[19] = 10'h14f;
      expv[20] = 10'h12c;
      expv[21] = 10'h158;
      expv[22] = 10'h24c;
      expv[23] = 10'h14c;
      expv[24] = 10'h052;
      expv[25] = 10'h2af;
      expv[26] = 10'h1c3;
      expv[27] = 10'h2af;
      expv[28] = 10'h274;
      expv[29] = 10'h2a0;
      expv[30] = 10'h27f;
      expv[31] = 10'h248;
      expv[32] = 10'h0ba;
      expv[33] = 10'h072;
      expv[34] = 10'h1c0;
      expv[35] = 10'h360;
      expv[36] = 10'h000;
      expv[37] = 10'h216;
      expv[38] = 10'h2a2;
      expv[39] = 10'h126;
      expv[40] = 10'h2af;
      expv[41] = 10'h18b;
      expv[42] = 10'h0b1;
      expv[43] = 10'h143;
      expv[44] = 10'h394;
      expv[45] = 10'h06c;
      expv[46] = 10'h1ab;
      expv[47] = 10'h1b0;
      expv[48] = 10'h1f7;
      expv[49] = 10'h2c8;
      expv[50] = 10'h00a;
      expv[51] = 10'h242;
      expv[52] = 10'h25d;
      expv[53] = 10'h097;
      expv[54] = 10'h2ec;
      expv[55] = 10'h155;
      expv[56] = 10'h0b6;
      expv[57] = 10'h2b1;
      expv[58] = 10'h3bc;
      expv[59] = 10'h3d2;
      expv[60] = 10'h01a;
      expv[61] = 10'h38b;
      expv[62] = 10'h0b9;
      expv[63] = 10'h36a;
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
