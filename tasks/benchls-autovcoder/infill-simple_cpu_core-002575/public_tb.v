// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002575 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h102de56c8;
    stim[1] = 33'h19caa3fa8;
    stim[2] = 33'h0a43de16e;
    stim[3] = 33'h06afb1afe;
    stim[4] = 33'h0b21064df;
    stim[5] = 33'h0ce6257c7;
    stim[6] = 33'h06da7044f;
    stim[7] = 33'h008022599;
    stim[8] = 33'h0b85bb240;
    stim[9] = 33'h0dfda11db;
    stim[10] = 33'h0a35b7d74;
    stim[11] = 33'h0166db27c;
    stim[12] = 33'h0723ee202;
    stim[13] = 33'h0f2da56ef;
    stim[14] = 33'h0e84fb762;
    stim[15] = 33'h03b91e670;
    stim[16] = 33'h0145e2ab3;
    stim[17] = 33'h086b07b83;
    stim[18] = 33'h044839a21;
    stim[19] = 33'h086b7dddf;
    stim[20] = 33'h0866beaad;
    stim[21] = 33'h0d7370e5e;
    stim[22] = 33'h012cd2da8;
    stim[23] = 33'h0e9a8c658;
    stim[24] = 33'h08f54f353;
    stim[25] = 33'h0a88faf3b;
    stim[26] = 33'h0a787e896;
    stim[27] = 33'h026731f0c;
    stim[28] = 33'h0ae052462;
    stim[29] = 33'h0cc33a6fb;
    stim[30] = 33'h06e9f8571;
    stim[31] = 33'h0bd494a0e;
    stim[32] = 33'h03481ba94;
    stim[33] = 33'h072d49e9b;
    stim[34] = 33'h0f5e6ff0e;
    stim[35] = 33'h086d2632e;
    stim[36] = 33'h0909f09f1;
    stim[37] = 33'h0c2f4f31f;
    stim[38] = 33'h060924332;
    stim[39] = 33'h04e73514e;
    stim[40] = 33'h0acdfe973;
    stim[41] = 33'h0cc711199;
    stim[42] = 33'h05a65067b;
    stim[43] = 33'h02444e184;
    stim[44] = 33'h012fd157e;
    stim[45] = 33'h056c0a50b;
    stim[46] = 33'h04b3d0a6c;
    stim[47] = 33'h0b1d4668f;
    stim[48] = 33'h027d041af;
    stim[49] = 33'h02c101dcd;
    stim[50] = 33'h0b540f565;
    stim[51] = 33'h0c81b6f03;
    stim[52] = 33'h08cd44aef;
    stim[53] = 33'h0270a7899;
    stim[54] = 33'h094097740;
    stim[55] = 33'h0417b03ea;
    stim[56] = 33'h0d40bc823;
    stim[57] = 33'h0f18dc19b;
    stim[58] = 33'h0cab8e73f;
    stim[59] = 33'h00f390099;
    stim[60] = 33'h0552e10cb;
    stim[61] = 33'h0fcd8a151;
    stim[62] = 33'h06f1ead40;
    stim[63] = 33'h0782919d0;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxa8;
      expv[3] = 74'h00000000xxxxxxxxx6e;
      expv[4] = 74'h00000000xxxxxxxxx6e;
      expv[5] = 74'h3fffffffc000000006e;
      expv[6] = 74'h000000000000000006e;
      expv[7] = 74'h000000004000000016e;
      expv[8] = 74'h0000000000000000099;
      expv[9] = 74'h0000000000000000099;
      expv[10] = 74'h3fffffffc0000000099;
      expv[11] = 74'h0000000000000000099;
      expv[12] = 74'h0000000080000000199;
      expv[13] = 74'h0000000000000000002;
      expv[14] = 74'h0000000000000000002;
      expv[15] = 74'h3fffffffc0000000002;
      expv[16] = 74'h0000000000000000002;
      expv[17] = 74'h00000000c0000000102;
      expv[18] = 74'h0000000000000000083;
      expv[19] = 74'h0000000000000000083;
      expv[20] = 74'h3fffffffc0000000083;
      expv[21] = 74'h0000000000000000083;
      expv[22] = 74'h0000000100000000183;
      expv[23] = 74'h00000000000000000a8;
      expv[24] = 74'h00000000000000000a8;
      expv[25] = 74'h3fffffffc00000000a8;
      expv[26] = 74'h00000000000000000a8;
      expv[27] = 74'h00000001400000001a8;
      expv[28] = 74'h000000000000000000c;
      expv[29] = 74'h000000000000000000c;
      expv[30] = 74'h3fffffffc000000000c;
      expv[31] = 74'h000000000000000000c;
      expv[32] = 74'h000000018000000010c;
      expv[33] = 74'h0000000000000000094;
      expv[34] = 74'h0000000000000000094;
      expv[35] = 74'h3fffffffc0000000094;
      expv[36] = 74'h0000000000000000094;
      expv[37] = 74'h00000001c0000000194;
      expv[38] = 74'h000000000000000001f;
      expv[39] = 74'h000000000000000001f;
      expv[40] = 74'h3fffffffc000000001f;
      expv[41] = 74'h000000000000000001f;
      expv[42] = 74'h000000020000000011f;
      expv[43] = 74'h000000000000000007b;
      expv[44] = 74'h000000000000000007b;
      expv[45] = 74'h3fffffffc000000007b;
      expv[46] = 74'h000000000000000007b;
      expv[47] = 74'h000000024000000017b;
      expv[48] = 74'h000000000000000008f;
      expv[49] = 74'h000000000000000008f;
      expv[50] = 74'h3fffffffc000000008f;
      expv[51] = 74'h000000000000000008f;
      expv[52] = 74'h000000028000000018f;
      expv[53] = 74'h00000000000000000ef;
      expv[54] = 74'h00000000000000000ef;
      expv[55] = 74'h3fffffffc00000000ef;
      expv[56] = 74'h00000000000000000ef;
      expv[57] = 74'h00000002c00000001ef;
      expv[58] = 74'h000000000000000009b;
      expv[59] = 74'h000000000000000009b;
      expv[60] = 74'h3fffffffc000000009b;
      expv[61] = 74'h000000000000000009b;
      expv[62] = 74'h000000030000000019b;
      expv[63] = 74'h0000000000000000040;
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
