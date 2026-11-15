// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01170 dut (
    .clk(clk),
    .left(in_vec[11:6]),
    .right(in_vec[5:0]),
    .exp(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb06;
    stim[1] = 12'hc4e;
    stim[2] = 12'h52c;
    stim[3] = 12'hfc2;
    stim[4] = 12'h875;
    stim[5] = 12'h12d;
    stim[6] = 12'h388;
    stim[7] = 12'he26;
    stim[8] = 12'hefc;
    stim[9] = 12'he8d;
    stim[10] = 12'hec3;
    stim[11] = 12'h184;
    stim[12] = 12'h20d;
    stim[13] = 12'h47a;
    stim[14] = 12'hc36;
    stim[15] = 12'h55c;
    stim[16] = 12'h17e;
    stim[17] = 12'h22a;
    stim[18] = 12'hc96;
    stim[19] = 12'h623;
    stim[20] = 12'h4de;
    stim[21] = 12'h6ec;
    stim[22] = 12'hca2;
    stim[23] = 12'h69c;
    stim[24] = 12'hde0;
    stim[25] = 12'hd3e;
    stim[26] = 12'h4b1;
    stim[27] = 12'h3ad;
    stim[28] = 12'hc37;
    stim[29] = 12'h293;
    stim[30] = 12'h2e3;
    stim[31] = 12'hc2f;
    stim[32] = 12'hcce;
    stim[33] = 12'h332;
    stim[34] = 12'h523;
    stim[35] = 12'hdfe;
    stim[36] = 12'he44;
    stim[37] = 12'hc74;
    stim[38] = 12'h3cb;
    stim[39] = 12'h6ac;
    stim[40] = 12'h369;
    stim[41] = 12'hc90;
    stim[42] = 12'h39c;
    stim[43] = 12'hd66;
    stim[44] = 12'h766;
    stim[45] = 12'hbef;
    stim[46] = 12'h0ca;
    stim[47] = 12'h8a0;
    stim[48] = 12'h813;
    stim[49] = 12'h52a;
    stim[50] = 12'hb32;
    stim[51] = 12'h537;
    stim[52] = 12'ha20;
    stim[53] = 12'h08d;
    stim[54] = 12'h732;
    stim[55] = 12'h513;
    stim[56] = 12'hf6a;
    stim[57] = 12'h4a0;
    stim[58] = 12'ha69;
    stim[59] = 12'h08f;
    stim[60] = 12'h9ba;
    stim[61] = 12'hfb4;
    stim[62] = 12'h684;
    stim[63] = 12'h7a7;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'h2;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h0;
      expv[6] = 3'h7;
      expv[7] = 3'h2;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h2;
      expv[18] = 3'h0;
      expv[19] = 3'h3;
      expv[20] = 3'h5;
      expv[21] = 3'h4;
      expv[22] = 3'h2;
      expv[23] = 3'h5;
      expv[24] = 3'h7;
      expv[25] = 3'h3;
      expv[26] = 3'h7;
      expv[27] = 3'h2;
      expv[28] = 3'h5;
      expv[29] = 3'h3;
      expv[30] = 3'h1;
      expv[31] = 3'h0;
      expv[32] = 3'h2;
      expv[33] = 3'h0;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h3;
      expv[37] = 3'h2;
      expv[38] = 3'h0;
      expv[39] = 3'h1;
      expv[40] = 3'h0;
      expv[41] = 3'h5;
      expv[42] = 3'h3;
      expv[43] = 3'h5;
      expv[44] = 3'h1;
      expv[45] = 3'h7;
      expv[46] = 3'h4;
      expv[47] = 3'h7;
      expv[48] = 3'h0;
      expv[49] = 3'h5;
      expv[50] = 3'h3;
      expv[51] = 3'h4;
      expv[52] = 3'h0;
      expv[53] = 3'h5;
      expv[54] = 3'h6;
      expv[55] = 3'h0;
      expv[56] = 3'h6;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h3;
      expv[60] = 3'h7;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h2;
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
