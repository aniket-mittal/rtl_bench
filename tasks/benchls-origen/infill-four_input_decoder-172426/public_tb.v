// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172426 dut (
    .x0(in_vec[3:3]),
    .x1(in_vec[2:2]),
    .x2(in_vec[1:1]),
    .x3(in_vec[0:0]),
    .z0(out_vec[9:9]),
    .z1(out_vec[8:8]),
    .z2(out_vec[7:7]),
    .z3(out_vec[6:6]),
    .z4(out_vec[5:5]),
    .z5(out_vec[4:4]),
    .z6(out_vec[3:3]),
    .z7(out_vec[2:2]),
    .z8(out_vec[1:1]),
    .z9(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h9;
    stim[1] = 4'hb;
    stim[2] = 4'h5;
    stim[3] = 4'h1;
    stim[4] = 4'h4;
    stim[5] = 4'h2;
    stim[6] = 4'h6;
    stim[7] = 4'h0;
    stim[8] = 4'hd;
    stim[9] = 4'h3;
    stim[10] = 4'h6;
    stim[11] = 4'hb;
    stim[12] = 4'hd;
    stim[13] = 4'h8;
    stim[14] = 4'hc;
    stim[15] = 4'h2;
    stim[16] = 4'h2;
    stim[17] = 4'h4;
    stim[18] = 4'h8;
    stim[19] = 4'h0;
    stim[20] = 4'h2;
    stim[21] = 4'hb;
    stim[22] = 4'h6;
    stim[23] = 4'h1;
    stim[24] = 4'he;
    stim[25] = 4'hd;
    stim[26] = 4'hd;
    stim[27] = 4'h1;
    stim[28] = 4'h5;
    stim[29] = 4'hc;
    stim[30] = 4'h2;
    stim[31] = 4'hc;
    stim[32] = 4'h0;
    stim[33] = 4'h6;
    stim[34] = 4'hf;
    stim[35] = 4'hc;
    stim[36] = 4'h2;
    stim[37] = 4'hd;
    stim[38] = 4'h4;
    stim[39] = 4'hd;
    stim[40] = 4'hb;
    stim[41] = 4'h9;
    stim[42] = 4'h2;
    stim[43] = 4'hd;
    stim[44] = 4'h2;
    stim[45] = 4'he;
    stim[46] = 4'h4;
    stim[47] = 4'h2;
    stim[48] = 4'h2;
    stim[49] = 4'hc;
    stim[50] = 4'he;
    stim[51] = 4'hc;
    stim[52] = 4'h1;
    stim[53] = 4'he;
    stim[54] = 4'h5;
    stim[55] = 4'h7;
    stim[56] = 4'h3;
    stim[57] = 4'h4;
    stim[58] = 4'hc;
    stim[59] = 4'h3;
    stim[60] = 4'h0;
    stim[61] = 4'hd;
    stim[62] = 4'hf;
    stim[63] = 4'h1;
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
      expv[0] = 10'h000;
      expv[1] = 10'h100;
      expv[2] = 10'h000;
      expv[3] = 10'h005;
      expv[4] = 10'h001;
      expv[5] = 10'h210;
      expv[6] = 10'h041;
      expv[7] = 10'h200;
      expv[8] = 10'h000;
      expv[9] = 10'h005;
      expv[10] = 10'h041;
      expv[11] = 10'h100;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h210;
      expv[16] = 10'h210;
      expv[17] = 10'h001;
      expv[18] = 10'h000;
      expv[19] = 10'h200;
      expv[20] = 10'h210;
      expv[21] = 10'h100;
      expv[22] = 10'h041;
      expv[23] = 10'h005;
      expv[24] = 10'h040;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h005;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h210;
      expv[31] = 10'h000;
      expv[32] = 10'h200;
      expv[33] = 10'h041;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h210;
      expv[37] = 10'h000;
      expv[38] = 10'h001;
      expv[39] = 10'h000;
      expv[40] = 10'h100;
      expv[41] = 10'h000;
      expv[42] = 10'h210;
      expv[43] = 10'h000;
      expv[44] = 10'h210;
      expv[45] = 10'h040;
      expv[46] = 10'h001;
      expv[47] = 10'h210;
      expv[48] = 10'h210;
      expv[49] = 10'h000;
      expv[50] = 10'h040;
      expv[51] = 10'h000;
      expv[52] = 10'h005;
      expv[53] = 10'h040;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h005;
      expv[57] = 10'h001;
      expv[58] = 10'h000;
      expv[59] = 10'h005;
      expv[60] = 10'h200;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h005;
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
