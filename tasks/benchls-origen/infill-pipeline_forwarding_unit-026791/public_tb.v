// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026791 dut (
    .EX_Rs(in_vec[40:36]),
    .EX_Rt(in_vec[35:31]),
    .MEM_Rt(in_vec[30:26]),
    .MEM_WriteReg(in_vec[25:21]),
    .WB_WriteReg(in_vec[20:16]),
    .MEM_RegWrite(in_vec[15:15]),
    .WB_RegWrite(in_vec[14:14]),
    .ALUSrcSelect(in_vec[13:13]),
    .ShiftSelect(in_vec[12:12]),
    .MEM_OPCode(in_vec[11:6]),
    .EX_OPCode(in_vec[5:0]),
    .EX_ALUSrc(out_vec[5:4]),
    .EX_Shift(out_vec[3:2]),
    .MEM_WriteData(out_vec[1:1]),
    .EX_WriteData(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h0561510389b;
    stim[1] = 41'h157e28f52d1;
    stim[2] = 41'h138361ecabf;
    stim[3] = 41'h06a5b1c8214;
    stim[4] = 41'h08d910b24dd;
    stim[5] = 41'h08faadefd53;
    stim[6] = 41'h1ecaf9ef964;
    stim[7] = 41'h00d66687b98;
    stim[8] = 41'h04099adb31c;
    stim[9] = 41'h09b8b20b001;
    stim[10] = 41'h015e8dff240;
    stim[11] = 41'h15482b9b88c;
    stim[12] = 41'h0bc2cbf8399;
    stim[13] = 41'h077de090b94;
    stim[14] = 41'h0ffce345eb4;
    stim[15] = 41'h0401d7dabf4;
    stim[16] = 41'h112331b037c;
    stim[17] = 41'h10ca7964bb7;
    stim[18] = 41'h1d8a517fb4b;
    stim[19] = 41'h17c17e44433;
    stim[20] = 41'h05fc016a22e;
    stim[21] = 41'h021bc573d2c;
    stim[22] = 41'h1830bf363a1;
    stim[23] = 41'h04ddffd4546;
    stim[24] = 41'h014c472c819;
    stim[25] = 41'h18e33e1a27f;
    stim[26] = 41'h1616bc61b19;
    stim[27] = 41'h1ae81fd3b04;
    stim[28] = 41'h0672c08e076;
    stim[29] = 41'h010e77fabd3;
    stim[30] = 41'h08ce2d3ed1c;
    stim[31] = 41'h09e3f0f92b3;
    stim[32] = 41'h05e1874ca59;
    stim[33] = 41'h04888336a9f;
    stim[34] = 41'h0db9ab50cfb;
    stim[35] = 41'h03c64ff6676;
    stim[36] = 41'h15ef4deb824;
    stim[37] = 41'h1f577af46f0;
    stim[38] = 41'h15448f07874;
    stim[39] = 41'h1e8a4c55ede;
    stim[40] = 41'h10a011d4291;
    stim[41] = 41'h07233c1dafc;
    stim[42] = 41'h041333740ae;
    stim[43] = 41'h0b5758d544d;
    stim[44] = 41'h1f3868b2155;
    stim[45] = 41'h01af8d7cf4d;
    stim[46] = 41'h0e5c803b68f;
    stim[47] = 41'h1b8ec35554f;
    stim[48] = 41'h13d1dad1650;
    stim[49] = 41'h017f4beef53;
    stim[50] = 41'h0a58f92ab45;
    stim[51] = 41'h067699027b4;
    stim[52] = 41'h0fa7c6a816b;
    stim[53] = 41'h1b18cfa3958;
    stim[54] = 41'h10bb9e3fca5;
    stim[55] = 41'h1b5889b56b8;
    stim[56] = 41'h1491ca800cc;
    stim[57] = 41'h1329f3357e3;
    stim[58] = 41'h0a3645ef2ab;
    stim[59] = 41'h14c69904fb3;
    stim[60] = 41'h13fcd0b262f;
    stim[61] = 41'h1822d635c7d;
    stim[62] = 41'h0d61acb2722;
    stim[63] = 41'h19cf6a8298b;
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
      expv[1] = 6'h20;
      expv[2] = 6'h20;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h14;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h18;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h14;
      expv[56] = 6'h00;
      expv[57] = 6'h14;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
