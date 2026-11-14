// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 203;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032806 dut (
    .clk(clk),
    .i_input(in_vec[202:197]),
    .A_input(in_vec[196:165]),
    .B_input(in_vec[164:133]),
    .C_input(in_vec[132:101]),
    .D_input(in_vec[100:69]),
    .Xk_plus_Ti_input(in_vec[68:37]),
    .s_input(in_vec[36:32]),
    .input_shifter_base(in_vec[31:0]),
    .int_B_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 203'h19cb44cd1b868c865b36178198c74cc8b710bdb6f876424db5e;
    stim[1] = 203'h7d1fd9a7e81f00749ebca9ed12997a37bdb03f65d6813c31547;
    stim[2] = 203'h569de2659e0dec9d4338b17fd634b7a7cc188d4794f8ed73d4c;
    stim[3] = 203'h48a9d28d7b8744e14f726f060b6faa89b520515df64f55f7b15;
    stim[4] = 203'h5918349ab3a7b71075ad191324517fb0e4d2841ee3187a7cf9b;
    stim[5] = 203'h22f8f58c9c182182a3c4dce7371b1d873f0e390867f7d688064;
    stim[6] = 203'h59e6e6e6b092be370e1643a01e82e9b62979728436e134b4113;
    stim[7] = 203'h5b82617ace1844a3f4a09e645a3c04bf276f22331b500d7ed7a;
    stim[8] = 203'h65209862b46eca2e578771b0f05a37c2a154097cec960732f89;
    stim[9] = 203'h322206eb6f15a3e60c481b64d32ddb8a7e9d94a31a49095c114;
    stim[10] = 203'h1c38561243fce56620eb48544a2214d5d519492733829931a66;
    stim[11] = 203'h03f60b70896ebd2d302e584d927f80750039e1dece61ccb6a25;
    stim[12] = 203'h2d7f3e47c9cac01c62f5ec37fcdd82d1a4089e2ef17eed2c9c0;
    stim[13] = 203'h07ae8b199a9bb63bb3c640c14e53295dce3f99691e53c2a28dd;
    stim[14] = 203'h1f9f20bdc0a3bcb43d3306400cd3353ada432630469a5d9155a;
    stim[15] = 203'h321dbadac6ae919f8c184b05de53879149ab92e0ac5059accad;
    stim[16] = 203'h0c67991041dad179eacc4115323f4b29da6375ac7101f0a24f5;
    stim[17] = 203'h1b00634b19e8ab90d2bda0e27ec10a0f43aafe825559ee17117;
    stim[18] = 203'h6a4b0dbf84d4fa0bf8c502bd68745baa75dbb488163b016bce3;
    stim[19] = 203'h617a592a6113f5ad6604b93d7fcc629069b3a6f0d29b108e217;
    stim[20] = 203'h25c21ab42dc09c33755feeca1a6d74626df41579ebf4ae32e19;
    stim[21] = 203'h6b71b8f13e651f87c16695c01ed8055c8f3a595f494902cc51f;
    stim[22] = 203'h758c2fb67df998541343c276049a920746ec8131e4760d5c303;
    stim[23] = 203'h78dae120ae714990d59b9e5207b24048e669b789e19f5844cc3;
    stim[24] = 203'h0ce9f31f780a4a8b34d699460d9f5e236acf33b19545ec7b7c0;
    stim[25] = 203'h43f0cae5c93f02f20851ec3f78c3e3aeb1b6a9fc9de116bfff6;
    stim[26] = 203'h7e75b3202750f827dde9bfaeca5ca72a27c20128030ff708677;
    stim[27] = 203'h2a58d712b7abe4fb9c5046523e7042a084952c3d66dc97d403e;
    stim[28] = 203'h653d567c6a167639bd814b65df44ade4ab3f2996ceaf6229ca8;
    stim[29] = 203'h05fb3c74652771f694138e60a69aa41796e9f52c46a919dcc0e;
    stim[30] = 203'h3120575bfbcceec715c394bbd871aa46243beace90baf03a543;
    stim[31] = 203'h3ee2a4675b2f4722a6f8bbda9d8be68af8e18c7e1da8fa4c9ec;
    stim[32] = 203'h01997bf9e2cacda862d0b9a9ed8cdae5a7b138a598913507d55;
    stim[33] = 203'h0367e1fa15a48e8e82abfb6473fef35bb71ccbeb2c79ca0fbfb;
    stim[34] = 203'h6d0b017fb20aaeb8bf54805e02ff53956978ec721c8de739751;
    stim[35] = 203'h5e74d93aa1d9878293d941de00af8fd88595d568aac972683e2;
    stim[36] = 203'h79afce3d318d2e4eedddb76637e910a3af269ec7d90c07f1c47;
    stim[37] = 203'h53d6561101b10d9e2d035837731d5fcfe2bb953e403b2e4c4d3;
    stim[38] = 203'h1be25ee0ebf256d7d8ce6dcd562da784c3437befb17e3a06886;
    stim[39] = 203'h4b41657f3ffe6e741ceac89fe338aca9dc75b73013eafdffe00;
    stim[40] = 203'h767391ff5ea951d6588059e04d539782fac2abd6d93caad722d;
    stim[41] = 203'h755ce831c4653eab4729ac4aa43afdd1b475694f5d1364f2f17;
    stim[42] = 203'h329f83c9dd1fac701d6d0a8922939cf758232e9309e0fe11032;
    stim[43] = 203'h3d29b65dd437eb1f20e41bf64429756a9e8f8e58a8ad770c003;
    stim[44] = 203'h3e399fedc883d43b46f3eba4c4427032767c9ebc22411586cd4;
    stim[45] = 203'h255eb3de6e5e3868bdf328d21df8329d09f68b6a07060434639;
    stim[46] = 203'h7c8dae94221af4c1159b2c2020ddd1d5588e8ac19a0f7b55cee;
    stim[47] = 203'h4bb439809ec0703f911db60133588f4288db700acbd9a746a2a;
    stim[48] = 203'h507511e345d4b50932307d5f1c10b2423cf9395659e2e491dee;
    stim[49] = 203'h132dbf505a8087004beb29c529319409f79c1d737d320009654;
    stim[50] = 203'h3305033b05b5dbeb0b10a97522a68149c0f93f749c870a276f0;
    stim[51] = 203'h0415b6eba045366dd301fc683c099c05f8a2d776bd4aa0b6e76;
    stim[52] = 203'h64a5a2ba58f630f12590dbf0a74e310937c19e4b409310821cc;
    stim[53] = 203'h0c3a966578224c2cdc989ef87d3c5bcea0135c49f921664ebdd;
    stim[54] = 203'h6033c556eff38908194888a1bccb864520f43b74b833197e204;
    stim[55] = 203'h57c0c75f3466f732321cda7014ba8de2225907c22efce992176;
    stim[56] = 203'h58b7c123ba7d36fa09dc78f2d461878e7092433b09b5653a67c;
    stim[57] = 203'h716db9b88fb20ecd68374f58b3b79a1645403e53f4f59ac0686;
    stim[58] = 203'h01e0a44e7c87ed0b3c3cf7db86bd26dfd9ba3ef3e40009fd4ae;
    stim[59] = 203'h17cb06c4510a9c16c06d7879809bc53055bc574097e7e8bfbbc;
    stim[60] = 203'h2b2a32d3b54568412dbfef2ded4603d0652b4532adc0b8b94ba;
    stim[61] = 203'h4369a93ba2d88338c6814780a973000b14ffbfb98f7896d28c6;
    stim[62] = 203'h3be356e4d692becf63632bb38221c938090d676e917c4bf64a2;
    stim[63] = 203'h25671edd096ae7af19c68a87a043a31cd1ed4d0bf4ecfb13e8d;
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
      expv[0] = 32'h951976b5;
      expv[1] = 32'hb20fff98;
      expv[2] = 32'h83993cb7;
      expv[3] = 32'he8cd43b2;
      expv[4] = 32'h4123cec4;
      expv[5] = 32'h450cdf1a;
      expv[6] = 32'hfae30854;
      expv[7] = 32'h7339b81c;
      expv[8] = 32'h94d46608;
      expv[9] = 32'hb3cd9ba6;
      expv[10] = 32'ha290ab17;
      expv[11] = 32'h98142365;
      expv[12] = 32'h317c405c;
      expv[13] = 32'h50b79e44;
      expv[14] = 32'h9dd72e73;
      expv[15] = 32'h98bde0e3;
      expv[16] = 32'hd45a9921;
      expv[17] = 32'hc04b188e;
      expv[18] = 32'h7179aeb1;
      expv[19] = 32'hcee89118;
      expv[20] = 32'h2281cfdd;
      expv[21] = 32'hf6352fc5;
      expv[22] = 32'hb8e8f1d6;
      expv[23] = 32'ha1cfc2fa;
      expv[24] = 32'h9fffc7b1;
      expv[25] = 32'h4a11c1c8;
      expv[26] = 32'h791b3ceb;
      expv[27] = 32'h5a202eb2;
      expv[28] = 32'h861dd453;
      expv[29] = 32'hffbd5e4b;
      expv[30] = 32'heb210006;
      expv[31] = 32'hce22b1c3;
      expv[32] = 32'hb5f43340;
      expv[33] = 32'hbc95e520;
      expv[34] = 32'h13a2a1d0;
      expv[35] = 32'hadfec718;
      expv[36] = 32'h6580b3d8;
      expv[37] = 32'hdc5da707;
      expv[38] = 32'h74a8dc11;
      expv[39] = 32'h7b9c183c;
      expv[40] = 32'h29c678a3;
      expv[41] = 32'h99a9f487;
      expv[42] = 32'h581e52b1;
      expv[43] = 32'h7c9f08cd;
      expv[44] = 32'h92bd232e;
      expv[45] = 32'hf8650c99;
      expv[46] = 32'hec807133;
      expv[47] = 32'h91875041;
      expv[48] = 32'hd6b32e4e;
      expv[49] = 32'h768d6bdc;
      expv[50] = 32'h5104575e;
      expv[51] = 32'h7741493f;
      expv[52] = 32'he1255c60;
      expv[53] = 32'h4500ea93;
      expv[54] = 32'h978c2033;
      expv[55] = 32'h23d54fb4;
      expv[56] = 32'hfac6b499;
      expv[57] = 32'h097a057a;
      expv[58] = 32'h2fdc16b0;
      expv[59] = 32'hc964f20f;
      expv[60] = 32'h054f4436;
      expv[61] = 32'h9726a7cd;
      expv[62] = 32'h036c41e8;
      expv[63] = 32'ha4797aee;
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
