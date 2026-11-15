// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10414 dut (
    .sys_clk(clk),
    .alu_rst(in_vec[33:33]),
    .a(in_vec[32:1]),
    .valid_i(in_vec[0:0]),
    .r(out_vec[32:1]),
    .valid_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2f30c6ae7;
    stim[1] = 34'h2095ebf0b;
    stim[2] = 34'h1ba6786e4;
    stim[3] = 34'h1346f63f3;
    stim[4] = 34'h0d92e8264;
    stim[5] = 34'h117a8cd46;
    stim[6] = 34'h12b98856e;
    stim[7] = 34'h013e3c12e;
    stim[8] = 34'h0c81f0d95;
    stim[9] = 34'h1eec50455;
    stim[10] = 34'h17f62e318;
    stim[11] = 34'h14670c24e;
    stim[12] = 34'h0eda742d8;
    stim[13] = 34'h0da563c70;
    stim[14] = 34'h0378f0c05;
    stim[15] = 34'h1b0e0a6da;
    stim[16] = 34'h0bce2a161;
    stim[17] = 34'h0f5583f54;
    stim[18] = 34'h0ff4e6b97;
    stim[19] = 34'h17a18634f;
    stim[20] = 34'h17124bf46;
    stim[21] = 34'h084ac1355;
    stim[22] = 34'h073cf505b;
    stim[23] = 34'h19bf21c8e;
    stim[24] = 34'h08a61a3fd;
    stim[25] = 34'h140c13831;
    stim[26] = 34'h040c049ab;
    stim[27] = 34'h11400d243;
    stim[28] = 34'h1a27149cb;
    stim[29] = 34'h08068c5a3;
    stim[30] = 34'h0f3e6adf5;
    stim[31] = 34'h0f1599394;
    stim[32] = 34'h0c1b70c30;
    stim[33] = 34'h0cfc8c120;
    stim[34] = 34'h13dc3124a;
    stim[35] = 34'h069f8fc85;
    stim[36] = 34'h010aef53f;
    stim[37] = 34'h048e695ca;
    stim[38] = 34'h19c75b483;
    stim[39] = 34'h1724fa1e0;
    stim[40] = 34'h12e3b0e31;
    stim[41] = 34'h15383656d;
    stim[42] = 34'h1b8efd7bf;
    stim[43] = 34'h0b33529ee;
    stim[44] = 34'h13303e54b;
    stim[45] = 34'h0383be423;
    stim[46] = 34'h05af9a313;
    stim[47] = 34'h1d9070ee2;
    stim[48] = 34'h0101a1289;
    stim[49] = 34'h04178a14c;
    stim[50] = 34'h0c3daae9b;
    stim[51] = 34'h1d75b94ea;
    stim[52] = 34'h0c68b12bc;
    stim[53] = 34'h15951c6ce;
    stim[54] = 34'h09ed7d041;
    stim[55] = 34'h0a5f65654;
    stim[56] = 34'h0f96fb797;
    stim[57] = 34'h0dd80e765;
    stim[58] = 34'h13ff78e15;
    stim[59] = 34'h14dae9382;
    stim[60] = 34'h13ed721d0;
    stim[61] = 34'h131070c0e;
    stim[62] = 34'h1aeea7a7d;
    stim[63] = 34'h019576c2e;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h1fffffffe;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h198000000;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h00000006b;
      expv[23] = 33'h000000001;
      expv[24] = 33'h1c1bc6e40;
      expv[25] = 33'h00000161b;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h1eb636001;
      expv[30] = 33'h000000005;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000000;
      expv[39] = 33'h1a292df81;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h0c0000000;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h0d7d04001;
      expv[56] = 33'h02b2a0000;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h184000001;
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
