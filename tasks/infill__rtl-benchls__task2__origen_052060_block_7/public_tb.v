// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 124;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052060 dut (
    .RegWrite_EX_MEM(in_vec[123:123]),
    .RegWrite_MEM_WB(in_vec[122:122]),
    .RegWrite_ID_EX(in_vec[121:121]),
    .RS_ID_EX(in_vec[120:116]),
    .RT_ID_EX(in_vec[115:111]),
    .RS_IF_ID(in_vec[110:106]),
    .RegRd_MEM_WB(in_vec[105:101]),
    .PCSrc(in_vec[100:99]),
    .ID_EX_RegDst(in_vec[98:98]),
    .MEM_WB_RegDst(in_vec[97:97]),
    .EX_MEM_RegDst(in_vec[96:96]),
    .instruction_ID_EX(in_vec[95:64]),
    .instruction_EX_MEM(in_vec[63:32]),
    .instruction_MEM_WB(in_vec[31:0]),
    .ForwardA(out_vec[5:4]),
    .ForwardB(out_vec[3:2]),
    .ForwardJR(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 124'hcad0c8f9fdffb151418be08ea05b347;
    stim[1] = 124'h0fd81640f54f529e28c87f41716ab14;
    stim[2] = 124'ha9cfad63a9e921d86eae782bf4744a0;
    stim[3] = 124'h700ee0db7471833ea95b6d8068ed99a;
    stim[4] = 124'hf144a179f04d49661ced42c5ab27d92;
    stim[5] = 124'h55d1245d273300c12a4bc1f2788afb4;
    stim[6] = 124'h8e9363327132b94d634bd9518310d75;
    stim[7] = 124'hff8eda2a36d6b2a991d3df78a1d9352;
    stim[8] = 124'h5d85531e09977b3a699c52717d88090;
    stim[9] = 124'hfb69d818df2ffb1230ea81889d58ed7;
    stim[10] = 124'h327ec54331d36d978171706a0f00729;
    stim[11] = 124'h5f983747f83bac2d1204901cc9f8d60;
    stim[12] = 124'hbfc974a2e31b4c24f9fd9fb3c2c17a9;
    stim[13] = 124'hbc028a86f1ae345442191e9240989c1;
    stim[14] = 124'hc2a794336fd5906a93ee1fc45b0265e;
    stim[15] = 124'h674ecf4efac143fa6d4f6e3744f8e58;
    stim[16] = 124'h5156da91f6505fa47150564d3c9ae5c;
    stim[17] = 124'h8808955e252a7aed683eec44e8a4073;
    stim[18] = 124'h9795595d47676db7e532ac50864c18c;
    stim[19] = 124'hb4987408d1a9f98ad2c127a80ee5f34;
    stim[20] = 124'h66abaa4c444b73b2a79b15c9e4a8fed;
    stim[21] = 124'hf1f8ebb59c87a12ff3b39ef0e40217a;
    stim[22] = 124'hf420ddf4f0398b92ff3a4b2b87131d7;
    stim[23] = 124'hfcc99c54111967db0fb9a4d91f9beca;
    stim[24] = 124'h3d69976b60e195d6d6c37d10acba7b5;
    stim[25] = 124'h255aaf3b00ba9853006805a29c114a3;
    stim[26] = 124'h98d4178b6552ab3fe0b952a7a565f10;
    stim[27] = 124'hd83744899dd358d070edc3e159e5422;
    stim[28] = 124'h86b05b242f82dc7064df6e7f05470e4;
    stim[29] = 124'he7ec86e37f74cd0102dd800fede3181;
    stim[30] = 124'h1c667bc7e533e6b9030be90df6e9b27;
    stim[31] = 124'he23365bda2b80408ffbc9bb42186324;
    stim[32] = 124'hc674e0a24441d8cbe10cabd1c5f4d3f;
    stim[33] = 124'hbc24216febf8812904fe71fbc70b981;
    stim[34] = 124'h7bf1b63ea72efc010aaa7be426b225b;
    stim[35] = 124'he367b6743298d8577c12ddaea199771;
    stim[36] = 124'hcf8873f572cb28672134d9f9751c281;
    stim[37] = 124'ha8957e13e348b37f2a3dbdd93d20b90;
    stim[38] = 124'h050318540accf0b3bcf075f04d6a0c1;
    stim[39] = 124'hfcd9f7817fc8efb106b4c21e3ca7389;
    stim[40] = 124'hcc7b8a2978d1922110dc41858ea4141;
    stim[41] = 124'h7684a4d4b38ff5d4ff0b288354259e6;
    stim[42] = 124'h0a8140fa1ea365b98b047be5064e944;
    stim[43] = 124'ha03a6e3de26ea8c5a426217b46923d1;
    stim[44] = 124'h1ed80504f08b46489d7693b4e1b0b48;
    stim[45] = 124'hd4bedc4c5daf3567481ff8746785337;
    stim[46] = 124'hb7c571cbc90d60f525076f41d936ced;
    stim[47] = 124'h4344b57f17fcfce96d2d0882bf8d219;
    stim[48] = 124'h562e98cad7875f208e4c29a0196a0be;
    stim[49] = 124'h83f67229ec545e22c314796261231a0;
    stim[50] = 124'h245dc3dfc7b376f17e2433fb8f69e48;
    stim[51] = 124'hb6fece060e89b1e3750361f58a228e0;
    stim[52] = 124'h08f3035170ab88e443952d7e2f43912;
    stim[53] = 124'h5bab83217efbdc2e83d021977c3b064;
    stim[54] = 124'h3ae287bebd69ff7102a6e52ebc77af6;
    stim[55] = 124'hb9628c3a88ea2666a913ebfc7265b13;
    stim[56] = 124'h1e5ea11697907c6ba8b68e76561d78e;
    stim[57] = 124'h1ca7ff308dd70a59000a133587a5992;
    stim[58] = 124'h2cb1d74cd5a40cadc9065067eb900a4;
    stim[59] = 124'hab8ee27a8cea9fa026d1377d20caa2e;
    stim[60] = 124'hd0f79df6d2d11d39826634587028593;
    stim[61] = 124'h0d594cb6d7dce5cefeacf331deb1ab0;
    stim[62] = 124'h83bebdd1b72bd3e24b7bc873abcd7b2;
    stim[63] = 124'h6fdc54b425a6aa8fc16f28be5583ea6;
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
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h10;
      expv[12] = 6'h20;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h20;
      expv[23] = 6'h04;
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
      expv[48] = 6'h10;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h10;
      expv[61] = 6'h00;
      expv[62] = 6'h08;
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
