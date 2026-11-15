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

  autovcoder_030129 dut (
    .clk(clk),
    .ena(in_vec[24:24]),
    .z(in_vec[23:8]),
    .d(in_vec[7:0]),
    .q(out_vec[17:10]),
    .s(out_vec[9:2]),
    .div0(out_vec[1:1]),
    .ovf(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h04fbb2b;
    stim[1] = 25'h092ccb1;
    stim[2] = 25'h156f5f7;
    stim[3] = 25'h12d02c2;
    stim[4] = 25'h0ee0a64;
    stim[5] = 25'h0a8c26f;
    stim[6] = 25'h142b06f;
    stim[7] = 25'h1ba4030;
    stim[8] = 25'h18ae760;
    stim[9] = 25'h0b975a2;
    stim[10] = 25'h036fc05;
    stim[11] = 25'h050ca4a;
    stim[12] = 25'h12dcb4d;
    stim[13] = 25'h12ecf52;
    stim[14] = 25'h149128d;
    stim[15] = 25'h155f39f;
    stim[16] = 25'h1d4430a;
    stim[17] = 25'h1175581;
    stim[18] = 25'h1a01bf1;
    stim[19] = 25'h1555066;
    stim[20] = 25'h18d4172;
    stim[21] = 25'h0aa1eff;
    stim[22] = 25'h0b40f9f;
    stim[23] = 25'h181ec4f;
    stim[24] = 25'h0f3ba53;
    stim[25] = 25'h1e18716;
    stim[26] = 25'h00dc0c9;
    stim[27] = 25'h1e5e043;
    stim[28] = 25'h09dbc4b;
    stim[29] = 25'h0e718e2;
    stim[30] = 25'h00c0e62;
    stim[31] = 25'h0cbf4f8;
    stim[32] = 25'h12941f5;
    stim[33] = 25'h0b564a4;
    stim[34] = 25'h1370cf8;
    stim[35] = 25'h19802a1;
    stim[36] = 25'h198df9a;
    stim[37] = 25'h07b70d1;
    stim[38] = 25'h13547c2;
    stim[39] = 25'h1c887b7;
    stim[40] = 25'h0a87f07;
    stim[41] = 25'h10d9741;
    stim[42] = 25'h15a5528;
    stim[43] = 25'h1b89f70;
    stim[44] = 25'h001fbca;
    stim[45] = 25'h013a1e8;
    stim[46] = 25'h15c3a45;
    stim[47] = 25'h1b27d93;
    stim[48] = 25'h0a6f044;
    stim[49] = 25'h150626a;
    stim[50] = 25'h039f401;
    stim[51] = 25'h0172339;
    stim[52] = 25'h146935e;
    stim[53] = 25'h01192b4;
    stim[54] = 25'h1a8a0e9;
    stim[55] = 25'h0bcf3bc;
    stim[56] = 25'h1bd0cac;
    stim[57] = 25'h17a1087;
    stim[58] = 25'h1cde288;
    stim[59] = 25'h0765475;
    stim[60] = 25'h19e30e7;
    stim[61] = 25'h128688c;
    stim[62] = 25'h07aa087;
    stim[63] = 25'h0098110;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'h16804;
      expv[17] = 18'h0ec10;
      expv[18] = 18'h26414;
      expv[19] = 18'h15415;
      expv[20] = 18'h2ec31;
      expv[21] = 18'h26004;
      expv[22] = 18'h26004;
      expv[23] = 18'h26004;
      expv[24] = 18'h24800;
      expv[25] = 18'h24800;
      expv[26] = 18'h21014;
      expv[27] = 18'h21014;
      expv[28] = 18'h2280c;
      expv[29] = 18'h2280c;
      expv[30] = 18'h2280c;
      expv[31] = 18'h2280c;
      expv[32] = 18'h2280c;
      expv[33] = 18'h0b421;
      expv[34] = 18'h0b421;
      expv[35] = 18'h0b808;
      expv[36] = 18'h2a804;
      expv[37] = 18'h35800;
      expv[38] = 18'h35800;
      expv[39] = 18'h33821;
      expv[40] = 18'h2d831;
      expv[41] = 18'h2d831;
      expv[42] = 18'h0842d;
      expv[43] = 18'h08c2d;
      expv[44] = 18'h0ac04;
      expv[45] = 18'h0ac04;
      expv[46] = 18'h0ac04;
      expv[47] = 18'h0e030;
      expv[48] = 18'h3c41c;
      expv[49] = 18'h3c41c;
      expv[50] = 18'h3f804;
      expv[51] = 18'h3f804;
      expv[52] = 18'h3f804;
      expv[53] = 18'h1180c;
      expv[54] = 18'h1180c;
      expv[55] = 18'h30835;
      expv[56] = 18'h30835;
      expv[57] = 18'h0d408;
      expv[58] = 18'h3102d;
      expv[59] = 18'h1f81d;
      expv[60] = 18'h1f81d;
      expv[61] = 18'h38035;
      expv[62] = 18'h2d83d;
      expv[63] = 18'h2d83d;
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
