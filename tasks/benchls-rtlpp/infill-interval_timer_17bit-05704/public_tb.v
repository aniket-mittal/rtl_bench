// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05704 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h28522a;
    stim[1] = 22'h00d580;
    stim[2] = 22'h07a403;
    stim[3] = 22'h279299;
    stim[4] = 22'h037c49;
    stim[5] = 22'h3fe1be;
    stim[6] = 22'h164399;
    stim[7] = 22'h02a4c4;
    stim[8] = 22'h2380b8;
    stim[9] = 22'h17c394;
    stim[10] = 22'h2b5cc1;
    stim[11] = 22'h0244db;
    stim[12] = 22'h12630c;
    stim[13] = 22'h0bb1a2;
    stim[14] = 22'h161709;
    stim[15] = 22'h27f652;
    stim[16] = 22'h1f8685;
    stim[17] = 22'h3a417d;
    stim[18] = 22'h32534a;
    stim[19] = 22'h2aa99f;
    stim[20] = 22'h3acdcc;
    stim[21] = 22'h2b1889;
    stim[22] = 22'h0f0132;
    stim[23] = 22'h0216c6;
    stim[24] = 22'h1374d8;
    stim[25] = 22'h0f66ff;
    stim[26] = 22'h07b2ef;
    stim[27] = 22'h1ace32;
    stim[28] = 22'h2715d5;
    stim[29] = 22'h270ace;
    stim[30] = 22'h36503f;
    stim[31] = 22'h2fcaf4;
    stim[32] = 22'h1b2649;
    stim[33] = 22'h035d2b;
    stim[34] = 22'h02698e;
    stim[35] = 22'h2e72ec;
    stim[36] = 22'h27796e;
    stim[37] = 22'h2e0ec2;
    stim[38] = 22'h3fae6a;
    stim[39] = 22'h2aebc8;
    stim[40] = 22'h1211aa;
    stim[41] = 22'h3bad77;
    stim[42] = 22'h331937;
    stim[43] = 22'h1bf511;
    stim[44] = 22'h339030;
    stim[45] = 22'h3a40a2;
    stim[46] = 22'h062198;
    stim[47] = 22'h36da60;
    stim[48] = 22'h2676f9;
    stim[49] = 22'h32688a;
    stim[50] = 22'h3e9064;
    stim[51] = 22'h2e1135;
    stim[52] = 22'h174fd3;
    stim[53] = 22'h1e7f3b;
    stim[54] = 22'h378ca0;
    stim[55] = 22'h03bb38;
    stim[56] = 22'h3bed6c;
    stim[57] = 22'h029c10;
    stim[58] = 22'h377bb5;
    stim[59] = 22'h268037;
    stim[60] = 22'h137841;
    stim[61] = 22'h06aa57;
    stim[62] = 22'h1b5d70;
    stim[63] = 22'h2af9ad;
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
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h0869f;
      expv[38] = 17'h00d3f;
      expv[39] = 17'h00000;
      expv[40] = 17'h00d3f;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0869f;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00d3f;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h0869f;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
