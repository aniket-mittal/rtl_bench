// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202408 dut (
    .CLOCK_50MHz(clk),
    .RESET_n(in_vec[2:2]),
    .ADC_OUT(in_vec[1:0]),
    .ADC_CNVST(out_vec[23:23]),
    .ADC_CS_N(out_vec[22:22]),
    .ADC_REFSEL(out_vec[21:21]),
    .ADC_SCLK(out_vec[20:20]),
    .ADC_SD(out_vec[19:19]),
    .ADC_UB(out_vec[18:18]),
    .ADC_SEL(out_vec[17:17]),
    .BUSY(out_vec[16:16]),
    .DATA_AD0(out_vec[15:8]),
    .DATA_AD1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h0;
    stim[1] = 3'h3;
    stim[2] = 3'h6;
    stim[3] = 3'h7;
    stim[4] = 3'h6;
    stim[5] = 3'h4;
    stim[6] = 3'h4;
    stim[7] = 3'h4;
    stim[8] = 3'h7;
    stim[9] = 3'h4;
    stim[10] = 3'h5;
    stim[11] = 3'h7;
    stim[12] = 3'h5;
    stim[13] = 3'h6;
    stim[14] = 3'h5;
    stim[15] = 3'h5;
    stim[16] = 3'h6;
    stim[17] = 3'h5;
    stim[18] = 3'h4;
    stim[19] = 3'h7;
    stim[20] = 3'h5;
    stim[21] = 3'h4;
    stim[22] = 3'h6;
    stim[23] = 3'h6;
    stim[24] = 3'h7;
    stim[25] = 3'h4;
    stim[26] = 3'h5;
    stim[27] = 3'h6;
    stim[28] = 3'h5;
    stim[29] = 3'h7;
    stim[30] = 3'h4;
    stim[31] = 3'h5;
    stim[32] = 3'h6;
    stim[33] = 3'h6;
    stim[34] = 3'h7;
    stim[35] = 3'h5;
    stim[36] = 3'h6;
    stim[37] = 3'h7;
    stim[38] = 3'h5;
    stim[39] = 3'h6;
    stim[40] = 3'h6;
    stim[41] = 3'h7;
    stim[42] = 3'h6;
    stim[43] = 3'h4;
    stim[44] = 3'h5;
    stim[45] = 3'h4;
    stim[46] = 3'h5;
    stim[47] = 3'h5;
    stim[48] = 3'h6;
    stim[49] = 3'h5;
    stim[50] = 3'h7;
    stim[51] = 3'h4;
    stim[52] = 3'h7;
    stim[53] = 3'h5;
    stim[54] = 3'h7;
    stim[55] = 3'h4;
    stim[56] = 3'h5;
    stim[57] = 3'h7;
    stim[58] = 3'h6;
    stim[59] = 3'h6;
    stim[60] = 3'h7;
    stim[61] = 3'h7;
    stim[62] = 3'h4;
    stim[63] = 3'h4;
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
      expv[0] = 24'h44xxxx;
      expv[1] = 24'h44xxxx;
      expv[2] = 24'h44xxxx;
      expv[3] = 24'h44xxxx;
      expv[4] = 24'h44xxxx;
      expv[5] = 24'h44xxxx;
      expv[6] = 24'h44xxxx;
      expv[7] = 24'h44xxxx;
      expv[8] = 24'h44xxxx;
      expv[9] = 24'h44xxxx;
      expv[10] = 24'h44xxxx;
      expv[11] = 24'h44xxxx;
      expv[12] = 24'h44xxxx;
      expv[13] = 24'h44xxxx;
      expv[14] = 24'h44xxxx;
      expv[15] = 24'h44xxxx;
      expv[16] = 24'h44xxxx;
      expv[17] = 24'h44xxxx;
      expv[18] = 24'h44xxxx;
      expv[19] = 24'h44xxxx;
      expv[20] = 24'h44xxxx;
      expv[21] = 24'h44xxxx;
      expv[22] = 24'h44xxxx;
      expv[23] = 24'h44xxxx;
      expv[24] = 24'h44xxxx;
      expv[25] = 24'h44xxxx;
      expv[26] = 24'h44xxxx;
      expv[27] = 24'h44xxxx;
      expv[28] = 24'h44xxxx;
      expv[29] = 24'h44xxxx;
      expv[30] = 24'h44xxxx;
      expv[31] = 24'h44xxxx;
      expv[32] = 24'h44xxxx;
      expv[33] = 24'h44xxxx;
      expv[34] = 24'h44xxxx;
      expv[35] = 24'h44xxxx;
      expv[36] = 24'h44xxxx;
      expv[37] = 24'h44xxxx;
      expv[38] = 24'h44xxxx;
      expv[39] = 24'h44xxxx;
      expv[40] = 24'h44xxxx;
      expv[41] = 24'h44xxxx;
      expv[42] = 24'h44xxxx;
      expv[43] = 24'h44xxxx;
      expv[44] = 24'h44xxxx;
      expv[45] = 24'h44xxxx;
      expv[46] = 24'h44xxxx;
      expv[47] = 24'h44xxxx;
      expv[48] = 24'h44xxxx;
      expv[49] = 24'h44xxxx;
      expv[50] = 24'h44xxxx;
      expv[51] = 24'h44xxxx;
      expv[52] = 24'h44xxxx;
      expv[53] = 24'h44xxxx;
      expv[54] = 24'h44xxxx;
      expv[55] = 24'h44xxxx;
      expv[56] = 24'h44xxxx;
      expv[57] = 24'h44xxxx;
      expv[58] = 24'h44xxxx;
      expv[59] = 24'h44xxxx;
      expv[60] = 24'h44xxxx;
      expv[61] = 24'h44xxxx;
      expv[62] = 24'h44xxxx;
      expv[63] = 24'h44xxxx;
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
