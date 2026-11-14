// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01005 dut (
    .clk(clk),
    .clk_noise(in_vec[21:21]),
    .non_clk_rst_n(in_vec[20:20]),
    .non_clk_control(in_vec[19:19]),
    .noise_D(in_vec[18:15]),
    .Noise_in(in_vec[14:14]),
    .DAC_RST(in_vec[13:13]),
    .D(in_vec[12:7]),
    .config_in(in_vec[6:1]),
    .VREF_in(in_vec[0:0]),
    .VREF_out(out_vec[1:1]),
    .VOUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h05e9bb;
    stim[1] = 22'h0833a4;
    stim[2] = 22'h13d37a;
    stim[3] = 22'h221397;
    stim[4] = 22'h1a1bf9;
    stim[5] = 22'h1f43ef;
    stim[6] = 22'h3a0dbc;
    stim[7] = 22'h1344d5;
    stim[8] = 22'h3b0c6f;
    stim[9] = 22'h18dd31;
    stim[10] = 22'h1248bc;
    stim[11] = 22'h3609a9;
    stim[12] = 22'h2c1ad7;
    stim[13] = 22'h1d96e9;
    stim[14] = 22'h128d47;
    stim[15] = 22'h0385ff;
    stim[16] = 22'h3a5d60;
    stim[17] = 22'h0912ae;
    stim[18] = 22'h1a5c7b;
    stim[19] = 22'h1e1b91;
    stim[20] = 22'h14168c;
    stim[21] = 22'h2900e8;
    stim[22] = 22'h0fd4de;
    stim[23] = 22'h30c678;
    stim[24] = 22'h259680;
    stim[25] = 22'h161216;
    stim[26] = 22'h2446c3;
    stim[27] = 22'h2d8ea7;
    stim[28] = 22'h2f143d;
    stim[29] = 22'h0d8eca;
    stim[30] = 22'h1c8a28;
    stim[31] = 22'h361260;
    stim[32] = 22'h2e0993;
    stim[33] = 22'h2d066b;
    stim[34] = 22'h0cda4f;
    stim[35] = 22'h22d056;
    stim[36] = 22'h22146b;
    stim[37] = 22'h108a8f;
    stim[38] = 22'h1c82ed;
    stim[39] = 22'h2b06db;
    stim[40] = 22'h35d4d3;
    stim[41] = 22'h0c9228;
    stim[42] = 22'h0d0c1b;
    stim[43] = 22'h2b503e;
    stim[44] = 22'h2cc1b6;
    stim[45] = 22'h3ad43e;
    stim[46] = 22'h3d081e;
    stim[47] = 22'h3a0106;
    stim[48] = 22'h1f8b8d;
    stim[49] = 22'h3f9fd1;
    stim[50] = 22'h03d888;
    stim[51] = 22'h1f9569;
    stim[52] = 22'h3686fb;
    stim[53] = 22'h3411cb;
    stim[54] = 22'h1613f5;
    stim[55] = 22'h2516bc;
    stim[56] = 22'h385642;
    stim[57] = 22'h374ed6;
    stim[58] = 22'h0519a4;
    stim[59] = 22'h041ba5;
    stim[60] = 22'h1ccb62;
    stim[61] = 22'h01db43;
    stim[62] = 22'h004054;
    stim[63] = 22'h39d805;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'h2;
      expv[8] = 2'h3;
      expv[9] = 2'h2;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h3;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h2;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h2;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h2;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h3;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h2;
      expv[55] = 2'h3;
      expv[56] = 2'h2;
      expv[57] = 2'h3;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h0;
      expv[63] = 2'h3;
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
