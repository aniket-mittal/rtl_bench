// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034201 dut (
    .clk(clk),
    .rst(in_vec[77:77]),
    .mfc0(in_vec[76:76]),
    .addr(in_vec[75:71]),
    .mtc0(in_vec[70:70]),
    .data(in_vec[69:38]),
    .exception(in_vec[37:37]),
    .eret(in_vec[36:36]),
    .pc(in_vec[35:4]),
    .cause(in_vec[3:0]),
    .CP0_out(out_vec[95:64]),
    .status(out_vec[63:32]),
    .epc_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h3740c8cc12a7af32cbb0;
    stim[1] = 78'h327cff608bd65e3dbd2e;
    stim[2] = 78'h060f0636486e672b7547;
    stim[3] = 78'h17661454bd0dca141c0c;
    stim[4] = 78'h032468eb39e17a418b9c;
    stim[5] = 78'h06558805bdf853e233ba;
    stim[6] = 78'h050f17616b5191b93098;
    stim[7] = 78'h0ed7b89335f50104ec31;
    stim[8] = 78'h16740f3bb635e71040e2;
    stim[9] = 78'h00d91fce4f8559c8d6ba;
    stim[10] = 78'h196572ef65b3136a8d0a;
    stim[11] = 78'h11f646ee7338538136e2;
    stim[12] = 78'h027c84d57bb58b8f591d;
    stim[13] = 78'h1dbb86df930eb69c8b4d;
    stim[14] = 78'h1e3eafedd8f807a14948;
    stim[15] = 78'h1b7f93a0326dcd64805a;
    stim[16] = 78'h057f009ddbdedbd2cd84;
    stim[17] = 78'h03669cf873371009f1ea;
    stim[18] = 78'h04ca31b8359709014bae;
    stim[19] = 78'h0fc2b3080724b4653d80;
    stim[20] = 78'h12e63c758fb30394fa79;
    stim[21] = 78'h08709cb2ca013a3c7c25;
    stim[22] = 78'h0b462b23e1c88ac7b65a;
    stim[23] = 78'h11e303416f819c5cff46;
    stim[24] = 78'h15d89e397474698cbe29;
    stim[25] = 78'h153b2ca3cc67d4929384;
    stim[26] = 78'h077579fdda8c65a88516;
    stim[27] = 78'h09d5180ac4dec0c85c72;
    stim[28] = 78'h1e5388298648823a59a3;
    stim[29] = 78'h00106d59dd9e74604d6e;
    stim[30] = 78'h1543d3123c52a95bef0d;
    stim[31] = 78'h059f1345fc07287d53e7;
    stim[32] = 78'h013d0d3f4a04f011f2e3;
    stim[33] = 78'h019d013695efd664993d;
    stim[34] = 78'h1bd6cbe089542f661db0;
    stim[35] = 78'h03059d88a07e5539f6b4;
    stim[36] = 78'h0dd591faba9011733735;
    stim[37] = 78'h008ebc70aaf1235a7892;
    stim[38] = 78'h0447058d1a6f12e86b0b;
    stim[39] = 78'h007842951c45b8df27a8;
    stim[40] = 78'h12ddf89aafff2ea7444a;
    stim[41] = 78'h13668c11b5e2a94ef540;
    stim[42] = 78'h15e3c293a0b134f227bf;
    stim[43] = 78'h15d6edca3b4b1542b59c;
    stim[44] = 78'h143f3fad47a1defc6dd0;
    stim[45] = 78'h1ea1e32783f5a057341e;
    stim[46] = 78'h02a7ebc88371950d55c6;
    stim[47] = 78'h0344092684d454028edf;
    stim[48] = 78'h1c088a4fe3200d560015;
    stim[49] = 78'h0df2db06dfe26a86654f;
    stim[50] = 78'h0a43b38dd788fdf177a0;
    stim[51] = 78'h133e609a567f91641d97;
    stim[52] = 78'h0bb2334aabe6c9245435;
    stim[53] = 78'h0aecf0d1430801d44ad7;
    stim[54] = 78'h0f11c5bf7ad6aaba76e8;
    stim[55] = 78'h0b887a83880899efcff7;
    stim[56] = 78'h10c3607dfbfc069cc0e3;
    stim[57] = 78'h111e40fe439fad4a0b5c;
    stim[58] = 78'h1e33a7083c94457d91ad;
    stim[59] = 78'h1d8f307e0d9757b1c8d2;
    stim[60] = 78'h3ee3e8ac167f1699f240;
    stim[61] = 78'h017b9ddf5ef7c4081def;
    stim[62] = 78'h101e9d2c9ea31fcb338b;
    stim[63] = 78'h00fbf5cb4be13bfe9f08;
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
      expv[0] = 96'hxxxxxxxx0000000f00000000;
      expv[1] = 96'hxxxxxxxx0000000f00000000;
      expv[2] = 96'hxxxxxxxx0000000f00000000;
      expv[3] = 96'hxxxxxxxx0000000f00000000;
      expv[4] = 96'h000000000000000f985152f4;
      expv[5] = 96'h000000000000000f985152f4;
      expv[6] = 96'h00000000562016f7985152f4;
      expv[7] = 96'h0000000002b100b7985152f4;
      expv[8] = 96'h0000000000158805985152f4;
      expv[9] = 96'h00158805d03ceed8985152f4;
      expv[10] = 96'h00158805d03ceed8985152f4;
      expv[11] = 96'hxxxxxxxx0681e776985152f4;
      expv[12] = 96'hxxxxxxxx00340f3b985152f4;
      expv[13] = 96'hxxxxxxxx0681e76058b8f58d;
      expv[14] = 96'hxxxxxxxx0681e76058b8f58d;
      expv[15] = 96'hxxxxxxxx00340f3b58b8f58d;
      expv[16] = 96'hxxxxxxxx00340f3b58b8f58d;
      expv[17] = 96'hxxxxxxxx0001a07958b8f58d;
      expv[18] = 96'hxxxxxxxx00000d0358b8f58d;
      expv[19] = 96'hxxxxxxxx0000006858b8f58d;
      expv[20] = 96'hxxxxxxxx0000006858b8f58d;
      expv[21] = 96'hxxxxxxxx0000000358b8f58d;
      expv[22] = 96'hxxxxxxxx0000000358b8f58d;
      expv[23] = 96'hxxxxxxxx0000000358b8f58d;
      expv[24] = 96'hd91bb9cc0000000358b8f58d;
      expv[25] = 96'hxxxxxxxx0000000058b8f58d;
      expv[26] = 96'hfc02776f0000000058b8f58d;
      expv[27] = 96'hfc02776f00000000d5e7f76a;
      expv[28] = 96'hfc02776f00000000d5e7f76a;
      expv[29] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[30] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[31] = 96'hfc02776f00000000d5e7f76a;
      expv[32] = 96'hfc02776f00000000d5e7f76a;
      expv[33] = 96'hfc02776f00000000d5e7f76a;
      expv[34] = 96'hfc02776f00000000d5e7f76a;
      expv[35] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[36] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[37] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[38] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[39] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[40] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[41] = 96'h98f1d63e00000000d5e7f76a;
      expv[42] = 96'h9a73e1cc00000000d5e7f76a;
      expv[43] = 96'h6278e5d100000000d5e7f76a;
      expv[44] = 96'h8f0a4e8200000000d5e7f76a;
      expv[45] = 96'h1c16346900000000d5e7f76a;
      expv[46] = 96'h5ee24cd700000000d5e7f76a;
      expv[47] = 96'h5ee24cd700000000d5e7f76a;
      expv[48] = 96'h5ee24cd700000000d5e7f76a;
      expv[49] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[50] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[51] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[52] = 96'h10249a1300000000d5e7f76a;
      expv[53] = 96'h10249a1300000000d5e7f76a;
      expv[54] = 96'h10249a1300000000d5e7f76a;
      expv[55] = 96'h10249a1300000000d5e7f76a;
      expv[56] = 96'h10249a1300000000d5e7f76a;
      expv[57] = 96'h647f393e00000000d5e7f76a;
      expv[58] = 96'hxxxxxxxx00000000d5e7f76a;
      expv[59] = 96'h4e20a61900000000d5e7f76a;
      expv[60] = 96'hcb6c1b7f0000000f00000000;
      expv[61] = 96'hcb6c1b7f0000000f00000000;
      expv[62] = 96'hcb6c1b7f0000000000000000;
      expv[63] = 96'he10a54710000000000000000;
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
