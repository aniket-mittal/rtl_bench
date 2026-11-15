// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131378 dut (
    .clk(clk),
    .clk_ena(in_vec[2:2]),
    .in_stream(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .pipeline_reg_0(out_vec[16:16]),
    .pipeline_reg_1(out_vec[15:15]),
    .pipeline_reg_2(out_vec[14:14]),
    .pipeline_reg_3(out_vec[13:13]),
    .pipeline_reg_4(out_vec[12:12]),
    .pipeline_reg_5(out_vec[11:11]),
    .pipeline_reg_6(out_vec[10:10]),
    .pipeline_reg_7(out_vec[9:9]),
    .pipeline_reg_8(out_vec[8:8]),
    .pipeline_reg_9(out_vec[7:7]),
    .pipeline_reg_10(out_vec[6:6]),
    .pipeline_reg_11(out_vec[5:5]),
    .pipeline_reg_12(out_vec[4:4]),
    .pipeline_reg_13(out_vec[3:3]),
    .pipeline_reg_14(out_vec[2:2]),
    .pipeline_reg_15(out_vec[1:1]),
    .pipeline_reg_16(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h1;
    stim[2] = 3'h2;
    stim[3] = 3'h6;
    stim[4] = 3'h0;
    stim[5] = 3'h4;
    stim[6] = 3'h4;
    stim[7] = 3'h6;
    stim[8] = 3'h2;
    stim[9] = 3'h6;
    stim[10] = 3'h6;
    stim[11] = 3'h2;
    stim[12] = 3'h0;
    stim[13] = 3'h4;
    stim[14] = 3'h2;
    stim[15] = 3'h0;
    stim[16] = 3'h6;
    stim[17] = 3'h2;
    stim[18] = 3'h6;
    stim[19] = 3'h0;
    stim[20] = 3'h0;
    stim[21] = 3'h0;
    stim[22] = 3'h6;
    stim[23] = 3'h4;
    stim[24] = 3'h4;
    stim[25] = 3'h1;
    stim[26] = 3'h0;
    stim[27] = 3'h2;
    stim[28] = 3'h4;
    stim[29] = 3'h0;
    stim[30] = 3'h2;
    stim[31] = 3'h2;
    stim[32] = 3'h6;
    stim[33] = 3'h0;
    stim[34] = 3'h4;
    stim[35] = 3'h2;
    stim[36] = 3'h0;
    stim[37] = 3'h0;
    stim[38] = 3'h4;
    stim[39] = 3'h6;
    stim[40] = 3'h2;
    stim[41] = 3'h6;
    stim[42] = 3'h4;
    stim[43] = 3'h1;
    stim[44] = 3'h2;
    stim[45] = 3'h0;
    stim[46] = 3'h4;
    stim[47] = 3'h0;
    stim[48] = 3'h4;
    stim[49] = 3'h2;
    stim[50] = 3'h2;
    stim[51] = 3'h6;
    stim[52] = 3'h4;
    stim[53] = 3'h6;
    stim[54] = 3'h2;
    stim[55] = 3'h0;
    stim[56] = 3'h4;
    stim[57] = 3'h2;
    stim[58] = 3'h2;
    stim[59] = 3'h0;
    stim[60] = 3'h2;
    stim[61] = 3'h4;
    stim[62] = 3'h6;
    stim[63] = 3'h0;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h10000;
      expv[5] = 17'h10000;
      expv[6] = 17'h08000;
      expv[7] = 17'h04000;
      expv[8] = 17'h12000;
      expv[9] = 17'h12000;
      expv[10] = 17'h19000;
      expv[11] = 17'h1c800;
      expv[12] = 17'h1c800;
      expv[13] = 17'h1c800;
      expv[14] = 17'h0e400;
      expv[15] = 17'h0e400;
      expv[16] = 17'h0e400;
      expv[17] = 17'h17200;
      expv[18] = 17'h17200;
      expv[19] = 17'h1b900;
      expv[20] = 17'h1b900;
      expv[21] = 17'h1b900;
      expv[22] = 17'h1b900;
      expv[23] = 17'h1dc80;
      expv[24] = 17'h0ee40;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h10000;
      expv[34] = 17'h10000;
      expv[35] = 17'h08000;
      expv[36] = 17'h08000;
      expv[37] = 17'h08000;
      expv[38] = 17'h08000;
      expv[39] = 17'h04000;
      expv[40] = 17'h12000;
      expv[41] = 17'h12000;
      expv[42] = 17'h19000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h10000;
      expv[53] = 17'h08000;
      expv[54] = 17'h14000;
      expv[55] = 17'h14000;
      expv[56] = 17'h14000;
      expv[57] = 17'h0a000;
      expv[58] = 17'h0a000;
      expv[59] = 17'h0a000;
      expv[60] = 17'h0a000;
      expv[61] = 17'h0a000;
      expv[62] = 17'h05000;
      expv[63] = 17'h12800;
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
