// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 192;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02960 dut (
    .LowMaskSel_Top(in_vec[19:15]),
    .HighMaskSel_Top(in_vec[14:10]),
    .LowMaskSel_Bot(in_vec[9:5]),
    .HighMaskSel_Bot(in_vec[4:0]),
    .LogicImm(out_vec[191:128]),
    .LowLogicImm(out_vec[127:64]),
    .HighLogicImm(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h311a2;
    stim[1] = 20'ha0019;
    stim[2] = 20'he6d6b;
    stim[3] = 20'hdbe61;
    stim[4] = 20'h0b094;
    stim[5] = 20'h54988;
    stim[6] = 20'h1d759;
    stim[7] = 20'h7fd0f;
    stim[8] = 20'ha5c5b;
    stim[9] = 20'h4ee06;
    stim[10] = 20'h846c7;
    stim[11] = 20'hd69da;
    stim[12] = 20'h6fcf2;
    stim[13] = 20'h3f0e4;
    stim[14] = 20'hab71d;
    stim[15] = 20'hdedc1;
    stim[16] = 20'h81c1b;
    stim[17] = 20'h153e1;
    stim[18] = 20'h650de;
    stim[19] = 20'hdedc8;
    stim[20] = 20'h1f571;
    stim[21] = 20'h46127;
    stim[22] = 20'hd7e7e;
    stim[23] = 20'h1c25a;
    stim[24] = 20'h94dd6;
    stim[25] = 20'ha1399;
    stim[26] = 20'h2c9bc;
    stim[27] = 20'h00411;
    stim[28] = 20'h32702;
    stim[29] = 20'hc676d;
    stim[30] = 20'h9d0c8;
    stim[31] = 20'hdc9a9;
    stim[32] = 20'h19f8a;
    stim[33] = 20'h37486;
    stim[34] = 20'h69e53;
    stim[35] = 20'h6f30d;
    stim[36] = 20'h12be4;
    stim[37] = 20'ha449c;
    stim[38] = 20'h6bcb8;
    stim[39] = 20'ha3a0b;
    stim[40] = 20'h16d00;
    stim[41] = 20'h729b2;
    stim[42] = 20'hac1e8;
    stim[43] = 20'hf3b67;
    stim[44] = 20'h89ada;
    stim[45] = 20'h5984b;
    stim[46] = 20'hb51fd;
    stim[47] = 20'h5b3dc;
    stim[48] = 20'h971ae;
    stim[49] = 20'hdbc2f;
    stim[50] = 20'hf5acb;
    stim[51] = 20'hd89e3;
    stim[52] = 20'hc506d;
    stim[53] = 20'h283c3;
    stim[54] = 20'h61faf;
    stim[55] = 20'h8dbd4;
    stim[56] = 20'hffc21;
    stim[57] = 20'h1eeaa;
    stim[58] = 20'hbb4bf;
    stim[59] = 20'haac1b;
    stim[60] = 20'h72aee;
    stim[61] = 20'h89141;
    stim[62] = 20'h75ffa;
    stim[63] = 20'h15086;
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
      expv[0] = 192'h0000000000000000ffffffc0ffffe0000000001f00000007;
      expv[1] = 192'h0000000003fffffffff00000ffffffff0000000103ffffff;
      expv[2] = 192'h0000000000000800f0000000fffff8000fffffff00000fff;
      expv[3] = 192'h0000000000000000f8000000fff800000000ffff00000003;
      expv[4] = 192'h00001ffe001ffff0fffffffefffffff000001fff001fffff;
      expv[5] = 192'h0007fc0000000000fffffc00fffff0000007ffff000001ff;
      expv[6] = 192'h003ffff800000000fffffff8fc000000003fffff03ffffff;
      expv[7] = 192'hffff80000000ff00ffff8000ffffff00ffffffff0000ffff;
      expv[8] = 192'h00f000000ffffffcfff00000fffffffc00ffffff0fffffff;
      expv[9] = 192'h0ffffe0000000000fffffe00ffff00000fffffff0000007f;
      expv[10] = 192'h0003000000000000ffff0000ffc000000003ffff000000ff;
      expv[11] = 192'h0400000007ffc000fc000000ffffc00007ffffff07ffffff;
      expv[12] = 192'hffffe0000007ff80ffffe000ffffff80ffffffff0007ffff;
      expv[13] = 192'h1fffff8000000000ffffff80ffffff801fffffff0000001f;
      expv[14] = 192'h000000003f000000ffe00000ff00000000003fff3fffffff;
      expv[15] = 192'h0800000000000000f8000000ffffc0000fffffff00000003;
      expv[16] = 192'h000000000fffffffffff0000ffffffff000000ff0fffffff;
      expv[17] = 192'h001ffffc00000000fffffffc80000000001fffff00000003;
      expv[18] = 192'h001ff0007fffffc0fffff000ffffffc0001fffff7fffffff;
      expv[19] = 192'h0800000000000000f8000000ffffc0000fffffff000001ff;
      expv[20] = 192'h3ffffff80003f800fffffff8fffff8003fffffff0003ffff;
      expv[21] = 192'h01ffff0000000000ffffff00fffffe0001ffffff000000ff;
      expv[22] = 192'hfc0000007ff80000fc000000fff80000ffffffff7fffffff;
      expv[23] = 192'h0001fff807fc0000fffffff8fffc00000001ffff07ffffff;
      expv[24] = 192'h000c0000007fc000fffc0000ffffc000000fffff007fffff;
      expv[25] = 192'h0000000000000000fff00000f00000000000001f03ffffff;
      expv[26] = 192'h0007ffe01fffe000ffffffe0ffffe0000007ffff1fffffff;
      expv[27] = 192'h000000030003ffffffffffffffffffff000000030003ffff;
      expv[28] = 192'h000003c000000000ffffffc0ff000000000003ff00000007;
      expv[29] = 192'h0300000000000000ff000000f800000003ffffff00003fff;
      expv[30] = 192'h00180000000001c0fff80000ffffffc0001fffff000001ff;
      expv[31] = 192'h0000000000000000f8000000ffffe0000007ffff000003ff;
      expv[32] = 192'h000000f800000000fffffff8f0000000000000ff000007ff;
      expv[33] = 192'h3fffffc000000070ffffffc0fffffff03fffffff0000007f;
      expv[34] = 192'h00000000000c0000ffffe000fffc0000000000ff000fffff;
      expv[35] = 192'h1fffe00000000000ffffe000ff0000001fffffff00003fff;
      expv[36] = 192'h000007fc00000000fffffffc80000000000007ff0000001f;
      expv[37] = 192'h000000001ffffff0fff00000fffffff00003ffff1fffffff;
      expv[38] = 192'h0000e00001ffffe0ffffe000ffffffe00000ffff01ffffff;
      expv[39] = 192'h0000000000000000fff00000ffff000000007fff00000fff;
      expv[40] = 192'h0ffffffc00000000fffffffcffffff000fffffff00000001;
      expv[41] = 192'h000000000007e000ffffc000ffffe000000007ff0007ffff;
      expv[42] = 192'h0000000000000000ffe00000ffff80000001ffff000001ff;
      expv[43] = 192'h0000000000000000c0000000f800000000007fff000000ff;
      expv[44] = 192'h0000000007c00000fffe0000ffc000000000007f07ffffff;
      expv[45] = 192'h0000000000000ffcfffff800fffffffc0000007f00000fff;
      expv[46] = 192'h000000003fff8000ffc00000ffff8000001fffff3fffffff;
      expv[47] = 192'h0000180000000000fffff800c000000000001fff1fffffff;
      expv[48] = 192'h1ffc000000006000fffc0000ffffe0001fffffff00007fff;
      expv[49] = 192'h000000000000fffef8000000fffffffe0000ffff0000ffff;
      expv[50] = 192'h0000000000000000c0000000ffc00000007fffff00000fff;
      expv[51] = 192'h0000000000000000f8000000ffff8000000000070000000f;
      expv[52] = 192'h0000000000003ff8ff000000fffffff8001fffff00003fff;
      expv[53] = 192'h0000000000000000ffffffe0c0000000000000010000000f;
      expv[54] = 192'h0000000000000000fffff000e0000000000000ff0000ffff;
      expv[55] = 192'h007e000000000000fffe0000c0000000007fffff001fffff;
      expv[56] = 192'h800000000000000280000000fffffffeffffffff00000003;
      expv[57] = 192'h0ffffff800000000fffffff8ffe000000fffffff000007ff;
      expv[58] = 192'h00000000ffffffe0ff800000ffffffe000003fffffffffff;
      expv[59] = 192'h000000000fffffffffe00000ffffffff00000fff0fffffff;
      expv[60] = 192'h0000000000000000ffffc000ff800000000007ff00007fff;
      expv[61] = 192'h0000000000000000fffe0000fffffc000000001f00000003;
      expv[62] = 192'h00ffc00000000000ffffc0008000000000ffffff07ffffff;
      expv[63] = 192'h001ffffc00000070fffffffcfffffff0001fffff0000007f;
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
