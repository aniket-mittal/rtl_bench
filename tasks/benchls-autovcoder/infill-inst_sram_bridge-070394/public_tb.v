// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070394 dut (
    .clk(clk),
    .rst(in_vec[68:68]),
    .inst_sram_en(in_vec[67:67]),
    .inst_sram_addr(in_vec[66:35]),
    .longest_stall(in_vec[34:34]),
    .inst_addr_ok(in_vec[33:33]),
    .inst_data_ok(in_vec[32:32]),
    .inst_rdata(in_vec[31:0]),
    .inst_sram_rdata(out_vec[100:69]),
    .i_stall(out_vec[68:68]),
    .inst_req(out_vec[67:67]),
    .inst_wr(out_vec[66:66]),
    .inst_size(out_vec[65:64]),
    .inst_addr(out_vec[63:32]),
    .inst_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1a4ae275d297dc182f;
    stim[1] = 69'h1b8b89bc70ac0dc631;
    stim[2] = 69'h039a0f8b9245f5ace9;
    stim[3] = 69'h098271b0ea9c9ae1aa;
    stim[4] = 69'h0cbb1cfe60e026f3b1;
    stim[5] = 69'h0073a687a2224b38a4;
    stim[6] = 69'h00237231c354d6b4f5;
    stim[7] = 69'h0fca4b1a4cb876fc1a;
    stim[8] = 69'h07b3971716f3246e1e;
    stim[9] = 69'h004f99c421ef060cb5;
    stim[10] = 69'h1da83687a2604c0c43;
    stim[11] = 69'h023cf88566d91de856;
    stim[12] = 69'h0e4991ea3787334dab;
    stim[13] = 69'h0ecac29a27015459ed;
    stim[14] = 69'h098bb06bb51628857e;
    stim[15] = 69'h0dd54ed295c25ada81;
    stim[16] = 69'h06b583f1c262604549;
    stim[17] = 69'h0672316e5790fe669e;
    stim[18] = 69'h055f2366ac966c424e;
    stim[19] = 69'h038d718141eea34906;
    stim[20] = 69'h0d3ff4f5f09b4b6ee0;
    stim[21] = 69'h04a6a19a595c5848f6;
    stim[22] = 69'h0083d436c73fc04ed9;
    stim[23] = 69'h003c24c30edb290120;
    stim[24] = 69'h0b17832f53ee11a41f;
    stim[25] = 69'h0a0237b70101d62105;
    stim[26] = 69'h012078becbb20a56ad;
    stim[27] = 69'h073233d68a69b53e75;
    stim[28] = 69'h07e6b897b173ba17e8;
    stim[29] = 69'h0dab7e0a1bc2d7ab80;
    stim[30] = 69'h0f1b23113316503b14;
    stim[31] = 69'h0a24b0e15999e67f59;
    stim[32] = 69'h03c761f488ea7167c6;
    stim[33] = 69'h0f740aed5316b5cecf;
    stim[34] = 69'h0dc6e757842fe2b5f6;
    stim[35] = 69'h0c22852ec59aef700b;
    stim[36] = 69'h03a3ebc97268f9ef4a;
    stim[37] = 69'h03d623f26b14fa5e39;
    stim[38] = 69'h0a691953313e5567e0;
    stim[39] = 69'h01df3289e9f407e30d;
    stim[40] = 69'h04c9c0d1f7d9139a37;
    stim[41] = 69'h075eb42a23999d7f9e;
    stim[42] = 69'h047c8224424132bd6c;
    stim[43] = 69'h07c42d79ccea6c25d6;
    stim[44] = 69'h04ed7222474cee0d4e;
    stim[45] = 69'h03f18ce9a41b997eaf;
    stim[46] = 69'h018ad4482fd6ef998f;
    stim[47] = 69'h0991c57a514f241ba0;
    stim[48] = 69'h0b7057f1829cfef20b;
    stim[49] = 69'h06315d06f01ec4aa8d;
    stim[50] = 69'h0735a9302c60217b71;
    stim[51] = 69'h05599e6871ac8b78c0;
    stim[52] = 69'h01350691d75bd153a3;
    stim[53] = 69'h063694b3af1683c910;
    stim[54] = 69'h03648390e10e847280;
    stim[55] = 69'h0da2ec5d1aced78702;
    stim[56] = 69'h17ff20f0bc219699a9;
    stim[57] = 69'h05cb5ac1c6da78d5b4;
    stim[58] = 69'h058b8cec2cc13cb937;
    stim[59] = 69'h06c185d65245e48d96;
    stim[60] = 69'h0d379585b571de9189;
    stim[61] = 69'h0f1fd7eb8521ae76df;
    stim[62] = 69'h00552170b7e52cf424;
    stim[63] = 69'h00f869d0a712b8612f;
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
      expv[0] = 101'hxxxxxxxxxx495c4eba00000000;
      expv[1] = 101'h000000001a7171378e00000000;
      expv[2] = 101'h00000000027341f17200000000;
      expv[3] = 101'h000000001a304e361d00000000;
      expv[4] = 101'h000000001297639fcc00000000;
      expv[5] = 101'h00000000020e74d0f400000000;
      expv[6] = 101'h0000000002046e463800000000;
      expv[7] = 101'h0a9ad69ea2f949634900000000;
      expv[8] = 101'h0a9ad69ea2f672e2e200000000;
      expv[9] = 101'h0a9ad69ea209f3388400000000;
      expv[10] = 101'h1de0c196a2b506d0f400000000;
      expv[11] = 101'h0000000002479f10ac00000000;
      expv[12] = 101'h000000001ac9323d4600000000;
      expv[13] = 101'h10e669b562d958534400000000;
      expv[14] = 101'h002a8b3da231760d7600000000;
      expv[15] = 101'h02c510afc2baa9da5200000000;
      expv[16] = 101'h184b5b5022d6b07e3800000000;
      expv[17] = 101'h184b5b5022ce462dca00000000;
      expv[18] = 101'h121fccd3c2abe46cd500000000;
      expv[19] = 101'h121fccd3c271ae302800000000;
      expv[20] = 101'h1dd46920c2a7fe9ebe00000000;
      expv[21] = 101'h1dd46920c294d4334b00000000;
      expv[22] = 101'h0b8b091ec2107a86d800000000;
      expv[23] = 101'h07f809db220784986100000000;
      expv[24] = 101'h07f809db2262f065ea00000000;
      expv[25] = 101'h1dc23483e24046f6e000000000;
      expv[26] = 101'h003ac420a2240f17d900000000;
      expv[27] = 101'h16414ad5a2e6467ad100000000;
      expv[28] = 101'h16414ad5a2fcd712f600000000;
      expv[29] = 101'h0e7742fd02b56fc14300000000;
      expv[30] = 101'h185af57002e364622600000000;
      expv[31] = 101'h02ca07628244961c2b00000000;
      expv[32] = 101'h133ccfeb2278ec3e9100000000;
      expv[33] = 101'h133ccfeb3aee815daa00000000;
      expv[34] = 101'h02d6b9d9e2b8dceaf000000000;
      expv[35] = 101'h02d6b9d9e28450a5d800000000;
      expv[36] = 101'h135dee0162747d792e00000000;
      expv[37] = 101'h135dee01627ac47e4d00000000;
      expv[38] = 101'h029f4bc7224d232a6600000000;
      expv[39] = 101'h07caacfc023be6513d00000000;
      expv[40] = 101'h1e80fc61a299381a3e00000000;
      expv[41] = 101'h1b227346e2ebd6854400000000;
      expv[42] = 101'h1333aff3c28f90448800000000;
      expv[43] = 101'h1333aff3c2f885af3900000000;
      expv[44] = 101'h1333aff3c29dae444800000000;
      expv[45] = 101'h099dc1a9c27e319d3400000000;
      expv[46] = 101'h099dc1a9c2315a890500000000;
      expv[47] = 101'h1addf331e23238af4a00000000;
      expv[48] = 101'h09e48374026e0afe3000000000;
      expv[49] = 101'h09e4837402c62ba0de00000000;
      expv[50] = 101'h09e4837402e6b5260500000000;
      expv[51] = 101'h09e4837402ab33cd0e00000000;
      expv[52] = 101'h15916f180226a0d23a00000000;
      expv[53] = 101'h0b7a2a7462c6d2967500000000;
      expv[54] = 101'h02d07922026c90721c00000000;
      expv[55] = 101'h01d08e5002b45d8ba300000000;
      expv[56] = 101'h01d08e5002ffe41e1700000000;
      expv[57] = 101'h0000000002b96b583800000000;
      expv[58] = 101'h0000000002b1719d8500000000;
      expv[59] = 101'h0000000002d830baca00000000;
      expv[60] = 101'h000000001aa6f2b0b600000000;
      expv[61] = 101'h0e3bd23122e3fafd7000000000;
      expv[62] = 101'h0435cedbe20aa42e1600000000;
      expv[63] = 101'h1ca59e84821f0d3a1400000000;
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
