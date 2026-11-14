// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03025 dut (
    .i_data(in_vec[19:0]),
    .o_data_36(out_vec[53:27]),
    .o_data_83(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h608dc;
    stim[1] = 20'h3687a;
    stim[2] = 20'hd7a3c;
    stim[3] = 20'h4e1dc;
    stim[4] = 20'h07457;
    stim[5] = 20'hd1406;
    stim[6] = 20'h127d7;
    stim[7] = 20'hf75ab;
    stim[8] = 20'hb65e0;
    stim[9] = 20'hbfcf5;
    stim[10] = 20'hceaec;
    stim[11] = 20'h03050;
    stim[12] = 20'h52223;
    stim[13] = 20'hec32d;
    stim[14] = 20'h37054;
    stim[15] = 20'h643eb;
    stim[16] = 20'h6b430;
    stim[17] = 20'h430c7;
    stim[18] = 20'h2c0f2;
    stim[19] = 20'h18031;
    stim[20] = 20'h7c760;
    stim[21] = 20'hf63a0;
    stim[22] = 20'h55cca;
    stim[23] = 20'hdb784;
    stim[24] = 20'hbf2e5;
    stim[25] = 20'haba2c;
    stim[26] = 20'h68f2e;
    stim[27] = 20'h606e2;
    stim[28] = 20'hf4fb9;
    stim[29] = 20'h79601;
    stim[30] = 20'h2850d;
    stim[31] = 20'h028db;
    stim[32] = 20'h76d9d;
    stim[33] = 20'h4e285;
    stim[34] = 20'h92d0c;
    stim[35] = 20'h5eb4e;
    stim[36] = 20'h143d5;
    stim[37] = 20'hd015d;
    stim[38] = 20'h8395e;
    stim[39] = 20'ha4de0;
    stim[40] = 20'h20635;
    stim[41] = 20'h0f3d7;
    stim[42] = 20'h716ed;
    stim[43] = 20'h8188b;
    stim[44] = 20'h9af06;
    stim[45] = 20'h13888;
    stim[46] = 20'h6b635;
    stim[47] = 20'h9feb4;
    stim[48] = 20'h4b95a;
    stim[49] = 20'h6814b;
    stim[50] = 20'h6d714;
    stim[51] = 20'h80043;
    stim[52] = 20'h3cef1;
    stim[53] = 20'h57816;
    stim[54] = 20'hd30e9;
    stim[55] = 20'hdd326;
    stim[56] = 20'h7e93b;
    stim[57] = 20'hfbe6f;
    stim[58] = 20'hcc92d;
    stim[59] = 20'hf702d;
    stim[60] = 20'hd3b41;
    stim[61] = 20'hc37f3;
    stim[62] = 20'hb8084;
    stim[63] = 20'h54a55;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 54'h06c9f781f4df54;
      expv[1] = 54'h03d589411adf8e;
      expv[2] = 54'h3d2983872ea174;
      expv[3] = 54'h057e1781953a54;
      expv[4] = 54'h0082e1e025b835;
      expv[5] = 54'h3cb686c70d7df2;
      expv[6] = 54'h014cd1e05feab5;
      expv[7] = 54'h3f646067d32671;
      expv[8] = 54'h3ad29c068207a0;
      expv[9] = 54'h3b7c93a6b3036f;
      expv[10] = 54'h3c884987002a84;
      expv[11] = 54'h00365a000fa9f0;
      expv[12] = 54'h05c66761aa1159;
      expv[13] = 54'h3e9b92a7994797;
      expv[14] = 54'h03de5e811d6b3c;
      expv[15] = 54'h070c6862080531;
      expv[16] = 54'h078ab6022c6b90;
      expv[17] = 54'h04b6dfe15bd085;
      expv[18] = 54'h03191040e48e76;
      expv[19] = 54'h01b037207c8fe3;
      expv[20] = 54'h08c04c0285a420;
      expv[21] = 54'h3f501407cd4ce0;
      expv[22] = 54'h06086341bd157e;
      expv[23] = 54'h3d6e7487427fcc;
      expv[24] = 54'h3b7141a6afc03f;
      expv[25] = 54'h3a1171864a5c44;
      expv[26] = 54'h076113c2206bea;
      expv[27] = 54'h06c7be41f43b46;
      expv[28] = 54'h3f39b027c6d8fb;
      expv[29] = 54'h0888c12275a253;
      expv[30] = 54'h02d5aea0d12337;
      expv[31] = 54'h002df6600d3f01;
      expv[32] = 54'h085b50a26889e7;
      expv[33] = 54'h057ed5a195711f;
      expv[34] = 54'h3852ad85c99ae4;
      expv[35] = 54'h06a8b7c1eb4a4a;
      expv[36] = 54'h016c4fa068fe0f;
      expv[37] = 54'h3ca188a7077127;
      expv[38] = 54'h374089c57a997a;
      expv[39] = 54'h39979c06273fa0;
      expv[40] = 54'h0246fba0a8032f;
      expv[41] = 54'h011251e04f0eb5;
      expv[42] = 54'h07f9caa24c6ed7;
      expv[43] = 54'h371b9c656ff511;
      expv[44] = 54'h38e4e6c5f3bef2;
      expv[45] = 54'h015f9900655418;
      expv[46] = 54'h078cfba22d132f;
      expv[47] = 54'h393e8a860d945c;
      expv[48] = 54'h0550854188182e;
      expv[49] = 54'h075174621beb51;
      expv[50] = 54'h07b1f68237bb7c;
      expv[51] = 54'h37004b656815b9;
      expv[52] = 54'h0448cf213c1823;
      expv[53] = 54'h062718c1c5ef22;
      expv[54] = 54'h3cd7062716db8b;
      expv[55] = 54'h3d8d8ac74b7552;
      expv[56] = 54'h08e66262909e21;
      expv[57] = 54'h3fb63ce7eabdfd;
      expv[58] = 54'h3c6252a6f53997;
      expv[59] = 54'h3f5e32a7d15e97;
      expv[60] = 54'h3ce2a9271a3613;
      expv[61] = 54'h3bbef166c623c9;
      expv[62] = 54'h3af094868aaacc;
      expv[63] = 54'h05f39fa1b7198f;
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
