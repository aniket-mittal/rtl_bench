// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204275 dut (
    .IF_ID_RegisterRs(in_vec[20:16]),
    .IF_ID_RegisterRt(in_vec[15:11]),
    .ID_EX_RegisterRt(in_vec[10:6]),
    .ID_EX_MemRead(in_vec[5:5]),
    .BranchGate(in_vec[4:4]),
    .Jump(in_vec[3:3]),
    .branchPredict(in_vec[2:1]),
    .Branch(in_vec[0:0]),
    .PCWrite_Disable(out_vec[5:5]),
    .IF_ID_Write_Disable(out_vec[4:4]),
    .IF_ID_Flush(out_vec[3:3]),
    .ID_EX_Flush(out_vec[2:2]),
    .recoverySel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h053d64;
    stim[1] = 21'h1a696b;
    stim[2] = 21'h1bc270;
    stim[3] = 21'h1d5c3c;
    stim[4] = 21'h10d583;
    stim[5] = 21'h011e2a;
    stim[6] = 21'h00f76a;
    stim[7] = 21'h0f7f07;
    stim[8] = 21'h1365cc;
    stim[9] = 21'h09bd2d;
    stim[10] = 21'h1358cd;
    stim[11] = 21'h12be24;
    stim[12] = 21'h1d55c8;
    stim[13] = 21'h00b165;
    stim[14] = 21'h0aac10;
    stim[15] = 21'h0921b3;
    stim[16] = 21'h1060b5;
    stim[17] = 21'h12da68;
    stim[18] = 21'h0a6b67;
    stim[19] = 21'h0d6502;
    stim[20] = 21'h1d3a94;
    stim[21] = 21'h18046d;
    stim[22] = 21'h10cec8;
    stim[23] = 21'h1270fd;
    stim[24] = 21'h0267fd;
    stim[25] = 21'h059d4f;
    stim[26] = 21'h095d1b;
    stim[27] = 21'h176eb6;
    stim[28] = 21'h180484;
    stim[29] = 21'h029f7f;
    stim[30] = 21'h09fed0;
    stim[31] = 21'h11f135;
    stim[32] = 21'h084e1c;
    stim[33] = 21'h137368;
    stim[34] = 21'h0b3fa5;
    stim[35] = 21'h10e080;
    stim[36] = 21'h190b2e;
    stim[37] = 21'h155b7a;
    stim[38] = 21'h136692;
    stim[39] = 21'h0e07a8;
    stim[40] = 21'h14604d;
    stim[41] = 21'h177a00;
    stim[42] = 21'h0a298c;
    stim[43] = 21'h0a2c0b;
    stim[44] = 21'h19d0db;
    stim[45] = 21'h19ba77;
    stim[46] = 21'h0a332b;
    stim[47] = 21'h09bee0;
    stim[48] = 21'h06bb2e;
    stim[49] = 21'h1d855f;
    stim[50] = 21'h060614;
    stim[51] = 21'h099e64;
    stim[52] = 21'h0f2e42;
    stim[53] = 21'h1ff11e;
    stim[54] = 21'h174ee8;
    stim[55] = 21'h1f8aec;
    stim[56] = 21'h0f085e;
    stim[57] = 21'h1e2513;
    stim[58] = 21'h16e946;
    stim[59] = 21'h0541e3;
    stim[60] = 21'h01b34f;
    stim[61] = 21'h184e3f;
    stim[62] = 21'h192625;
    stim[63] = 21'h1eb13b;
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
      expv[0] = 6'h00;
      expv[1] = 6'h0a;
      expv[2] = 6'h0a;
      expv[3] = 6'h0a;
      expv[4] = 6'h00;
      expv[5] = 6'h0a;
      expv[6] = 6'h0a;
      expv[7] = 6'h09;
      expv[8] = 6'h0a;
      expv[9] = 6'h09;
      expv[10] = 6'h09;
      expv[11] = 6'h00;
      expv[12] = 6'h0a;
      expv[13] = 6'h09;
      expv[14] = 6'h0a;
      expv[15] = 6'h09;
      expv[16] = 6'h00;
      expv[17] = 6'h0a;
      expv[18] = 6'h34;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h09;
      expv[22] = 6'h0a;
      expv[23] = 6'h0a;
      expv[24] = 6'h0a;
      expv[25] = 6'h09;
      expv[26] = 6'h09;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h0a;
      expv[30] = 6'h0a;
      expv[31] = 6'h00;
      expv[32] = 6'h0a;
      expv[33] = 6'h0a;
      expv[34] = 6'h09;
      expv[35] = 6'h00;
      expv[36] = 6'h0a;
      expv[37] = 6'h0a;
      expv[38] = 6'h0a;
      expv[39] = 6'h0a;
      expv[40] = 6'h09;
      expv[41] = 6'h00;
      expv[42] = 6'h0a;
      expv[43] = 6'h0a;
      expv[44] = 6'h09;
      expv[45] = 6'h00;
      expv[46] = 6'h0a;
      expv[47] = 6'h00;
      expv[48] = 6'h0a;
      expv[49] = 6'h0a;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h0a;
      expv[54] = 6'h0a;
      expv[55] = 6'h0a;
      expv[56] = 6'h0a;
      expv[57] = 6'h09;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h09;
      expv[61] = 6'h34;
      expv[62] = 6'h09;
      expv[63] = 6'h09;
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
