// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063456 dut (
    .clock(clk),
    .reset(in_vec[33:33]),
    .io_a(in_vec[32:17]),
    .io_b(in_vec[16:1]),
    .io_e(in_vec[0:0]),
    .io_z(out_vec[16:1]),
    .io_v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2a9a17468;
    stim[1] = 34'h27bba27fe;
    stim[2] = 34'h09f2e6ace;
    stim[3] = 34'h1d9efaec4;
    stim[4] = 34'h145473f59;
    stim[5] = 34'h1b5bad440;
    stim[6] = 34'h183901b07;
    stim[7] = 34'h098cfbadc;
    stim[8] = 34'h17cda6bb1;
    stim[9] = 34'h0b0634848;
    stim[10] = 34'h0c90c2598;
    stim[11] = 34'h0c1572101;
    stim[12] = 34'h06f716856;
    stim[13] = 34'h157a9e749;
    stim[14] = 34'h15915deb2;
    stim[15] = 34'h0f8d6745f;
    stim[16] = 34'h1f19e0beb;
    stim[17] = 34'h1fea8fe9b;
    stim[18] = 34'h0dc2b85e0;
    stim[19] = 34'h0ea38dbf0;
    stim[20] = 34'h0591f4c3f;
    stim[21] = 34'h062cdb878;
    stim[22] = 34'h1e05b8797;
    stim[23] = 34'h0b7c86970;
    stim[24] = 34'h1bd9db0da;
    stim[25] = 34'h0fee33200;
    stim[26] = 34'h1abd6a538;
    stim[27] = 34'h067be67a6;
    stim[28] = 34'h1a9fad821;
    stim[29] = 34'h043ba56de;
    stim[30] = 34'h0351bb86f;
    stim[31] = 34'h177c262d0;
    stim[32] = 34'h108489412;
    stim[33] = 34'h0925bba0c;
    stim[34] = 34'h00a018a34;
    stim[35] = 34'h0adc9cef4;
    stim[36] = 34'h194fc7847;
    stim[37] = 34'h0b0c3148f;
    stim[38] = 34'h1d8838488;
    stim[39] = 34'h14a631857;
    stim[40] = 34'h1590601f7;
    stim[41] = 34'h1d258a325;
    stim[42] = 34'h13e8b20c4;
    stim[43] = 34'h105e6b102;
    stim[44] = 34'h1ca87161e;
    stim[45] = 34'h0148fc002;
    stim[46] = 34'h030d009ae;
    stim[47] = 34'h1d6ffa7e5;
    stim[48] = 34'h147df7c55;
    stim[49] = 34'h10e655953;
    stim[50] = 34'h04b568a1a;
    stim[51] = 34'h04f862874;
    stim[52] = 34'h058af5d98;
    stim[53] = 34'h1dc83a63b;
    stim[54] = 34'h047093394;
    stim[55] = 34'h1cf76cf8f;
    stim[56] = 34'h1dbfaa821;
    stim[57] = 34'h139ed8889;
    stim[58] = 34'h17689037f;
    stim[59] = 34'h0ffb3122a;
    stim[60] = 34'h0ddeb37cf;
    stim[61] = 34'h15d603163;
    stim[62] = 34'h150e56c8f;
    stim[63] = 34'h1fbeab966;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'h14546;
      expv[6] = 17'h005ee;
      expv[7] = 17'h18390;
      expv[8] = 17'h1688a;
      expv[9] = 17'h17cda;
      expv[10] = 17'h1112a;
      expv[11] = 17'h0a57a;
      expv[12] = 17'h0c156;
      expv[13] = 17'h0c156;
      expv[14] = 17'h157a8;
      expv[15] = 17'h157a8;
      expv[16] = 17'h0f8d6;
      expv[17] = 17'h1f19e;
      expv[18] = 17'h1fea8;
      expv[19] = 17'h1000e;
      expv[20] = 17'h00174;
      expv[21] = 17'h0591e;
      expv[22] = 17'h0591e;
      expv[23] = 17'h1e05a;
      expv[24] = 17'h058c4;
      expv[25] = 17'h058c4;
      expv[26] = 17'h058c4;
      expv[27] = 17'h058c4;
      expv[28] = 17'h058c4;
      expv[29] = 17'h1a9fa;
      expv[30] = 17'h0d1da;
      expv[31] = 17'h0351a;
      expv[32] = 17'h0351a;
      expv[33] = 17'h0351a;
      expv[34] = 17'h0351a;
      expv[35] = 17'h0351a;
      expv[36] = 17'h0351a;
      expv[37] = 17'h194fc;
      expv[38] = 17'h0b0c2;
      expv[39] = 17'h0b0c2;
      expv[40] = 17'h14a62;
      expv[41] = 17'h15906;
      expv[42] = 17'h1d258;
      expv[43] = 17'h12f34;
      expv[44] = 17'h08c10;
      expv[45] = 17'h08c10;
      expv[46] = 17'h074fc;
      expv[47] = 17'h05de8;
      expv[48] = 17'h1d6fe;
      expv[49] = 17'h147de;
      expv[50] = 17'h10e64;
      expv[51] = 17'h10e64;
      expv[52] = 17'h0c376;
      expv[53] = 17'h07888;
      expv[54] = 17'h1dc82;
      expv[55] = 17'h03648;
      expv[56] = 17'h1cf76;
      expv[57] = 17'h1dbfa;
      expv[58] = 17'h139ec;
      expv[59] = 17'h17688;
      expv[60] = 17'h0730a;
      expv[61] = 17'h0ddea;
      expv[62] = 17'h15d60;
      expv[63] = 17'h150e4;
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
