// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0899b;
    stim[1] = 17'h1b228;
    stim[2] = 17'h120d1;
    stim[3] = 17'h1891f;
    stim[4] = 17'h1c28a;
    stim[5] = 17'h1d1f6;
    stim[6] = 17'h09bfc;
    stim[7] = 17'h05283;
    stim[8] = 17'h004ce;
    stim[9] = 17'h1fec6;
    stim[10] = 17'h077fe;
    stim[11] = 17'h14da0;
    stim[12] = 17'h015f2;
    stim[13] = 17'h047e9;
    stim[14] = 17'h1426f;
    stim[15] = 17'h0d08b;
    stim[16] = 17'h1aaeb;
    stim[17] = 17'h0a370;
    stim[18] = 17'h000d7;
    stim[19] = 17'h05bc5;
    stim[20] = 17'h1beb6;
    stim[21] = 17'h081f5;
    stim[22] = 17'h0dfda;
    stim[23] = 17'h0086e;
    stim[24] = 17'h0df11;
    stim[25] = 17'h0d066;
    stim[26] = 17'h03573;
    stim[27] = 17'h1b31e;
    stim[28] = 17'h068b2;
    stim[29] = 17'h14b59;
    stim[30] = 17'h00439;
    stim[31] = 17'h03fa1;
    stim[32] = 17'h034d4;
    stim[33] = 17'h056ab;
    stim[34] = 17'h15ec1;
    stim[35] = 17'h13201;
    stim[36] = 17'h02971;
    stim[37] = 17'h03f98;
    stim[38] = 17'h099df;
    stim[39] = 17'h12e67;
    stim[40] = 17'h03d3b;
    stim[41] = 17'h045c4;
    stim[42] = 17'h14499;
    stim[43] = 17'h00f8f;
    stim[44] = 17'h1a667;
    stim[45] = 17'h021a3;
    stim[46] = 17'h138dc;
    stim[47] = 17'h05220;
    stim[48] = 17'h17f68;
    stim[49] = 17'h0697c;
    stim[50] = 17'h092c5;
    stim[51] = 17'h16833;
    stim[52] = 17'h14873;
    stim[53] = 17'h1847d;
    stim[54] = 17'h1166a;
    stim[55] = 17'h1f280;
    stim[56] = 17'h064ec;
    stim[57] = 17'h1e782;
    stim[58] = 17'h02332;
    stim[59] = 17'h02664;
    stim[60] = 17'h12d8c;
    stim[61] = 17'h0298d;
    stim[62] = 17'h1be41;
    stim[63] = 17'h12d92;
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
      expv[0] = 9'h049;
      expv[1] = 9'h115;
      expv[2] = 9'h09f;
      expv[3] = 9'h0d5;
      expv[4] = 9'h071;
      expv[5] = 9'h1b7;
      expv[6] = 9'h12f;
      expv[7] = 9'h1ab;
      expv[8] = 9'h1a5;
      expv[9] = 9'h071;
      expv[10] = 9'h0eb;
      expv[11] = 9'h15b;
      expv[12] = 9'h00f;
      expv[13] = 9'h061;
      expv[14] = 9'h1a7;
      expv[15] = 9'h0b7;
      expv[16] = 9'h17f;
      expv[17] = 9'h027;
      expv[18] = 9'h1af;
      expv[19] = 9'h041;
      expv[20] = 9'h011;
      expv[21] = 9'h0ed;
      expv[22] = 9'h173;
      expv[23] = 9'h0ed;
      expv[24] = 9'h1e1;
      expv[25] = 9'h06d;
      expv[26] = 9'h151;
      expv[27] = 9'h12b;
      expv[28] = 9'h035;
      expv[29] = 9'h1e5;
      expv[30] = 9'h07b;
      expv[31] = 9'h1c1;
      expv[32] = 9'h011;
      expv[33] = 9'h003;
      expv[34] = 9'h13b;
      expv[35] = 9'h063;
      expv[36] = 9'h135;
      expv[37] = 9'h1af;
      expv[38] = 9'h0f1;
      expv[39] = 9'h18f;
      expv[40] = 9'h0f1;
      expv[41] = 9'h013;
      expv[42] = 9'h157;
      expv[43] = 9'h13d;
      expv[44] = 9'h07f;
      expv[45] = 9'h189;
      expv[46] = 9'h0b9;
      expv[47] = 9'h0e5;
      expv[48] = 9'h02f;
      expv[49] = 9'h1cb;
      expv[50] = 9'h0af;
      expv[51] = 9'h06b;
      expv[52] = 9'h1ab;
      expv[53] = 9'h00f;
      expv[54] = 9'h159;
      expv[55] = 9'h0e5;
      expv[56] = 9'h0a1;
      expv[57] = 9'h0cb;
      expv[58] = 9'h0ab;
      expv[59] = 9'h115;
      expv[60] = 9'h143;
      expv[61] = 9'h16d;
      expv[62] = 9'h0fb;
      expv[63] = 9'h137;
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
