// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04618 dut (
    .clk(clk),
    .ce(in_vec[24:24]),
    .is_rendering(in_vec[23:23]),
    .ain(in_vec[22:20]),
    .din(in_vec[19:12]),
    .read(in_vec[11:11]),
    .write(in_vec[10:10]),
    .is_pre_render(in_vec[9:9]),
    .cycle(in_vec[8:0]),
    .loopy(out_vec[17:3]),
    .fine_x_scroll(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0c73da5;
    stim[1] = 25'h08b0d5a;
    stim[2] = 25'h0ef80cf;
    stim[3] = 25'h06ea3f9;
    stim[4] = 25'h026c04a;
    stim[5] = 25'h00f2f8f;
    stim[6] = 25'h119750c;
    stim[7] = 25'h1156755;
    stim[8] = 25'h1348d97;
    stim[9] = 25'h11f550c;
    stim[10] = 25'h16da557;
    stim[11] = 25'h1b3b146;
    stim[12] = 25'h17935ca;
    stim[13] = 25'h0d360b4;
    stim[14] = 25'h1a8fad6;
    stim[15] = 25'h0e85bbc;
    stim[16] = 25'h01d462b;
    stim[17] = 25'h0c8524e;
    stim[18] = 25'h16dce29;
    stim[19] = 25'h0a6eac7;
    stim[20] = 25'h0f9b422;
    stim[21] = 25'h0565375;
    stim[22] = 25'h16a8390;
    stim[23] = 25'h0d6f65b;
    stim[24] = 25'h1634f2e;
    stim[25] = 25'h159b446;
    stim[26] = 25'h01bc092;
    stim[27] = 25'h116022a;
    stim[28] = 25'h17f4a60;
    stim[29] = 25'h1c6f086;
    stim[30] = 25'h11a99be;
    stim[31] = 25'h1ef8f24;
    stim[32] = 25'h0a1d141;
    stim[33] = 25'h07e3817;
    stim[34] = 25'h0b224e2;
    stim[35] = 25'h098c4df;
    stim[36] = 25'h08715df;
    stim[37] = 25'h1d2f551;
    stim[38] = 25'h137b375;
    stim[39] = 25'h090b167;
    stim[40] = 25'h0f735b6;
    stim[41] = 25'h0719d7c;
    stim[42] = 25'h05403fc;
    stim[43] = 25'h1b97213;
    stim[44] = 25'h1a839bd;
    stim[45] = 25'h18fdeed;
    stim[46] = 25'h1cab870;
    stim[47] = 25'h0ee5e70;
    stim[48] = 25'h0dc1c48;
    stim[49] = 25'h161a235;
    stim[50] = 25'h0b3f89c;
    stim[51] = 25'h057ad6e;
    stim[52] = 25'h130e3a3;
    stim[53] = 25'h024043d;
    stim[54] = 25'h07a1197;
    stim[55] = 25'h0dc0422;
    stim[56] = 25'h02e674a;
    stim[57] = 25'h1c4a296;
    stim[58] = 25'h1367b41;
    stim[59] = 25'h06917b3;
    stim[60] = 25'h15cae92;
    stim[61] = 25'h0c51b0c;
    stim[62] = 25'h1a251ec;
    stim[63] = 25'h0b396ec;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00008;
      expv[14] = 18'h00008;
      expv[15] = 18'h00008;
      expv[16] = 18'h00008;
      expv[17] = 18'h00008;
      expv[18] = 18'h00008;
      expv[19] = 18'h00008;
      expv[20] = 18'h00008;
      expv[21] = 18'h00008;
      expv[22] = 18'h00008;
      expv[23] = 18'h00008;
      expv[24] = 18'h00008;
      expv[25] = 18'h0e1a0;
      expv[26] = 18'h0e1a3;
      expv[27] = 18'h0e1a3;
      expv[28] = 18'h0e1a3;
      expv[29] = 18'h0e1ab;
      expv[30] = 18'h0e1ab;
      expv[31] = 18'h0e1ab;
      expv[32] = 18'h0e7c3;
      expv[33] = 18'h0e7c3;
      expv[34] = 18'h0e7c3;
      expv[35] = 18'h0e7c3;
      expv[36] = 18'h0e7c3;
      expv[37] = 18'h0e7c3;
      expv[38] = 18'h0e7c7;
      expv[39] = 18'h0e7c7;
      expv[40] = 18'h0e7c7;
      expv[41] = 18'h0e7c7;
      expv[42] = 18'h0e7c7;
      expv[43] = 18'h0e7c7;
      expv[44] = 18'h0e7cf;
      expv[45] = 18'h0e7cf;
      expv[46] = 18'h0e7cf;
      expv[47] = 18'h0e7cf;
      expv[48] = 18'h0e7cf;
      expv[49] = 18'h0e7cf;
      expv[50] = 18'h0e7cf;
      expv[51] = 18'h0e7cf;
      expv[52] = 18'h0e7cf;
      expv[53] = 18'h0e7cf;
      expv[54] = 18'h0e7cf;
      expv[55] = 18'h0e7cf;
      expv[56] = 18'h0e7cf;
      expv[57] = 18'h0e7cf;
      expv[58] = 18'h0e7cf;
      expv[59] = 18'h0e7cf;
      expv[60] = 18'h0e7cf;
      expv[61] = 18'h0e7ca;
      expv[62] = 18'h0e7ca;
      expv[63] = 18'h0e7ca;
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
