// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129393 dut (
    .A0(in_vec[9:9]),
    .A1(in_vec[8:8]),
    .A2(in_vec[7:7]),
    .A3(in_vec[6:6]),
    .S0(in_vec[5:5]),
    .S1(in_vec[4:4]),
    .VPWR(in_vec[3:3]),
    .VGND(in_vec[2:2]),
    .VPB(in_vec[1:1]),
    .VNB(in_vec[0:0]),
    .X(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3ec;
    stim[1] = 10'h206;
    stim[2] = 10'h380;
    stim[3] = 10'h39b;
    stim[4] = 10'h0a0;
    stim[5] = 10'h022;
    stim[6] = 10'h22f;
    stim[7] = 10'h07a;
    stim[8] = 10'h060;
    stim[9] = 10'h023;
    stim[10] = 10'h0b5;
    stim[11] = 10'h3b5;
    stim[12] = 10'h296;
    stim[13] = 10'h3d3;
    stim[14] = 10'h2d5;
    stim[15] = 10'h08e;
    stim[16] = 10'h06e;
    stim[17] = 10'h151;
    stim[18] = 10'h31c;
    stim[19] = 10'h2e9;
    stim[20] = 10'h030;
    stim[21] = 10'h1b9;
    stim[22] = 10'h216;
    stim[23] = 10'h2f9;
    stim[24] = 10'h077;
    stim[25] = 10'h3a4;
    stim[26] = 10'h309;
    stim[27] = 10'h162;
    stim[28] = 10'h17b;
    stim[29] = 10'h197;
    stim[30] = 10'h047;
    stim[31] = 10'h040;
    stim[32] = 10'h05c;
    stim[33] = 10'h284;
    stim[34] = 10'h2f0;
    stim[35] = 10'h248;
    stim[36] = 10'h00e;
    stim[37] = 10'h3b4;
    stim[38] = 10'h198;
    stim[39] = 10'h179;
    stim[40] = 10'h3d5;
    stim[41] = 10'h2c6;
    stim[42] = 10'h19d;
    stim[43] = 10'h0fd;
    stim[44] = 10'h2cb;
    stim[45] = 10'h290;
    stim[46] = 10'h158;
    stim[47] = 10'h2e4;
    stim[48] = 10'h133;
    stim[49] = 10'h2d7;
    stim[50] = 10'h17c;
    stim[51] = 10'h284;
    stim[52] = 10'h380;
    stim[53] = 10'h0b8;
    stim[54] = 10'h0fd;
    stim[55] = 10'h12c;
    stim[56] = 10'h376;
    stim[57] = 10'h289;
    stim[58] = 10'h2ab;
    stim[59] = 10'h209;
    stim[60] = 10'h160;
    stim[61] = 10'h0d9;
    stim[62] = 10'h3c7;
    stim[63] = 10'h201;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'hx;
      expv[4] = 1'hx;
      expv[5] = 1'hx;
      expv[6] = 1'hx;
      expv[7] = 1'h1;
      expv[8] = 1'hx;
      expv[9] = 1'hx;
      expv[10] = 1'hx;
      expv[11] = 1'hx;
      expv[12] = 1'hx;
      expv[13] = 1'hx;
      expv[14] = 1'hx;
      expv[15] = 1'hx;
      expv[16] = 1'hx;
      expv[17] = 1'hx;
      expv[18] = 1'hx;
      expv[19] = 1'hx;
      expv[20] = 1'hx;
      expv[21] = 1'hx;
      expv[22] = 1'hx;
      expv[23] = 1'hx;
      expv[24] = 1'hx;
      expv[25] = 1'hx;
      expv[26] = 1'hx;
      expv[27] = 1'hx;
      expv[28] = 1'hx;
      expv[29] = 1'hx;
      expv[30] = 1'hx;
      expv[31] = 1'hx;
      expv[32] = 1'hx;
      expv[33] = 1'hx;
      expv[34] = 1'hx;
      expv[35] = 1'hx;
      expv[36] = 1'hx;
      expv[37] = 1'hx;
      expv[38] = 1'hx;
      expv[39] = 1'hx;
      expv[40] = 1'hx;
      expv[41] = 1'hx;
      expv[42] = 1'hx;
      expv[43] = 1'hx;
      expv[44] = 1'hx;
      expv[45] = 1'hx;
      expv[46] = 1'hx;
      expv[47] = 1'hx;
      expv[48] = 1'hx;
      expv[49] = 1'hx;
      expv[50] = 1'hx;
      expv[51] = 1'hx;
      expv[52] = 1'hx;
      expv[53] = 1'hx;
      expv[54] = 1'hx;
      expv[55] = 1'hx;
      expv[56] = 1'hx;
      expv[57] = 1'hx;
      expv[58] = 1'hx;
      expv[59] = 1'hx;
      expv[60] = 1'hx;
      expv[61] = 1'hx;
      expv[62] = 1'hx;
      expv[63] = 1'hx;
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
