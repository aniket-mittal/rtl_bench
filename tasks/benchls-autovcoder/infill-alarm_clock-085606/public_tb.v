// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085606 dut (
    .clk_sys(clk),
    .alarm_clk(in_vec[13:4]),
    .set_acce(in_vec[3:0]),
    .sign_alarm(out_vec[42:42]),
    .h_ten(out_vec[41:35]),
    .h_one(out_vec[34:28]),
    .min_ten(out_vec[27:21]),
    .min_one(out_vec[20:14]),
    .s_ten(out_vec[13:7]),
    .s_one(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h22b0;
    stim[1] = 14'h395f;
    stim[2] = 14'h20d6;
    stim[3] = 14'h32cc;
    stim[4] = 14'h1ade;
    stim[5] = 14'h3909;
    stim[6] = 14'h2639;
    stim[7] = 14'h2d88;
    stim[8] = 14'h28ca;
    stim[9] = 14'h32c3;
    stim[10] = 14'h2a97;
    stim[11] = 14'h010f;
    stim[12] = 14'h304c;
    stim[13] = 14'h0a3a;
    stim[14] = 14'h1c9c;
    stim[15] = 14'h36d7;
    stim[16] = 14'h1a37;
    stim[17] = 14'h18ee;
    stim[18] = 14'h0a14;
    stim[19] = 14'h18ce;
    stim[20] = 14'h1fdb;
    stim[21] = 14'h3310;
    stim[22] = 14'h3833;
    stim[23] = 14'h0a39;
    stim[24] = 14'h3e62;
    stim[25] = 14'h14d0;
    stim[26] = 14'h0480;
    stim[27] = 14'h012e;
    stim[28] = 14'h1b28;
    stim[29] = 14'h297c;
    stim[30] = 14'h2e1e;
    stim[31] = 14'h2028;
    stim[32] = 14'h2f4a;
    stim[33] = 14'h38b6;
    stim[34] = 14'h2bc5;
    stim[35] = 14'h0dbf;
    stim[36] = 14'h0c03;
    stim[37] = 14'h2763;
    stim[38] = 14'h2e9d;
    stim[39] = 14'h18df;
    stim[40] = 14'h1e21;
    stim[41] = 14'h37ee;
    stim[42] = 14'h0e84;
    stim[43] = 14'h2708;
    stim[44] = 14'h0f12;
    stim[45] = 14'h232c;
    stim[46] = 14'h2303;
    stim[47] = 14'h131a;
    stim[48] = 14'h123f;
    stim[49] = 14'h033e;
    stim[50] = 14'h376d;
    stim[51] = 14'h0412;
    stim[52] = 14'h34d6;
    stim[53] = 14'h2c4f;
    stim[54] = 14'h2bb2;
    stim[55] = 14'h13f7;
    stim[56] = 14'h3a2e;
    stim[57] = 14'h10c6;
    stim[58] = 14'h1f71;
    stim[59] = 14'h001a;
    stim[60] = 14'h1e6a;
    stim[61] = 14'h3a94;
    stim[62] = 14'h3f8f;
    stim[63] = 14'h201e;
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
      expv[0] = 43'h00810204081;
      expv[1] = 43'h00810204081;
      expv[2] = 43'h00810204081;
      expv[3] = 43'h00810204081;
      expv[4] = 43'h00810204081;
      expv[5] = 43'h00810204081;
      expv[6] = 43'h00810204081;
      expv[7] = 43'h00810204081;
      expv[8] = 43'h00810204081;
      expv[9] = 43'h00810204081;
      expv[10] = 43'h00810204081;
      expv[11] = 43'h00810204081;
      expv[12] = 43'h00810204081;
      expv[13] = 43'h00810204081;
      expv[14] = 43'h00810204081;
      expv[15] = 43'h00810204081;
      expv[16] = 43'h00810204081;
      expv[17] = 43'h00810204081;
      expv[18] = 43'h00810204081;
      expv[19] = 43'h00810204081;
      expv[20] = 43'h00810204081;
      expv[21] = 43'h00810204081;
      expv[22] = 43'h00810204081;
      expv[23] = 43'h00810204081;
      expv[24] = 43'h00810204081;
      expv[25] = 43'h00810204081;
      expv[26] = 43'h00810204081;
      expv[27] = 43'h00810204081;
      expv[28] = 43'h00810204081;
      expv[29] = 43'h00810204081;
      expv[30] = 43'h00810204081;
      expv[31] = 43'h00810204081;
      expv[32] = 43'h00810204081;
      expv[33] = 43'h00810204081;
      expv[34] = 43'h00810204081;
      expv[35] = 43'h00810204081;
      expv[36] = 43'h00810204081;
      expv[37] = 43'h00810204081;
      expv[38] = 43'h00810204081;
      expv[39] = 43'h00810204081;
      expv[40] = 43'h00810204081;
      expv[41] = 43'h00810204081;
      expv[42] = 43'h00810204081;
      expv[43] = 43'h00810204081;
      expv[44] = 43'h00810204081;
      expv[45] = 43'h00810204081;
      expv[46] = 43'h00810204081;
      expv[47] = 43'h00810204081;
      expv[48] = 43'h00810204081;
      expv[49] = 43'h00810204081;
      expv[50] = 43'h00810204081;
      expv[51] = 43'h00810204081;
      expv[52] = 43'h00810204081;
      expv[53] = 43'h00810204081;
      expv[54] = 43'h00810204081;
      expv[55] = 43'h00810204081;
      expv[56] = 43'h00810204081;
      expv[57] = 43'h00810204081;
      expv[58] = 43'h00810204081;
      expv[59] = 43'h00810204081;
      expv[60] = 43'h00810204081;
      expv[61] = 43'h00810204081;
      expv[62] = 43'h00810204081;
      expv[63] = 43'h00810204081;
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
