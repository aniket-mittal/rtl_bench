// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 63;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012197 dut (
    .i_instr(in_vec[32:1]),
    .i_valid(in_vec[0:0]),
    .is_dp(out_vec[62:62]),
    .is_branch(out_vec[61:61]),
    .is_ls(out_vec[60:60]),
    .o_rn(out_vec[59:56]),
    .o_rm(out_vec[55:52]),
    .o_rd(out_vec[51:48]),
    .o_alu_op(out_vec[47:44]),
    .o_alu_b_imm(out_vec[43:43]),
    .cond(out_vec[42:39]),
    .o_write_nzcv(out_vec[38:38]),
    .o_branch_offset(out_vec[37:14]),
    .o_link(out_vec[13:13]),
    .o_ls_flags(out_vec[12:9]),
    .o_load(out_vec[8:8]),
    .o_store(out_vec[7:7]),
    .o_mrs(out_vec[6:6]),
    .o_psr_field_mask(out_vec[5:2]),
    .o_spsr_sel(out_vec[1:1]),
    .o_invalid_instruction(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0c6231cd1;
    stim[1] = 33'h04dee5e28;
    stim[2] = 33'h007b5e2b3;
    stim[3] = 33'h0a8fabb29;
    stim[4] = 33'h02c95f403;
    stim[5] = 33'h0a19a1856;
    stim[6] = 33'h14d4ca023;
    stim[7] = 33'h1c9deb462;
    stim[8] = 33'h02a715f46;
    stim[9] = 33'h1454d0d9f;
    stim[10] = 33'h024e346e6;
    stim[11] = 33'h1893ce367;
    stim[12] = 33'h026367c5d;
    stim[13] = 33'h108127708;
    stim[14] = 33'h1376ee658;
    stim[15] = 33'h0953e0473;
    stim[16] = 33'h00b8acbb6;
    stim[17] = 33'h051406faf;
    stim[18] = 33'h0fe40f267;
    stim[19] = 33'h01a475e62;
    stim[20] = 33'h13da9194a;
    stim[21] = 33'h18fcf41f9;
    stim[22] = 33'h135d3d40a;
    stim[23] = 33'h1096b2cb8;
    stim[24] = 33'h068179d16;
    stim[25] = 33'h1bd56e9ca;
    stim[26] = 33'h12d3dca16;
    stim[27] = 33'h18a2b4dad;
    stim[28] = 33'h0968cc9d5;
    stim[29] = 33'h187d84ee6;
    stim[30] = 33'h0ea0b523b;
    stim[31] = 33'h0e9f86aff;
    stim[32] = 33'h049a27395;
    stim[33] = 33'h045296164;
    stim[34] = 33'h1b87f06c4;
    stim[35] = 33'h1486078f2;
    stim[36] = 33'h1d2711d9d;
    stim[37] = 33'h079bc4986;
    stim[38] = 33'h143dfefc1;
    stim[39] = 33'h00d1723ad;
    stim[40] = 33'h08183449c;
    stim[41] = 33'h1648f282e;
    stim[42] = 33'h070dbb271;
    stim[43] = 33'h0792ad600;
    stim[44] = 33'h030c6b991;
    stim[45] = 33'h1848be700;
    stim[46] = 33'h1db5bdd84;
    stim[47] = 33'h07a57db7b;
    stim[48] = 33'h10f35f623;
    stim[49] = 33'h134bc5766;
    stim[50] = 33'h135204f37;
    stim[51] = 33'h072b8add6;
    stim[52] = 33'h1b2566c8c;
    stim[53] = 33'h07eff7703;
    stim[54] = 33'h0c529bb01;
    stim[55] = 33'h18ae75258;
    stim[56] = 33'h1262040f6;
    stim[57] = 33'h068250cff;
    stim[58] = 33'h1189997b2;
    stim[59] = 33'h0ac5b859b;
    stim[60] = 33'h198c3740b;
    stim[61] = 33'h02b7445b5;
    stim[62] = 33'h022550d74;
    stim[63] = 33'h18bdc71ce;
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
      expv[0] = 63'h41088b4000000000;
      expv[1] = 63'h0000010000000000;
      expv[2] = 63'h4a0fe84000000000;
      expv[3] = 63'h1d45028000000680;
      expv[4] = 63'h1a0f008000000500;
      expv[5] = 63'h0000028000000000;
      expv[6] = 63'h1605050000000b00;
      expv[7] = 63'h0000070000000000;
      expv[8] = 63'h0000008000000000;
      expv[9] = 63'h46085d0000000000;
      expv[10] = 63'h0000008000000000;
      expv[11] = 63'h1e37060000000880;
      expv[12] = 63'h4b0388c000000000;
      expv[13] = 63'h0000040000000000;
      expv[14] = 63'h0000048000000000;
      expv[15] = 63'h20000227c08e4000;
      expv[16] = 63'h0000000000000000;
      expv[17] = 63'h200001280df5c000;
      expv[18] = 63'h0007038000000040;
      expv[19] = 63'h0000000000000000;
      expv[20] = 63'h0000048000000000;
      expv[21] = 63'h170a060000001f00;
      expv[22] = 63'h0000048000000000;
      expv[23] = 63'h0000040000000000;
      expv[24] = 63'h0000018000000000;
      expv[25] = 63'h0000068000000000;
      expv[26] = 63'h0000048000000000;
      expv[27] = 63'h156a060000001080;
      expv[28] = 63'h20000211993aa000;
      expv[29] = 63'h0000060000000000;
      expv[30] = 63'h15da038000001100;
      expv[31] = 63'h1cf3038000000e80;
      expv[32] = 63'h11a3010000000c80;
      expv[33] = 63'h0000010000000000;
      expv[34] = 63'h0000068000000000;
      expv[35] = 63'h0000050000000000;
      expv[36] = 63'h2000070e23b3a000;
      expv[37] = 63'h0000018000000000;
      expv[38] = 63'h4f0ff50000000000;
      expv[39] = 63'h1b09000000000900;
      expv[40] = 63'h0000020000000000;
      expv[41] = 63'h0000058000000000;
      expv[42] = 63'h2000019b764e0000;
      expv[43] = 63'h0000018000000000;
      expv[44] = 63'h20000098d7320000;
      expv[45] = 63'h0000060000000000;
      expv[46] = 63'h0000070000000000;
      expv[47] = 63'h000e018000000040;
      expv[48] = 63'h1a0f040000001880;
      expv[49] = 63'h0000048000000000;
      expv[50] = 63'h200004a409e6c000;
      expv[51] = 63'h0000018000000000;
      expv[52] = 63'h0000068000000000;
      expv[53] = 63'h000b018000000042;
      expv[54] = 63'h440d4b4000000000;
      expv[55] = 63'h0000060000000000;
      expv[56] = 63'h0000048000000000;
      expv[57] = 63'h12f8018000000080;
      expv[58] = 63'h0000040000000000;
      expv[59] = 63'h1d0c028000000300;
      expv[60] = 63'h0000060000000001;
      expv[61] = 63'h1aa2008000001a80;
      expv[62] = 63'h0000008000000000;
      expv[63] = 63'h0000060000000000;
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
