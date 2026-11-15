// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005670 dut (
    .ctl_alu_oe(in_vec[16:16]),
    .ctl_alu_shift_oe(in_vec[15:15]),
    .ctl_alu_op2_oe(in_vec[14:14]),
    .ctl_alu_res_oe(in_vec[13:13]),
    .ctl_alu_op1_oe(in_vec[12:12]),
    .ctl_alu_bs_oe(in_vec[11:11]),
    .ctl_alu_op1_sel_bus(in_vec[10:10]),
    .ctl_alu_op1_sel_low(in_vec[9:9]),
    .ctl_alu_op1_sel_zero(in_vec[8:8]),
    .ctl_alu_op2_sel_zero(in_vec[7:7]),
    .ctl_alu_op2_sel_bus(in_vec[6:6]),
    .ctl_alu_op2_sel_lq(in_vec[5:5]),
    .ctl_alu_sel_op2_neg(in_vec[4:4]),
    .ctl_alu_sel_op2_high(in_vec[3:3]),
    .ctl_alu_core_R(in_vec[2:2]),
    .ctl_alu_core_V(in_vec[1:1]),
    .ctl_alu_core_S(in_vec[0:0]),
    .alu_oe(out_vec[16:16]),
    .alu_shift_oe(out_vec[15:15]),
    .alu_op2_oe(out_vec[14:14]),
    .alu_res_oe(out_vec[13:13]),
    .alu_op1_oe(out_vec[12:12]),
    .alu_bs_oe(out_vec[11:11]),
    .alu_op1_sel_bus(out_vec[10:10]),
    .alu_op1_sel_low(out_vec[9:9]),
    .alu_op1_sel_zero(out_vec[8:8]),
    .alu_op2_sel_zero(out_vec[7:7]),
    .alu_op2_sel_bus(out_vec[6:6]),
    .alu_op2_sel_lq(out_vec[5:5]),
    .alu_sel_op2_neg(out_vec[4:4]),
    .alu_sel_op2_high(out_vec[3:3]),
    .alu_core_R(out_vec[2:2]),
    .alu_core_V(out_vec[1:1]),
    .alu_core_S(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h192fa;
    stim[1] = 17'h00a81;
    stim[2] = 17'h198d1;
    stim[3] = 17'h07775;
    stim[4] = 17'h1a9e4;
    stim[5] = 17'h15728;
    stim[6] = 17'h0b351;
    stim[7] = 17'h06f10;
    stim[8] = 17'h06caf;
    stim[9] = 17'h15858;
    stim[10] = 17'h02ad8;
    stim[11] = 17'h0076a;
    stim[12] = 17'h0a7e8;
    stim[13] = 17'h0681a;
    stim[14] = 17'h1af4a;
    stim[15] = 17'h15cb3;
    stim[16] = 17'h09806;
    stim[17] = 17'h1b71f;
    stim[18] = 17'h1cc55;
    stim[19] = 17'h03347;
    stim[20] = 17'h1e027;
    stim[21] = 17'h02b5f;
    stim[22] = 17'h18b35;
    stim[23] = 17'h1d6ea;
    stim[24] = 17'h01e7a;
    stim[25] = 17'h11572;
    stim[26] = 17'h0265d;
    stim[27] = 17'h10631;
    stim[28] = 17'h17b72;
    stim[29] = 17'h15e08;
    stim[30] = 17'h04242;
    stim[31] = 17'h1eb3a;
    stim[32] = 17'h17666;
    stim[33] = 17'h13f48;
    stim[34] = 17'h0d49f;
    stim[35] = 17'h1ce54;
    stim[36] = 17'h1fe3a;
    stim[37] = 17'h170f4;
    stim[38] = 17'h09637;
    stim[39] = 17'h1ac61;
    stim[40] = 17'h074d9;
    stim[41] = 17'h1346d;
    stim[42] = 17'h0f633;
    stim[43] = 17'h0e230;
    stim[44] = 17'h07e24;
    stim[45] = 17'h03322;
    stim[46] = 17'h02bde;
    stim[47] = 17'h17987;
    stim[48] = 17'h1b42a;
    stim[49] = 17'h0b61b;
    stim[50] = 17'h0cb55;
    stim[51] = 17'h05413;
    stim[52] = 17'h1a8b9;
    stim[53] = 17'h0c2fc;
    stim[54] = 17'h09e3f;
    stim[55] = 17'h1ac0a;
    stim[56] = 17'h1bb97;
    stim[57] = 17'h05468;
    stim[58] = 17'h004df;
    stim[59] = 17'h18149;
    stim[60] = 17'h1df06;
    stim[61] = 17'h133bf;
    stim[62] = 17'h0f5ae;
    stim[63] = 17'h0ea63;
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
      expv[0] = 17'h192fa;
      expv[1] = 17'h00a81;
      expv[2] = 17'h198d1;
      expv[3] = 17'h07775;
      expv[4] = 17'h1a9e4;
      expv[5] = 17'h15728;
      expv[6] = 17'h0b351;
      expv[7] = 17'h06f10;
      expv[8] = 17'h06caf;
      expv[9] = 17'h15858;
      expv[10] = 17'h02ad8;
      expv[11] = 17'h0076a;
      expv[12] = 17'h0a7e8;
      expv[13] = 17'h0681a;
      expv[14] = 17'h1af4a;
      expv[15] = 17'h15cb3;
      expv[16] = 17'h09806;
      expv[17] = 17'h1b71f;
      expv[18] = 17'h1cc55;
      expv[19] = 17'h03347;
      expv[20] = 17'h1e027;
      expv[21] = 17'h02b5f;
      expv[22] = 17'h18b35;
      expv[23] = 17'h1d6ea;
      expv[24] = 17'h01e7a;
      expv[25] = 17'h11572;
      expv[26] = 17'h0265d;
      expv[27] = 17'h10631;
      expv[28] = 17'h17b72;
      expv[29] = 17'h15e08;
      expv[30] = 17'h04242;
      expv[31] = 17'h1eb3a;
      expv[32] = 17'h17666;
      expv[33] = 17'h13f48;
      expv[34] = 17'h0d49f;
      expv[35] = 17'h1ce54;
      expv[36] = 17'h1fe3a;
      expv[37] = 17'h170f4;
      expv[38] = 17'h09637;
      expv[39] = 17'h1ac61;
      expv[40] = 17'h074d9;
      expv[41] = 17'h1346d;
      expv[42] = 17'h0f633;
      expv[43] = 17'h0e230;
      expv[44] = 17'h07e24;
      expv[45] = 17'h03322;
      expv[46] = 17'h02bde;
      expv[47] = 17'h17987;
      expv[48] = 17'h1b42a;
      expv[49] = 17'h0b61b;
      expv[50] = 17'h0cb55;
      expv[51] = 17'h05413;
      expv[52] = 17'h1a8b9;
      expv[53] = 17'h0c2fc;
      expv[54] = 17'h09e3f;
      expv[55] = 17'h1ac0a;
      expv[56] = 17'h1bb97;
      expv[57] = 17'h05468;
      expv[58] = 17'h004df;
      expv[59] = 17'h18149;
      expv[60] = 17'h1df06;
      expv[61] = 17'h133bf;
      expv[62] = 17'h0f5ae;
      expv[63] = 17'h0ea63;
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
