// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02637 dut (
    .DP_Hazards(in_vec[56:49]),
    .ID_Rs(in_vec[48:44]),
    .ID_Rt(in_vec[43:39]),
    .EX_Rs(in_vec[38:34]),
    .EX_Rt(in_vec[33:29]),
    .EX_RtRd(in_vec[28:24]),
    .MEM_RtRd(in_vec[23:19]),
    .WB_RtRd(in_vec[18:14]),
    .EX_Link(in_vec[13:13]),
    .EX_RegWrite(in_vec[12:12]),
    .MEM_RegWrite(in_vec[11:11]),
    .WB_RegWrite(in_vec[10:10]),
    .MEM_MemRead(in_vec[9:9]),
    .MEM_MemWrite(in_vec[8:8]),
    .InstMem_Read(in_vec[7:7]),
    .InstMem_Ready(in_vec[6:6]),
    .Mfc0(in_vec[5:5]),
    .IF_Exception_Stall(in_vec[4:4]),
    .ID_Exception_Stall(in_vec[3:3]),
    .EX_Exception_Stall(in_vec[2:2]),
    .EX_ALU_Stall(in_vec[1:1]),
    .M_Stall_Controller(in_vec[0:0]),
    .IF_Stall(out_vec[13:13]),
    .ID_Stall(out_vec[12:12]),
    .EX_Stall(out_vec[11:11]),
    .M_Stall(out_vec[10:10]),
    .WB_Stall(out_vec[9:9]),
    .ID_RsFwdSel(out_vec[8:7]),
    .ID_RtFwdSel(out_vec[6:5]),
    .EX_RsFwdSel(out_vec[4:3]),
    .EX_RtFwdSel(out_vec[2:1]),
    .M_WriteDataFwdSel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h188b67f91734928;
    stim[1] = 57'h0d7d97be2460b99;
    stim[2] = 57'h1472c6769a57ad6;
    stim[3] = 57'h015c9202d724f51;
    stim[4] = 57'h19651277f4c49d8;
    stim[5] = 57'h09d76179f63d710;
    stim[6] = 57'h1f92720d7f77417;
    stim[7] = 57'h17abcb3ed26f6ac;
    stim[8] = 57'h11f6886d058a670;
    stim[9] = 57'h1459f2595f07fe9;
    stim[10] = 57'h112f8a8300f5d7e;
    stim[11] = 57'h14366676439c29b;
    stim[12] = 57'h1ce4bbb2f52e934;
    stim[13] = 57'h1cbdb23cd7a9744;
    stim[14] = 57'h0707c853429dae9;
    stim[15] = 57'h05e86682ed28fef;
    stim[16] = 57'h1e2c33ea02a6030;
    stim[17] = 57'h11ba03803d9a31f;
    stim[18] = 57'h0a4a751ab6550ba;
    stim[19] = 57'h074dbb3fecd73ae;
    stim[20] = 57'h0d16aeea46ba093;
    stim[21] = 57'h140dae8ee11a60b;
    stim[22] = 57'h0591c9fe50ad4e8;
    stim[23] = 57'h036cc6358407565;
    stim[24] = 57'h0717f87e069534c;
    stim[25] = 57'h1a6328daf4ad577;
    stim[26] = 57'h0d5a4d23f71384a;
    stim[27] = 57'h118a1c096810152;
    stim[28] = 57'h1b6e610b795ee86;
    stim[29] = 57'h1905322b6876835;
    stim[30] = 57'h1a5ef85fa8edca0;
    stim[31] = 57'h17b62a99d9ba7ba;
    stim[32] = 57'h127cafb00a3a8dd;
    stim[33] = 57'h1c4492cb5b120c5;
    stim[34] = 57'h0311eb8146c612d;
    stim[35] = 57'h1bfea9eae7fcb8b;
    stim[36] = 57'h1d295d384c73e59;
    stim[37] = 57'h1e656449e320227;
    stim[38] = 57'h0848b4bee628cf7;
    stim[39] = 57'h139908819c02db0;
    stim[40] = 57'h10aa64612d04280;
    stim[41] = 57'h139edafa4959e0c;
    stim[42] = 57'h171fbedeeb60fb9;
    stim[43] = 57'h0014c9309e8c418;
    stim[44] = 57'h0fbbb0687febef3;
    stim[45] = 57'h0f5f04c51ddd66d;
    stim[46] = 57'h0e77b8c0f144ab5;
    stim[47] = 57'h1300d2a815d1ddb;
    stim[48] = 57'h02361820d188cbc;
    stim[49] = 57'h1dd0a6e1bf88693;
    stim[50] = 57'h1ee72786bba06b4;
    stim[51] = 57'h1aeaa8fe7fbcf85;
    stim[52] = 57'h05a56393ce0c18b;
    stim[53] = 57'h083f8e1b8d04c7f;
    stim[54] = 57'h040e0b59a9effa5;
    stim[55] = 57'h1e8224a8bf83f4c;
    stim[56] = 57'h07e1f8947ba05e5;
    stim[57] = 57'h1800483ea4fd269;
    stim[58] = 57'h1c8a648cf8bbe4d;
    stim[59] = 57'h15e8b4ff596c76b;
    stim[60] = 57'h09b7f1ced873470;
    stim[61] = 57'h00a0526af640bf0;
    stim[62] = 57'h0cf0d2005be064c;
    stim[63] = 57'h1166058ffdd2bc2;
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
      expv[0] = 14'h1060;
      expv[1] = 14'h3e00;
      expv[2] = 14'h3e1e;
      expv[3] = 14'h3e00;
      expv[4] = 14'h3e00;
      expv[5] = 14'h3e00;
      expv[6] = 14'h3e1e;
      expv[7] = 14'h3e7e;
      expv[8] = 14'h3e7e;
      expv[9] = 14'h3e7e;
      expv[10] = 14'h3e60;
      expv[11] = 14'h3e00;
      expv[12] = 14'h3e7e;
      expv[13] = 14'h3e00;
      expv[14] = 14'h3e60;
      expv[15] = 14'h3e60;
      expv[16] = 14'h3e7e;
      expv[17] = 14'h3e1e;
      expv[18] = 14'h3e60;
      expv[19] = 14'h3e7e;
      expv[20] = 14'h3e1e;
      expv[21] = 14'h1e1e;
      expv[22] = 14'h3e60;
      expv[23] = 14'h3e7e;
      expv[24] = 14'h3e00;
      expv[25] = 14'h3e60;
      expv[26] = 14'h3e1e;
      expv[27] = 14'h3e00;
      expv[28] = 14'h3e1e;
      expv[29] = 14'h3e7e;
      expv[30] = 14'h3e60;
      expv[31] = 14'h3e7e;
      expv[32] = 14'h3e1e;
      expv[33] = 14'h3e1e;
      expv[34] = 14'h1e7e;
      expv[35] = 14'h3e00;
      expv[36] = 14'h3e1e;
      expv[37] = 14'h1e60;
      expv[38] = 14'h3e60;
      expv[39] = 14'h3e7e;
      expv[40] = 14'h3e00;
      expv[41] = 14'h1800;
      expv[42] = 14'h3e60;
      expv[43] = 14'h3e00;
      expv[44] = 14'h3e7e;
      expv[45] = 14'h3e60;
      expv[46] = 14'h3e60;
      expv[47] = 14'h3e00;
      expv[48] = 14'h3e60;
      expv[49] = 14'h3e00;
      expv[50] = 14'h3e60;
      expv[51] = 14'h3e00;
      expv[52] = 14'h3e00;
      expv[53] = 14'h3e60;
      expv[54] = 14'h3e7e;
      expv[55] = 14'h3e1e;
      expv[56] = 14'h3e60;
      expv[57] = 14'h3e60;
      expv[58] = 14'h3e1e;
      expv[59] = 14'h3e60;
      expv[60] = 14'h3e7e;
      expv[61] = 14'h3e60;
      expv[62] = 14'h3e00;
      expv[63] = 14'h3e1e;
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
