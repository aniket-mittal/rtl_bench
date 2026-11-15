// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02083 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[79:79]),
    .iIF_SELECT(in_vec[78:78]),
    .iDEBUG_UART_RXD(in_vec[77:77]),
    .iDEBUG_PARA_REQ(in_vec[76:76]),
    .iDEBUG_PARA_CMD(in_vec[75:68]),
    .iDEBUG_PARA_DATA(in_vec[67:36]),
    .iDEBUG_PARA_BUSY(in_vec[35:35]),
    .iDEBUG_COM_BUSY(in_vec[34:34]),
    .iDEBUG_COM_VALID(in_vec[33:33]),
    .iDEBUG_COM_ERROR(in_vec[32:32]),
    .iDEBUG_COM_DATA(in_vec[31:0]),
    .oDEBUG_UART_TXD(out_vec[77:77]),
    .oDEBUG_PARA_BUSY(out_vec[76:76]),
    .oDEBUG_PARA_VALID(out_vec[75:75]),
    .oDEBUG_PARA_ERROR(out_vec[74:74]),
    .oDEBUG_PARA_DATA(out_vec[73:42]),
    .oDEBUG_COM_REQ(out_vec[41:41]),
    .oDEBUG_COM_CMD(out_vec[40:33]),
    .oDEBUG_COM_DATA(out_vec[32:1]),
    .oDEBUG_COM_BUSY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h96d9d569b5789e2acd75;
    stim[1] = 80'hbdfcce435c21542e44ec;
    stim[2] = 80'h52091053bfaa8625c81e;
    stim[3] = 80'h12e801bc7d6f6f570079;
    stim[4] = 80'h668a98f4bb477d9236ba;
    stim[5] = 80'h7167451934e17ac5c33d;
    stim[6] = 80'h5e1fe00334f595771c0a;
    stim[7] = 80'h7c29a94089ca0a2f1705;
    stim[8] = 80'h26e021c3aed0be64e986;
    stim[9] = 80'h6968e080dd0e9fedeca6;
    stim[10] = 80'h07e79aac7f166562ca06;
    stim[11] = 80'h76276072d724f5621893;
    stim[12] = 80'h385e933bae8a2031590c;
    stim[13] = 80'h53a50f4a62e361cc33e0;
    stim[14] = 80'h156c3f843574175a5243;
    stim[15] = 80'h79ddc8b56b97627da6aa;
    stim[16] = 80'h36591644f3d72c3802a1;
    stim[17] = 80'h5a4e4ba50f296d6f1091;
    stim[18] = 80'h5fe08ff0aec189763c92;
    stim[19] = 80'h0e2e7c048292c6b17e2f;
    stim[20] = 80'h2c81b7e8c8cbf4a6a9c7;
    stim[21] = 80'h7416314bdc9cd63f1482;
    stim[22] = 80'h34c68158ff30ce79bf49;
    stim[23] = 80'h149a19eeae0d63721f0c;
    stim[24] = 80'h35f0dbee9826bf18087d;
    stim[25] = 80'h44f28d29941e9bf76cbf;
    stim[26] = 80'h067231068acd0773a28d;
    stim[27] = 80'h6747f3906a3223e32ff4;
    stim[28] = 80'h6f476b0da15ce7e43c43;
    stim[29] = 80'h37d8b33012cfe0bfc3df;
    stim[30] = 80'h0b0c62e99c235979cf9a;
    stim[31] = 80'h19efe099fbe3609eef80;
    stim[32] = 80'h30a82ffd06ee490fdb5c;
    stim[33] = 80'h78610a87a6d7da82c275;
    stim[34] = 80'h0706a78e44884cd96be6;
    stim[35] = 80'h7afdb8f2293c1ae27fb1;
    stim[36] = 80'h2615e6da6da84d05b8da;
    stim[37] = 80'h7d203ab3ff7f995df284;
    stim[38] = 80'h7398de314ef3d0a43976;
    stim[39] = 80'h5334d50d45fcb29e0607;
    stim[40] = 80'h2434467e0fa39e4cec6e;
    stim[41] = 80'h679ccb20977ca93f4cfc;
    stim[42] = 80'h7d3d922b4bfac9875a1d;
    stim[43] = 80'h4ec31692f4482c5fe1d6;
    stim[44] = 80'h781ac164ab7a44cb7438;
    stim[45] = 80'h4501de94d1082222dbe5;
    stim[46] = 80'h76d4d11ef64b7980605b;
    stim[47] = 80'h22c8c4bdbd69f3a41600;
    stim[48] = 80'h5cea488b3807e98746a0;
    stim[49] = 80'h4dda14f6f780674aa7ec;
    stim[50] = 80'h4702f6ba6d44739f7930;
    stim[51] = 80'h714c560e6a43efaa776a;
    stim[52] = 80'h5ce07aaf585b598a64cc;
    stim[53] = 80'h73e450bec2568161c386;
    stim[54] = 80'h1dabe1929d7fa8b8221a;
    stim[55] = 80'h3c00a7e74cfe72860f25;
    stim[56] = 80'h136ffd8cc545e957e150;
    stim[57] = 80'h76def29094bfb06bfbfa;
    stim[58] = 80'h250fc650c28a80ff3895;
    stim[59] = 80'h6440be64f2f652e8be66;
    stim[60] = 80'h0b0a51aee6c044c0fc81;
    stim[61] = 80'h365440411b00e7d9ae09;
    stim[62] = 80'h151ff878fcef4d797dcd;
    stim[63] = 80'h4c068f6a958dc95c521d;
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
      expv[0] = 78'h2000000002db3aad36af;
      expv[1] = 78'h2000000003bf99c86b84;
      expv[2] = 78'h2a1897207a41220a77f5;
      expv[3] = 78'h20000000025d00378fad;
      expv[4] = 78'h3df648dae8d1531e9768;
      expv[5] = 78'h25eb170cf62ce8a3269c;
      expv[6] = 78'h3655dc702bc3fc00669e;
      expv[7] = 78'h2828bc5c178535281139;
      expv[8] = 78'h2000000000dc043875da;
      expv[9] = 78'h3a7fb7b2992d1c101ba1;
      expv[10] = 78'h2000000000fcf3558fe2;
      expv[11] = 78'h33d588624ec4ec0e5ae4;
      expv[12] = 78'h20000000030bd26775d1;
      expv[13] = 78'h2d8730cf8274a1e94c5c;
      expv[14] = 78'h2000000002ad87f086ae;
      expv[15] = 78'h3d89f69aab3bb916ad72;
      expv[16] = 78'h2000000002cb22c89e7a;
      expv[17] = 78'h25b5bc424749c974a1e5;
      expv[18] = 78'h2625d8f24bfc11fe15d8;
      expv[19] = 78'h2000000001c5cf809052;
      expv[20] = 78'h20000000019036fd1919;
      expv[21] = 78'h3358fc520a82c6297b93;
      expv[22] = 78'h200000000298d02b1fe6;
      expv[23] = 78'h200000000293433dd5c1;
      expv[24] = 78'h2000000002be1b7dd304;
      expv[25] = 78'h3a6fddb2fc9e51a53283;
      expv[26] = 78'h2000000000ce4620d159;
      expv[27] = 78'h288f8cbfd0e8fe720d46;
      expv[28] = 78'h339f90f10de8ed61b42b;
      expv[29] = 78'h2000000002fb16660259;
      expv[30] = 78'h2000000001618c5d3384;
      expv[31] = 78'h20000000033dfc133f7c;
      expv[32] = 78'h20000000021505ffa0dd;
      expv[33] = 78'h3f6a0b09d70c2150f4da;
      expv[34] = 78'h2000000000e0d4f1c891;
      expv[35] = 78'h306b89fec75fb71e4527;
      expv[36] = 78'h2000000000c2bcdb4db5;
      expv[37] = 78'h3e6577ca13a407567fef;
      expv[38] = 78'h2f4290e5da731bc629de;
      expv[39] = 78'h32ca78181e669aa1a8bf;
      expv[40] = 78'h20000000008688cfc1f4;
      expv[41] = 78'h32a4fd33f0f3996412ef;
      expv[42] = 78'h2b261d6877a7b245697f;
      expv[43] = 78'h20b17f8759d862d25e89;
      expv[44] = 78'h29132dd0e303582c956f;
      expv[45] = 78'h20888b6f94a03bd29a21;
      expv[46] = 78'h2de601816eda9a23dec9;
      expv[47] = 78'h2000000000591897b7ad;
      expv[48] = 78'h3fa61d1a839d49116700;
      expv[49] = 78'h219d2a9fb1bb429edef0;
      expv[50] = 78'h31ce7de4c0e05ed74da8;
      expv[51] = 78'h2fbea9ddaa298ac1cd48;
      expv[52] = 78'h2d662993339c0f55eb0b;
      expv[53] = 78'h3a05870e1a7c8a17d84a;
      expv[54] = 78'h2000000003b57c3253af;
      expv[55] = 78'h20000000038014fce99f;
      expv[56] = 78'h20000000026dffb198a8;
      expv[57] = 78'h3ec1afefeadbde521297;
      expv[58] = 78'h2000000000a1f8ca1851;
      expv[59] = 78'h394ba2f9988817cc9e5e;
      expv[60] = 78'h2000000001614a35dcd8;
      expv[61] = 78'h2000000002ca88082360;
      expv[62] = 78'h2000000002a3ff0f1f9d;
      expv[63] = 78'h372571487580d1ed52b1;
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
