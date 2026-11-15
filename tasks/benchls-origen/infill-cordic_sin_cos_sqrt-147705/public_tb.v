// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147705 dut (
    .clk(clk),
    .rst_n(in_vec[96:96]),
    .angle(in_vec[95:64]),
    .sqrt_in(in_vec[63:0]),
    .sin_out(out_vec[79:64]),
    .cos_out(out_vec[63:48]),
    .sinh_out(out_vec[47:32]),
    .sqrt_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h04d7ecbf3ee63899755222f4a;
    stim[1] = 97'h0f91eeb658984dae05e8c3495;
    stim[2] = 97'h1a48d48d0707e341a812b5917;
    stim[3] = 97'h1ed41b7374fefb33343770c99;
    stim[4] = 97'h12e94ba19e47462eb4a367349;
    stim[5] = 97'h14375e75a934aa162245b6b2d;
    stim[6] = 97'h10da66da25b62e24cd241ab2d;
    stim[7] = 97'h1f271d2590a09809dbfa3c888;
    stim[8] = 97'h05979d4354d671c02f76af9ac;
    stim[9] = 97'h19124c0569866c497b6cf94ea;
    stim[10] = 97'h1d64239cf12707d1d32a14745;
    stim[11] = 97'h179b2e83c18bf99de9ea323ac;
    stim[12] = 97'h12c5a8236edbef560d7a77db4;
    stim[13] = 97'h1c4eb0dc433c973da64ac00a3;
    stim[14] = 97'h1df55d181c8761b9fa49f39f3;
    stim[15] = 97'h10b09c071a55260d5efab6a65;
    stim[16] = 97'h15e716dde4cab81ab0f8c54f6;
    stim[17] = 97'h15beac5ece54f1aa08391d9de;
    stim[18] = 97'h124bb0dbdf3980e05a34f9dab;
    stim[19] = 97'h1b3d07b32d76fb0c2c0573bb2;
    stim[20] = 97'h1ae8e3c03b75ce9d7a6d3a3f5;
    stim[21] = 97'h10754f5121cf8acf445d44a3c;
    stim[22] = 97'h16532007038e81f7bb34a7d4c;
    stim[23] = 97'h13174b4bf6ace3ea56d54043b;
    stim[24] = 97'h1bf8806e8ed3ce253020b87af;
    stim[25] = 97'h1bd961418f93fd876047a535f;
    stim[26] = 97'h1dde505418c52c0ae27f987bb;
    stim[27] = 97'h1969ebb86f046e1d77260c1b4;
    stim[28] = 97'h11ec2167dfacc7268f9869ec5;
    stim[29] = 97'h10a8d81d6d03ffe6c86d3db6f;
    stim[30] = 97'h0f65011999da08d691d2fab5d;
    stim[31] = 97'h125068f8b99699580c28f579d;
    stim[32] = 97'h173c842dbf96556e3fdd3e770;
    stim[33] = 97'h1a1556bb277be34a9ca110ee2;
    stim[34] = 97'h17f5d01d9a47db66e0eb05335;
    stim[35] = 97'h188004b7b9a9e9ac2c118a380;
    stim[36] = 97'h1810cac06daeff2ab46464a39;
    stim[37] = 97'h18f5355fa0b0f4746b45692b2;
    stim[38] = 97'h1925eeef00bdd6b55fc1856c4;
    stim[39] = 97'h1864896075cb0a19d88f97666;
    stim[40] = 97'h1250e3e1afd70290020daf8c4;
    stim[41] = 97'h150a102d29ab8354d2bdc328a;
    stim[42] = 97'h1fe13457f788efdb2f0bb23d3;
    stim[43] = 97'h12723be8922a76650d22d5a56;
    stim[44] = 97'h15f61bc4cd39077556d6a5fcf;
    stim[45] = 97'h1f568f9eed20618a14f69f2ef;
    stim[46] = 97'h114d7ff20a531b6baf3a892a0;
    stim[47] = 97'h184a5b0bbfb77c2736fc39ece;
    stim[48] = 97'h13d6e26d095ab8cffea770aef;
    stim[49] = 97'h17fd9ff2dfb1f7e2dffbcfc83;
    stim[50] = 97'h1d9bdef81f022583f84a7fa28;
    stim[51] = 97'h0ccf3882a3d19da856736149d;
    stim[52] = 97'h14b0cd3da13d135e79ddaa2ae;
    stim[53] = 97'h1ae6a019b0d507e9d5f2e821d;
    stim[54] = 97'h131dc0779f5b7c1a1731c28dc;
    stim[55] = 97'h1e7153f3ec782231eb6a7191e;
    stim[56] = 97'h1c0cf91a504ede87909cc3f06;
    stim[57] = 97'h13e3e760b1b79ae2bfcf011f1;
    stim[58] = 97'h1882b283df1a8943b1b1f244e;
    stim[59] = 97'h1b433831b9265f3cce7a0a0ad;
    stim[60] = 97'h1124cd15bcd47f0be2fe9cce6;
    stim[61] = 97'h10589cee1250bdad8535e98b2;
    stim[62] = 97'h148f2876d507d39336e7ef5d8;
    stim[63] = 97'h1a5e34dc2c259db7d66215c09;
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
      expv[0] = 80'h00000000000000000000;
      expv[1] = 80'h00000000000000000000;
      expv[2] = 80'h00000000000000000000;
      expv[3] = 80'h00000000000000000000;
      expv[4] = 80'h00000000000000000000;
      expv[5] = 80'h00000000000000000000;
      expv[6] = 80'h00000000000000000000;
      expv[7] = 80'h00000000000000000000;
      expv[8] = 80'h00000000000000000000;
      expv[9] = 80'h00000000000000000000;
      expv[10] = 80'h00000000000000000000;
      expv[11] = 80'h00000000000000000000;
      expv[12] = 80'h00000000000000000000;
      expv[13] = 80'h00000000000000000000;
      expv[14] = 80'h00000000000000000000;
      expv[15] = 80'h00000000000000000000;
      expv[16] = 80'h00000000000000000000;
      expv[17] = 80'h00000000000000000000;
      expv[18] = 80'h00000000000000000000;
      expv[19] = 80'h00000000000000000000;
      expv[20] = 80'h00000000000000000000;
      expv[21] = 80'h00000000000000000000;
      expv[22] = 80'h00000000000000000000;
      expv[23] = 80'h0352d6e5000000000000;
      expv[24] = 80'h648bcb65000000000000;
      expv[25] = 80'hfc38d42f000000000000;
      expv[26] = 80'ha3a2c4df000000000000;
      expv[27] = 80'h33d89a75000000000000;
      expv[28] = 80'h82fddf67000000000000;
      expv[29] = 80'h2be9fc34000000000000;
      expv[30] = 80'h00000000000000000000;
      expv[31] = 80'h00000000000000000000;
      expv[32] = 80'h00000000000000000000;
      expv[33] = 80'h00000000000000000000;
      expv[34] = 80'h00000000000000000000;
      expv[35] = 80'h00000000000000000000;
      expv[36] = 80'h00000000000000000000;
      expv[37] = 80'h00000000000000000000;
      expv[38] = 80'h00000000000000000000;
      expv[39] = 80'h00000000000000000000;
      expv[40] = 80'h00000000000000000000;
      expv[41] = 80'h00000000000000000000;
      expv[42] = 80'h00000000000000000000;
      expv[43] = 80'h00000000000000000000;
      expv[44] = 80'h00000000000000000000;
      expv[45] = 80'h8bf2d65c000000000000;
      expv[46] = 80'hfc38d42f000000000000;
      expv[47] = 80'h0111175a000000000000;
      expv[48] = 80'hfc38d42f000000000000;
      expv[49] = 80'h03c7d42f000000000000;
      expv[50] = 80'h03c7d42f000000000000;
      expv[51] = 80'h00000000000000000000;
      expv[52] = 80'h00000000000000000000;
      expv[53] = 80'h00000000000000000000;
      expv[54] = 80'h00000000000000000000;
      expv[55] = 80'h00000000000000000000;
      expv[56] = 80'h00000000000000000000;
      expv[57] = 80'h00000000000000000000;
      expv[58] = 80'h00000000000000000000;
      expv[59] = 80'h00000000000000000000;
      expv[60] = 80'h00000000000000000000;
      expv[61] = 80'h00000000000000000000;
      expv[62] = 80'h00000000000000000000;
      expv[63] = 80'h00000000000000000000;
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
