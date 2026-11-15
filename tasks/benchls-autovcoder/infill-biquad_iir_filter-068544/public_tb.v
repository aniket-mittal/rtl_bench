// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068544 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .din(in_vec[18:1]),
    .din_valid(in_vec[0:0]),
    .dout(out_vec[18:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hd29c9;
    stim[1] = 20'hbbd43;
    stim[2] = 20'h6c621;
    stim[3] = 20'h4486f;
    stim[4] = 20'h74fb5;
    stim[5] = 20'h399ed;
    stim[6] = 20'h15f6d;
    stim[7] = 20'h1f3cb;
    stim[8] = 20'h7c5e8;
    stim[9] = 20'h782f3;
    stim[10] = 20'h01f57;
    stim[11] = 20'h2fd97;
    stim[12] = 20'h66bef;
    stim[13] = 20'h25fe7;
    stim[14] = 20'h2d6a4;
    stim[15] = 20'h1ccef;
    stim[16] = 20'h36932;
    stim[17] = 20'h3f784;
    stim[18] = 20'h455ad;
    stim[19] = 20'h67d31;
    stim[20] = 20'h69bef;
    stim[21] = 20'h2be8a;
    stim[22] = 20'h4aba7;
    stim[23] = 20'h4a114;
    stim[24] = 20'h542c5;
    stim[25] = 20'h6361e;
    stim[26] = 20'h3bc2f;
    stim[27] = 20'h74002;
    stim[28] = 20'h44f5d;
    stim[29] = 20'h68b92;
    stim[30] = 20'h02ba5;
    stim[31] = 20'h6dd9e;
    stim[32] = 20'h1cb38;
    stim[33] = 20'h63ea1;
    stim[34] = 20'h00bf7;
    stim[35] = 20'h49176;
    stim[36] = 20'h04899;
    stim[37] = 20'h5907f;
    stim[38] = 20'h0d8ad;
    stim[39] = 20'h0d6b6;
    stim[40] = 20'h0dcac;
    stim[41] = 20'h17c98;
    stim[42] = 20'h68f6c;
    stim[43] = 20'h00b82;
    stim[44] = 20'h44a4c;
    stim[45] = 20'h23afa;
    stim[46] = 20'h1857e;
    stim[47] = 20'h56644;
    stim[48] = 20'h03230;
    stim[49] = 20'h0f356;
    stim[50] = 20'h046dc;
    stim[51] = 20'h12c84;
    stim[52] = 20'h4b128;
    stim[53] = 20'h132e4;
    stim[54] = 20'h06575;
    stim[55] = 20'h73d31;
    stim[56] = 20'h2a705;
    stim[57] = 20'h51c46;
    stim[58] = 20'h207e2;
    stim[59] = 20'h4e1a7;
    stim[60] = 20'h621d5;
    stim[61] = 20'h6fbac;
    stim[62] = 20'h6559d;
    stim[63] = 20'h09557;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'hxxxxx;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
