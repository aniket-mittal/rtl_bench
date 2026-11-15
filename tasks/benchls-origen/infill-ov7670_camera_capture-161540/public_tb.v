// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161540 dut (
    .ov7670_pclk(clk),
    .reset(in_vec[10:10]),
    .ov7670_vs(in_vec[9:9]),
    .ov7670_hs(in_vec[8:8]),
    .ov7670_data(in_vec[7:0]),
    .we(out_vec[44:44]),
    .o_data_wr(out_vec[43:32]),
    .o_line(out_vec[31:16]),
    .o_pixel(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h459;
    stim[1] = 11'h6d4;
    stim[2] = 11'h0ea;
    stim[3] = 11'h353;
    stim[4] = 11'h23a;
    stim[5] = 11'h102;
    stim[6] = 11'h2cc;
    stim[7] = 11'h2f9;
    stim[8] = 11'h34b;
    stim[9] = 11'h25a;
    stim[10] = 11'h1f6;
    stim[11] = 11'h0df;
    stim[12] = 11'h0df;
    stim[13] = 11'h237;
    stim[14] = 11'h207;
    stim[15] = 11'h3ea;
    stim[16] = 11'h094;
    stim[17] = 11'h393;
    stim[18] = 11'h0ad;
    stim[19] = 11'h0ba;
    stim[20] = 11'h017;
    stim[21] = 11'h1e2;
    stim[22] = 11'h28f;
    stim[23] = 11'h299;
    stim[24] = 11'h2ad;
    stim[25] = 11'h3ef;
    stim[26] = 11'h084;
    stim[27] = 11'h066;
    stim[28] = 11'h11f;
    stim[29] = 11'h548;
    stim[30] = 11'h0a1;
    stim[31] = 11'h37c;
    stim[32] = 11'h2a6;
    stim[33] = 11'h21d;
    stim[34] = 11'h2f1;
    stim[35] = 11'h31c;
    stim[36] = 11'h259;
    stim[37] = 11'h282;
    stim[38] = 11'h01c;
    stim[39] = 11'h2a6;
    stim[40] = 11'h017;
    stim[41] = 11'h1ff;
    stim[42] = 11'h24c;
    stim[43] = 11'h2ea;
    stim[44] = 11'h31d;
    stim[45] = 11'h079;
    stim[46] = 11'h2f6;
    stim[47] = 11'h20d;
    stim[48] = 11'h0e5;
    stim[49] = 11'h21d;
    stim[50] = 11'h085;
    stim[51] = 11'h0e4;
    stim[52] = 11'h1f0;
    stim[53] = 11'h28b;
    stim[54] = 11'h0cc;
    stim[55] = 11'h03d;
    stim[56] = 11'h396;
    stim[57] = 11'h0a2;
    stim[58] = 11'h1d6;
    stim[59] = 11'h10c;
    stim[60] = 11'h0ec;
    stim[61] = 11'h0c1;
    stim[62] = 11'h160;
    stim[63] = 11'h313;
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
      expv[0] = 45'h000000000000;
      expv[1] = 45'h000000000000;
      expv[2] = 45'h000000000000;
      expv[3] = 45'h000000000000;
      expv[4] = 45'h000000000000;
      expv[5] = 45'h000000000000;
      expv[6] = 45'h000000000000;
      expv[7] = 45'h000000000000;
      expv[8] = 45'h000000000000;
      expv[9] = 45'h000000000000;
      expv[10] = 45'h000000000000;
      expv[11] = 45'h000000000000;
      expv[12] = 45'h000000010000;
      expv[13] = 45'h100e00010001;
      expv[14] = 45'h100e00010001;
      expv[15] = 45'h100e00010001;
      expv[16] = 45'h100e00010001;
      expv[17] = 45'h0ead00000000;
      expv[18] = 45'h0ead00000000;
      expv[19] = 45'h0dfd00000000;
      expv[20] = 45'h1df900000001;
      expv[21] = 45'h094a00000002;
      expv[22] = 45'h094a00000002;
      expv[23] = 45'h094a00000002;
      expv[24] = 45'h094a00000002;
      expv[25] = 45'h094a00000002;
      expv[26] = 45'h094a00000002;
      expv[27] = 45'h0adb00000000;
      expv[28] = 45'h1ba100000001;
      expv[29] = 45'h000000000000;
      expv[30] = 45'h000000000000;
      expv[31] = 45'h000000000000;
      expv[32] = 45'h000000000000;
      expv[33] = 45'h000000000000;
      expv[34] = 45'h000000000000;
      expv[35] = 45'h000000000000;
      expv[36] = 45'h000000000000;
      expv[37] = 45'h000000000000;
      expv[38] = 45'h000000000000;
      expv[39] = 45'h000000000000;
      expv[40] = 45'h000000000000;
      expv[41] = 45'h000a00000000;
      expv[42] = 45'h000a00000000;
      expv[43] = 45'h000a00000000;
      expv[44] = 45'h000a00000000;
      expv[45] = 45'h000a00000000;
      expv[46] = 45'h0a1100000000;
      expv[47] = 45'h0a1100000000;
      expv[48] = 45'h0a1100000000;
      expv[49] = 45'h01c100000000;
      expv[50] = 45'h01c100000000;
      expv[51] = 45'h017700000000;
      expv[52] = 45'h179e00000001;
      expv[53] = 45'h179e00000001;
      expv[54] = 45'h179e00000001;
      expv[55] = 45'h0e5800000000;
      expv[56] = 45'h185e00000001;
      expv[57] = 45'h185e00000001;
      expv[58] = 45'h0e4c00000000;
      expv[59] = 45'h0e4c00000000;
      expv[60] = 45'h0e4c00000000;
      expv[61] = 45'h0cc300020000;
      expv[62] = 45'h13da00020001;
      expv[63] = 45'h13da00020001;
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
