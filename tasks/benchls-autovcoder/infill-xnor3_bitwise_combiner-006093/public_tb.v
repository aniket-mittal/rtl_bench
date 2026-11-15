// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_006093 dut (
    .port_u_0_0(in_vec[26:24]),
    .port_u_0_1(in_vec[23:21]),
    .port_u_0_2(in_vec[20:18]),
    .port_u_1_0(in_vec[17:15]),
    .port_u_1_1(in_vec[14:12]),
    .port_u_1_2(in_vec[11:9]),
    .port_u_2_0(in_vec[8:6]),
    .port_u_2_1(in_vec[5:3]),
    .port_u_2_2(in_vec[2:0]),
    .port_c_0(out_vec[8:6]),
    .port_c_1(out_vec[5:3]),
    .port_c_2(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7788117;
    stim[1] = 27'h5d3da0e;
    stim[2] = 27'h696501b;
    stim[3] = 27'h4af12c4;
    stim[4] = 27'h040ebc6;
    stim[5] = 27'h08eb358;
    stim[6] = 27'h04dae78;
    stim[7] = 27'h4dd1e60;
    stim[8] = 27'h706b165;
    stim[9] = 27'h4714161;
    stim[10] = 27'h5aa32d6;
    stim[11] = 27'h3cec7dd;
    stim[12] = 27'h2e9a775;
    stim[13] = 27'h5fe8cc6;
    stim[14] = 27'h32473f0;
    stim[15] = 27'h2d6a56e;
    stim[16] = 27'h27ebbbe;
    stim[17] = 27'h4d8726f;
    stim[18] = 27'h14d1d79;
    stim[19] = 27'h59589ff;
    stim[20] = 27'h09d8c27;
    stim[21] = 27'h2c6bdb4;
    stim[22] = 27'h1d47f8f;
    stim[23] = 27'h296fda6;
    stim[24] = 27'h052cb75;
    stim[25] = 27'h07b7bf6;
    stim[26] = 27'h3ca3257;
    stim[27] = 27'h1767e63;
    stim[28] = 27'h5db0cba;
    stim[29] = 27'h58ad675;
    stim[30] = 27'h1cec2b8;
    stim[31] = 27'h19e3616;
    stim[32] = 27'h1c3c218;
    stim[33] = 27'h2e9d41d;
    stim[34] = 27'h38208b2;
    stim[35] = 27'h3987f81;
    stim[36] = 27'h150455b;
    stim[37] = 27'h7c4d9b7;
    stim[38] = 27'h110b1c3;
    stim[39] = 27'h1bfd1b6;
    stim[40] = 27'h693e651;
    stim[41] = 27'h47c03bc;
    stim[42] = 27'h50808a1;
    stim[43] = 27'h4b56c52;
    stim[44] = 27'h0b741d1;
    stim[45] = 27'h6de4bdd;
    stim[46] = 27'h0e54770;
    stim[47] = 27'h30b2c15;
    stim[48] = 27'h5db5504;
    stim[49] = 27'h189bfe0;
    stim[50] = 27'h2e688ff;
    stim[51] = 27'h246c60d;
    stim[52] = 27'h66819d9;
    stim[53] = 27'h70923e9;
    stim[54] = 27'h5445878;
    stim[55] = 27'h3c1e435;
    stim[56] = 27'h113e45d;
    stim[57] = 27'h146fe31;
    stim[58] = 27'h4f12817;
    stim[59] = 27'h450a74d;
    stim[60] = 27'h7c670e6;
    stim[61] = 27'h5ef27ae;
    stim[62] = 27'h68ae402;
    stim[63] = 27'h7de8c9f;
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
      expv[0] = 9'h089;
      expv[1] = 9'h1ff;
      expv[2] = 9'h1c8;
      expv[3] = 9'h0b7;
      expv[4] = 9'h091;
      expv[5] = 9'h1fe;
      expv[6] = 9'h076;
      expv[7] = 9'h165;
      expv[8] = 9'h1b4;
      expv[9] = 9'h0f0;
      expv[10] = 9'h0b7;
      expv[11] = 9'h191;
      expv[12] = 9'h1d6;
      expv[13] = 9'h15d;
      expv[14] = 9'h0f1;
      expv[15] = 9'h06e;
      expv[16] = 9'h19f;
      expv[17] = 9'h133;
      expv[18] = 9'h02b;
      expv[19] = 9'h13f;
      expv[20] = 9'h0eb;
      expv[21] = 9'h144;
      expv[22] = 9'h080;
      expv[23] = 9'h0e4;
      expv[24] = 9'h1a6;
      expv[25] = 9'h167;
      expv[26] = 9'h1f4;
      expv[27] = 9'h1e6;
      expv[28] = 9'h147;
      expv[29] = 9'h0da;
      expv[30] = 9'h105;
      expv[31] = 9'h0a4;
      expv[32] = 9'h1d3;
      expv[33] = 9'h1e6;
      expv[34] = 9'h1c6;
      expv[35] = 9'h047;
      expv[36] = 9'h1f5;
      expv[37] = 9'h007;
      expv[38] = 9'h154;
      expv[39] = 9'h0d6;
      expv[40] = 9'h192;
      expv[41] = 9'h00d;
      expv[42] = 9'h1e7;
      expv[43] = 9'h111;
      expv[44] = 9'h014;
      expv[45] = 9'h1e9;
      expv[46] = 9'h1ab;
      expv[47] = 9'h057;
      expv[48] = 9'h148;
      expv[49] = 9'h1fb;
      expv[50] = 9'h10b;
      expv[51] = 9'h054;
      expv[52] = 9'h1ed;
      expv[53] = 9'h14b;
      expv[54] = 9'h18e;
      expv[55] = 9'h17b;
      expv[56] = 9'h15f;
      expv[57] = 9'h0af;
      expv[58] = 9'h1e5;
      expv[59] = 9'h081;
      expv[60] = 9'h019;
      expv[61] = 9'h07d;
      expv[62] = 9'h00a;
      expv[63] = 9'h19e;
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
