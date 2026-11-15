// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05121 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4c1;
    stim[1] = 11'h1bf;
    stim[2] = 11'h27e;
    stim[3] = 11'h016;
    stim[4] = 11'h018;
    stim[5] = 11'h6f4;
    stim[6] = 11'h6d6;
    stim[7] = 11'h066;
    stim[8] = 11'h3d4;
    stim[9] = 11'h75e;
    stim[10] = 11'h212;
    stim[11] = 11'h6a6;
    stim[12] = 11'h2b8;
    stim[13] = 11'h15e;
    stim[14] = 11'h1f4;
    stim[15] = 11'h76a;
    stim[16] = 11'h1ca;
    stim[17] = 11'h4d4;
    stim[18] = 11'h72e;
    stim[19] = 11'h1fe;
    stim[20] = 11'h328;
    stim[21] = 11'h11e;
    stim[22] = 11'h482;
    stim[23] = 11'h324;
    stim[24] = 11'h3b6;
    stim[25] = 11'h69e;
    stim[26] = 11'h0ee;
    stim[27] = 11'h7f4;
    stim[28] = 11'h648;
    stim[29] = 11'h184;
    stim[30] = 11'h2ae;
    stim[31] = 11'h384;
    stim[32] = 11'h190;
    stim[33] = 11'h52c;
    stim[34] = 11'h7aa;
    stim[35] = 11'h046;
    stim[36] = 11'h4f4;
    stim[37] = 11'h724;
    stim[38] = 11'h648;
    stim[39] = 11'h0b4;
    stim[40] = 11'h3f2;
    stim[41] = 11'h106;
    stim[42] = 11'h00e;
    stim[43] = 11'h576;
    stim[44] = 11'h438;
    stim[45] = 11'h55a;
    stim[46] = 11'h3fa;
    stim[47] = 11'h41a;
    stim[48] = 11'h4b6;
    stim[49] = 11'h23c;
    stim[50] = 11'h28e;
    stim[51] = 11'h1e8;
    stim[52] = 11'h7a2;
    stim[53] = 11'h59a;
    stim[54] = 11'h0fc;
    stim[55] = 11'h000;
    stim[56] = 11'h234;
    stim[57] = 11'h1d8;
    stim[58] = 11'h4e2;
    stim[59] = 11'h21e;
    stim[60] = 11'h1ba;
    stim[61] = 11'h45a;
    stim[62] = 11'h21a;
    stim[63] = 11'h654;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h002;
      expv[5] = 10'h002;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h378;
      expv[12] = 10'h378;
      expv[13] = 10'h378;
      expv[14] = 10'h378;
      expv[15] = 10'h378;
      expv[16] = 10'h1e8;
      expv[17] = 10'h0f8;
      expv[18] = 10'h0f8;
      expv[19] = 10'h0f8;
      expv[20] = 10'h0f8;
      expv[21] = 10'h0f8;
      expv[22] = 10'h0f8;
      expv[23] = 10'h268;
      expv[24] = 10'h268;
      expv[25] = 10'h268;
      expv[26] = 10'h268;
      expv[27] = 10'h268;
      expv[28] = 10'h268;
      expv[29] = 10'h268;
      expv[30] = 10'h268;
      expv[31] = 10'h268;
      expv[32] = 10'h268;
      expv[33] = 10'h268;
      expv[34] = 10'h268;
      expv[35] = 10'h190;
      expv[36] = 10'h190;
      expv[37] = 10'h190;
      expv[38] = 10'h190;
      expv[39] = 10'h190;
      expv[40] = 10'h190;
      expv[41] = 10'h3f8;
      expv[42] = 10'h3f8;
      expv[43] = 10'h3f8;
      expv[44] = 10'h3f8;
      expv[45] = 10'h3f8;
      expv[46] = 10'h0c0;
      expv[47] = 10'h1c0;
      expv[48] = 10'h294;
      expv[49] = 10'h294;
      expv[50] = 10'h294;
      expv[51] = 10'h294;
      expv[52] = 10'h294;
      expv[53] = 10'h278;
      expv[54] = 10'h390;
      expv[55] = 10'h390;
      expv[56] = 10'h390;
      expv[57] = 10'h390;
      expv[58] = 10'h390;
      expv[59] = 10'h058;
      expv[60] = 10'h058;
      expv[61] = 10'h11c;
      expv[62] = 10'h07c;
      expv[63] = 10'h118;
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
