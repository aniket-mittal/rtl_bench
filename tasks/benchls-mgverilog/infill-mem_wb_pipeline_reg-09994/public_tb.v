// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09994 dut (
    .clk(clk),
    .control_wb_in(in_vec[70:69]),
    .Read_data_in(in_vec[68:37]),
    .ALU_result_in(in_vec[36:5]),
    .Write_reg_in(in_vec[4:0]),
    .mem_control_wb(out_vec[70:69]),
    .Read_data(out_vec[68:37]),
    .mem_ALU_result(out_vec[36:5]),
    .mem_Write_reg(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h48df49ae349a0f3070;
    stim[1] = 71'h4ec82648788551f14e;
    stim[2] = 71'h77c014415833e8610b;
    stim[3] = 71'h56a172ec087a5b52cd;
    stim[4] = 71'h5c0846f3340af39d8e;
    stim[5] = 71'h06964cb630bc43872a;
    stim[6] = 71'h389842b3520ac44edd;
    stim[7] = 71'h64b96c6e952e44404b;
    stim[8] = 71'h6a64a95138e51b1675;
    stim[9] = 71'h4d243461172b4d1740;
    stim[10] = 71'h16f3e1dbe0a7cbebb0;
    stim[11] = 71'h01f1a9f8e26f125a2e;
    stim[12] = 71'h4eb33f34b4403d9c54;
    stim[13] = 71'h61a7db019c2262c28b;
    stim[14] = 71'h432896ae8f4de4e484;
    stim[15] = 71'h0b5ee5250b022e5c0d;
    stim[16] = 71'h55aa468f3c8c86575f;
    stim[17] = 71'h02fadee6106bbd3a0a;
    stim[18] = 71'h01251b249351c29f34;
    stim[19] = 71'h2078e13071278e4d39;
    stim[20] = 71'h56aebe661be13d4abd;
    stim[21] = 71'h0e41386ab5cc59c70c;
    stim[22] = 71'h26e4261b729cd853d9;
    stim[23] = 71'h3d2d98cf6d417f4f02;
    stim[24] = 71'h61c4de6f6c2aef7d03;
    stim[25] = 71'h29f7917c81cfea6706;
    stim[26] = 71'h78e8d64244d83c0447;
    stim[27] = 71'h4c24cdee52c9729126;
    stim[28] = 71'h4444ada251eecb90d9;
    stim[29] = 71'h041af8ceab84ee0812;
    stim[30] = 71'h409ad72558c081f90c;
    stim[31] = 71'h566cd466a824fa0e17;
    stim[32] = 71'h3664fb6cd1d555d968;
    stim[33] = 71'h64b4b4d7918c6e7b7b;
    stim[34] = 71'h250b8a370e44cca6a2;
    stim[35] = 71'h3945d5a85b6d99dbfc;
    stim[36] = 71'h107573961b35a1e261;
    stim[37] = 71'h45abdc7b78e7195b66;
    stim[38] = 71'h46b7c37ce0d6911479;
    stim[39] = 71'h7425cdda7077f23179;
    stim[40] = 71'h1ae0decb99a497b3b5;
    stim[41] = 71'h5d7f54883430dc4a0a;
    stim[42] = 71'h2eb526e4116f9e144b;
    stim[43] = 71'h378888d1181e768e52;
    stim[44] = 71'h737cde55c78eee6f71;
    stim[45] = 71'h0934992c6474c8b616;
    stim[46] = 71'h25a538a4361551b8cb;
    stim[47] = 71'h34c204590267e6882c;
    stim[48] = 71'h7f6bca8280d6700c85;
    stim[49] = 71'h19b5b0270cc0fc2ff2;
    stim[50] = 71'h426d908e7ae84fc4df;
    stim[51] = 71'h5f56c7ceb8a5214e62;
    stim[52] = 71'h24e26b1b823028a16d;
    stim[53] = 71'h2fa061c681f6ec9acb;
    stim[54] = 71'h531acf83092672ce19;
    stim[55] = 71'h79aaa847e026baa0a2;
    stim[56] = 71'h39c95d4e30e54f59a4;
    stim[57] = 71'h5f105835b0068a067f;
    stim[58] = 71'h4f1903688428f89a1d;
    stim[59] = 71'h40e6f639e023fa691e;
    stim[60] = 71'h7e217bdb1b8b032e67;
    stim[61] = 71'h6eb74c236895868229;
    stim[62] = 71'h2d846fe923cc63646e;
    stim[63] = 71'h1673497f07bfca527a;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h48df49ae349a0f3070;
      expv[2] = 71'h4ec82648788551f14e;
      expv[3] = 71'h77c014415833e8610b;
      expv[4] = 71'h56a172ec087a5b52cd;
      expv[5] = 71'h5c0846f3340af39d8e;
      expv[6] = 71'h06964cb630bc43872a;
      expv[7] = 71'h389842b3520ac44edd;
      expv[8] = 71'h64b96c6e952e44404b;
      expv[9] = 71'h6a64a95138e51b1675;
      expv[10] = 71'h4d243461172b4d1740;
      expv[11] = 71'h16f3e1dbe0a7cbebb0;
      expv[12] = 71'h01f1a9f8e26f125a2e;
      expv[13] = 71'h4eb33f34b4403d9c54;
      expv[14] = 71'h61a7db019c2262c28b;
      expv[15] = 71'h432896ae8f4de4e484;
      expv[16] = 71'h0b5ee5250b022e5c0d;
      expv[17] = 71'h55aa468f3c8c86575f;
      expv[18] = 71'h02fadee6106bbd3a0a;
      expv[19] = 71'h01251b249351c29f34;
      expv[20] = 71'h2078e13071278e4d39;
      expv[21] = 71'h56aebe661be13d4abd;
      expv[22] = 71'h0e41386ab5cc59c70c;
      expv[23] = 71'h26e4261b729cd853d9;
      expv[24] = 71'h3d2d98cf6d417f4f02;
      expv[25] = 71'h61c4de6f6c2aef7d03;
      expv[26] = 71'h29f7917c81cfea6706;
      expv[27] = 71'h78e8d64244d83c0447;
      expv[28] = 71'h4c24cdee52c9729126;
      expv[29] = 71'h4444ada251eecb90d9;
      expv[30] = 71'h041af8ceab84ee0812;
      expv[31] = 71'h409ad72558c081f90c;
      expv[32] = 71'h566cd466a824fa0e17;
      expv[33] = 71'h3664fb6cd1d555d968;
      expv[34] = 71'h64b4b4d7918c6e7b7b;
      expv[35] = 71'h250b8a370e44cca6a2;
      expv[36] = 71'h3945d5a85b6d99dbfc;
      expv[37] = 71'h107573961b35a1e261;
      expv[38] = 71'h45abdc7b78e7195b66;
      expv[39] = 71'h46b7c37ce0d6911479;
      expv[40] = 71'h7425cdda7077f23179;
      expv[41] = 71'h1ae0decb99a497b3b5;
      expv[42] = 71'h5d7f54883430dc4a0a;
      expv[43] = 71'h2eb526e4116f9e144b;
      expv[44] = 71'h378888d1181e768e52;
      expv[45] = 71'h737cde55c78eee6f71;
      expv[46] = 71'h0934992c6474c8b616;
      expv[47] = 71'h25a538a4361551b8cb;
      expv[48] = 71'h34c204590267e6882c;
      expv[49] = 71'h7f6bca8280d6700c85;
      expv[50] = 71'h19b5b0270cc0fc2ff2;
      expv[51] = 71'h426d908e7ae84fc4df;
      expv[52] = 71'h5f56c7ceb8a5214e62;
      expv[53] = 71'h24e26b1b823028a16d;
      expv[54] = 71'h2fa061c681f6ec9acb;
      expv[55] = 71'h531acf83092672ce19;
      expv[56] = 71'h79aaa847e026baa0a2;
      expv[57] = 71'h39c95d4e30e54f59a4;
      expv[58] = 71'h5f105835b0068a067f;
      expv[59] = 71'h4f1903688428f89a1d;
      expv[60] = 71'h40e6f639e023fa691e;
      expv[61] = 71'h7e217bdb1b8b032e67;
      expv[62] = 71'h6eb74c236895868229;
      expv[63] = 71'h2d846fe923cc63646e;
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
