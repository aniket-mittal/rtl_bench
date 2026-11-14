// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198371 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .mul(in_vec[16:16]),
    .x(in_vec[15:8]),
    .y(in_vec[7:0]),
    .z_pos(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2fbbf;
    stim[1] = 18'h33e77;
    stim[2] = 18'h07185;
    stim[3] = 18'h058e0;
    stim[4] = 18'h073d7;
    stim[5] = 18'h174ea;
    stim[6] = 18'h0f383;
    stim[7] = 18'h117b8;
    stim[8] = 18'h13577;
    stim[9] = 18'h01d37;
    stim[10] = 18'h15caf;
    stim[11] = 18'h1391e;
    stim[12] = 18'h16d51;
    stim[13] = 18'h3788d;
    stim[14] = 18'h1b056;
    stim[15] = 18'h1a73a;
    stim[16] = 18'h1f7fc;
    stim[17] = 18'h0aa38;
    stim[18] = 18'h1266c;
    stim[19] = 18'h104f6;
    stim[20] = 18'h0c798;
    stim[21] = 18'h1dace;
    stim[22] = 18'h152ec;
    stim[23] = 18'h091d7;
    stim[24] = 18'h11163;
    stim[25] = 18'h006d4;
    stim[26] = 18'h18993;
    stim[27] = 18'h08fa8;
    stim[28] = 18'h1ce35;
    stim[29] = 18'h1eb8d;
    stim[30] = 18'h1c0a0;
    stim[31] = 18'h02cb5;
    stim[32] = 18'h08c30;
    stim[33] = 18'h0ea9d;
    stim[34] = 18'h1c0d2;
    stim[35] = 18'h1a337;
    stim[36] = 18'h15355;
    stim[37] = 18'h17a71;
    stim[38] = 18'h08be8;
    stim[39] = 18'h02833;
    stim[40] = 18'h01fbe;
    stim[41] = 18'h123e1;
    stim[42] = 18'h1433a;
    stim[43] = 18'h1bf36;
    stim[44] = 18'h0cdfe;
    stim[45] = 18'h180a4;
    stim[46] = 18'h0f5b0;
    stim[47] = 18'h0aa06;
    stim[48] = 18'h0a9a6;
    stim[49] = 18'h166aa;
    stim[50] = 18'h1cb1f;
    stim[51] = 18'h16faa;
    stim[52] = 18'h090a1;
    stim[53] = 18'h069d7;
    stim[54] = 18'h1ee7d;
    stim[55] = 18'h02f14;
    stim[56] = 18'h005dc;
    stim[57] = 18'h0b7a5;
    stim[58] = 18'h0b6e4;
    stim[59] = 18'h15a12;
    stim[60] = 18'h08b90;
    stim[61] = 18'h18d7f;
    stim[62] = 18'h1a956;
    stim[63] = 18'h04cd3;
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
      expv[3] = 17'h000e2;
      expv[4] = 17'h000e2;
      expv[5] = 17'h000e2;
      expv[6] = 17'h0056e;
      expv[7] = 17'h0056e;
      expv[8] = 17'h002b6;
      expv[9] = 17'h0074a;
      expv[10] = 17'h0074a;
      expv[11] = 17'h003a4;
      expv[12] = 17'h003a4;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00160;
      expv[16] = 17'h000b0;
      expv[17] = 17'h000b0;
      expv[18] = 17'h000b0;
      expv[19] = 17'h00058;
      expv[20] = 17'h00058;
      expv[21] = 17'h00058;
      expv[22] = 17'h0002c;
      expv[23] = 17'h0002c;
      expv[24] = 17'h0002c;
      expv[25] = 17'h00016;
      expv[26] = 17'h00016;
      expv[27] = 17'h0027a;
      expv[28] = 17'h0027a;
      expv[29] = 17'h0013c;
      expv[30] = 17'h0013c;
      expv[31] = 17'h0009e;
      expv[32] = 17'h0009e;
      expv[33] = 17'h0009e;
      expv[34] = 17'h0009e;
      expv[35] = 17'h00486;
      expv[36] = 17'h00242;
      expv[37] = 17'h005da;
      expv[38] = 17'h002ec;
      expv[39] = 17'h002ed;
      expv[40] = 17'h002ed;
      expv[41] = 17'h002ed;
      expv[42] = 17'h002ed;
      expv[43] = 17'h002ed;
      expv[44] = 17'h002ed;
      expv[45] = 17'h002ed;
      expv[46] = 17'h002ed;
      expv[47] = 17'h002ed;
      expv[48] = 17'h002ed;
      expv[49] = 17'h002ed;
      expv[50] = 17'h002ed;
      expv[51] = 17'h002ed;
      expv[52] = 17'h002ed;
      expv[53] = 17'h002ed;
      expv[54] = 17'h002ed;
      expv[55] = 17'h002ed;
      expv[56] = 17'h002ed;
      expv[57] = 17'h002ed;
      expv[58] = 17'h002ed;
      expv[59] = 17'h002ed;
      expv[60] = 17'h002ed;
      expv[61] = 17'h002ed;
      expv[62] = 17'h002ed;
      expv[63] = 17'h002ed;
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
