// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116527 dut (
    .clk50m(clk),
    .rst_n(in_vec[1:1]),
    .crc_start(in_vec[0:0]),
    .mem_addr_out(out_vec[11:2]),
    .crc_en(out_vec[1:1]),
    .crc_rdy(out_vec[0:0])
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
    stim[1] = 2'h1;
    stim[2] = 2'h3;
    stim[3] = 2'h2;
    stim[4] = 2'h3;
    stim[5] = 2'h2;
    stim[6] = 2'h2;
    stim[7] = 2'h2;
    stim[8] = 2'h3;
    stim[9] = 2'h3;
    stim[10] = 2'h3;
    stim[11] = 2'h3;
    stim[12] = 2'h2;
    stim[13] = 2'h3;
    stim[14] = 2'h0;
    stim[15] = 2'h3;
    stim[16] = 2'h3;
    stim[17] = 2'h2;
    stim[18] = 2'h3;
    stim[19] = 2'h3;
    stim[20] = 2'h2;
    stim[21] = 2'h2;
    stim[22] = 2'h3;
    stim[23] = 2'h3;
    stim[24] = 2'h2;
    stim[25] = 2'h2;
    stim[26] = 2'h2;
    stim[27] = 2'h3;
    stim[28] = 2'h2;
    stim[29] = 2'h3;
    stim[30] = 2'h3;
    stim[31] = 2'h3;
    stim[32] = 2'h3;
    stim[33] = 2'h1;
    stim[34] = 2'h2;
    stim[35] = 2'h2;
    stim[36] = 2'h2;
    stim[37] = 2'h3;
    stim[38] = 2'h2;
    stim[39] = 2'h3;
    stim[40] = 2'h3;
    stim[41] = 2'h3;
    stim[42] = 2'h2;
    stim[43] = 2'h3;
    stim[44] = 2'h2;
    stim[45] = 2'h3;
    stim[46] = 2'h3;
    stim[47] = 2'h2;
    stim[48] = 2'h2;
    stim[49] = 2'h2;
    stim[50] = 2'h3;
    stim[51] = 2'h2;
    stim[52] = 2'h2;
    stim[53] = 2'h3;
    stim[54] = 2'h2;
    stim[55] = 2'h3;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h2;
    stim[59] = 2'h2;
    stim[60] = 2'h3;
    stim[61] = 2'h2;
    stim[62] = 2'h3;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h002;
      expv[6] = 12'h004;
      expv[7] = 12'h004;
      expv[8] = 12'h006;
      expv[9] = 12'h008;
      expv[10] = 12'h008;
      expv[11] = 12'h00a;
      expv[12] = 12'h00c;
      expv[13] = 12'h00c;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h002;
      expv[19] = 12'h004;
      expv[20] = 12'h004;
      expv[21] = 12'h006;
      expv[22] = 12'h008;
      expv[23] = 12'h008;
      expv[24] = 12'h00a;
      expv[25] = 12'h00c;
      expv[26] = 12'h00c;
      expv[27] = 12'h00e;
      expv[28] = 12'h010;
      expv[29] = 12'h010;
      expv[30] = 12'h012;
      expv[31] = 12'h014;
      expv[32] = 12'h014;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h002;
      expv[41] = 12'h004;
      expv[42] = 12'h004;
      expv[43] = 12'h006;
      expv[44] = 12'h008;
      expv[45] = 12'h008;
      expv[46] = 12'h00a;
      expv[47] = 12'h00c;
      expv[48] = 12'h00c;
      expv[49] = 12'h00e;
      expv[50] = 12'h010;
      expv[51] = 12'h010;
      expv[52] = 12'h012;
      expv[53] = 12'h014;
      expv[54] = 12'h014;
      expv[55] = 12'h016;
      expv[56] = 12'h018;
      expv[57] = 12'h018;
      expv[58] = 12'h01a;
      expv[59] = 12'h01c;
      expv[60] = 12'h01c;
      expv[61] = 12'h01e;
      expv[62] = 12'h020;
      expv[63] = 12'h020;
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
