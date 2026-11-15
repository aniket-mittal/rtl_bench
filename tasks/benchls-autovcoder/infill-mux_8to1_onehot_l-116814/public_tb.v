// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_116814 dut (
    .in0(in_vec[15:15]),
    .in1(in_vec[14:14]),
    .in2(in_vec[13:13]),
    .in3(in_vec[12:12]),
    .in4(in_vec[11:11]),
    .in5(in_vec[10:10]),
    .in6(in_vec[9:9]),
    .in7(in_vec[8:8]),
    .sel0_l(in_vec[7:7]),
    .sel1_l(in_vec[6:6]),
    .sel2_l(in_vec[5:5]),
    .sel3_l(in_vec[4:4]),
    .sel4_l(in_vec[3:3]),
    .sel5_l(in_vec[2:2]),
    .sel6_l(in_vec[1:1]),
    .sel7_l(in_vec[0:0]),
    .dout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hd4d1;
    stim[1] = 16'h82c9;
    stim[2] = 16'h7782;
    stim[3] = 16'h119f;
    stim[4] = 16'hb0a6;
    stim[5] = 16'hc3fa;
    stim[6] = 16'h5528;
    stim[7] = 16'h4e03;
    stim[8] = 16'h08d1;
    stim[9] = 16'h63b2;
    stim[10] = 16'h7252;
    stim[11] = 16'hddca;
    stim[12] = 16'h1968;
    stim[13] = 16'hd72e;
    stim[14] = 16'h9fb7;
    stim[15] = 16'h4fc5;
    stim[16] = 16'h3a14;
    stim[17] = 16'h0b19;
    stim[18] = 16'h916c;
    stim[19] = 16'h4e75;
    stim[20] = 16'h126c;
    stim[21] = 16'h50bf;
    stim[22] = 16'h4e34;
    stim[23] = 16'he979;
    stim[24] = 16'h97fb;
    stim[25] = 16'hbd35;
    stim[26] = 16'h24cd;
    stim[27] = 16'h2e79;
    stim[28] = 16'h01ba;
    stim[29] = 16'hebf2;
    stim[30] = 16'h1aec;
    stim[31] = 16'h7e81;
    stim[32] = 16'hdcce;
    stim[33] = 16'h4573;
    stim[34] = 16'h5b51;
    stim[35] = 16'h3293;
    stim[36] = 16'hab64;
    stim[37] = 16'h7c03;
    stim[38] = 16'h97c2;
    stim[39] = 16'he6b7;
    stim[40] = 16'h9b73;
    stim[41] = 16'h02fd;
    stim[42] = 16'h920b;
    stim[43] = 16'h282d;
    stim[44] = 16'hbfb2;
    stim[45] = 16'hf1c9;
    stim[46] = 16'h337e;
    stim[47] = 16'hdc7d;
    stim[48] = 16'hc4fa;
    stim[49] = 16'ha759;
    stim[50] = 16'h15e5;
    stim[51] = 16'h49e9;
    stim[52] = 16'h038a;
    stim[53] = 16'hedb1;
    stim[54] = 16'h0418;
    stim[55] = 16'he4ea;
    stim[56] = 16'h5722;
    stim[57] = 16'h449a;
    stim[58] = 16'h95e1;
    stim[59] = 16'h0a2d;
    stim[60] = 16'hb1a1;
    stim[61] = 16'hac2f;
    stim[62] = 16'h2791;
    stim[63] = 16'h3214;
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
      expv[7] = 1'hx;
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
      expv[21] = 1'h1;
      expv[22] = 1'hx;
      expv[23] = 1'hx;
      expv[24] = 1'h1;
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
      expv[41] = 1'h1;
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
