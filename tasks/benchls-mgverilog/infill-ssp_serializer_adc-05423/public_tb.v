// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05423 dut (
    .ck_1356meg(in_vec[8:8]),
    .adc_d(in_vec[7:0]),
    .pwr_lo(out_vec[9:9]),
    .pwr_hi(out_vec[8:8]),
    .pwr_oe1(out_vec[7:7]),
    .pwr_oe2(out_vec[6:6]),
    .pwr_oe3(out_vec[5:5]),
    .pwr_oe4(out_vec[4:4]),
    .adc_clk(out_vec[3:3]),
    .ssp_frame(out_vec[2:2]),
    .ssp_din(out_vec[1:1]),
    .ssp_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1b9;
    stim[1] = 9'h17e;
    stim[2] = 9'h033;
    stim[3] = 9'h102;
    stim[4] = 9'h1a9;
    stim[5] = 9'h073;
    stim[6] = 9'h1c7;
    stim[7] = 9'h064;
    stim[8] = 9'h191;
    stim[9] = 9'h1fc;
    stim[10] = 9'h082;
    stim[11] = 9'h04d;
    stim[12] = 9'h1a6;
    stim[13] = 9'h1a7;
    stim[14] = 9'h0a9;
    stim[15] = 9'h0c8;
    stim[16] = 9'h02d;
    stim[17] = 9'h1f5;
    stim[18] = 9'h0c1;
    stim[19] = 9'h06e;
    stim[20] = 9'h04d;
    stim[21] = 9'h07b;
    stim[22] = 9'h0d6;
    stim[23] = 9'h096;
    stim[24] = 9'h166;
    stim[25] = 9'h006;
    stim[26] = 9'h1eb;
    stim[27] = 9'h169;
    stim[28] = 9'h0a7;
    stim[29] = 9'h025;
    stim[30] = 9'h128;
    stim[31] = 9'h1e3;
    stim[32] = 9'h158;
    stim[33] = 9'h18c;
    stim[34] = 9'h0d7;
    stim[35] = 9'h0a5;
    stim[36] = 9'h0d2;
    stim[37] = 9'h12c;
    stim[38] = 9'h191;
    stim[39] = 9'h0af;
    stim[40] = 9'h12a;
    stim[41] = 9'h196;
    stim[42] = 9'h153;
    stim[43] = 9'h0be;
    stim[44] = 9'h187;
    stim[45] = 9'h135;
    stim[46] = 9'h1e0;
    stim[47] = 9'h177;
    stim[48] = 9'h01e;
    stim[49] = 9'h02b;
    stim[50] = 9'h1c6;
    stim[51] = 9'h1de;
    stim[52] = 9'h0c0;
    stim[53] = 9'h160;
    stim[54] = 9'h143;
    stim[55] = 9'h1b8;
    stim[56] = 9'h065;
    stim[57] = 9'h1aa;
    stim[58] = 9'h074;
    stim[59] = 9'h0d3;
    stim[60] = 9'h101;
    stim[61] = 9'h15e;
    stim[62] = 9'h058;
    stim[63] = 9'h04e;
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
      expv[0] = 10'h00x;
      expv[1] = 10'h00x;
      expv[2] = 10'h007;
      expv[3] = 10'h00e;
      expv[4] = 10'h00e;
      expv[5] = 10'h003;
      expv[6] = 10'h00a;
      expv[7] = 10'h001;
      expv[8] = 10'h008;
      expv[9] = 10'h008;
      expv[10] = 10'h001;
      expv[11] = 10'h001;
      expv[12] = 10'h008;
      expv[13] = 10'h008;
      expv[14] = 10'h003;
      expv[15] = 10'h003;
      expv[16] = 10'h003;
      expv[17] = 10'h00a;
      expv[18] = 10'h003;
      expv[19] = 10'h003;
      expv[20] = 10'h003;
      expv[21] = 10'h003;
      expv[22] = 10'h003;
      expv[23] = 10'h003;
      expv[24] = 10'h00a;
      expv[25] = 10'h001;
      expv[26] = 10'h008;
      expv[27] = 10'h008;
      expv[28] = 10'h001;
      expv[29] = 10'h001;
      expv[30] = 10'h008;
      expv[31] = 10'h008;
      expv[32] = 10'h008;
      expv[33] = 10'h008;
      expv[34] = 10'h007;
      expv[35] = 10'h007;
      expv[36] = 10'h007;
      expv[37] = 10'h00e;
      expv[38] = 10'h00e;
      expv[39] = 10'h003;
      expv[40] = 10'h00a;
      expv[41] = 10'h00a;
      expv[42] = 10'h00a;
      expv[43] = 10'h003;
      expv[44] = 10'h00a;
      expv[45] = 10'h00a;
      expv[46] = 10'h00a;
      expv[47] = 10'h00a;
      expv[48] = 10'h001;
      expv[49] = 10'h001;
      expv[50] = 10'h008;
      expv[51] = 10'h008;
      expv[52] = 10'h003;
      expv[53] = 10'h00a;
      expv[54] = 10'h00a;
      expv[55] = 10'h00a;
      expv[56] = 10'h001;
      expv[57] = 10'h008;
      expv[58] = 10'h003;
      expv[59] = 10'h003;
      expv[60] = 10'h00a;
      expv[61] = 10'h00a;
      expv[62] = 10'h003;
      expv[63] = 10'h003;
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
