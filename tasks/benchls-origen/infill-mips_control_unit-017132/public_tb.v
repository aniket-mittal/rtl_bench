// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017132 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .wreg(out_vec[8:8]),
    .m2reg(out_vec[7:7]),
    .wmem(out_vec[6:6]),
    .aluc(out_vec[5:2]),
    .aluimm(out_vec[1:1]),
    .regrt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h30d;
    stim[1] = 12'hebb;
    stim[2] = 12'ha0f;
    stim[3] = 12'h684;
    stim[4] = 12'h1e7;
    stim[5] = 12'h9e5;
    stim[6] = 12'h647;
    stim[7] = 12'h2ce;
    stim[8] = 12'h36e;
    stim[9] = 12'hdbf;
    stim[10] = 12'h049;
    stim[11] = 12'h94d;
    stim[12] = 12'h2e5;
    stim[13] = 12'hbe6;
    stim[14] = 12'h356;
    stim[15] = 12'h4f7;
    stim[16] = 12'hbea;
    stim[17] = 12'h999;
    stim[18] = 12'h1e7;
    stim[19] = 12'he21;
    stim[20] = 12'h255;
    stim[21] = 12'h0d2;
    stim[22] = 12'h735;
    stim[23] = 12'h418;
    stim[24] = 12'h2aa;
    stim[25] = 12'hacd;
    stim[26] = 12'h7ea;
    stim[27] = 12'haaf;
    stim[28] = 12'h3cf;
    stim[29] = 12'ha43;
    stim[30] = 12'ha9d;
    stim[31] = 12'h426;
    stim[32] = 12'h699;
    stim[33] = 12'hfe3;
    stim[34] = 12'h36a;
    stim[35] = 12'h8b0;
    stim[36] = 12'h625;
    stim[37] = 12'hda3;
    stim[38] = 12'hacd;
    stim[39] = 12'h7ec;
    stim[40] = 12'h81a;
    stim[41] = 12'hff7;
    stim[42] = 12'hdd8;
    stim[43] = 12'h476;
    stim[44] = 12'h9b4;
    stim[45] = 12'hfc6;
    stim[46] = 12'h85d;
    stim[47] = 12'h12c;
    stim[48] = 12'h1f8;
    stim[49] = 12'h1ab;
    stim[50] = 12'hcab;
    stim[51] = 12'h944;
    stim[52] = 12'h80a;
    stim[53] = 12'hcf1;
    stim[54] = 12'ha7d;
    stim[55] = 12'h40f;
    stim[56] = 12'h908;
    stim[57] = 12'h66d;
    stim[58] = 12'h0a9;
    stim[59] = 12'h6be;
    stim[60] = 12'hb74;
    stim[61] = 12'h2a6;
    stim[62] = 12'hc7d;
    stim[63] = 12'hb52;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h0xx;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h0xx;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
