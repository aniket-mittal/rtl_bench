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

  rtlpp_04288 dut (
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
    stim[0] = 57'h1cc1445dd1a6ef1;
    stim[1] = 57'h1376825ec31ecec;
    stim[2] = 57'h1b8059b9044afe8;
    stim[3] = 57'h1f004d8b36bce2e;
    stim[4] = 57'h1695a471bd1a054;
    stim[5] = 57'h03af4fa28acd600;
    stim[6] = 57'h1c31490b2f0c04e;
    stim[7] = 57'h098683b59a027d5;
    stim[8] = 57'h1b88b03c9b2f5a7;
    stim[9] = 57'h0abcb2c7630b1a1;
    stim[10] = 57'h0482de0ee5aeb75;
    stim[11] = 57'h0f076e84cedd6b6;
    stim[12] = 57'h11d76ffe71428e2;
    stim[13] = 57'h13d32e08ee83ec7;
    stim[14] = 57'h1de5b94e02aae7c;
    stim[15] = 57'h09a62f81beed83d;
    stim[16] = 57'h0681a9783cf1666;
    stim[17] = 57'h0d98ce041a1320d;
    stim[18] = 57'h0139431a714ca0c;
    stim[19] = 57'h1e1ce5fda9f0965;
    stim[20] = 57'h066a45aa2e8a992;
    stim[21] = 57'h1b9c4c4caf79db7;
    stim[22] = 57'h157a63db671ca64;
    stim[23] = 57'h0f727edb59566ed;
    stim[24] = 57'h01b7307dc20c858;
    stim[25] = 57'h10669f1e63e3bfd;
    stim[26] = 57'h1cb50e3a544c9dd;
    stim[27] = 57'h17f354b74f51cea;
    stim[28] = 57'h02f63a8e38a0756;
    stim[29] = 57'h11e31249afa6526;
    stim[30] = 57'h002924ca83fadbb;
    stim[31] = 57'h1300fa9f2bee8fa;
    stim[32] = 57'h0428ec53c928058;
    stim[33] = 57'h0d94e058896a705;
    stim[34] = 57'h15e70b2db567102;
    stim[35] = 57'h024e92f810e813d;
    stim[36] = 57'h067b0f68d040895;
    stim[37] = 57'h02bc5cad87cfa9f;
    stim[38] = 57'h00d3777ce86e5f3;
    stim[39] = 57'h1a2cf774ed66ebc;
    stim[40] = 57'h1685a5b88521d46;
    stim[41] = 57'h0c4bdf2c6da373e;
    stim[42] = 57'h1eeb5d0895b5bd3;
    stim[43] = 57'h163f2004767ea35;
    stim[44] = 57'h0ec61983f92e2f4;
    stim[45] = 57'h0f3840839a6fc17;
    stim[46] = 57'h172c6fd7e1b62a9;
    stim[47] = 57'h0808c7c0626a0c9;
    stim[48] = 57'h007b544ee410ae1;
    stim[49] = 57'h0cdcdb62ae05ffb;
    stim[50] = 57'h190670ee01a24b1;
    stim[51] = 57'h006f80c4a54cd88;
    stim[52] = 57'h150ece483f6acec;
    stim[53] = 57'h09f63562353da92;
    stim[54] = 57'h073036819e7871a;
    stim[55] = 57'h012b679f128b098;
    stim[56] = 57'h10a7ed9086d4184;
    stim[57] = 57'h0bda15cb5705c9a;
    stim[58] = 57'h0a8382cc3d86b2c;
    stim[59] = 57'h1d235ed243a2aaf;
    stim[60] = 57'h0b1e1d136bcbb6e;
    stim[61] = 57'h0d717996124b8f1;
    stim[62] = 57'h0c7a997017359fa;
    stim[63] = 57'h0d302730e044b7f;
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
      expv[0] = 14'h3e7e;
      expv[1] = 14'h3e7e;
      expv[2] = 14'h3e7e;
      expv[3] = 14'h1860;
      expv[4] = 14'h3e1e;
      expv[5] = 14'h0000;
      expv[6] = 14'h3e00;
      expv[7] = 14'h3e1e;
      expv[8] = 14'h3e7e;
      expv[9] = 14'h3e7e;
      expv[10] = 14'h3e7e;
      expv[11] = 14'h3e60;
      expv[12] = 14'h3e7e;
      expv[13] = 14'h3e1e;
      expv[14] = 14'h3e7e;
      expv[15] = 14'h3e60;
      expv[16] = 14'h3e60;
      expv[17] = 14'h1e1e;
      expv[18] = 14'h1800;
      expv[19] = 14'h3e60;
      expv[20] = 14'h3e1e;
      expv[21] = 14'h3e61;
      expv[22] = 14'h3e60;
      expv[23] = 14'h3e7e;
      expv[24] = 14'h3e00;
      expv[25] = 14'h3e7e;
      expv[26] = 14'h3e00;
      expv[27] = 14'h3e60;
      expv[28] = 14'h3e00;
      expv[29] = 14'h187e;
      expv[30] = 14'h3e7e;
      expv[31] = 14'h3e7e;
      expv[32] = 14'h3e00;
      expv[33] = 14'h1e1e;
      expv[34] = 14'h181e;
      expv[35] = 14'h3e60;
      expv[36] = 14'h3e00;
      expv[37] = 14'h3e1e;
      expv[38] = 14'h3e7e;
      expv[39] = 14'h3e7e;
      expv[40] = 14'h3e00;
      expv[41] = 14'h3e7e;
      expv[42] = 14'h3e00;
      expv[43] = 14'h3e7e;
      expv[44] = 14'h3e7e;
      expv[45] = 14'h3e1e;
      expv[46] = 14'h3e7e;
      expv[47] = 14'h3e1e;
      expv[48] = 14'h3e60;
      expv[49] = 14'h3e60;
      expv[50] = 14'h3e7e;
      expv[51] = 14'h3e00;
      expv[52] = 14'h3e7e;
      expv[53] = 14'h3e00;
      expv[54] = 14'h3e00;
      expv[55] = 14'h3e1e;
      expv[56] = 14'h3e00;
      expv[57] = 14'h3e00;
      expv[58] = 14'h187e;
      expv[59] = 14'h3e7e;
      expv[60] = 14'h3e7e;
      expv[61] = 14'h3e7e;
      expv[62] = 14'h3e60;
      expv[63] = 14'h3e60;
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
