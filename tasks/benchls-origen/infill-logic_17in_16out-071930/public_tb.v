// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071930 dut (
    .x00(in_vec[16:16]),
    .x01(in_vec[15:15]),
    .x02(in_vec[14:14]),
    .x03(in_vec[13:13]),
    .x04(in_vec[12:12]),
    .x05(in_vec[11:11]),
    .x06(in_vec[10:10]),
    .x07(in_vec[9:9]),
    .x08(in_vec[8:8]),
    .x09(in_vec[7:7]),
    .x10(in_vec[6:6]),
    .x11(in_vec[5:5]),
    .x12(in_vec[4:4]),
    .x13(in_vec[3:3]),
    .x14(in_vec[2:2]),
    .x15(in_vec[1:1]),
    .x16(in_vec[0:0]),
    .z00(out_vec[15:15]),
    .z01(out_vec[14:14]),
    .z02(out_vec[13:13]),
    .z03(out_vec[12:12]),
    .z04(out_vec[11:11]),
    .z05(out_vec[10:10]),
    .z06(out_vec[9:9]),
    .z07(out_vec[8:8]),
    .z08(out_vec[7:7]),
    .z09(out_vec[6:6]),
    .z10(out_vec[5:5]),
    .z11(out_vec[4:4]),
    .z12(out_vec[3:3]),
    .z13(out_vec[2:2]),
    .z14(out_vec[1:1]),
    .z15(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h02fe4;
    stim[1] = 17'h01932;
    stim[2] = 17'h00a79;
    stim[3] = 17'h0e230;
    stim[4] = 17'h1e934;
    stim[5] = 17'h1e2c4;
    stim[6] = 17'h13b05;
    stim[7] = 17'h1c72c;
    stim[8] = 17'h12bc9;
    stim[9] = 17'h1ac01;
    stim[10] = 17'h19c69;
    stim[11] = 17'h07836;
    stim[12] = 17'h08f5d;
    stim[13] = 17'h14b8a;
    stim[14] = 17'h1dbfb;
    stim[15] = 17'h0b96d;
    stim[16] = 17'h1c268;
    stim[17] = 17'h1e691;
    stim[18] = 17'h06671;
    stim[19] = 17'h01d79;
    stim[20] = 17'h0ca80;
    stim[21] = 17'h02b72;
    stim[22] = 17'h1f41a;
    stim[23] = 17'h12d14;
    stim[24] = 17'h1ffa6;
    stim[25] = 17'h16f68;
    stim[26] = 17'h1e6c4;
    stim[27] = 17'h14535;
    stim[28] = 17'h19eb1;
    stim[29] = 17'h12aec;
    stim[30] = 17'h0f613;
    stim[31] = 17'h0d038;
    stim[32] = 17'h1c773;
    stim[33] = 17'h17a70;
    stim[34] = 17'h18e11;
    stim[35] = 17'h04c8e;
    stim[36] = 17'h02c5b;
    stim[37] = 17'h04baf;
    stim[38] = 17'h133ab;
    stim[39] = 17'h061a9;
    stim[40] = 17'h0c2a4;
    stim[41] = 17'h1ac1f;
    stim[42] = 17'h16f48;
    stim[43] = 17'h0a86f;
    stim[44] = 17'h14877;
    stim[45] = 17'h1c5e3;
    stim[46] = 17'h150fd;
    stim[47] = 17'h1d28a;
    stim[48] = 17'h0817f;
    stim[49] = 17'h09dda;
    stim[50] = 17'h10836;
    stim[51] = 17'h1b7c5;
    stim[52] = 17'h10cbf;
    stim[53] = 17'h09dff;
    stim[54] = 17'h19caf;
    stim[55] = 17'h0ab69;
    stim[56] = 17'h184e8;
    stim[57] = 17'h0d623;
    stim[58] = 17'h07f85;
    stim[59] = 17'h1dc11;
    stim[60] = 17'h046aa;
    stim[61] = 17'h09050;
    stim[62] = 17'h1c745;
    stim[63] = 17'h0a906;
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
      expv[0] = 16'he417;
      expv[1] = 16'h320c;
      expv[2] = 16'h0a73;
      expv[3] = 16'h008e;
      expv[4] = 16'h34f4;
      expv[5] = 16'h000e;
      expv[6] = 16'h059d;
      expv[7] = 16'h08ff;
      expv[8] = 16'h08ff;
      expv[9] = 16'h0029;
      expv[10] = 16'h0a63;
      expv[11] = 16'h02c3;
      expv[12] = 16'h08ff;
      expv[13] = 16'h0aff;
      expv[14] = 16'h0aff;
      expv[15] = 16'h08ff;
      expv[16] = 16'h0a60;
      expv[17] = 16'h000c;
      expv[18] = 16'h00cc;
      expv[19] = 16'h08ff;
      expv[20] = 16'h009a;
      expv[21] = 16'h7215;
      expv[22] = 16'h0a14;
      expv[23] = 16'h1496;
      expv[24] = 16'ha6ff;
      expv[25] = 16'h08ff;
      expv[26] = 16'h000c;
      expv[27] = 16'h35a2;
      expv[28] = 16'h0030;
      expv[29] = 16'h0ae8;
      expv[30] = 16'h0284;
      expv[31] = 16'h0a30;
      expv[32] = 16'h73e3;
      expv[33] = 16'h0042;
      expv[34] = 16'h0038;
      expv[35] = 16'h0a8c;
      expv[36] = 16'h0a57;
      expv[37] = 16'h0aff;
      expv[38] = 16'h0aff;
      expv[39] = 16'h08ff;
      expv[40] = 16'h009e;
      expv[41] = 16'h0a1f;
      expv[42] = 16'h08ff;
      expv[43] = 16'h0a6f;
      expv[44] = 16'h025b;
      expv[45] = 16'he3e2;
      expv[46] = 16'h0afb;
      expv[47] = 16'h0a84;
      expv[48] = 16'h0aff;
      expv[49] = 16'h0aff;
      expv[50] = 16'h027b;
      expv[51] = 16'hc5db;
      expv[52] = 16'h0abf;
      expv[53] = 16'h0aff;
      expv[54] = 16'h0aaf;
      expv[55] = 16'h08ff;
      expv[56] = 16'h0ae0;
      expv[57] = 16'h0294;
      expv[58] = 16'h853f;
      expv[59] = 16'h0011;
      expv[60] = 16'h0aa4;
      expv[61] = 16'h00b7;
      expv[62] = 16'h45e3;
      expv[63] = 16'h0654;
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
