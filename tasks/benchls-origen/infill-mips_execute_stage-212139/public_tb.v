// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 146;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212139 dut (
    .clk(clk),
    .rst(in_vec[145:145]),
    .DX_PC(in_vec[144:113]),
    .DX_Branch(in_vec[112:112]),
    .DX_MemWrite(in_vec[111:111]),
    .DX_MemToReg(in_vec[110:110]),
    .DX_RegWrite(in_vec[109:109]),
    .lhWrite(in_vec[108:108]),
    .lhRead(in_vec[107:107]),
    .mflo(in_vec[106:106]),
    .ALUSrc(in_vec[105:105]),
    .ALUCtr(in_vec[104:101]),
    .DX_RD(in_vec[100:96]),
    .A(in_vec[95:64]),
    .B(in_vec[63:32]),
    .Imm(in_vec[31:0]),
    .BAddr(out_vec[104:73]),
    .XF_Branch(out_vec[72:72]),
    .XM_MemWrite(out_vec[71:71]),
    .XM_MemToReg(out_vec[70:70]),
    .XM_RegWrite(out_vec[69:69]),
    .XM_RD(out_vec[68:64]),
    .XM_B(out_vec[63:32]),
    .ALUout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 146'h3e582d9316a31d6adaa52cf4cd1e9d3dcfa79;
    stim[1] = 146'h3f52a4c0374a2c35ef90e608ef9ac87f43781;
    stim[2] = 146'h0ea88a3a7ee2aa221f05cdc45f7f5a531807d;
    stim[3] = 146'h18827475df059a0f004d7fde4c5e6c66ebca8;
    stim[4] = 146'h1ed7041d59c427bd00f1032a5fb3397b29290;
    stim[5] = 146'h061fc0d2a3be52453544f9ddaf897dc7b9be6;
    stim[6] = 146'h0a22c6b6291778b155337f87884321820b124;
    stim[7] = 146'h00dfd3be3b2dbcb026bff13d83e22ccd332cd;
    stim[8] = 146'h08ee627e285e35a0cfd24d6359baf00a3defa;
    stim[9] = 146'h159daf3a22d22f78412c75d4440283cdbfb1e;
    stim[10] = 146'h1e4198de23cdcc7f24ead72fe489f71adabb5;
    stim[11] = 146'h1845cbaf8bf7d886aa29680c7c86770607be8;
    stim[12] = 146'h097bd9413f09dffad5d08b31b46d51b2979bd;
    stim[13] = 146'h0d5d60101f562224c5827954a1e6fb8955114;
    stim[14] = 146'h114d52fa53077d896ed315dc26e6ef41d7c21;
    stim[15] = 146'h0982e4c28b9ff2ac6a657c758ba69a66a9d5b;
    stim[16] = 146'h049515c0aee9e599cbe463dbcba95962a806e;
    stim[17] = 146'h0d7fa44450bc25d57d8142e9f6a3f94948fb8;
    stim[18] = 146'h1e21c70f410880af7e20112261c82feef956f;
    stim[19] = 146'h129f5bfaff403d7a0aecb9eab7177e80f50c6;
    stim[20] = 146'h14c8f96370f547282e002f843fbfca93d73ee;
    stim[21] = 146'h11c9bbe9c1b7b6dce1d6c33abda6a492dc711;
    stim[22] = 146'h13f5c54ad864517e9143b1d1e2053673665c5;
    stim[23] = 146'h0e81de781fd4818b46b0d9d0e89969f1fafd9;
    stim[24] = 146'h059633a3f6522e8cc6a209b55251b7ec76c5e;
    stim[25] = 146'h15d85642c2ebea5a861e87292bc6219f253c9;
    stim[26] = 146'h1a661bfd1c9f4a1a86301f9afb9d8f3ea79c7;
    stim[27] = 146'h165f84807be998a80b932e1fa1b579eb9ab6b;
    stim[28] = 146'h072df8611ca4597f19b6c9bd8b88f18300724;
    stim[29] = 146'h0ea624f32ef7430b8ec0f11fbf8c0fa84b7a9;
    stim[30] = 146'h1c886497f0f838e391c8bfed97588f52b7ec7;
    stim[31] = 146'h016ab75097647f97510b9561173e12f0b0083;
    stim[32] = 146'h0afede54c288dc43bda6edd6d2167955b31f2;
    stim[33] = 146'h19c13d1431fa43e6103ed18ea35e1f1755bfe;
    stim[34] = 146'h1483c78cc46ae37390855375be1afe88cc9a4;
    stim[35] = 146'h10b478fab0514e48b71a8311d32435698371c;
    stim[36] = 146'h02ce3d9fc7e4dbedec7eaf38ecc0871704819;
    stim[37] = 146'h05212437abf130ceaf9c4060c86699e2ad4fa;
    stim[38] = 146'h0d154ad4a4760070069759208d345c9e4a106;
    stim[39] = 146'h08e3424f391a17d2d61a9b2201dfde58d7483;
    stim[40] = 146'h148d3a89f14e54eb3388893a62befe3e9651e;
    stim[41] = 146'h185773d6064594ceea534732ca4ac6141ed8d;
    stim[42] = 146'h1242be0f1ea7e25455cb1416904a3ffd501fb;
    stim[43] = 146'h173b2e2e7a87906ad841d93ef8ec403a238c5;
    stim[44] = 146'h18d91deb15829f355d954595bcacc32dad5a1;
    stim[45] = 146'h17c40db2623f03c18d3114732e2779d026011;
    stim[46] = 146'h1cda7f502e6d6eb234b433e5d393d0a462d88;
    stim[47] = 146'h1a840c97df92d33645c35d7f859d152e7e31a;
    stim[48] = 146'h18da9a992fab052659088f8dd201aaab81900;
    stim[49] = 146'h10ea811ebad154a92e17e74c4c0d5d0fb9f66;
    stim[50] = 146'h0a9713aa33a37b9a7f46fa37aa443e5f89133;
    stim[51] = 146'h095754d5583a7d60290873da77d8b2674bb76;
    stim[52] = 146'h0152834136e9a4b2616fc155c85c1d5a35538;
    stim[53] = 146'h0a315f3f960d43d35233652343e25ea2ce99b;
    stim[54] = 146'h09f945e0be9247a5336ff1baa2bcbe2286943;
    stim[55] = 146'h1675b28b5c11841068265af099f76fe1b437e;
    stim[56] = 146'h1d252ccca48f447fe4ff658b6a66ef64ca6cb;
    stim[57] = 146'h003161aa0da503c573bb27020f5b1a13be73d;
    stim[58] = 146'h1942423b8bd343c5cd891ddca3ae1c42e5c49;
    stim[59] = 146'h01b8bdc45eb360ca77a5b73281d934eb614d8;
    stim[60] = 146'h1020535dce64c93a87e46b7ffbf2327260c93;
    stim[61] = 146'h05bfca093fbeba3cbbc9dc86f6b33ecc3cd1a;
    stim[62] = 146'h02d7ec159a8a0e1e9c0cf2987e81a9ccc5458;
    stim[63] = 146'h1a0076f97c1d33b7bf823fc430a640f604183;
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
      expv[0] = 105'h0846aacf871cf4cd1e9xxxxxxxx;
      expv[1] = 105'h034cc080a62608ef9ac00000000;
      expv[2] = 105'h01414a78eeadc45f7f5xxxxxxxx;
      expv[3] = 105'h1bb9d2c9cf9fde4c5e6xxxxxxxx;
      expv[4] = 105'h0ab04d6548232a5fb33axxx0xxx;
      expv[5] = 105'h145d8ec5a259ddaf897xxxxxbxx;
      expv[6] = 105'h16331f48297f878843200000000;
      expv[7] = 105'h07496d24abb13d83e22xxxxxxxx;
      expv[8] = 105'h094051fb283d6359baf00000000;
      expv[9] = 105'h140bacc92225d444028xx0xxxxx;
      expv[10] = 105'h17186eb8a3c72fe489fxxxxxxxx;
      expv[11] = 105'h107609a38bd80c7c867xxxxxxxx;
      expv[12] = 105'h1710961fafdb31b46d500000000;
      expv[13] = 105'h09a8089a0e2954a1e6f00000000;
      expv[14] = 105'h0b5c110ac375dc26e6e00000000;
      expv[15] = 105'h1cb833700bfc758ba69xxxxxxxx;
      expv[16] = 105'h0faa55f7afe3dbcba95xxxxxxxx;
      expv[17] = 105'h17c9ec204022e9f6a3fxxxxxxxx;
      expv[18] = 105'h1d9991c6c0812261c8200000000;
      expv[19] = 105'h06a7045dee39eab7177xxx0x0xx;
      expv[20] = 105'h0967b35a614f843fbfcxxxxxxxx;
      expv[21] = 105'h16609f7241b33abda6axxxxxxxx;
      expv[22] = 105'h0790f82d4851d1e2053xxxxxxxx;
      expv[23] = 105'h1e11b6648e89d0e8996xxxxxxxx;
      expv[24] = 105'h04f9e9d2e629b55251b00000000;
      expv[25] = 105'h02d1802743e7292bc621xxxxxxx;
      expv[26] = 105'h145b58e08d4f9afb9d8xx0xxxxx;
      expv[27] = 105'h05bc5a35eb9e1fa1b57xxbxxbxx;
      expv[28] = 105'h1345fbf30c59bd8b88fxxxxxxxx;
      expv[29] = 105'h0be880c7af411fbf8c0xa8xbxxx;
      expv[30] = 105'h171e23fb603fed97588xxxxxxxx;
      expv[31] = 105'h18f03792067561173e1xx0x00xx;
      expv[32] = 105'h15ac774dc2ddd6d2167xxxxxxxx;
      expv[33] = 105'h127beb1320418ea35e1fx75xxxx;
      expv[34] = 105'h08ca2c5ec4e375be1afxxxxxxxx;
      expv[35] = 105'h1c009488a14311d324300000000;
      expv[36] = 105'h1b8661ac46df38ecc08xxxxxxxx;
      expv[37] = 105'h14368eb4ab3060c8669xexxxxxa;
      expv[38] = 105'h12079b57a409208d345xxxxxx0x;
      expv[39] = 105'h1ba9fc90a81b2201dfd00000000;
      expv[40] = 105'h0681ed18e0593a62bef0000000x;
      expv[41] = 105'h08f86a9c879732ca4acx0xxxxx0;
      expv[42] = 105'h122d3f0c8fe416904a3xxxxxxxx;
      expv[43] = 105'h190c4a90eb993ef8ec4xxxxxxxx;
      expv[44] = 105'h124688bb849595bcaccxxxxxbxx;
      expv[45] = 105'h06453dbae304732e277xx0xx0xx;
      expv[46] = 105'h01fd96142f63e5d393d0xxxxxxx;
      expv[47] = 105'h03f7fe24cedd7f859d1xxxxxxxx;
      expv[48] = 105'h0e36a7192f0f8dd201axxx8x9xx;
      expv[49] = 105'h196850d1ab574c4c0d5xxxxx0xx;
      expv[50] = 105'h1d935c43a37a37aa443xxxxxxxx;
      expv[51] = 105'h1c91b2904873da77d8bxxxxxxxx;
      expv[52] = 105'h0c242ddd27a155c85c1xxaxxxxx;
      expv[53] = 105'h1f47d40d07452343e25xx00xxxx;
      expv[54] = 105'h1b0d7a822e41baa2bcbxxxxxxxx;
      expv[55] = 105'h1583544a4d8af099f7600000000;
      expv[56] = 105'h184b803225458b6a66exxxxxxxx;
      expv[57] = 105'h10cf55488d07020f5b1axxxxxxx;
      expv[58] = 105'h1b5970600b4ddca3ae1xxxxxxxx;
      expv[59] = 105'h0913c8304f673281d93xxxxxxxx;
      expv[60] = 105'h03b359a74ecb7ffbf23xxxx0xxx;
      expv[61] = 105'h1c21b0962ebc86f6b33xxcxxxxx;
      expv[62] = 105'h113e16418a02987e81axxxxxxxx;
      expv[63] = 105'h01b097baed3fc430a6400000000;
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
