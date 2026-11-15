// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06241 dut (
    .clk(clk),
    .uaddr(in_vec[16:9]),
    .udata_i(in_vec[8:1]),
    .rw(in_vec[0:0]),
    .udata_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1223f;
    stim[1] = 17'h09da6;
    stim[2] = 17'h1334e;
    stim[3] = 17'h02792;
    stim[4] = 17'h14601;
    stim[5] = 17'h04702;
    stim[6] = 17'h0f5b3;
    stim[7] = 17'h09992;
    stim[8] = 17'h14369;
    stim[9] = 17'h1a26f;
    stim[10] = 17'h0fc62;
    stim[11] = 17'h03516;
    stim[12] = 17'h11e36;
    stim[13] = 17'h10f5b;
    stim[14] = 17'h1d0a4;
    stim[15] = 17'h11b86;
    stim[16] = 17'h1b1d0;
    stim[17] = 17'h16eec;
    stim[18] = 17'h09511;
    stim[19] = 17'h1f3dd;
    stim[20] = 17'h14039;
    stim[21] = 17'h0e27a;
    stim[22] = 17'h194cb;
    stim[23] = 17'h0a6c4;
    stim[24] = 17'h1d6c9;
    stim[25] = 17'h03523;
    stim[26] = 17'h0a55e;
    stim[27] = 17'h152c5;
    stim[28] = 17'h1c207;
    stim[29] = 17'h03059;
    stim[30] = 17'h17769;
    stim[31] = 17'h001f8;
    stim[32] = 17'h0f85e;
    stim[33] = 17'h0fe92;
    stim[34] = 17'h12512;
    stim[35] = 17'h12afe;
    stim[36] = 17'h00443;
    stim[37] = 17'h02ad8;
    stim[38] = 17'h03b29;
    stim[39] = 17'h076d7;
    stim[40] = 17'h1ceda;
    stim[41] = 17'h1d4be;
    stim[42] = 17'h16262;
    stim[43] = 17'h1a12a;
    stim[44] = 17'h08060;
    stim[45] = 17'h05f14;
    stim[46] = 17'h0ec2f;
    stim[47] = 17'h1b9c7;
    stim[48] = 17'h00149;
    stim[49] = 17'h13e7f;
    stim[50] = 17'h07914;
    stim[51] = 17'h103b2;
    stim[52] = 17'h02d49;
    stim[53] = 17'h1e778;
    stim[54] = 17'h03875;
    stim[55] = 17'h05415;
    stim[56] = 17'h057ed;
    stim[57] = 17'h19403;
    stim[58] = 17'h1b51c;
    stim[59] = 17'h0d885;
    stim[60] = 17'h0511b;
    stim[61] = 17'h0a0da;
    stim[62] = 17'h12902;
    stim[63] = 17'h0a635;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'h00;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
