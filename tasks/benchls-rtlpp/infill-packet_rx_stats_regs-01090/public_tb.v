// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01090 dut (
    .clk(clk),
    .reset(in_vec[80:80]),
    .address(in_vec[79:77]),
    .write(in_vec[76:76]),
    .read(in_vec[75:75]),
    .writedata(in_vec[74:43]),
    .rx_data(in_vec[42:11]),
    .rx_dval(in_vec[10:10]),
    .rx_sop(in_vec[9:9]),
    .rx_eop(in_vec[8:8]),
    .rx_mod(in_vec[7:6]),
    .rx_err(in_vec[5:0]),
    .readdata(out_vec[32:1]),
    .rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h153a5bc041c14f9ec3a06;
    stim[1] = 81'h134f831e6c5ec80534d1c;
    stim[2] = 81'h0888934ef767d8837a4f2;
    stim[3] = 81'h0475eb7e0c375a5e85a6f;
    stim[4] = 81'h061a8ccffefddb155204e;
    stim[5] = 81'h00cfb4a0513a300919b69;
    stim[6] = 81'h01042250f56ce25f721e2;
    stim[7] = 81'h0ed215435c6b81596ac02;
    stim[8] = 81'h07698eb7bdc8fc2eb8ad8;
    stim[9] = 81'h0ff1a419684b19f010bb6;
    stim[10] = 81'h057e7d63359277e9aca9e;
    stim[11] = 81'h0a7aa85393e9d4828235c;
    stim[12] = 81'h0e05458b52df16ddaec33;
    stim[13] = 81'h056019f2aeae14ea86527;
    stim[14] = 81'h05c4911d37e608f6f2058;
    stim[15] = 81'h0f5a9c92c98a51a4ec8d1;
    stim[16] = 81'h0d8c234d2ce1bd4b98928;
    stim[17] = 81'h01c092016fcb579c2ac70;
    stim[18] = 81'h039d94b434ddf610c6693;
    stim[19] = 81'h04b5d5b4d971eec04bc3d;
    stim[20] = 81'h0d052ed8046aeea344f43;
    stim[21] = 81'h066ebc20737caaa2ef444;
    stim[22] = 81'h0b8077d278c363e066949;
    stim[23] = 81'h087d9e05a06497af1590f;
    stim[24] = 81'h0aa2c8db1e56538acfcc8;
    stim[25] = 81'h19a1deb0f3e3a60eda24b;
    stim[26] = 81'h032fce6bee03cacc33ef7;
    stim[27] = 81'h05ac0646c806f4564337c;
    stim[28] = 81'h01cc3fdc31f4a5e0e92bd;
    stim[29] = 81'h01fdbd8d64dcc82c9935a;
    stim[30] = 81'h03fe7885e5b8d91e64e2c;
    stim[31] = 81'h0d8e3b639eb91ce053440;
    stim[32] = 81'h014eef051b35e1a99902c;
    stim[33] = 81'h01e0b7c6159ded95b32da;
    stim[34] = 81'h0f4c1814fc30e9d500e88;
    stim[35] = 81'h095d2f185ea35d341206b;
    stim[36] = 81'h04dedda8cf071d8825d67;
    stim[37] = 81'h04984254ef2bd66bf3070;
    stim[38] = 81'h0e29d713214acb8ce9cf8;
    stim[39] = 81'h0964aea2531e12107d9b1;
    stim[40] = 81'h05e82a44eaa93a93c6737;
    stim[41] = 81'h0315a07a0719212986d7d;
    stim[42] = 81'h0f3017b816b680e8a161e;
    stim[43] = 81'h0f45837399a2a52d3bbf7;
    stim[44] = 81'h097b298f719a653e308bf;
    stim[45] = 81'h04f258cce4453744dd21d;
    stim[46] = 81'h0574cc180b33f7a9881da;
    stim[47] = 81'h09711f66f973da12a83b1;
    stim[48] = 81'h0c2070b3d3cacc85cc440;
    stim[49] = 81'h0ae9a1607ec5a44e2a6dc;
    stim[50] = 81'h0cc5503b17d4d47600fa7;
    stim[51] = 81'h0bb7e9a0cd732681979bb;
    stim[52] = 81'h1e457e322ce48487b0748;
    stim[53] = 81'h0cd64e9feea97341275cd;
    stim[54] = 81'h0f24375a8e99210aba98f;
    stim[55] = 81'h030e53ddbb4b301a34f47;
    stim[56] = 81'h0c2f381d5e6e516ce86a6;
    stim[57] = 81'h01f1b55f38028e6725a50;
    stim[58] = 81'h076960ad245d46f4a4ee4;
    stim[59] = 81'h0ef2eb7cf3c516c87dc66;
    stim[60] = 81'h1116316e45a729f582ca7;
    stim[61] = 81'h01a2c0b87a52bc1bdf0ea;
    stim[62] = 81'h0e6ce7c473b8f134f5f23;
    stim[63] = 81'h09687c38a9d125488d1d7;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000449;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000449;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h0108943d5;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000009;
      expv[23] = 33'h000000001;
      expv[24] = 33'h00000000d;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h130ff70c7;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000001;
      expv[33] = 33'h13bbc146d;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000001;
      expv[39] = 33'h000000001;
      expv[40] = 33'h000000001;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000001;
      expv[51] = 33'h000000005;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h0000001a9;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000001;
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
