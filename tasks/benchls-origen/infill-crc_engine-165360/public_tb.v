// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_165360 dut (
    .clock(clk),
    .reset(in_vec[69:69]),
    .din_valid(in_vec[68:68]),
    .din_rs1(in_vec[67:4]),
    .din_insn20(in_vec[3:3]),
    .din_insn21(in_vec[2:2]),
    .din_insn23(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[65:65]),
    .dout_valid(out_vec[64:64]),
    .dout_rd(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h37216e85f099c2d058;
    stim[1] = 70'h2f46db0f2c2af97d56;
    stim[2] = 70'h14a732a80c451c4aff;
    stim[3] = 70'h0c50bb688906863f8b;
    stim[4] = 70'h0b002b4c16bd9d2411;
    stim[5] = 70'h0b58ab941795eeb527;
    stim[6] = 70'h0d18a5d3b020ff998b;
    stim[7] = 70'h161c8c3abeaafdf1d0;
    stim[8] = 70'h194a9bfb2d76b1dc8f;
    stim[9] = 70'h02ac502d241fde39f2;
    stim[10] = 70'h047f92e29aec7bbf2c;
    stim[11] = 70'h0c26fbc06092e108e8;
    stim[12] = 70'h1fe510430960530411;
    stim[13] = 70'h07786095cd6ea6e450;
    stim[14] = 70'h1d098287143ade034c;
    stim[15] = 70'h185b3fb38bbcc80811;
    stim[16] = 70'h0d51fe5c9e66c574e4;
    stim[17] = 70'h09405e1e8639b30b94;
    stim[18] = 70'h01512f1ef22016a2e2;
    stim[19] = 70'h11fc0bbb0618c36e74;
    stim[20] = 70'h0fd53d6ab81bd12cba;
    stim[21] = 70'h02b34dcce9491c905a;
    stim[22] = 70'h0e453c7364ee4daf25;
    stim[23] = 70'h11038604486a7a6201;
    stim[24] = 70'h14b0a81cc49fd0efd8;
    stim[25] = 70'h0b11511e03bda5d1bc;
    stim[26] = 70'h01784db28138b0dfbb;
    stim[27] = 70'h11c67a35535a72bae1;
    stim[28] = 70'h10d234330b21b4380e;
    stim[29] = 70'h17386e260945c36f0f;
    stim[30] = 70'h0d1866f65f59387ed4;
    stim[31] = 70'h1bc0bddbcb9becb9bf;
    stim[32] = 70'h0e3378b75146771d73;
    stim[33] = 70'h1f6fea98bb25f75a75;
    stim[34] = 70'h1ac663ba5d05ed69fe;
    stim[35] = 70'h0348553c4f077046b1;
    stim[36] = 70'h19c93c1f9b9017bf03;
    stim[37] = 70'h00badd620dfc6e645f;
    stim[38] = 70'h028e9ac5b01c216e24;
    stim[39] = 70'h16e25698f8a8a76730;
    stim[40] = 70'h143490d577f221d3fa;
    stim[41] = 70'h07469558ed75528aab;
    stim[42] = 70'h0f55349714c5fd8133;
    stim[43] = 70'h1f4cd5033d46e2525e;
    stim[44] = 70'h05f02ac5ee0ae8708f;
    stim[45] = 70'h03a22d1bcd3543c416;
    stim[46] = 70'h1c5c483edafab09b83;
    stim[47] = 70'h1df97d4cc42ee744a5;
    stim[48] = 70'h1a24cb5dc93275c7bd;
    stim[49] = 70'h0ac778ee7a603d582b;
    stim[50] = 70'h1982df0bfa9c33a70a;
    stim[51] = 70'h029e9bbf240d5eaf93;
    stim[52] = 70'h173ade780896ddec1b;
    stim[53] = 70'h1097225ed08fbe20db;
    stim[54] = 70'h003d948e79d036701a;
    stim[55] = 70'h1727ab3d17f7b30b33;
    stim[56] = 70'h09c967299e2216f415;
    stim[57] = 70'h08c973614bf233989f;
    stim[58] = 70'h02410a269487520880;
    stim[59] = 70'h1f8425a9922984f395;
    stim[60] = 70'h19d04a77d458c7c8ae;
    stim[61] = 70'h0ac04219d9e0649d88;
    stim[62] = 70'h027ad94493b91f54f5;
    stim[63] = 70'h0e31f044173862f414;
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
      expv[0] = 66'h2xxxxxxxxxxxxxxxx;
      expv[1] = 66'h2xxxxxxxxxxxxxxxx;
      expv[2] = 66'h2xxxxxxxxxxxxxxxx;
      expv[3] = 66'h04a732a80c451c4af;
      expv[4] = 66'h0xxxxxxxxxxxxxxxx;
      expv[5] = 66'h094e6550188a3895e;
      expv[6] = 66'h1xxxxxxxxxxxxxxxx;
      expv[7] = 66'h2xxxxxxxxxxxxxxxx;
      expv[8] = 66'h161c8c3abeaafdf1d;
      expv[9] = 66'h261c8c3abeaafdf1d;
      expv[10] = 66'h0c3918757d55fbe3a;
      expv[11] = 66'h0c3918757d55fbe3a;
      expv[12] = 66'h087230eafae7e61c3;
      expv[13] = 66'h087230eafae7e61c3;
      expv[14] = 66'h00e461d5f583dde31;
      expv[15] = 66'h00e461d5f583dde31;
      expv[16] = 66'h01c8c3abeb07bbc62;
      expv[17] = 66'h01c8c3abeb07bbc62;
      expv[18] = 66'h03918757d60f778c4;
      expv[19] = 66'h03918757d60f778c4;
      expv[20] = 66'h07230eafac1eef188;
      expv[21] = 66'h07230eafac1eef188;
      expv[22] = 66'h0e461d5f583dde310;
      expv[23] = 66'h0e461d5f583dde310;
      expv[24] = 66'h1c8c3abeb037adb97;
      expv[25] = 66'h2c8c3abeb037adb97;
      expv[26] = 66'h0918757d60234aa99;
      expv[27] = 66'h0918757d60234aa99;
      expv[28] = 66'h0230eafac00a84885;
      expv[29] = 66'h0230eafac00a84885;
      expv[30] = 66'h0461d5f580150910a;
      expv[31] = 66'h0461d5f580150910a;
      expv[32] = 66'h08c3abeb002a12214;
      expv[33] = 66'h08c3abeb002a12214;
      expv[34] = 66'h018757d600183599f;
      expv[35] = 66'h018757d600183599f;
      expv[36] = 66'h030eafac00306b33e;
      expv[37] = 66'h030eafac00306b33e;
      expv[38] = 66'h061d5f580060d667c;
      expv[39] = 66'h061d5f580060d667c;
      expv[40] = 66'h1c3abeb000c1accf8;
      expv[41] = 66'h2c3abeb000c1accf8;
      expv[42] = 66'h08757d6001cf48447;
      expv[43] = 66'h08757d6001cf48447;
      expv[44] = 66'h00eafac003d281539;
      expv[45] = 66'h00eafac003d281539;
      expv[46] = 66'h01d5f58007a502a72;
      expv[47] = 66'h01d5f58007a502a72;
      expv[48] = 66'h03abeb000f4a054e4;
      expv[49] = 66'h03abeb000f4a054e4;
      expv[50] = 66'h0757d6001e940a9c8;
      expv[51] = 66'h0757d6001e940a9c8;
      expv[52] = 66'h0eafac003d2815390;
      expv[53] = 66'h0eafac003d2815390;
      expv[54] = 66'h0d5f58007a1c3ba97;
      expv[55] = 66'h0d5f58007a1c3ba97;
      expv[56] = 66'h1abeb000f47466899;
      expv[57] = 66'h2abeb000f47466899;
      expv[58] = 66'h057d6001e8a4dcc85;
      expv[59] = 66'h057d6001e8a4dcc85;
      expv[60] = 66'h0afac003d149b990a;
      expv[61] = 66'h0afac003d149b990a;
      expv[62] = 66'h05f58007a2df62fa3;
      expv[63] = 66'h05f58007a2df62fa3;
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
