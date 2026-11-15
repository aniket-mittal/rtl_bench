// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_138550 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x(in_vec[15:0]),
    .y(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h10715;
    stim[1] = 17'h11a5e;
    stim[2] = 17'h05a15;
    stim[3] = 17'h1ef4e;
    stim[4] = 17'h021c2;
    stim[5] = 17'h0744b;
    stim[6] = 17'h0e5a7;
    stim[7] = 17'h09b4d;
    stim[8] = 17'h0c951;
    stim[9] = 17'h01950;
    stim[10] = 17'h05266;
    stim[11] = 17'h04321;
    stim[12] = 17'h0151d;
    stim[13] = 17'h1c999;
    stim[14] = 17'h03f13;
    stim[15] = 17'h05901;
    stim[16] = 17'h0e696;
    stim[17] = 17'h09cc4;
    stim[18] = 17'h037ec;
    stim[19] = 17'h0bb4a;
    stim[20] = 17'h0b582;
    stim[21] = 17'h095f3;
    stim[22] = 17'h0f65d;
    stim[23] = 17'h0a90c;
    stim[24] = 17'h07b5f;
    stim[25] = 17'h02968;
    stim[26] = 17'h0153b;
    stim[27] = 17'h0715a;
    stim[28] = 17'h0bcdb;
    stim[29] = 17'h08a3b;
    stim[30] = 17'h0ca68;
    stim[31] = 17'h04581;
    stim[32] = 17'h0078f;
    stim[33] = 17'h062e7;
    stim[34] = 17'h0aed0;
    stim[35] = 17'h0bf60;
    stim[36] = 17'h002f6;
    stim[37] = 17'h07abd;
    stim[38] = 17'h0334e;
    stim[39] = 17'h01130;
    stim[40] = 17'h0d13c;
    stim[41] = 17'h09f16;
    stim[42] = 17'h07beb;
    stim[43] = 17'h0b3bc;
    stim[44] = 17'h065c5;
    stim[45] = 17'h01d46;
    stim[46] = 17'h05c4c;
    stim[47] = 17'h0ce9d;
    stim[48] = 17'h06037;
    stim[49] = 17'h09048;
    stim[50] = 17'h071d7;
    stim[51] = 17'h02b69;
    stim[52] = 17'h01d91;
    stim[53] = 17'h05fc2;
    stim[54] = 17'h098c6;
    stim[55] = 17'h0dc4f;
    stim[56] = 17'h095df;
    stim[57] = 17'h0c789;
    stim[58] = 17'h0a9c8;
    stim[59] = 17'h00292;
    stim[60] = 17'h01a9a;
    stim[61] = 17'h07ecf;
    stim[62] = 17'h0acd8;
    stim[63] = 17'h05d0c;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h5f96;
      expv[8] = 16'h4db3;
      expv[9] = 16'hd2a8;
      expv[10] = 16'hd7a2;
      expv[11] = 16'h6ec5;
      expv[12] = 16'h1ba7;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h8631;
      expv[18] = 16'h3782;
      expv[19] = 16'h02a1;
      expv[20] = 16'haa79;
      expv[21] = 16'hdd78;
      expv[22] = 16'h4c90;
      expv[23] = 16'h7134;
      expv[24] = 16'hbd39;
      expv[25] = 16'h6055;
      expv[26] = 16'h8a3b;
      expv[27] = 16'h41d5;
      expv[28] = 16'h3d90;
      expv[29] = 16'hb6cb;
      expv[30] = 16'h780d;
      expv[31] = 16'h3bb6;
      expv[32] = 16'h31fe;
      expv[33] = 16'hed07;
      expv[34] = 16'h181b;
      expv[35] = 16'h156c;
      expv[36] = 16'h223c;
      expv[37] = 16'h90bb;
      expv[38] = 16'ha53f;
      expv[39] = 16'hc972;
      expv[40] = 16'hbb9e;
      expv[41] = 16'h9a03;
      expv[42] = 16'hd90f;
      expv[43] = 16'ha381;
      expv[44] = 16'hc333;
      expv[45] = 16'h29fc;
      expv[46] = 16'h18d7;
      expv[47] = 16'hda69;
      expv[48] = 16'h8bcd;
      expv[49] = 16'h9b55;
      expv[50] = 16'h33d5;
      expv[51] = 16'h7d71;
      expv[52] = 16'h9810;
      expv[53] = 16'h320b;
      expv[54] = 16'h1597;
      expv[55] = 16'h6139;
      expv[56] = 16'he81c;
      expv[57] = 16'h92b6;
      expv[58] = 16'h07e0;
      expv[59] = 16'h281b;
      expv[60] = 16'hd9a8;
      expv[61] = 16'hf2f0;
      expv[62] = 16'h7dd4;
      expv[63] = 16'hbbb9;
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
