// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034443 dut (
    .cond3(in_vec[65:65]),
    .Jump3(in_vec[64:64]),
    .IR2(in_vec[63:32]),
    .IR3(in_vec[31:0]),
    .stall_flush_IR2(out_vec[5:4]),
    .stall_flush_IR3(out_vec[3:3]),
    .stall_flush(out_vec[2:2]),
    .PC2_stall(out_vec[1:1]),
    .PC_stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3a381c6dd08df1ce3;
    stim[1] = 66'h267530f58aaf7c563;
    stim[2] = 66'h0af757ffb31c0371e;
    stim[3] = 66'h3df1f3785f6f51597;
    stim[4] = 66'h2868ce87745054a6d;
    stim[5] = 66'h398cb9ce9c0527e7f;
    stim[6] = 66'h143730fd1c4286f34;
    stim[7] = 66'h3bc9a3c54718e64db;
    stim[8] = 66'h36aea8abce478d8ea;
    stim[9] = 66'h1393a9df261844064;
    stim[10] = 66'h324489d192084567f;
    stim[11] = 66'h187b05b37f2e97351;
    stim[12] = 66'h278b6d592e1db25e6;
    stim[13] = 66'h3387ef07173f693d8;
    stim[14] = 66'h3749379ffa4b034c6;
    stim[15] = 66'h1dca0f116955d4790;
    stim[16] = 66'h31e68d9c138caa39c;
    stim[17] = 66'h1487be621798882b3;
    stim[18] = 66'h054d3643e3db4bba8;
    stim[19] = 66'h2a96f4cd98439d3ea;
    stim[20] = 66'h1d89c87419059ee60;
    stim[21] = 66'h2a9752e4095a1028c;
    stim[22] = 66'h1bfe5b81c766f4961;
    stim[23] = 66'h1f9d3deba70b5c144;
    stim[24] = 66'h29ae1767290b8485c;
    stim[25] = 66'h17f4e8318b3dd16c2;
    stim[26] = 66'h1c467aee9962a91bd;
    stim[27] = 66'h035829376670e39f6;
    stim[28] = 66'h0a81f848c41e2297f;
    stim[29] = 66'h3733324d04f8b9b3b;
    stim[30] = 66'h3de2ef575dfd3c13e;
    stim[31] = 66'h0d3df472593095bde;
    stim[32] = 66'h3bbb88297521343e0;
    stim[33] = 66'h3ab34bd9145e21977;
    stim[34] = 66'h2e4eab1405e58883e;
    stim[35] = 66'h1a44eaeca45d06e92;
    stim[36] = 66'h303c0e1f53046fcf8;
    stim[37] = 66'h1ce22d09cf0b948ad;
    stim[38] = 66'h31e3152ce10575177;
    stim[39] = 66'h216c4d505365fbd89;
    stim[40] = 66'h18e5f385bda83118b;
    stim[41] = 66'h3db26e8754c5ac245;
    stim[42] = 66'h1f7204e03e55defb8;
    stim[43] = 66'h2dc1aaa13a70bd177;
    stim[44] = 66'h2374c7f21cbf2f542;
    stim[45] = 66'h041b544023db0af30;
    stim[46] = 66'h3258bef269374b735;
    stim[47] = 66'h1eefd8de02d04cf5f;
    stim[48] = 66'h073d88769f6b772a6;
    stim[49] = 66'h05fb1d4c4886b16cd;
    stim[50] = 66'h3b24028946e1ff693;
    stim[51] = 66'h323ba2e00a8b27765;
    stim[52] = 66'h16780cfc00f2338da;
    stim[53] = 66'h2aba61b6cb5f1d0f3;
    stim[54] = 66'h07948210c36811785;
    stim[55] = 66'h14839ffcde0838f78;
    stim[56] = 66'h279df737ebf18c9cb;
    stim[57] = 66'h2ad682b22bb74f11a;
    stim[58] = 66'h29093146153876ea8;
    stim[59] = 66'h08c9a85e09c80a743;
    stim[60] = 66'h1f8e04964f53c0e67;
    stim[61] = 66'h1cc52787dee31a58e;
    stim[62] = 66'h1ef38035ae18cfd01;
    stim[63] = 66'h3ca0248caf590057a;
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
      expv[0] = 6'h1c;
      expv[1] = 6'h1c;
      expv[2] = 6'h00;
      expv[3] = 6'h1c;
      expv[4] = 6'h1c;
      expv[5] = 6'h1c;
      expv[6] = 6'h1c;
      expv[7] = 6'h1c;
      expv[8] = 6'h1c;
      expv[9] = 6'h1c;
      expv[10] = 6'h1c;
      expv[11] = 6'h1c;
      expv[12] = 6'h1c;
      expv[13] = 6'h1c;
      expv[14] = 6'h1c;
      expv[15] = 6'h1c;
      expv[16] = 6'h1c;
      expv[17] = 6'h1c;
      expv[18] = 6'h00;
      expv[19] = 6'h1c;
      expv[20] = 6'h1c;
      expv[21] = 6'h1c;
      expv[22] = 6'h1c;
      expv[23] = 6'h1c;
      expv[24] = 6'h1c;
      expv[25] = 6'h1c;
      expv[26] = 6'h1c;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h1c;
      expv[30] = 6'h1c;
      expv[31] = 6'h00;
      expv[32] = 6'h1c;
      expv[33] = 6'h1c;
      expv[34] = 6'h1c;
      expv[35] = 6'h1c;
      expv[36] = 6'h1c;
      expv[37] = 6'h1c;
      expv[38] = 6'h1c;
      expv[39] = 6'h1c;
      expv[40] = 6'h1c;
      expv[41] = 6'h1c;
      expv[42] = 6'h1c;
      expv[43] = 6'h1c;
      expv[44] = 6'h1c;
      expv[45] = 6'h00;
      expv[46] = 6'h1c;
      expv[47] = 6'h1c;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h1c;
      expv[51] = 6'h1c;
      expv[52] = 6'h1c;
      expv[53] = 6'h1c;
      expv[54] = 6'h00;
      expv[55] = 6'h1c;
      expv[56] = 6'h1c;
      expv[57] = 6'h1c;
      expv[58] = 6'h1c;
      expv[59] = 6'h00;
      expv[60] = 6'h1c;
      expv[61] = 6'h1c;
      expv[62] = 6'h1c;
      expv[63] = 6'h1c;
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
