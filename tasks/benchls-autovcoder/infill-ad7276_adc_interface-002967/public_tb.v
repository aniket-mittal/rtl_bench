// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002967 dut (
    .clk(clk),
    .rstn(in_vec[1:1]),
    .ad7276_sdata(in_vec[0:0]),
    .ad7276_csn(out_vec[14:14]),
    .ad7276_sclk(out_vec[13:13]),
    .adc_data_en(out_vec[12:12]),
    .adc_data(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h0;
    stim[2] = 2'h3;
    stim[3] = 2'h2;
    stim[4] = 2'h3;
    stim[5] = 2'h2;
    stim[6] = 2'h2;
    stim[7] = 2'h2;
    stim[8] = 2'h2;
    stim[9] = 2'h2;
    stim[10] = 2'h2;
    stim[11] = 2'h3;
    stim[12] = 2'h2;
    stim[13] = 2'h2;
    stim[14] = 2'h2;
    stim[15] = 2'h2;
    stim[16] = 2'h3;
    stim[17] = 2'h3;
    stim[18] = 2'h2;
    stim[19] = 2'h3;
    stim[20] = 2'h2;
    stim[21] = 2'h3;
    stim[22] = 2'h2;
    stim[23] = 2'h2;
    stim[24] = 2'h3;
    stim[25] = 2'h3;
    stim[26] = 2'h2;
    stim[27] = 2'h2;
    stim[28] = 2'h2;
    stim[29] = 2'h3;
    stim[30] = 2'h2;
    stim[31] = 2'h3;
    stim[32] = 2'h2;
    stim[33] = 2'h3;
    stim[34] = 2'h3;
    stim[35] = 2'h2;
    stim[36] = 2'h3;
    stim[37] = 2'h2;
    stim[38] = 2'h3;
    stim[39] = 2'h2;
    stim[40] = 2'h2;
    stim[41] = 2'h3;
    stim[42] = 2'h3;
    stim[43] = 2'h2;
    stim[44] = 2'h3;
    stim[45] = 2'h2;
    stim[46] = 2'h3;
    stim[47] = 2'h2;
    stim[48] = 2'h2;
    stim[49] = 2'h2;
    stim[50] = 2'h3;
    stim[51] = 2'h3;
    stim[52] = 2'h2;
    stim[53] = 2'h3;
    stim[54] = 2'h2;
    stim[55] = 2'h3;
    stim[56] = 2'h2;
    stim[57] = 2'h3;
    stim[58] = 2'h2;
    stim[59] = 2'h3;
    stim[60] = 2'h3;
    stim[61] = 2'h2;
    stim[62] = 2'h2;
    stim[63] = 2'h2;
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
      expv[0] = 15'h6000;
      expv[1] = 15'h6000;
      expv[2] = 15'h6000;
      expv[3] = 15'h6000;
      expv[4] = 15'h2000;
      expv[5] = 15'h0000;
      expv[6] = 15'h2000;
      expv[7] = 15'h0000;
      expv[8] = 15'h2000;
      expv[9] = 15'h0000;
      expv[10] = 15'h2000;
      expv[11] = 15'h0000;
      expv[12] = 15'h2000;
      expv[13] = 15'h0000;
      expv[14] = 15'h2000;
      expv[15] = 15'h0000;
      expv[16] = 15'h2000;
      expv[17] = 15'h0000;
      expv[18] = 15'h2000;
      expv[19] = 15'h0000;
      expv[20] = 15'h2000;
      expv[21] = 15'h0000;
      expv[22] = 15'h2000;
      expv[23] = 15'h0000;
      expv[24] = 15'h2000;
      expv[25] = 15'h0000;
      expv[26] = 15'h2000;
      expv[27] = 15'h0000;
      expv[28] = 15'h2000;
      expv[29] = 15'h0000;
      expv[30] = 15'h2000;
      expv[31] = 15'h0000;
      expv[32] = 15'h6000;
      expv[33] = 15'h7088;
      expv[34] = 15'h6088;
      expv[35] = 15'h6088;
      expv[36] = 15'h2088;
      expv[37] = 15'h0088;
      expv[38] = 15'h2088;
      expv[39] = 15'h0088;
      expv[40] = 15'h2088;
      expv[41] = 15'h0088;
      expv[42] = 15'h2088;
      expv[43] = 15'h0088;
      expv[44] = 15'h2088;
      expv[45] = 15'h0088;
      expv[46] = 15'h2088;
      expv[47] = 15'h0088;
      expv[48] = 15'h2088;
      expv[49] = 15'h0088;
      expv[50] = 15'h2088;
      expv[51] = 15'h0088;
      expv[52] = 15'h2088;
      expv[53] = 15'h0088;
      expv[54] = 15'h2088;
      expv[55] = 15'h0088;
      expv[56] = 15'h2088;
      expv[57] = 15'h0088;
      expv[58] = 15'h2088;
      expv[59] = 15'h0088;
      expv[60] = 15'h2088;
      expv[61] = 15'h0088;
      expv[62] = 15'h2088;
      expv[63] = 15'h0088;
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
