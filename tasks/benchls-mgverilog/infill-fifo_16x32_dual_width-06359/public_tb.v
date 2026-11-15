// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06359 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .en(in_vec[24:24]),
    .mode(in_vec[23:22]),
    .din(in_vec[21:2]),
    .we(in_vec[1:1]),
    .re(in_vec[0:0]),
    .dout(out_vec[35:4]),
    .status(out_vec[3:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2cb19d0;
    stim[1] = 26'h39e5831;
    stim[2] = 26'h0e9f969;
    stim[3] = 26'h0ba9595;
    stim[4] = 26'h289808e;
    stim[5] = 26'h1ad01a0;
    stim[6] = 26'h1ed7317;
    stim[7] = 26'h1ddb88b;
    stim[8] = 26'h057b170;
    stim[9] = 26'h13cd627;
    stim[10] = 26'h17c8a05;
    stim[11] = 26'h08b0b74;
    stim[12] = 26'h0447258;
    stim[13] = 26'h0b81574;
    stim[14] = 26'h06465e3;
    stim[15] = 26'h17bf395;
    stim[16] = 26'h1d4a610;
    stim[17] = 26'h19c15bf;
    stim[18] = 26'h00febfc;
    stim[19] = 26'h1bb5edf;
    stim[20] = 26'h098b44f;
    stim[21] = 26'h01cdf76;
    stim[22] = 26'h0eb7b26;
    stim[23] = 26'h03d881a;
    stim[24] = 26'h1e233d9;
    stim[25] = 26'h00d5edb;
    stim[26] = 26'h07ba332;
    stim[27] = 26'h10d4007;
    stim[28] = 26'h1dcde9d;
    stim[29] = 26'h14c7270;
    stim[30] = 26'h0c41e5a;
    stim[31] = 26'h1d9304b;
    stim[32] = 26'h0501874;
    stim[33] = 26'h15c597a;
    stim[34] = 26'h0bc3f16;
    stim[35] = 26'h0ef1ef5;
    stim[36] = 26'h1f0d961;
    stim[37] = 26'h1226749;
    stim[38] = 26'h118bfd2;
    stim[39] = 26'h01b19b7;
    stim[40] = 26'h1619241;
    stim[41] = 26'h05c4bb0;
    stim[42] = 26'h1fc01b7;
    stim[43] = 26'h19b8098;
    stim[44] = 26'h0588a1b;
    stim[45] = 26'h1ee90fa;
    stim[46] = 26'h015e675;
    stim[47] = 26'h1a780d2;
    stim[48] = 26'h01bcd81;
    stim[49] = 26'h04b4980;
    stim[50] = 26'h01e59c6;
    stim[51] = 26'h12dff80;
    stim[52] = 26'h0afd62a;
    stim[53] = 26'h111bc40;
    stim[54] = 26'h17b775f;
    stim[55] = 26'h0bf1d1e;
    stim[56] = 26'h09a64e0;
    stim[57] = 26'h0051523;
    stim[58] = 26'h1460519;
    stim[59] = 26'h1d4daa8;
    stim[60] = 26'h16539f1;
    stim[61] = 26'h18c9170;
    stim[62] = 26'h1c9b25f;
    stim[63] = 26'h125729e;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxx;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'hxxxxxxxxc;
      expv[4] = 36'hxxxxxxxxc;
      expv[5] = 36'hxxxxxxxxc;
      expv[6] = 36'h00026023c;
      expv[7] = 36'h00026023c;
      expv[8] = 36'hxxxxxxxxc;
      expv[9] = 36'hxxxxxxxxc;
      expv[10] = 36'h000b4068d;
      expv[11] = 36'h000b4068c;
      expv[12] = 36'hxxxxxxxxc;
      expv[13] = 36'h000b4068c;
      expv[14] = 36'h000b4068c;
      expv[15] = 36'h000b4068c;
      expv[16] = 36'h0002465ec;
      expv[17] = 36'h000b4068c;
      expv[18] = 36'h000b4068c;
      expv[19] = 36'hxxxxxxxxc;
      expv[20] = 36'h0007056fc;
      expv[21] = 36'h000b4068c;
      expv[22] = 36'h000ed7b7d;
      expv[23] = 36'h000ed7b7c;
      expv[24] = 36'h737d737dd;
      expv[25] = 36'h737d737dc;
      expv[26] = 36'h00062d13c;
      expv[27] = 36'h737d737dc;
      expv[28] = 36'h0003ba33d;
      expv[29] = 36'h00062d13c;
      expv[30] = 36'hxxxxxxxxc;
      expv[31] = 36'hxxxxxxxxc;
      expv[32] = 36'h0000c727c;
      expv[33] = 36'h00062d13c;
      expv[34] = 36'h0000c727c;
      expv[35] = 36'h0001c597c;
      expv[36] = 36'h0001c597c;
      expv[37] = 36'h0001c597c;
      expv[38] = 36'h000f0fc5c;
      expv[39] = 36'hxxxxxxxxc;
      expv[40] = 36'hxxxxxxxxc;
      expv[41] = 36'h6c6662ffc;
      expv[42] = 36'h000f0fc5c;
      expv[43] = 36'h6c6662ffc;
      expv[44] = 36'h000f0fc5c;
      expv[45] = 36'h000f0fc5c;
      expv[46] = 36'h0001c4bbc;
      expv[47] = 36'h000188a1c;
      expv[48] = 36'h000188a1c;
      expv[49] = 36'h0009e034c;
      expv[50] = 36'h0009e034c;
      expv[51] = 36'h0009e034d;
      expv[52] = 36'h0009e034d;
      expv[53] = 36'h0009e034c;
      expv[54] = 36'h000bf58ad;
      expv[55] = 36'h000bf58ac;
      expv[56] = 36'h000188a1c;
      expv[57] = 36'h0003b775c;
      expv[58] = 36'h0003b775d;
      expv[59] = 36'h0003b775c;
      expv[60] = 36'h000fc747c;
      expv[61] = 36'h000fc747c;
      expv[62] = 36'hxxxxxxxxc;
      expv[63] = 36'hxxxxxxxxc;
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
