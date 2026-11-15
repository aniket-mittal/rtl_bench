// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006216 dut (
    .src1_i(in_vec[72:41]),
    .src2_i(in_vec[40:9]),
    .ctrl_i(in_vec[8:5]),
    .shamt(in_vec[4:0]),
    .result_o(out_vec[32:1]),
    .zero_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h197e414371206b48bf5;
    stim[1] = 73'h1f291cf4ea8949d32b1;
    stim[2] = 73'h1da7183a107d04f91b8;
    stim[3] = 73'h0b3eaeaacf638acf835;
    stim[4] = 73'h1989862281076aa04a9;
    stim[5] = 73'h0fbe36cb0ce258a78e9;
    stim[6] = 73'h1a408e675cfec451edf;
    stim[7] = 73'h1be73c3eb2a052394ed;
    stim[8] = 73'h10f71475ad4793f5617;
    stim[9] = 73'h0ec90e75032d5070475;
    stim[10] = 73'h0a72571cf79cc3498e8;
    stim[11] = 73'h0e4ad87b841c6c21836;
    stim[12] = 73'h07faac85c4c827152eb;
    stim[13] = 73'h116ab89bacc83266954;
    stim[14] = 73'h0cb660a76cb41c5a345;
    stim[15] = 73'h025711236d52be0e7b0;
    stim[16] = 73'h0d44b0f98845752eaab;
    stim[17] = 73'h038a54b5f9fbde16711;
    stim[18] = 73'h096e7206127adbc63b2;
    stim[19] = 73'h18291a2b804f95b8880;
    stim[20] = 73'h020e0829b0ed9ee44b7;
    stim[21] = 73'h1d7d7677acd59e0cc60;
    stim[22] = 73'h03c4dfd6968d485d927;
    stim[23] = 73'h0596ccf13506955afc4;
    stim[24] = 73'h1fe3ade32faa9c9b850;
    stim[25] = 73'h0dce38802a230194c69;
    stim[26] = 73'h09bbb5405b29aa52ceb;
    stim[27] = 73'h0e1eed134b8c75c411e;
    stim[28] = 73'h0b7efe7589e8995d44f;
    stim[29] = 73'h039dc81f20c412ff31c;
    stim[30] = 73'h1e194359b62d02826b9;
    stim[31] = 73'h16dbca232c06136f466;
    stim[32] = 73'h04b6bcac84f1bb0ba31;
    stim[33] = 73'h19dea86654804cee1db;
    stim[34] = 73'h1ff8fcb9e61458a692d;
    stim[35] = 73'h0371fd6a748e1830271;
    stim[36] = 73'h197056b5606e348fd68;
    stim[37] = 73'h0ecbe6008f7c1b9acf1;
    stim[38] = 73'h1548b151eb34fe63644;
    stim[39] = 73'h1b291e9c66ece5ba318;
    stim[40] = 73'h04c821753de7b8d8258;
    stim[41] = 73'h0308ab004d4bcde8adc;
    stim[42] = 73'h085c81ff23a8f11d0de;
    stim[43] = 73'h1816befa7b567236c3b;
    stim[44] = 73'h02286f8b3b899975c84;
    stim[45] = 73'h05cff890c467ddd1d96;
    stim[46] = 73'h02b1c7ec1e003aa3190;
    stim[47] = 73'h12238f203d39e2d65c8;
    stim[48] = 73'h1da50c9dec9691cde49;
    stim[49] = 73'h11209511895fb0f7048;
    stim[50] = 73'h0ec68b4f7eeeb693049;
    stim[51] = 73'h09e637935f79f3559bf;
    stim[52] = 73'h15b1f3e29922e253b55;
    stim[53] = 73'h09541e622a65ba4ed4e;
    stim[54] = 73'h03c278e7e08e3dc6581;
    stim[55] = 73'h1884f2f1d240ba18cce;
    stim[56] = 73'h1714e37308262a02034;
    stim[57] = 73'h0284cbe969219578e20;
    stim[58] = 73'h05f1ec32db352fa75d3;
    stim[59] = 73'h0becf3db386253e203e;
    stim[60] = 73'h167dc05e8709b6a1b36;
    stim[61] = 73'h1c9733e96363ea7ee80;
    stim[62] = 73'h0253f2edd6b4edca0fa;
    stim[63] = 73'h1f694e761a67f87df7b;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h00000544a;
      expv[2] = 33'h000000000;
      expv[3] = 33'h1bdb23db4;
      expv[4] = 33'h000083b54;
      expv[5] = 33'h1ca08f728;
      expv[6] = 33'h1fffffff2;
      expv[7] = 33'h0e878e77e;
      expv[8] = 33'h1e3ea86b0;
      expv[9] = 33'h0fed5e754;
      expv[10] = 33'h020f1a666;
      expv[11] = 33'h0a2e6c5a0;
      expv[12] = 33'h0cc2d39ae;
      expv[13] = 33'h126680000;
      expv[14] = 33'h1c5a20000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000108aea;
      expv[17] = 33'h000000002;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000002;
      expv[20] = 33'h1fffffe1c;
      expv[21] = 33'h1dfdfe7fe;
      expv[22] = 33'h0d3797790;
      expv[23] = 33'h000000000;
      expv[24] = 33'h0fa28c830;
      expv[25] = 33'h0fef3994e;
      expv[26] = 33'h04e55f930;
      expv[27] = 33'h000000000;
      expv[28] = 33'h096898550;
      expv[29] = 33'h000000000;
      expv[30] = 33'h1ffffffb0;
      expv[31] = 33'h1edfdb6f6;
      expv[32] = 33'h1fc501a0e;
      expv[33] = 33'h000000000;
      expv[34] = 33'h19e4a4136;
      expv[35] = 33'h17fffd7a6;
      expv[36] = 33'h197056bfe;
      expv[37] = 33'h1e48019b4;
      expv[38] = 33'h0100b0416;
      expv[39] = 33'h000000000;
      expv[40] = 33'h04c020502;
      expv[41] = 33'h0352f37a2;
      expv[42] = 33'h00000001c;
      expv[43] = 33'h1cc04cc3a;
      expv[44] = 33'h000000000;
      expv[45] = 33'h01681abf1;
      expv[46] = 33'h04b18d491;
      expv[47] = 33'h000000000;
      expv[48] = 33'h0c84008de;
      expv[49] = 33'h010090110;
      expv[50] = 33'h0ec682030;
      expv[51] = 33'h000000000;
      expv[52] = 33'h0253a0000;
      expv[53] = 33'h1a4ec0000;
      expv[54] = 33'h03343b21b;
      expv[55] = 33'h1fffc902e;
      expv[56] = 33'h0eeeb9710;
      expv[57] = 33'h196336708;
      expv[58] = 33'h000000000;
      expv[59] = 33'h138a9ff92;
      expv[60] = 33'h0f7409bce;
      expv[61] = 33'h000000002;
      expv[62] = 33'h1908e0b7c;
      expv[63] = 33'h1f695e7fe;
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
