// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_095810 dut (
    .clk(clk),
    .rst_n(in_vec[0:0]),
    .wren(out_vec[16:16]),
    .addr(out_vec[15:8]),
    .data(out_vec[7:0])
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
    stim[9] = 1'h1;
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
    stim[21] = 1'h1;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h10101;
      expv[4] = 17'h10202;
      expv[5] = 17'h10303;
      expv[6] = 17'h10404;
      expv[7] = 17'h10505;
      expv[8] = 17'h10606;
      expv[9] = 17'h10707;
      expv[10] = 17'h10808;
      expv[11] = 17'h10909;
      expv[12] = 17'h10a0a;
      expv[13] = 17'h10b0b;
      expv[14] = 17'h10c0c;
      expv[15] = 17'h10d0d;
      expv[16] = 17'h10e0e;
      expv[17] = 17'h10f0f;
      expv[18] = 17'h11010;
      expv[19] = 17'h11111;
      expv[20] = 17'h11212;
      expv[21] = 17'h11313;
      expv[22] = 17'h11414;
      expv[23] = 17'h11515;
      expv[24] = 17'h11616;
      expv[25] = 17'h11717;
      expv[26] = 17'h11818;
      expv[27] = 17'h11919;
      expv[28] = 17'h11a1a;
      expv[29] = 17'h11b1b;
      expv[30] = 17'h11c1c;
      expv[31] = 17'h11d1d;
      expv[32] = 17'h11e1e;
      expv[33] = 17'h11f1f;
      expv[34] = 17'h12020;
      expv[35] = 17'h12121;
      expv[36] = 17'h12222;
      expv[37] = 17'h12323;
      expv[38] = 17'h12424;
      expv[39] = 17'h12525;
      expv[40] = 17'h12626;
      expv[41] = 17'h12727;
      expv[42] = 17'h12828;
      expv[43] = 17'h12929;
      expv[44] = 17'h12a2a;
      expv[45] = 17'h12b2b;
      expv[46] = 17'h12c2c;
      expv[47] = 17'h12d2d;
      expv[48] = 17'h12e2e;
      expv[49] = 17'h12f2f;
      expv[50] = 17'h13030;
      expv[51] = 17'h13131;
      expv[52] = 17'h13232;
      expv[53] = 17'h13333;
      expv[54] = 17'h13434;
      expv[55] = 17'h13535;
      expv[56] = 17'h13636;
      expv[57] = 17'h13737;
      expv[58] = 17'h13838;
      expv[59] = 17'h13939;
      expv[60] = 17'h13a3a;
      expv[61] = 17'h13b3b;
      expv[62] = 17'h13c3c;
      expv[63] = 17'h13d3d;
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
