// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033013 dut (
    .clk(clk),
    .RST_n(in_vec[8:8]),
    .Flt_n(in_vec[7:7]),
    .next_n(in_vec[6:6]),
    .prev_n(in_vec[5:5]),
    .ADC_MISO(in_vec[4:4]),
    .I2S_data(in_vec[3:3]),
    .I2S_ws(in_vec[2:2]),
    .I2S_sclk(in_vec[1:1]),
    .RX(in_vec[0:0]),
    .LED(out_vec[15:8]),
    .ADC_SS_n(out_vec[7:7]),
    .ADC_MOSI(out_vec[6:6]),
    .ADC_SCLK(out_vec[5:5]),
    .lft_PDM(out_vec[4:4]),
    .rght_PDM(out_vec[3:3]),
    .cmd_n(out_vec[2:2]),
    .sht_dwn(out_vec[1:1]),
    .TX(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h08b;
    stim[1] = 9'h001;
    stim[2] = 9'h149;
    stim[3] = 9'h190;
    stim[4] = 9'h16b;
    stim[5] = 9'h159;
    stim[6] = 9'h1d9;
    stim[7] = 9'h11a;
    stim[8] = 9'h14d;
    stim[9] = 9'h1bd;
    stim[10] = 9'h16b;
    stim[11] = 9'h168;
    stim[12] = 9'h188;
    stim[13] = 9'h19b;
    stim[14] = 9'h12c;
    stim[15] = 9'h1d4;
    stim[16] = 9'h1c5;
    stim[17] = 9'h161;
    stim[18] = 9'h1c2;
    stim[19] = 9'h138;
    stim[20] = 9'h1f5;
    stim[21] = 9'h1ba;
    stim[22] = 9'h19d;
    stim[23] = 9'h10a;
    stim[24] = 9'h12a;
    stim[25] = 9'h13e;
    stim[26] = 9'h11e;
    stim[27] = 9'h11b;
    stim[28] = 9'h1cb;
    stim[29] = 9'h1f5;
    stim[30] = 9'h1d4;
    stim[31] = 9'h19f;
    stim[32] = 9'h1fc;
    stim[33] = 9'h17f;
    stim[34] = 9'h1ef;
    stim[35] = 9'h1f3;
    stim[36] = 9'h137;
    stim[37] = 9'h12f;
    stim[38] = 9'h170;
    stim[39] = 9'h140;
    stim[40] = 9'h161;
    stim[41] = 9'h128;
    stim[42] = 9'h1e3;
    stim[43] = 9'h116;
    stim[44] = 9'h157;
    stim[45] = 9'h141;
    stim[46] = 9'h148;
    stim[47] = 9'h1e8;
    stim[48] = 9'h126;
    stim[49] = 9'h110;
    stim[50] = 9'h145;
    stim[51] = 9'h151;
    stim[52] = 9'h118;
    stim[53] = 9'h1e4;
    stim[54] = 9'h1b5;
    stim[55] = 9'h112;
    stim[56] = 9'h184;
    stim[57] = 9'h12f;
    stim[58] = 9'h109;
    stim[59] = 9'h1d1;
    stim[60] = 9'h12c;
    stim[61] = 9'h1fc;
    stim[62] = 9'h100;
    stim[63] = 9'h1a7;
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
      expv[0] = 16'h0085;
      expv[1] = 16'h0085;
      expv[2] = 16'h0085;
      expv[3] = 16'h0085;
      expv[4] = 16'h0085;
      expv[5] = 16'h0085;
      expv[6] = 16'h0085;
      expv[7] = 16'h0085;
      expv[8] = 16'h0085;
      expv[9] = 16'h0085;
      expv[10] = 16'h0085;
      expv[11] = 16'h0085;
      expv[12] = 16'h0085;
      expv[13] = 16'h0085;
      expv[14] = 16'h0085;
      expv[15] = 16'h0085;
      expv[16] = 16'h0085;
      expv[17] = 16'h0085;
      expv[18] = 16'h0085;
      expv[19] = 16'h0085;
      expv[20] = 16'h0085;
      expv[21] = 16'h0085;
      expv[22] = 16'h0085;
      expv[23] = 16'h0085;
      expv[24] = 16'h0085;
      expv[25] = 16'h0085;
      expv[26] = 16'h0085;
      expv[27] = 16'h0085;
      expv[28] = 16'h0085;
      expv[29] = 16'h0085;
      expv[30] = 16'h0085;
      expv[31] = 16'h0085;
      expv[32] = 16'h0085;
      expv[33] = 16'h0085;
      expv[34] = 16'h0085;
      expv[35] = 16'h0085;
      expv[36] = 16'h0085;
      expv[37] = 16'h0085;
      expv[38] = 16'h0085;
      expv[39] = 16'h0085;
      expv[40] = 16'h0085;
      expv[41] = 16'h0085;
      expv[42] = 16'h0085;
      expv[43] = 16'h0085;
      expv[44] = 16'h0085;
      expv[45] = 16'h0085;
      expv[46] = 16'h0085;
      expv[47] = 16'h0085;
      expv[48] = 16'h0085;
      expv[49] = 16'h0085;
      expv[50] = 16'h0085;
      expv[51] = 16'h0085;
      expv[52] = 16'h0085;
      expv[53] = 16'h0085;
      expv[54] = 16'h0085;
      expv[55] = 16'h0085;
      expv[56] = 16'h0085;
      expv[57] = 16'h0085;
      expv[58] = 16'h0085;
      expv[59] = 16'h0085;
      expv[60] = 16'h0085;
      expv[61] = 16'h0085;
      expv[62] = 16'h0085;
      expv[63] = 16'h0085;
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
