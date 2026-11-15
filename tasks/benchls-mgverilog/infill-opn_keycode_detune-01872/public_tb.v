// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01872 dut (
    .block(in_vec[16:14]),
    .fnum(in_vec[13:3]),
    .detune(in_vec[2:0]),
    .keycode(out_vec[10:6]),
    .detune_signed(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h006f0;
    stim[1] = 17'h13784;
    stim[2] = 17'h07857;
    stim[3] = 17'h06680;
    stim[4] = 17'h0cb2e;
    stim[5] = 17'h06e43;
    stim[6] = 17'h0f06f;
    stim[7] = 17'h11346;
    stim[8] = 17'h1d345;
    stim[9] = 17'h1188d;
    stim[10] = 17'h01395;
    stim[11] = 17'h054e7;
    stim[12] = 17'h18f79;
    stim[13] = 17'h01b88;
    stim[14] = 17'h12be4;
    stim[15] = 17'h14e48;
    stim[16] = 17'h010de;
    stim[17] = 17'h1362e;
    stim[18] = 17'h0e78e;
    stim[19] = 17'h19054;
    stim[20] = 17'h04b0a;
    stim[21] = 17'h13f56;
    stim[22] = 17'h11abe;
    stim[23] = 17'h1fb44;
    stim[24] = 17'h13d88;
    stim[25] = 17'h1ba93;
    stim[26] = 17'h134f0;
    stim[27] = 17'h0b62b;
    stim[28] = 17'h13e2c;
    stim[29] = 17'h0e7f1;
    stim[30] = 17'h08a3c;
    stim[31] = 17'h1e883;
    stim[32] = 17'h1844d;
    stim[33] = 17'h1a49d;
    stim[34] = 17'h12bcd;
    stim[35] = 17'h1e668;
    stim[36] = 17'h014b0;
    stim[37] = 17'h1a439;
    stim[38] = 17'h16f61;
    stim[39] = 17'h15537;
    stim[40] = 17'h1a8e5;
    stim[41] = 17'h1e218;
    stim[42] = 17'h157c7;
    stim[43] = 17'h174a7;
    stim[44] = 17'h11d2f;
    stim[45] = 17'h04101;
    stim[46] = 17'h129e9;
    stim[47] = 17'h0e3ee;
    stim[48] = 17'h11d33;
    stim[49] = 17'h1af83;
    stim[50] = 17'h0167c;
    stim[51] = 17'h08b63;
    stim[52] = 17'h01eed;
    stim[53] = 17'h11be8;
    stim[54] = 17'h1e7c0;
    stim[55] = 17'h0bd29;
    stim[56] = 17'h0e096;
    stim[57] = 17'h19489;
    stim[58] = 17'h0f31e;
    stim[59] = 17'h0a435;
    stim[60] = 17'h176e7;
    stim[61] = 17'h18547;
    stim[62] = 17'h07151;
    stim[63] = 17'h1704c;
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
      expv[0] = 11'h000;
      expv[1] = 11'h4c0;
      expv[2] = 11'h1fd;
      expv[3] = 11'h1c0;
      expv[4] = 11'h33c;
      expv[5] = 11'h1c3;
      expv[6] = 11'h3f9;
      expv[7] = 11'h43b;
      expv[8] = 11'h738;
      expv[9] = 11'h43e;
      expv[10] = 11'h000;
      expv[11] = 11'h13e;
      expv[12] = 11'h605;
      expv[13] = 11'h000;
      expv[14] = 11'h4c0;
      expv[15] = 11'h500;
      expv[16] = 11'h03f;
      expv[17] = 11'h4f9;
      expv[18] = 11'h3fb;
      expv[19] = 11'h600;
      expv[20] = 11'h102;
      expv[21] = 11'h4f9;
      expv[22] = 11'h43b;
      expv[23] = 11'h7c0;
      expv[24] = 11'h4c0;
      expv[25] = 11'h6d4;
      expv[26] = 11'h4c0;
      expv[27] = 11'h2c5;
      expv[28] = 11'h4c0;
      expv[29] = 11'h3c2;
      expv[30] = 11'h200;
      expv[31] = 11'h7d6;
      expv[32] = 11'h63b;
      expv[33] = 11'h6f9;
      expv[34] = 11'h4fd;
      expv[35] = 11'h7c0;
      expv[36] = 11'h000;
      expv[37] = 11'h6c7;
      expv[38] = 11'h5c5;
      expv[39] = 11'h535;
      expv[40] = 11'h6f9;
      expv[41] = 11'h780;
      expv[42] = 11'h535;
      expv[43] = 11'h5f2;
      expv[44] = 11'h478;
      expv[45] = 11'h101;
      expv[46] = 11'h4c3;
      expv[47] = 11'h3bc;
      expv[48] = 11'h448;
      expv[49] = 11'h6d4;
      expv[50] = 11'h000;
      expv[51] = 11'h204;
      expv[52] = 11'h040;
      expv[53] = 11'h400;
      expv[54] = 11'h7c0;
      expv[55] = 11'h2c1;
      expv[56] = 11'h3bc;
      expv[57] = 11'h605;
      expv[58] = 11'h3fb;
      expv[59] = 11'h2ff;
      expv[60] = 11'h5f2;
      expv[61] = 11'h630;
      expv[62] = 11'h1c1;
      expv[63] = 11'h5c0;
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
