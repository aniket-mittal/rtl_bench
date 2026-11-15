// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035718 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .pxclk(in_vec[1:1]),
    .med_res(in_vec[0:0]),
    .video_data_latch(out_vec[22:22]),
    .hcnt(out_vec[21:12]),
    .vcnt(out_vec[11:3]),
    .href(out_vec[2:2]),
    .hsync(out_vec[1:1]),
    .vsync(out_vec[0:0])
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
    stim[1] = 3'h7;
    stim[2] = 3'h2;
    stim[3] = 3'h1;
    stim[4] = 3'h0;
    stim[5] = 3'h3;
    stim[6] = 3'h0;
    stim[7] = 3'h0;
    stim[8] = 3'h3;
    stim[9] = 3'h2;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h1;
    stim[13] = 3'h3;
    stim[14] = 3'h1;
    stim[15] = 3'h0;
    stim[16] = 3'h1;
    stim[17] = 3'h0;
    stim[18] = 3'h3;
    stim[19] = 3'h0;
    stim[20] = 3'h1;
    stim[21] = 3'h0;
    stim[22] = 3'h2;
    stim[23] = 3'h1;
    stim[24] = 3'h0;
    stim[25] = 3'h0;
    stim[26] = 3'h1;
    stim[27] = 3'h2;
    stim[28] = 3'h2;
    stim[29] = 3'h3;
    stim[30] = 3'h0;
    stim[31] = 3'h2;
    stim[32] = 3'h3;
    stim[33] = 3'h3;
    stim[34] = 3'h2;
    stim[35] = 3'h1;
    stim[36] = 3'h0;
    stim[37] = 3'h0;
    stim[38] = 3'h3;
    stim[39] = 3'h3;
    stim[40] = 3'h0;
    stim[41] = 3'h0;
    stim[42] = 3'h0;
    stim[43] = 3'h1;
    stim[44] = 3'h1;
    stim[45] = 3'h1;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h0;
    stim[49] = 3'h2;
    stim[50] = 3'h3;
    stim[51] = 3'h0;
    stim[52] = 3'h3;
    stim[53] = 3'h3;
    stim[54] = 3'h1;
    stim[55] = 3'h2;
    stim[56] = 3'h3;
    stim[57] = 3'h3;
    stim[58] = 3'h3;
    stim[59] = 3'h2;
    stim[60] = 3'h3;
    stim[61] = 3'h2;
    stim[62] = 3'h3;
    stim[63] = 3'h3;
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
      expv[0] = 23'h000000;
      expv[1] = 23'h000000;
      expv[2] = 23'h000000;
      expv[3] = 23'h000000;
      expv[4] = 23'h000000;
      expv[5] = 23'h400004;
      expv[6] = 23'h400004;
      expv[7] = 23'h400004;
      expv[8] = 23'h001004;
      expv[9] = 23'h001004;
      expv[10] = 23'h001004;
      expv[11] = 23'h001004;
      expv[12] = 23'h001004;
      expv[13] = 23'h402004;
      expv[14] = 23'h402004;
      expv[15] = 23'h402004;
      expv[16] = 23'h402004;
      expv[17] = 23'h402004;
      expv[18] = 23'h003004;
      expv[19] = 23'h003004;
      expv[20] = 23'h003004;
      expv[21] = 23'h003004;
      expv[22] = 23'h404004;
      expv[23] = 23'h404004;
      expv[24] = 23'h404004;
      expv[25] = 23'h404004;
      expv[26] = 23'h404004;
      expv[27] = 23'h005004;
      expv[28] = 23'h005004;
      expv[29] = 23'h005004;
      expv[30] = 23'h005004;
      expv[31] = 23'h406004;
      expv[32] = 23'h406004;
      expv[33] = 23'h406004;
      expv[34] = 23'h406004;
      expv[35] = 23'h406004;
      expv[36] = 23'h406004;
      expv[37] = 23'h406004;
      expv[38] = 23'h007004;
      expv[39] = 23'h007004;
      expv[40] = 23'h007004;
      expv[41] = 23'h007004;
      expv[42] = 23'h007004;
      expv[43] = 23'h007004;
      expv[44] = 23'h007004;
      expv[45] = 23'h007004;
      expv[46] = 23'h007004;
      expv[47] = 23'h007004;
      expv[48] = 23'h007004;
      expv[49] = 23'h408004;
      expv[50] = 23'h408004;
      expv[51] = 23'h408004;
      expv[52] = 23'h009004;
      expv[53] = 23'h009004;
      expv[54] = 23'h009004;
      expv[55] = 23'h40a004;
      expv[56] = 23'h40a004;
      expv[57] = 23'h40a004;
      expv[58] = 23'h40a004;
      expv[59] = 23'h40a004;
      expv[60] = 23'h40a004;
      expv[61] = 23'h40a004;
      expv[62] = 23'h40a004;
      expv[63] = 23'h40a004;
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
