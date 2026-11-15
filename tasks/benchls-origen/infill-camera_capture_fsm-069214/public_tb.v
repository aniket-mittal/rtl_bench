// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_069214 dut (
    .PCLK(clk),
    .RESETn(in_vec[13:13]),
    .VSYNC(in_vec[12:12]),
    .HREF(in_vec[11:11]),
    .D(in_vec[10:3]),
    .block(in_vec[2:2]),
    .wr_delay(in_vec[1:1]),
    .init_done(in_vec[0:0]),
    .dout(out_vec[9:2]),
    .valid(out_vec[1:1]),
    .frame_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h1d09;
    stim[1] = 14'h1cd1;
    stim[2] = 14'h30e7;
    stim[3] = 14'h2f8f;
    stim[4] = 14'h2c51;
    stim[5] = 14'h3619;
    stim[6] = 14'h2204;
    stim[7] = 14'h2766;
    stim[8] = 14'h34ea;
    stim[9] = 14'h31f6;
    stim[10] = 14'h32a5;
    stim[11] = 14'h2366;
    stim[12] = 14'h35f7;
    stim[13] = 14'h2f7a;
    stim[14] = 14'h33d6;
    stim[15] = 14'h35ca;
    stim[16] = 14'h2c63;
    stim[17] = 14'h298b;
    stim[18] = 14'h3cec;
    stim[19] = 14'h242c;
    stim[20] = 14'h3a9d;
    stim[21] = 14'h3dca;
    stim[22] = 14'h266d;
    stim[23] = 14'h3b6f;
    stim[24] = 14'h3db9;
    stim[25] = 14'h2445;
    stim[26] = 14'h2406;
    stim[27] = 14'h271d;
    stim[28] = 14'h35d8;
    stim[29] = 14'h3d9b;
    stim[30] = 14'h27bb;
    stim[31] = 14'h35e3;
    stim[32] = 14'h3b36;
    stim[33] = 14'h2ead;
    stim[34] = 14'h35e9;
    stim[35] = 14'h2f12;
    stim[36] = 14'h2dd9;
    stim[37] = 14'h2231;
    stim[38] = 14'h3d5c;
    stim[39] = 14'h3331;
    stim[40] = 14'h30b5;
    stim[41] = 14'h389b;
    stim[42] = 14'h2274;
    stim[43] = 14'h32a4;
    stim[44] = 14'h36e8;
    stim[45] = 14'h3028;
    stim[46] = 14'h34ad;
    stim[47] = 14'h272b;
    stim[48] = 14'h25df;
    stim[49] = 14'h3fb6;
    stim[50] = 14'h2357;
    stim[51] = 14'h3ac7;
    stim[52] = 14'h30f5;
    stim[53] = 14'h2b04;
    stim[54] = 14'h338e;
    stim[55] = 14'h29c3;
    stim[56] = 14'h220d;
    stim[57] = 14'h3c9a;
    stim[58] = 14'h3797;
    stim[59] = 14'h232e;
    stim[60] = 14'h2ca4;
    stim[61] = 14'h3d08;
    stim[62] = 14'h3471;
    stim[63] = 14'h243a;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h070;
      expv[5] = 10'h3c4;
      expv[6] = 10'h228;
      expv[7] = 10'h30c;
      expv[8] = 10'h101;
      expv[9] = 10'h3b0;
      expv[10] = 10'h274;
      expv[11] = 10'h0f8;
      expv[12] = 10'h150;
      expv[13] = 10'h1b0;
      expv[14] = 10'h2f8;
      expv[15] = 10'h3bc;
      expv[16] = 10'h1e8;
      expv[17] = 10'h2e4;
      expv[18] = 10'h230;
      expv[19] = 10'h0c4;
      expv[20] = 10'h274;
      expv[21] = 10'h215;
      expv[22] = 10'h14c;
      expv[23] = 10'h2e4;
      expv[24] = 10'h334;
      expv[25] = 10'h1b4;
      expv[26] = 10'h2de;
      expv[27] = 10'h221;
      expv[28] = 10'h200;
      expv[29] = 10'h38c;
      expv[30] = 10'h2ec;
      expv[31] = 10'h2cc;
      expv[32] = 10'h3dc;
      expv[33] = 10'h2f0;
      expv[34] = 10'h198;
      expv[35] = 10'h354;
      expv[36] = 10'h2f4;
      expv[37] = 10'h388;
      expv[38] = 10'h2ec;
      expv[39] = 10'h118;
      expv[40] = 10'h2ac;
      expv[41] = 10'h198;
      expv[42] = 10'h058;
      expv[43] = 10'h04e;
      expv[44] = 10'h139;
      expv[45] = 10'h150;
      expv[46] = 10'h374;
      expv[47] = 10'h014;
      expv[48] = 10'h254;
      expv[49] = 10'h394;
      expv[50] = 10'h2ec;
      expv[51] = 10'h3d8;
      expv[52] = 10'h1a9;
      expv[53] = 10'h160;
      expv[54] = 10'h078;
      expv[55] = 10'h180;
      expv[56] = 10'h1c4;
      expv[57] = 10'h0e2;
      expv[58] = 10'h105;
      expv[59] = 10'h24c;
      expv[60] = 10'h3c8;
      expv[61] = 10'h195;
      expv[62] = 10'h250;
      expv[63] = 10'h284;
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
