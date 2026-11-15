// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02814 dut (
    .pxl_clk(clk),
    .reset_n(in_vec[0:0]),
    .hcount(out_vec[21:12]),
    .vcount(out_vec[11:2]),
    .vsync(out_vec[1:1]),
    .hsync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h0;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 22'h000003;
      expv[1] = 22'h000003;
      expv[2] = 22'h000003;
      expv[3] = 22'h001003;
      expv[4] = 22'h002003;
      expv[5] = 22'h003003;
      expv[6] = 22'h004003;
      expv[7] = 22'h005003;
      expv[8] = 22'h006003;
      expv[9] = 22'h000003;
      expv[10] = 22'h000003;
      expv[11] = 22'h001003;
      expv[12] = 22'h002003;
      expv[13] = 22'h003003;
      expv[14] = 22'h004003;
      expv[15] = 22'h005003;
      expv[16] = 22'h006003;
      expv[17] = 22'h007003;
      expv[18] = 22'h008003;
      expv[19] = 22'h009003;
      expv[20] = 22'h00a003;
      expv[21] = 22'h000003;
      expv[22] = 22'h000003;
      expv[23] = 22'h001003;
      expv[24] = 22'h002003;
      expv[25] = 22'h003003;
      expv[26] = 22'h004003;
      expv[27] = 22'h005003;
      expv[28] = 22'h006003;
      expv[29] = 22'h007003;
      expv[30] = 22'h008003;
      expv[31] = 22'h009003;
      expv[32] = 22'h00a003;
      expv[33] = 22'h00b003;
      expv[34] = 22'h00c003;
      expv[35] = 22'h00d003;
      expv[36] = 22'h00e003;
      expv[37] = 22'h00f003;
      expv[38] = 22'h010003;
      expv[39] = 22'h011003;
      expv[40] = 22'h012003;
      expv[41] = 22'h013003;
      expv[42] = 22'h014003;
      expv[43] = 22'h015003;
      expv[44] = 22'h016003;
      expv[45] = 22'h017003;
      expv[46] = 22'h018003;
      expv[47] = 22'h019003;
      expv[48] = 22'h01a003;
      expv[49] = 22'h01b003;
      expv[50] = 22'h01c003;
      expv[51] = 22'h01d003;
      expv[52] = 22'h01e003;
      expv[53] = 22'h01f003;
      expv[54] = 22'h020003;
      expv[55] = 22'h021003;
      expv[56] = 22'h022003;
      expv[57] = 22'h023003;
      expv[58] = 22'h024003;
      expv[59] = 22'h025003;
      expv[60] = 22'h026003;
      expv[61] = 22'h027003;
      expv[62] = 22'h028003;
      expv[63] = 22'h029003;
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
