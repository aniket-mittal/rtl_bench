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

  autovcoder_000631 dut (
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
    stim[0] = 33'h159900719;
    stim[1] = 33'h102f19797;
    stim[2] = 33'h091cc607e;
    stim[3] = 33'h04ffae63a;
    stim[4] = 33'h04850ffa0;
    stim[5] = 33'h0ce033681;
    stim[6] = 33'h0659e5f88;
    stim[7] = 33'h011e6bdb5;
    stim[8] = 33'h003498803;
    stim[9] = 33'h0d98247e4;
    stim[10] = 33'h02e52af24;
    stim[11] = 33'h04ed20a5d;
    stim[12] = 33'h057a09144;
    stim[13] = 33'h0cb0d0b52;
    stim[14] = 33'h02149f2fa;
    stim[15] = 33'h0e1cf27c4;
    stim[16] = 33'h0fdbbf822;
    stim[17] = 33'h0c103fe99;
    stim[18] = 33'h0a2483a5a;
    stim[19] = 33'h0d5d5420e;
    stim[20] = 33'h05bc2a97e;
    stim[21] = 33'h0c09da5c3;
    stim[22] = 33'h0425223ec;
    stim[23] = 33'h08beb20e9;
    stim[24] = 33'h0a5edd6f1;
    stim[25] = 33'h0b5fe8e8d;
    stim[26] = 33'h0b389c576;
    stim[27] = 33'h034568864;
    stim[28] = 33'h0d029271a;
    stim[29] = 33'h01bd5167c;
    stim[30] = 33'h0ae13c656;
    stim[31] = 33'h023609852;
    stim[32] = 33'h0f29a63c9;
    stim[33] = 33'h035773f3b;
    stim[34] = 33'h061dc7f93;
    stim[35] = 33'h0d729ce25;
    stim[36] = 33'h03886f8d8;
    stim[37] = 33'h0651c4bd4;
    stim[38] = 33'h02b7a170e;
    stim[39] = 33'h054153d4a;
    stim[40] = 33'h0205c45ab;
    stim[41] = 33'h0576cdcb2;
    stim[42] = 33'h09d21e761;
    stim[43] = 33'h036187927;
    stim[44] = 33'h07b9a2f5e;
    stim[45] = 33'h0d768abb8;
    stim[46] = 33'h0a179952d;
    stim[47] = 33'h02e058fca;
    stim[48] = 33'h0b1314b47;
    stim[49] = 33'h0d904ab9e;
    stim[50] = 33'h084e113f3;
    stim[51] = 33'h06ee9cff4;
    stim[52] = 33'h044b881d6;
    stim[53] = 33'h037348317;
    stim[54] = 33'h0f6d3bf74;
    stim[55] = 33'h00e6f4b36;
    stim[56] = 33'h03f764344;
    stim[57] = 33'h0e482ee51;
    stim[58] = 33'h04a7da694;
    stim[59] = 33'h000a10fa6;
    stim[60] = 33'h0df1ed256;
    stim[61] = 33'h052c49d43;
    stim[62] = 33'h1025d3ff9;
    stim[63] = 33'h0e9dc6571;
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
      expv[2] = 74'h00000000xxxxxxxxx97;
      expv[3] = 74'h00000000xxxxxxxxx7e;
      expv[4] = 74'h00000000xxxxxxxxx7e;
      expv[5] = 74'h000000000000000007e;
      expv[6] = 74'h000000000000000007e;
      expv[7] = 74'h000000004000000017e;
      expv[8] = 74'h00000000000000000b5;
      expv[9] = 74'h00000000000000000b5;
      expv[10] = 74'h00000000000000000b5;
      expv[11] = 74'h00000000000000000b5;
      expv[12] = 74'h00000000800000001b5;
      expv[13] = 74'h0000000000000000044;
      expv[14] = 74'h0000000000000000044;
      expv[15] = 74'h0000000000000000044;
      expv[16] = 74'h0000000000000000044;
      expv[17] = 74'h00000000c0000000144;
      expv[18] = 74'h0000000000000000099;
      expv[19] = 74'h0000000000000000099;
      expv[20] = 74'h0000000000000000099;
      expv[21] = 74'h0000000000000000099;
      expv[22] = 74'h0000000100000000199;
      expv[23] = 74'h00000000000000000ec;
      expv[24] = 74'h00000000000000000ec;
      expv[25] = 74'h00000000000000000ec;
      expv[26] = 74'h00000000000000000ec;
      expv[27] = 74'h00000001400000001ec;
      expv[28] = 74'h0000000000000000064;
      expv[29] = 74'h0000000000000000064;
      expv[30] = 74'h0000000000000000064;
      expv[31] = 74'h0000000000000000064;
      expv[32] = 74'h0000000180000000164;
      expv[33] = 74'h00000000000000000c9;
      expv[34] = 74'h00000000000000000c9;
      expv[35] = 74'h00000000000000000c9;
      expv[36] = 74'h00000000000000000c9;
      expv[37] = 74'h00000001c00000001c9;
      expv[38] = 74'h00000000000000000d4;
      expv[39] = 74'h00000000000000000d4;
      expv[40] = 74'h00000000000000000d4;
      expv[41] = 74'h00000000000000000d4;
      expv[42] = 74'h00000002000000001d4;
      expv[43] = 74'h0000000000000000061;
      expv[44] = 74'h0000000000000000061;
      expv[45] = 74'h0000000000000000061;
      expv[46] = 74'h0000000000000000061;
      expv[47] = 74'h0000000240000000161;
      expv[48] = 74'h00000000000000000ca;
      expv[49] = 74'h00000000000000000ca;
      expv[50] = 74'h00000000000000000ca;
      expv[51] = 74'h00000000000000000ca;
      expv[52] = 74'h00000002800000001ca;
      expv[53] = 74'h00000000000000000d6;
      expv[54] = 74'h00000000000000000d6;
      expv[55] = 74'h00000000000000000d6;
      expv[56] = 74'h00000000000000000d6;
      expv[57] = 74'h00000002c00000001d6;
      expv[58] = 74'h0000000000000000051;
      expv[59] = 74'h0000000000000000051;
      expv[60] = 74'h0000000000000000051;
      expv[61] = 74'h0000000000000000051;
      expv[62] = 74'h0000000300000000151;
      expv[63] = 74'h00000000000000001f9;
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
