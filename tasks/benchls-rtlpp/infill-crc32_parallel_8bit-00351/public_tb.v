// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00351 dut (
    .clock(clk),
    .nrst(in_vec[9:9]),
    .enable(in_vec[8:8]),
    .din(in_vec[7:0]),
    .crc_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h38c;
    stim[1] = 10'h3ac;
    stim[2] = 10'h044;
    stim[3] = 10'h050;
    stim[4] = 10'h05e;
    stim[5] = 10'h145;
    stim[6] = 10'h079;
    stim[7] = 10'h199;
    stim[8] = 10'h041;
    stim[9] = 10'h034;
    stim[10] = 10'h15d;
    stim[11] = 10'h0d6;
    stim[12] = 10'h1fb;
    stim[13] = 10'h1c9;
    stim[14] = 10'h0bd;
    stim[15] = 10'h12b;
    stim[16] = 10'h03e;
    stim[17] = 10'h05d;
    stim[18] = 10'h0f0;
    stim[19] = 10'h04f;
    stim[20] = 10'h0fb;
    stim[21] = 10'h08a;
    stim[22] = 10'h028;
    stim[23] = 10'h0e6;
    stim[24] = 10'h006;
    stim[25] = 10'h0a7;
    stim[26] = 10'h020;
    stim[27] = 10'h10f;
    stim[28] = 10'h0eb;
    stim[29] = 10'h033;
    stim[30] = 10'h196;
    stim[31] = 10'h15b;
    stim[32] = 10'h028;
    stim[33] = 10'h1cf;
    stim[34] = 10'h125;
    stim[35] = 10'h020;
    stim[36] = 10'h121;
    stim[37] = 10'h107;
    stim[38] = 10'h126;
    stim[39] = 10'h137;
    stim[40] = 10'h01a;
    stim[41] = 10'h04f;
    stim[42] = 10'h0bb;
    stim[43] = 10'h0e6;
    stim[44] = 10'h127;
    stim[45] = 10'h12d;
    stim[46] = 10'h07f;
    stim[47] = 10'h082;
    stim[48] = 10'h0cb;
    stim[49] = 10'h133;
    stim[50] = 10'h04c;
    stim[51] = 10'h1c0;
    stim[52] = 10'h0de;
    stim[53] = 10'h1e1;
    stim[54] = 10'h08d;
    stim[55] = 10'h1b9;
    stim[56] = 10'h0de;
    stim[57] = 10'h04b;
    stim[58] = 10'h113;
    stim[59] = 10'h07f;
    stim[60] = 10'h09e;
    stim[61] = 10'h144;
    stim[62] = 10'h102;
    stim[63] = 10'h12c;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
