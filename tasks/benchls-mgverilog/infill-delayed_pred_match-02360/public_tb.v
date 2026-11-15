// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02360 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .is_sticky(in_vec[24:24]),
    .delay_valid(in_vec[23:23]),
    .delay_cycles(in_vec[22:19]),
    .pred_valid(in_vec[18:18]),
    .pred_match(in_vec[17:17]),
    .pred_index(in_vec[16:1]),
    .act_input(in_vec[0:0]),
    .act_output(out_vec[16:16]),
    .act_index(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h34ba4c0;
    stim[1] = 26'h3732454;
    stim[2] = 26'h1fbb295;
    stim[3] = 26'h1a79889;
    stim[4] = 26'h04e37f6;
    stim[5] = 26'h1257716;
    stim[6] = 26'h003ae99;
    stim[7] = 26'h03d5039;
    stim[8] = 26'h1eb1d6c;
    stim[9] = 26'h1f14069;
    stim[10] = 26'h1e3b0c8;
    stim[11] = 26'h0b635dd;
    stim[12] = 26'h1bb3fd8;
    stim[13] = 26'h3297c1b;
    stim[14] = 26'h0f75574;
    stim[15] = 26'h029d8e0;
    stim[16] = 26'h1596c9d;
    stim[17] = 26'h05cdb99;
    stim[18] = 26'h0844d72;
    stim[19] = 26'h10613a4;
    stim[20] = 26'h301b8c4;
    stim[21] = 26'h03ae539;
    stim[22] = 26'h1d07385;
    stim[23] = 26'h01fef3f;
    stim[24] = 26'h0fb6d3d;
    stim[25] = 26'h1d1a3f4;
    stim[26] = 26'h1033a3e;
    stim[27] = 26'h098b7b3;
    stim[28] = 26'h10213ce;
    stim[29] = 26'h07616ac;
    stim[30] = 26'h09c1764;
    stim[31] = 26'h00bf605;
    stim[32] = 26'h0d69ce9;
    stim[33] = 26'h1a1ee77;
    stim[34] = 26'h1777e79;
    stim[35] = 26'h137c7bd;
    stim[36] = 26'h17020f0;
    stim[37] = 26'h1d6022a;
    stim[38] = 26'h17afef0;
    stim[39] = 26'h147eeaf;
    stim[40] = 26'h16e0f0c;
    stim[41] = 26'h0a6e7fd;
    stim[42] = 26'h15ff64d;
    stim[43] = 26'h18e9ce6;
    stim[44] = 26'h17b9337;
    stim[45] = 26'h1034035;
    stim[46] = 26'h0c54d6a;
    stim[47] = 26'h15e129e;
    stim[48] = 26'h01b8fce;
    stim[49] = 26'h19d8641;
    stim[50] = 26'h01f24d5;
    stim[51] = 26'h1621e91;
    stim[52] = 26'h0906787;
    stim[53] = 26'h09429f8;
    stim[54] = 26'h0ade553;
    stim[55] = 26'h0e6d6b3;
    stim[56] = 26'h19c13cb;
    stim[57] = 26'h03b45a2;
    stim[58] = 26'h043defc;
    stim[59] = 26'h1c88299;
    stim[60] = 26'h181b400;
    stim[61] = 26'h14182f0;
    stim[62] = 26'h34274c3;
    stim[63] = 26'h1eb20ce;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h0xxxx;
      expv[2] = 17'h0xxxx;
      expv[3] = 17'h0xxxx;
      expv[4] = 17'h0xxxx;
      expv[5] = 17'h0xxxx;
      expv[6] = 17'h0xxxx;
      expv[7] = 17'h0xxxx;
      expv[8] = 17'h0xxxx;
      expv[9] = 17'h0xxxx;
      expv[10] = 17'h0xxxx;
      expv[11] = 17'h0xxxx;
      expv[12] = 17'h0xxxx;
      expv[13] = 17'h0xxxx;
      expv[14] = 17'h0xxxx;
      expv[15] = 17'h0xxxx;
      expv[16] = 17'h0xxxx;
      expv[17] = 17'h0xxxx;
      expv[18] = 17'h0xxxx;
      expv[19] = 17'h0xxxx;
      expv[20] = 17'h0xxxx;
      expv[21] = 17'h0xxxx;
      expv[22] = 17'h0xxxx;
      expv[23] = 17'h0xxxx;
      expv[24] = 17'h1f79f;
      expv[25] = 17'h1f79f;
      expv[26] = 17'h1f79f;
      expv[27] = 17'h1f79f;
      expv[28] = 17'h1f79f;
      expv[29] = 17'h1f79f;
      expv[30] = 17'h0f79f;
      expv[31] = 17'h0f79f;
      expv[32] = 17'h0f79f;
      expv[33] = 17'h0f79f;
      expv[34] = 17'h0f79f;
      expv[35] = 17'h1bf3c;
      expv[36] = 17'h1bf3c;
      expv[37] = 17'h1bf3c;
      expv[38] = 17'h1bf3c;
      expv[39] = 17'h1bf3c;
      expv[40] = 17'h1bf3c;
      expv[41] = 17'h1bf3c;
      expv[42] = 17'h1bf3c;
      expv[43] = 17'h1bf3c;
      expv[44] = 17'h1bf3c;
      expv[45] = 17'h1bf3c;
      expv[46] = 17'h1bf3c;
      expv[47] = 17'h0bf3c;
      expv[48] = 17'h0bf3c;
      expv[49] = 17'h0bf3c;
      expv[50] = 17'h0bf3c;
      expv[51] = 17'h1926a;
      expv[52] = 17'h1926a;
      expv[53] = 17'h1926a;
      expv[54] = 17'h0926a;
      expv[55] = 17'h0926a;
      expv[56] = 17'h0926a;
      expv[57] = 17'h0926a;
      expv[58] = 17'h0926a;
      expv[59] = 17'h0926a;
      expv[60] = 17'h0926a;
      expv[61] = 17'h0926a;
      expv[62] = 17'h0926a;
      expv[63] = 17'h0926a;
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
