// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140915 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[66:66]),
    .ap_start(in_vec[65:65]),
    .vld_i(in_vec[64:64]),
    .x_i_V(in_vec[63:32]),
    .rat_i_V(in_vec[31:0]),
    .ap_done(out_vec[35:35]),
    .ap_idle(out_vec[34:34]),
    .ap_ready(out_vec[33:33]),
    .vld_o(out_vec[32:32]),
    .y_o_V(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4f4d53e6fe2058fdd;
    stim[1] = 67'h5616ed25fee5f201f;
    stim[2] = 67'h06e0749c9665faf4e;
    stim[3] = 67'h13471f3bffb22e8c2;
    stim[4] = 67'h05a4f84c2c0faf24b;
    stim[5] = 67'h3076005da70bae914;
    stim[6] = 67'h0911897ab87375efa;
    stim[7] = 67'h091b7259923b11fe4;
    stim[8] = 67'h1eea57227bb3305ba;
    stim[9] = 67'h27247fbeffeaca6b4;
    stim[10] = 67'h39a5d371009305d9b;
    stim[11] = 67'h3ac8dd7eb90368d06;
    stim[12] = 67'h307256f639a2d6f87;
    stim[13] = 67'h2ff6a527f619b5d71;
    stim[14] = 67'h3ee6eacfeaa1a7e15;
    stim[15] = 67'h2a41553639bdfd3ad;
    stim[16] = 67'h29344b2a9b8a0ff3d;
    stim[17] = 67'h29473fa570c51b091;
    stim[18] = 67'h0ef537090addc75b5;
    stim[19] = 67'h2c77dff332c9b8068;
    stim[20] = 67'h1710283d86f619d88;
    stim[21] = 67'h2d6a4300a8dd681f0;
    stim[22] = 67'h1eb6266361eac1b40;
    stim[23] = 67'h14997d49d96efb51e;
    stim[24] = 67'h19580a64d24f1df10;
    stim[25] = 67'h184a0cde97686e26d;
    stim[26] = 67'h1194ae493e329bb9d;
    stim[27] = 67'h04c32a10ddf52f46e;
    stim[28] = 67'h19b2d2eb535c323a4;
    stim[29] = 67'h163da13b76d46fe77;
    stim[30] = 67'h3b9d0c243858e8576;
    stim[31] = 67'h01d13a5e566054364;
    stim[32] = 67'h220c8790c2f86efd4;
    stim[33] = 67'h0b883b903c0f272be;
    stim[34] = 67'h009c543ebb1c6d8ec;
    stim[35] = 67'h2032977fc7bec2435;
    stim[36] = 67'h0c5fc30d0c28a7dae;
    stim[37] = 67'h35a9b696089e9b799;
    stim[38] = 67'h07b668688b2617472;
    stim[39] = 67'h2d605b307bd09618f;
    stim[40] = 67'h3e79219ac6420d5c5;
    stim[41] = 67'h37fb93d1db91a94a7;
    stim[42] = 67'h3fdd30efc94ece409;
    stim[43] = 67'h1fa85dd833c00a9d8;
    stim[44] = 67'h1fee54354014015d5;
    stim[45] = 67'h3fc3c861dfc718be9;
    stim[46] = 67'h1e3d10f84a97b44dc;
    stim[47] = 67'h1a4cf46bcccd06489;
    stim[48] = 67'h0eefb34eeeb2e9a0a;
    stim[49] = 67'h0bf8109c4f8fc5e3d;
    stim[50] = 67'h0291278d2a7bee30b;
    stim[51] = 67'h1e92b22ac9f869a19;
    stim[52] = 67'h0073ff5c9c5c575f9;
    stim[53] = 67'h0ced42e6133f1d18a;
    stim[54] = 67'h034e8bd0aaf33373f;
    stim[55] = 67'h06ad6b8c2132e2c92;
    stim[56] = 67'h17b4c223c4211bc51;
    stim[57] = 67'h3e036dbc47d7ff5c9;
    stim[58] = 67'h27b53d6e85ee322f1;
    stim[59] = 67'h1f8828d79f77d05c0;
    stim[60] = 67'h2e68a57ab2f52f4d6;
    stim[61] = 67'h248e9dfc8d26c5a01;
    stim[62] = 67'h144f41b2978dc9d80;
    stim[63] = 67'h0e245488199052d49;
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
      expv[0] = 36'h400000000;
      expv[1] = 36'h400000000;
      expv[2] = 36'h400000000;
      expv[3] = 36'h400000000;
      expv[4] = 36'h400000000;
      expv[5] = 36'h400000000;
      expv[6] = 36'hb9937df08;
      expv[7] = 36'h49937df08;
      expv[8] = 36'h49937df08;
      expv[9] = 36'h49937df08;
      expv[10] = 36'h49937df08;
      expv[11] = 36'hb367126b0;
      expv[12] = 36'hbe6d17e82;
      expv[13] = 36'hb2270aa35;
      expv[14] = 36'h42270aa35;
      expv[15] = 36'hb460534d6;
      expv[16] = 36'h4460534d6;
      expv[17] = 36'h4460534d6;
      expv[18] = 36'h4460534d6;
      expv[19] = 36'h4460534d6;
      expv[20] = 36'h4460534d6;
      expv[21] = 36'h4460534d6;
      expv[22] = 36'h4460534d6;
      expv[23] = 36'h4460534d6;
      expv[24] = 36'h4460534d6;
      expv[25] = 36'h4460534d6;
      expv[26] = 36'h4460534d6;
      expv[27] = 36'h4460534d6;
      expv[28] = 36'h4460534d6;
      expv[29] = 36'h4460534d6;
      expv[30] = 36'h4460534d6;
      expv[31] = 36'hbab5059e2;
      expv[32] = 36'h4ab5059e2;
      expv[33] = 36'h4ab5059e2;
      expv[34] = 36'h4ab5059e2;
      expv[35] = 36'h4ab5059e2;
      expv[36] = 36'h4ab5059e2;
      expv[37] = 36'h4ab5059e2;
      expv[38] = 36'hb87959a60;
      expv[39] = 36'h487959a60;
      expv[40] = 36'h487959a60;
      expv[41] = 36'hb2849dd5c;
      expv[42] = 36'hb931da1eb;
      expv[43] = 36'hb6613f6dc;
      expv[44] = 36'h46613f6dc;
      expv[45] = 36'h46613f6dc;
      expv[46] = 36'hb2eb4cf65;
      expv[47] = 36'h42eb4cf65;
      expv[48] = 36'h42eb4cf65;
      expv[49] = 36'h42eb4cf65;
      expv[50] = 36'h42eb4cf65;
      expv[51] = 36'h42eb4cf65;
      expv[52] = 36'h42eb4cf65;
      expv[53] = 36'h42eb4cf65;
      expv[54] = 36'h42eb4cf65;
      expv[55] = 36'h42eb4cf65;
      expv[56] = 36'h42eb4cf65;
      expv[57] = 36'h42eb4cf65;
      expv[58] = 36'hb45a120e4;
      expv[59] = 36'h445a120e4;
      expv[60] = 36'h445a120e4;
      expv[61] = 36'h445a120e4;
      expv[62] = 36'h445a120e4;
      expv[63] = 36'h445a120e4;
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
