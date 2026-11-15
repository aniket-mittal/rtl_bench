// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  L_add dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .overflow(out_vec[32:32]),
    .sum(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h58ae3478eaa50ef7;
    stim[1] = 64'h5c46da23ee3d3dbe;
    stim[2] = 64'h379b86769c6ac64e;
    stim[3] = 64'hcea276d0d6f5daf6;
    stim[4] = 64'hadd2e4dae42ae003;
    stim[5] = 64'hd81b827a1f3980e6;
    stim[6] = 64'h60193998f69df611;
    stim[7] = 64'hf512420e5e75364f;
    stim[8] = 64'h75ed58ff48b7e8bb;
    stim[9] = 64'h51994e2e45175893;
    stim[10] = 64'h48197330a822c58c;
    stim[11] = 64'h55d2dd06b8f8718f;
    stim[12] = 64'hc962488320739901;
    stim[13] = 64'h43b15578f5ea20c5;
    stim[14] = 64'h3bc2faf77a90b139;
    stim[15] = 64'h336ef6f4f7c12f62;
    stim[16] = 64'hf5df2cadb5bbedba;
    stim[17] = 64'h771789579d428be3;
    stim[18] = 64'h3c9c79c84d4bde57;
    stim[19] = 64'h22b0e238f6b5ab3c;
    stim[20] = 64'h1219c1c561ece483;
    stim[21] = 64'h96affa0787a23e61;
    stim[22] = 64'h21ebf3cbfaa965cf;
    stim[23] = 64'h83e7833b126979d2;
    stim[24] = 64'h475504870e920de2;
    stim[25] = 64'h3702583c6fa859a6;
    stim[26] = 64'h59ee8fa99c578fa9;
    stim[27] = 64'h3868656a0bd60d5c;
    stim[28] = 64'h53642c4b53fdd87d;
    stim[29] = 64'h1d19f336f18b79b0;
    stim[30] = 64'h999bcba3f580ec21;
    stim[31] = 64'h47332d7c39a62480;
    stim[32] = 64'h197a4941f593bc15;
    stim[33] = 64'h34be0d729b81e366;
    stim[34] = 64'hf7d531a8a51d5e8f;
    stim[35] = 64'hedd6d643aebb594f;
    stim[36] = 64'h10a46c7a63fda8cc;
    stim[37] = 64'hc028932c84c38885;
    stim[38] = 64'hc715c850723df4e1;
    stim[39] = 64'hfb58779c0c4dc0b4;
    stim[40] = 64'h64294761c2a7462a;
    stim[41] = 64'h11517ee841303d92;
    stim[42] = 64'ha909d46660976fdf;
    stim[43] = 64'h0283e4446b728c5e;
    stim[44] = 64'hbd336c1b062b1b57;
    stim[45] = 64'h53e9aebba0bce08b;
    stim[46] = 64'h8ed50c73a3e9728b;
    stim[47] = 64'he420a98decd8c92c;
    stim[48] = 64'h934f757e515524c8;
    stim[49] = 64'hde72b84899997ea1;
    stim[50] = 64'hfb90d5c0c2cb81e9;
    stim[51] = 64'hd7de16dfb002d79e;
    stim[52] = 64'hf1280df10109926c;
    stim[53] = 64'h125a64c942115923;
    stim[54] = 64'h8eb3335881833988;
    stim[55] = 64'h4c7da6e2343aec8c;
    stim[56] = 64'h3d5bfdf41524cd54;
    stim[57] = 64'h7b5a54e3991d9e4d;
    stim[58] = 64'h9eeeeeaa54d06b84;
    stim[59] = 64'h94dc78ee9a9b169b;
    stim[60] = 64'h3a73cf1e161d8bbb;
    stim[61] = 64'h991ab48ee70c325a;
    stim[62] = 64'h20843397ab5e804d;
    stim[63] = 64'h38a9ab737e2d5f76;
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
      expv[0] = 33'h14353436f;
      expv[1] = 33'h14a8417e1;
      expv[2] = 33'h0d4064cc4;
      expv[3] = 33'h1a59851c6;
      expv[4] = 33'h191fdc4dd;
      expv[5] = 33'h0f7550360;
      expv[6] = 33'h156b72fa9;
      expv[7] = 33'h15387785d;
      expv[8] = 33'h0bea541ba;
      expv[9] = 33'h096b0a6c1;
      expv[10] = 33'h0f03c38bc;
      expv[11] = 33'h10ecb4e95;
      expv[12] = 33'h0e9d5e184;
      expv[13] = 33'h1399b763d;
      expv[14] = 33'h0b653ac30;
      expv[15] = 33'h12b302656;
      expv[16] = 33'h1ab9b1a67;
      expv[17] = 33'h1145a153a;
      expv[18] = 33'h089e8581f;
      expv[19] = 33'h119668d74;
      expv[20] = 33'h07406a648;
      expv[21] = 33'h11e523868;
      expv[22] = 33'h11c95599a;
      expv[23] = 33'h09650fd0d;
      expv[24] = 33'h055e71269;
      expv[25] = 33'h0a6aab1e2;
      expv[26] = 33'h0f6461f52;
      expv[27] = 33'h0443e72c6;
      expv[28] = 33'h0a76204c8;
      expv[29] = 33'h10ea56ce6;
      expv[30] = 33'h18f1cb7c4;
      expv[31] = 33'h080d951fc;
      expv[32] = 33'h10f0e0556;
      expv[33] = 33'h0d03ff0d8;
      expv[34] = 33'h19cf29037;
      expv[35] = 33'h19c922f92;
      expv[36] = 33'h074a21546;
      expv[37] = 33'h144ec1bb1;
      expv[38] = 33'h13953bd31;
      expv[39] = 33'h107a63850;
      expv[40] = 33'h126d08d8b;
      expv[41] = 33'h05281bc7a;
      expv[42] = 33'h109a14445;
      expv[43] = 33'h06df670a2;
      expv[44] = 33'h0c35e8772;
      expv[45] = 33'h0f4a68f46;
      expv[46] = 33'h132be7efe;
      expv[47] = 33'h1d0f972b9;
      expv[48] = 33'h0e4a49a46;
      expv[49] = 33'h1780c36e9;
      expv[50] = 33'h1be5c57a9;
      expv[51] = 33'h187e0ee7d;
      expv[52] = 33'h0f231a05d;
      expv[53] = 33'h0546bbdec;
      expv[54] = 33'h110366ce0;
      expv[55] = 33'h080b8936e;
      expv[56] = 33'h05280cb48;
      expv[57] = 33'h11477f330;
      expv[58] = 33'h0f3bf5a2e;
      expv[59] = 33'h12f778f89;
      expv[60] = 33'h050915ad9;
      expv[61] = 33'h18026e6e8;
      expv[62] = 33'h0cbe2b3e4;
      expv[63] = 33'h0b6d70ae9;
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
