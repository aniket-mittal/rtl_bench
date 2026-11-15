// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09826 dut (
    .clk(clk),
    .Wr_Strobe(in_vec[36:36]),
    .Rd_Strobe(in_vec[35:35]),
    .AddrIn(in_vec[34:27]),
    .DataIn(in_vec[26:19]),
    .MotCtl(in_vec[18:11]),
    .MapVal(in_vec[10:9]),
    .reset(in_vec[8:8]),
    .BotConfig(in_vec[7:0]),
    .DataOut(out_vec[72:65]),
    .LocX(out_vec[64:57]),
    .LocY(out_vec[56:49]),
    .BotInfo(out_vec[48:41]),
    .Sensors(out_vec[40:33]),
    .LMDist(out_vec[32:25]),
    .RMDist(out_vec[24:17]),
    .MapX(out_vec[16:9]),
    .MapY(out_vec[8:1]),
    .upd_sysregs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h08f9e691da;
    stim[1] = 37'h07979f0b52;
    stim[2] = 37'h1bb8c2fc63;
    stim[3] = 37'h00f88afa0b;
    stim[4] = 37'h136272a0a0;
    stim[5] = 37'h03e822c8a6;
    stim[6] = 37'h0efab9a6b8;
    stim[7] = 37'h1e4e9d5ac2;
    stim[8] = 37'h0739aa0c95;
    stim[9] = 37'h18c1594099;
    stim[10] = 37'h05630da61c;
    stim[11] = 37'h12f4d4f86e;
    stim[12] = 37'h1cce0a6403;
    stim[13] = 37'h019ec0bc1b;
    stim[14] = 37'h1ebe22f659;
    stim[15] = 37'h05085bb85e;
    stim[16] = 37'h0b05d26ac6;
    stim[17] = 37'h0633890aeb;
    stim[18] = 37'h004a535c7c;
    stim[19] = 37'h055a7c5017;
    stim[20] = 37'h1bf3c9803c;
    stim[21] = 37'h117786ae8d;
    stim[22] = 37'h1369d77202;
    stim[23] = 37'h1303506a90;
    stim[24] = 37'h17d594d24e;
    stim[25] = 37'h03e51eec21;
    stim[26] = 37'h0fa53470ff;
    stim[27] = 37'h1afdb11043;
    stim[28] = 37'h060a93a4ee;
    stim[29] = 37'h14ed82d085;
    stim[30] = 37'h0f5dd31805;
    stim[31] = 37'h0a39d330c8;
    stim[32] = 37'h0ef6e22e28;
    stim[33] = 37'h0c8d5b32ea;
    stim[34] = 37'h1324a26aa1;
    stim[35] = 37'h08df16fc02;
    stim[36] = 37'h1f90f8c274;
    stim[37] = 37'h0a2d93bc2e;
    stim[38] = 37'h100c00bacf;
    stim[39] = 37'h05f2ae0079;
    stim[40] = 37'h15540efca6;
    stim[41] = 37'h1d2de6fad6;
    stim[42] = 37'h05e30250a4;
    stim[43] = 37'h0234cc5c2c;
    stim[44] = 37'h113b52646f;
    stim[45] = 37'h0328acbe2a;
    stim[46] = 37'h0b0be6c6da;
    stim[47] = 37'h15394c4b5c;
    stim[48] = 37'h1e1ca334ca;
    stim[49] = 37'h1c4067de69;
    stim[50] = 37'h19d6e36094;
    stim[51] = 37'h1bbbc6ca75;
    stim[52] = 37'h0176a154fc;
    stim[53] = 37'h0b9c3231ee;
    stim[54] = 37'h09ef680cca;
    stim[55] = 37'h1f7d15b00f;
    stim[56] = 37'h02bb300629;
    stim[57] = 37'h171714e2b8;
    stim[58] = 37'h0fb27f5e07;
    stim[59] = 37'h06c0598881;
    stim[60] = 37'h0d010f5677;
    stim[61] = 37'h02db963087;
    stim[62] = 37'h1d99de2c00;
    stim[63] = 37'h0ff551acea;
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
      expv[0] = 73'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 73'h00000000000000xxxxx;
      expv[2] = 73'h00000000000000xxxxx;
      expv[3] = 73'h0c600000000000xxxxx;
      expv[4] = 73'h00000000000000xxxxx;
      expv[5] = 73'h00000000000000xxxxx;
      expv[6] = 73'h00000000000000xxxxx;
      expv[7] = 73'h00000000000000xxxxx;
      expv[8] = 73'hxxx00000000000xxxa6;
      expv[9] = 73'h12a00000000000xxxa6;
      expv[10] = 73'hxxx00000000000057a6;
      expv[11] = 73'h00000000000000057a6;
      expv[12] = 73'h00000000000000057a7;
      expv[13] = 73'h1a60000000000005783;
      expv[14] = 73'h0000000000000005783;
      expv[15] = 73'h0b20000000000005783;
      expv[16] = 73'h0000000000000005783;
      expv[17] = 73'h09a0000000000005783;
      expv[18] = 73'h0000000000000005783;
      expv[19] = 73'h1820000000000005783;
      expv[20] = 73'h0000000000000005783;
      expv[21] = 73'h0000000000000005782;
      expv[22] = 73'h0000000000000005783;
      expv[23] = 73'h0000000000000005783;
      expv[24] = 73'h01a0000000000005783;
      expv[25] = 73'h0020000000000005783;
      expv[26] = 73'h0000000000000005783;
      expv[27] = 73'h0000000000000005783;
      expv[28] = 73'h0000000000000005783;
      expv[29] = 73'h0000000000000005783;
      expv[30] = 73'h0000000000000005783;
      expv[31] = 73'h0000000000000005783;
      expv[32] = 73'h1900000000000005783;
      expv[33] = 73'h0000000000000005783;
      expv[34] = 73'h0000000000000005783;
      expv[35] = 73'h0000000000000005783;
      expv[36] = 73'h0000000012800005783;
      expv[37] = 73'h0000000012800005783;
      expv[38] = 73'h000003e012800005783;
      expv[39] = 73'h000003e012800005783;
      expv[40] = 73'h001003e012800005783;
      expv[41] = 73'h005003e012800005783;
      expv[42] = 73'h001003e012800005783;
      expv[43] = 73'h001003e012800005783;
      expv[44] = 73'h001003e012800005783;
      expv[45] = 73'h0df003e012800005783;
      expv[46] = 73'h179003e012800005783;
      expv[47] = 73'h101003e012800005783;
      expv[48] = 73'h0b80000000000005782;
      expv[49] = 73'h0000000000000005782;
      expv[50] = 73'h0560000000000001982;
      expv[51] = 73'h0000000000000001982;
      expv[52] = 73'h0ea0000000000001982;
      expv[53] = 73'h0000000000000001982;
      expv[54] = 73'h1280000000000001982;
      expv[55] = 73'h0000000000000001982;
      expv[56] = 73'h0000000000000001982;
      expv[57] = 73'h0520000000000001982;
      expv[58] = 73'h0000000000000001982;
      expv[59] = 73'h0000000000000001982;
      expv[60] = 73'h0180000000000001982;
      expv[61] = 73'h1d40000000000001982;
      expv[62] = 73'h0000000000000001982;
      expv[63] = 73'h0000000000000001982;
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
